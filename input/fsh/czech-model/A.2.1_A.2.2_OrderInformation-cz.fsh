Logical: LMCzOrderInformationCz				
Id: LMOrderInformationCz
Title: "A.2.1 - Informace o objednávce and A.2.2 - Odůvodnění vyšetření (důvod objednávky)"				
Description:  """Informace o objednávce a Odůvodnění vyšetření (důvod objednávky)"""		

* insert SetFmmandStatusRule( 1, draft)	

* detailyObjednavky 0..* Base "A.2.1 - Informace o objednávce" """Informace o objednávce"""				
* detailyObjednavky.id 1..* Identifier "A.2.1.1 - ID objednávky" """Identifikátor objednávky vyšetření."""				
* detailyObjednavky.datumACas 1..1 dateTime "A.2.1.2 - Datum a čas objednávky" """Datum a čas zadání objednávky."""		 		
* detailyObjednavky.datumPozadovanehoProvedeni 0..1 dateTime "A.2.1.3 - Datum a čas požadovaného provedení" """Datum a čas požadovaného provedení"""				
* detailyObjednavky.urgentnost 0..1 CodeableConcept "A.2.1.4 - Urgentnost objednávky" """Urgentnost objednávky (rutinní, urgentní, statim).  
- Preferovaný systém: HL7:RequestPriority"""				
* detailyObjednavky.textObjednavky 0..1 string "A.2.1.5 - Text objednávky" """Textový popis objednávky či doplňující požadavky, specifické pro jednotlivé typy objednávek, pokud je nelze vyjádřit formalizovaně."""				
* detailyObjednavky.infoProPacienta 0..1 string "A.2.1.6 - Informace pro pacienta" """Instrukce pro pacienta související s objednávkou. Např. na lačno apod."""	

* duvodObjednavky 1..1 Base "A.2.2 - Odůvodnění vyšetření (důvod objednávky)" """Odůvodnění vyšetření (důvod objednávky)"""				
* duvodObjednavky.problem 1..* CodeableConcept "A.2.2.1 - Popis problému / diagnózy / stavu – indikační diagnóza" """Důvod vystavení objednávky k vyšetření vyjádřený strukturovaným textem a/nebo kódem.
- Preferovaný systém: MKN-10
- Preferovaný systém: Orphacode"""	
* duvodObjednavky.klinickaOtazkaKod 0..* CodeableConcept "A.2.2.2 - Klinická otázka kódem" """kódovaná informace z 2.2.3, pokud je zadána
- Preferovaný systém: SNOMED CT"""
* duvodObjednavky.klinickaOtazkaText 1..1 string "A.2.2.3 - Klinická otázka textem" """Klinická otázka, na kterou má provedení zobrazovací metody odpovědět. Příklad: \"Nemá pacient nádor plic?\"."""
* duvodObjednavky.duvodKod 0..* CodeableConcept "A.2.2.4 - Důvod objednávky kódem" """kódovaná informace z 2.2.5, pokud je zadána
- Preferovaný systém: SNOMED CT ReasonCodelist 243796009"""
* duvodObjednavky.duvodText 0..1 string "A.2.2.5 - Důvod objednávky textem" """Důvod vystavení objednávky k vyšetření vyjádřený volným textem (např. \"3 týdny neustupující kašel\")"""