Instance: CarePlanExample
InstanceOf: CZ_CarePlanImage
Usage: #example
Description: "Care Plan"

* identifier[+].system = "urn:ietf:rfc:3986"
* identifier[=].value = "urn:uuid:3e026243-a659-4957-b24d-8b95fbd8d689"
* description = "Žádanka na odběr krve"
* status = #active
* intent = #order
* subject = Reference (Mracena)