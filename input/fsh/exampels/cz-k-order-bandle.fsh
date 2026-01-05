// ------------------------- Composition (K-order) -------------------------
Instance: KOrderCompositionExample
InstanceOf: KOrderCompositionCz
Usage: #example
* id = "KOrderCompositionExample"
* status = #final
* date = "2025-02-01T10:15:00+01:00"
* title = "Konziliární žádost – K-order example"
* subject = Reference(Patient-Novak-Petr)
* author[0] = Reference(Practitioner-Author-detail)

// --- Section: Diagnózy ---
// * section[diagnoses].title = "Diagnózy"
// * section[diagnoses].code.text = "A.2 Diagnózy"
// * section[diagnoses].entry[0] = Reference(KOrderCondition-Main)
// * section[diagnoses].entry[1] = Reference(KOrderCondition-Secondary)

// --- Section: Požadovaná vyšetření ---
// * section[requested].title = "Požadovaná vyšetření"
// * section[requested].code.text = "A.4 Požadovaná vyšetření"
* section[examinations].entry[0] = Reference(KOrderServiceRequest-1)
//* section[examinations].entry[1] = Reference(KOrderServiceRequest-2)

// identifier.system je fixed v profilu → nastavuje se jen value
* identifier.value = "KORD-COMP-2025-001"

* type.coding[0].system = "https://ncez.mzcr.cz/fhir/korder/type"
* type.coding[0].code = #KORDER
* type.coding[0].display = "Konziliární žádanka (K-order)"



// ------------------------- Conditions ------------------------------------
Instance: KOrderCondition-Main
InstanceOf: KOrderConditionCz
Usage: #example
* id = "KOrderCondition-Main"
* subject = Reference(Patient-Novak-Petr)
* code.coding[+].system = "http://hl7.org/fhir/sid/icd-10"
* code.coding[=].code = #I10
* code.coding[=].display = "Hypertenze"

Instance: KOrderCondition-Secondary
InstanceOf: KOrderConditionCz
Usage: #example
* id = "KOrderCondition-Secondary"
* subject = Reference(Patient-Novak-Petr)
* code.coding[+].system = "http://hl7.org/fhir/sid/icd-10"
* code.coding[=].code = #E11
* code.coding[=].display = "Diabetes mellitus 2. typu"


// ------------------------- ServiceRequests --------------------------------
Instance: KOrderServiceRequest-1
InstanceOf: KOrderServiceRequestCz
Usage: #example
* id = "KOrderServiceRequest-1"
//* identifier[+].system = "https://hl7.cz/fhir/korder/ids"
* identifier[+].value = "KORD-SR-2025-0001"
* status = #active
* intent = #order
* authoredOn = "2025-02-01T09:50:00+01:00"
* subject = Reference(Patient-Novak-Petr)
* requester = Reference(Practitioner-Author-detail)
* code.text = "Konziliární vyšetření internistou"
* code.coding[+].system = "https://vzp.cz/cis/vykony"
* code.coding[=].code = #09513
* reasonReference[0] = Reference(KOrderCondition-Main)
* category[0].coding[0].system = "https://ncez.mzcr.cz/fhir/korder/category"
* category[0].coding[0].code = #CONSULT
* category[0].coding[0].display = "Konziliární vyšetření"


Instance: KOrderServiceRequest-2
InstanceOf: KOrderServiceRequestCz
Usage: #example
* id = "KOrderServiceRequest-2"
//* identifier[+].system = "https://hl7.cz/fhir/korder/ids"
* identifier[+].value = "KORD-SR-2025-0002"
* status = #active
* intent = #order
* authoredOn = "2025-02-01T09:52:00+01:00"
* subject = Reference(Patient-Novak-Petr)
* requester = Reference(Practitioner-Author-detail)
* code.text = "EKG – kontrolní vyšetření"
* code.coding[+].system = "https://vzp.cz/cis/vykony"
* code.coding[=].code = #08911
* category[0].coding[0].code = #DIAGNOSTIC
* category[0].coding[0].display = "Diagnostické vyšetření"


