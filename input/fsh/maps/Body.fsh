Instance: BodyKOrder2FHIR-cz
InstanceOf: ConceptMap
Usage: #definition
* url = "https://hl7.cz/fhir/korder/ConceptMap/BodyKOrder2FHIR-cz"
* name = "BodyKOrder2FHIRcz"
* title = "CZ Body Model to this guide Map"
* status = #draft
* experimental = true
* description = """Mapování těla aktuálního czech-model logického modelu žádanek na profily a resource použité v tomto IG."""

// ---------------------------------------------------------------------------
// A.2.1 / A.2.2 - Informace o objednĂˇvce a odĹŻvodnÄ›nĂ­
// ---------------------------------------------------------------------------

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LMOrderInformationCz"
* group[=].target = "https://hl7.cz/fhir/korder/StructureDefinition/KOrderServiceRequestCz"

* group[=].element[+].code = #LMOrderInformationCz.detailyObjednavky.identifikator
* group[=].element[=].display = "A.2.1.1 - ID objednĂˇvky"
* group[=].element[=].target.code = #ServiceRequest.identifier
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMOrderInformationCz.detailyObjednavky.datumACas
* group[=].element[=].display = "A.2.1.2 - Datum a ÄŤas objednĂˇvky"
* group[=].element[=].target.code = #ServiceRequest.authoredOn
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMOrderInformationCz.detailyObjednavky.datumACasPozadovanehoProvedeni
* group[=].element[=].display = "A.2.1.3 - Datum a ÄŤas poĹľadovanĂ©ho provedenĂ­"
* group[=].element[=].target.code = #ServiceRequest.occurrenceDateTime
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMOrderInformationCz.detailyObjednavky.urgentnost
* group[=].element[=].display = "A.2.1.4 - NalĂ©havost poĹľadavku / urgentnost objednĂˇvky"
* group[=].element[=].target.code = #ServiceRequest.priority
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMOrderInformationCz.detailyObjednavky.textObjednavky
* group[=].element[=].display = "A.2.1.5 - Text objednĂˇvky"
* group[=].element[=].target.code = #ServiceRequest.note
* group[=].element[=].target.equivalence = #relatedto

* group[=].element[+].code = #LMOrderInformationCz.detailyObjednavky.informaceProPacienta
* group[=].element[=].display = "A.2.1.6 - Informace pro pacienta"
* group[=].element[=].target.code = #ServiceRequest.patientInstruction
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMOrderInformationCz.duvodObjednavky.problem
* group[=].element[=].display = "A.2.2.1 - Popis problĂ©mu / diagnĂłzy / stavu - indikaÄŤnĂ­ diagnĂłza"
* group[=].element[=].target.code = #ServiceRequest.reasonCode
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMOrderInformationCz.duvodObjednavky.klinickaOtazkaKod
* group[=].element[=].display = "A.2.2.2 - KlinickĂˇ otĂˇzka kĂłdem"
* group[=].element[=].target.code = #ServiceRequest.reasonCode
* group[=].element[=].target.equivalence = #relatedto

* group[=].element[+].code = #LMOrderInformationCz.duvodObjednavky.klinickaOtazkaText
* group[=].element[=].display = "A.2.2.3 - KlinickĂˇ otĂˇzka textem"
* group[=].element[=].target.code = #ServiceRequest.note
* group[=].element[=].target.equivalence = #relatedto

* group[=].element[+].code = #LMOrderInformationCz.duvodObjednavky.duvodKod
* group[=].element[=].display = "A.2.2.4 - DĹŻvod objednĂˇvky kĂłdem"
* group[=].element[=].target.code = #ServiceRequest.reasonCode
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMOrderInformationCz.duvodObjednavky.duvodText
* group[=].element[=].display = "A.2.2.5 - DĹŻvod objednĂˇvky textem"
* group[=].element[=].target.code = #ServiceRequest.note
* group[=].element[=].target.equivalence = #relatedto

// ---------------------------------------------------------------------------
// A.2.3 / A.2.4 / A.2.5 / A.2.6 - Encounter, Ăşhrada, termĂ­n a vzorek
// ---------------------------------------------------------------------------

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LMClinicalEventCz"
* group[=].target = "https://hl7.cz/fhir/core/StructureDefinition/cz-encounter"

