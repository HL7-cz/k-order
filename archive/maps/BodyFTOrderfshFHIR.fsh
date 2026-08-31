Instance: FTOrderBody2FHIRcz-cz
InstanceOf: ConceptMap
Usage: #definition
* url = "https://hl7.cz/fhir/korder/ConceptMap/FTOrderBody2FHIRcz-cz"
* name = "FTOrderBody2FHIRcz"
* title = "CZ FT-order Body Model to This Guide Map"
* status = #draft
* experimental = true
* description = "CZ FT-order Body (A.2-A.6) to FHIR mapping for ServiceRequest, Condition, DocumentReference, Provenance and Composition sections."


* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LMOrderInformationCz"
* group[=].target = "https://hl7.cz/fhir/korder/StructureDefinition/FTOrderServiceRequestCz"

///////////////////////////////////////////////////////////////////////////////
// A.2.1 - Detail objednávky
///////////////////////////////////////////////////////////////////////////////
* group[=].element[+].code = #detailyObjednavky
* group[=].element[=].display = "A.2.1 - Detail objednávky"
* group[=].element[=].target[0].code = #FTOrderServiceRequestCz
* group[=].element[=].target[0].display = ""
* group[=].element[=].target[0].equivalence = #equivalent
///////////////////////////////////////////////////////////////////////////////
// A.2.1.1 - Identifikátor detailu objednávky
///////////////////////////////////////////////////////////////////////////////
* group[=].element[+].code = #detailyObjednavky.identifikator
* group[=].element[=].display = "A.2.1.1 - Identifikátor detailu objednávky"
* group[=].element[=].target[0].code = #FTOrderServiceRequestCz.identifier
* group[=].element[=].target[0].display = ""
* group[=].element[=].target[0].equivalence = #equivalent
///////////////////////////////////////////////////////////////////////////////
// A.2.1.2 - Datum a čas vytvoření objednávky
///////////////////////////////////////////////////////////////////////////////
* group[=].element[+].code = #detailyObjednavky.datumCasVytvoreni
* group[=].element[=].display = "A.2.1.2 - Datum a čas vytvoření objednávky"
* group[=].element[=].target[0].code = #FTOrderServiceRequestCz.authoredOn
* group[=].element[=].target[0].display = ""
* group[=].element[=].target[0].equivalence = #equivalent
///////////////////////////////////////////////////////////////////////////////
// A.2.1.3 - Datum a čas požadovaného provedení
///////////////////////////////////////////////////////////////////////////////
* group[=].element[+].code = #detailyObjednavky.pozadovanyTermin
* group[=].element[=].display = "A.2.1.3 - Datum a čas požadovaného provedení"
* group[=].element[=].target[0].code = #FTOrderServiceRequestCz.occurrenceDateTime
* group[=].element[=].target[0].display = ""
* group[=].element[=].target[0].equivalence = #equivalent
///////////////////////////////////////////////////////////////////////////////
// A.2.1.4 - Urgence objednávky
///////////////////////////////////////////////////////////////////////////////
* group[=].element[+].code = #detailyObjednavky.urgence
* group[=].element[=].display = "A.2.1.4 - Urgence objednávky"
* group[=].element[=].target[0].code = #FTOrderServiceRequestCz.priority
* group[=].element[=].target[0].display = ""
* group[=].element[=].target[0].equivalence = #equivalent
///////////////////////////////////////////////////////////////////////////////
// A.2.1.5 - Text objednávky
///////////////////////////////////////////////////////////////////////////////
* group[=].element[+].code = #detailyObjednavky.textObjednavky
* group[=].element[=].display = "A.2.1.5 - Text objednávky"
* group[=].element[=].target[0].code = #FTOrderServiceRequestCz.note.text
* group[=].element[=].target[0].equivalence = #equivalent
///////////////////////////////////////////////////////////////////////////////
// A.2.1.6 - Informace pro pacienta
///////////////////////////////////////////////////////////////////////////////
* group[=].element[+].code = #detailyObjednavky.informaceProPacienta
* group[=].element[=].display = "A.2.1.6 - Informace pro pacienta"
* group[=].element[=].target[0].code = #ServiceRequest.patientInstruction
* group[=].element[=].target[0].equivalence = #equivalent
///////////////////////////////////////////////////////////////////////////////
// A.2.2 - Odůvodnění vyšetření
///////////////////////////////////////////////////////////////////////////////
* group[=].element[+].code = #duvodObjednavky
* group[=].element[=].display = "A.2.2 - Odůvodnění vyšetření (důvod objednávky)"
* group[=].element[=].target[0].code = #ServiceRequest.reasonCode
* group[=].element[=].target[0].equivalence = #relatedto
///////////////////////////////////////////////////////////////////////////////
// A.2.2.1 - Popis problému / diagnózy / stavu – indikační diagnóza
///////////////////////////////////////////////////////////////////////////////
* group[=].element[+].code = #duvodObjednavky.problem
* group[=].element[=].display = "A.2.2.1 - Popis problému / diagnózy / stavu – indikační diagnóza (Hlavní)"
* group[=].element[=].target[0].code = #ServiceRequest.reasonCode.coding[diagnosis]
* group[=].element[=].target[0].equivalence = #equivalent
///////////////////////////////////////////////////////////////////////////////
// A.2.2.2 - Klinická otázka kódem
///////////////////////////////////////////////////////////////////////////////
* group[=].element[+].code = #duvodObjednavky.klinickaOtazkaKod
* group[=].element[=].display = "A.2.2.2 - Klinická otázka kódem"
* group[=].element[=].target[0].code = #ServiceRequest.reasonCode.coding[reason]
* group[=].element[=].target[0].equivalence = #equivalent
///////////////////////////////////////////////////////////////////////////////
// A.2.2.3 - Klinická otázka textem
///////////////////////////////////////////////////////////////////////////////
* group[=].element[+].code = #duvodObjednavky.klinickaOtazkaText
* group[=].element[=].display = "A.2.2.3 - Klinická otázka textem"
* group[=].element[=].target[0].code = #ServiceRequest.reasonCode.text
* group[=].element[=].target[0].equivalence = #equivalent
///////////////////////////////////////////////////////////////////////////////
// A.2.3 - Klinická událost
///////////////////////////////////////////////////////////////////////////////

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LMClinicalEventCz"
* group[=].target = "https://hl7.cz/fhir/cz/core/StructureDefinition/CZ_Encounter"

