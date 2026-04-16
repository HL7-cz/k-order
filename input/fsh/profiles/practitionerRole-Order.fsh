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

* specialty ^slicing.discriminator[0].type = #pattern
* specialty ^slicing.discriminator[0].path = "coding.system"
* specialty ^slicing.rules = #open

* specialty contains specialty 0..* and VZP_ODB 1..1
* specialty[specialty] ^short = "Obecná odbornost"
* specialty[specialty] ^definition = "Původní obecný slice pro specialty převzatý z nadřazeného profilu."
* specialty[VZP_ODB] from VzpOdbornostVS (required)
* specialty[VZP_ODB] ^short = "Odbornost dle číselníku VZP"
* specialty[VZP_ODB] ^definition = "Odbornost dle národního číselníku odborností VZP (urn:oid:1.2.203.7898.1.4)."

* healthcareService only Reference(OrderHealthcareServiceCz)
