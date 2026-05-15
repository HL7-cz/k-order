Profile: CZ_BodyHeight
Parent: Observation
Id: cz-bodyheight
Title: "Body Height: Order (CZ)"
Description: "Profile of body height for the scope of the Czech national interoperability project."

* subject

// --- slicing ---
* code.coding ^slicing.discriminator.type = #value
* code.coding ^slicing.discriminator.path = "system"
* code.coding ^slicing.rules = #open

* code.coding contains
    LOINC 0..1 and
    SNOMEDCT 0..1 and
    NCLP 0..1

// --- LOINC ---
* code.coding[LOINC]
  * system 1..
  * system = "http://loinc.org" (exactly)
  * code 1..
  * code = #8302-2

// --- SNOMED ---
* code.coding[SNOMEDCT]
  * system 1..
  * system = "http://snomed.info/sct" (exactly)
  * code 1..
  * code = #1153637007

// --- NCLP ---
* code.coding[NCLP]
  * system 1..
  * system = $nclp (exactly)
  * code 1..
  * code = #20411

* valueQuantity.code from CZ_ObservationUnitsHeightVs
* effective[x] 1..1
* effective[x] only dateTime

Profile: CZ_BodyWeight
Parent: Observation
Id: cz-bodyweight
Title: "Body Weight: Order (CZ)"
Description: "Profile of body weight for the scope of the Czech national interoperability project."

* subject

// --- slicing ---
* code.coding ^slicing.discriminator.type = #value
* code.coding ^slicing.discriminator.path = "system"
* code.coding ^slicing.rules = #open

* code.coding contains
    LOINC 0..1 and
    SNOMEDCT 0..1 and
    NCLP 0..1

// --- LOINC ---
* code.coding[LOINC]
  * system 1..
  * system = "http://loinc.org" (exactly)
  * code 1..
  * code = #29463-7

// --- SNOMED ---
* code.coding[SNOMEDCT]
  * system 1..
  * system = "http://snomed.info/sct" (exactly)
  * code 1..
  * code = #27113001

// --- NCLP ---
* code.coding[NCLP]
  * system 1..
  * system = $nclp (exactly)
  * code 1..
  * code = #20042

* valueQuantity.code from CZ_ObservationUnitsWeightVs
* effective[x] 1..1
* effective[x] only dateTime