* group[=].element[+].code = #klinickaUdalost
* group[=].element[=].display = "A.2.3 - Klinická událost (encounter)"
* group[=].element[=].target.code = #ServiceRequest.encounter
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #relatedto
* group[=].element[=].target.comment = "ServiceRequest.encounter.ofType(CZ_Encounter)"

///////////////////////////////////////////////////////////////////////////////
// A.2.3.1 - ID klinické události
///////////////////////////////////////////////////////////////////////////////

* group[=].element[+].code = #identifikator
* group[=].element[=].display = "A.2.3.1 - ID klinické události"
* group[=].element[=].target.code = #CZ_Encounter.identifier
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent

///////////////////////////////////////////////////////////////////////////////
// A.2.3.2 - Typ klinické události
///////////////////////////////////////////////////////////////////////////////

* group[=].element[+].code = #typ
* group[=].element[=].display = "A.2.3.2 - Typ klinické události"
* group[=].element[=].target.code = #CZ_Encounter.type
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent

///////////////////////////////////////////////////////////////////////////////
// A.2.3.3 - Další informace o klinické události
///////////////////////////////////////////////////////////////////////////////

* group[=].element[+].code = #dalsiInformace
* group[=].element[=].display = "A.2.3.3 - Další informace o klinické události"
* group[=].element[=].target.code = #CZ_Encounter.type.text
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent
///////////////////////////////////////////////////////////////////////////////
// A.2.4 - Úhrada
///////////////////////////////////////////////////////////////////////////////

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LMCoverageBodyCz"
* group[=].target = "https://hl7.cz/fhir/core/StructureDefinition/cz-coverage"

