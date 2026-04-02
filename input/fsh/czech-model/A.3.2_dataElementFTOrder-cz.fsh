Logical: LMCzFTOrderDataElementsCz
Id: LMFTOrderDataElementsCz
Title: "A.3.2 - Datové elementy objednávky / vyšetření"
Description: """Datové elementy objednávky / vyšetření"""

* pozadovaneVysetreni 1..* Base "A.3.2.1 - Požadované vyšetření" """Požadované vyšetření nebo služba."""
* pozadovaneVysetreni.kod 1..1 CodeableConcept "A.3.2.1.1 - Kód vyšetření" """Kód reprezentující vyšetření v rámci dohodnutého číselníku včetně jeho názvu."""
* pozadovaneVysetreni.nazev 0..1 string "A.3.2.1.2 - Název vyšetření" """Celý název vyšetření, pokud je odlišný od kódované informace."""
* pozadovaneVysetreni.modalita 0..1 CodeableConcept "A.3.2.1.3 - Modalita" """Požadovaná metoda nebo modalita vyšetření či péče."""
* pozadovaneVysetreni.castTela 0..* CodeableConcept "A.3.2.1.4 - Část těla" """Část těla, které se požadovaná péče týká."""
* pozadovaneVysetreni.lateralita 0..1 CodeableConcept "A.3.2.1.5 - Lateralita" """Strana těla, pokud je pro požadovanou péči relevantní."""
* pozadovaneVysetreni.frekvence 0..1 string "A.3.2.1.6 - Frekvence" """Požadovaná frekvence provádění péče nebo výkonu."""
* pozadovaneVysetreni.poznamka 0..1 string "A.3.2.1.7 - Poznámka" """Poznámka objednatele k žádanému vyšetření."""
