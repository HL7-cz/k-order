Instance: LabFTOrderHeader2FHIRcz-cz
InstanceOf: ConceptMap
Usage: #definition
* url = "https://hl7.cz/fhir/korder/ConceptMap/LabFTOrderHeader2FHIRcz-cz"
* name = "FTOrderHeader2FHIRcz"
* title = "Mapa hlavičky CZ modelu FT žádanky do této implementační příručky"
* status = #draft
* experimental = true
* description = """Mapování hlavičky fyzioterapeutického požadavkového modelu do této implementační příručky. Mapování vychází z obecné žádanky logického modelu českého standardu HL7 FHIR"""

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LMSubjectOrderCz"
* group[=].target = "https://hl7.cz/fhir/core/StructureDefinition/cz-patient-core"
* group[=].element[+].code = #identifikace
* group[=].element[=].display = "A.1.1 Identifikace pacienta/subjektu"
* group[=].element[=].target.code = #Patient
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #relatedto
* group[=].element[+].code = #identifikace.jmeno
* group[=].element[=].display = "A.1.1.1 Jméno"
* group[=].element[=].target.code = #Patient.name.given
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent
* group[=].element[+].code = #identifikace.prijmeni
* group[=].element[=].display = "A.1.1.2 Příjmení"
* group[=].element[=].target.code = #Patient.name.family
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent
* group[=].element[+].code = #identifikace.datumNarozeni
* group[=].element[=].display = "A.1.1.3 Datum narození"
* group[=].element[=].target.code = #Patient.birthDate
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent
* group[=].element[+].code = #identifikace.datumUmrti
* group[=].element[=].display = "A.1.1.4 Datum úmrtí"
* group[=].element[=].target.code = #Patient.deceased[x].deceasedDateTime
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent
* group[=].element[+].code = #identifikace.identifikator
* group[=].element[=].display = "A.1.1.5 Identifikátor"
* group[=].element[=].target.code = #Patient.identifier
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent
* group[=].element[+].code = #identifikace.statniObcanstvi
* group[=].element[=].display = "A.1.1.6 Státní občanství"
* group[=].element[=].target.code = #Patient.patient-citizenship
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent
* group[=].element[+].code = #identifikace.pohlavi
* group[=].element[=].display = "A.1.1.7 Pohlaví"
* group[=].element[=].target.code = #Patient.gender
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent
* group[=].element[+].code = #identifikace.pohlaviProKlinickeUcely
* group[=].element[=].display = "A.1.1.8 Pohlaví pro klinické použití"
* group[=].element[=].target.code = #Patient.extension:sex-for-clinical-use
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent
* group[=].element[+].code = #identifikace.komunikacniJazyk
* group[=].element[=].display = "A.1.1.9 Komunikační jazyk"
* group[=].element[=].target.code = #Patient.communication.language
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent
* group[=].element[+].code = #identifikace.handicap
* group[=].element[=].display = "A.1.1.10 Handicap"
* group[=].element[=].target.code = #Patient.text
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent
* group[=].element[+].code = #kontakt
* group[=].element[=].display = "A.1.2 Kontaktní informace pacienta/subjektu"
* group[=].element[=].target.code = #Patient
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #relatedto
* group[=].element[+].code = #kontakt.adresa
* group[=].element[=].display = "A.1.2.1 Adresa"
* group[=].element[=].target.code = #Patient.address
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent
* group[=].element[+].code = #kontakt.telekom
* group[=].element[=].display = "A.1.2.2 Telekom"
* group[=].element[=].target.code = #Patient.telecom
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent
* group[=].element[+].code = #kontakt.preferovanyLekar
* group[=].element[=].display = "A.1.2.3 Preferovaný lékař"
* group[=].element[=].target.code = #Patient.generalPractitioner
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent
* group[=].element[+].code = #kontakt.kontaktniOsoba
* group[=].element[=].display = "A.1.2.4 Zákonní zástupci a další kontaktní osoby"
* group[=].element[=].target.code = #Patient.contact
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent
* group[=].element[+].code = #kontakt.kontaktniOsoba.typ
* group[=].element[=].display = "A.1.2.4.1 Typ kontaktu"
* group[=].element[=].target.code = #Patient.contact.relationship
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #relatedto
* group[=].element[+].code = #kontakt.kontaktniOsoba.vztah
* group[=].element[=].display = "A.1.2.4.2 Vztah k pacientovi"
* group[=].element[=].target.code = #Patient.contact.relationship
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent
* group[=].element[+].code = #kontakt.kontaktniOsoba.identifikator
* group[=].element[=].display = "A.1.2.4.3 Identifikátor osoby"
* group[=].element[=].target.code = #Patient.contact
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #relatedto
* group[=].element[+].code = #kontakt.kontaktniOsoba.jmeno
* group[=].element[=].display = "A.1.2.4.4 Jméno osoby"
* group[=].element[=].target.code = #Patient.contact.name.given
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent
* group[=].element[+].code = #kontakt.kontaktniOsoba.prijmeni
* group[=].element[=].display = "A.1.2.4.5 Příjmení osoby"
* group[=].element[=].target.code = #Patient.contact.name.family
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent
* group[=].element[+].code = #kontakt.kontaktniOsoba.adresa
* group[=].element[=].display = "A.1.2.4.6 Adresa"
* group[=].element[=].target.code = #Patient.contact.address
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent
* group[=].element[+].code = #kontakt.kontaktniOsoba.telekom
* group[=].element[=].display = "A.1.2.4.7 Telekom"
* group[=].element[=].target.code = #Patient.contact.telecom
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent


* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LMSubjectOrderCz"
* group[=].target = "https://hl7.cz/fhir/core/StructureDefinition/cz-practitionerrole-core"
* group[=].element[+].code = #kontakt.preferovanyLekar
* group[=].element[=].display = "A.1.2.3 Preferovaný lékař"
* group[=].element[=].target.code = #PractitionerRole
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent
* group[=].element[+].code = #kontakt.preferovanyLekar.identifikator
* group[=].element[=].display = "A.1.2.3.1 Identifikátor preferovaného lékaře"
* group[=].element[=].target.code = #PractitionerRole.identifier
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent
* group[=].element[+].code = #kontakt.preferovanyLekar.jmeno
* group[=].element[=].display = "A.1.2.3.2 Jméno preferovaného lékaře"
* group[=].element[=].target.code = #PractitionerRole.practiotioner.name
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent
* group[=].element[+].code = #kontakt.preferovanyLekar.specializace
* group[=].element[=].display = "A.1.2.3.3 Specializace preferovaného lékaře"
* group[=].element[=].target.code = #PractitionerRole.speciality
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent
* group[=].element[+].code = #kontakt.preferovanyLekar.organizace
* group[=].element[=].display = "A.1.2.3.4 Organizace preferovaného lékaře"
* group[=].element[=].target.code = #PractitionerRole.organization.name
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent
* group[=].element[+].code = #kontakt.preferovanyLekar.adresa
* group[=].element[=].display = "A.1.2.3.5 Adresa preferovaného lékaře"
* group[=].element[=].target.code = #PractitionerRole.organization.address
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent
* group[=].element[+].code = #kontakt.preferovanyLekar.telekom
* group[=].element[=].display = "A.1.2.3.6 Telekom preferovaného lékaře"
* group[=].element[=].target.code = #PractitionerRole.telecom
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LMPayerOrderCz"
* group[=].target = "https://hl7.cz/fhir/core/StructureDefinition/cz-coverage"
* group[=].element[+].code = #zdravotniPojisteni
* group[=].element[=].display = "A.1.3 Zdravotní pojištění"
* group[=].element[=].target.code = #Composition.section:orderInformation.insurance
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #relatedto
* group[=].element[=].target.comment = "Composition.section:orderInformation.entry.ofType(KOrderServiceRequestCz).insurance.ofType(CZ_Coverage)"
* group[=].element[+].code = #kod
* group[=].element[=].display = "A.1.3.1 Kód zdravotní pojišťovny"
* group[=].element[=].target.code = #CZ_Coverage.payor.identifier
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent
* group[=].element[+].code = #nazev
* group[=].element[=].display = "A.1.3.2 Název zdravotní pojišťovny"
* group[=].element[=].target.code = #CZ_Coverage.payor.name
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent
* group[=].element[+].code = #cisloPojistence
* group[=].element[=].display = "A.1.3.3 Číslo zdravotního pojištění"
* group[=].element[=].target.code = #CZ_Coverage.identifier
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LMCoverageOrderCz"
* group[=].target = "https://hl7.cz/fhir/core/StructureDefinition/cz-coverage"
* group[=].element[+].code = #uhrada
* group[=].element[=].display = "A.1.4 Úhrada"
* group[=].element[=].target.code = #Composition.section:Coverage
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #relatedto
* group[=].element[=].target.comment = "Composition.section:Coverage.entry.ofType(CZ_Coverage)"
* group[=].element[+].code = #method
* group[=].element[=].display = "A.1.4.1 Způsob úhrady"
* group[=].element[=].target.code = #CZ_Coverage.type
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent
* group[=].element[+].code = #infoOPlatci
* group[=].element[=].display = "A.1.4.2 Informace o plátci"
* group[=].element[=].target.code = #CZ_Coverage.payor
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LMAuthorOrderCz"
* group[=].target = "https://hl7.cz/fhir/core/StructureDefinition/cz-practitionerRole-core"
* group[=].element[+].code = #objednatel
* group[=].element[=].display = "A.1.5 Objednatel"
* group[=].element[=].target.code = #Composition.author
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent
* group[=].element[=].target.comment = "Composition.author.resolve().ofType(CZ_PractitionerRoleCore)"
* group[=].element[+].code = #identifikator
* group[=].element[=].display = "A.1.5.1 Identifikátor zadavatele objednávky"
* group[=].element[=].target.code = #CZ_PractitionerRoleCore.practictioner.identifier
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent
* group[=].element[+].code = #jmeno
* group[=].element[=].display = "A.1.5.2 Jméno zadavatele objednávky"
* group[=].element[=].target.code = #CZ_PractitionerRoleCore.practictioner.name
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent
* group[=].element[+].code = #adresa
* group[=].element[=].display = "A.1.5.3 Kontaktní údaje zadavatele objednávky"
* group[=].element[=].target.code = #CZ_PractitionerRoleCore.practictioner.address
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent
* group[=].element[=].target.comment = "ID organizace"
* group[=].element[+].code = #organizace
* group[=].element[=].display = "A.1.5.4 Organizace zadavatele objednávky"
* group[=].element[=].target.code = #Z_PractitionerRoleCore.organization.name
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LMAuthorOrderCz"
* group[=].target = "https://hl7.cz/fhir/core/StructureDefinition/cz-encounter"
* group[=].element[+].code = #organizace
* group[=].element[=].display = "A.1.5.4 Organizace zadavatele objednávky"
* group[=].element[=].target.code = #CZ_Encounter.serviceProvider
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #relatedto

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LMRequestedPerformerOrderCz"
* group[=].target = "https://hl7.cz/fhir/core/StructureDefinition/cz-practitionerRole-core"
* group[=].element[+].code = #Provádějící
* group[=].element[=].display = "A.1.6 Provádějící"
* group[=].element[=].target.code = #CZ_ImagingInformationAboutOrder.performer
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent
* group[=].element[+].code = #id
* group[=].element[=].display = "A.1.6.1 ID Provádějícíe"
* group[=].element[=].target.code = #CZ_PractitionerRoleCore.practictioner.identifier
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent
* group[=].element[+].code = #jmeno
* group[=].element[=].display = "A.1.6.2 Jméno Provádějícíe"
* group[=].element[=].target.code = #CZ_PractitionerRoleCore.practictioner.name
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent
* group[=].element[+].code = #idOrganizace
* group[=].element[=].display = "A.1.6.3 ID organizace Provádějícíe"
* group[=].element[=].target.code = #CZ_PractitionerRoleCore.organization.identifier
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent
* group[=].element[+].code = #organizace
* group[=].element[=].display = "A.1.6.4 Organizace Provádějícíe"
* group[=].element[=].target.code = #CZ_PractitionerCore.organization.name
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LMAdditionalRecipientCz"
* group[=].target = "https://hl7.cz/fhir/core/StructureDefinition/cz-practitionerRole-core"
* group[=].element[+].code = #dodatecniPrijemci
* group[=].element[=].display = "A.1.7 Příjemce nálezu"
* group[=].element[=].target.code = #Composition.extension:informationRecipient
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent
* group[=].element[+].code = #identifikator
* group[=].element[=].display = "A.1.7.1 Identifikátor příjemce"
* group[=].element[=].target.code = #CZ_PractitionerRoleCore.practitioner.identifier
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent
* group[=].element[+].code = #jmeno
* group[=].element[=].display = "A.1.7.2 Jméno příjemce"
* group[=].element[=].target.code = #CZ_PractitionerRoleCore.practictioner.name
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent
* group[=].element[+].code = #idOrganizace
* group[=].element[=].display = "A.1.7.3 ID organizace příjemce"
* group[=].element[=].target.code = #CZ_PractitionerRoleCore.organization.identifier
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent
* group[=].element[+].code = #organizace
* group[=].element[=].display = "A.1.7.4 Organizace příjemce"
* group[=].element[=].target.code = #CZ_PractitionerRoleCore.organization.name
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LMDocumentMetadataCz"
* group[=].target = "https://hl7.cz/fhir/korder/StructureDefinition/BundleOrderCz"
* group[=].element[+].code = #idDokumentu
* group[=].element[=].display = "A.1.8.1 ID dokumentu"
* group[=].element[=].target.code = #Bundle.identifier
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent
* group[=].element[=].target.comment = "Pokud jde o identifikátor konkrétní instance objednávky"
* group[=].element[+].code = #datumACas
* group[=].element[=].display = "A.1.8.4 Datum a čas vytvoření"
* group[=].element[=].target.code = #Bundle.timeStamp
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent
* group[=].element[=].target.comment = "Pokud jde o čas, kdy byla tato konkrétní verze objednávky sestavena do Bundle."

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LMHeaderOrder"
* group[=].target = "https://hl7.cz/fhir/korder/StructureDefinition/KOrderCompositionCz"
* group[=].element[+].code = #subjekt
* group[=].element[=].display = "A.1.1 Identifikace a A.1.2 kontaktní informace pacienta/subjektu"
* group[=].element[=].target.code = #Composition.subject
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent
* group[=].element[+].code = #metadataDokumentu
* group[=].element[=].display = "A.1.8 Metadata dokumentu"
* group[=].element[=].target.code = #Composition
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #relatedto
* group[=].element[+].code = #metadataDokumentu.kategorie
* group[=].element[=].display = "A.1.8.2 Kategorie"
* group[=].element[=].target.code = #Composition.category
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent
* group[=].element[+].code = #metadataDokumentu.stav
* group[=].element[=].display = "A.1.8.3 Stav"
* group[=].element[=].target.code = #Composition.status
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent
* group[=].element[+].code = #metadataDokumentu.datumACas
* group[=].element[=].display = "A.1.8.4 Datum a čas vytvoření"
* group[=].element[=].target.code = #Composition.date
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent
* group[=].element[=].target.comment = "Pokud jde o čas vytvoření tohoto dokumentu nezávisle na jeho verzi"
* group[=].element[+].code = #metadataDokumentu.nazev
* group[=].element[=].display = "A.1.8.5 Název dokumentu"
* group[=].element[=].target.code = #Composition.title
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent
* group[=].element[+].code = #metadataDokumentu.spravce
* group[=].element[=].display = "A.1.8.6 Správce dokumentu"
* group[=].element[=].target.code = #Composition.custodian
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent
* group[=].element[+].code = #metadataDokumentu.duvernost
* group[=].element[=].display = "A.1.8.7 Důvěrnost"
* group[=].element[=].target.code = #Composition.confidentiality
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent
* group[=].element[+].code = #metadataDokumentu.jazyk
* group[=].element[=].display = "A.1.8.8 Jazyk"
* group[=].element[=].target.code = #Composition.language
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #relatedto
* group[=].element[+].code = #metadataDokumentu.verze
* group[=].element[=].display = "A.1.8.9 Verze"
* group[=].element[=].target.code = #Composition.extension:versionNumber.valueString
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent
* group[=].element[=].target.comment = "Jako business verze, nikoli jako verze resource"

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LMDigitalSignatureOrderCz"
* group[=].target = "https://hl7.cz/fhir/korder/StructureDefinition/CZ_Provenance"
* group[=].element[+].code = #podpis
* group[=].element[=].target.code = #Provenance.signature
* group[=].element[=].target.equivalence = #relatedto
* group[=].element[+].code = #podpis.autor
* group[=].element[=].target.code = #Provenance.agent.who
* group[=].element[=].target.equivalence = #equivalent
* group[=].element[+].code = #podpis.casoveRazitko
* group[=].element[=].target.code = #Provenance.signature.when
* group[=].element[=].target.equivalence = #equivalent