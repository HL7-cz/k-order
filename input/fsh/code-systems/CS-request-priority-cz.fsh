CodeSystem: RequestPriorityCz
Id: request-priority-cz
Title: "RequestPriority (CZ Supplement)"
Description: "Český doplněk kódového systému RequestPriority, který je souborem kódů specifikujících prioritu požadavku (serviceRequest). Identifies the level of importance to be assigned to actioning the request."
* ^language = #cs
* ^url = "https://hl7.cz/terminology/CodeSystem/request-priority-cz"
* ^version = "4.0.1"
* ^status = #active
* ^experimental = false
* ^date = "2025-02-09T10:38:00.271394Z"
* ^publisher = "HL7 Czech Republic"
* ^jurisdiction = urn:iso:std:iso:3166#CZ "Czechia"
* ^content = #supplement
* ^supplements = $RequestPriority

* #routine "rutinně" "Požadavek má standardní prioritu."
  * ^designation[0].language = #cs
  * ^designation[=].value = "rutinně"
* #urgent "přednostně" "Žádost by měla být vyřízena přednostně – má vyšší prioritu než rutinní žádosti."
  * ^designation[0].language = #cs
  * ^designation[=].value = "přednostně"
* #asap "ASAP" "Žádost by měla být vyřízena co nejdříve – má vyšší prioritu než \"přednostně\"."
  * ^designation[0].language = #cs
  * ^designation[=].value = "ASAP"
* #stat "STATIM" "Žádost by měla být vyřízena okamžitě – s nejvyšší možnou prioritou. Např. v případě život ohrožujících stavů."
  * ^designation[0].language = #cs
  * ^designation[=].value = "STATIM"