* group[=].element[+].code = #LMClinicalEventCz.identifikator
* group[=].element[=].display = "A.2.3.1 - ID klinickĂ© udĂˇlosti"
* group[=].element[=].target.code = #Encounter.identifier
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMClinicalEventCz.typ
* group[=].element[=].display = "A.2.3.2 - Typ klinickĂ© udĂˇlosti"
* group[=].element[=].target.code = #Encounter.type
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMClinicalEventCz.dalsiInformace
* group[=].element[=].display = "A.2.3.3 - DalĹˇĂ­ informace o klinickĂ© udĂˇlosti"
* group[=].element[=].target.code = #Encounter.text
* group[=].element[=].target.equivalence = #relatedto

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LMCoverageBodyCz"
* group[=].target = "https://hl7.cz/fhir/core/StructureDefinition/cz-coverage"

* group[=].element[+].code = #LMCoverageBodyCz.zpusob
* group[=].element[=].display = "A.2.4.1 - ZpĹŻsob Ăşhrady"
* group[=].element[=].target.code = #Coverage.type
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMCoverageBodyCz.informaceOPlatci
* group[=].element[=].display = "A.2.4.2 - Informace o plĂˇtci"
* group[=].element[=].target.code = #Coverage.payor
* group[=].element[=].target.equivalence = #relatedto

* group[=].element[+].code = #LMCoverageBodyCz.komentar
* group[=].element[=].display = "A.2.4.3 - KomentĂˇĹ™"
* group[=].element[=].target.code = #Coverage.text
* group[=].element[=].target.equivalence = #relatedto

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LMAppointmentCz"
* group[=].target = "http://hl7.org/fhir/StructureDefinition/Appointment"

* group[=].element[+].code = #LMAppointmentCz.id
* group[=].element[=].display = "A.2.5.1 - TermĂ­n ID"
* group[=].element[=].target.code = #Appointment.identifier
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMAppointmentCz.stav
* group[=].element[=].display = "A.2.5.2 - Stav termĂ­nu"
* group[=].element[=].target.code = #Appointment.status
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMAppointmentCz.popis
* group[=].element[=].display = "A.2.5.3 - Popis"
* group[=].element[=].target.code = #Appointment.description
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMAppointmentCz.datumACas
* group[=].element[=].display = "A.2.5.4 - PlĂˇnovanĂ˝ ÄŤas"
* group[=].element[=].target.code = #Appointment.start
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMAppointmentCz.delkaVysetreni
* group[=].element[=].display = "A.2.5.5 - DĂ©lka vyĹˇetĹ™enĂ­"
* group[=].element[=].target.code = #Appointment.minutesDuration
* group[=].element[=].target.equivalence = #relatedto

* group[=].element[+].code = #LMAppointmentCz.komentar
* group[=].element[=].display = "A.2.5.6 - KomentĂˇĹ™"
* group[=].element[=].target.code = #Appointment.comment
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMAppointmentCz.instrukceProPacienta
* group[=].element[=].display = "A.2.5.7 - Instrukce pro pacienta"
* group[=].element[=].target.code = #Appointment.patientInstruction
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMAppointmentCz.misto
* group[=].element[=].display = "A.2.5.8 - MĂ­sto"
* group[=].element[=].target.code = #Appointment.participant.actor
* group[=].element[=].target.equivalence = #relatedto
* group[=].element[=].target.comment = "MĂ­sto termĂ­nu je vhodnĂ© reprezentovat jako Location referencovanĂ© pĹ™es Appointment.participant.actor."

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LMSpecimenInformationCz"
* group[=].target = "https://hl7.cz/fhir/core/StructureDefinition/cz-specimen"

* group[=].element[+].code = #LMSpecimenInformationCz.identifikator
* group[=].element[=].display = "A.2.6.1 - IdentifikĂˇtor vzorku"
* group[=].element[=].target.code = #Specimen.identifier
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMSpecimenInformationCz.druhOrganismu
* group[=].element[=].display = "A.2.6.2 - Druh organismu"
* group[=].element[=].target.code = #Specimen.subject
* group[=].element[=].target.equivalence = #relatedto
* group[=].element[=].target.comment = "V R4 Specimen nemĂˇ pĹ™Ă­mĂ˝ subject.species; druh organismu je potĹ™eba Ĺ™eĹˇit pĹ™es subject nebo extension."