* group[=].element[+].code = #uhrada
* group[=].element[=].display = "A.2.4 - Úhrada"
* group[=].element[=].target[0].code = #ServiceRequest.insurance
* group[=].element[=].target[0].equivalence = #relatedto

///////////////////////////////////////////////////////////////////////////////
// A.2.4.1 - Způsob úhrady
///////////////////////////////////////////////////////////////////////////////

* group[=].element[+].code = #zpusob
* group[=].element[=].display = "A.2.4.1 - Způsob úhrady"
* group[=].element[=].target[0].code = #Coverage.type
* group[=].element[=].target[0].equivalence = #equivalent

///////////////////////////////////////////////////////////////////////////////
// A.2.4.2 - Informace o plátci
///////////////////////////////////////////////////////////////////////////////

* group[=].element[+].code = #informaceOPlatci
* group[=].element[=].display = "A.2.4.2 - Informace o plátci"
* group[=].element[=].target[0].code = #Coverage.payor
* group[=].element[=].target[0].equivalence = #relatedto

///////////////////////////////////////////////////////////////////////////////
// A.2.4.2.1 - Jméno plátce
///////////////////////////////////////////////////////////////////////////////

* group[=].element[+].code = #informaceOPlatci.jmeno
* group[=].element[=].display = "A.2.4.2.1 - Jméno plátce"
* group[=].element[=].target[0].code = #RelatedPerson.name
* group[=].element[=].target[0].equivalence = #equivalent

///////////////////////////////////////////////////////////////////////////////
// A.2.4.2.2 - ID organizace plátce
///////////////////////////////////////////////////////////////////////////////

* group[=].element[+].code = #informaceOPlatci.identifikatorOrganizace
* group[=].element[=].display = "A.2.4.2.2 - ID organizace plátce"
* group[=].element[=].target[0].code = #Organization.identifier
* group[=].element[=].target[0].equivalence = #equivalent

///////////////////////////////////////////////////////////////////////////////
// A.2.4.2.3 - Organizace plátce
///////////////////////////////////////////////////////////////////////////////

* group[=].element[+].code = #informaceOPlatci.organizace
* group[=].element[=].display = "A.2.4.2.3 - Organizace plátce"
* group[=].element[=].target[0].code = #Organization
* group[=].element[=].target[0].equivalence = #equivalent

///////////////////////////////////////////////////////////////////////////////
// A.2.4.2.4 - Adresa plátce
///////////////////////////////////////////////////////////////////////////////

* group[=].element[+].code = #informaceOPlatci.adresa
* group[=].element[=].display = "A.2.4.2.4 - Adresa"
* group[=].element[=].target[0].code = #Organization.address
* group[=].element[=].target[0].equivalence = #equivalent

///////////////////////////////////////////////////////////////////////////////
// A.2.4.2.5 - Země
///////////////////////////////////////////////////////////////////////////////

* group[=].element[+].code = #informaceOPlatci.zeme
* group[=].element[=].display = "A.2.4.2.5 - Země"
* group[=].element[=].target[0].code = #Organization.address.country
* group[=].element[=].target[0].equivalence = #equivalent

///////////////////////////////////////////////////////////////////////////////
// A.2.4.2.6 - Telekom
///////////////////////////////////////////////////////////////////////////////

* group[=].element[+].code = #informaceOPlatci.telekom
* group[=].element[=].display = "A.2.4.2.6 - Telekom"
* group[=].element[=].target[0].code = #Organization.telecom
* group[=].element[=].target[0].equivalence = #equivalent

///////////////////////////////////////////////////////////////////////////////
// A.2.4.3 - Komentář
///////////////////////////////////////////////////////////////////////////////

* group[=].element[+].code = #komentar
* group[=].element[=].display = "A.2.4.3 - Komentář"
* group[=].element[=].target[0].code = #Coverage.extension:comment
* group[=].element[=].target[0].equivalence = #equivalent

