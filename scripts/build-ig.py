"""Build Order IG, regenerating the complete K-order and FT-order models first.

Usage: python scripts/build-ig.py [-tx server] [other Publisher arguments]
Defaults to the Czech terminology server; exits nonzero on QA errors.
Requires Python 3, SUSHI, Java and input-cache/publisher.jar (or ../publisher.jar).
"""
import importlib.util
import json
from pathlib import Path
import subprocess
import sys

sys.dont_write_bytecode = True

ROOT = Path(__file__).resolve().parents[1]


def main():
    if '-watch' in sys.argv[1:]:
        raise SystemExit('Watch mode is not supported; rerun this script after source edits.')
    publisher = next((p for p in [ROOT/'input-cache/publisher.jar', ROOT.parent/'publisher.jar'] if p.exists()), None)
    if publisher is None:
        raise SystemExit('Publisher not found in input-cache or parent directory.')
    spec = importlib.util.spec_from_file_location('expand_order_models', ROOT/'scripts/expand-order-models.py')
    generator = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(generator)
    generator.generate()
    # Register the newly generated input resources in the ImplementationGuide too.
    generator.run_sushi()
    arguments = sys.argv[1:]
    if '-tx' not in arguments:
        arguments = ['-tx', 'https://tx.hl7.cz/r4', *arguments]
    # A successful Publisher process can still report validation errors. Remove
    # the previous report so an interrupted build cannot pass using stale QA.
    qa_path = ROOT / 'output/qa.json'
    qa_path.unlink(missing_ok=True)
    result = subprocess.call(['java', '-Dfile.encoding=UTF-8', '-jar', str(publisher),
                              '-ig', str(ROOT), '-no-sushi', *arguments], cwd=ROOT)
    if result:
        return result
    try:
        qa = json.loads(qa_path.read_text(encoding='utf-8'))
        errors = qa['errs']
        if type(errors) is not int or errors < 0:
            raise ValueError('QA errs must be a non-negative integer')
    except (OSError, ValueError, KeyError, TypeError) as exc:
        print(f'Build failed: missing or invalid QA report: {exc}', file=sys.stderr)
        return 1
    if errors:
        print(f'Build failed: {errors} validation errors; see {qa_path.with_suffix(".html")}',
              file=sys.stderr)
        return 1
    print(f'Build passed: no validation errors; see {qa_path.with_suffix(".html")}')
    return 0


if __name__ == '__main__':
    sys.exit(main())
