Profile: CZ_ObservationOrder
Parent: CZ_MedicalTestResultCore
Id: cz-observation-order
Title: "Observation: General Order (CZ)"
Description: "Observation used as supporting clinical information in Czech general orders."

* identifier
* title
* category.coding.system
* category.coding.code
* code
* code.coding ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "system"
  * ^slicing.rules = #open
* code.coding contains
    LOINC 0..1 and
    SNOMEDCT 0..1 and
    NCLP 0..1
* code.coding[LOINC]
  * ^short = "LOINC code for the observation"
  * system 1..
  * system = $loinc (exactly)
  * code 1..
* code.coding[SNOMEDCT]
  * ^short = "SNOMED CT code for the observation"
  * system 1..
  * system = $sct (exactly)
  * code 1..
* code.coding[NCLP]
  * ^short = "NCLP code for the observation"
  * system 1..
  * system = $nclp (exactly)
  * code 1..
* valueQuantity
* valueCodeableConcept
* status
* effectiveDateTime
* performer
* performer.identifier
* performer.display
* note

Profile: CZ_PatientMobility
Parent: CZ_ObservationOrder
Id: cz-patient-mobility
Title: "Patient mobility: General Order (CZ)"
Description: "Patient mobility observation used as supporting clinical information in Czech general orders."

* identifier
* title
* category.coding.system
* category.coding.code
* code
* code.coding[SNOMEDCT] 1..1
  * ^short = "SNOMED CT code for the observation"
  * system 1..
  * system = $sct (exactly)
  * code 1..
  * code from CZ_MobilityTypeVs
* valueCodeableConcept 1..1
* valueCodeableConcept from CZ_MobilityValueVs
* valueQuantity 0..0
* effective[x] 1..1
* effective[x] only dateTime
