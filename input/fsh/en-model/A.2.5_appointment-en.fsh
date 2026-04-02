Logical: LMEnAppointmentCz
Id: LMEnAppointmentCz
Title: "A.2.5 - Appointment"
Description: """Information about the booked examination appointment (if reserved)."""

* insert SetFmmandStatusRule ( 0, draft )

* identifier 0..1 Identifier "A.2.5.1 - Appointment ID" """Identifier of the appointment record."""
* status 1..1 CodeableConcept "A.2.5.2 - Appointment status" """Status of appointment (proposed, confirmed, cancelled). Preferred system: hl7:valueset-appointmentstatus."""
* description 1..1 string "A.2.5.3 - Description" """Short appointment description for list display."""
* dateTime 0..1 dateTime "A.2.5.4 - Planned date and time" """Date and time of the appointment."""
* duration 0..1 Duration "A.2.5.5 - Examination duration" """Expected duration of the examination."""
* comment 0..1 string "A.2.5.6 - Comment" """Additional comment."""
* instructionsForPatient 0..1 string "A.2.5.7 - Instructions for patient" """Instructions for the patient (e.g., arrive 15 minutes early, fasting, transport arrangements)."""
* location 1..1 Base "A.2.5.8 - Location" """Name and address of the workplace where the appointment was booked."""


