Logical: LogCzHeaderKOrderCz
Id: logHeaderKOrder
Title: "A.1 - Hlavička dokumentu"
Description: """Záhlaví dokumentu s administrativními údaji"""

* subjekt 1..1 LogSubjectKOrderCz "A.1.1 - Identifikace pacienta  A.1.2 Kontaktní informace pacienta/subjektu" """Identifikace pacienta/subjektu a jeho kontaktních informací"""
* zdravotniPojisteni 0..1 LogPayerKOrderCz "A.1.3 - Zdravotní pojištění" """Informace o zdravotním pojištění."""
* uhrada 1..1 LogCoverageKOrderCz "A.1.4 - Úhrada" """Informace o způsobu úhrady objednávky vyšetření."""
* objednatel 1..* LogAuthorKCz "A.1.5 - Objednatel" """Objednatel provedení zdravotní služby."""
* zpracovatel 0..1 LogRequestedPerformerKCz "A.1.6 - Zpracovatel" """Předpokládaný zpracovatel žádanky (u neadresné žádanky nebude zpracovatel uveden)."""
* dodatecniPrijemci 0..* LogAdditionalRecipientKCz "A.1.7 - Příjemce nálezu" """Dodateční příjemci nálezu kromě objednatele"""
* metadataDokumentu 1..1 LogDocumentMetadataKCz "A.1.8 - Metadata dokumentu" """Dokument metadata"""
* elektronickyPodpis 1..* LogDigitalSignatureKCz "A.1.9 - Elektronické podpisy" """Elektronické podpisy dle zákona 327/2011 §54a"""
