This profile adapts the IMG-Order `CZ_ConditionClinicalQuestion` profile for K and FT orders. It derives directly from **CZ_ConditionCore**, so it remains a valid target wherever these orders accept a Core Condition. The subject is a CZ Core Patient; the Group alternative of the IMG profile is not added to the patient-only Core base.

As in `RTG/input/fsh/profiles/condition4clinicalQuestion.fsh`, `code.text` is required and `code.coding` is optional. If coding is supplied, it has a **required** binding to [FHIR Condition/Problem/Diagnosis Codes](http://hl7.org/fhir/ValueSet/condition-code). Category uses the required [Condition Category](http://hl7.org/fhir/ValueSet/condition-category) binding.

K and FT reference this profile from `Composition.section[clinicalQuestion].entry`. Logical model A.2.2.2 maps to `Condition.code`; A.2.2.3 maps to the section narrative and, when a Condition represents the clinical problem, its `code.text`. The section continues to use the general clinical-indication code LOINC 104720-8.

Keep indication diagnoses in `ServiceRequest.reasonCode` or `reasonReference` (A.2.2.1). The IMG parent profile has a separate diagnostic value set covering all MKN-10 and ORPHA codes. Its equivalent in this guide is [CZ_DiagnosisConditionVs](ValueSet-cz-diagnosis-condition-vs.html); it must not replace the clinical question's SNOMED CT binding. The diagnosis/condition coding slices of the IMG parent are not copied into this Core-derived profile.

A question does not establish a diagnosis. Preserve clinical and verification status. Questions that do not describe a condition can remain in the required section narrative without a Condition entry.
