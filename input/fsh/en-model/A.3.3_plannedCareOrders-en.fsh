Logical: LMEnPlannedCareOrdersCz
Id: LMEnPlannedCareOrdersCz
Title: "A.3.3 - References to planned care orders following this order"
Description: """References to related planned care orders following this order."""

* ^version = "1.0.0"

* identifier 0..1 Identifier "A.3.3.1 - Planned care order identifier" """Identifier of the related planned care order."""
* name 1..1 string "A.3.3.2 - Name" """Name of the related planned care order."""
