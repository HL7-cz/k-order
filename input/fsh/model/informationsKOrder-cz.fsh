
Logical: LogCzKOrderInformationCz				
Id: logKOrderInformationCz
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

* diagnozy 1..* Base "A.2.2 – Diagnózy" """Diagnózy odůvodňující žádanku na konziliární nebo jinou zdravotní službu."""	
* diagnozy.hlavniDiagnoza 1..1 CodeableConcept "A.2.2.1 - Hlavní diagnóza"
  """Hlavní diagnóza zdůvodňující žádost dle MKN-10 (ÚZIS)."""
* diagnozy.vedlejsiDiagnozy 0..* CodeableConcept "A.2.2.2 - Vedlejší diagnózy"
  """Další relevantní diagnózy pacienta dle MKN-10 (ÚZIS)."""
* kodNahrady 0..1 CodeableConcept "A.2.3 - Kód náhrady"
  """Kód typu úhrady nebo programu dle číselníku VZP."""

