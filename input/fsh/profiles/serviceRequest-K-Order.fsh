Profile: KOrderServiceRequestCz
Parent: ServiceRequest
Id: KOrderServiceRequestCz
Title: "K-order (CZ) – ServiceRequest"
Description: """
Národní profil ServiceRequest pro K-order (žádanka).
Reprezentuje klinické/technické zadání (požadované vyšetření nebo výkony).
Používá CZ core profily pro Patient, Practitioner, Organization, Coverage a Condition.
"""
* ^publisher = "HL7 CZ"
* ^copyright = "HL7 CZ"

* . ^short = "K-order ServiceRequest"
* . ^definition = "ServiceRequest reprezentuje požadavek na vyšetření nebo výkon v rámci K-order."

* insert SetFmmandStatusRule ( 0, draft )

// --------------------------- identifiers -------------------------------------
* identifier 1..* MS
* identifier.system 1..1 MS
* identifier.value 1..1 MS
* identifier.system = "urn:ietf:rfc:4122" (exactly)

// --------------------------- extensions --------------------------------------
* extension contains
    $information-recipient-url named informationRecipient 0..*
    and CompositionBasedOnOrderOrRequisition named basedOnComposition 0..*

* extension[informationRecipient].valueReference only Reference(
    CZ_PractitionerCore or CZ_DeviceObserver or CZ_PatientCore or
    CZ_RelatedPersonCore or CZ_PractitionerRoleOrder or CZ_OrganizationCore
)

* extension[basedOnComposition].valueReference only Reference(KOrderServiceRequestCz)

// --------------------------- lifecycle / status / intent ---------------------
* status 1..1 MS
* intent 1..1 MS
* intent ^comment = "Use proposal for a recommendation, including a recommendation for hospital admission. Use order for an actual order. Represent each distinct requested service by a separate ServiceRequest. The containing K-order Composition must reference at least one ServiceRequest with intent order in its orderInformation section (k-order-requires-order); a document containing only proposals is not permitted."

* authoredOn 1..1 MS
* authoredOn ^short = "Datum a čas vystavení žádanky"

// --------------------------- subject (patient) -------------------------------
* subject 1..1 MS
* subject only Reference(CZ_PatientCore)
* subject ^short = "Pacient, pro kterého je žádanka určena"

// --------------------------- requester / performer ---------------------------
* requester 1..1 MS
* requester ^short = "Žadatel (lékař / pracoviště)"
* requester only Reference(CZ_PractitionerRoleOrder)

* performer 0..* MS
* performer ^short = "Cílový příjemce (laboratoř / PZS)"
* performer only Reference(
    CZ_PractitionerCore or CZ_PractitionerRoleOrder or CZ_OrganizationCore
)

// --------------------------- clinical context --------------------------------
* encounter 0..1
* encounter only Reference(CZ_Encounter)

* reasonReference 0..*
* reasonReference only Reference(CZ_ConditionCore or CZ_MedicalTestResultCore or CZ_DiagnosticReportCore or DocumentReference)
* reasonReference ^short = "Okolnosti odůvodňující žádanku"

* reasonCode 0..*
* reasonCode ^short = "Slovní/číselné zdůvodnění žádosti"

* reasonCode.coding ^slicing.discriminator[0].type = #value
* reasonCode.coding ^slicing.discriminator[0].path = "system"
* reasonCode.coding ^slicing.rules = #open
* reasonCode.coding contains
    mkn-10 0..1 and
    snomed 0..1 and
    orphacode 0..1
* reasonCode.coding[mkn-10] from $mkn10vs (preferred)
* reasonCode.coding[mkn-10].system = "https://uzis.cz/terminology/CodeSystem/mkn-10"
* reasonCode.coding[snomed] from $sct-condition-code (preferred)
* reasonCode.coding[snomed].system = "http://snomed.info/sct" (exactly)
* reasonCode.coding[orphacode] from $orphanet-vs (preferred)
* reasonCode.coding[orphacode].system = "https://www.orpha.net" (exactly)

// --------------------------- type / code / priority ---------------------------------

* code 1..1 MS
* code.coding from KOrderProceduresVS (preferred)
* code ^short = "Požadované vyšetření/výkon"
* code ^comment = "A hospital admission or transfer of care is a separate requested service, recorded in its own ServiceRequest.code. If no agreed code is available, use code.text; do not introduce a disposition extension or a local code list to represent the request."

* priority 0..1 MS
// Česky překlad v lokalním VS KOrderPriorityVS
//* priority from KOrderPriorityVS (required)

// --------------------------- timing / quantity -------------------------------
* occurrence[x] 0..1 MS


// --------------------------- specimens ---------------------------------------
* specimen 0..*
* specimen only Reference(CZ_Specimen)

// --------------------------- coverage ---------------------------------------
* insurance 0..1
* insurance only Reference(CZ_CoverageOrder)

// --------------------------- notes / attachments ------------------------------
* note 0..*

// --------------------------- supporting clinical information -----------------
* supportingInfo 0..*
* supportingInfo only Reference(CZ_MedicationAdministrationCore or CZ_MedicationStatementCore or CZ_ImmunizationCore or CZ_MedicalTestResultCore or CZ_ConditionCore or CZ_AllergyIntolerance or CZ_DeviceUseStatementCore or CZ_FlagPatientCore or CZ_CarePlanCore or Goal)
* supportingInfo ^slicing.discriminator[0].type = #profile
* supportingInfo ^slicing.discriminator[0].path = "resolve()"
* supportingInfo ^slicing.rules = #open
* supportingInfo contains
    anthropometric 0..* and
    mobility 0..1
* supportingInfo[anthropometric] only Reference(CZ_Anthropometric_Test_Result)
* supportingInfo[mobility] only Reference(CZ_PatientMobility)
* insert OrderServiceRequestSupportingInformation


// --------------------------- workflow links ----------------------------------
* basedOn 0..*
//* basedOn only Reference(KOrderServiceRequestCz)

// code 1..1 permits a coded concept or a textual description in code.text.
// subject only Reference(CZ_PatientCore) constrains the subject to a patient.
