Logical: LMCzOrderDataElementsCz
Id: LMOrderDataElementsCz
Title: "A.3.2 - Datové elementy objednávky / vyšetření"
Description: """Datové elementy objednávky / vyšetření"""

* pozadovaneVysetreni 1..* Base "A.3.2.1 - Požadované vyšetření" """Požadované vyšetření nebo služba."""
* pozadovaneVysetreni.kod 1..1 CodeableConcept "A.3.2.1.1 - Kód vyšetření" """Kód reprezentující vyšetření v rámci dohodnutého číselníku včetně jeho názvu."""
* pozadovaneVysetreni.nazev 0..1 string "A.3.2.1.2 - Název vyšetření" """Celý název vyšetření, pokud je odlišný od kódované informace."""
* pozadovaneVysetreni.poznamka 0..1 string "A.3.2.1.7 - Poznámka" """Poznámka objednatele k žádanému vyšetření."""
