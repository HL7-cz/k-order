ValueSet: KOrderProceduresVS
Id: korder-procedures-vs
Title: "K-order Procedures ValueSet (CZ)"
Description: "SNOMED CT procedury pro požadované konziliární služby a konzultace v K-order."
* ^language = #cs
* ^status = #active
* ^publisher = "HL7 CZ"
* insert SNOMEDCopyrightForVS

// Consultation (konzultace) včetně podřazených konceptů
* include codes from system $sctCZ where concept is-a #11429006
// Patient referral (doporučení pacienta) včetně podřazených konceptů
* include codes from system $sctCZ where concept is-a #3457005
// Transfer of care (předání péče)
* include $sctCZ#308292007 "Transfer of care"
// Transfer of care to hospital (předání péče do nemocnice)
* include $sctCZ#429202003 "Transfer of care to hospital"
/* 
* exclude $sctCZ#11429006 //"Consultation"
* exclude $sctCZ#726007 //"Pathology consultation, comprehensive, records and specimen with report"
* exclude $sctCZ#28191001 //"Consultation and report by radiologist"
* exclude $sctCZ#711532000 //"Surgical pathology consultation on slides with comprehensive review and interpretation"
* exclude $sctCZ#49463003 //"Consultation for paternity case"
* exclude $sctCZ#313183009 //"Inappropriate use of out of hours service"
* exclude $sctCZ#314849005 //"Telephone contact by consultant"
* exclude $sctCZ#710242005 //"Consulting with home care service"
* exclude $sctCZ#1156702006 //"Consulting with healthcare provider about medication side effects"
* exclude $sctCZ#1156704007 //"Consulting with pharmacist about generic medication"
* exclude codes from system $sctCZ where concept is-a #31108002  //konzultace v oblasti laboratorní medicíny
* exclude codes from system $sctCZ where concept is-a #711420002  // X-ray consultation
* exclude codes from system $sctCZ where concept is-a #34043003 // stomatologická konzultace a zpráva
* exclude codes from system $sctCZ where concept is-a #30274002 // chiropraktická konzultace
* exclude codes from system $sctCZ where concept is-a #680007   // konzultace v oblasti radiační fyziky
* exclude codes from system $sctCZ where concept is-a #59000001 // konzultace v oboru chirurgické patologie a zpráva o předaných preparátech připravených na jiném místě
* exclude codes from system $sctCZ where concept is-a #1255360006 // konzultace k radioterapii
* exclude codes from system $sctCZ where concept is-a #71318009 // konzultace a zpráva v oboru rehabilitačního lékařství
* exclude codes from system $sctCZ where concept is-a #400979004  // homeopatická konzultace
* exclude codes from system $sctCZ where concept is-a #788542004  // konzultace s akupunkturistou
* exclude codes from system $sctCZ where concept is-a #788543009  // konzultace s ergoterapeutem
* exclude codes from system $sctCZ where concept is-a #398228004  // anesteziologická konzultace
* exclude codes from system $sctCZ where concept is-a #698309000  // konzultace k endoskopickému výkonu - Consultation for endoscopic procedure
* exclude codes from system $sctCZ where concept is-a #698310005  // konzultace k výkonu kolposkopie
* exclude codes from system $sctCZ where concept is-a #698311009  // konzultace k výkonu asistované reprodukce
* exclude codes from system $sctCZ where concept is-a #698312002  // konzultace k malému abdominálnímu operačnímu výkonu - Consultation for minor abdominal procedure
* exclude codes from system $sctCZ where concept is-a #698313007  // konzultace k malému operačnímu výkonu
*/ // V této verzi publikace zatím dovoleny všechny procedury, včetně obecných pojmů. V budoucnu bude nutné omezit na konkrétní výkony.