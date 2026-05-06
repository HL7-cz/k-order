Logical: LMEnClinicalEventCz
Id: LMEnClinicalEventCz
Title: "A.2.3 - Clinical event (encounter)"
Description: """Information about the clinical event to which the order relates (encounter reference)."""

* insert SetFmmandStatusRule ( 0, draft )

* identifier 1..* Identifier "A.2.3.1 - Clinical event ID" """A unique, globally unique identifier of the clinical event to which the order relates."""
* type 0..* CodeableConcept "A.2.3.2 - Clinical event type" """Type of clinical event according to a code list (e.g., hospitalization, outpatient visit)."""
* additionalInformation 0..1 string "A.2.3.3 - Additional clinical event information" """Type of provided services, period or duration of the event, links to other clinical events, etc."""