* group[=].element[+].code = #LMSpecimenInformationCz.material
* group[=].element[=].display = "A.2.6.3 - MateriĂˇl"
* group[=].element[=].target.code = #Specimen.type
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMSpecimenInformationCz.datumACasOdberu
* group[=].element[=].display = "A.2.6.4 - Datum a ÄŤas odbÄ›ru"
* group[=].element[=].target.code = #Specimen.collection.collectedDateTime
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMSpecimenInformationCz.datumACasTransportu
* group[=].element[=].display = "A.2.6.5 - Datum a ÄŤas transportu"
* group[=].element[=].target.code = #Specimen.receivedTime
* group[=].element[=].target.equivalence = #relatedto
* group[=].element[=].target.comment = "FHIR R4 mĂˇ Specimen.receivedTime, nikoli pĹ™esnĂ˝ ÄŤas zahĂˇjenĂ­ transportu."

* group[=].element[+].code = #LMSpecimenInformationCz.typVzorku
* group[=].element[=].display = "A.2.6.6 - Typ vzorku"
* group[=].element[=].target.code = #Specimen.type
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMSpecimenInformationCz.anatomickaLokalizace
* group[=].element[=].display = "A.2.6.7 - AnatomickĂˇ lokalizace"
* group[=].element[=].target.code = #Specimen.collection.bodySite
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMSpecimenInformationCz.morfologie
* group[=].element[=].display = "A.2.6.8 - Morfologie"
* group[=].element[=].target.code = #Specimen.collection.bodySite
* group[=].element[=].target.equivalence = #relatedto
* group[=].element[=].target.comment = "Morfologie mĂ­sta odbÄ›ru vyĹľaduje pĹ™esnÄ›jĹˇĂ­ extension nebo BodyStructure, pokud mĂˇ bĂ˝t zachovĂˇna strukturovanÄ›."

* group[=].element[+].code = #LMSpecimenInformationCz.nastroj
* group[=].element[=].display = "A.2.6.9 - NĂˇstroj"
* group[=].element[=].target.code = #Specimen.collection.method
* group[=].element[=].target.equivalence = #relatedto
* group[=].element[=].target.comment = "NĂˇstroj nenĂ­ totĂ©Ĺľ co metoda odbÄ›ru; pro pĹ™esnĂ© mapovĂˇnĂ­ je vhodnĂˇ extension."

* group[=].element[+].code = #LMSpecimenInformationCz.metodaOdberu
* group[=].element[=].display = "A.2.6.9 - Metoda odbÄ›ru"
* group[=].element[=].target.code = #Specimen.collection.method
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMSpecimenInformationCz.zdrojoveZarizeni
* group[=].element[=].display = "A.2.6.11 - ZdrojovĂ© zaĹ™Ă­zenĂ­"
* group[=].element[=].target.code = #Specimen.subject
* group[=].element[=].target.equivalence = #relatedto
* group[=].element[=].target.comment = "PouĹľitelnĂ©, pokud je subjektem vzorku Device; jinak vyĹľaduje extension."

* group[=].element[+].code = #LMSpecimenInformationCz.mistoOdberu
* group[=].element[=].display = "A.2.6.12 - MĂ­sto odbÄ›ru"
* group[=].element[=].target.code = #Specimen.collection.extension
* group[=].element[=].target.equivalence = #relatedto
* group[=].element[=].target.comment = "MĂ­sto odbÄ›ru jako prostĹ™edĂ­ nenĂ­ v R4 Specimen pĹ™Ă­mo oddÄ›lenĂ© od anatomickĂ© lokalizace."

