Logical: LMEnPresentedFormCz
Id: LMEnPresentedFormOrderCz
Title: "A.4 - Presented form"
Description: """Human-readable form of the order; PDF format is required."""

* ^version = "1.0.0"

* contentType 0..1 CodeableConcept "A.4.1 - Type of content" """Type of content - MIME type is required"""
* language 0..1 CodeableConcept "A.4.2 - Language of content" """Language of content - a value from the HL7 Languages value set is required"""
* data 1..1 base64Binary "A.4.3 - Data of content" """Data inline, base64 encoded"""
* url 0..1 url "A.4.4 - URL of content" """URI where the data can be found"""
* title 1..1 string "A.4.5 - Title of content" """Label to display in place of the data"""
* creation 0..1 dateTime "A.4.6 - Date of creation" """Date the content was first created"""
