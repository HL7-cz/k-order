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
* identifier 1..1 MS
* identifier ^short = "Identifikátor eŽádanky (UUID)"
* identifier.system 1..1 MS
* identifier.value 1..1 MS
* identifier.system = "urn:ietf:rfc:4122" (exactly)

// --------------------------- extensions --------------------------------------
* extension contains
    $information-recipient-url named informationRecipient 0..*
    and CompositionBasedOnOrderOrRequisition named basedOnComposition 0..*

* extension[informationRecipient].valueReference only Reference(
    CZ_PractitionerCore or CZ_DeviceObserver or CZ_PatientCore or 
    CZ_RelatedPersonCore or CZ_PractitionerRoleCore or CZ_OrganizationCore
)

* extension[basedOnComposition].valueReference only Reference(KOrderServiceRequestCz)




// --------------------------- lifecycle / status / intent ---------------------
* status 1..1 MS
* intent 1..1 MS

* authoredOn 1..1 MS
* authoredOn ^short = "Datum a čas vystavení žádanky"

// --------------------------- subject (patient) -------------------------------
* subject 1..1 MS
* subject only Reference(CZ_PatientCore)
* subject ^short = "Pacient, pro kterého je žádanka určena"

// --------------------------- requester / performer ---------------------------
* requester 1..1 MS
* requester ^short = "Žadatel (lékař / pracoviště)"
* requester only Reference(
    CZ_PractitionerCore or CZ_PractitionerRoleCore or CZ_OrganizationCore
)

* performer 0..* MS
* performer ^short = "Cílový příjemce (laboratoř / PZS)"
* performer only Reference(
    CZ_PractitionerCore or CZ_PractitionerRoleCore or CZ_OrganizationCore
)

// --------------------------- clinical context --------------------------------
* encounter 0..1
* encounter only Reference(CZ_Encounter)

* reasonReference 0..*
* reasonReference only Reference(KOrderConditionCz)
* reasonReference ^short = "Diagnózy odůvodňující žádanku"

* reasonCode 0..*
* reasonCode ^short = "Slovní/číselné zdůvodnění žádosti"

// --------------------------- category / type / code / priority ----------------------
* category 1..1 MS
* category from KOrderCategoryVS (extensible)


* code 1..1 MS
* code from KOrderProceduresVS (extensible)  // K Order Procedures ValueSet? 
* code ^short = "Požadované vyšetření/výkon"

* priority 0..1 MS
// Česky překlad v lokalním VS KOrderPriorityVS
//* priority from KOrderPriorityVS (required)

// --------------------------- timing / quantity -------------------------------
* occurrence[x] 0..1 MS


// --------------------------- specimens ---------------------------------------
* specimen 0..*
* specimen only Reference(CZ_Specimen)

// --------------------------- insurance ---------------------------------------
* insurance 0..1
* insurance only Reference(CZ_Coverage)

// --------------------------- notes / attachments ------------------------------
* note 0..*


// --------------------------- workflow links ----------------------------------
* basedOn 0..*
* basedOn only Reference(KOrderServiceRequestCz)

// --------------------------- invariants --------------------------------------
Invariant: code-required
Description: "K-order musí mít vyplněný kód vyšetření/výkonu."
Severity: #error
Expression: "code.coding.exists()"

Invariant: subject-is-patient
Description: "Subjekt žádanky musí být pacient."
Severity: #error
Expression: "subject.resolve().resourceType = 'Patient'"
