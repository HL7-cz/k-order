Instance: AttachmentKOrder2FHIR-cz
InstanceOf: ConceptMap
Usage: #definition
* url = "https://hl7.cz/fhir/korder/ConceptMap/AttachmentKOrder2FHIR-cz"
* name = "AttachmentKOrder2FHIRcz"
* title = "CZ Attachment Model to this guide Map"
* status = #draft
* experimental = true
* description = """Mapování příloh a vizuální podoby aktuálního czech-model logického modelu žádanek na profily a resource použité v tomto IG."""

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LMPresentedFormOrderCz"
* group[=].target = "https://hl7.cz/fhir/korder/StructureDefinition/KOrderCompositionCz"

* group[=].element[+].code = #LMPresentedFormOrderCz.vizualniPodoba
* group[=].element[=].display = "A.4 - VizuĂˇlnĂ­ podoba"
* group[=].element[=].target.code = #Composition.extension:presentedForm.valueAttachment
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMPresentedFormOrderCz.data
* group[=].element[=].display = "A.4.3 - Data obsahu"
* group[=].element[=].target.code = #Composition.extension:presentedForm.valueAttachment.data
* group[=].element[=].target.equivalence = #equivalent

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LMAttachmentsOrderCz"
* group[=].target = "https://hl7.cz/fhir/core/StructureDefinition/cz-attachment"

* group[=].element[+].code = #LMAttachmentsOrderCz.typObsahu
* group[=].element[=].display = "A.5.1 - Typ obsahu"
* group[=].element[=].target.code = #Attachment.contentType
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMAttachmentsOrderCz.jazyk
* group[=].element[=].display = "A.5.2 - Jazyk obsahu"
* group[=].element[=].target.code = #Attachment.language
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMAttachmentsOrderCz.data
* group[=].element[=].display = "A.5.3 - Data obsahu"
* group[=].element[=].target.code = #Attachment.data
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMAttachmentsOrderCz.url
* group[=].element[=].display = "A.5.4 - URL obsahu"
* group[=].element[=].target.code = #Attachment.url
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMAttachmentsOrderCz.nazev
* group[=].element[=].display = "A.5.5 - NĂˇzev obsahu"
* group[=].element[=].target.code = #Attachment.title
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMAttachmentsOrderCz.vytvoreni
* group[=].element[=].display = "A.5.6 - Datum vytvoĹ™enĂ­"
* group[=].element[=].target.code = #Attachment.creation
* group[=].element[=].target.equivalence = #equivalent
