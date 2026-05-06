Instance: KOrderBody2FHIRcz-cz
InstanceOf: ConceptMap
Usage: #definition
* url = "https://hl7.cz/fhir/korder/ConceptMap/KOrderBody2FHIRcz-cz"
* name = "KOrderBody2FHIRcz"
* title = "CZ K-order Body Model to this guide Map"
* status = #draft
* experimental = true
* description = """CZ K-order Body (A.2-A.6) -> FHIR mapping (ServiceRequest, Condition, DocumentReference, Provenance, Composition sections)."""


///////////////////////////////////////////////////////////////////////////////
// A.2.2.1 - INDIKACNI DIAGNOZA / PROBLEM -> ServiceRequest.reasonReference
///////////////////////////////////////////////////////////////////////////////

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LMOrderInformationCz"
* group[=].target = "https://hl7.cz/fhir/korder/StructureDefinition/KOrderServiceRequestCz"

* group[=].element[+].code = #duvodObjednavky.problem
* group[=].element[=].display = "A.2.2.1 - Popis problemu / diagnozy / stavu"
* group[=].element[=].target.code = #ServiceRequest.reasonReference
* group[=].element[=].target.equivalence = #relatedto
* group[=].element[=].target.comment =
  "Pro kazdy problem muze vzniknout samostatny Condition a ten se referencuje z reasonReference."


///////////////////////////////////////////////////////////////////////////////
// A.2.2.2-A.2.2.5 - DUVOD OBJEDNAVKY -> ServiceRequest.reasonCode
///////////////////////////////////////////////////////////////////////////////

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LMOrderInformationCz"
* group[=].target = "https://hl7.cz/fhir/korder/StructureDefinition/KOrderServiceRequestCz"

* group[=].element[+].code = #duvodObjednavky
* group[=].element[=].display = "A.2.2 - Oduvodneni vysetreni"
* group[=].element[=].target.code = #ServiceRequest.reasonCode
* group[=].element[=].target.equivalence = #relatedto
* group[=].element[=].target.comment = "Kodovane a textove oduvodneni objednavky."

* group[=].element[+].code = #duvodObjednavky.klinickaOtazkaKod
* group[=].element[=].display = "A.2.2.2 - Klinicka otazka kodem"
* group[=].element[=].target.code = #ServiceRequest.reasonCode.coding[reason]
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #duvodObjednavky.klinickaOtazkaText
* group[=].element[=].display = "A.2.2.3 - Klinicka otazka textem"
* group[=].element[=].target.code = #ServiceRequest.reasonCode.text
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #duvodObjednavky.duvodKod
* group[=].element[=].display = "A.2.2.4 - Duvod objednavky kodem"
* group[=].element[=].target.code = #ServiceRequest.reasonCode.coding[reason]
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #duvodObjednavky.duvodText
* group[=].element[=].display = "A.2.2.5 - Duvod objednavky textem"
* group[=].element[=].target.code = #ServiceRequest.reasonCode.text
* group[=].element[=].target.equivalence = #equivalent


///////////////////////////////////////////////////////////////////////////////
// A.3.1.1 - BIOMETRICKE UDAJE -> CZ_BodyWeight + CZ_BodyHeight
///////////////////////////////////////////////////////////////////////////////

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LMClinicalInformationCz"
* group[=].target = "https://hl7.cz/fhir/korder/StructureDefinition/cz-bodyweight"

* group[=].element[+].code = #biometrickeUdaje.vaha
* group[=].element[=].display = "A.3.1.1.1 - Vaha"
* group[=].element[=].target.code = #CZ_BodyWeight
* group[=].element[=].target.equivalence = #relatedto
* group[=].element[=].target.comment = "Composition.section:SupportingInformation.entry.ofType(CZ_BodyWeight)"

* group[=].element[+].code = #biometrickeUdaje.vaha.hodnota
* group[=].element[=].display = "A.3.1.1.1.1 - Hodnota vahy"
* group[=].element[=].target.code = #CZ_BodyWeight.valueQuantity
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #biometrickeUdaje.vaha.kod
* group[=].element[=].display = "A.3.1.1.1.2 - Kod vahy"
* group[=].element[=].target.code = #CZ_BodyWeight.code
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #biometrickeUdaje.vaha.datumACas
* group[=].element[=].display = "A.3.1.1.1.3 - Datum a cas vahy"
* group[=].element[=].target.code = #CZ_BodyWeight.effectiveDateTime
* group[=].element[=].target.equivalence = #equivalent

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LMClinicalInformationCz"
* group[=].target = "https://hl7.cz/fhir/korder/StructureDefinition/cz-bodyheight"

