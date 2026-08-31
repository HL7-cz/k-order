Instance: cz-imagingorder-example
InstanceOf: CZ_ImagingOrderInformation
Usage: #example
Description: "Imaging order for Magnetic Resonance"

* identifier[+].system = "urn:ietf:rfc:3986"
* identifier[=].value = "urn:uuid:f69fed08-cee4-48c2-9475-d2cedb17f88f"
* status = #active
* intent = #order
* category = $sctCZ#363679005 	"zobrazování"
* performer = Reference(MRDevice)
* subject = Reference(Mracena)
* bodySite = $sctCZ#72696002
* code.coding = $sctCZ#19741000087109
* text.status = #additional
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"cs\" lang=\"cs\">Vyšetření MR pravého kolene</div>"
* authoredOn = "2025-04-01T09:00:00+01:00"
* note.text = "Poznámka k vyšetření"