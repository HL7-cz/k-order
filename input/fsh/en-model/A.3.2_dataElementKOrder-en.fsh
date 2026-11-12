Logical: LMEnKOrderDataElementsCz
Id: LMEnKOrderDataElementsCz
Title: "A.3.2 - Order / examination data elements (K-order)"
Description: """Data elements of the order / examination."""

* ^version = "1.0.0"

* requestedExamination 1..* Base "A.3.2.1 - Requested examination" """Requested examination or service."""
* requestedExamination.code 1..1 CodeableConcept "A.3.2.1.1 - Examination code" """Code representing the examination within the agreed code system, including its name."""
* requestedExamination.name 0..1 string "A.3.2.1.2 - Examination name" """Full name of the examination, if different from the coded information."""
* requestedExamination.note 0..1 string "A.3.2.1.3 - Note" """Requester's note on the requested examination."""
// A recommendation for hospital admission or transfer of care is a separate
// requested service in requestedExamination, mapped to its own ServiceRequest.
* significantHistory 0..1 Base "A.3.2.2 - Significant medical history" """Text summary and/or references to structured records. The same records can be shared with the general elements A.3.1 and A.5 without duplication."""
* significantHistory.text 0..1 string "Text summary" """Free text in the narrative of the corresponding Composition section. Text alone does not require creating a structured resource."""
* significantHistory.record 0..* Reference(CZ_ConditionCore) "Structured records" """References to records conforming to the target profile, including its mandatory elements. The same clinical fact uses the same resource and identifier."""
* examinationResults 0..1 Base "A.3.2.3 - Results of performed examinations" """Text summary and/or references to structured records. The same records can be shared with the general elements A.3.1 and A.5 without duplication."""
* examinationResults.text 0..1 string "Text summary" """Free text in the narrative of the corresponding Composition section. Text alone does not require creating a structured resource."""
* examinationResults.record 0..* Reference(CZ_MedicalTestResultCore) "Structured records" """References to records conforming to the target profile, including its mandatory elements. The same clinical fact uses the same resource and identifier."""
* differentialDiagnosis 0..1 Base "A.3.2.4 - Differential diagnosis" """Text summary and/or references to structured records. The same records can be shared with the general elements A.3.1 and A.5 without duplication."""
* differentialDiagnosis.text 0..1 string "Text summary" """Free text in the narrative of the corresponding Composition section. Text alone does not require creating a structured resource."""
* differentialDiagnosis.record 0..* Reference(CZ_ConditionCore) "Structured records" """References to records conforming to the target profile, including its mandatory elements. The same clinical fact uses the same resource and identifier."""
* currentTreatment 0..1 Base "A.3.2.5 - Current treatment, medication including dosage" """Text summary and/or references to structured records. The same records can be shared with the general elements A.3.1 and A.5 without duplication."""
* currentTreatment.text 0..1 string "Text summary" """Free text in the narrative of the corresponding Composition section. Text alone does not require creating a structured resource."""
* currentTreatment.record 0..* Reference(CZ_MedicationStatementCore or CZ_MedicationAdministrationCore) "Structured records" """References to records conforming to the target profile, including its mandatory elements. The same clinical fact uses the same resource and identifier."""
* loanedDocumentation 0..1 Base "A.3.2.6 - Loaned documentation" """Text summary and/or references to structured records. The same records can be shared with the general elements A.3.1 and A.5 without duplication."""
* loanedDocumentation.text 0..1 string "Text summary" """Free text in the narrative of the corresponding Composition section. Text alone does not require creating a structured resource."""
* loanedDocumentation.record 0..* Reference(CZ_Attachment) "Structured records" """References to records conforming to the target profile, including its mandatory elements. The same clinical fact uses the same resource and identifier."""
