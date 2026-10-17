ValueSet: RequestPriorityCZ
Id: request-priority-cz
Title: "Service request priority (CZ)"
Description: "Czech language version of the valueset. The clinical priority of a diagnostic order."
* ^language = #cs
* ^url = "https://hl7.cz/terminology/ValueSet/request-priority-cz"
* ^version = "4.0.1"
* ^status = #active
* ^experimental = false
* ^date = "2025-03-03T12:31:40.515581Z"
* ^publisher = "hl7.cz"
* ^copyright = "HL7"
* ^jurisdiction = urn:iso:std:iso:3166#CZ "Czechia"
* ^compose.inactive = false

* insert ValueSetSupplementRule($RequestPriorityCZ)

* include codes from system $RequestPriority