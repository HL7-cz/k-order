Instance: AppointmentExample
InstanceOf: CZ_Appointment
Usage: #example
Description: "Appointment"

* status = #booked
* description = "Pravidelná kontrola"
* minutesDuration = 30
* created = "2025-05-10T14:23:00+02:00"
* patientInstruction = "Nalačno"
* start = "2025-06-01T07:00:00+02:00"
* end = "2025-06-01T07:30:00+02:00"

* created = "2025-05-27"
* participant[0].actor = Reference(LocationExample) "Ordinace - Jankovcova 2"
* participant[=].required = #required
* participant[=].status = #accepted

Instance: LocationExample
InstanceOf: CZ_LocationCore
Usage: #example
Description: "Example of location"

* status = #active
* name = "Ordinace - Jankovcova 2"
* type.text = "Doctor's office"