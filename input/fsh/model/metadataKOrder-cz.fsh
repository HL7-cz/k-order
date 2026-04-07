Logical: LogCzDocumentMetadataKOrderCz
Id: LogDocumentMetadataKCz
Title: "A.1.8 - Metadata dokumentu"
Description: """Metadata dokumentu"""

* idDokumentu 1..1 Identifier "A.1.8.1 - ID dokumentu" """Identifikátor dokumentu"""
* kategorie 1..1 CodeableConcept "A.1.8.2 - Kategorie" """Kategorie elektronického zdravotního záznamu (EHR)."""
* stav 1..1 CodeableConcept "A.1.8.3 - Stav" """Stav dokumentu (předběžný, finální, doplněný, opravený atp.)."""
* datumACas 1..1 dateTime "A.1.8.4 - Datum a čas vytvoření" """Datum a čas vytvoření dokumentu."""
* nazev 1..1 string "A.1.8.5 - Název dokumentu" """Název dokumentu"""
* spravce 1..1 Base "A.1.8.6 - Správce dokumentu" """Název a identifikační údaje subjektu, který dokument spravuje. Alias technický správce dokumentu."""
* duvernost 1..1 CodeableConcept "A.1.8.7 - Důvěrnost" """Stupeň důvěrnosti dokumentu (a jeho obsahu)."""
* jazyk 1..1 CodeableConcept "A.1.8.8 - Jazyk" """Jazyk, v němž je dokument napsán (narativní část dokumentu)."""
* verze 0..1 string "A.1.8.9 - Verze" """Verze dokumentu"""
