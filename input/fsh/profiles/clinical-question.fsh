Profile: CZ_ClinicalQuestion
Parent: CZ_ConditionCore
Id: cz-clinicalQuestion
Title: "Clinical question (CZ)"
Description: "Condition expressing the clinical problem addressed by a question in a K or FT order. Adapted from the IMG-Order clinical-question profile and based directly on CZ Core."
* insert SetFmmandStatusRule ( 0, draft )
* subject only Reference(CZ_PatientCore)
* category from $hl7-condition-category (required)
* code.text 1..1 MS
* code.text ^short = "Text of the clinical problem addressed by the question"
* code.coding 0..*
* code.coding from $sct-condition-code (required)
* recorder only Reference(CZ_PractitionerCore or CZ_PractitionerRoleCore or CZ_PatientCore or CZ_RelatedPersonCore)
* asserter only Reference(CZ_PractitionerCore or CZ_PractitionerRoleCore or CZ_PatientCore or CZ_RelatedPersonCore)
* ^purpose = "Provides an optional structured entry for Composition.section[clinicalIndication]. Preserve the clinical and verification status of the condition; the presence of a question does not establish a diagnosis. A question that does not describe a condition can be recorded in the section narrative without creating a Condition."
