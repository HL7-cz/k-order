Logical: LogCzCoverageKOrderCz
Id: LogCoverageKOrderCz
Title: "A.1.4 - Úhrada"
Description: """Informace o způsobu úhrady objednávky vyšetření"""

* insert SetFmmandStatusRule ( 1, draft )

* method 1..1 CodeableConcept "A.1.4.1 - Způsob úhrady" """Způsob úhrady objednávky (zdravotní pojištění, hradí pacient, jiný)."""
* infoOPlatci 0..1 Base "A.1.4.2 - Informace o plátci" """Identifikační údaje plátce a doplňující informace, pokud jde o jinou úhradu než ze zdravotního pojištění. Identifikační údaje obsahují identifikátor, název organizace či jméno plátce, adresu plátce a telekomunikační spojení."""
* infoOPlatci.jmeno 0..1 HumanName "A.1.4.2.1 - Jméno plátce" """Jméno a příjmení plátce"""
* infoOPlatci.idOrganizace 0..* Identifier "A.1.4.2.2 - ID organizace" """Identifikátor organizace plátce"""
* infoOPlatci.organizace 0..1 Base "A.1.4.2.3 - Organizace plátce" """Organizace plátce"""
* infoOPlatci.adresa 0..1 Address "A.1.4.2.4 - Adresa" """Adresa plátce"""
* infoOPlatci.zeme 1..1 CodeableConcept "A.1.4.2.5 - Země" """Země plátce"""
* infoOPlatci.telekom 0..* ContactPoint "A.1.4.2.6 - Telekom" """Telekomunikační spojení na plátce."""