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
  * coding = $loinc#57133-1


* category from $DocumentCategory (required)
  * coding = $loinc#57133-1 


* extension contains DocumentPresentedForm named presentedForm 1..*
* extension[presentedForm].valueAttachment
  * contentType
  * data ^short = "B64 in-line data"
  * url ^short = "URL of the document"

* extension contains
    $information-recipient-url named informationRecipient 0..*
* extension[informationRecipient].valueReference only Reference(
  CZ_PractitionerCore or CZ_DeviceObserver or CZ_PatientCore or
  CZ_RelatedPersonCore or OrderPractitionerRoleCz or CZ_OrganizationCore
)

* status 1..1 MS
* status = #final (exactly)
* title 1..1 MS
* date 1..1 MS

* subject 1..1 MS
* subject only Reference(CZ_PatientCore)

* custodian 0..1 MS
* custodian only Reference(CZ_OrganizationCore)

* author 1..* MS
* author only Reference(
  CZ_PractitionerCore or OrderPractitionerRoleCz or CZ_DeviceObserver or CZ_OrganizationCore
)

* encounter 0..1
* encounter only Reference(CZ_Encounter)

* section 1..* MS
* section ^slicing.discriminator.type = #pattern
* section ^slicing.discriminator.path = "code"
* section ^slicing.rules = #open
* section ^slicing.ordered = false

* section contains
    orderInformation 1..1 and
    coverage 0..1 and
    significantMedicalHistory 0..1 and
    examinationResults 0..1 and
    differentialDiagnosis 0..1 and
    currentTreatment 0..1 and
    referencedDocumentation 0..1 and
    attachments 0..* and
    signature 0..1

* section[coverage].code = $loinc#87520-3 
* section[coverage].title = "coverage"
* section[coverage].entry 1..1
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
  * entry only Reference(CZ_MedicationStatement)

* section[referencedDocumentation]
  * insert SectionComRules(
      Referenced documentation,
      This section includes references to other documentation relevant to the current patient care.,
      $loinc#77599-9)
  * entry 0..*
  * entry only Reference(CZ_Logo or DocumentReference)

* section.author only Reference(
  CZ_PractitionerCore or OrderPractitionerRoleCz or CZ_DeviceObserver or
  CZ_PatientCore or CZ_RelatedPersonCore or CZ_OrganizationCore
)

Extension: KOrderRequestReference
Id: korder-composition-requestReference
Title: "K-order Request Reference"
Description: "Reference to the K-order ServiceRequest instance(s) that the Composition documents."
* insert ExtensionContext(Composition)
* insert SetFmmandStatusRule ( 2, trial-use)
* value[x] only Reference(KOrderServiceRequestCz)
