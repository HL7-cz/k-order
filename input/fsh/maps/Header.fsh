Instance: HeaderKOrder2FHIR-cz
InstanceOf: ConceptMap
Usage: #definition
* url = "https://hl7.cz/fhir/korder/ConceptMap/HeaderKOrder2FHIR-cz"
* name = "HeaderKOrder2FHIRcz"
* title = "CZ Header Model to this guide Map"
* status = #draft
* experimental = true
* description = """Mapování hlavičky aktuálního czech-model logického modelu žádanek na profily a resource použité v tomto IG."""

// ---------------------------------------------------------------------------
// A.1.1 / A.1.2 - Pacient a kontaktní informace
// ---------------------------------------------------------------------------

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LMSubjectOrderCz"
* group[=].target = "https://hl7.cz/fhir/core/StructureDefinition/cz-patient-core"

* group[=].element[+].code = #LMSubjectOrderCz.identifikace
* group[=].element[=].display = "A.1.1 - Identifikace pacienta/subjektu"
* group[=].element[=].target.code = #Patient
* group[=].element[=].target.equivalence = #relatedto

* group[=].element[+].code = #LMSubjectOrderCz.identifikace.jmeno
* group[=].element[=].display = "A.1.1.1 - Jméno"
* group[=].element[=].target.code = #Patient.name.given
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMSubjectOrderCz.identifikace.prijmeni
* group[=].element[=].display = "A.1.1.2 - Příjmení"
* group[=].element[=].target.code = #Patient.name.family
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMSubjectOrderCz.identifikace.datumNarozeni
* group[=].element[=].display = "A.1.1.3 - Datum narození"
* group[=].element[=].target.code = #Patient.birthDate
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMSubjectOrderCz.identifikace.datumUmrti
* group[=].element[=].display = "A.1.1.4 - Datum úmrtí"
* group[=].element[=].target.code = #Patient.deceasedDateTime
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMSubjectOrderCz.identifikace.identifikator
* group[=].element[=].display = "A.1.1.5 - Identifikátor"
* group[=].element[=].target.code = #Patient.identifier
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMSubjectOrderCz.identifikace.statniObcanstvi
* group[=].element[=].display = "A.1.1.6 - Státní občanství"
* group[=].element[=].target.code = #Patient.extension:patient-citizenship
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMSubjectOrderCz.identifikace.pohlavi
* group[=].element[=].display = "A.1.1.7 - Pohlaví"
* group[=].element[=].target.code = #Patient.gender
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMSubjectOrderCz.identifikace.pohlaviProKlinickeUcely
* group[=].element[=].display = "A.1.1.8 - Pohlaví pro klinické použití"
* group[=].element[=].target.code = #Patient.extension:sex-for-clinical-use
* group[=].element[=].target.equivalence = #relatedto

* group[=].element[+].code = #LMSubjectOrderCz.identifikace.komunikacniJazyk
* group[=].element[=].display = "A.1.1.9 - Komunikační jazyk"
* group[=].element[=].target.code = #Patient.communication.language
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMSubjectOrderCz.identifikace.handicap
* group[=].element[=].display = "A.1.1.10 - Handicap"
* group[=].element[=].target.code = #Patient.text
* group[=].element[=].target.equivalence = #relatedto

* group[=].element[+].code = #LMSubjectOrderCz.kontakt.adresa
* group[=].element[=].display = "A.1.2.1 - Adresa"
* group[=].element[=].target.code = #Patient.address
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMSubjectOrderCz.kontakt.telekom
* group[=].element[=].display = "A.1.2.2 - Telekom"
* group[=].element[=].target.code = #Patient.telecom
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMSubjectOrderCz.kontakt.preferovanyLekar
* group[=].element[=].display = "A.1.2.3 - Preferovaný lékař"
* group[=].element[=].target.code = #Patient.generalPractitioner
* group[=].element[=].target.equivalence = #relatedto

* group[=].element[+].code = #LMSubjectOrderCz.kontakt.kontaktniOsoba
* group[=].element[=].display = "A.1.2.4 - Zákonní zástupci a další kontaktní osoby"
* group[=].element[=].target.code = #Patient.contact
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMSubjectOrderCz.kontakt.kontaktniOsoba.typ
* group[=].element[=].display = "A.1.2.4.1 - Typ kontaktu"
* group[=].element[=].target.code = #Patient.contact.relationship
* group[=].element[=].target.equivalence = #relatedto

