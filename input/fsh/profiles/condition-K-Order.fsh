Profile: OrderConditionCz
Parent: Condition
Id: OrderConditionCz
Title: "Condition: General order (CZ)"
Description: """
Condition profil pro K-order (konziliární žádanku).
Používá se pro diagnózy a klinické důvody žádanky.
"""

* ^publisher = "HL7 CZ"
* ^copyright = "HL7 CZ"
* . ^short = "General order Condition"
* . ^definition = "Diagnóza nebo klinický důvod přiložený k žádance."

// ----------------------------------------------------------------------------
// Identifikace a základní atributy
// ----------------------------------------------------------------------------
* identifier 0..*
* subject 1..1 MS
* subject only Reference(CZ_PatientCore)

// ----------------------------------------------------------------------------
// Klasifikace diagnózy / indikace
// ----------------------------------------------------------------------------
* category from $hl7-condition-category (extensible)

// ----------------------------------------------------------------------------
// Slicing code.coding na dvě role: diagnóza & důvod
// ----------------------------------------------------------------------------
* code 1..1 MS
* code.coding ^slicing.discriminator[0].type = #value
* code.coding ^slicing.discriminator[0].path = "$this"
* code.coding ^slicing.rules = #open

* code.coding contains 
    diagnosis 1..1 and
    reason 0..1

// ----------------------------------------------------------------------------
// Diagnóza – národní VS (MKN-10, případně ORPHA)
// ----------------------------------------------------------------------------
* code.coding[diagnosis] from CZ_DiagnosisConditionVs (extensible)

// ----------------------------------------------------------------------------
// Reason / klinický důvod – SNOMED CT
// ----------------------------------------------------------------------------
* code.coding[reason] from $sct-condition-code (extensible)
* code.coding[reason].system = "http://snomed.info/sct" (exactly)
