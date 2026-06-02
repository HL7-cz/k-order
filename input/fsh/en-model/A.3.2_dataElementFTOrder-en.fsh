Logical: LMEnFTOrderDataElementsCz
Id: LMEnFTOrderDataElementsCz
Title: "A.3.2 - Order / examination data elements"
Description: """Data elements of the order / examination."""

* requestedExamination 1..* Base "A.3.2.1 - Requested examination" """Requested examination."""
* requestedExamination.code 1..1 CodeableConcept "A.3.2.1.1 - Examination code" """Code representing the examination within the agreed code system, including its name."""
* requestedExamination.name 0..1 string "A.3.2.1.2 - Examination name" """Full name of the examination, if different from the coded information."""
* requestedExamination.bodyPart 0..* CodeableConcept "A.3.2.1.3 - Body part" """Body part, which the requested care is directed to."""
* requestedExamination.laterality 0..1 CodeableConcept "A.3.2.1.4 - Laterality" """Side of the body, if relevant for the requested care."""
* requestedExamination.frequency 0..1 string "A.3.2.1.5 - Frequency" """Requested frequency of the care or procedure."""
* requestedExamination.note 0..1 string "A.3.2.1.3 - Note" """Requester's note on the requested examination."""
* goal 0..* Base "A.3.2.2 - Goal" """Goal(s) of the examination."""
