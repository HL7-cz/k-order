Instance: ExampleBodyWeight
InstanceOf: CZ_BodyWeight
Usage: #example
Title: "Body weight of patient"
Description: "Example of body weight of Patient Mracena"
* subject = Reference(Mracena)
* category.coding.system = "http://terminology.hl7.org/CodeSystem/observation-category"
* category.coding.code = #vital-signs
* code.coding[SNOMEDCT] = $sctCZ#27113001
* code.coding[LOINC] = $loinc#29463-7
* code.coding[NCLP] = $nclp_new#20042
* valueQuantity.value = 65
* valueQuantity.unit = "kg"
* valueQuantity.system = $UCUM
* valueQuantity.code = #kg
* status = #final
* effectiveDateTime = 2020-06-01
* performer = Reference(practitionerExample)