* group[=].element[+].code = #LMSubjectOrderCz.kontakt.kontaktniOsoba.vztah
* group[=].element[=].display = "A.1.2.4.2 - Vztah k pacientovi"
* group[=].element[=].target.code = #Patient.contact.relationship
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMSubjectOrderCz.kontakt.kontaktniOsoba.jmeno
* group[=].element[=].display = "A.1.2.4.4 - Jméno osoby"
* group[=].element[=].target.code = #Patient.contact.name.given
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMSubjectOrderCz.kontakt.kontaktniOsoba.prijmeni
* group[=].element[=].display = "A.1.2.4.5 - Příjmení osoby"
* group[=].element[=].target.code = #Patient.contact.name.family
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMSubjectOrderCz.kontakt.kontaktniOsoba.adresa
* group[=].element[=].display = "A.1.2.4.6 - Adresa"
* group[=].element[=].target.code = #Patient.contact.address
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMSubjectOrderCz.kontakt.kontaktniOsoba.telekom
* group[=].element[=].display = "A.1.2.4.7 - Telekom"
* group[=].element[=].target.code = #Patient.contact.telecom
* group[=].element[=].target.equivalence = #equivalent

// ---------------------------------------------------------------------------
// A.1.3 / A.1.4 - Pojištění a úhrada
// ---------------------------------------------------------------------------

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LMPayerOrderCz"
* group[=].target = "https://hl7.cz/fhir/core/StructureDefinition/cz-coverage"

* group[=].element[+].code = #LMPayerOrderCz.kod
* group[=].element[=].display = "A.1.3.1 - Kód zdravotní pojišťovny"
* group[=].element[=].target.code = #Coverage.payor.identifier
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMPayerOrderCz.nazev
* group[=].element[=].display = "A.1.3.2 - Název zdravotní pojišťovny"
* group[=].element[=].target.code = #Coverage.payor.display
* group[=].element[=].target.equivalence = #relatedto

* group[=].element[+].code = #LMPayerOrderCz.cisloPojistence
* group[=].element[=].display = "A.1.3.3 - Číslo zdravotního pojištění"
* group[=].element[=].target.code = #Coverage.beneficiary.identifier
* group[=].element[=].target.equivalence = #relatedto

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LMCoverageOrderCz"
* group[=].target = "https://hl7.cz/fhir/core/StructureDefinition/cz-coverage"

* group[=].element[+].code = #LMCoverageOrderCz.method
* group[=].element[=].display = "A.1.4.1 - Způsob úhrady"
* group[=].element[=].target.code = #Coverage.type
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMCoverageOrderCz.infoOPlatci
* group[=].element[=].display = "A.1.4.2 - Informace o plátci"
* group[=].element[=].target.code = #Coverage.payor
* group[=].element[=].target.equivalence = #relatedto

* group[=].element[+].code = #LMCoverageOrderCz.kodNahrady
* group[=].element[=].display = "A.1.4.3 - Kód náhrady"
* group[=].element[=].target.code = #Coverage.type
* group[=].element[=].target.equivalence = #relatedto
* group[=].element[=].target.comment = "Kód náhrady je úhradový údaj; podle implementace může být také nesen jako samostatný kódovaný údaj navázaný na Coverage/Claim workflow."

// ---------------------------------------------------------------------------
// A.1.5 / A.1.6 / A.1.7 - Objednatel, zpracovatel a příjemce nálezu
// ---------------------------------------------------------------------------

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LMAuthorOrderCz"
* group[=].target = "https://hl7.cz/fhir/korder/StructureDefinition/OrderPractitionerRoleCz"

* group[=].element[+].code = #LMAuthorOrderCz
* group[=].element[=].display = "A.1.5 - Objednatel"
* group[=].element[=].target.code = #Composition.author
* group[=].element[=].target.equivalence = #relatedto
* group[=].element[=].target.comment = "Zároveň ServiceRequest.requester jako Reference(OrderPractitionerRoleCz)."

* group[=].element[+].code = #LMAuthorOrderCz.identifikator
* group[=].element[=].display = "A.1.5.1 - Identifikátor zadavatele objednávky"
* group[=].element[=].target.code = #PractitionerRole.practitioner.identifier
* group[=].element[=].target.equivalence = #relatedto

* group[=].element[+].code = #LMAuthorOrderCz.jmeno
* group[=].element[=].display = "A.1.5.2 - Jméno zadavatele objednávky"
* group[=].element[=].target.code = #PractitionerRole.practitioner.name
* group[=].element[=].target.equivalence = #relatedto