* group[=].element[+].code = #biometrickeUdaje.vyska
* group[=].element[=].display = "A.3.1.1.2 - Vyska"
* group[=].element[=].target.code = #CZ_BodyHeight
* group[=].element[=].target.equivalence = #relatedto
* group[=].element[=].target.comment = "Composition.section:SupportingInformation.entry.ofType(CZ_BodyHeight)"

* group[=].element[+].code = #biometrickeUdaje.vyska.hodnota
* group[=].element[=].display = "A.3.1.1.2.1 - Hodnota vysky"
* group[=].element[=].target.code = #CZ_BodyHeight.valueQuantity
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #biometrickeUdaje.vyska.kod
* group[=].element[=].display = "A.3.1.1.2.2 - Kod vysky"
* group[=].element[=].target.code = #CZ_BodyHeight.code
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #biometrickeUdaje.vyska.datumACas
* group[=].element[=].display = "A.3.1.1.2.3 - Datum a cas vysky"
* group[=].element[=].target.code = #CZ_BodyHeight.effectiveDateTime
* group[=].element[=].target.equivalence = #equivalent


///////////////////////////////////////////////////////////////////////////////
// A.3.1.2 - DALSI KLINICKE INFORMACE -> Condition
///////////////////////////////////////////////////////////////////////////////

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LMClinicalInformationCz"
* group[=].target = "https://hl7.cz/fhir/korder/StructureDefinition/OrderConditionCz"

* group[=].element[+].code = #dalsiRelevantniKlinickeInformace
* group[=].element[=].display = "A.3.1.2 - Dalsi klinicke informace"
* group[=].element[=].target.code = #Condition
* group[=].element[=].target.equivalence = #relatedto
* group[=].element[=].target.comment = "Vznika samostatny Condition pro dalsi relevantni klinicke informace."

* group[=].element[+].code = #dalsiRelevantniKlinickeInformace.kod
* group[=].element[=].target.code = #Condition.code.coding[reason]
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #dalsiRelevantniKlinickeInformace.text
* group[=].element[=].target.code = #Condition.code.text
* group[=].element[=].target.equivalence = #equivalent


///////////////////////////////////////////////////////////////////////////////
// A.3.2.1 - POZADOVANE VYSETRENI -> ServiceRequest (opakovane)
///////////////////////////////////////////////////////////////////////////////

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LMKOrderDataElementsCz"
* group[=].target = "https://hl7.cz/fhir/korder/StructureDefinition/KOrderServiceRequestCz"

* group[=].element[+].code = #pozadovaneVysetreni
* group[=].element[=].display = "A.3.2.1 - Pozadovane vysetreni"
* group[=].element[=].target.code = #ServiceRequest
* group[=].element[=].target.equivalence = #relatedto
* group[=].element[=].target.comment = "Composition.section[examinations].entry.ofType(ServiceRequest)"

* group[=].element[+].code = #pozadovaneVysetreni.nazev
* group[=].element[=].display = "A.3.2.1.2 - Nazev vysetreni"
* group[=].element[=].target.code = #ServiceRequest.code.text
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #pozadovaneVysetreni.kod
* group[=].element[=].display = "A.3.2.1.1 - Kod vysetreni"
* group[=].element[=].target.code = #ServiceRequest.code
* group[=].element[=].target.equivalence = #equivalent
* group[=].element[=].target.comment = "Pouziva KOrderProceduresVS (VZP vykony)."

* group[=].element[+].code = #pozadovaneVysetreni.poznamka
* group[=].element[=].display = "A.3.2.1.7 - Poznamka"
* group[=].element[=].target.code = #ServiceRequest.note
* group[=].element[=].target.equivalence = #relatedto


///////////////////////////////////////////////////////////////////////////////
// A.6 - PODPIS -> Provenance.signature + Composition.section[signature]
///////////////////////////////////////////////////////////////////////////////
/*
* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LogCzKOrder"
* group[=].target = "http://hl7.org/fhir/StructureDefinition/Provenance"

* group[=].element[+].code = #podpis
* group[=].element[=].display = "A.6 - Elektronicky podpis"
* group[=].element[=].target.code = #Provenance.signature
* group[=].element[=].target.equivalence = #relatedto
* group[=].element[=].target.comment = "Composition.section[signature].entry.ofType(Provenance)"

* group[=].element[+].code = #podpis.autor
* group[=].element[=].display = "A.6.1 - Autor podpisu"
* group[=].element[=].target.code = #Provenance.agent.who
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #podpis.casoveRazitko
* group[=].element[=].display = "A.6.2 - Casove razitko"
* group[=].element[=].target.code = #Provenance.signature.when
* group[=].element[=].target.equivalence = #equivalent
*/