* group[=].element[+].code = #LMSpecimenInformationCz.poznamka
* group[=].element[=].display = "A.2.6.13 - PoznĂˇmka"
* group[=].element[=].target.code = #Specimen.note
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMSpecimenInformationCz.nadoba
* group[=].element[=].display = "A.2.6.14 - NĂˇdoba"
* group[=].element[=].target.code = #Specimen.container
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMSpecimenInformationCz.nadoba.typ
* group[=].element[=].display = "A.2.6.14.1 - Typ"
* group[=].element[=].target.code = #Specimen.container.type
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMSpecimenInformationCz.nadoba.pocet
* group[=].element[=].display = "A.2.6.14.2 - PoÄŤet"
* group[=].element[=].target.code = #Specimen.container.specimenQuantity
* group[=].element[=].target.equivalence = #relatedto

* group[=].element[+].code = #LMSpecimenInformationCz.nadoba.idZarizeni
* group[=].element[=].display = "A.2.6.14.3 - ID zaĹ™Ă­zenĂ­"
* group[=].element[=].target.code = #Specimen.container.identifier
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMSpecimenInformationCz.nadoba.oznaceni
* group[=].element[=].display = "A.2.6.14.4 - OznaÄŤenĂ­"
* group[=].element[=].target.code = #Specimen.container.description
* group[=].element[=].target.equivalence = #relatedto

// ---------------------------------------------------------------------------
// A.3.1 / A.3.2 - KlinickĂ© informace a datovĂ© elementy
// ---------------------------------------------------------------------------

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LMClinicalInformationCz"
* group[=].target = "https://hl7.cz/fhir/korder/StructureDefinition/KOrderServiceRequestCz"

* group[=].element[+].code = #LMClinicalInformationCz.dalsiRelevantniKlinickeInformace.kod
* group[=].element[=].display = "A.3.1.2.1 - KĂłd informace / vedlejĹˇĂ­ diagnĂłza"
* group[=].element[=].target.code = #ServiceRequest.reasonCode
* group[=].element[=].target.equivalence = #relatedto
* group[=].element[=].target.comment = "VedlejĹˇĂ­ diagnĂłzy lze takĂ© reprezentovat pĹ™es reasonReference na Condition."

* group[=].element[+].code = #LMClinicalInformationCz.biometrickeUdaje
* group[=].element[=].display = "A.3.1.1 - BiometrickĂ© Ăşdaje"
* group[=].element[=].target.code = #ServiceRequest.supportingInfo
* group[=].element[=].target.equivalence = #relatedto

* group[=].element[+].code = #LMClinicalInformationCz.biometrickeUdaje.vaha
* group[=].element[=].display = "A.3.1.1.1 - VĂˇha"
* group[=].element[=].target.code = #ServiceRequest.supportingInfo
* group[=].element[=].target.equivalence = #relatedto
* group[=].element[=].target.comment = "VĂˇha mĂˇ bĂ˝t samostatnĂˇ Observation referencovanĂˇ pĹ™es ServiceRequest.supportingInfo."

* group[=].element[+].code = #LMClinicalInformationCz.biometrickeUdaje.vyska
* group[=].element[=].display = "A.3.1.1.2 - VĂ˝Ĺˇka"
* group[=].element[=].target.code = #ServiceRequest.supportingInfo
* group[=].element[=].target.equivalence = #relatedto
* group[=].element[=].target.comment = "VĂ˝Ĺˇka mĂˇ bĂ˝t samostatnĂˇ Observation referencovanĂˇ pĹ™es ServiceRequest.supportingInfo."

* group[=].element[+].code = #LMClinicalInformationCz.dalsiRelevantniKlinickeInformace.text
* group[=].element[=].display = "A.3.1.2.2 - Text informace"
* group[=].element[=].target.code = #ServiceRequest.note
* group[=].element[=].target.equivalence = #relatedto

* group[=].element[+].code = #LMClinicalInformationCz.medikace
* group[=].element[=].display = "A.3.1.3 - Medikace"
* group[=].element[=].target.code = #ServiceRequest.supportingInfo
* group[=].element[=].target.equivalence = #relatedto

* group[=].element[+].code = #LMClinicalInformationCz.medikace.identifikator
* group[=].element[=].display = "A.3.1.3.1 - ID medikace"
* group[=].element[=].target.code = #MedicationStatement.identifier
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMClinicalInformationCz.medikace.kod
* group[=].element[=].display = "A.3.1.3.2 - KĂłd medikace"
* group[=].element[=].target.code = #MedicationStatement.medicationCodeableConcept
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMClinicalInformationCz.medikace.mnozstvi
* group[=].element[=].display = "A.3.1.3.3 - MnoĹľstvĂ­"
* group[=].element[=].target.code = #MedicationStatement.dosage.doseAndRate.doseQuantity
* group[=].element[=].target.equivalence = #relatedto

