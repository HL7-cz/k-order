"""Backward-compatible entry point for the complete K-order logical model."""
import argparse
import importlib.util
from pathlib import Path

spec = importlib.util.spec_from_file_location('order_models', Path(__file__).with_name('expand-order-models.py'))
expander = importlib.util.module_from_spec(spec)
spec.loader.exec_module(expander)

ROOT = expander.ROOT
BASE = expander.BASE
MODEL_ID = expander.MODELS['k'][1]
OUTPUT = ROOT / 'input/resources' / f'StructureDefinition-{MODEL_ID}.json'
expand = expander.expand
load_models = expander.load_models
run_sushi = expander.run_sushi


def generate(check=False):
    return expander.generate(check, orders=('k',))


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--check', action='store_true', help='Reject a stale generated K-order model')
    generate(parser.parse_args().check)
