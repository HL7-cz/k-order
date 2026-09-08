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
    orderInformation 1..1 MS and
    coverage 1..1 MS and
    appointment 0..1 MS and
    reasons 0..1 MS and
    supportingInformation 0..1 MS and
    medicalDevices 0..* MS and
    attachments 0..* MS and
    signature 0..1 MS and
    goals 0..1 MS

* section[coverage]
  * ^short = "Coverage for the requested services"
  * ^definition = "References to Coverage resources applicable to payment or reimbursement of the requested healthcare services."
  * code = $loinc#87520-3
  * title = "coverage"
  * entry 1..*
  * entry only Reference(CZ_Coverage)

* section[reasons]
  * ^short = "Clinical indication for physiotherapy"
  * ^definition = "Narrative description of the clinical indication and justification for the requested physiotherapy. Structured diagnoses and clinical findings are referenced from the supporting information section."
  * code = $loinc#29299-5
  * title = "Clinical justification"
  * text 0..1 MS
  * entry 0..0

* section[medicalDevices]
  * ^short = "Relevant medical devices and implants"
  * ^definition = "References to DeviceUseStatement resources describing implants or other medical devices relevant to the requested care. Device identification and properties are recorded in the referenced Device resource."
  * ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-explicit-type-name"
  * ^extension[0].valueString = "Section"
  * code = $loinc#97813-0
  * entry 1..*
  * entry only Reference(CZ_DeviceUseStatement)

* section[supportingInformation]
  * ^short = "Clinical information supporting the order"
  * ^definition = "References to clinical information relevant to assessing planning or providing the requested care including measurements conditions medication allergies warnings mobility physical findings encounters immunizations and additional observations."
  * ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-explicit-type-name"
  * ^extension[0].valueString = "Section"
  * code = $loinc#55752-0
  * entry 0..
  * entry only Reference(CZ_MedicationStatementCore or CZ_ObservationOrder or CZ_BodyHeight or CZ_BodyWeight or CZ_ConditionCore or CZ_AllergyIntolerance or CZ_Flag or CZ_PatientMobility or CZ_PhysicalFindingOrder or CZ_AdditionalObservationOrder or CZ_Encounter or CZ_ImmunizationCore or CZ_CarePlanCore)
  * entry ^slicing.discriminator[0].type = #profile
  * entry ^slicing.discriminator[0].path = "resolve()"
  * entry ^slicing.rules = #open
  * entry contains
      bodyHeight 0..1 and
      bodyWeight 0..1 and
      relevantCondition 0..* and
      medication 0..* and
      allergyIntolerance 0..* and
      warning 0..* and
      mobility 0..1 and
      physicalFinding 0..* and
      hospitalization 0..* and
      immunization 0..* and
      additionalObservation 0..*
  * entry[bodyHeight] only Reference(CZ_BodyHeight)
  * entry[bodyWeight] only Reference(CZ_BodyWeight)
  * entry[relevantCondition] only Reference(CZ_ConditionCore)
  * entry[medication] only Reference(CZ_MedicationStatementCore)
  * entry[allergyIntolerance] only Reference(CZ_AllergyIntolerance)
  * entry[warning] only Reference(CZ_Flag)
  * entry[mobility] only Reference(CZ_PatientMobility)
  * entry[physicalFinding] only Reference(CZ_PhysicalFindingOrder)
  * entry[hospitalization] only Reference(CZ_Encounter)
  * entry[immunization] only Reference(CZ_ImmunizationCore)
  * entry[additionalObservation] only Reference(CZ_AdditionalObservationOrder)

* section[orderInformation]
  * ^short = "Requested physiotherapy services"
  * ^definition = "References to FT ServiceRequest resources specifying the requested physiotherapy. A general request may use the general SNOMED CT physical therapy procedure when individual procedures are to be selected by the physiotherapist."
  * code = $loinc#57154-7
  * title = "Requested physiotherapy procedures"
  * entry 1..*
  * entry only Reference(FTServiceRequestCz)

* section[appointment]
  * ^short = "Scheduled appointment"
  * ^definition = "References the appointment associated with the requested physiotherapy service when a date has already been scheduled."
  * ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-explicit-type-name"
  * ^extension[0].valueString = "Section"
  * code = $loinc#56446-8
  * entry 0..
  * entry only Reference(CZ_AppointmentCore)

* section[attachments]
  * ^short = "Documents attached to the order"
  * ^definition = "References to DocumentReference resources containing reports images or other documents supplied with the order."
  * code = $loinc#55107-7
  * title = "Attachments"
  * entry 0..*
  * entry only Reference(CZ_Attachment)

* section[signature]
  * ^short = "Document signature and provenance"
  * ^definition = "Reference to a Provenance resource containing the electronic signature and provenance information for the order document."
  * code = $loinc#64292-6
  * title = "Signature"
  * entry 0..1
  * entry only Reference(CZ_Provenance)

* section[goals]
  * insert SectionComRules(
      Expected goals of physiotherapy,
      References to Goal resources describing the patient-specific functional or clinical outcomes expected from the requested physiotherapy.,
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
