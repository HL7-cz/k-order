// Additional FT-order clinical examples. Shared insurer and provider instances
// are declared in cz-k-order-bandle.fsh.

// ------------------------- Example 1: hip arthroplasty rehabilitation -------------------------
Instance: Patient-FTHipRehabilitation
InstanceOf: CZ_PatientCore
Usage: #example
Description: """
CZ: Pacient po totální endoprotéze kyčle.
EN: Patient after total hip arthroplasty.
"""
* id = "Patient-FTHipRehabilitation"
* identifier[RID].use = #official
* identifier[RID].system = $cz-patient-rid
* identifier[RID].value = "1000000101"
* identifier[RC].system = $cz-patient-rcis
* identifier[RC].value = "5804221234"
* identifier[CPOJ].system = "https://ncez.mzcr.cz/fhir/sid/cpoj"
* identifier[CPOJ].value = "1115804221234"
* name.family = "Dvorak"
* name.given[0] = "Karel"
* gender = #male
* birthDate = "1958-04-22"
* extension[birthPlace].valueAddress.city = "Hradec Králové"
* extension[birthPlace].valueAddress.country = "CZ"
* extension[birthPlace].valueAddress.country.extension[0].url = "http://hl7.org/fhir/StructureDefinition/iso21090-codedString"
* extension[birthPlace].valueAddress.country.extension[0].valueCoding.system = "urn:iso:std:iso:3166"
* extension[birthPlace].valueAddress.country.extension[0].valueCoding.code = #CZ
* address[0].use = #home
* address[0].type = #physical
* address[0].text = "Lipová 24, 500 02 Hradec Králové"
* address[0].line[0] = "Lipová 24"
* address[0].city = "Hradec Králové"
* address[0].postalCode = "50002"
* address[0].country = "CZ"
* address[0].country.extension[0].url = "http://hl7.org/fhir/StructureDefinition/iso21090-codedString"
* address[0].country.extension[0].valueCoding.system = "urn:iso:std:iso:3166"
* address[0].country.extension[0].valueCoding.code = #CZ
* address[1].use = #work
* address[1].type = #physical
* address[1].text = "Průmyslová 18, 500 03 Hradec Králové"
* address[1].line[0] = "Průmyslová 18"
* address[1].city = "Hradec Králové"
* address[1].postalCode = "50003"
* address[1].country = "CZ"
* address[1].country.extension[0].url = "http://hl7.org/fhir/StructureDefinition/iso21090-codedString"
* address[1].country.extension[0].valueCoding.system = "urn:iso:std:iso:3166"
* address[1].country.extension[0].valueCoding.code = #CZ
* telecom[0].system = #phone
* telecom[0].value = "+420777111222"
* telecom[0].use = #mobile
* telecom[1].system = #email
* telecom[1].value = "karel.dvorak@example.cz"
* communication[0].language.coding[0].system = "urn:ietf:bcp:47"
* communication[0].language.coding[0].code = #cs
* communication[0].language.text = "čeština"
* communication[0].preferred = true
* generalPractitioner[0] = Reference(PractitionerRole-FTGeneralPractitioner)
* managingOrganization = Reference(Organization-L1-Odd)
* extension[registeringProvider].extension[value].valueReference = Reference(PractitionerRole-FTGeneralPractitioner)
* extension[registeringProvider].extension[category].valueCodeableConcept.coding[0] = $sctCZ#700232004

Instance: Condition-FTHipArthroplasty
InstanceOf: CZ_ConditionCore
Usage: #example
Description: """
CZ: Stav po náhradě kyčelního kloubu.
EN: Status after hip joint replacement.
"""
* id = "Condition-FTHipArthroplasty"
* subject = Reference(Patient-FTHipRehabilitation)
* code.coding[0] = $mkn10#Z47 //Z471 není v terminologii MKN10, proto je použita kódová skupina Z47
* code.text = "Následná péče po náhradě kloubu"

Instance: PractitionerRole-FTGeneralPractitioner
InstanceOf: CZ_PractitionerRoleOrder
Usage: #example
Description: """
CZ: Role registrujícího všeobecného praktického lékaře pacienta.
EN: Role of the patient's registering general practitioner.
"""
* id = "PractitionerRole-FTGeneralPractitioner"
* practitioner = Reference(Practitioner-Author)
* organization = Reference(Organization-L1-Odd)
* code = $cz-nrzp_povolani#L1
* specialty[0].coding[0].system = "https://ncez.mzcr.cz/terminology/CodeSystem/vzp-smluvni-odbornost"
* specialty[0].coding[0].code = #001
* specialty[0].text = "Všeobecné praktické lékařství"

