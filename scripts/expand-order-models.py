"""Generate the complete K-order and FT-order logical models from freshly compiled FSH.

The modular FSH models remain the only authored source. No FSH syntax is parsed
here: SUSHI resolves identifiers, aliases and RuleSets before expansion.
"""
import argparse
from copy import deepcopy
import json
from pathlib import Path
import shutil
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
MODELS = {
    'k': ('LMKOrderCz', 'LMKOrderCompleteCz', 'K-žádanka', 'scripts/expand-k-order-model.py'),
    'ft': ('LMFTOrderCz', 'LMFTOrderCompleteCz', 'FT-žádanka', 'scripts/expand-order-models.py --order ft'),
}
BASE = 'http://hl7.org/fhir/StructureDefinition/Base'


def run_sushi(output=None, project=ROOT):
    executable = shutil.which('sushi.cmd') or shutil.which('sushi')
    if not executable:
        raise RuntimeError('SUSHI is required; install fsh-sushi and put sushi on PATH.')
    command = [executable, 'build', str(project)]
    if output is not None:
        command += ['-o', str(output)]
    # SUSHI versions can report compilation errors while returning exit code 0.
    result = subprocess.run(command, cwd=ROOT, capture_output=True, text=True,
                            encoding='utf-8', errors='replace')
    print(result.stdout.encode('ascii', 'backslashreplace').decode('ascii'))
    if result.stderr:
        print(result.stderr.encode('ascii', 'backslashreplace').decode('ascii'))
    import re
    plain = re.sub(r'\x1b\[[0-9;]*m', '', result.stdout + result.stderr)
    if result.returncode or re.search(r'^error\b', plain, re.MULTILINE | re.IGNORECASE):
        raise RuntimeError('SUSHI failed; the generated model was not updated.')


def load_models(directory):
    models = {}
    for file in sorted(directory.glob('StructureDefinition-*.json')):
        model = json.loads(file.read_text(encoding='utf-8'))
        if model.get('kind') == 'logical' and model.get('id') not in {m[1] for m in MODELS.values()}:
            if model['url'] in models:
                raise ValueError(f'Duplicate logical model URL: {model["url"]}')
            models[model['url']] = model
    return models


def expand(models, source_url, order='k'):
    source_id, model_id, label, command = MODELS[order]
    source = models[source_url]
    visited = set()

    def walk(model, prefix, ancestors):
        url = model['url']
        if url in ancestors:
            raise ValueError('Recursive logical model: ' + ' -> '.join((*ancestors, url)))
        # A differential is complete only for these direct Base specializations.
        # Fail explicitly if the source design changes rather than lose inheritance.
        if model.get('baseDefinition') != BASE or model.get('derivation') != 'specialization':
            raise ValueError(f'{url}: only direct Base specializations are supported')
        elements = model['differential']['element']
        source_root = elements[0]['path']
        if set(elements[0]) - {'id', 'path', 'short', 'definition'}:
            raise ValueError(f'{url}: root constraints require explicit expansion support')
        visited.add(url)
        result = []
        source_paths = {e['path'] for e in elements}
        for original in elements[1:]:
            item = deepcopy(original)
            if not item['path'].startswith(source_root + '.'):
                raise ValueError(f'{url}: invalid element path {item["path"]}')
            if item.get('slicing') or item.get('sliceName'):
                raise ValueError(f'{url}: sliced logical elements are not supported')
            suffix = item['path'][len(source_root):]
            item['path'] = prefix + suffix
            item['id'] = prefix + suffix
            if 'contentReference' in item:
                old = '#' + source_root
                if not item['contentReference'].startswith(old + '.'):
                    raise ValueError(f'{url}: unsupported contentReference')
                item['contentReference'] = '#' + prefix + item['contentReference'][len(old):]
            types = item.get('type', [])
            nested = [t for t in types if t['code'] in models]
            for t in types:
                if t['code'].startswith(source_url.rsplit('/', 1)[0] + '/') and t['code'] not in models:
                    raise ValueError(f'Unresolved local logical type: {t["code"]}')
            if nested:
                if len(types) != 1 or set(types[0]) != {'code'}:
                    raise ValueError(f'{url}: logical type choices/profiles are not supported')
                if any(p.startswith(original['path'] + '.') for p in source_paths):
                    raise ValueError(f'{url}: inline overrides of nested models need explicit merging')
                item['type'] = [{'code': 'Base'}]
                result.append(item)
                result.extend(walk(models[nested[0]['code']], item['path'], (*ancestors, url)))
            else:
                result.append(item)
        return result

    model = deepcopy(source)
    model.pop('snapshot', None)
    model.pop('text', None)
    model['id'] = model['name'] = model_id
    model['url'] = source_url.rsplit('/', 1)[0] + '/' + model_id
    model['type'] = model['url']
    model['title'] = f'{label} – úplný logický model'
    model['description'] = (f'Úplná hierarchie {label[:-1]}y automaticky odvozená z {source_id} '
                            'a jeho sdílených podmodelů. Definice se udržují v dílčích modelech; '
                            'tento přehled zachovává jejich položky, popisy a lokální kardinality.')
    model['purpose'] = (f'Generovaný přehled pro společné čtení datové sady {label[:-1]}y. '
                        f'Neupravovat ručně; generuje {command}.')
    root_element = deepcopy(source['differential']['element'][0])
    root_element.update(id=model_id, path=model_id, short=model['title'], definition=model['description'])
    model['differential']['element'] = [root_element, *walk(source, model_id, ())]
    paths = [e['path'] for e in model['differential']['element']]
    if len(paths) != len(set(paths)):
        raise ValueError('Expansion produced duplicate element paths')
    return model, visited


