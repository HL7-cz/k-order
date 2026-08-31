Logical: LMCzFTOrderDataElementsCz
Id: LMFTOrderDataElementsCz
Title: "A.3.2 - Datové elementy objednávky / vyšetření (FT žádanky)"
Description: """Datové elementy objednávky / vyšetření"""

* pozadovaneVysetreni 1..* Base "A.3.2.1 - Požadované vyšetření" """Požadované vyšetření nebo služba."""
* pozadovaneVysetreni.kod 1..1 CodeableConcept "A.3.2.1.1 - Kód vyšetření" """Kód reprezentující vyšetření v rámci dohodnutého číselníku (aktuálně VZP číselník procedůr, výhledově snomed CT) včetně jeho názvu."""
* pozadovaneVysetreni.nazev 0..1 string "A.3.2.1.2 - Název vyšetření" """Celý název vyšetření, pokud je odlišný od kódované informace."""
* pozadovaneVysetreni.castTela 0..* CodeableConcept "A.3.2.1.3 - Část těla" """Část těla, které se požadovaná péče týká."""
* pozadovaneVysetreni.lateralita 0..1 CodeableConcept "A.3.2.1.4 - Lateralita" """Strana těla, pokud je pro požadovanou péči relevantní."""
* pozadovaneVysetreni.pocet 0..1 positiveInt "A.3.2.1.5 - Počet" """Celkový počet požadovaných provedení péče nebo výkonu."""
* pozadovaneVysetreni.frekvence 0..1 string "A.3.2.1.6 - Frekvence" """Požadovaná frekvence provádění péče nebo výkonu."""
* pozadovaneVysetreni.poznamka 0..1 string "A.3.2.1.7 - Poznámka" """Poznámka objednatele k žádanému vyšetření."""
* pozadovaneVysetreni.mistoPoskytnutiPece 0..1 CodeableConcept "A.3.2.1.8 - Místo poskytnutí péče" """Požadované místo poskytnutí péče nebo výkonu, například domácí prostředí pacienta."""
* cilVysetreni 0..* Base "A.3.2.2 - Cíl vyšetření" """Cíl požadovaného vyšetření."""
