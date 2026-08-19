ValueSet: FTOrderProceduresVS
Id: ft-order-procedures-vs
Title: "FT Procedures ValueSet (CZ)"
Description: "SNOMED CT procedury pro požadované fyzioterapeutické a rehabilitační výkony v FT žádance."
* ^language = #cs
* ^status = #active
* ^publisher = "HL7 CZ"
* insert SNOMEDCopyrightForVS

* include codes from system $sct where concept is-a #91251008
* exclude $sct#91251008 "Physical therapy procedure"
* exclude $sct#115985003 "Sweat collection by iontophoresis procedure"
* exclude codes from system $sct where concept is-a #17395000
* exclude codes from system $sct where concept is-a #80504003
* exclude codes from system $sct where concept is-a #76075007
* exclude codes from system $sct where concept is-a #35581008
* exclude codes from system $sct where concept is-a #183281008
* exclude codes from system $sct where concept is-a #78795004
* exclude codes from system $sct where concept is-a #28443006
