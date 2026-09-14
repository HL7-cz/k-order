Logical: LMCzKOrderDataElementsCz
Id: LMKOrderDataElementsCz
Title: "A.3.2 - Datové elementy objednávky / vyšetření (K žádanky)"
Description: """Datové elementy objednávky / vyšetření"""

* pozadovaneVysetreni 1..* Base "A.3.2.1 - Požadované vyšetření" """Požadované vyšetření nebo služba."""
* pozadovaneVysetreni.kod 1..1 CodeableConcept "A.3.2.1.1 - Kód vyšetření" """Kód reprezentující vyšetření v rámci dohodnutého číselníku včetně jeho názvu."""
* pozadovaneVysetreni.nazev 0..1 string "A.3.2.1.2 - Název vyšetření" """Celý název vyšetření, pokud je odlišný od kódované informace."""
* pozadovaneVysetreni.poznamka 0..1 string "A.3.2.1.7 - Poznámka" """Poznámka objednatele k žádanému vyšetření."""
// Doporučení k hospitalizaci nebo převzetí do péče je samostatná požadovaná
// služba v pozadovaneVysetreni, mapovaná na vlastní ServiceRequest.
* zavaznaAnamnestickaData 0..1 string "A.3.2.2 - Závažná anamnestická data" """Textový popis významných anamnestických údajů relevantních k požadovanému vyšetření nebo zdravotnímu stavu pacienta."""
* vysledkyVysetreni 0..1 string "A.3.2.3 - Výsledky provedených vyšetření" """Souhrn nebo výběr výsledků již provedených vyšetření, které jsou relevantní k aktuální objednávce nebo klinickému rozhodování."""
* diferencialniDiagnostickaRozvaha 0..1 string "A.3.2.4 - Diferenciálně diagnostická rozvaha" """Popis diferenciálně diagnostických úvah lékaře, včetně zvažovaných diagnóz a jejich zdůvodnění."""
* soucasnaLecba 0..1 string "A.3.2.5 - Současná léčba, medikace včetně dávkování" """Přehled aktuálně probíhající léčby pacienta, včetně užívaných léčivých přípravků a jejich dávkování."""
* zapujcenaDokumentace 0..1 string "A.3.2.6 - Zapůjčená dokumentace" """Seznam nebo popis zapůjčené zdravotnické dokumentace přiložené k objednávce (např. obrazová dokumentace, zprávy z jiných pracovišť)."""