///////////////////////////////////////////////////////////////////////////////
// A.2.5 - Termín návštěvy
///////////////////////////////////////////////////////////////////////////////

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LMAppointmentCz"
* group[=].target = "https://hl7.cz/fhir/korder/StructureDefinition/cz-appointmentOrder"

* group[=].element[+].code = #terminNavstevy
* group[=].element[=].display = "A.2.5 - Termín návštěvy"
* group[=].element[=].target.code = #ServiceRequest.supportingInfo
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #relatedto
* group[=].element[=].target.comment = "ServiceRequest.supportingInfo.ofType(CZ_AppointmentOrder)"

///////////////////////////////////////////////////////////////////////////////
// A.2.5.1 - Termín ID
///////////////////////////////////////////////////////////////////////////////

* group[=].element[+].code = #id
* group[=].element[=].display = "A.2.5.1 - Termín ID"
* group[=].element[=].target.code = #CZ_AppointmentOrder.identifier
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent

///////////////////////////////////////////////////////////////////////////////
// A.2.5.2 - Stav termínu
///////////////////////////////////////////////////////////////////////////////

* group[=].element[+].code = #stav
* group[=].element[=].display = "A.2.5.2 - Stav termínu"
* group[=].element[=].target.code = #CZ_AppointmentOrder.status
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent

///////////////////////////////////////////////////////////////////////////////
// A.2.5.3 - Popis
///////////////////////////////////////////////////////////////////////////////

* group[=].element[+].code = #popis
* group[=].element[=].display = "A.2.5.3 - Popis"
* group[=].element[=].target.code = #CZ_AppointmentOrder.description
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent

///////////////////////////////////////////////////////////////////////////////
// A.2.5.4 - Plánovaný čas
///////////////////////////////////////////////////////////////////////////////

* group[=].element[+].code = #datumACas
* group[=].element[=].display = "A.2.5.4 - Plánovaný čas"
* group[=].element[=].target.code = #CZ_AppointmentOrder.created
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent

///////////////////////////////////////////////////////////////////////////////
// A.2.5.5 - Délka vyšetření
///////////////////////////////////////////////////////////////////////////////

* group[=].element[+].code = #delkaVysetreni
* group[=].element[=].display = "A.2.5.5 - Délka vyšetření"
* group[=].element[=].target.code = #CZ_AppointmentOrder.minutesDuration
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent

///////////////////////////////////////////////////////////////////////////////
// A.2.5.6 - Komentář
///////////////////////////////////////////////////////////////////////////////

* group[=].element[+].code = #komentar
* group[=].element[=].display = "A.2.5.6 - Komentář"
* group[=].element[=].target.code = #CZ_AppointmentOrder.comment
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent

///////////////////////////////////////////////////////////////////////////////
// A.2.5.7 - Instrukce pro pacienta
///////////////////////////////////////////////////////////////////////////////

* group[=].element[+].code = #instrukceProPacienta
* group[=].element[=].display = "A.2.5.7 - Instrukce pro pacienta"
* group[=].element[=].target.code = #CZ_AppointmentOrder.patientInstruction
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent

///////////////////////////////////////////////////////////////////////////////
// A.2.5.8 - Místo
///////////////////////////////////////////////////////////////////////////////

* group[=].element[+].code = #misto
* group[=].element[=].display = "A.2.5.8 - Místo obědnání"
* group[=].element[=].target.code = #CZ_AppointmentOrder.participant.actor
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #relatedto