Instance: Observation-FTHipMobility
InstanceOf: CZ_PatientMobility
Usage: #example
Description: """
CZ: Snížená mobilita pacienta po operaci kyčle.
EN: Reduced patient mobility after hip surgery.
"""
* id = "Observation-FTHipMobility"
* status = #final
* category[0].coding[0].system = "http://terminology.hl7.org/CodeSystem/observation-category"
* category[0].coding[0].code = #exam
* subject = Reference(Patient-FTHipRehabilitation)
* performer[0] = Reference(PractitionerRole-Orthopedist)
* effectiveDateTime = "2026-09-04T08:30:00+02:00"
* code.coding[SNOMEDCT] = $sctCZ#282870005
* valueCodeableConcept.coding[0] = $sctCZ#282873007

Instance: Device-FTHipImplant
InstanceOf: CZ_MedicalDevice
Usage: #example
Description: """
CZ: Totální endoprotéza levého kyčelního kloubu.
EN: Total hip prosthesis of the left hip joint.
"""
* id = "Device-FTHipImplant"
* patient = Reference(Patient-FTHipRehabilitation)
* type.text = "Totální endoprotéza levého kyčelního kloubu"
* deviceName[0].name = "Kyčelní endoprotéza"
* deviceName[0].type = #user-friendly-name

Instance: Goal-FTHipRehabilitation
InstanceOf: Goal
Usage: #example
Description: """
CZ: Cíl rehabilitace po náhradě kyčelního kloubu.
EN: Rehabilitation goal after hip joint replacement.
"""
* id = "Goal-FTHipRehabilitation"
* lifecycleStatus = #active
* description.text = "Obnovení bezpečné chůze s postupným zatěžováním levé dolní končetiny"
* subject = Reference(Patient-FTHipRehabilitation)

Instance: Organization-OrthopedicsClinic
InstanceOf: CZ_OrganizationCore
Usage: #example
Description: """
CZ: Ortopedická ambulance poskytovatele zdravotních služeb.
EN: Orthopedic clinic of the healthcare service provider.
"""
* id = "Organization-OrthopedicsClinic"
* identifier[ICO].system = $cz-organization-ico
* identifier[ICO].value = "12345679"
* identifier[ICZ].system = $cz-organization-icz
* identifier[ICZ].value = "42001000"
* identifier[ICP].system = $cz-organization-icp
* identifier[ICP].value = "42001356"
* name = "Nemocnice Pod Lipou - ortopedická ambulance"
* partOf = Reference(Organization-1) "Nemocnice Pod Lipou, a.s."

Instance: Practitioner-Orthopedist
InstanceOf: CZ_PractitionerCore
Usage: #example
Description: """
CZ: Ortoped vystavující FT žádanku.
EN: Orthopedist authoring the FT order.
"""
* id = "Practitioner-Orthopedist"
* identifier[KRZP].system = $cz-practitioner-krzp
* identifier[KRZP].value = "100000010"
* name.family = "Horak"
* name.given[0] = "Milan"
* name.prefix[0] = "MUDr."

Instance: PractitionerRole-Orthopedist
InstanceOf: CZ_PractitionerRoleOrder
Usage: #example
Description: """
CZ: Role ortopeda v ortopedické ambulanci.
EN: Orthopedist role at the orthopedic clinic.
"""
* id = "PractitionerRole-Orthopedist"
* practitioner = Reference(Practitioner-Orthopedist)
* organization = Reference(Organization-OrthopedicsClinic)
* code = $cz-nrzp_povolani#L1
* specialty[0].coding[0].system = "https://ncez.mzcr.cz/terminology/CodeSystem/vzp-smluvni-odbornost"
* specialty[0].coding[0].code = #106
* specialty[0].text = "Ortopedie"

Instance: Coverage-FTHipRehabilitation
InstanceOf: CZ_Coverage
Usage: #example
Description: """
CZ: Zdravotní pojištění pacienta po náhradě kyčelního kloubu.
EN: Health insurance coverage for the patient after hip joint replacement.
"""
* id = "Coverage-FTHipRehabilitation"
* status = #active
* beneficiary = Reference(Patient-FTHipRehabilitation)
* payor[0] = Reference(Organization-Insurance111)
* identifier[0].system = "https://ncez.mzcr.cz/fhir/sid/pojistovna"
* identifier[0].value = "111"

