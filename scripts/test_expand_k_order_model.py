"""Checks for lossless nesting and explicit rejection of ambiguous expansion."""
import importlib.util
from pathlib import Path
import unittest
import sys
import tempfile
from unittest.mock import patch

sys.dont_write_bytecode = True

spec = importlib.util.spec_from_file_location('expander', Path(__file__).with_name('expand-order-models.py'))
expander = importlib.util.module_from_spec(spec)
spec.loader.exec_module(expander)
PREFIX = 'https://example.test/StructureDefinition/'


def model(name, children):
    return dict(id=name, name=name, url=PREFIX+name, type=PREFIX+name,
                kind='logical', baseDefinition=expander.BASE, derivation='specialization',
                differential={'element': [dict(id=name, path=name), *children]})


def element(path, code='string', **kwargs):
    return dict(id=path, path=path, min=0, max='1', type=[{'code': code}], **kwargs)


class ExpansionTests(unittest.TestCase):
    def setUp(self):
        self.child = model('Child', [element('Child.value', short='Žluťoučký',
                                          binding={'strength': 'required', 'valueSet': 'https://example.test/vs'})])
        self.root = model('Root', [element('Root.first', PREFIX+'Child'),
                                   element('Root.second', PREFIX+'Child')])
        self.models = {m['url']: m for m in (self.root, self.child)}

    def test_shared_type_expands_at_each_location_without_mutating_source(self):
        self.child['differential']['element'][1]['min'] = 1
        expanded, used = expander.expand(self.models, self.root['url'])
        entries = expanded['differential']['element']
        self.assertEqual(len(entries), 5)
        self.assertEqual(entries[1]['min'], 0)
        self.assertEqual(entries[2]['min'], 1)
        self.assertEqual(entries[2]['binding'], self.child['differential']['element'][1]['binding'])
        self.assertEqual(entries[2]['short'], 'Žluťoučký')
        self.assertEqual(entries[4]['path'], 'LMKOrderCompleteCz.second.value')
        self.assertEqual(entries[1]['type'], [{'code': 'Base'}])
        self.assertEqual(self.root['differential']['element'][1]['type'][0]['code'], PREFIX+'Child')
        self.assertEqual(used, set(self.models))

    def test_cycles_fail(self):
        self.child['differential']['element'].append(element('Child.loop', PREFIX+'Root'))
        with self.assertRaisesRegex(ValueError, 'Recursive'):
            expander.expand(self.models, self.root['url'])

    def test_ft_identity_and_repeated_shared_elements(self):
        self.child['differential']['element'].append(dict(id='Child.copy', path='Child.copy',
                                                       min=0, max='1', contentReference='#Child.value'))
        expanded, used = expander.expand(self.models, self.root['url'], order='ft')
        self.assertEqual(expanded['id'], 'LMFTOrderCompleteCz')
        self.assertEqual(expanded['url'], PREFIX + 'LMFTOrderCompleteCz')
        self.assertEqual(expanded['type'], expanded['url'])
        self.assertIn('LMFTOrderCz', expanded['description'])
        entries = {e['path']: e for e in expanded['differential']['element']}
        for branch in ('first', 'second'):
            path = f'LMFTOrderCompleteCz.{branch}'
            self.assertEqual(entries[path]['type'], [{'code': 'Base'}])
            self.assertEqual(entries[path + '.value']['binding'],
                             self.child['differential']['element'][1]['binding'])
            self.assertEqual(entries[path + '.copy']['contentReference'], '#' + path + '.value')
        self.assertEqual(used, set(self.models))

    def test_ft_root_uses_ft_submodels_instead_of_k_submodels(self):
        ft_data = model('FTData', [element('FTData.quantity', 'positiveInt'),
                                  element('FTData.frequency')])
        k_data = model('KData', [element('KData.consultation')])
        ft_root = model('LMFTOrderCz', [element('LMFTOrderCz.services', ft_data['url'])])
        models = {m['url']: m for m in (ft_root, ft_data, k_data)}
        expanded, used = expander.expand(models, ft_root['url'], order='ft')
        self.assertEqual(used, {ft_root['url'], ft_data['url']})
        self.assertEqual([e['path'] for e in expanded['differential']['element']],
                         ['LMFTOrderCompleteCz', 'LMFTOrderCompleteCz.services',
                          'LMFTOrderCompleteCz.services.quantity', 'LMFTOrderCompleteCz.services.frequency'])

    def test_invalid_ft_model_does_not_overwrite_existing_k_model(self):
        k = model('LMKOrderCz', [element('LMKOrderCz.value')])
        ft = model('LMFTOrderCz', [element('LMFTOrderCz.loop', PREFIX + 'LMFTOrderCz')])
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            for folder in ('czech-model', 'rule-sets', 'value-sets', 'code-systems'):
                (root / 'input/fsh' / folder).mkdir(parents=True)
            (root / 'input/fsh/alias.fsh').write_text('')
            (root / 'sushi-config.yaml').write_text('canonical: https://example.test\n')
            existing = root / 'input/resources/StructureDefinition-LMKOrderCompleteCz.json'
            existing.parent.mkdir()
            existing.write_text('previous K model')
            with patch.object(expander, 'ROOT', root), patch.object(expander, 'run_sushi'), \
                 patch.object(expander, 'load_models', return_value={k['url']: k, ft['url']: ft}):
                with self.assertRaisesRegex(ValueError, 'Recursive'):
                    expander.generate()
            self.assertEqual(existing.read_text(), 'previous K model')
            self.assertFalse((existing.parent / 'StructureDefinition-LMFTOrderCompleteCz.json').exists())

    def test_missing_type_fails(self):
        del self.models[self.child['url']]
        with self.assertRaisesRegex(ValueError, 'Unresolved'):
            expander.expand(self.models, self.root['url'])

    def test_inheritance_fails_instead_of_dropping_elements(self):
        self.child['baseDefinition'] = PREFIX+'Parent'
        with self.assertRaisesRegex(ValueError, 'specializations'):
            expander.expand(self.models, self.root['url'])

    def test_overrides_fail_instead_of_duplicating_elements(self):
        self.root['differential']['element'].append(element('Root.first.value'))
        with self.assertRaisesRegex(ValueError, 'overrides'):
            expander.expand(self.models, self.root['url'])

    def test_local_content_reference_is_rebased(self):
        self.child['differential']['element'].append(dict(id='Child.copy', path='Child.copy',
                                                       min=0, max='1', contentReference='#Child.value'))
        expanded, _ = expander.expand(self.models, self.root['url'])
        copies = [e for e in expanded['differential']['element'] if e['path'].endswith('.copy')]
        self.assertEqual([e['contentReference'] for e in copies],
                         ['#LMKOrderCompleteCz.first.value', '#LMKOrderCompleteCz.second.value'])


if __name__ == '__main__':
    unittest.main()
