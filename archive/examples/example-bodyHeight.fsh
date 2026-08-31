Instance: ExampleBodyHeight
InstanceOf: CZ_BodyHeight
Usage: #example
Title: "Body height of patient"
Description: "Example of body height of Patient Mracena"
* subject = Reference(Mracena)
* category.coding.system = "http://terminology.hl7.org/CodeSystem/observation-category"
* category.coding.code = #vital-signs
* code.coding[SNOMEDCT] = $sctCZ#1153637007
* code.coding[LOINC] = $loinc#8302-2
* code.coding[NCLP] = $nclp_new#20411
* valueQuantity.value = 165
* valueQuantity.unit = "cm"
* valueQuantity.system = $UCUM
* valueQuantity.code = #cm
* status = #final
* effectiveDateTime = 2020-06-01
* performer = Reference(practitionerExample)