Instance: FTServiceRequest-HipRehabilitation
InstanceOf: FTServiceRequestCz
Usage: #example
Description: """
CZ: Neadresný požadavek na mobilizační a cvičebnou fyzioterapii po TEP kyčle.
EN: Unaddressed request for mobilization and exercise physiotherapy after hip arthroplasty.
"""
* id = "FTServiceRequest-HipRehabilitation"
* identifier.value = "6a77187d-7e74-4fce-b604-bad9b2840101"
* status = #active
* intent = #order
* authoredOn = "2026-09-04T09:00:00+02:00"
* subject = Reference(Patient-FTHipRehabilitation)
* requester = Reference(PractitionerRole-Orthopedist)
* code.coding[0] = $sctCZ#62868009
* code.coding[+] = $sctCZ#229065009
* code.text = "Mobilizační a cvičebná fyzioterapie"
* reasonReference[0] = Reference(Condition-FTHipArthroplasty)
* supportingInfo[0] = Reference(Goal-FTHipRehabilitation)
* insurance = Reference(Coverage-FTHipRehabilitation)
* note[0].text = "Operace levé kyčle dne 2026-08-20. Povolené zatěžování levé dolní končetiny do 50 % tělesné hmotnosti. Pracoviště fyzioterapie volí pacient podle bydliště."

Instance: FTCompositionHipRehabilitation
InstanceOf: FTOrderCompositionCz
Usage: #example
Description: """
CZ: Neadresná FT žádanka po totální endoprotéze kyčle.
EN: Unaddressed FT order after total hip arthroplasty.
"""
* id = "FTCompositionHipRehabilitation"
* status = #final
* date = "2026-09-04T09:05:00+02:00"
* title = "Fyzioterapie po totální endoprotéze kyčle"
* type = $loinc#57154-7
* subject = Reference(Patient-FTHipRehabilitation)
* author[0] = Reference(PractitionerRole-Orthopedist)
* identifier.value = "6a77187d-7e74-4fce-b604-bad9b2840102"
* section[coverage].entry[0] = Reference(Coverage-FTHipRehabilitation)
* section[orderInformation].entry[0] = Reference(FTServiceRequest-HipRehabilitation)
* section[reasons].text.status = #generated
* section[reasons].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Stav po TEP levé kyčle dne 2026-08-20. Povolené zatěžování levé dolní končetiny do 50 % tělesné hmotnosti. Implantát: totální endoprotéza levého kyčelního kloubu.</div>"
* section[supportingInformation].entry[mobility] = Reference(Observation-FTHipMobility)
* section[supportingInformation].entry[+] = Reference(Device-FTHipImplant)
* section[goals].title = "Cíle terapie"
* section[goals].entry[0] = Reference(Goal-FTHipRehabilitation)

Instance: BundleFTHipRehabilitation
InstanceOf: BundleOrderCz
Usage: #example
Title: "Příklad FT 1: Rehabilitace po totální endoprotéze kyčle"
Description: """
CZ: Neadresná FT žádanka po TEP kyčle se sníženou mobilitou a implantátem.
EN: Unaddressed FT order after hip arthroplasty with reduced mobility and an implant.
"""
* id = "BundleFTHipRehabilitation"
* type = #document
* timestamp = "2026-09-04T09:05:00+02:00"
* identifier.system = "https://hl7.cz/fhir/order/sid/document"
* identifier.value = "FTHIP-2026-0001"
* entry[0].fullUrl = "https://example.cz/fhir/Composition/FTCompositionHipRehabilitation"
* entry[0].resource = FTCompositionHipRehabilitation
* entry[+].fullUrl = "https://example.cz/fhir/Patient/Patient-FTHipRehabilitation"
* entry[=].resource = Patient-FTHipRehabilitation
* entry[+].fullUrl = "https://example.cz/fhir/Practitioner/a81e74c9-fe94-4eb1-9233-4c8f0b2d4e3a"
* entry[=].resource = Practitioner-Author
* entry[+].fullUrl = "https://example.cz/fhir/PractitionerRole/PractitionerRole-FTGeneralPractitioner"
* entry[=].resource = PractitionerRole-FTGeneralPractitioner
* entry[+].fullUrl = "https://example.cz/fhir/Organization/af2b3114-e872-43b9-9875-cceb39122f7f"
* entry[=].resource = Organization-L1-Odd
* entry[+].fullUrl = "https://example.cz/fhir/Practitioner/Practitioner-Orthopedist"
* entry[=].resource = Practitioner-Orthopedist
* entry[+].fullUrl = "https://example.cz/fhir/PractitionerRole/PractitionerRole-Orthopedist"
* entry[=].resource = PractitionerRole-Orthopedist
* entry[+].fullUrl = "https://example.cz/fhir/Organization/Organization-OrthopedicsClinic"
* entry[=].resource = Organization-OrthopedicsClinic
* entry[+].fullUrl = "https://example.cz/fhir/Organization/ace081ba-e0a8-4b89-a4a7-c5b7cd3c8169"
* entry[=].resource = Organization-1
* entry[+].fullUrl = "https://example.cz/fhir/Organization/Organization-Insurance111"
* entry[=].resource = Organization-Insurance111
* entry[+].fullUrl = "https://example.cz/fhir/Coverage/Coverage-FTHipRehabilitation"
* entry[=].resource = Coverage-FTHipRehabilitation
* entry[+].fullUrl = "https://example.cz/fhir/Condition/Condition-FTHipArthroplasty"
* entry[=].resource = Condition-FTHipArthroplasty
* entry[+].fullUrl = "https://example.cz/fhir/ServiceRequest/FTServiceRequest-HipRehabilitation"
* entry[=].resource = FTServiceRequest-HipRehabilitation
* entry[+].fullUrl = "https://example.cz/fhir/Observation/Observation-FTHipMobility"
* entry[=].resource = Observation-FTHipMobility
* entry[+].fullUrl = "https://example.cz/fhir/Device/Device-FTHipImplant"
* entry[=].resource = Device-FTHipImplant
* entry[+].fullUrl = "https://example.cz/fhir/Goal/Goal-FTHipRehabilitation"
* entry[=].resource = Goal-FTHipRehabilitation