* group[=].element[+].code = #LMClinicalInformationCz.implantat
* group[=].element[=].display = "A.3.1.4 - ImplantĂˇt"
* group[=].element[=].target.code = #ServiceRequest.supportingInfo
* group[=].element[=].target.equivalence = #relatedto

* group[=].element[+].code = #LMClinicalInformationCz.implantat.typ
* group[=].element[=].display = "A.3.1.4.1 - Druh implantĂˇtu"
* group[=].element[=].target.code = #Device.type
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMClinicalInformationCz.implantat.identifikator
* group[=].element[=].display = "A.3.1.4.2 - ID implantĂˇtu"
* group[=].element[=].target.code = #Device.identifier
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMClinicalInformationCz.implantat.model
* group[=].element[=].display = "A.3.1.4.3 - KonkrĂ©tnĂ­ model"
* group[=].element[=].target.code = #Device.modelNumber
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMClinicalInformationCz.implantat.castTela
* group[=].element[=].display = "A.3.1.4.4 - ÄŚĂˇst tÄ›la"
* group[=].element[=].target.code = #DeviceUseStatement.bodySite
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMClinicalInformationCz.urgentniInformace
* group[=].element[=].display = "A.3.1.5 - UrgentnĂ­ informace"
* group[=].element[=].target.code = #ServiceRequest.note
* group[=].element[=].target.equivalence = #relatedto

* group[=].element[+].code = #LMClinicalInformationCz.urgentniInformace.alergieAIntolerance
* group[=].element[=].display = "A.3.1.5.1 - Alergie a intolerance"
* group[=].element[=].target.code = #ServiceRequest.supportingInfo
* group[=].element[=].target.equivalence = #relatedto

* group[=].element[+].code = #LMClinicalInformationCz.urgentniInformace.varovani
* group[=].element[=].display = "A.3.1.5.2 - VarovĂˇnĂ­"
* group[=].element[=].target.code = #Flag.code.text
* group[=].element[=].target.equivalence = #relatedto

* group[=].element[+].code = #LMClinicalInformationCz.omezeniPohyblivostiPacienta
* group[=].element[=].display = "A.3.1.6 - OmezenĂ­ pohyblivosti pacienta"
* group[=].element[=].target.code = #ServiceRequest.supportingInfo
* group[=].element[=].target.equivalence = #relatedto

* group[=].element[+].code = #LMClinicalInformationCz.dalsiFormalizovaneUdaje
* group[=].element[=].display = "A.3.1.13 - DalĹˇĂ­ formalizovanĂ© Ăşdaje"
* group[=].element[=].target.code = #ServiceRequest.supportingInfo
* group[=].element[=].target.equivalence = #relatedto

* group[=].element[+].code = #LMClinicalInformationCz.klinickeInformaceText
* group[=].element[=].display = "A.3.1.7 - KlinickĂ© informace volnĂ˝m textem"
* group[=].element[=].target.code = #ServiceRequest.note
* group[=].element[=].target.equivalence = #relatedto

* group[=].element[+].code = #LMClinicalInformationCz.klinickeInformaceKod
* group[=].element[=].display = "A.3.1.8 - KlinickĂ© informace formalizovanĂ©"
* group[=].element[=].target.code = #ServiceRequest.reasonCode
* group[=].element[=].target.equivalence = #relatedto

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LMKOrderDataElementsCz"
* group[=].target = "https://hl7.cz/fhir/korder/StructureDefinition/KOrderServiceRequestCz"

