"""Check the build's QA gate without running SUSHI or Publisher."""
import importlib.util
import json
from pathlib import Path
import tempfile
import unittest
from unittest.mock import Mock, patch

spec = importlib.util.spec_from_file_location('build_ig', Path(__file__).with_name('build-ig.py'))
build = importlib.util.module_from_spec(spec)
spec.loader.exec_module(build)


class BuildQATest(unittest.TestCase):
    def run_build(self, report, publisher_exit=0, arguments=()):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            (root / 'input-cache').mkdir()
            (root / 'input-cache/publisher.jar').touch()
            (root / 'output').mkdir()
            qa = root / 'output/qa.json'
            qa.write_text('{"errs": 0}')  # Must never accept a previous build.

            def publish(command, **kwargs):
                self.assertFalse(qa.exists())
                if report is not None:
                    qa.write_text(report, encoding='utf-8')
                return publisher_exit

            with patch.object(build, 'ROOT', root), \
                 patch.object(build.sys, 'argv', ['build-ig.py', *arguments]), \
                 patch.object(build.importlib.util, 'module_from_spec', return_value=Mock()), \
                 patch.object(build.importlib.util, 'spec_from_file_location', return_value=Mock()), \
                 patch.object(build.subprocess, 'call', side_effect=publish) as process:
                result = build.main()
                return result, process.call_args.args[0]

    def test_success_uses_czech_terminology(self):
        result, command = self.run_build(json.dumps({'errs': 0, 'warnings': 1}))
        self.assertEqual(result, 0)
        self.assertEqual(command[command.index('-tx') + 1], 'https://tx.hl7.cz/r4')

    def test_qa_errors_fail_even_if_publisher_succeeds(self):
        self.assertEqual(self.run_build('{"errs": 43}')[0], 1)

    def test_missing_report_does_not_reuse_stale_success(self):
        self.assertEqual(self.run_build(None)[0], 1)

    def test_invalid_reports_fail(self):
        for report in ['{', '{}', '[]', 'null', '{"errs": "0"}', '{"errs": false}', '{"errs": -1}']:
            with self.subTest(report=report):
                self.assertEqual(self.run_build(report)[0], 1)

    def test_publisher_failure_is_preserved(self):
        self.assertEqual(self.run_build('{"errs": 0}', publisher_exit=7)[0], 7)

    def test_explicit_terminology_server_is_preserved(self):
        result, command = self.run_build('{"errs": 0}', arguments=['-tx', 'n/a'])
        self.assertEqual(result, 0)
        self.assertEqual(command.count('-tx'), 1)
        self.assertEqual(command[command.index('-tx') + 1], 'n/a')


if __name__ == '__main__':
    unittest.main()