///////////////////////////////////////////////////////////////////////////////
// A.3.1.1 - Biometricke udaje -> BodyWeight + BodyHeight
///////////////////////////////////////////////////////////////////////////////
* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LMClinicalInformationCz"
* group[=].target = "https://hl7.cz/fhir/korder/StructureDefinition/cz-bodyweight"
* group[=].element[+].code = #biometrickeUdaje.vaha
* group[=].element[=].target.code = #CZ_BodyWeight
* group[=].element[=].target.equivalence = #relatedto
* group[=].element[+].code = #biometrickeUdaje.vaha.hodnota
* group[=].element[=].target.code = #CZ_BodyWeight.valueQuantity
* group[=].element[=].target.equivalence = #equivalent

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LMClinicalInformationCz"
* group[=].target = "https://hl7.cz/fhir/korder/StructureDefinition/cz-bodyheight"
* group[=].element[+].code = #biometrickeUdaje.vyska
* group[=].element[=].target.code = #CZ_BodyHeight
* group[=].element[=].target.equivalence = #relatedto
* group[=].element[+].code = #biometrickeUdaje.vyska.hodnota
* group[=].element[=].target.code = #CZ_BodyHeight.valueQuantity
* group[=].element[=].target.equivalence = #equivalent

///////////////////////////////////////////////////////////////////////////////
// A.3.1.2 - Další klinické informace -> Vedlejší diagnoza
///////////////////////////////////////////////////////////////////////////////

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LMClinicalInformationCz"
* group[=].target = "https://hl7.cz/fhir/cz/core/StructureDefinition/CZ_ConditionCore"

* group[=].element[+].code = #dalsiRelevantniKlinickeInformace
* group[=].element[=].display = "A.3.1.2 - Další relevantní klinické informace"
* group[=].element[=].target[0].code = #ServiceRequest.supportingInfo
* group[=].element[=].target[0].equivalence = #relatedto

* group[=].element[+].code = #dalsiRelevantniKlinickeInformace.kod
* group[=].element[=].display = "A.3.1.2.1 - Kód další klinické informace"
* group[=].element[=].target[0].code = #Condition.code.coding
* group[=].element[=].target[0].equivalence = #equivalent

* group[=].element[+].code = #dalsiRelevantniKlinickeInformace.text
* group[=].element[=].display = "A.3.1.2.2 - Text další klinické informace"
* group[=].element[=].target[0].code = #Condition.code.text
* group[=].element[=].target[0].equivalence = #equivalent


///////////////////////////////////////////////////////////////////////////////
// A.3.1.3 - Medikace -> MedicationStatement
///////////////////////////////////////////////////////////////////////////////

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LMClinicalInformationCz"
* group[=].target = "https://hl7.cz/fhir/cz/core/StructureDefinition/CZ_MedicationStatement"

* group[=].element[+].code = #mozneKontraindikaceVLecbe
* group[=].element[=].display = "A.3.1.3 - Možné kontraindikace v medikaci"
* group[=].element[=].target[0].code = #ServiceRequest.supportingInfo
* group[=].element[=].target[0].equivalence = #relatedto

* group[=].element[+].code = #mozneKontraindikaceVLecbe.identifikator
* group[=].element[=].display = "A.3.1.3.1 - Identifikátor medikace"
* group[=].element[=].target[0].code = #MedicationStatement.identifier
* group[=].element[=].target[0].equivalence = #equivalent

* group[=].element[+].code = #mozneKontraindikaceVLecbe.kod
* group[=].element[=].display = "A.3.1.3.2 - Kód medikace"
* group[=].element[=].target[0].code = #MedicationStatement.medicationCodeableConcept
* group[=].element[=].target[0].equivalence = #equivalent

* group[=].element[+].code = #mozneKontraindikaceVLecbe.mnozstvi
* group[=].element[=].display = "A.3.1.3.3 - Množství medikace"
* group[=].element[=].target[0].code = #MedicationStatement.dosage.doseAndRate.doseQuantity
* group[=].element[=].target[0].equivalence = #equivalent

///////////////////////////////////////////////////////////////////////////////
// A.3.1.4 - Implantát -> DeviceUseStatement
///////////////////////////////////////////////////////////////////////////////

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LMClinicalInformationCz"
* group[=].target = "https://hl7.cz/fhir/cz/core/StructureDefinition/CZ_DeviceUseStatement"

