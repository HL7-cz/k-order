
Logical: LMCzAppointmentCz
Id: LMAppointmentCz
Title: "A.2.5 - Termín návštěvy"
Description: """Informace o objednaném termínu vyšetření (pokud byl termín rezervován)"""

* insert SetFmmandStatusRule ( 0, draft )

* id 0..1 Identifier "A.2.5.1 - Termín ID" """Identifikátor záznamu termínu návštěvy"""
* stav 1..1 CodeableConcept "A.2.5.2 - Stav termínu" """Stav termínu (navržený, potvrzený, zrušený).
Preferovaný systém: hl7:valueset-appointmentstatus"""
* popis 1..1 string "A.2.5.3 - Popis" """Stručný popis termínu návštěvy pro zobrazení v seznamu termínů."""
* datumACas 0..1 dateTime "A.2.5.4 - Plánovaný čas" """Datum a čas návštěvy"""
* delkaVysetreni 0..1 Duration "A.2.5.5 - Délka vyšetření" """Délka vyšetření"""
* komentar 0..1 string "A.2.5.6 - Komentář" """Doplňující komentář"""
* instrukceProPacienta 0..1 string "A.2.5.7 - Instrukce pro pacienta" """Instrukce pro pacienta (např. dostavte se 15 minut napřed, nalačno, zajistěte si odvoz apod.)."""
* misto 1..1 Base "A.2.5.8 - Místo" """Název a adresa pracoviště, kde byl termín návštěvy sjednán."""
