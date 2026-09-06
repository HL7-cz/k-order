// ------------------------- Composition (K-order) -------------------------
Instance: KOrderCompositionExample
InstanceOf: KOrderCompositionCz
Title: "Composition: Kardiologické konzilium pro námahovou dušnost"
Description: """
CZ: Dokumentová Composition neadresné K-žádanky se dvěma požadovanými kardiologickými službami a pneumologem jako dodatečným příjemcem výsledku.
EN: Document Composition of an unaddressed K-order with two requested cardiology services and a pulmonologist as an additional recipient of the result.
"""
Usage: #example
* id = "KOrderCompositionExample"
* status = #final
* date = "2025-02-01T10:15:00+01:00"
* title = "Kardiologicke konzilium pro namahovou dusnost"
* type = $loinc#57133-1
* subject = Reference(Patient-Novak-Petr)
* author[0] = Reference(Practitioner-Author-detail)
* extension[informationRecipient][0].valueReference = Reference(PractitionerRole-Pulmonologist)

* section[coverage].entry[0] = Reference(KOrderCoverage-Example)
* section[orderInformation].entry[0] = Reference(KOrderServiceRequest-1)
* section[orderInformation].entry[1] = Reference(KOrderServiceRequest-2)

* identifier.value = "KORD-COMP-2025-001"

// ------------------------- Condition -------------------------------------
Instance: KOrderCondition-Main
InstanceOf: CZ_ConditionCore
Usage: #example
Description: """
CZ: Klinický stav odůvodňující kardiologickou žádanku.
EN: Clinical condition justifying the cardiology order.
"""
* id = "KOrderCondition-Main"
* subject = Reference(Patient-Novak-Petr)
* code.coding[+] = $sctCZ#267036007
// * code.coding[=].display = "Dusnost"

// ------------------------- ServiceRequests --------------------------------
Instance: KOrderServiceRequest-1
InstanceOf: KOrderServiceRequestCz
Usage: #example
Description: """
CZ: Požadavek na kardiologické konziliární vyšetření.
EN: Request for a cardiology consultation.
"""
* id = "KOrderServiceRequest-1"
* identifier[+].value = "KORD-SR-2025-0001"
* status = #active
* intent = #order
* authoredOn = "2025-02-01T09:50:00+01:00"
* subject = Reference(Patient-Novak-Petr)
* requester = Reference(Practitioner-Author-detail)
// Neadresna zadanka: performer is intentionally omitted.
* code.text = "Kardiologicke konziliarni vysetreni"
* code.coding[+] = $sctCZ#185387006
// * code.coding[=].display = "New patient consultation"
* reasonReference[0] = Reference(KOrderCondition-Main)
Instance: KOrderServiceRequest-2
InstanceOf: KOrderServiceRequestCz
Usage: #example
Description: """
CZ: Požadavek na echokardiografické vyšetření.
EN: Request for echocardiography.
"""
* id = "KOrderServiceRequest-2"
* identifier[+].value = "KORD-SR-2025-0002"
* status = #active
* intent = #order
* authoredOn = "2025-02-01T09:52:00+01:00"
* subject = Reference(Patient-Novak-Petr)
* requester = Reference(Practitioner-Author-detail)
// Neadresna zadanka: performer is intentionally omitted.
* code.text = "Echokardiograficke vysetreni"
* code.coding[+] = $sctCZ#40701008
// * code.coding[=].display = "Echocardiography"
* reasonReference[0] = Reference(KOrderCondition-Main)
// ------------------------- Coverage ---------------------------------------
Instance: KOrderCoverage-Example
InstanceOf: CZ_Coverage
Usage: #example
Description: """
CZ: Údaj o zdravotním pojištění pacienta.
EN: Patient health insurance coverage.
"""
* id = "KOrderCoverage-Example"
* status = #active
* beneficiary = Reference(Patient-Novak-Petr)
* payor[0] = Reference(Organization-Insurance111)
* identifier[+].system = "https://ncez.mzcr.cz/fhir/sid/pojistovna"
* identifier[=].value = "111"