* group[=].element[+].code = #implantat
* group[=].element[=].display = "A.3.1.4 - Implantát"
* group[=].element[=].target[0].code = #ServiceRequest.supportingInfo
* group[=].element[=].target[0].equivalence = #relatedto

* group[=].element[+].code = #implantat.typ
* group[=].element[=].display = "A.3.1.4.1 - Typ implantátu"
* group[=].element[=].target[0].code = #DeviceUseStatement.device
* group[=].element[=].target[0].equivalence = #equivalent

* group[=].element[+].code = #implantat.identifikator
* group[=].element[=].display = "A.3.1.4.2 - Identifikátor implantátu"
* group[=].element[=].target[0].code = #Device.identifier
* group[=].element[=].target[0].equivalence = #equivalent

* group[=].element[+].code = #implantat.model
* group[=].element[=].display = "A.3.1.4.3 - Model implantátu"
* group[=].element[=].target[0].code = #Device.modelNumber
* group[=].element[=].target[0].equivalence = #equivalent

* group[=].element[+].code = #implantat.castTela
* group[=].element[=].display = "A.3.1.4.4 - Část těla"
* group[=].element[=].target[0].code = #DeviceUseStatement.bodySite
* group[=].element[=].target[0].equivalence = #equivalent

///////////////////////////////////////////////////////////////////////////////
// A.3.1.5 - Alergie a varování
///////////////////////////////////////////////////////////////////////////////

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LMClinicalInformationCz"
* group[=].target = "https://hl7.cz/fhir/cz/core/StructureDefinition/CZ_AllergyIntolerance"

* group[=].element[+].code = #alergie
* group[=].element[=].display = "A.3.1.5.1 - Alergie a intolerance"
* group[=].element[=].target[0].code = #ServiceRequest.supportingInfo
* group[=].element[=].target[0].equivalence = #relatedto

* group[=].element[+].code = #alergie.identifikator
* group[=].element[=].display = "A.3.1.5.1.1 - Identifikátor alergie"
* group[=].element[=].target[0].code = #AllergyIntolerance.identifier
* group[=].element[=].target[0].equivalence = #equivalent

* group[=].element[+].code = #alergie.klinickyStav
* group[=].element[=].display = "A.3.1.5.1.2 - Klinický stav alergie"
* group[=].element[=].target[0].code = #AllergyIntolerance.clinicalStatus
* group[=].element[=].target[0].equivalence = #equivalent

* group[=].element[+].code = #alergie.typ
* group[=].element[=].display = "A.3.1.5.1.3 - Typ alergie"
* group[=].element[=].target[0].code = #AllergyIntolerance.type
* group[=].element[=].target[0].equivalence = #equivalent

* group[=].element[+].code = #alergie.kategorie
* group[=].element[=].display = "A.3.1.5.1.4 - Kategorie alergie"
* group[=].element[=].target[0].code = #AllergyIntolerance.category
* group[=].element[=].target[0].equivalence = #equivalent

* group[=].element[+].code = #alergie.kod
* group[=].element[=].display = "A.3.1.5.1.5 - Kód alergie"
* group[=].element[=].target[0].code = #AllergyIntolerance.code
* group[=].element[=].target[0].equivalence = #equivalent

* group[=].element[+].code = #alergie.poznamka
* group[=].element[=].display = "A.3.1.5.1.6 - Poznámka k alergii"
* group[=].element[=].target[0].code = #AllergyIntolerance.note
* group[=].element[=].target[0].equivalence = #equivalent

///////////////////////////////////////////////////////////////////////////////
// A.3.1.5.2 - Varování -> Flag
///////////////////////////////////////////////////////////////////////////////

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LMClinicalInformationCz"
* group[=].target = "https://hl7.cz/fhir/cz/core/StructureDefinition/CZ_Flag"

* group[=].element[+].code = #varovani
* group[=].element[=].display = "A.3.1.5.2 - Varování"
* group[=].element[=].target[0].code = #ServiceRequest.supportingInfo
* group[=].element[=].target[0].equivalence = #relatedto

