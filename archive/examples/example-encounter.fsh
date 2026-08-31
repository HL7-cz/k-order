Instance: cz-encounter-example
InstanceOf: CZ_EncounterCore
Usage: #example
Description: "Encounter"
* id = "db16a37b-d393-4767-bb2e-739f9bff16f9"
* identifier[+].system = "urn:ietf:rfc:3986"
* identifier[=].value = "urn:uuid:db16a37b-d393-4767-bb2e-739f9bff16f9"
* status = #in-progress
* class.system = "http://terminology.hl7.org/CodeSystem/v3-ActCode"
* class.code = #AMB
* type.text = "Rentgen pacienta Králíka"
* serviceProvider = Reference(urn:uuid:5bdedd9b-27c5-4593-ae3a-968c5f25d253) // CZ_OrganizationWithLogo


Instance: cz-organizationwithlogo-example
InstanceOf: cz-organization-core
Usage: #example
Description: "An example of the organization with logo extension"
* id = "5bdedd9b-27c5-4593-ae3a-968c5f25d253"
* identifier[+].system = "https://ncez.mzcr.cz/fhir/sid/icp"
* identifier[=].value = "456789655"
* identifier[+].system = "https://ncez.mzcr.cz/fhir/sid/ico"
* identifier[=].value = "456789656"
* type[+] = $drzar#101 "Fakultní nemocnice"
* name = "Fakultní nemocnice Obláčkov"
* telecom[0].system = #phone
* telecom[=].value = "+420257216007"
* telecom[=].use = #work
* telecom[+].system = #fax
* telecom[=].value = "+420257216007"
* telecom[=].use = #work

* address[+].use = #work
* address[=].type = #both
* address[=].text = "Fiktivní 951/125, 100 00 Město"
* address[=].line[+] = "Fiktivní 951/125"
* address[=].line[=].extension[streetName].valueString = "Fiktivní"
* address[=].line[=].extension[houseNumber].valueString = "951/125"
* address[=].city = "Město"
* address[=].postalCode = "10000"
* address[=].country = "CZ"
// Rozšíření organization-logo aliasované jako cz-organization-logo
* extension[logo].valueReference = Reference(urn:uuid:0af43461-495e-4dfc-82ca-7f3140a60fe7) // CZ_Logo