* group[=].element[+].code = #LMKOrderDataElementsCz.pozadovaneVysetreni.kod
* group[=].element[=].display = "A.3.2.1.1 - KĂłd vyĹˇetĹ™enĂ­"
* group[=].element[=].target.code = #ServiceRequest.code
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMKOrderDataElementsCz.pozadovaneVysetreni.nazev
* group[=].element[=].display = "A.3.2.1.2 - NĂˇzev vyĹˇetĹ™enĂ­"
* group[=].element[=].target.code = #ServiceRequest.code.text
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMKOrderDataElementsCz.pozadovaneVysetreni.modalita
* group[=].element[=].display = "A.3.2.1.3 - Modalita"
* group[=].element[=].target.code = #ServiceRequest.orderDetail
* group[=].element[=].target.equivalence = #relatedto

* group[=].element[+].code = #LMKOrderDataElementsCz.pozadovaneVysetreni.castTela
* group[=].element[=].display = "A.3.2.1.4 - ÄŚĂˇst tÄ›la"
* group[=].element[=].target.code = #ServiceRequest.bodySite
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMKOrderDataElementsCz.pozadovaneVysetreni.lateralita
* group[=].element[=].display = "A.3.2.1.5 - Lateralita"
* group[=].element[=].target.code = #ServiceRequest.bodySite
* group[=].element[=].target.equivalence = #relatedto

* group[=].element[+].code = #LMKOrderDataElementsCz.pozadovaneVysetreni.frekvence
* group[=].element[=].display = "A.3.2.1.6 - Frekvence"
* group[=].element[=].target.code = #ServiceRequest.occurrenceTiming
* group[=].element[=].target.equivalence = #relatedto

* group[=].element[+].code = #LMKOrderDataElementsCz.pozadovaneVysetreni.poznamka
* group[=].element[=].display = "A.3.2.1.7 - PoznĂˇmka"
* group[=].element[=].target.code = #ServiceRequest.note
* group[=].element[=].target.equivalence = #equivalent

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LMFTOrderDataElementsCz"
* group[=].target = "https://hl7.cz/fhir/korder/StructureDefinition/FTServiceRequestCz"

* group[=].element[+].code = #LMFTOrderDataElementsCz.pozadovaneVysetreni.kod
* group[=].element[=].display = "A.3.2.1.1 - KĂłd vyĹˇetĹ™enĂ­"
* group[=].element[=].target.code = #ServiceRequest.code
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #LMFTOrderDataElementsCz.pozadovaneVysetreni.frekvence
* group[=].element[=].display = "A.3.2.1.6 - Frekvence"
* group[=].element[=].target.code = #ServiceRequest.occurrenceTiming
* group[=].element[=].target.equivalence = #relatedto

// ---------------------------------------------------------------------------
// A.3.3 / A.3.4 / A.4 / A.5 - Odkazy, podpĹŻrnĂ© informace a pĹ™Ă­lohy
// ---------------------------------------------------------------------------

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LMPlannedCareOrdersCz"
* group[=].target = "https://hl7.cz/fhir/korder/StructureDefinition/KOrderServiceRequestCz"

* group[=].element[+].code = #LMPlannedCareOrdersCz.identifikator
* group[=].element[=].display = "A.3.3.1 - IdentifikĂˇtor objednĂˇvky plĂˇnovanĂ© pĂ©ÄŤe"
* group[=].element[=].target.code = #ServiceRequest.basedOn.identifier
* group[=].element[=].target.equivalence = #relatedto

* group[=].element[+].code = #LMPlannedCareOrdersCz.nazev
* group[=].element[=].display = "A.3.3.2 - NĂˇzev"
* group[=].element[=].target.code = #ServiceRequest.basedOn.display
* group[=].element[=].target.equivalence = #relatedto

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LMOtherSupportingInformationCz"
* group[=].target = "https://hl7.cz/fhir/korder/StructureDefinition/KOrderServiceRequestCz"

* group[=].element[+].code = #LMOtherSupportingInformationCz.identifikator
* group[=].element[=].display = "A.3.4.1 - IdentifikĂˇtor podpĹŻrnĂ© informace"
* group[=].element[=].target.code = #ServiceRequest.supportingInfo.identifier
* group[=].element[=].target.equivalence = #relatedto

* group[=].element[+].code = #LMOtherSupportingInformationCz.nazev
* group[=].element[=].display = "A.3.4.2 - NĂˇzev"
* group[=].element[=].target.code = #ServiceRequest.supportingInfo.display
* group[=].element[=].target.equivalence = #relatedto