// ------------------------- Example 2: respiratory physiotherapy at home -------------------------
Instance: Patient-FTCopdHomeCare
InstanceOf: CZ_PatientCore
Usage: #example
Description: """
CZ: Imobilní pacient s CHOPN na domácí oxygenoterapii.
EN: Immobile patient with COPD receiving home oxygen therapy.
"""
* id = "Patient-FTCopdHomeCare"
* identifier[RID].use = #official
* identifier[RID].system = $cz-patient-rid
* identifier[RID].value = "1000000102"
* identifier[RC].system = $cz-patient-rcis
* identifier[RC].value = "4711031234"
* identifier[CPOJ].system = "https://ncez.mzcr.cz/fhir/sid/cpoj"
* identifier[CPOJ].value = "1114711031234"
* name.family = "Kratochvil"
* name.given[0] = "Josef"
* gender = #male
* birthDate = "1947-11-03"
* extension[birthPlace].valueAddress.city = "Pardubice"
* extension[birthPlace].valueAddress.country = "CZ"
* extension[birthPlace].valueAddress.country.extension[0].url = "http://hl7.org/fhir/StructureDefinition/iso21090-codedString"
* extension[birthPlace].valueAddress.country.extension[0].valueCoding.system = "urn:iso:std:iso:3166"
* extension[birthPlace].valueAddress.country.extension[0].valueCoding.code = #CZ
* address[0].use = #home
* address[0].type = #physical
* address[0].text = "Javorová 12, 100 00 Praha 10"
* address[0].line[0] = "Javorová 12"
* address[0].city = "Praha 10"
* address[0].postalCode = "10000"
* address[0].country = "CZ"
* address[0].country.extension[0].url = "http://hl7.org/fhir/StructureDefinition/iso21090-codedString"
* address[0].country.extension[0].valueCoding.system = "urn:iso:std:iso:3166"
* address[0].country.extension[0].valueCoding.code = #CZ
* address[1].use = #work
* address[1].type = #physical
* address[1].text = "U Parku 6, 100 00 Praha 10"
* address[1].line[0] = "U Parku 6"
* address[1].city = "Praha 10"
* address[1].postalCode = "10000"
* address[1].country = "CZ"
* address[1].country.extension[0].url = "http://hl7.org/fhir/StructureDefinition/iso21090-codedString"
* address[1].country.extension[0].valueCoding.system = "urn:iso:std:iso:3166"
* address[1].country.extension[0].valueCoding.code = #CZ
* telecom[0].system = #phone
* telecom[0].value = "+420777222333"
* telecom[0].use = #mobile
* telecom[1].system = #email
* telecom[1].value = "josef.kratochvil@example.cz"
* communication[0].language.coding[0].system = "urn:ietf:bcp:47"
* communication[0].language.coding[0].code = #cs
* communication[0].language.text = "čeština"
* communication[0].preferred = true
* generalPractitioner[0] = Reference(PractitionerRole-FTGeneralPractitioner)
* managingOrganization = Reference(Organization-L1-Odd)
* extension[registeringProvider].extension[value].valueReference = Reference(PractitionerRole-FTGeneralPractitioner)
* extension[registeringProvider].extension[category].valueCodeableConcept.coding[0] = $sctCZ#700232004

Instance: Condition-FTCopd
InstanceOf: CZ_ConditionCore
Usage: #example
Description: """
CZ: Chronická obstrukční plicní nemoc.
EN: Chronic obstructive pulmonary disease.
"""
* id = "Condition-FTCopd"
* subject = Reference(Patient-FTCopdHomeCare)
* code.coding[0] = $mkn10#J449
* code.text = "Chronická obstrukční plicní nemoc, NS"

