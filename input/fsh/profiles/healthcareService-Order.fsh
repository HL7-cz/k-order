Profile: OrderHealthcareServiceCz
Parent: HealthcareService
Id: Cz-HealthcareService
Title: "HealthcareService: Order (CZ)"
Description: """
Profil HealthcareService pro české žádanky.
Doplňuje slice pro odbornost služby dle číselníku odborností VZP.
"""
* ^publisher = "HL7 CZ"
* ^copyright = "HL7 CZ"

* . ^short = "Order HealthcareService"
* . ^definition = "HealthcareService reprezentuje zdravotní službu použitou v rámci české žádanky."

* specialty ^slicing.discriminator[0].type = #pattern
* specialty ^slicing.discriminator[0].path = "coding.system"
* specialty ^slicing.rules = #open

* specialty contains specialty 0..* and VZP_ODB 1..1
* specialty[specialty] ^short = "Obecná odbornost služby"
* specialty[specialty] ^definition = "Obecný slice pro specializaci zdravotní služby."
* specialty[VZP_ODB] from VzpOdbornostVS (required)
* specialty[VZP_ODB] ^short = "Odbornost služby dle číselníku VZP"
* specialty[VZP_ODB] ^definition = "Odbornost zdravotní služby dle národního číselníku odborností VZP (urn:oid:1.2.203.7898.1.4)."

* providedBy 1..1 MS
* providedBy only Reference(CZ_OrganizationCore)
* providedBy ^short = "Poskytovatel zdravotní služby"
* providedBy ^definition = "Odkaz na poskytovatele zdravotní služby použitého v rámci české žádanky."
