Logical: LogEnDiagnosisKOrderCz
Id: logEnDiagnosisKOrder
Title: "A.2.1 – Diagnoses"
Description: """Diagnoses justifying the consultation request
or other healthcare service request."""

* primaryDiagnosis 1..1 CodeableConcept "Primary diagnosis"
  """Primary diagnosis justifying the request according to ICD-10 (UZIS)."""

* secondaryDiagnoses 0..* CodeableConcept "Secondary diagnoses"
  """Additional relevant patient diagnoses according to ICD-10 (UZIS)."""

* reimbursementCode 0..1 CodeableConcept "Reimbursement code"
  """Code of reimbursement type or program according to the VZP reimbursement code list."""
