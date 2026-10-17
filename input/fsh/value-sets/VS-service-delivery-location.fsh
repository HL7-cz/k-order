ValueSet: V3ServiceDeliveryLocationRoleTypeCZ
Id: v3-ServiceDeliveryLocationRoleType-cz
Title: "Service delivery location code (CZ)"
Description: "Czech language version of the valueset. A role of a place that further classifies the setting (e.g., accident site, road side, work site, community location) in which services are delivered."
* ^language = #cs
* ^url = "https://hl7.cz/terminology/ValueSet/v3-ServiceDeliveryLocationRoleType-cz"
* ^version = "3.0.0"
* ^status = #active
* ^experimental = false
* ^date = "2025-03-03T12:31:40.515581Z"
* ^publisher = "hl7.cz"
* ^copyright = "HL7"
* ^jurisdiction = urn:iso:std:iso:3166#CZ "Czechia"
* ^compose.inactive = false

* insert ValueSetSupplementRule($v3-RoleCode-cz)

* include codes from system $v3-RoleCode where concept descendent-of #_ServiceDeliveryLocationRoleType