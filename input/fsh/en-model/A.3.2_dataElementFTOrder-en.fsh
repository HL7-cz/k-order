Logical: LMEnFTOrderDataElementsCz
Id: LMEnFTOrderDataElementsCz
Title: "A.3.2 - Order / examination data elements"
Description: """Data elements of the order / examination."""

* requestedExamination 1..* Base "A.3.2.1 - Requested examination" """Requested examination."""
* requestedExamination.code 1..1 CodeableConcept "A.3.2.1.1 - Examination code" """Code representing the examination within the agreed code system, including its name."""
* requestedExamination.name 0..1 string "A.3.2.1.2 - Examination name" """Full name of the examination, if different from the coded information."""
* requestedExamination.bodyPart 0..* CodeableConcept "A.3.2.1.3 - Body part" """Body part, which the requested care is directed to."""
* requestedExamination.laterality 0..1 CodeableConcept "A.3.2.1.4 - Laterality" """Side of the body, if relevant for the requested care."""
* requestedExamination.count 0..1 positiveInt "A.3.2.1.5 - Count" """Total number of requested care or procedure occurrences."""
* requestedExamination.frequency 0..1 string "A.3.2.1.6 - Frequency" """Requested frequency of the care or procedure."""
* requestedExamination.note 0..1 string "A.3.2.1.7 - Note" """Requester's note on the requested examination."""
* requestedExamination.placeOfCare 0..1 CodeableConcept "A.3.2.1.8 - Place of care" """Requested place where the care or procedure is to be delivered, for example the patient's home."""
* goal 0..* Base "A.3.2.2 - Goal" """Goal(s) of the examination."""
