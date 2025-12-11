Logical: LogCzAuthorKOrderCz
Id: LogAuthorKCz
Title: "A.1.5 - Objednatel"
Description: """Objednatel (Objednatel provedení zdravotní služby)."""

* insert SetFmmandStatusRule ( 1, draft )

* identifikator 1..* Identifier "A.1.5.1 - Identifikátor zadavatele objednávky" """Identifikační číslo zdravotnického pracovníka –  národní ID zdravotnického pracovníka vedený v KRZP. V případě, že není objednávka zadána zdravotnickým pracovníkem, ale například samotným pacientem, měl by být použit osobní identifikátor RID (případně DRID)."""
* jmeno 1..1 HumanName "A.1.5.2 - Jméno zadavatele objednávky" """Jméno objednavatele"""
* adresa 1..1 Base "A.1.5.3 - Kontaktní údaje zadavatele objednávky" """Kontaktní údaje zadavatele objednávky (adresa a telekomunikační údaje)."""
* organizace 0..1 Base "A.1.5.4 - Organizace zadavatele objednávky" """Organizace zadavatele objednávky (poskytovatel zdravotních služeb)."""