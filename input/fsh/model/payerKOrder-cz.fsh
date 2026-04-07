Logical: LogCzPayerKOrderCz
Id: LogPayerKOrderCz
Title: "A.1.3 - Zdravotní pojištění"
Description: """Informace o zdravotním pojištění."""

* insert SetFmmandStatusRule ( 1, draft )

* kod 0..1 Identifier "A.1.3.1 - Kód zdravotní pojišťovny" """Kód zdravotní pojišťovny."""
* nazev 0..1 string "A.1.3.2 - Název zdravotní pojišťovny" """Název zdravotní pojišťovny"""
* cisloPojistence 0..1 Identifier "A.1.3.3 - Číslo zdravotního pojištění" """Číslo pojištěnce."""