"""Check shared header targets against installed FHIR/CZ Core packages.

Also checks generated tables, source model elements, bilingual target parity,
and standalone copies of the mapping in IMG-Order.
"""
import importlib.util
import json
import re
import subprocess
import sys
import xml.etree.ElementTree as ET
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.dont_write_bytecode = True
IMG = Path(sys.argv[1]).resolve() if len(sys.argv) > 1 else ROOT.parent / 'RTG'
PACKAGES = Path.home() / '.fhir/packages'
spec = importlib.util.spec_from_file_location('sync_header', ROOT / 'scripts/sync-header-mapping.py')
sync = importlib.util.module_from_spec(spec)
spec.loader.exec_module(sync)
subprocess.run([sys.executable, str(ROOT / 'scripts/sync-header-mapping.py'), '--check', '--img-root', str(IMG)], check=True)

definitions = {}
for package in ('hl7.fhir.r4.core#4.0.1', 'hl7.fhir.uv.extensions.r4#5.3.0', 'hl7.fhir.cz.core#1.0.0'):
    for path in (PACKAGES / package / 'package').glob('*.json'):
        value = json.loads(path.read_text(encoding='utf-8'))
        if value.get('resourceType') == 'StructureDefinition':
            definitions[value['url']] = value

def elements(definition):
    return definition.get('snapshot', definition.get('differential'))['element']

def validate_path(definition, path):
    if not path:
        return
    special = re.fullmatch(r"extension.where\(url = '([^']+)'\)\.(.+)", path)
    if special:
        validate_path(definitions[special[1]], special[2])
        return
    parts = path.split('.')
    prefix = definition['type']
    for index, part in enumerate(parts):
        name, _, slice_name = part.partition('[')
        slice_name = slice_name.rstrip(']')
        candidates = [e for e in elements(definition) if e['path'] == prefix + '.' + name]
        if slice_name:
            candidates = [e for e in candidates if e.get('sliceName') == slice_name or e['id'].endswith(':' + slice_name)]
        if not candidates:
            # Choice elements serialize with a concrete type suffix, e.g. deceasedDateTime.
            candidates = [e for e in elements(definition) if e['path'].startswith(prefix + '.') and
                          e['path'].endswith('[x]') and any(
                              e['path'][:-3] + t['code'][0].upper() + t['code'][1:] == prefix + '.' + name
                              for t in e.get('type', []))]
        assert candidates, (definition['url'], path, part)
        candidate = candidates[0]
        assert candidate.get('max') != '0', (definition['url'], path, 'prohibited')
        if index == len(parts) - 1:
            return
        if any(e['path'].startswith(candidate['path'] + '.') for e in elements(definition)) and not slice_name:
            prefix = candidate['path']
        else:
            datatype = candidate['type'][0]
            canonical = datatype.get('profile', ['http://hl7.org/fhir/StructureDefinition/' + datatype['code']])[0].split('|')[0]
            definition = definitions[canonical]
            prefix = definition['type']

rows = json.loads((ROOT / 'input/data/header-mapping.json').read_text(encoding='utf-8'))
for row in rows:
    assert re.match(r'A\.1(?:\.\d+)*', row['label']['en']).group() == row['code']
    for target in row['profile'].split(' / '):
        kind, name = re.fullmatch(r'(\w+) \((.*?)\)', target).groups()
        canonical = sync.CORE + 'StructureDefinition/' + sync.PROFILES[name] if name in sync.PROFILES else 'http://hl7.org/fhir/StructureDefinition/' + kind
        for path in row['element'].split('; '):
            validate_path(definitions[canonical], path)

for root, files in ((ROOT, ['K-Header-map.xml', 'K-Header-map-en.xml', 'FT-Header-map.xml', 'FT-Header-map-en.xml']),
                    (IMG, ['Header-map-cs.xml', 'Header-map.xml'])):
    models = {}
    for path in (root / 'input/fsh/czech-model').glob('*.fsh'):
        text = path.read_text(encoding='utf-8')
        model = re.search(r'^Id:\s*(\S+)', text, re.M)
        if model:
            models[model[1]] = set(re.findall(r'^\*\s+(\S+)\s+\d+\.\.', text, re.M))
    signatures = []
    for filename in files:
        page = (root / 'input/pagecontent' / filename).read_text(encoding='utf-8')
        include = re.search(r'{% include (header-core-map-(cs|en)\.xml) (.*?) %}', page)
        assert include, filename
        params = dict(re.findall(r'(\w+)="([^"]+)"', include[3]))
        table = (root / 'input/includes' / include[1]).read_text(encoding='utf-8')
        for key, value in params.items():
            table = table.replace('{{ include.' + key + ' }}', value)
        assert '{{' not in table, filename
        parsed = ET.fromstring('<table>' + table + '</table>')
        signature = []
        for tr, row in zip(parsed.findall('tr'), rows):
            source = row['source'].replace('{{ include.performer_element }}', params['performer_element'])
            assert source in models[params[row['model'] + '_model']], (filename, row['code'], source)
            cells = [''.join(td.itertext()) for td in tr.findall('td')]
            signature.append((row['code'], row['relationship'], cells[3], cells[4], cells[5]))
        assert len(signature) == len(rows)
        # Normalize the two document-specific target labels before comparing.
        signatures.append(str(signature).replace(params['composition'], 'COMPOSITION').replace(params['bundle'], 'BUNDLE'))
    assert len(set(signatures)) == 1, 'Bilingual/domain mapping divergence in ' + str(root)
print(f'PASS: {len(rows)} CZ Core/FHIR target paths, source elements and six consistent header tables')
