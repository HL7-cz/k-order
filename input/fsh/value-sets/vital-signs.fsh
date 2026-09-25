ValueSet: CZ_LoincVitalSignsVs
Id: loinc-vital-signs
Title: "Anthropometric metrics (CZ)"
Description: "LOINC magic codes and SNOMED CT concepts for quantitative anthropometric measurements supported in imaging orders."
* ^language = #cs
* ^version = "1.0.0"
* ^status = #active
* ^date = "2026-09-18"
* ^publisher = "NCEZ"
* ^experimental = false
* ^url = "https://ncez.mzcr.cz/terminology/ValueSet/cz-anthropometric-metric"
* insert SetFmmandStatusRule(2, trial-use)
* insert LOINCCopyrightForVS

* $loinc#85353-1 //Vital signs, weight, height, head circumference, oxygen saturation and BMI panel - It represent a panel of vital signs listed in this table. All members of the panel are optional and note that querying for the panel may miss individual results that are not part of the actual panel. When used, Observation.valueQuantity is not present; instead, related links (with type=has-member) reference the vital signs observations (e.g. respiratory rate, heart rate, BP, etc.). This code replaces the deprecated code 8716-3 - Vital signs which is used in the Argonaut Data Query Implementation Guide.
* $loinc#8302-2 //"Body height"
* $loinc#29463-7 //"Body weight"
* $loinc#9843-4 //"Head Occipital-frontal circumference"
* $loinc#39156-5 //"Body mass index (BMI)"
* $loinc#8277-6 //"Body surface area"
* $loinc#9279-1 // "Respiratory rate"
* $loinc#8867-4 // "Heart rate"
* $loinc#2708-6 // "Oxygen saturation in Arterial blood"
* $loinc#8310-5 // "Body temperature"
* $loinc#85354-9 // "Blood pressure systolic and diastolic" "Blood pressure panel with all children optional - This is a component observation. It has no value in Observation.valueQuantity and contains at least one component (systolic and/or diastolic). To supplement this vital sign observation, 8478-0 - Mean blood pressure, 8357-6 - Blood pressure method, 41904-4 - Blood pressure measurement site, 8358-4 - Blood pressure device cuff size, 41901-0 - Type of blood pressure device MAY be used as additional observations."
* $loinc#8480-6 // Systolic blood pressure - Observation.component code for a blood pressure Observation
* $loinc#8462-4	// Diastolic blood pressure - Observation.component code for a blood pressure Observation