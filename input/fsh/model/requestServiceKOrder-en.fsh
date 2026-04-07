Logical: LogEnRequestedServiceKOrder
Id: logEnRequestedServiceKOrder
Title: "A.2.3 – Requested examinations / procedures"
Description: """Specification of requested consultative examinations,
treatments, or medical procedures."""

* examinationType 1..1 CodeableConcept
  "Type of requested examination"
  """Consultative examination, examination, or treatment."""

* examinationDescription 1..1 string
  "Requested examination (text description)"
  """Textual description of the requested healthcare services."""

* procedures 0..* CodeableConcept
  "Procedures"
  """List of codes of requested medical procedures according
  to the VZP code system."""