// ------------------------- Coverage ---------------------------------------
Instance: KOrderCoverage-Example
InstanceOf: CZ_Coverage
Usage: #example
* id = "KOrderCoverage-Example"
* status = #active
* beneficiary = Reference(Patient-Novak-Petr)
* payor[0] = Reference(Organization-1) // uses Organization-1 from your examples
* identifier[+].system = "https://ncez.mzcr.cz/fhir/sid/pojistovna"
* identifier[=].value = "111"

// ------------------------- Attachment (DocumentReference) ------------------
Instance: KOrderAttachment-1
InstanceOf: DocumentReference
Usage: #example
* id = "KOrderAttachment-1"
* status = #current
* content[0].attachment.contentType = #application/pdf
* content[0].attachment.title = "Příloha k žádance"
* content[0].attachment.url = "https://example.cz/files/korder-attachment-1.pdf"

// ------------------------- Bundle (K-Order) -------------------------------
Instance: BundleKOrderExample
InstanceOf: BundleKOrderCz
Usage: #example
* id = "BundleKOrderExample"
* type = #document
* timestamp = "2025-02-01T10:15:00+01:00"
* identifier.system = "https://hospital.example.cz/korder"
* identifier.value = "KORD-2025-000123"

* entry[0].fullUrl = "urn:uuid:KOrderCompositionExample"
* entry[0].resource = KOrderCompositionExample

* entry[+].fullUrl = "urn:uuid:Patient-Novak-Petr"
* entry[+].resource = Patient-Novak-Petr

* entry[+].fullUrl = "urn:uuid:Practitioner-Author-detail"
* entry[+].resource = Practitioner-Author-detail

* entry[+].fullUrl = "urn:uuid:ace081ba-e0a8-4b89-a4a7-c5b7cd3c8169"
* entry[+].resource = Organization-1

* entry[+].fullUrl = "urn:uuid:af2b3114-e872-43b9-9875-cceb39122f7f"
* entry[+].resource = Organization-L1-Odd

* entry[+].fullUrl = "urn:uuid:a4641bd0-34af-4038-a7db-872d08a54df9"
* entry[+].resource = Organization-L1-HOSP

* entry[+].fullUrl = "urn:uuid:KOrderCondition-Main"
* entry[+].resource = KOrderCondition-Main

* entry[+].fullUrl = "urn:uuid:KOrderCondition-Secondary"
* entry[+].resource = KOrderCondition-Secondary

* entry[+].fullUrl = "urn:uuid:KOrderServiceRequest-1"
* entry[+].resource = KOrderServiceRequest-1

* entry[+].fullUrl = "urn:uuid:KOrderServiceRequest-2"
* entry[+].resource = KOrderServiceRequest-2

* entry[+].fullUrl = "urn:uuid:KOrderCoverage-Example"
* entry[+].resource = KOrderCoverage-Example

* entry[+].fullUrl = "urn:uuid:KOrderAttachment-1"
* entry[+].resource = KOrderAttachment-1


Instance: Patient-Novak-Petr
InstanceOf: CZ_PatientCore
Usage: #example
Description: "Example of patient Petr Novak with identification by czech national identifiers (RID, RCIS), registrating healthcare provider and contact information"

* id = "48a9d440-4194-42c1-87ad-b5a39020a4d0"
//* meta.profile[0] = "https://hl7.cz/fhir/core/StructureDefinition/cz-patient-core"
* identifier[+]
  * system = $cz-patient-rid
  * value = "1597778923"
* name.text = "Ing. Petr Novák, Ph.D."
* name.family = "Novák"
* name.given[0] = "Petr"
* name.given[+] = "Pavel"
* telecom[+].system = #phone
* telecom[=].value = "+420777111222"
* telecom[+].system = #email
* telecom[=].value = "novak@example.com"
* gender = #male
* birthDate = "1985-06-15"
* address[+]
  * use = #home
  //* type = #physical
  * text = "Pavlovova 1424/11, 568 02 Svitavy - Předměstí"
  * line[+] = "Pavlovova 1424/11"
  * city = "Svitavy - Předměstí"
  * postalCode = "56802"
  * country = "Česko"
    * extension[countryCode].valueCoding = urn:iso:std:iso:3166#CZ "Czechia"



