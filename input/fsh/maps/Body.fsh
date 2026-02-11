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
// A.2.1.1 – Informace o objednávce
///////////////////////////////////////////////////////////////////////////////

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/logKOrderInformationCz"
* group[=].target = "https://hl7.cz/fhir/korder/StructureDefinition/KOrderServiceRequestCz"


* group[=].element[+].code = #detailyObjednavky.id
* group[=].element[=].display = "A.2.1.1.1 – ID objednávky"
* group[=].element[=].target.code = #ServiceRequest.identifier
* group[=].element[=].target.equivalence = #equivalent


* group[=].element[+].code = #detailyObjednavky.datumACas
* group[=].element[=].display = "A.2.1.1.2 – Datum a čas objednávky"
* group[=].element[=].target.code = #ServiceRequest.authoredOn
* group[=].element[=].target.equivalence = #equivalent


* group[=].element[+].code = #detailyObjednavky.datumPozadovanehoProvedeni
* group[=].element[=].display = "A.2.1.1.3 – Požadovaný čas provedení"
* group[=].element[=].target.code = #ServiceRequest.occurrenceDateTime
* group[=].element[=].target.equivalence = #equivalent


* group[=].element[+].code = #detailyObjednavky.urgentnost
* group[=].element[=].display = "A.2.1.1.4 – Urgentnost"
* group[=].element[=].target.code = #ServiceRequest.priority
* group[=].element[=].target.equivalence = #equivalent


* group[=].element[+].code = #detailyObjednavky.textObjednavky
* group[=].element[=].display = "A.2.1.1.5 – Text objednávky"
* group[=].element[=].target.code = #ServiceRequest.note
* group[=].element[=].target.equivalence = #equivalent
* group[=].element[=].target.comment = "Text žádosti"


* group[=].element[+].code = #detailyObjednavky.infoProPacienta
* group[=].element[=].display = "A.2.1.1.6 – Informace pro pacienta"
* group[=].element[=].target.code = #ServiceRequest.patientInstruction
* group[=].element[=].target.equivalence = #equivalent


///////////////////////////////////////////////////////////////////////////////
// A.2.1.2 – Diagnózy
///////////////////////////////////////////////////////////////////////////////

* group[=].element[+].code = #diagnozy.hlavniDiagnoza
* group[=].element[=].display = "A.2.1.2.1 – Hlavní diagnóza"
* group[=].element[=].target.code = #ServiceRequest.reasonCode
* group[=].element[=].target.equivalence = #equivalent


* group[=].element[+].code = #diagnozy.vedlejsiDiagnozy
* group[=].element[=].display = "A.2.1.2.2 – Vedlejší diagnózy"
* group[=].element[=].target.code = #ServiceRequest.reasonCode
* group[=].element[=].target.equivalence = #equivalent

///////////////////////////////////////////////////////////////////////////////
// A.2.1.3 – Kód náhrady
///////////////////////////////////////////////////////////////////////////////

* group[=].element[+].code = #kodNahrady
* group[=].element[=].display = "A.2.1.3 – Kód náhrady"
* group[=].element[=].target.code = #ServiceRequest.category
* group[=].element[=].target.equivalence = #relatedto

///////////////////////////////////////////////////////////////////////////////
// A.2.2 – Klinické zdůvodnění žádosti
///////////////////////////////////////////////////////////////////////////////

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/logClinicalReasonKOrder"
* group[=].target = "https://hl7.cz/fhir/korder/StructureDefinition/KOrderServiceRequestCz"

* group[=].element[+].code = #textZduvodneni
* group[=].element[=].display = "A.2.2 – Klinické zdůvodnění žádosti"
* group[=].element[=].target.code = #ServiceRequest.note
* group[=].element[=].target.equivalence = #equivalent
* group[=].element[=].target.comment = "Text žádosti"

