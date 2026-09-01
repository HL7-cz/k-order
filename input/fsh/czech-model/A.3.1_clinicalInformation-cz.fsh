Logical: LMCzOrderClinicalInformationCz				
Id: LMClinicalInformationCz
Title: "A.3.1 - Klinické informace / podpůrné informace"				
Description:  """Informace a údaje sdělované provádějícímu pracovišti, které mají vliv na provedení žádanky nebo interpretaci výsledků."""		

* insert SetFmmandStatusRule( 1, draft)	

* biometrickeUdaje 0..1 Base "A.3.1.1 - Biometrické údaje" """Biometrické údaje relevantní pro provedení žádanky."""
* biometrickeUdaje.vaha 0..1 Base "A.3.1.1.1 - Váha" """Údaj o tělesné hmotnosti pacienta."""
* biometrickeUdaje.vaha.hodnota 1..1 Quantity "A.3.1.1.1.1 - Hodnota váhy" """Hodnota váhy včetně jednotky."""
* biometrickeUdaje.vaha.kod 1..1 CodeableConcept "A.3.1.1.1.2 - Kód váhy" """Kód určující význam údaje o váze."""
* biometrickeUdaje.vaha.datumACas 0..1 dateTime "A.3.1.1.1.3 - Datum a čas váhy" """Datum a čas zjištění váhy, pokud se liší od data žádanky."""
* biometrickeUdaje.vyska 0..1 Base "A.3.1.1.2 - Výška" """Údaj o tělesné výšce pacienta."""
* biometrickeUdaje.vyska.hodnota 1..1 Quantity "A.3.1.1.2.1 - Hodnota výšky" """Hodnota výšky včetně jednotky."""
* biometrickeUdaje.vyska.kod 1..1 CodeableConcept "A.3.1.1.2.2 - Kód výšky" """Kód určující význam údaje o výšce."""
* biometrickeUdaje.vyska.datumACas 0..1 dateTime "A.3.1.1.2.3 - Datum a čas výšky" """Datum a čas zjištění výšky, pokud se liší od data žádanky."""

* dalsiRelevantniKlinickeInformace 0..1 Base "A.3.1.2 - Další relevantní klinické informace" """Další klinické informace relevantní pro provedení žádanky nebo interpretaci výsledků."""
* dalsiRelevantniKlinickeInformace.kod 0..* CodeableConcept "A.3.1.2.1 - Kód informace (vedlejší diagnoza)" """Diagnózy a jiné klinické informace důležité pro provedení žádanky nebo interpretaci výsledků."""
* dalsiRelevantniKlinickeInformace.text 0..1 string "A.3.1.2.2 - Text informace" """Textový popis dalších relevantních klinických informací."""

* medikace 0..* Base "A.3.1.3 - Medikace" """Informace o medikaci mající vliv na průběh nebo výsledek vyšetření či péče."""
* medikace.identifikator 0..* Identifier "A.3.1.3.1 - ID medikace" """Identifikátor medikace."""
* medikace.kod 0..* code "A.3.1.3.2 - Kód medikace" """Kód medikace."""
* medikace.mnozstvi 0..1 Ratio "A.3.1.3.3 - Množství" """Množství nebo dávka medikace."""

* implantat 0..* Base "A.3.1.4 - Implantát" """Seznam implantátů nebo pomůcek majících vliv na provedení žádanky či interpretaci výsledků."""
* implantat.typ 1..1 CodeableConcept "A.3.1.4.1 - Druh implantátu" """Druh implantátu."""
* implantat.identifikator 0..* Identifier "A.3.1.4.2 - ID implantátu" """Normalizovaný identifikátor implantátu, např. UDI."""
* implantat.model 1..1 string "A.3.1.4.3 - Konkrétní model" """Konkrétní model implantátu."""
* implantat.castTela 0..* CodeableConcept "A.3.1.4.4 - Část těla" """Část těla, kde je implantát umístěn."""

* urgentniInformace 0..1 Base "A.3.1.5 - Urgentní informace" """Urgentní informace důležité pro realizaci žádanky."""
* urgentniInformace.alergieAIntolerance 1..* CodeableConcept "A.3.1.5.1 - Alergie a intolerance" """Alergie a intolerance důležité pro realizaci žádanky nebo interpretaci výsledků."""
* urgentniInformace.varovani 0..* string "A.3.1.5.2 - Varování" """Varování a upozornění mající vliv na realizaci žádanky nebo interpretaci výsledků."""

* omezeniPohyblivostiPacienta 0..1 Base "A.3.1.6 - Omezení pohyblivosti pacienta" """Strukturovaná informace o omezení pohyblivosti pacienta."""
* omezeniPohyblivostiPacienta.datumACas 1..1 dateTime "A.3.1.6.1 - Datum a čas informace" """Datum a čas zjištění informace o pohyblivosti."""
* omezeniPohyblivostiPacienta.kod 1..1 CodeableConcept "A.3.1.6.2 - Kód informace" """Kód typu hodnocené pohyblivosti."""
* omezeniPohyblivostiPacienta.hodnota 1..1 CodeableConcept "A.3.1.6.3 - Hodnota informace" """Hodnota hodnocení pohyblivosti pacienta."""
* fyzikalniNalez 0..* CodeableConcept "A.3.1.10 - Fyzikální nález" """Fyzikální nálezy relevantní pro žádanku."""
* datumHospitalizace 0..* dateTime "A.3.1.11 - Datum hospitalizace" """Datum hospitalizace pacienta, pokud je relevantní."""
* ockovani 0..* CodeableConcept "A.3.1.12 - Očkování" """Informace o očkování, pokud jsou relevantní."""

* dalsiFormalizovaneUdaje 0..* Base "A.3.1.13 - Další formalizované údaje" """Další formalizované údaje sdělované provádějícímu pracovišti."""
* dalsiFormalizovaneUdaje.datumACas 0..1 dateTime "A.3.1.13.1 - Datum" """Datum zjištění údaje, pokud se liší od data vystavení objednávky."""
* dalsiFormalizovaneUdaje.kod 1..1 CodeableConcept "A.3.1.13.2 - Kód" """Kód pozorování identifikující význam údaje."""
* dalsiFormalizovaneUdaje.hodnota 0..1 Narrative "A.3.1.13.3 - Hodnota" """Hodnota údaje včetně jednotky měření."""