* group[=].element[+].code = #varovani.text
* group[=].element[=].display = "A.3.1.5.2.1 - Text varování"
* group[=].element[=].target[0].code = #Flag.code.text
* group[=].element[=].target[0].equivalence = #equivalent


///////////////////////////////////////////////////////////////////////////////
// A.3.2 - Datové elementy objednávky / vyšetření
///////////////////////////////////////////////////////////////////////////////
* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LMFTOrderDataElementsCz"
* group[=].target = "https://hl7.cz/fhir/korder/StructureDefinition/FTOrderServiceRequestCz"

///////////////////////////////////////////////////////////////////////////////
// A.3.2.1 - Požadované vyšetření
///////////////////////////////////////////////////////////////////////////////

* group[=].element[+].code = #pozadovaneVysetreni
* group[=].element[=].display = "A.3.2.1 - Požadované vyšetření"
* group[=].element[=].target[0].code = #ServiceRequest
* group[=].element[=].target[0].equivalence = #relatedto

///////////////////////////////////////////////////////////////////////////////
// A.3.2.1.1 - Kód vyšetření
///////////////////////////////////////////////////////////////////////////////

* group[=].element[+].code = #pozadovaneVysetreni.kod
* group[=].element[=].display = "A.3.2.1.1 - Kód vyšetření"
* group[=].element[=].target[0].code = #ServiceRequest.code
* group[=].element[=].target[0].equivalence = #equivalent

///////////////////////////////////////////////////////////////////////////////
// A.3.2.1.2 - Název vyšetření
///////////////////////////////////////////////////////////////////////////////

* group[=].element[+].code = #pozadovaneVysetreni.nazev
* group[=].element[=].display = "A.3.2.1.2 - Název vyšetření"
* group[=].element[=].target[0].code = #ServiceRequest.code.text
* group[=].element[=].target[0].equivalence = #equivalent

///////////////////////////////////////////////////////////////////////////////
// A.3.2.1.3 - Část těla
///////////////////////////////////////////////////////////////////////////////

* group[=].element[+].code = #pozadovaneVysetreni.castTela
* group[=].element[=].display = "A.3.2.1.3 - Část těla"
* group[=].element[=].target.code = #FTOrderServiceRequestCz.extension:bodySite.location
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent

///////////////////////////////////////////////////////////////////////////////
// A.3.2.1.4 - Lateralita
///////////////////////////////////////////////////////////////////////////////

* group[=].element[+].code = #pozadovaneVysetreni.lateralita
* group[=].element[=].display = "A.3.2.1.4 - Lateralita"
* group[=].element[=].target.code = #FTOrderServiceRequestCz.extension:bodySite.extension:laterality
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent

///////////////////////////////////////////////////////////////////////////////
// A.3.2.1.5 - Počet
///////////////////////////////////////////////////////////////////////////////

* group[=].element[+].code = #pozadovaneVysetreni.pocet
* group[=].element[=].display = "A.3.2.1.5 - Počet"
* group[=].element[=].target.code = #FTOrderServiceRequestCz.quantityQuantity.value
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent

///////////////////////////////////////////////////////////////////////////////
// A.3.2.1.7 - Poznámka
///////////////////////////////////////////////////////////////////////////////

* group[=].element[+].code = #pozadovaneVysetreni.poznamka
* group[=].element[=].display = "A.3.2.1.7 - Poznámka"
* group[=].element[=].target.code = #FTOrderServiceRequestCz.note.text
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent

///////////////////////////////////////////////////////////////////////////////
// A.3.2.1.8 - Místo poskytnutí péče
///////////////////////////////////////////////////////////////////////////////

* group[=].element[+].code = #pozadovaneVysetreni.mistoPoskytnutiPece
* group[=].element[=].display = "A.3.2.1.8 - Místo poskytnutí péče"
* group[=].element[=].target.code = #FTOrderServiceRequestCz.locationCode
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent
