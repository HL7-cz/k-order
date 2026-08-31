ValueSet: KOrderProceduresVS
Id: korder-procedures-vs
Title: "K-order Procedures ValueSet (CZ)"
Description: "SNOMED CT procedury pro požadované konziliární služby a konzultace v K-order."
* ^language = #cs
* ^status = #active
* ^publisher = "HL7 CZ"
* insert SNOMEDCopyrightForVS

* include codes from system $sctCZ where concept is-a #11429006
* exclude $sctCZ#11429006 "Consultation"
* exclude $sctCZ#726007 "Pathology consultation, comprehensive, records and specimen with report"
* exclude $sctCZ#28191001 "Consultation and report by radiologist"
* exclude $sctCZ#711532000 "Surgical pathology consultation on slides with comprehensive review and interpretation"
* exclude $sctCZ#49463003 "Consultation for paternity case"
* exclude $sctCZ#313183009 "Inappropriate use of out of hours service"
* exclude $sctCZ#314849005 "Telephone contact by consultant"
* exclude $sctCZ#710242005 "Consulting with home care service"
* exclude $sctCZ#1156702006 "Consulting with healthcare provider about medication side effects"
* exclude $sctCZ#1156704007 "Consulting with pharmacist about generic medication"
* exclude codes from system $sctCZ where concept is-a #31108002
* exclude codes from system $sctCZ where concept is-a #711420002
* exclude codes from system $sctCZ where concept is-a #34043003
* exclude codes from system $sctCZ where concept is-a #30274002
* exclude codes from system $sctCZ where concept is-a #680007
* exclude codes from system $sctCZ where concept is-a #59000001
* exclude codes from system $sctCZ where concept is-a #1255360006
* exclude codes from system $sctCZ where concept is-a #71318009
* exclude codes from system $sctCZ where concept is-a #400979004
* exclude codes from system $sctCZ where concept is-a #788542004
* exclude codes from system $sctCZ where concept is-a #788543009
* exclude codes from system $sctCZ where concept is-a #398228004
* exclude codes from system $sctCZ where concept is-a #698309000
* exclude codes from system $sctCZ where concept is-a #698310005
* exclude codes from system $sctCZ where concept is-a #698311009
* exclude codes from system $sctCZ where concept is-a #698312002
* exclude codes from system $sctCZ where concept is-a #698313007