Instance: Observation-FTCopdMobility
InstanceOf: CZ_PatientMobility
Usage: #example
Description: """
CZ: Omezená mobilita pacienta s CHOPN.
EN: Limited mobility of the patient with COPD.
"""
* id = "Observation-FTCopdMobility"
* status = #final
* category[0].coding[0].system = "http://terminology.hl7.org/CodeSystem/observation-category"
* category[0].coding[0].code = #exam
* subject = Reference(Patient-FTCopdHomeCare)
* performer[0] = Reference(PractitionerRole-Pulmonologist)
* effectiveDateTime = "2026-09-04T10:00:00+02:00"
* code.coding[SNOMEDCT] = $sctCZ#282870005
* valueCodeableConcept.coding[0] = $sctCZ#282873007

Instance: Goal-FTCopdRespiratory
InstanceOf: Goal
Usage: #example
Description: """
CZ: Cíl respirační fyzioterapie u CHOPN.
EN: Respiratory physiotherapy goal for COPD.
"""
* id = "Goal-FTCopdRespiratory"
* lifecycleStatus = #active
* description.text = "Zlepšení odkašlávání a nácvik dechových technik v domácím prostředí"
* subject = Reference(Patient-FTCopdHomeCare)

Instance: Coverage-FTCopdHomeCare
InstanceOf: CZ_Coverage
Usage: #example
Description: """
CZ: Zdravotní pojištění pacienta s CHOPN.
EN: Health insurance coverage for the patient with COPD.
"""
* id = "Coverage-FTCopdHomeCare"
* status = #active
* beneficiary = Reference(Patient-FTCopdHomeCare)
* payor[0] = Reference(Organization-Insurance111)
* identifier[0].system = "https://ncez.mzcr.cz/fhir/sid/pojistovna"
* identifier[0].value = "111"

Instance: FTServiceRequest-CopdChestPhysiotherapy
InstanceOf: FTServiceRequestCz
Usage: #example
Description: """
CZ: Požadavek na fyzioterapii hrudníku a dechová cvičení u pacienta s CHOPN.
EN: Request for chest physiotherapy and breathing exercises for a patient with COPD.
"""
* id = "FTServiceRequest-CopdChestPhysiotherapy"
* identifier.value = "6a77187d-7e74-4fce-b604-bad9b2840201"
* status = #active
* intent = #order
* authoredOn = "2026-09-04T10:15:00+02:00"
* subject = Reference(Patient-FTCopdHomeCare)
* requester = Reference(PractitionerRole-Pulmonologist)
* code.coding[0] = $sctCZ#34431008
* code.coding[+] = $sctCZ#229286000
* code.text = "Fyzioterapie hrudníku a respirační expanzní cvičení"
* quantityQuantity.value = 10
* quantityQuantity.unit = "procedur"
* occurrenceTiming.repeat.frequency = 2
* occurrenceTiming.repeat.period = 1
* occurrenceTiming.repeat.periodUnit = #wk
* locationCode.coding[0] = $cz-patient-relationship#PTRES "Patient's residence"
* locationCode.text = "Domácí prostředí pacienta"
* reasonReference[0] = Reference(Condition-FTCopd)
* supportingInfo[0] = Reference(Goal-FTCopdRespiratory)
* insurance = Reference(Coverage-FTCopdHomeCare)
* note[0].text = "Pacient je imobilní a používá dlouhodobou domácí oxygenoterapii. Terapie se provádí v místě pobytu pacienta."

Instance: FTCompositionCopdHomeCare
InstanceOf: FTOrderCompositionCz
Usage: #example
Description: """
CZ: Kompletně vyplněný FT poukaz pro respirační fyzioterapii v domácím prostředí.
EN: Fully completed FT order for respiratory physiotherapy in the patient's home.
"""
* id = "FTCompositionCopdHomeCare"
* status = #final
* date = "2026-09-04T10:20:00+02:00"
* title = "Respirační fyzioterapie u pacienta s CHOPN"
* type = $loinc#57154-7
* subject = Reference(Patient-FTCopdHomeCare)
* author[0] = Reference(PractitionerRole-Pulmonologist)
* identifier.value = "6a77187d-7e74-4fce-b604-bad9b2840202"
* section[coverage].entry[0] = Reference(Coverage-FTCopdHomeCare)
* section[orderInformation].entry[0] = Reference(FTServiceRequest-CopdChestPhysiotherapy)
* section[reasons].text.status = #generated
* section[reasons].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">CHOPN u imobilního pacienta na dlouhodobé domácí oxygenoterapii. Požadováno deset procedur dvakrát týdně v domácím prostředí pacienta.</div>"
* section[supportingInformation].entry[mobility] = Reference(Observation-FTCopdMobility)
* section[goals].title = "Cíle terapie"
* section[goals].entry[0] = Reference(Goal-FTCopdRespiratory)