// ------------------------- Bundle (K-Order) -------------------------------
Instance: BundleKOrderExample
InstanceOf: BundleOrderCz
Title: "Příklad 1: Kardiologické konzilium pro námahovou dušnost"
Description: """
CZ: Neadresná K-žádanka praktického lékaře pro námahovou dušnost se SNOMED CT procedurami, kardiologickým konziliem, echokardiografií a pneumologem jako dodatečným příjemcem výsledku.
EN: Unaddressed K-order from a general practitioner for exertional dyspnea, with SNOMED CT procedures, a cardiology consultation, echocardiography, and a pulmonologist as an additional recipient of the result.
"""
Usage: #example
* id = "BundleKOrderExample"
* type = #document
* timestamp = "2025-02-01T10:15:00+01:00"
* identifier.system = "https://hospital.example.cz/korder"
* identifier.value = "KORD-2025-000123"

* entry[0].fullUrl = "https://example.cz/fhir/Composition/KOrderCompositionExample"
* entry[0].resource = KOrderCompositionExample

* entry[+].fullUrl = "https://example.cz/fhir/Patient/48a9d440-4194-42c1-87ad-b5a39020a4d0"
* entry[=].resource = Patient-Novak-Petr

* entry[+].fullUrl = "https://example.cz/fhir/Practitioner/a81e74c9-fe94-4eb1-9233-4c8f0b2d4e3a"
* entry[=].resource = Practitioner-Author

* entry[+].fullUrl = "https://example.cz/fhir/PractitionerRole/2b7e9637-5018-4542-9faf-d5abdee7b849"
* entry[=].resource = Practitioner-Author-detail

* entry[+].fullUrl = "https://example.cz/fhir/Organization/ace081ba-e0a8-4b89-a4a7-c5b7cd3c8169"
* entry[=].resource = Organization-1

* entry[+].fullUrl = "https://example.cz/fhir/Organization/Organization-Insurance111"
* entry[=].resource = Organization-Insurance111

* entry[+].fullUrl = "https://example.cz/fhir/Organization/af2b3114-e872-43b9-9875-cceb39122f7f"
* entry[=].resource = Organization-L1-Odd

* entry[+].fullUrl = "https://example.cz/fhir/Organization/Organization-PulmonologyProvider"
* entry[=].resource = Organization-PulmonologyProvider

* entry[+].fullUrl = "https://example.cz/fhir/Condition/KOrderCondition-Main"
* entry[=].resource = KOrderCondition-Main

* entry[+].fullUrl = "https://example.cz/fhir/ServiceRequest/KOrderServiceRequest-1"
* entry[=].resource = KOrderServiceRequest-1

* entry[+].fullUrl = "https://example.cz/fhir/ServiceRequest/KOrderServiceRequest-2"
* entry[=].resource = KOrderServiceRequest-2

* entry[+].fullUrl = "https://example.cz/fhir/Coverage/KOrderCoverage-Example"
* entry[=].resource = KOrderCoverage-Example

* entry[+].fullUrl = "https://example.cz/fhir/Practitioner/Practitioner-Pulmonologist"
* entry[=].resource = Practitioner-Pulmonologist

* entry[+].fullUrl = "https://example.cz/fhir/PractitionerRole/PractitionerRole-Pulmonologist"
* entry[=].resource = PractitionerRole-Pulmonologist

* entry[+].fullUrl = "https://example.cz/fhir/Organization/Organization-PulmonologyClinic"
* entry[=].resource = Organization-PulmonologyClinic

Instance: Patient-Novak-Petr
InstanceOf: CZ_PatientCore
Usage: #example
Description: """
CZ: Příklad pacienta Petra Nováka s identifikací pomocí českých národních identifikátorů.
EN: Example of patient Petr Novak with identification by Czech national identifiers.
"""

