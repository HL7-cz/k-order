Logical: LMCzHeaderOrderCz
Id: LMHeaderOrder
Title: "A.1 - Hlavička dokumentu"
Description: """Záhlaví dokumentu s administrativními údaji"""

* subjekt 1..1 LMSubjectOrderCz "A.1.1 - Identifikace pacienta  A.1.2 Kontaktní informace pacienta/subjektu" """Identifikace pacienta/subjektu a jeho kontaktních informací"""
* zdravotniPojisteni 0..1 LMPayerOrderCz "A.1.3 - Zdravotní pojištění" """Informace o zdravotním pojištění."""
* uhrada 1..1 LMCoverageOrderCz "A.1.4 - Úhrada" """Informace o způsobu úhrady objednávky vyšetření."""
* objednatel 1..* LMAuthorOrderCz "A.1.5 - Objednatel" """Objednatel provedení zdravotní služby."""
* Provadejici 0..1 LMRequestedPerformerOrderCz "A.1.6 - Provádějící" """Předpokládaný Provádějící žádanky (u neadresné žádanky nebude Provádějící uveden)."""
* dodatecniPrijemci 0..* LMAdditionalRecipientCz "A.1.7 - Příjemce nálezu" """Dodateční příjemci nálezu kromě objednatele"""
* metadataDokumentu 1..1 LMDocumentMetadataCz "A.1.8 - Metadata dokumentu" """Dokument metadata"""
* elektronickyPodpis 1..* LMDigitalSignatureOrderCz "A.1.9 - Elektronické podpisy" """Elektronické podpisy dle zákona 327/2011 §54a"""