Instance: BundleFTCopdHomeCare
InstanceOf: BundleOrderCz
Usage: #example
Title: "Příklad FT 2: Respirační fyzioterapie u pacienta s CHOPN"
Description: """
CZ: Kompletně vyplněný FT poukaz na respirační fyzioterapii v domácím prostředí.
EN: Fully completed FT order for respiratory physiotherapy at home.
"""
* id = "BundleFTCopdHomeCare"
* type = #document
* timestamp = "2026-09-04T10:20:00+02:00"
* identifier.system = "https://hl7.cz/fhir/order/sid/document"
* identifier.value = "FTCOPD-2026-0001"
* entry[0].fullUrl = "https://example.cz/fhir/Composition/FTCompositionCopdHomeCare"
* entry[0].resource = FTCompositionCopdHomeCare
* entry[+].fullUrl = "https://example.cz/fhir/Patient/Patient-FTCopdHomeCare"
* entry[=].resource = Patient-FTCopdHomeCare
* entry[+].fullUrl = "https://example.cz/fhir/Practitioner/a81e74c9-fe94-4eb1-9233-4c8f0b2d4e3a"
* entry[=].resource = Practitioner-Author
* entry[+].fullUrl = "https://example.cz/fhir/PractitionerRole/PractitionerRole-FTGeneralPractitioner"
* entry[=].resource = PractitionerRole-FTGeneralPractitioner
* entry[+].fullUrl = "https://example.cz/fhir/Organization/af2b3114-e872-43b9-9875-cceb39122f7f"
* entry[=].resource = Organization-L1-Odd
* entry[+].fullUrl = "https://example.cz/fhir/Practitioner/Practitioner-Pulmonologist"
* entry[=].resource = Practitioner-Pulmonologist
* entry[+].fullUrl = "https://example.cz/fhir/PractitionerRole/PractitionerRole-Pulmonologist"
* entry[=].resource = PractitionerRole-Pulmonologist
* entry[+].fullUrl = "https://example.cz/fhir/Organization/Organization-PulmonologyProvider"
* entry[=].resource = Organization-PulmonologyProvider
* entry[+].fullUrl = "https://example.cz/fhir/Organization/Organization-PulmonologyClinic"
* entry[=].resource = Organization-PulmonologyClinic
* entry[+].fullUrl = "https://example.cz/fhir/Organization/Organization-Insurance111"
* entry[=].resource = Organization-Insurance111
* entry[+].fullUrl = "https://example.cz/fhir/Coverage/Coverage-FTCopdHomeCare"
* entry[=].resource = Coverage-FTCopdHomeCare
* entry[+].fullUrl = "https://example.cz/fhir/Condition/Condition-FTCopd"
* entry[=].resource = Condition-FTCopd
* entry[+].fullUrl = "https://example.cz/fhir/ServiceRequest/FTServiceRequest-CopdChestPhysiotherapy"
* entry[=].resource = FTServiceRequest-CopdChestPhysiotherapy
* entry[+].fullUrl = "https://example.cz/fhir/Observation/Observation-FTCopdMobility"
* entry[=].resource = Observation-FTCopdMobility
* entry[+].fullUrl = "https://example.cz/fhir/Goal/Goal-FTCopdRespiratory"
* entry[=].resource = Goal-FTCopdRespiratory