///////////////////////////////////////////////////////////////////////////////
// A.2.3 – Požadované vyšetření / výkony
///////////////////////////////////////////////////////////////////////////////

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/logRequestedServiceKOrder"
* group[=].target = "https://hl7.cz/fhir/korder/StructureDefinition/KOrderServiceRequestCz"


* group[=].element[+].code = #typVysetreni
* group[=].element[=].display = "A.2.3.1 – Typ požadovaného vyšetření"
* group[=].element[=].target.code = #ServiceRequest.category
* group[=].element[=].target.equivalence = #equivalent
* group[=].element[=].target.comment = "Typ služby / konzilia"


* group[=].element[+].code = #slovniPopisVysetreni
* group[=].element[=].display = "A.2.3.2 – Požadované vyšetření slovem"
* group[=].element[=].target.code = #ServiceRequest.code.text
* group[=].element[=].target.equivalence = #equivalent


* group[=].element[+].code = #vykony
* group[=].element[=].display = "A.2.3.3 – Výkony"
* group[=].element[=].target.code = #ServiceRequest.code
* group[=].element[=].target.equivalence = #equivalent
* group[=].element[=].target.comment = "Kódy výkonů (VZP) Pozor může se změnit na SNOMED CT kody."

///////////////////////////////////////////////////////////////////////////////
// A.2.4 – Doporučení
///////////////////////////////////////////////////////////////////////////////

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/logRecommendationKOrder"
* group[=].target = "https://hl7.cz/fhir/korder/StructureDefinition/KOrderServiceRequestCz"


* group[=].element[+].code = #doporuceniKam
* group[=].element[=].display = "A.2.4.1 – Doporučeno (kam)"
* group[=].element[=].target.code = #ServiceRequest.extension(recommendationDisposition)
* group[=].element[=].target.display = "CZ K-order recommendation disposition extension"
* group[=].element[=].target.equivalence = #equivalent
* group[=].element[=].target.comment =
  "Strukturované doporučení převzetí do péče nebo hospitalizace"


* group[=].element[+].code = #doporuceniSlovem
* group[=].element[=].display = "A.2.4.2 – Doporučení slovem"
* group[=].element[=].target.code = #ServiceRequest.note
* group[=].element[=].target.equivalence = #equivalent
* group[=].element[=].target.comment =
  "Textové doplnění doporučení"

  
///////////////////////////////////////////////////////////////////////////////
// A.2.5 – Doplňující klinické informace → Composition sections
///////////////////////////////////////////////////////////////////////////////

* group[+].source = "https://hl7.cz/fhir/korder/StructureDefinition/logAdditionalClinicalInfoKOrder"
* group[=].target = "https://hl7.cz/fhir/korder/StructureDefinition/KOrderCompositionCz"


* group[=].element[+].code = #poznamka
* group[=].element[=].display = "A.2.5.1 – Poznámka"
* group[=].element[=].target.code = #Composition.section(reasons).text
* group[=].element[=].target.equivalence = #equivalent


* group[=].element[+].code = #zavaznaAnamneza
* group[=].element[=].display = "A.2.5.2 – Závažná anamnéza"
* group[=].element[=].target.code = #Composition.section(significantMedicalHistory).text
* group[=].element[=].target.equivalence = #equivalent


* group[=].element[+].code = #vysledkyVysetreni
* group[=].element[=].display = "A.2.5.3 – Výsledky vyšetření"
* group[=].element[=].target.code = #Composition.section(examinationResults).text
* group[=].element[=].target.equivalence = #equivalent


* group[=].element[+].code = #diferencialniRozvaha
* group[=].element[=].display = "A.2.5.4 – Diferenciální rozvaha"
* group[=].element[=].target.code = #Composition.section(differentialDiagnosis).text
* group[=].element[=].target.equivalence = #equivalent


* group[=].element[+].code = #soucasnaLecba
* group[=].element[=].display = "A.2.5.5 – Současná léčba"
* group[=].element[=].target.code = #Composition.section(currentTreatment).text
* group[=].element[=].target.equivalence = #equivalent
