Logical: LogEnAdditionalClinicalInfoKOrderCZ
Id: logAdditionalClinicalInfoKOrderCz
Title: "A.2.5 – Additional Clinical Information"
Description: """Additional clinical information and notes
related to the consultation request (K-order)."""

* note 0..1 string "Note"
  """General note related to the request."""

* significantMedicalHistory 0..1 string "Significant medical history"
  """Significant medical history relevant for the assessment of the request."""

* examinationResults 0..1 string "Results of performed examinations"
  """Summary of available results of already performed examinations."""

* differentialDiagnosis 0..1 string "Differential diagnostic consideration"
  """Clinical consideration of possible diagnoses and further diagnostic approaches."""

* currentTreatment 0..1 string "Current treatment"
  """Current treatment and medication including dosage."""
