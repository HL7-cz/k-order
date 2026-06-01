Logical: LMEnFTOrderDataElementsCz
Id: LMEnFTOrderDataElementsCz
Title: "A.3.2 - Order / examination data elements"
Description: """Data elements of the order / examination."""

* requestedExamination 1..* Base "A.3.2.1 - Requested examination" """Requested examination."""
    * code 1..1 CodeableConcept "A.3.2.1.1 - Examination code" """Code representing the examination within the agreed code system, including its name."""
    * name 0..1 string "A.3.2.1.2 - Examination name" """Full name of the examination, if different from the coded information."""
    * note 0..1 string "A.3.2.1.3 - Note" """Requester's note on the requested examination."""
* goal 0..* Base "A.3.2.2 - Goal" """Goal(s) of the examination."""
