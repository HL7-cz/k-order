Profile: FTOrderCompositionCz
Parent: Composition
Id: FTOrderCompositionCz
Title: "Composition: FT-order (Zadanka fyzioterapie) (CZ)"
Description: """
FT-order Composition pro narodni IG (CZ).
Kompozice slouzi jako dokumentovy kontejner nad FT ServiceRequest, Patient, Coverage,
Condition a DocumentReference.
"""
* ^publisher = "HL7 CZ"
* ^copyright = "HL7 CZ"
* . ^short = "FT-order composition"

* insert SetFmmandStatusRule ( 0, draft )

* meta
  * security 0..* MS

* identifier 1..1 MS
* identifier.system = "urn:ietf:rfc:4122"

* type 1..1 MS
* type from $OrderTypes (required)
  * coding 1..1
  * coding = $loinc#57154-7


* category
  * insert SliceElement( #value, $this )
* category contains documentCategory 1..1
* category[documentCategory] from $DocumentCategory (required)
* category[documentCategory] = $loinc#57133-1

* extension contains DocumentPresentedForm named presentedForm 0..*
* extension[presentedForm] ^short = "Presented form"
* extension[presentedForm].valueAttachment
  * contentType
    * ^example[0].label = "pdf"
    * ^example[0].valueCode  = $mime#application/pdf
  * data ^short = "B64 in-line data"
  * url ^short = "URL of the document"

* extension contains
    $information-recipient-url named informationRecipient 0..*
* extension[informationRecipient].valueReference only Reference(
  CZ_PractitionerCore or CZ_DeviceObserver or CZ_PatientCore or
  CZ_RelatedPersonCore or CZ_PractitionerRoleOrder or CZ_OrganizationCore
)

* status 1..1 MS
* status = #final (exactly)
* title 1..1 MS
* date 1..1 MS

* subject 1..1 MS
* subject only Reference(CZ_PatientCore)

* custodian 0..1 MS
* custodian only Reference(CZ_OrganizationCore)

* author only Reference(CZ_PractitionerRoleOrder or CZ_PractitionerRoleCore)

* encounter 0..1
* encounter only Reference(CZ_Encounter)

* section 1..* MS
* section ^slicing.discriminator.type = #pattern
* section ^slicing.discriminator.path = "code"
* section ^slicing.rules = #open
* section ^slicing.ordered = false

* section contains
    orderInformation 1..1 and
    coverage 1..1 and
    reasons 0..1 and
    supportingInformation 0..1 and
    attachments 0..* and
    signature 0..1 and
    goals 0..1

* section[coverage].code = $loinc#87520-3
* section[coverage].title = "coverage"
* section[coverage].entry 1..*
* section[coverage].entry only Reference(CZ_Coverage)

* section[reasons].code = $loinc#29299-5
* section[reasons].title = "Clinical justification"
* section[reasons].text 0..1 MS
* section[reasons].entry 0..0

* section[supportingInformation]
  * ^short = "Supporting information"
  * ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-explicit-type-name"
  * ^extension[0].valueString = "Section"
  * code = $loinc#55752-0
  * entry 0..
  * entry only Reference(CZ_MedicationStatementCore or CZ_ObservationOrder or CZ_BodyHeight or CZ_BodyWeight or CZ_ConditionCore or CZ_AllergyIntolerance or CZ_MedicalDevice or CZ_CarePlanCore)
  * entry ^slicing.discriminator[0].type = #profile
  * entry ^slicing.discriminator[0].path = "resolve()"
  * entry ^slicing.rules = #open
  * entry contains
      bodyHeight 0..1 and
      bodyWeight 0..1 and
      mobility 0..1
  * entry[bodyHeight] only Reference(CZ_BodyHeight)
  * entry[bodyWeight] only Reference(CZ_BodyWeight)
  * entry[mobility] only Reference(CZ_PatientMobility)

* section[orderInformation].code = $loinc#57154-7
* section[orderInformation].title = "Requested physiotherapy procedures"
* section[orderInformation].entry 1..*
* section[orderInformation].entry only Reference(FTServiceRequestCz)

* section[attachments].code = $loinc#55107-7
* section[attachments].title = "Attachments"
* section[attachments].entry 0..*
* section[attachments].entry only Reference(CZ_Attachment)

* section[signature].code = $loinc#64292-6
* section[signature].title = "Signature"
* section[signature].entry 0..1
* section[signature].entry only Reference(CZ_Provenance)

* section[goals]
  * insert SectionComRules(
      Therapy goals,
      This section contains patient-specific clinical and functional outcomes expected from the requested physiotherapy.,
      $loinc#61146-7)
  * entry 0..*
  * entry only Reference(Goal)

* section.author only Reference(
  CZ_PractitionerCore or CZ_PractitionerRoleOrder or CZ_DeviceObserver or
  CZ_PatientCore or CZ_RelatedPersonCore or CZ_OrganizationCore
)

Extension: FTOrderRequestReference
Id: ftorder-composition-requestReference
Title: "FT-order Request Reference"
Description: "Reference to the FT ServiceRequest instance(s) that the Composition documents."
* insert ExtensionContext(Composition)
* insert SetFmmandStatusRule ( 2, trial-use)
* value[x] only Reference(FTServiceRequestCz)
