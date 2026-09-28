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
* zavaznaAnamnestickaData 0..1 Base "A.3.2.2 - Závažná anamnestická data" """Textový souhrn a/nebo odkazy na strukturované záznamy. Stejné záznamy lze sdílet s obecnými prvky A.3.1 a A.5 bez jejich duplikace."""
* zavaznaAnamnestickaData.text 0..1 string "Textový souhrn" """Volný text v narativu příslušné sekce Composition. Samotný text nevyžaduje vytvoření strukturovaného zdroje."""
* zavaznaAnamnestickaData.zaznam 0..* Reference(CZ_ConditionCore) "Strukturované záznamy" """Odkazy na záznamy splňující cílový profil včetně jeho povinných prvků. Stejná klinická skutečnost používá stejný zdroj a identifikátor."""
* vysledkyVysetreni 0..1 Base "A.3.2.3 - Výsledky provedených vyšetření" """Textový souhrn a/nebo odkazy na strukturované záznamy. Stejné záznamy lze sdílet s obecnými prvky A.3.1 a A.5 bez jejich duplikace."""
* vysledkyVysetreni.text 0..1 string "Textový souhrn" """Volný text v narativu příslušné sekce Composition. Samotný text nevyžaduje vytvoření strukturovaného zdroje."""
* vysledkyVysetreni.zaznam 0..* Reference(CZ_MedicalTestResultCore) "Strukturované záznamy" """Odkazy na záznamy splňující cílový profil včetně jeho povinných prvků. Stejná klinická skutečnost používá stejný zdroj a identifikátor."""
* diferencialniDiagnostickaRozvaha 0..1 Base "A.3.2.4 - Diferenciálně diagnostická rozvaha" """Textový souhrn a/nebo odkazy na strukturované záznamy. Stejné záznamy lze sdílet s obecnými prvky A.3.1 a A.5 bez jejich duplikace."""
* diferencialniDiagnostickaRozvaha.text 0..1 string "Textový souhrn" """Volný text v narativu příslušné sekce Composition. Samotný text nevyžaduje vytvoření strukturovaného zdroje."""
* diferencialniDiagnostickaRozvaha.zaznam 0..* Reference(CZ_ConditionCore) "Strukturované záznamy" """Odkazy na záznamy splňující cílový profil včetně jeho povinných prvků. Stejná klinická skutečnost používá stejný zdroj a identifikátor."""
* soucasnaLecba 0..1 Base "A.3.2.5 - Současná léčba, medikace včetně dávkování" """Textový souhrn a/nebo odkazy na strukturované záznamy. Stejné záznamy lze sdílet s obecnými prvky A.3.1 a A.5 bez jejich duplikace."""
* soucasnaLecba.text 0..1 string "Textový souhrn" """Volný text v narativu příslušné sekce Composition. Samotný text nevyžaduje vytvoření strukturovaného zdroje."""
* soucasnaLecba.zaznam 0..* Reference(CZ_MedicationStatementCore or CZ_MedicationAdministrationCore) "Strukturované záznamy" """Odkazy na záznamy splňující cílový profil včetně jeho povinných prvků. Stejná klinická skutečnost používá stejný zdroj a identifikátor."""
* zapujcenaDokumentace 0..1 Base "A.3.2.6 - Zapůjčená dokumentace" """Textový souhrn a/nebo odkazy na strukturované záznamy. Stejné záznamy lze sdílet s obecnými prvky A.3.1 a A.5 bez jejich duplikace."""
* zapujcenaDokumentace.text 0..1 string "Textový souhrn" """Volný text v narativu příslušné sekce Composition. Samotný text nevyžaduje vytvoření strukturovaného zdroje."""
* zapujcenaDokumentace.zaznam 0..* Reference(CZ_Attachment) "Strukturované záznamy" """Odkazy na záznamy splňující cílový profil včetně jeho povinných prvků. Stejná klinická skutečnost používá stejný zdroj a identifikátor."""
