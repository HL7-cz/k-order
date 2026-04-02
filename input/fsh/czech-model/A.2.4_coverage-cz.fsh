Logical: LMCzCoverageBodyCz
Id: LMCoverageBodyCz
Title: "A.2.4 - Úhrada"
Description: """Informace o způsobu úhrady objednávky vyšetření"""

* insert SetFmmandStatusRule ( 1, draft )

* zpusob 1..1 CodeableConcept "A.2.4.1 - Způsob úhrady" """Method of payment for the order (health insurance, paid by the patient, other)"""
* informaceOPlatci 0..1 Base "A.2.4.2 - Informace o plátci" """Payer identification data and additional information regarding reimbursement other than from health insurance. Identification data includes the identifier, name of the organization or name of the payer, address of the payer and telecommunications connection."""
* informaceOPlatci.jmeno 0..1 HumanName "A.2.4.2.1 - Jméno plátce" """Jméno a příjmení plátce"""
* informaceOPlatci.identifikatorOrganizace 0..* Identifier "A.2.4.2.2 - ID organizace plátce" """Identifikátor organizace plátce"""
* informaceOPlatci.organizace 0..1 Base "A.2.4.2.3 - Organizace plátce" """Organizace plátce"""
* informaceOPlatci.adresa 0..1 Address "A.2.4.2.4 - Adresa" """Adresa plátce"""
* informaceOPlatci.zeme 1..1 CodeableConcept "A.2.4.2.5 - Země" """Země, ze které úhrada pochází"""
* informaceOPlatci.telekom 0..* ContactPoint "A.4.7.2.6 - Telekom" """Telekomunikační spojení na osobu zodpovědnou za úhrady."""
* komentar 0..1 string "A.2.4.3 - Komentář" """Případné upřesnění platby"""