* id = "48a9d440-4194-42c1-87ad-b5a39020a4d0"
* identifier[RID].use = #official
* identifier[RID].system = $cz-patient-rid
* identifier[RID].value = "1597778923"
* identifier[RC].system = $cz-patient-rcis
* identifier[RC].value = "8506151234"
* identifier[CPOJ].system = "https://ncez.mzcr.cz/fhir/sid/cpoj"
* identifier[CPOJ].value = "1118506151234"
* name.text = "Ing. Petr Novak, Ph.D."
* name.family = "Novak"
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
  * text = "Pavlovova 1424/11, 568 02 Svitavy - Predmesti"
  * line[+] = "Pavlovova 1424/11"
  * city = "Svitavy - Predmesti"
  * postalCode = "56802"
  * country = "CZ"
  * country.extension[0].url = "http://hl7.org/fhir/StructureDefinition/iso21090-codedString"
  * country.extension[0].valueCoding.system = "urn:iso:std:iso:3166"
  * country.extension[0].valueCoding.code = #CZ

//-----------------------------------------------------
Instance: Practitioner-Author-detail
InstanceOf: CZ_PractitionerRoleOrder
Usage: #example
Description: """
CZ: Detail role zdravotnického pracovníka.
EN: Healthcare practitioner role detail.
"""

* id = "2b7e9637-5018-4542-9faf-d5abdee7b849"
* practitioner = Reference(Practitioner-Author) "MUDr. Ivan Andel"
* organization = Reference(Organization-L1-Odd) "Ordinace praktickeho lekare"
* code = $cz-nrzp_povolani#L1
* specialty[0].coding[0].system = "https://ncez.mzcr.cz/terminology/CodeSystem/vzp-smluvni-odbornost"
* specialty[0].coding[0].code = #001
* specialty[0].text = "Vseobecne prakticke lekarstvi"
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">MUDr. Ivan Andel, vseobecny prakticky lekar</div>"
* text.status = #generated

Instance: Practitioner-Author
InstanceOf: CZ_PractitionerCore
Usage: #example
Description: """
CZ: Zdravotnický pracovník autora žádanky.
EN: Healthcare practitioner authoring the order.
"""

* id = "a81e74c9-fe94-4eb1-9233-4c8f0b2d4e3a"
* identifier[KRZP].system = $cz-practitioner-krzp
* identifier[KRZP].value = "100000001"
* name.text = "MUDr. Ivan Andel"
* name.family = "Andel"
* name.given[0] = "Ivan"

Instance: Organization-1
InstanceOf: CZ_OrganizationCore
Usage: #example
Description: """
CZ: Příklad organizace poskytovatele zdravotních služeb.
EN: Example of a healthcare service provider organization.
"""
* id = "ace081ba-e0a8-4b89-a4a7-c5b7cd3c8169"
* identifier[KRPZS].system = $cz-organization-krpzs
* identifier[KRPZS].value = "100000001"
* identifier[ICO].system = $cz-organization-ico
* identifier[ICO].value = "12345679"
* identifier[ICZ].system = $cz-organization-icz
* identifier[ICZ].value = "42001000"
* type[0].coding[0] = $cz-drzar#102 "Nemocnice"
* name = "Nemocnice Pod Lipou, a.s."
* telecom[0].system = #phone
* telecom[0].value = "+420800123456"
* telecom[0].use = #work
* address[0].use = #work
* address[0].type = #both
* address[0].line[0] = "Ukazkova 1"
* address[0].city = "Praha"
* address[0].postalCode = "10000"
* address[0].country = "CZ"
* address[0].country.extension[0].url = "http://hl7.org/fhir/StructureDefinition/iso21090-codedString"
* address[0].country.extension[0].valueCoding.system = "urn:iso:std:iso:3166"
* address[0].country.extension[0].valueCoding.code = #CZ

Instance: Organization-Insurance111
InstanceOf: CZ_OrganizationCore
Usage: #example
Description: """
CZ: Zdravotní pojišťovna pacienta.
EN: Patient's health insurer.
"""
* id = "Organization-Insurance111"
* identifier[KP].system = $cz-organization-kp
* identifier[KP].value = "111"
* identifier[ICO].system = $cz-organization-ico
* identifier[ICO].value = "12345687"
* name = "Zdravotni pojistovna Modra reka"