// ------------------------- Example 3: pediatric physiotherapy -------------------------
Instance: Patient-FTPediatricPosture
InstanceOf: CZ_PatientCore
Usage: #example
Description: """
CZ: Desetileté dítě s vadným držením těla a začínající skoliózou.
EN: Ten-year-old child with poor posture and early scoliosis.
"""
* id = "Patient-FTPediatricPosture"
* identifier[RID].use = #official
* identifier[RID].system = $cz-patient-rid
* identifier[RID].value = "1000000103"
* identifier[RC].system = $cz-patient-rcis
* identifier[RC].value = "1652141234"
* identifier[CPOJ].system = "https://ncez.mzcr.cz/fhir/sid/cpoj"
* identifier[CPOJ].value = "1111652141234"
* name.family = "Svobodova"
* name.given[0] = "Anna"
* gender = #female
* birthDate = "2016-02-14"
* extension[birthPlace].valueAddress.city = "Brno"
* extension[birthPlace].valueAddress.country = "CZ"
* extension[birthPlace].valueAddress.country.extension[0].url = "http://hl7.org/fhir/StructureDefinition/iso21090-codedString"
* extension[birthPlace].valueAddress.country.extension[0].valueCoding.system = "urn:iso:std:iso:3166"
* extension[birthPlace].valueAddress.country.extension[0].valueCoding.code = #CZ
* address[0].use = #home
* address[0].type = #physical
* address[0].text = "Školní 8, 602 00 Brno"
* address[0].line[0] = "Školní 8"
* address[0].city = "Brno"
* address[0].postalCode = "60200"
* address[0].country = "CZ"
* address[0].country.extension[0].url = "http://hl7.org/fhir/StructureDefinition/iso21090-codedString"
* address[0].country.extension[0].valueCoding.system = "urn:iso:std:iso:3166"
* address[0].country.extension[0].valueCoding.code = #CZ
* telecom[0].system = #phone
* telecom[0].value = "+420777333445"
* telecom[0].use = #mobile
* communication[0].language.coding[0].system = "urn:ietf:bcp:47"
* communication[0].language.coding[0].code = #cs
* communication[0].language.text = "čeština"
* communication[0].preferred = true
* generalPractitioner[0] = Reference(PractitionerRole-Pediatrician)
* managingOrganization = Reference(Organization-PediatricsClinic)
* extension[registeringProvider].extension[value].valueReference = Reference(PractitionerRole-Pediatrician)
* extension[registeringProvider].extension[category].valueCodeableConcept.coding[0] = $sctCZ#700232004
* contact[0].relationship[0].coding[0] = $cz-patient-relationship#MTH "Mother"
* contact[0].name.family = "Svobodova"
* contact[0].name.given[0] = "Lucie"
* contact[0].telecom[0].system = #phone
* contact[0].telecom[0].value = "+420777333444"
* contact[0].telecom[0].use = #mobile
* contact[0].telecom[1].system = #email
* contact[0].telecom[1].value = "lucie.svobodova@example.cz"
* contact[0].address[0].use = #home
* contact[0].address[0].type = #physical
* contact[0].address[0].text = "Školní 8, 602 00 Brno"
* contact[0].address[0].line[0] = "Školní 8"
* contact[0].address[0].city = "Brno"
* contact[0].address[0].postalCode = "60200"
* contact[0].address[0].country = "CZ"
* contact[0].address[0].country.extension[0].url = "http://hl7.org/fhir/StructureDefinition/iso21090-codedString"
* contact[0].address[0].country.extension[0].valueCoding.system = "urn:iso:std:iso:3166"
* contact[0].address[0].country.extension[0].valueCoding.code = #CZ

Instance: Condition-FTPediatricScoliosis
InstanceOf: CZ_ConditionCore
Usage: #example
Description: """
CZ: Skolióza u dětského pacienta.
EN: Scoliosis in a pediatric patient.
"""
* id = "Condition-FTPediatricScoliosis"
* subject = Reference(Patient-FTPediatricPosture)
* code.coding[0] = $mkn10#M419
* code.text = "Skolióza, NS; vadné držení těla"

Instance: Goal-FTPediatricPosture
InstanceOf: Goal
Usage: #example
Description: """
CZ: Cíl fyzioterapie při vadném držení těla.
EN: Physiotherapy goal for poor posture.
"""
* id = "Goal-FTPediatricPosture"
* lifecycleStatus = #active
* description.text = "Nácvik správného držení těla a stabilizačních cvičení"
* subject = Reference(Patient-FTPediatricPosture)

Instance: Organization-PediatricsClinic
InstanceOf: CZ_OrganizationCore
Usage: #example
Description: """
CZ: Dětská ambulance poskytovatele zdravotních služeb.
EN: Pediatric clinic of the healthcare service provider.
"""
* id = "Organization-PediatricsClinic"
* identifier[ICO].system = $cz-organization-ico
* identifier[ICO].value = "12345679"
* identifier[ICZ].system = $cz-organization-icz
* identifier[ICZ].value = "42001000"
* identifier[ICP].system = $cz-organization-icp
* identifier[ICP].value = "42001357"
* name = "Nemocnice Pod Lipou - dětská ambulance"
* partOf = Reference(Organization-1) "Nemocnice Pod Lipou, a.s."

Instance: Practitioner-Pediatrician
InstanceOf: CZ_PractitionerCore
Usage: #example
Description: """
CZ: Pediatr vystavující FT žádanku.
EN: Pediatrician authoring the FT order.
"""
* id = "Practitioner-Pediatrician"
* identifier[KRZP].system = $cz-practitioner-krzp
* identifier[KRZP].value = "100000011"
* name.family = "Malikova"
* name.given[0] = "Petra"
* name.prefix[0] = "MUDr."

