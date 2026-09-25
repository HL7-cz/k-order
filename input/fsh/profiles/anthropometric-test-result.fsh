Invariant: cz-anthropometric-magic-code
Description: "Exactly one LOINC vital-signs magic code must identify the measured anthropometric quantity."
Severity: #error
Expression: "code.coding.where(system = 'http://loinc.org' and code in ('8302-2' | '9843-4' | '29463-7' | '39156-5' | '8277-6')).count() = 1"

Invariant: cz-anthropometric-unit-by-metric
Description: "The UCUM unit must correspond to the type of anthropometric measurement."
Severity: #error
Expression: "value.empty() or (value.ofType(Quantity).system = 'http://unitsofmeasure.org' and (
  (code.coding.where(system = 'http://loinc.org' and code in ('8302-2' | '9843-4')).exists() implies value.ofType(Quantity).code = 'cm') and
  (code.coding.where(system = 'http://loinc.org' and code = '29463-7').exists() implies value.ofType(Quantity).code in ('kg' | 'g')) and
  (code.coding.where(system = 'http://loinc.org' and code = '39156-5').exists() implies value.ofType(Quantity).code = 'kg/m2') and
  (code.coding.where(system = 'http://loinc.org' and code = '8277-6').exists() implies value.ofType(Quantity).code = 'm2')))"

Profile: CZ_Anthropometric_Test_Result
Parent: http://hl7.org/fhir/StructureDefinition/vitalsigns
Id: cz-anthropometric-test-result
Title: "Anthropometric Test Result (CZ)"
Description: "Quantitative anthropometric measurement for the scope of the Czech national interoperability project."

* subject only Reference(CZ_PatientCore)

* code.coding 1..*
* code.coding ^slicing.discriminator[0].type = #value
* code.coding ^slicing.discriminator[0].path = "system"
* code.coding ^slicing.rules = #closed
* code.coding contains
    LOINC 1..* and
    SNOMEDCT 0..*
* code.coding[LOINC] from CZ_LoincVitalSignsVs (extensible)
* code.coding[LOINC]
  * ^short = "Required LOINC magic code and optional more specific LOINC codes"
  * system 1..1
  * system = $loinc (exactly)
  * code 1..1
* code.coding[SNOMEDCT] from CZ_SnomedVitalSignsVs (required)
* code.coding[SNOMEDCT]
  * ^short = "Defined SNOMED CT anthropometric concepts or their more specific descendants"
  * system 1..1
  * system = $sct (exactly)
  * code 1..1

* value[x] only Quantity
* valueQuantity 0..1
* valueQuantity.value 1..1
* valueQuantity.system = $UCUM (exactly)
* valueQuantity.code 1..1
* valueQuantity.unit 1..1

* dataAbsentReason 0..1
* hasMember 0..0

* effective[x] 1..1
* effective[x] only dateTime
* obeys cz-anthropometric-magic-code
* obeys cz-anthropometric-unit-by-metric
