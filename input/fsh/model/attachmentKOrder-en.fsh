Logical: LogEnAttachmentsCz
Id: AttachmentsKOrderCz
Title: "A.5 - Additional attachments"
Description: """K-Order additional attachments - A.4"""

* contentType 0..1 CodeableConcept "A.5.1 - Type of content" """Type of content - MIME type is required"""
* language 0..1 CodeableConcept "A.5.2 - Language of content" """Language of content - HL7 valueset of languages is required"""
* data 1..1 base64Binary "A.5.3 - Data of content" """Data inline, base64ed"""
* url 0..1 url "A.5.4 - URL of content" """Uri where the data can be found"""
* title 1..1 string "A.5.5 - Title of content" """Label to display in place of the data"""
* creation 0..1 dateTime "A.5.6 - Date of creation" """Date attachment was first created"""