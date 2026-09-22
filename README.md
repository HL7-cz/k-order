# Name of the use case

This is a draft publication by the Interoperability project Team. The continuous build is published in https://build.fhir.org/ig/hl7-cz/XXX

## Build with the complete K-order and FT-order logical models

Run `python scripts/build-ig.py` to regenerate the complete K-order and FT-order models from
the modular FSH definitions and publish the IG. See
[generation instructions](docs/uplny-logicky-model-k.md) for standalone generation
and CI freshness checks.
Use `python scripts/expand-order-models.py --order ft` to generate only the
complete FT-order model, or omit `--order` to regenerate both. Add `--check`
to verify that the generated resources match the current FSH sources.
See [FT-order generation](docs/uplny-logicky-model-ft.md).

The build uses `https://tx.hl7.cz/r4` for Czech MKN-10 and SNOMED CT terminology.
Override it with `-tx URL` when needed; `-tx n/a` disables server validation and
is intended only for offline diagnostics. The script requires a fresh
`output/qa.json` and returns a nonzero exit code if Publisher reports validation
errors, even when the Publisher process itself exits successfully.
After changing terminology servers, use `python scripts/build-ig.py -resetTx`
once to rebuild the terminology cache. The script invokes the original Publisher
JAR without modifications.

## Changes and feedback
Feedback and issues about this IG can be submitted via the [issues](issues) page, and will be incorporated into subsequent releases. Current issues board is available in the [Project board](https://github.com/orgs/HL7-cz/projects/2).