//-----------------------------------------------------
Instance: Practitioner-Author-detail
InstanceOf: CZ_PractitionerRoleCore
Usage: #example
Description: "practitioner's detail"

* id = "2b7e9637-5018-4542-9faf-d5abdee7b849"
* meta.profile[0] = "https://hl7.cz/fhir/core/StructureDefinition/cz-practitionerrole-core"
* practitioner = Reference(urn:uuid:a81e74c9-fe94-4eb1-9233-4c8f0b2d4e3a) "MUDr. Ivan Anděl"
* organization = Reference(urn:uuid:af2b3114-e872-43b9-9875-cceb39122f7f) "Nemocnice Chrudim"
* code = $cz-nrzp_povolani#L00 "Lékař"
* specialty = $sct#419192003 "Internal medicine"
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">MUDr. Ivan Anděl, interní lékař, Nemocnice Chrudim, Václavská 570, 537 01 Chrudim, tel: +420 603 777 227</div>"
* text.status = #generated

Instance: Organization-1
InstanceOf: CZ_OrganizationCore
Usage: #example
Description: "An example of the organization of a provider"
* id = "ace081ba-e0a8-4b89-a4a7-c5b7cd3c8169"
* identifier[+].system = "https://ncez.mzcr.cz/fhir/sid/krpzs"
* identifier[=].value = "27520536"
//* type[DRZAR] = $cz-drzar#102 "Nemocnice"
* name = "Nemocnice Chrudim"
* telecom.system = #phone
* telecom.value = "+420603853227"
* telecom.use = #work

//---------------------------------------------------------------------------------------------------------------
Instance: Organization-L1-Odd
InstanceOf: CZ_OrganizationCore
Usage: #example
Description: "A minimalist example of a subordinate department within a hospital hierarchy for the purposes of the L1 HDR document. "
* id = "af2b3114-e872-43b9-9875-cceb39122f7f"
* identifier[+].system = "https://ncez.mzcr.cz/fhir/sid/icp"
* identifier[=].value = "12345678"  
* name = "CHIR - Oddělení chirurgie"
* partOf = Reference(urn:uuid:9f7c3d74-2c71-4b92-9a59-2b6f37ecb3d1) "Nemocnice Pardubického kraje, a.s., Chrudimská nemocnice"
* telecom.system = #phone
* telecom.value = "+42060385555"
* address[+]
  * use = #work
  * line[+] = "Václavská 570"
  * city = "Chrudim"
  * postalCode = "53701"
  * country = "Česká republika"
    * extension[countryCode].valueCoding = urn:iso:std:iso:3166#CZ "Czechia"
//---------------------------------------------------------------------------------------------------------------
Instance: Organization-L1-HOSP
InstanceOf: CZ_OrganizationCore
Usage: #example
Description: "A minimalist example of a subordinate department within a hospital hierarchy for the purposes of the L1 HDR document. "
* id = "a4641bd0-34af-4038-a7db-872d08a54df9"
* identifier[+].system = "https://ncez.mzcr.cz/fhir/sid/icp"
* identifier[=].value = "12345678"  
* name = "CHIR-L2 - Lůžková stanice 2"
* partOf = Reference(urn:uuid:af2b3114-e872-43b9-9875-cceb39122f7f) "Chirurgické oddělení - Nemocnice Pardubického kraje, a.s., Chrudimská nemocnice"
* telecom.system = #phone
* telecom.value = "+42060385111"
* address[+]
  * use = #work
  * line[+] = "Václavská 570"
  * city = "Chrudim"
  * postalCode = "53701"
  * country = "Česká republika"
    * extension[countryCode].valueCoding = urn:iso:std:iso:3166#CZ "Czechia"