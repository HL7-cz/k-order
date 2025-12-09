Instance: KOrderHeader2FHIRcz-cz
InstanceOf: ConceptMap
Usage: #definition
* url = "https://hl7.cz/fhir/korder/ConceptMap/KOrderHeader2FHIRcz-cz"
* name = "KOrderHeader2FHIRcz"
* title = "CZ K-order Header Model to this guide Map"
* status = #draft
* experimental = true
* description = """CZ K-order Header Model → K-order FHIR profiles mapping (Composition, Patient, Coverage, Practitioner, Organization)."""

//////////////////////////////////////////////////////////////////
// A.1.1 IDENTIFIKACE PACIENTA
//////////////////////////////////////////////////////////////////

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LogCzKOrder"
* group[=].target = "https://hl7.cz/fhir/core/StructureDefinition/cz-patient-core"

* group[=].element[+].code = #pacient
* group[=].element[=].display = "A.1.1 – Identifikace pacienta"
* group[=].element[=].target.code = #Patient
* group[=].element[=].target.equivalence = #relatedto

* group[=].element[+].code = #pacient.jmeno
* group[=].element[=].display = "A.1.1.1 – Jméno"
* group[=].element[=].target.code = #Patient.name.given
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #pacient.prijmeni
* group[=].element[=].display = "A.1.1.2 – Příjmení"
* group[=].element[=].target.code = #Patient.name.family
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #pacient.datumNarozeni
* group[=].element[=].display = "A.1.1.3 – Datum narození"
* group[=].element[=].target.code = #Patient.birthDate
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #pacient.identifikatorPacienta
* group[=].element[=].display = "A.1.1.4 – Identifikátor pacienta"
* group[=].element[=].target.code = #Patient.identifier
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #pacient.statniObcanstvi
* group[=].element[=].display = "A.1.1.5 – Státní občanství"
* group[=].element[=].target.code = #Patient.patient-citizenship
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #pacient.uredniPohlavi
* group[=].element[=].display = "A.1.1.6 – Úřední pohlaví"
* group[=].element[=].target.code = #Patient.gender
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #pacient.jazyk
* group[=].element[=].display = "A.1.1.7 – Komunikační jazyk"
* group[=].element[=].target.code = #Patient.communication.language
* group[=].element[=].target.equivalence = #equivalent

//////////////////////////////////////////////////////////////////
// A.1.2 KONTAKTNÍ INFORMACE PACIENTA
//////////////////////////////////////////////////////////////////

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LogCzKOrder"
* group[=].target = "https://hl7.cz/fhir/core/StructureDefinition/cz-patient-core"

* group[=].element[+].code = #pacient.kontaktniUdaje.adresa
* group[=].element[=].display = "A.1.2.1 – Adresa"
* group[=].element[=].target.code = #Patient.address
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #pacient.kontaktniUdaje.telefon
* group[=].element[=].display = "A.1.2.2 – Telefon"
* group[=].element[=].target.code = #Patient.telecom
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #pacient.kontaktniUdaje.email
* group[=].element[=].display = "A.1.2.3 – E-mail"
* group[=].element[=].target.code = #Patient.telecom
* group[=].element[=].target.equivalence = #equivalent

//////////////////////////////////////////////////////////////////
// A.1.3 ZÁKONNÝ ZÁSTUPCE / KONTAKT
//////////////////////////////////////////////////////////////////

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LogCzKOrder"
* group[=].target = "https://hl7.cz/fhir/core/StructureDefinition/cz-relatedPerson-core"

* group[=].element[+].code = #pacient.zakonnyZastupce
* group[=].element[=].display = "A.1.2.4 – Zákonný zástupce / kontakt"
* group[=].element[=].target.code = #RelatedPerson
* group[=].element[=].target.equivalence = #relatedto

