Instance: CzOrderDocumentIdentifierNS
InstanceOf: NamingSystem
Usage: #definition
Title: "CZ Order document identifier namespace"
Description: "Namespace used for identifiers of Czech K-order and FT-order document Bundles."
* name = "CzOrderDocumentIdentifierNS"
* status = #active
* kind = #identifier
* date = "2026-09-09"
* publisher = "HL7 CZ"
* responsible = "HL7 CZ"
* uniqueId[0].type = #uri
* uniqueId[=].value = "https://hl7.cz/fhir/order/sid/document"
* uniqueId[=].preferred = true

Instance: KOrderExampleDocumentIdentifierNS
InstanceOf: NamingSystem
Usage: #definition
Title: "K-order example document identifier namespace"
Description: "Demonstration namespace used for Bundle identifiers in K-order examples."
* name = "KOrderExampleDocumentIdentifierNS"
* status = #active
* kind = #identifier
* date = "2026-09-09"
* publisher = "HL7 CZ"
* responsible = "Example hospital"
* uniqueId[0].type = #uri
* uniqueId[=].value = "https://hospital.example.cz/korder"
* uniqueId[=].preferred = true

Instance: FTOrderExampleDocumentIdentifierNS
InstanceOf: NamingSystem
Usage: #definition
Title: "FT-order example document identifier namespace"
Description: "Demonstration namespace used for Bundle identifiers in FT-order examples."
* name = "FTOrderExampleDocumentIdentifierNS"
* status = #active
* kind = #identifier
* date = "2026-09-09"
* publisher = "HL7 CZ"
* responsible = "Example hospital"
* uniqueId[0].type = #uri
* uniqueId[=].value = "https://hospital.example.cz/ft"
* uniqueId[=].preferred = true
