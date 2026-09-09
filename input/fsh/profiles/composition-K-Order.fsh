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
    significantMedicalHistory 0..1 MS and
    examinationResults 0..1 MS and
    differentialDiagnosis 0..1 MS and
    currentTreatment 0..1 MS and
    supportingInformation 0..1 MS and
    medicalDevices 0..* MS and
    referencedDocumentation 0..1 MS and
    attachments 0..* MS and
    signature 0..1 MS

* section[coverage]
  * ^short = "Coverage for the requested services"
  * ^definition = "References to Coverage resources applicable to payment or reimbursement of the requested healthcare services."
  * code = $loinc#87520-3
  * title = "coverage"
  * entry 1..*
  * entry only Reference(CZ_Coverage)
/*
* section[reasons].code = $loinc#29299-5
* section[reasons].title = "Clinical justification"
* section[reasons].text 0..1 MS
* section[reasons].entry 0..0
*/
* section[orderInformation]
  * ^short = "Requested consultation services"
  * ^definition = "References to K ServiceRequest resources representing the consultation or other healthcare services requested by this order."
  * code = $loinc#57133-1
  * title = "Requested orderInformation"
  * entry 1..*
  * entry only Reference(KOrderServiceRequestCz)

* section[appointment]
  * ^short = "Scheduled appointment"
  * ^definition = "References the appointment associated with the requested healthcare service when a date has already been scheduled."
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

* section[significantMedicalHistory]
  * insert SectionComRules(
      Relevant medical history,
      References to established past or long-term conditions that may affect assessment or provision of the requested care.,
      $loinc#11348-0)
  * entry 0..*
  * entry only Reference(CZ_ConditionCore)

* section[examinationResults]
  * insert SectionComRules(
      Relevant diagnostic tests,
      References to DiagnosticReport resources containing completed examinations or diagnostic results relevant to the request.,
      $loinc#30954-2)
  * entry 0..*
  * entry only Reference(diagnosticReport-cz-core)

* section[differentialDiagnosis]
  * insert SectionComRules(
      Suspected or differential diagnoses,
      References to Condition resources representing suspected diagnoses or diagnostic alternatives to be considered by the requested consultation.,
      $loinc#51848-0)
  * entry 0..*
  * entry only Reference(CZ_ConditionCore)  

* section[currentTreatment]
  * insert SectionComRules(
      Current medication and treatment,
      References to MedicationStatement resources describing medication currently taken by the patient and relevant to the requested consultation.,
      $loinc#11506-3)
  * entry 0..*
  * entry only Reference(CZ_MedicationStatementCore)

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
  * ^definition = "References to other clinical information relevant to assessing planning or providing the requested care including measurements current conditions medication allergies warnings mobility physical findings encounters immunizations and additional observations. Established medical history suspected diagnoses and current treatment should preferably be placed in their dedicated sections."
  * ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-explicit-type-name"
  * ^extension[0].valueString = "Section"
  * code = $loinc#55752-0
  * entry 0..
  * entry only Reference(CZ_MedicationStatementCore or CZ_BodyHeight or CZ_BodyWeight or CZ_ConditionCore or CZ_AllergyIntolerance or CZ_FlagPatientCore or CZ_PatientMobility or CZ_PhysicalFindingOrder or CZ_MedicalTestResultCore or CZ_Encounter or CZ_ImmunizationCore or CZ_CarePlanCore)
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
      immunization 0..*
  * entry[bodyHeight] only Reference(CZ_BodyHeight)
  * entry[bodyWeight] only Reference(CZ_BodyWeight)
  * entry[relevantCondition] only Reference(CZ_ConditionCore)
  * entry[medication] only Reference(CZ_MedicationStatementCore)
  * entry[allergyIntolerance] only Reference(CZ_AllergyIntolerance)
  * entry[warning] only Reference(CZ_FlagPatientCore)
  * entry[mobility] only Reference(CZ_PatientMobility)
  * entry[physicalFinding] only Reference(CZ_PhysicalFindingOrder)
  * entry[hospitalization] only Reference(CZ_Encounter)
  * entry[immunization] only Reference(CZ_ImmunizationCore)

* section[referencedDocumentation]
  * insert SectionComRules(
      Referenced clinical documentation,
      References to existing clinical documents relevant to the request that are not transmitted as direct attachments.,
      $loinc#77599-9)
  * entry 0..*
  * entry only Reference(CZ_Logo or DocumentReference)

* section.author only Reference(
  CZ_PractitionerCore or CZ_PractitionerRoleOrder or CZ_DeviceObserver or
  CZ_PatientCore or CZ_RelatedPersonCore or CZ_OrganizationCore
)

* insert OrderCompositionSupportingInformation
* section[supportingInformation] ^definition = "Clinical context supporting the K-order as a whole, including measurements, conditions, medication, allergies, alerts, mobility, examination findings, encounters, immunizations and care plans. Prefer significantMedicalHistory for established history, differentialDiagnosis for diagnostic alternatives, currentTreatment for medication, examinationResults for DiagnosticReport resources and medicalDevices for device use. Use this section for other relevant context and link resources to individual services through ServiceRequest.supportingInfo where appropriate."
* section[significantMedicalHistory] ^comment = "Use this section for established historical or long-term conditions. If such a condition also affects a specific service, reference the same Condition from that ServiceRequest.supportingInfo[relevantCondition]. If it is the direct indication, use ServiceRequest.reasonReference."
* section[differentialDiagnosis] ^comment = "Use this section for suspected diagnoses or diagnostic alternatives and preserve their verification status in Condition. Distinguish them from established medical history. Link the Condition through ServiceRequest.reasonReference when it directly motivates the requested assessment."
* section[currentTreatment] ^comment = "Prefer this section for medication in the document presentation. The same MedicationStatement may be referenced from ServiceRequest.supportingInfo[medication] when relevant to an individual service."
* section[examinationResults] ^comment = "This section accepts DiagnosticReport resources. Reference individual laboratory measurements through the declared general Observation profile in supportingInformation and, where relevant, ServiceRequest.supportingInfo. DiagnosticReport itself is not an allowed supportingInfo target in these ServiceRequest profiles."

Extension: KOrderRequestReference
Id: korder-composition-requestReference
Title: "K-order Request Reference"
Description: "Reference to the K-order ServiceRequest instance(s) that the Composition documents."
* insert ExtensionContext(Composition)
* insert SetFmmandStatusRule ( 2, trial-use)
* value[x] only Reference(KOrderServiceRequestCz)
