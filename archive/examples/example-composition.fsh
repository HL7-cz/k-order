Instance: CompositionImagingOrderExample
InstanceOf: CZ_CompositionImageOrder
Usage: #example
Title: "Imaging Order Composition example"
Description: "Standalone example of an imaging order Composition."

* status = #final
* subject = Reference(Mracena)
* date = "2025-04-01T09:00:00+01:00"
* author = Reference(practitionerExample)
* title = "Imaging Order – Magnetic Resonance"
* confidentiality = #N
* type = $sctCZ#721964003
* category[documentCategory] = $loinc#57133-1

* section[orderInformation].title = "Requested imaging studies information"
* section[orderInformation].code = $loinc#55115-0 "Requested imaging studies information Document"
* section[orderInformation].text.status = #generated
* section[orderInformation].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Requested magnetic resonance examination</div>"
* section[orderInformation].entry = Reference(cz-imagingorder-example)

* section[clinicalQuestion].title = "Clinical question"
* section[clinicalQuestion].code = $loinc#18785-6 "Radiology Reason for study (narrative)"
* section[clinicalQuestion].text.status = #additional
* section[clinicalQuestion].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Is there structural damage to the right knee?</div>"
