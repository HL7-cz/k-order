ValueSet: CZ_SnomedVitalSignsVs
Id: sct-vital-signs
Title: "Anthropometric metrics (CZ)"
Description: "SNOMED CT concepts for quantitative vital signs measurements supported in imaging orders."
* ^language = #cs
* ^version = "1.0.0"
* ^status = #active
* ^date = "2026-09-18"
* ^publisher = "NCEZ"
* ^experimental = false
* ^url = "https://ncez.mzcr.cz/terminology/ValueSet/sct-vital-signs"
* insert SetFmmandStatusRule(2, trial-use)
* insert SNOMEDCopyrightForVS

// The focus concepts and all their more specific SNOMED CT descendants.
* include codes from system $sct where concept is-a #1153637007 // "Body height"
* include codes from system $sct where concept is-a #27113001 // "Body weight"
//MINUS (<< 248350002 | Reference weight (observable entity) | OR << 301334000 | Birth weight centile (observable entity) |))
* include codes from system $sct where concept is-a #363812007 // "Head circumference"
* include codes from system $sct where concept = #60621009 // "Body mass index"
* include codes from system $sct where concept is-a #301898006 // "Body surface area"
* include codes from system $sct where concept is-a #86290005 // Respiratory rate
* include codes from system $sct where concept is-a #364075005 // Heart rate
* include codes from system $sct where concept is-a #431314004 // Peripheral oxygen saturation (observable entity)
* include codes from system $sct where concept is-a #276885007  // core body temperature
* include codes from system $sct where concept is-a #271649006  // Systolic blood pressure
// MINUS (<< 314464000 | 24 hour systolic blood pressure (observable entity) | OR << 716579001 | Baseline systolic blood pressure (observable entity) | OR << 315612005 | Target systolic blood pressure (observable entity) |))
* include codes from system $sct where concept is-a #271650006 // diastolic blood pressure
// MINUS (<< 314465004 | 24 hour diastolic blood pressure (observable entity) | OR << 716632005 | Baseline diastolic blood pressure (observable entity) | OR << 315613000 | Target diastolic blood pressure (observable entity) |))

* exclude $sct#428420003 // Target heart rate (observable entity) |
//* exclude codes from system $sct where concept is-a #248397001 // Exclude Head circumference (observable entity)
* exclude codes from system $sct where concept is-a #248350002  // Reference weight
* exclude codes from system $sct where concept is-a #301334000 // Birth weight centile (observable entity) |
* exclude codes from system $sct where concept is-a #314464000 // 24 hour systolic blood pressure (observable entity)
* exclude codes from system $sct where concept is-a #716579001 // Baseline systolic blood pressure (observable entity)
* exclude codes from system $sct where concept is-a #315612005 // Target systolic blood pressure (observable entity)
* exclude codes from system $sct where concept is-a #314465004 // 24 hour diastolic blood pressure (observable entity)
* exclude codes from system $sct where concept is-a #716632005 //Baseline diastolic blood pressure (observable entity)
* exclude codes from system $sct where concept is-a #315613000 // Target diastolic blood pressure (observable entity)