* group[=].element[+].code = #LMAuthorOrderCz.adresa
* group[=].element[=].display = "A.1.5.3 - Kontaktní údaje zadavatele objednávky"
* group[=].element[=].target.code = #PractitionerRole.telecom
* group[=].element[=].target.equivalence = #relatedto

* group[=].element[+].code = #LMAuthorOrderCz.organizace
* group[=].element[=].display = "A.1.5.4 - Organizace zadavatele objednávky"
* group[=].element[=].target.code = #PractitionerRole.organization
* group[=].element[=].target.equivalence = #relatedto

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LMRequestedPerformerOrderCz"
* group[=].target = "https://hl7.cz/fhir/korder/StructureDefinition/OrderPractitionerRoleCz"

* group[=].element[+].code = #LMRequestedPerformerOrderCz
* group[=].element[=].display = "A.1.6 - Zpracovatel"
* group[=].element[=].target.code = #ServiceRequest.performer
* group[=].element[=].target.equivalence = #relatedto

* group[=].element[+].code = #LMRequestedPerformerOrderCz.id
* group[=].element[=].display = "A.1.6.1 - ID zpracovatele"
* group[=].element[=].target.code = #PractitionerRole.identifier
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMRequestedPerformerOrderCz.jmeno
* group[=].element[=].display = "A.1.6.2 - Jméno zpracovatele"
* group[=].element[=].target.code = #PractitionerRole.practitioner.name
* group[=].element[=].target.equivalence = #relatedto

* group[=].element[+].code = #LMRequestedPerformerOrderCz.idOrganizace
* group[=].element[=].display = "A.1.6.3 - ID organizace zpracovatele"
* group[=].element[=].target.code = #PractitionerRole.organization.identifier
* group[=].element[=].target.equivalence = #relatedto

* group[=].element[+].code = #LMRequestedPerformerOrderCz.organizace
* group[=].element[=].display = "A.1.6.4 - Organizace zpracovatele"
* group[=].element[=].target.code = #PractitionerRole.organization
* group[=].element[=].target.equivalence = #relatedto

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LMAdditionalRecipientCz"
* group[=].target = "https://hl7.cz/fhir/korder/StructureDefinition/KOrderCompositionCz"

* group[=].element[+].code = #LMAdditionalRecipientCz
* group[=].element[=].display = "A.1.7 - Příjemce nálezu"
* group[=].element[=].target.code = #Composition.extension:informationRecipient
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMAdditionalRecipientCz.identifikator
* group[=].element[=].display = "A.1.7.1 - Identifikátor příjemce"
* group[=].element[=].target.code = #Composition.extension:informationRecipient.valueReference.identifier
* group[=].element[=].target.equivalence = #relatedto

* group[=].element[+].code = #LMAdditionalRecipientCz.jmeno
* group[=].element[=].display = "A.1.7.2 - Jméno příjemce"
* group[=].element[=].target.code = #Composition.extension:informationRecipient.valueReference.display
* group[=].element[=].target.equivalence = #relatedto

* group[=].element[+].code = #LMAdditionalRecipientCz.idOrganizace
* group[=].element[=].display = "A.1.7.3 - ID organizace"
* group[=].element[=].target.code = #Composition.extension:informationRecipient.valueReference.identifier
* group[=].element[=].target.equivalence = #relatedto

* group[=].element[+].code = #LMAdditionalRecipientCz.organizace
* group[=].element[=].display = "A.1.7.4 - Organizace příjemce"
* group[=].element[=].target.code = #Composition.extension:informationRecipient.valueReference
* group[=].element[=].target.equivalence = #relatedto

// ---------------------------------------------------------------------------
// A.1.8 / A.1.9 - Metadata dokumentu a elektronický podpis
// ---------------------------------------------------------------------------

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LMDocumentMetadataCz"
* group[=].target = "https://hl7.cz/fhir/korder/StructureDefinition/KOrderCompositionCz"

* group[=].element[+].code = #LMDocumentMetadataCz.idDokumentu
* group[=].element[=].display = "A.1.8.1 - ID dokumentu"
* group[=].element[=].target.code = #Composition.identifier
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMDocumentMetadataCz.kategorie
* group[=].element[=].display = "A.1.8.2 - Kategorie"
* group[=].element[=].target.code = #Composition.type
* group[=].element[=].target.equivalence = #relatedto

