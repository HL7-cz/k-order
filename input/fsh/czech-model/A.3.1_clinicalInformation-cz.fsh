Logical: LMCzOrderClinicalInformationCz				
Id: LMClinicalInformationCz
Title: "A.3.1 - Klinické informace (anamnéza)"				
Description:  """Informace a údaje sdělované provádějicímu pracovišti, mající vliv na provedení objednávky či interpretaci výsledků"""		

* insert SetFmmandStatusRule( 1, draft)	

* klinickeInformaceText 0..1 string "A.3.1.1 - Klinické informace volným textem" """Klinické informace nezbytné pro správné provedení objednávky či interpretaci výsledků."""
* klinickeInformaceKod 0..1 CodeableConcept "A.3.1.2 - Klinické informace (anamnéza) formalizovaná" """Klinické informace (anamnéza) formalizovaná"""
* popis 0..* CodeableConcept "A.3.1.3 - Popis problému / diagnózy / stavu" """Diagnózy a dalších klinických informací mající vliv na průběh či výsledek vyšetření.
- Preferované systémy: MKN-10
- Preferované systémy: Orphacode"""
* medikace 0..* CodeableConcept "A.3.1.4 - Medikace" """Blok medikace obsahující informace o medikaci mající vliv na průběh či výsledek vyšetření či jeho interpretaci.
- Preferované systémy: DLP
- Preferované systémy: ATC"""
* medikace.id 0..* Identifier "A.3.1.4.1 - ID medikace" """ID medikace"""
* medikace.kod 0..* code "A.3.1.4.2 - Kod medikace" """Kod medikace"""
* medikace.mnozstvi 0..1 Ratio "A.3.1.4.3 - Mnozstvi" """Mnozstvi medikace"""
* ockovani 0..* CodeableConcept "A.3.1.5 - Očkování" """Očkování"""
* nalez 0..* CodeableConcept "A.3.1.6 - Fyzikální nález" """Fyzikální vyšetření pacienta (systolický a diastolický tlak, srdeční frekvence, saturace, dechová frekvence, aktuální telesná teplota)"""
* datumHospitalizace 0..* dateTime "A.3.1.7 - Datum " """Date of patient hospitalization"""
//* omezeniPohyblivostiPacienta 1..1 Base "A.3.1.6 - Omezení pohyblivosti pacienta" """Omezení pohyblivosti pacienta"""
* urgentniInformace 0..1 Base "A.3.1.8 - Urgentní informace" """Blok urgentní inforace ve stejné strukruře jako v ostatních typech dokumentů (propouštěcí zpráva, pacientský souhrn)"""
* urgentniInformace.alergie 1..* CodeableConcept "A.3.1.8.1 - Alergie a intolerance" """Alergie a intolerance, které mohou vlivnit realizaci objednávky či interpretaci výsledků"""
* urgentniInformace.varovani 0..* string "A.3.1.8.2 - Varování" """Varování a upozornění, která mohou vlivnit realizaci objednávky či interpretaci výsledků"""
/**  implantat 0..* Base "A.3.1.4 - Implantat" """Seznam implantátů či pomůcek majících vliv na průběh vyšetření či jeho interpretaci."""
*  implantat.typ 1..1 CodeableConcept "A.3.1.4.1 - Druh implantátu" """Druh implantátu"""
*  implantat.id 0..* Identifier "A.3.1.4.2 - ID implantátu" """Normalizovaný identifikátor, např. UDI, dle nařízení EU 2017/745, kód ZP dle katalogu zdravotní pojišťovny"""
*  implantat.model 1..1 string "A.3.1.4.3 - Konkrétní model" """Konkrétní model"""
*  implantat.castTela 0..* CodeableConcept "A.3.1.4.4 - Část těla" """Část těla, kam je implantován"""*/
* dalsiUdaje 0..1 Base "A.3.1.9 - Další formalizované údaje" """"""
* dalsiUdaje.datum 0..1 dateTime "A.3.1.9.1 - Datum" """DDatum zjištění údaje, uvádí se, pokud je odlišné od data vystavení objednávky."""
* dalsiUdaje.kod 1..1 CodeableConcept "A.3.1.9.2 - Kód" """Kód pozorování identifikující význam údaje (výška, váha, týden gravidity a pod.)
- Preferované systémy: NČLP
- Preferované systémy: SNOMED CT"""
* dalsiUdaje.hodnota 0..1 Narrative "A.3.1.9.3 - Hodnota" """Hodnota údaje včetně jednotky měření."""