Instance: PractitionerRole-Pediatrician
InstanceOf: CZ_PractitionerRoleOrder
Usage: #example
Description: """
CZ: Role pediatra v dětské ambulanci.
EN: Pediatrician role at the pediatric clinic.
"""
* id = "PractitionerRole-Pediatrician"
* practitioner = Reference(Practitioner-Pediatrician)
* organization = Reference(Organization-PediatricsClinic)
* code = $cz-nrzp_povolani#L1
* specialty[0].coding[0].system = "https://ncez.mzcr.cz/terminology/CodeSystem/vzp-smluvni-odbornost"
* specialty[0].coding[0].code = #002
* specialty[0].text = "Praktické lékařství pro děti a dorost"

Instance: Coverage-FTPediatricPosture
InstanceOf: CZ_Coverage
Usage: #example
Description: """
CZ: Zdravotní pojištění dětského pacienta.
EN: Health insurance coverage for the pediatric patient.
"""
* id = "Coverage-FTPediatricPosture"
* status = #active
* beneficiary = Reference(Patient-FTPediatricPosture)
* payor[0] = Reference(Organization-Insurance111)
* identifier[0].system = "https://ncez.mzcr.cz/fhir/sid/pojistovna"
* identifier[0].value = "111"

Instance: FTCompositionPediatricPosture
InstanceOf: FTOrderCompositionCz
Usage: #example
Description: """
CZ: Částečně vyplněný FT poukaz pro dětského pacienta bez určení výkonů.
EN: Partially completed FT order for a pediatric patient without specified procedures.
"""
* id = "FTCompositionPediatricPosture"
* status = #final
* date = "2026-09-04T11:05:00+02:00"
* title = "Fyzioterapie při vadném držení těla"
* type = $loinc#57154-7
* subject = Reference(Patient-FTPediatricPosture)
* author[0] = Reference(PractitionerRole-Pediatrician)
* identifier.value = "6a77187d-7e74-4fce-b604-bad9b2840301"
* section[coverage].entry[0] = Reference(Coverage-FTPediatricPosture)
* section[reasons].text.status = #generated
* section[reasons].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Vadné držení těla a začínající skolióza. Konkrétní výkony ani jejich počet nejsou určeny; rozsah péče navrhne fyzioterapeut.</div>"
* section[supportingInformation].entry[0] = Reference(Condition-FTPediatricScoliosis)
* section[goals].title = "Cíle terapie"
* section[goals].entry[0] = Reference(Goal-FTPediatricPosture)

Instance: BundleFTPediatricPosture
InstanceOf: BundleOrderCz
Usage: #example
Title: "Příklad FT 3: Fyzioterapie u dětského pacienta s vadným držením těla"
Description: """
CZ: Částečně vyplněný FT poukaz pro dětského pacienta včetně zákonného zástupce.
EN: Partially completed FT order for a pediatric patient including a legal guardian.
"""
* id = "BundleFTPediatricPosture"
* type = #document
* timestamp = "2026-09-04T11:05:00+02:00"
* identifier.system = "https://hl7.cz/fhir/order/sid/document"
* identifier.value = "FTPED-2026-0001"
* entry[0].fullUrl = "https://example.cz/fhir/Composition/FTCompositionPediatricPosture"
* entry[0].resource = FTCompositionPediatricPosture
* entry[+].fullUrl = "https://example.cz/fhir/Patient/Patient-FTPediatricPosture"
* entry[=].resource = Patient-FTPediatricPosture
* entry[+].fullUrl = "https://example.cz/fhir/Practitioner/Practitioner-Pediatrician"
* entry[=].resource = Practitioner-Pediatrician
* entry[+].fullUrl = "https://example.cz/fhir/PractitionerRole/PractitionerRole-Pediatrician"
* entry[=].resource = PractitionerRole-Pediatrician
* entry[+].fullUrl = "https://example.cz/fhir/Organization/Organization-PediatricsClinic"
* entry[=].resource = Organization-PediatricsClinic
* entry[+].fullUrl = "https://example.cz/fhir/Organization/ace081ba-e0a8-4b89-a4a7-c5b7cd3c8169"
* entry[=].resource = Organization-1
* entry[+].fullUrl = "https://example.cz/fhir/Organization/Organization-Insurance111"
* entry[=].resource = Organization-Insurance111
* entry[+].fullUrl = "https://example.cz/fhir/Coverage/Coverage-FTPediatricPosture"
* entry[=].resource = Coverage-FTPediatricPosture
* entry[+].fullUrl = "https://example.cz/fhir/Condition/Condition-FTPediatricScoliosis"
* entry[=].resource = Condition-FTPediatricScoliosis
* entry[+].fullUrl = "https://example.cz/fhir/Goal/Goal-FTPediatricPosture"
* entry[=].resource = Goal-FTPediatricPosture
