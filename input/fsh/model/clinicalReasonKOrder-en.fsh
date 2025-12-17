Logical: LogEnClinicalReasonKOrderCZ
Id: logEnClinicalReasonKOrder
Title: "A.2.2 – Clinical reason for the request"
Description: """Clinical reasons for the consultation request
or other healthcare service request, including medical history,
objective findings, and other related clinical information."""

* reasonText 1..1 string "Reason for the request"
  """Clinical reasons for the request (medical history,
objective findings, and main clinical circumstances)."""

* significantMedicalHistory 0..1 string "Significant medical history"
  """Significant medical history relevant for the assessment of the request."""

* examinationResults 0..1 string "Results of performed examinations"
  """Summary of available results of already performed examinations."""

* differentialDiagnosis 0..1 string "Differential diagnostic consideration"
  """Clinical consideration of possible diagnoses."""

* currentTreatment 0..1 string "Current treatment"
  """Current treatment and medication including dosage."""
