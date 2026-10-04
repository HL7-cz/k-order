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

Invariant: cz-anthropometric-effective-day
Description: "The effective date and time must be precise at least to the day."
Severity: #error
Expression: "($this as dateTime).toString().length() >= 8"

Invariant: cz-anthropometric-value-or-data-absent-reason
Description: "The anthropometric observation must contain either a value or a data absent reason."
Severity: #error
Expression: "value.exists() or dataAbsentReason.exists()"

Profile: CZ_Anthropometric_Test_Result
Parent: CZ_MedicalTestResultCore
Id: cz-anthropometric-test-result
Title: "Anthropometric Test Result (CZ)"
Description: "Quantitative anthropometric measurement for the scope of the Czech national interoperability project."

* insert ImposeProfile($vital-signs, 0)
* subject only Reference(CZ_PatientCore)
* category 1..* MS
* category ^slicing.discriminator[0].type = #value
* category ^slicing.discriminator[0].path = "coding.code"
* category ^slicing.discriminator[1].type = #value
* category ^slicing.discriminator[1].path = "coding.system"
* category ^slicing.ordered = false
* category ^slicing.rules = #open
* category contains VSCat 1..1 MS
* category[VSCat].coding 1..* MS
* category[VSCat].coding.system 1..1 MS
* category[VSCat].coding.system = $hl7-observation-category-cs (exactly)
* category[VSCat].coding.code 1..1 MS
* category[VSCat].coding.code = #vital-signs (exactly)

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
  * version 1..1
  * version = $sctCzEdition
  * code 1..1

* value[x] only Quantity
* valueQuantity 0..1
* valueQuantity.value 1..1
* valueQuantity.system = $UCUM (exactly)
* valueQuantity.code 1..1
* valueQuantity.unit 1..1

* dataAbsentReason 0..1
* hasMember 0..0
* component 0..0

* effective[x] 1..1
* effective[x] only dateTime
* effective[x] obeys cz-anthropometric-effective-day
* obeys cz-anthropometric-magic-code
* obeys cz-anthropometric-unit-by-metric
* obeys cz-anthropometric-value-or-data-absent-reason
