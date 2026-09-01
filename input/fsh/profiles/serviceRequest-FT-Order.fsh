Profile: FTServiceRequestCz
Parent: ServiceRequest
Id: FTServiceRequestCz
Title: "FT (CZ) – ServiceRequest"
Description: """
Národní profil ServiceRequest pro eŽádanku fyzioterapie (FT).
Zachovává strukturu KOrderServiceRequestCz, ale:
- code je VZP výkon (1 ServiceRequest = 1 řádek poukazu)
- quantity[x] je povinné (např. 12×)
- category je FT kategorie (VS pro FT)
"""
* ^publisher = "HL7 CZ"
* ^copyright = "HL7 CZ"

* . ^short = "FT ServiceRequest"
* . ^definition = "ServiceRequest reprezentuje jeden požadovaný FT výkon (1 řádek). Více výkonů = více ServiceRequest v jedné Composition."

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
    CZ_RelatedPersonCore or CZ_PractitionerRoleOrder or CZ_OrganizationCore
)
* extension contains $bodySite-reference named bodySite 0..1
* extension[bodySite].valueReference only Reference(BodyStructureCzCore)

// NOTE: zachovávám název basedOnComposition, ale opravím typ na Composition (pokud máte extension takto myšlenou)
* extension[basedOnComposition].valueReference only Reference(FTServiceRequestCz)

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
* requester only Reference(CZ_PractitionerRoleOrder)

* performer 0..* MS
* performer ^short = "Cílový příjemce (pracoviště / poskytovatel FT)"
* performer only Reference(
    CZ_PractitionerCore or CZ_PractitionerRoleOrder or CZ_OrganizationCore
)

* locationCode 0..1 MS
* locationCode ^short = "Požadované místo poskytnutí FT, například domácí prostředí pacienta"

// --------------------------- clinical context --------------------------------
* encounter 0..1
* encounter only Reference(CZ_Encounter)

* reasonReference 0..*
* reasonReference only Reference(CZ_ConditionCore)
* reasonReference ^short = "Diagnózy odůvodňující žádanku (volitelné per výkon)"

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
// --------------------------- category / type / code / priority ----------------
* category 0..* 
* category from FTCategoryServiceRequest (extensible)  // nový VS pro FT

* code 1..1 MS
* code.coding from FTOrderProceduresVS (preferred)
* code ^short = "Požadovaný FT výkon (1 řádek poukazu)"

* priority 0..1 MS

// --------------------------- timing / quantity -------------------------------
// Počet FT výkonů je volitelný; pokud je uveden, musí obsahovat hodnotu.
* quantity[x] 0..1 MS
* quantity[x] only Quantity
* quantityQuantity.value 1..1 MS
* quantityQuantity.unit 0..1
* quantityQuantity.code 0..1
* quantityQuantity.system 0..1
// Doporučení: unit/code třeba "x" (pokud si zavedete jednotku)

// occurrence ponechávám stejně jako K-order
* occurrence[x] 0..1 MS

// --------------------------- specimens ---------------------------------------
* specimen 0..*
* specimen only Reference(CZ_Specimen)

// --------------------------- coverage ---------------------------------------
* insurance 0..1
* insurance only Reference(CZ_Coverage)

// --------------------------- notes / attachments ------------------------------
* note 0..*

// --------------------------- workflow links ----------------------------------
* basedOn 0..*
* basedOn only Reference(ServiceRequest)

// --------------------------- body site --------------------------------
* bodySite 0..1
* bodySite from http://hl7.org/fhir/ValueSet/body-site (preferred)

// --------------------------- other resources --------------------------------
* supportingInfo 0..*
* supportingInfo only Reference(Goal)
* supportingInfo ^short = "Clinical goal expected from the requested intervention"
// --------------------------- invariants --------------------------------------
Invariant: ft-code-required
Description: "FT ServiceRequest musí mít vyplněný kód výkonu."
Severity: #error
Expression: "code.coding.exists()"

Invariant: ft-subject-is-patient
Description: "Subjekt žádanky musí být pacient."
Severity: #error
Expression: "subject.resolve().resourceType = 'Patient'"

Invariant: ft-quantity-required
Description: "FT ServiceRequest musí mít vyplněný počet opakování (např. 12×)."
Severity: #error
Expression: "quantity.exists() and quantity.as(Quantity).value.exists()"
