Instance: AttachmentOrder2FHIR-cz
InstanceOf: ConceptMap
Usage: #definition
* url = "https://hl7.cz/fhir/korder/ConceptMap/AttachmentOrder2FHIR-cz"
* name = "AttachmentOrder2FHIRcz"
* title = "CZ order Attachment Model to this guide Map"
* status = #draft
* experimental = true
* description = """Mapping LMAttachmentsOrderCz.priloha → CZ core Attachment & DocumentReference."""



///////////////////////////////////////////////////////////////////////////////
// A.4 - Prezentovaná forma dokumentu
///////////////////////////////////////////////////////////////////////////////

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LMPresentedFormOrderCz"
* group[=].target = "https://hl7.cz/fhir/korder/StructureDefinition/KOrderCompositionCz"

* group[=].element[+].code = #prezentovanaForma
* group[=].element[=].display = "A.4 - Prezentovaná forma"
* group[=].element[=].target.code = #Composition.section.entry.ofType(DocumentReference)
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #relatedto
* group[=].element[=].target.comment = "Composition.section.entry.ofType(DocumentReference)"

///////////////////////////////////////////////////////////////////////////////
// A.4.1 - Typ obsahu
///////////////////////////////////////////////////////////////////////////////

* group[=].element[+].code = #prezentovanaForma.contentType
* group[=].element[=].display = "A.4.1 - Typ obsahu prezentované formy"
* group[=].element[=].target.code = #DocumentReference.content.attachment.contentType
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent

///////////////////////////////////////////////////////////////////////////////
// A.4.2 - Jazyk
///////////////////////////////////////////////////////////////////////////////

* group[=].element[+].code = #prezentovanaForma.language
* group[=].element[=].display = "A.4.2 - Jazyk prezentované formy"
* group[=].element[=].target.code = #DocumentReference.content.attachment.language
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent

///////////////////////////////////////////////////////////////////////////////
// A.4.3 - Data
///////////////////////////////////////////////////////////////////////////////

* group[=].element[+].code = #prezentovanaForma.data
* group[=].element[=].display = "A.4.3 - Data prezentované formy"
* group[=].element[=].target.code = #DocumentReference.content.attachment.data
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent

///////////////////////////////////////////////////////////////////////////////
// A.4.4 - URL
///////////////////////////////////////////////////////////////////////////////

* group[=].element[+].code = #prezentovanaForma.url
* group[=].element[=].display = "A.4.4 - URL prezentované formy"
* group[=].element[=].target.code = #DocumentReference.content.attachment.url
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent

///////////////////////////////////////////////////////////////////////////////
// A.4.5 - Název
///////////////////////////////////////////////////////////////////////////////

* group[=].element[+].code = #prezentovanaForma.title
* group[=].element[=].display = "A.4.5 - Název prezentované formy"
* group[=].element[=].target.code = #DocumentReference.content.attachment.title
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent

///////////////////////////////////////////////////////////////////////////////
// A.4.6 - Datum a čas vytvoření
///////////////////////////////////////////////////////////////////////////////

* group[=].element[+].code = #prezentovanaForma.creation
* group[=].element[=].display = "A.4.6 - Datum a čas vytvoření"
* group[=].element[=].target.code = #DocumentReference.content.attachment.creation
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent
// -----------------------------------------------------------------------------
// A.5 – PŘÍLOHY 
// -----------------------------------------------------------------------------

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LMAttachmentsOrderCz"
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
