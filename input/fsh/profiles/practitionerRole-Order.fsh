Profile: OrderPractitionerRoleCz
Parent: CZ_PractitionerRoleCore
Id: OrderPractitionerRoleCz
Title: "PractitionerRole: Order (CZ)"
Description: """
Profil PractitionerRole pro české žádanky.
Vychází z CZ_PractitionerRoleCore a doplňuje povinnou odbornost žadatele dle číselníku odborností VZP.
"""
* ^publisher = "HL7 CZ"
* ^copyright = "HL7 CZ"

* . ^short = "Order PractitionerRole"
* . ^definition = "Role žadatele nebo jiného zdravotnického pracovníka použitého v rámci české žádanky."

* specialty.coding ^slicing.discriminator[0].type = #value
* specialty.coding ^slicing.discriminator[0].path = "system"
* specialty.coding ^slicing.rules = #open
* specialty.coding contains vzpOdbornost 1..1
* specialty.coding[vzpOdbornost].system = "urn:oid:1.2.203.7898.1.4" (exactly)
* specialty.coding[vzpOdbornost] from VzpOdbornostVS (required)