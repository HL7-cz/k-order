Instance: KOrderBody2FHIRcz-cz
InstanceOf: ConceptMap
Usage: #definition
* url = "https://hl7.cz/fhir/korder/ConceptMap/KOrderBody2FHIRcz-cz"
* name = "KOrderBody2FHIRcz"
* title = "CZ K-order Body Model to this guide Map"
* status = #draft
* experimental = true
* description = """CZ K-order Body (A.2–A.6) → FHIR mapping (ServiceRequest, Condition, DocumentReference, Provenance, Composition sections)."""


///////////////////////////////////////////////////////////////////////////////
// A.2 – DIAGNÓZY  → Condition + Composition.section[diagnoses]
///////////////////////////////////////////////////////////////////////////////

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LogCzKOrder"
* group[=].target = "https://hl7.cz/fhir/korder/StructureDefinition/KOrderConditionCz"
* group[=].element[+].code = #diagnozy
* group[=].element[=].display = "A.2 – Diagnózy"
* group[=].element[=].target.code = #Condition
* group[=].element[=].target.equivalence = #relatedto
* group[=].element[=].target.comment = "Composition.section[diagnoses].entry.ofType(Condition)"

* group[=].element[+].code = #diagnozy.hlavniDiagnoza
* group[=].element[=].display = "A.2.1 – Hlavní diagnóza"
* group[=].element[=].target.code = #Condition.code
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #diagnozy.vedlejsiDiagnozy
* group[=].element[=].display = "A.2.2 – Vedlejší diagnózy"
* group[=].element[=].target.code = #Condition.code
* group[=].element[=].target.equivalence = #equivalent



///////////////////////////////////////////////////////////////////////////////
// A.3 – DŮVODY ŽÁDOSTI  → ServiceRequest.reasonCode + reasonReference
///////////////////////////////////////////////////////////////////////////////

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LogCzKOrder"
* group[=].target = "https://hl7.cz/fhir/korder/StructureDefinition/KOrderServiceRequestCz"

* group[=].element[+].code = #duvody
* group[=].element[=].display = "A.3 – Klinické odůvodnění"
* group[=].element[=].target.code = #ServiceRequest.reasonCode
* group[=].element[=].target.equivalence = #relatedto
* group[=].element[=].target.comment = "alternativně: ServiceRequest.reasonReference → Condition"



///////////////////////////////////////////////////////////////////////////////
// A.4 – POŽADOVANÁ VYŠETŘENÍ  → ServiceRequest (opakovaně)
///////////////////////////////////////////////////////////////////////////////

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LogCzKOrder"
* group[=].target = "https://hl7.cz/fhir/korder/StructureDefinition/KOrderServiceRequestCz"

* group[=].element[+].code = #pozadovanaVysetreni
* group[=].element[=].display = "A.4 – Požadovaná vyšetření / výkony"
* group[=].element[=].target.code = #ServiceRequest
* group[=].element[=].target.equivalence = #relatedto
* group[=].element[=].target.comment = "Composition.section[examinations].entry.ofType(ServiceRequest)"

* group[=].element[+].code = #pozadovanaVysetreni.slovniPopis
* group[=].element[=].display = "A.4.1 – Slovní popis požadovaného výkonu"
* group[=].element[=].target.code = #ServiceRequest.code.text
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #pozadovanaVysetreni.kodVykonu
* group[=].element[=].display = "A.4.2 – Kód výkonu (VZP)"
* group[=].element[=].target.code = #ServiceRequest.code
* group[=].element[=].target.equivalence = #equivalent
* group[=].element[=].target.comment = "Používá KOrderProceduresVS (VZP výkony)."

* group[=].element[+].code = #pozadovanaVysetreni.doporuceni
* group[=].element[=].display = "A.4.3 – Doporučení slovem"
* group[=].element[=].target.code = #ServiceRequest.note
* group[=].element[=].target.equivalence = #relatedto


///////////////////////////////////////////////////////////////////////////////
// A.6 – PODPIS  → Provenance.signature + Composition.section[signature]
///////////////////////////////////////////////////////////////////////////////
/*
* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/LogCzKOrder"
* group[=].target = "http://hl7.org/fhir/StructureDefinition/Provenance"

* group[=].element[+].code = #podpis
* group[=].element[=].display = "A.6 – Elektronický podpis"
* group[=].element[=].target.code = #Provenance.signature
* group[=].element[=].target.equivalence = #relatedto
* group[=].element[=].target.comment = "Composition.section[signature].entry.ofType(Provenance)"

* group[=].element[+].code = #podpis.autor
* group[=].element[=].display = "A.6.1 – Autor podpisu"
* group[=].element[=].target.code = #Provenance.agent.who
* group[=].element[=].target.equivalence = #equivalent

* group[=].element[+].code = #podpis.casoveRazitko
* group[=].element[=].display = "A.6.2 – Časové razítko"
* group[=].element[=].target.code = #Provenance.signature.when
* group[=].element[=].target.equivalence = #equivalent
*/