* group[=].element[+].code = #pacient.zakonnyZastupce.jmeno
* group[=].element[=].display = "A.1.2.4.1 – Jméno"
* group[=].element[=].target.code = #RelatedPerson.name.given
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #pacient.zakonnyZastupce.prijmeni
* group[=].element[=].display = "A.1.2.4.2 – Příjmení"
* group[=].element[=].target.code = #RelatedPerson.name.family
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #pacient.zakonnyZastupce.vztahKPacientovi
* group[=].element[=].display = "A.1.2.4.3 – Vztah k pacientovi"
* group[=].element[=].target.code = #RelatedPerson.relationship
* group[=].element[=].target.equivalence = #equivalent

//////////////////////////////////////////////////////////////////
// A.1.4 POJIŠTĚNÍ
//////////////////////////////////////////////////////////////////

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LogCzKOrder"
* group[=].target = "https://hl7.cz/fhir/core/StructureDefinition/cz-coverage"

* group[=].element[+].code = #pojisteni
* group[=].element[=].display = "A.1.3 – Zdravotní pojištění"
* group[=].element[=].target.code = #Coverage
* group[=].element[=].target.equivalence = #relatedto

* group[=].element[+].code = #pojisteni.kodZP
* group[=].element[=].display = "A.1.3.1 – Kód pojišťovny"
* group[=].element[=].target.code = #Coverage.payor.identifier
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #pojisteni.nazevZP
* group[=].element[=].display = "A.1.3.2 – Název pojišťovny"
* group[=].element[=].target.code = #Coverage.payor.display
* group[=].element[=].target.equivalence = #relatedto

* group[=].element[+].code = #pojisteni.cisloPojistence
* group[=].element[=].display = "A.1.3.3 – Číslo pojištěnce"
* group[=].element[=].target.code = #Coverage.identifier
* group[=].element[=].target.equivalence = #equivalent

//////////////////////////////////////////////////////////////////
// A.1.5 ŽADATEL (REQUESTER)
//////////////////////////////////////////////////////////////////

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LogCzKOrder"
* group[=].target = "https://hl7.cz/fhir/core/StructureDefinition/cz-practitionerrole-core"

* group[=].element[+].code = #zadatel
* group[=].element[=].display = "A.1.5 – Žadatel"
* group[=].element[=].target.code = #PractitionerRole
* group[=].element[=].target.equivalence = #relatedto

* group[=].element[+].code = #zadatel.icp
* group[=].element[=].display = "A.1.5.1 – IČP"
* group[=].element[=].target.code = #PractitionerRole.identifier
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #zadatel.jmenoZadatele
* group[=].element[=].display = "A.1.5.2 – Jméno žadatele"
* group[=].element[=].target.code = #PractitionerRole.practitioner.name
* group[=].element[=].target.equivalence = #equivalent

//////////////////////////////////////////////////////////////////
// A.1.6 ZPRACOVATEL (PERFORMER)
//////////////////////////////////////////////////////////////////

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LogCzKOrder"
* group[=].target = "https://hl7.cz/fhir/core/StructureDefinition/cz-practitionerrole-core"

* group[=].element[+].code = #zpracovatel
* group[=].element[=].display = "A.1.6 – Zpracovatel"
* group[=].element[=].target.code = #PractitionerRole
* group[=].element[=].target.equivalence = #relatedto

//////////////////////////////////////////////////////////////////
// A.1.8 METADATA DOKUMENTU (Composition)
//////////////////////////////////////////////////////////////////

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LogCzKOrder"
* group[=].target = "https://hl7.cz/fhir/korder/StructureDefinition/KOrderCompositionCz"

* group[=].element[+].code = #kOrder.identifikatorEZadanky
* group[=].element[=].display = "A.1.8.1 – Identifikátor dokumentu"
* group[=].element[=].target.code = #Composition.identifier
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #kOrder.datumVytvoreni
* group[=].element[=].display = "A.1.8.2 – Datum vytvoření"
* group[=].element[=].target.code = #Composition.date
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #kOrder.stavZadanky
* group[=].element[=].display = "A.1.8.3 – Stav dokumentu"
* group[=].element[=].target.code = #Composition.status
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #kOrder.typZadanky
* group[=].element[=].display = "A.1.8.4 – Kategorie dokumentu"
* group[=].element[=].target.code = #Composition.category
* group[=].element[=].target.equivalence = #relatedto
