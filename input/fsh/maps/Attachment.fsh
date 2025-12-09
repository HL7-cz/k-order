Instance: AttachmentKOrder2FHIR-cz
InstanceOf: ConceptMap
Usage: #definition
* url = "https://hl7.cz/fhir/korder/ConceptMap/AttachmentKOrder2FHIR-cz"
* name = "AttachmentKOrder2FHIRcz"
* title = "CZ K-order Attachment Model to this guide Map"
* status = #draft
* experimental = true
* description = """Mapping LogCzKOrder.priloha → CZ core Attachment & DocumentReference."""


// -----------------------------------------------------------------------------
// A.5 – PŘÍLOHY (LogCzKOrder.priloha)
// -----------------------------------------------------------------------------

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LogCzKOrder"
* group[=].target = "https://hl7.cz/fhir/core/StructureDefinition/cz-attachment"

// celá příloha
* group[=].element[+].code = #priloha
* group[=].element[=].display = "A.5 – Přílohy"
* group[=].element[=].target.code = #Attachment
* group[=].element[=].target.equivalence = #relatedto
* group[=].element[=].target.comment = 
    "Attachment is typically included as DocumentReference.content.attachment"

// MIME type
* group[=].element[+].code = #priloha.contentType
* group[=].element[=].display = "A.5.1 – Content type"
* group[=].element[=].target.code = #Attachment.contentType
* group[=].element[=].target.equivalence = #equivalent

// language
* group[=].element[+].code = #priloha.language
* group[=].element[=].display = "A.5.2 – Language"
* group[=].element[=].target.code = #Attachment.language
* group[=].element[=].target.equivalence = #equivalent

// data
* group[=].element[+].code = #priloha.data
* group[=].element[=].display = "A.5.3 – Data"
* group[=].element[=].target.code = #Attachment.data
* group[=].element[=].target.equivalence = #equivalent

// url
* group[=].element[+].code = #priloha.url
* group[=].element[=].display = "A.5.4 – URL"
* group[=].element[=].target.code = #Attachment.url
* group[=].element[=].target.equivalence = #equivalent

// title
* group[=].element[+].code = #priloha.title
* group[=].element[=].display = "A.5.5 – Title"
* group[=].element[=].target.code = #Attachment.title
* group[=].element[=].target.equivalence = #equivalent

// creation date
* group[=].element[+].code = #priloha.creation
* group[=].element[=].display = "A.5.6 – Creation date"
* group[=].element[=].target.code = #Attachment.creation
* group[=].element[=].target.equivalence = #equivalent
