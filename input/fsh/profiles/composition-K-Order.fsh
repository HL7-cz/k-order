Profile: KOrderCompositionCz
Parent: Composition
Id: KOrderCompositionCz
Title: "Composition: K-order (Zadanka) (CZ)"
Description: """
K-order Composition pro narodni IG (CZ).
Kompozice slouzi jako dokumentovy kontejner nad ServiceRequest, Patient, Coverage,
Condition a DocumentReference.
"""
* ^publisher = "HL7 CZ"
* ^copyright = "HL7 CZ"
* . ^short = "K-order composition"

* insert SetFmmandStatusRule ( 0, draft )

* meta
  * security 0..* MS

* identifier 1..1 MS
* identifier.system = "urn:ietf:rfc:4122"


* type 1..1 MS
* type from $OrderTypes (required)
  * coding 1..1
  * coding = $loinc#57133-1

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

* author
  * insert SliceElement( #profile, [[$this.resolve()]] )
* author contains
    authorOrder 0..* and
    authorCore 0..*
* author[authorOrder] only Reference(CZ_PractitionerRoleOrder)
* author[authorCore] only Reference(CZ_PractitionerRoleCore)

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
    significantMedicalHistory 0..1 and
    examinationResults 0..1 and
    differentialDiagnosis 0..1 and
    currentTreatment 0..1 and
    supportingInformation 0..1 and
    referencedDocumentation 0..1 and
    attachments 0..* and
    signature 0..1

* section[coverage].code = $loinc#87520-3 
* section[coverage].title = "coverage"
* section[coverage].entry 1..*
* section[coverage].entry only Reference(CZ_Coverage)
/*
* section[reasons].code = $loinc#29299-5
* section[reasons].title = "Clinical justification"
* section[reasons].text 0..1 MS
* section[reasons].entry 0..0
*/
* section[orderInformation].code = $loinc#57133-1
* section[orderInformation].title = "Requested orderInformation"
* section[orderInformation].entry 1..*
* section[orderInformation].entry only Reference(KOrderServiceRequestCz)

* section[attachments].code = $loinc#55107-7
* section[attachments].title = "Attachments"
* section[attachments].entry 0..*
* section[attachments].entry only Reference(CZ_Attachment)

* section[signature].code = $loinc#64292-6
* section[signature].title = "Signature"
* section[signature].entry 0..1
* section[signature].entry only Reference(CZ_Provenance)

* section[significantMedicalHistory]
  * insert SectionComRules(
      Serious medical history,
      This section includes significant past medical history that may impact the current hospital stay.,
      $loinc#11348-0)
  * entry 0..*
  * entry only Reference(CZ_ConditionCore)

* section[examinationResults]
  * insert SectionComRules(
      Relevant diagnostic tests,
      This section includes relevant diagnostic tests that may impact the current patient care.,
      $loinc#30954-2)
  * entry 0..*
  * entry only Reference(diagnosticReport-cz-core)

* section[differentialDiagnosis]
  * insert SectionComRules(
      Differential diagnosis considerations,
      This section includes differential diagnosis considerations relevant to the current patient care.,
      $loinc#51848-0)
  * entry 0..*
  * entry only Reference(CZ_ConditionCore)  

* section[currentTreatment]
  * insert SectionComRules(
      Current treatment including medication and dosage,
      This section includes current treatment information including medication and dosage relevant to the current patient care.,
      $loinc#11506-3)
  * entry 0..*
  * entry only Reference(CZ_MedicationStatementCore)

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

* section[referencedDocumentation]
  * insert SectionComRules(
      Referenced documentation,
      This section includes references to other documentation relevant to the current patient care.,
      $loinc#77599-9)
  * entry 0..*
  * entry only Reference(CZ_Logo or DocumentReference)

* section.author only Reference(
  CZ_PractitionerCore or CZ_PractitionerRoleOrder or CZ_DeviceObserver or
  CZ_PatientCore or CZ_RelatedPersonCore or CZ_OrganizationCore
)

Extension: KOrderRequestReference
Id: korder-composition-requestReference
Title: "K-order Request Reference"
Description: "Reference to the K-order ServiceRequest instance(s) that the Composition documents."
* insert ExtensionContext(Composition)
* insert SetFmmandStatusRule ( 2, trial-use)
* value[x] only Reference(KOrderServiceRequestCz)