* group[=].element[+].code = #LMDocumentMetadataCz.stav
* group[=].element[=].display = "A.1.8.3 - Stav"
* group[=].element[=].target.code = #Composition.status
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMDocumentMetadataCz.datumACas
* group[=].element[=].display = "A.1.8.4 - Datum a čas vytvoření"
* group[=].element[=].target.code = #Composition.date
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMDocumentMetadataCz.nazev
* group[=].element[=].display = "A.1.8.5 - Název dokumentu"
* group[=].element[=].target.code = #Composition.title
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMDocumentMetadataCz.spravce
* group[=].element[=].display = "A.1.8.6 - Správce dokumentu"
* group[=].element[=].target.code = #Composition.custodian
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMDocumentMetadataCz.duvernost
* group[=].element[=].display = "A.1.8.7 - Důvěrnost"
* group[=].element[=].target.code = #Composition.confidentiality
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMDocumentMetadataCz.jazyk
* group[=].element[=].display = "A.1.8.8 - Jazyk"
* group[=].element[=].target.code = #Composition.language
* group[=].element[=].target.equivalence = #relatedto

* group[=].element[+].code = #LMDocumentMetadataCz.verze
* group[=].element[=].display = "A.1.8.9 - Verze"
* group[=].element[=].target.code = #Composition.extension:versionNumber.valueString
* group[=].element[=].target.equivalence = #relatedto

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LMDigitalSignatureOrderCz"
* group[=].target = "https://hl7.cz/fhir/korder/StructureDefinition/BundleKOrderCz"

* group[=].element[+].code = #LMDigitalSignatureOrderCz.elektronickyPodpis
* group[=].element[=].display = "A.1.9.1 - Elektronický podpis"
* group[=].element[=].target.code = #Bundle.signature.data
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMDigitalSignatureOrderCz.casoveRazitko
* group[=].element[=].display = "A.1.9.2 - Elektronické časové razítko"
* group[=].element[=].target.code = #Bundle.signature.when
* group[=].element[=].target.equivalence = #equivalent

// ---------------------------------------------------------------------------
// A.1 / A.2 - Hlavička a tělo dokumentu
// ---------------------------------------------------------------------------

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LMHeaderOrder"
* group[=].target = "https://hl7.cz/fhir/korder/StructureDefinition/KOrderCompositionCz"

* group[=].element[+].code = #LMHeaderOrder.subjekt
* group[=].element[=].display = "A.1.1 / A.1.2 - Subjekt"
* group[=].element[=].target.code = #Composition.subject
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMHeaderOrder.zdravotniPojisteni
* group[=].element[=].display = "A.1.3 - Zdravotní pojištění"
* group[=].element[=].target.code = #Composition.section:insurance.entry
* group[=].element[=].target.equivalence = #relatedto

* group[=].element[+].code = #LMHeaderOrder.uhrada
* group[=].element[=].display = "A.1.4 - Úhrada"
* group[=].element[=].target.code = #Composition.section:insurance.entry
* group[=].element[=].target.equivalence = #relatedto

* group[=].element[+].code = #LMHeaderOrder.objednatel
* group[=].element[=].display = "A.1.5 - Objednatel"
* group[=].element[=].target.code = #Composition.author
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMHeaderOrder.metadataDokumentu
* group[=].element[=].display = "A.1.8 - Metadata dokumentu"
* group[=].element[=].target.code = #Composition
* group[=].element[=].target.equivalence = #relatedto

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LMBodyKOrder"
* group[=].target = "https://hl7.cz/fhir/korder/StructureDefinition/KOrderCompositionCz"

* group[=].element[+].code = #LMBodyKOrder.informaceOZadance
* group[=].element[=].display = "A.2.1 / A.2.2 - Informace o žádance a odůvodnění"
* group[=].element[=].target.code = #Composition.section:reasons
* group[=].element[=].target.equivalence = #relatedto

* group[=].element[+].code = #LMBodyKOrder.klinickaUdalost
* group[=].element[=].display = "A.2.3 - Klinická událost"
* group[=].element[=].target.code = #Composition.encounter
* group[=].element[=].target.equivalence = #relatedto

* group[=].element[+].code = #LMBodyKOrder.datoveElementyObjednavkyVysetreni
* group[=].element[=].display = "A.3.2 - Datové elementy objednávky / vyšetření"
* group[=].element[=].target.code = #Composition.section:examinations.entry
* group[=].element[=].target.equivalence = #relatedto

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LMBodyFTOrder"
* group[=].target = "https://hl7.cz/fhir/korder/StructureDefinition/FTOrderCompositionCz"

* group[=].element[+].code = #LMBodyFTOrder.datoveElementyObjednavkyVysetreni
* group[=].element[=].display = "A.3.2 - Datové elementy objednávky / vyšetření FT"
* group[=].element[=].target.code = #Composition.section:examinations.entry
* group[=].element[=].target.equivalence = #relatedto