//---------------------------------------------------------------------------------------------------------------
Instance: Organization-L1-Odd
InstanceOf: CZ_OrganizationCore
Usage: #example
Description: """
CZ: Příklad podřízeného pracoviště v hierarchii nemocnice.
EN: Example of a subordinate department within a hospital hierarchy.
"""
* id = "af2b3114-e872-43b9-9875-cceb39122f7f"
* identifier[ICO].system = $cz-organization-ico
* identifier[ICO].value = "12345679"
* identifier[ICZ].system = $cz-organization-icz
* identifier[ICZ].value = "42001000"
* identifier[ICP].system = $cz-organization-icp
* identifier[ICP].value = "42001352"
* name = "Nemocnice Pod Lipou, a.s. - ambulance praktickeho lekare"
* partOf = Reference(Organization-1) "Nemocnice Pod Lipou, a.s."
* telecom[0].system = #phone
* telecom[0].value = "+420800123457"
* telecom[0].use = #work
* address[0]
  * use = #work
  * type = #both
  * line[0] = "Ukazkova 1"
  * city = "Praha"
  * postalCode = "10000"
  * country = "CZ"
  * country.extension[0].url = "http://hl7.org/fhir/StructureDefinition/iso21090-codedString"
  * country.extension[0].valueCoding.system = "urn:iso:std:iso:3166"
  * country.extension[0].valueCoding.code = #CZ

// ------------------------- Additional recipient --------------------------
Instance: Organization-PulmonologyProvider
InstanceOf: CZ_OrganizationCore
Usage: #example
Description: """
CZ: Samostatny poskytovatel zdravotnich sluzeb pneumologickeho dodatecneho prijemce vysledku.
EN: Separate healthcare service provider of the pulmonology additional result recipient.
"""
* id = "Organization-PulmonologyProvider"
* identifier[KRPZS].system = $cz-organization-krpzs
* identifier[KRPZS].value = "100000002"
* identifier[ICO].system = $cz-organization-ico
* identifier[ICO].value = "12345695"
* identifier[ICZ].system = $cz-organization-icz
* identifier[ICZ].value = "42002000"
* type[0].coding[0] = $cz-drzar#102 "Nemocnice"
* name = "Nemocnice U Javoru, a.s."

Instance: Practitioner-Pulmonologist
InstanceOf: CZ_PractitionerCore
Usage: #example
Description: """
CZ: Pneumolog, který obdrží výsledek K-žádanky jako dodatečný příjemce.
EN: Pulmonologist who also receives the K-order result as an additional recipient.
"""
* id = "Practitioner-Pulmonologist"
* identifier[KRZP].system = $cz-practitioner-krzp
* identifier[KRZP].value = "100000002"
* name.text = "MUDr. Jana Novakova"
* name.family = "Novakova"
* name.given[0] = "Jana"

Instance: PractitionerRole-Pulmonologist
InstanceOf: CZ_PractitionerRoleOrder
Usage: #example
Description: """
CZ: Role dodatečného příjemce výsledku.
EN: Role of the additional result recipient.
"""
* id = "PractitionerRole-Pulmonologist"
* practitioner = Reference(Practitioner-Pulmonologist)
* organization = Reference(Organization-PulmonologyClinic)
* code = $cz-nrzp_povolani#L1
* specialty[0].coding[0].system = "https://ncez.mzcr.cz/terminology/CodeSystem/vzp-smluvni-odbornost"
* specialty[0].coding[0].code = #205
* specialty[0].text = "Pneumologie a ftizeologie"

Instance: Organization-PulmonologyClinic
InstanceOf: CZ_OrganizationCore
Usage: #example
Description: """
CZ: Pneumologická ambulance dodatečného příjemce výsledku.
EN: Pulmonology clinic of the additional result recipient.
"""
* id = "Organization-PulmonologyClinic"
* identifier[ICO].system = $cz-organization-ico
* identifier[ICO].value = "12345695"
* identifier[ICZ].system = $cz-organization-icz
* identifier[ICZ].value = "42002000"
* identifier[ICP].system = $cz-organization-icp
* identifier[ICP].value = "42002352"
* name = "Nemocnice U Javoru, a.s. - pneumologicka ambulance"
* partOf = Reference(Organization-PulmonologyProvider) "Nemocnice U Javoru, a.s."