def generate(check=False, orders=('k', 'ft')):
    if not orders or any(order not in MODELS for order in orders):
        raise ValueError('Select at least one known order type: k, ft')
    # Fresh output prevents deleted or renamed FSH models from surviving as stale inputs.
    with tempfile.TemporaryDirectory(prefix='order-model-') as directory:
        project = Path(directory) / 'source'
        fsh = project / 'input/fsh'
        fsh.mkdir(parents=True)
        # Compile the logical data set independently of unrelated, possibly
        # unfinished clinical profiles and examples in the working tree.
        for folder in ('czech-model', 'rule-sets', 'value-sets', 'code-systems'):
            shutil.copytree(ROOT / 'input/fsh' / folder, fsh / folder)
        shutil.copy2(ROOT / 'input/fsh/alias.fsh', fsh / 'alias.fsh')
        config = (ROOT / 'sushi-config.yaml').read_text(encoding='utf-8')
        (project / 'sushi-config.yaml').write_text(config + '\nFSHOnly: true\n', encoding='utf-8')
        compiled = Path(directory) / 'compiled'
        run_sushi(compiled, project)
        models = load_models(compiled / 'fsh-generated/resources')
        results = []
        for order in orders:
            source_id, model_id, _, _ = MODELS[order]
            sources = [m for m in models.values() if m['id'] == source_id]
            if len(sources) != 1:
                raise ValueError(f'Expected exactly one compiled {source_id} model')
            model, sources_used = expand(models, sources[0]['url'], order)
            output = ROOT / 'input/resources' / f'StructureDefinition-{model_id}.json'
            results.append((model, sources_used, output))
    # Expand every requested root successfully before updating any generated file.
    for model, sources_used, output in results:
        content = json.dumps(model, ensure_ascii=False, indent=2) + '\n'
        if check:
            if not output.exists() or output.read_text(encoding='utf-8') != content:
                raise ValueError(f'{model["id"]} is stale; run scripts/expand-order-models.py')
        else:
            output.parent.mkdir(parents=True, exist_ok=True)
            output.write_text(content, encoding='utf-8', newline='\n')
        print(f'{model["id"]}: {len(model["differential"]["element"])-1} elements, '
              f'{len(sources_used)} source models; ' + ('up to date' if check else str(output)))


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--check', action='store_true', help='Compile sources and reject a stale generated model')
    parser.add_argument('--order', choices=['k', 'ft', 'all'], default='all', help='Which complete models to generate')
    args = parser.parse_args()
    generate(args.check, ('k', 'ft') if args.order == 'all' else (args.order,))
