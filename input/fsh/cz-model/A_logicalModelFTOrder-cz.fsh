Logical: LMCzFTOrderCz
Id: LMFTOrderCz
Title: "A - Souhrnný logický model FT žádanky"
Description: """Souhrnný logický model FT žádanky složený z hlavičky, těla FT žádanky, vizuální podoby a příloh."""

* hlavicka 1..1 LMHeaderOrder "A.1 - Hlavička dokumentu" """Hlavička FT žádanky obsahující identifikaci subjektů, administrativní údaje a metadata dokumentu."""
* telo 1..1 LMBodyFTOrder "A.2 a A.3 - Tělo dokumentu" """Tělo FT žádanky obsahující informace o objednávce, klinickém kontextu a požadovaných FT výkonech nebo službách."""
* prezentacniForma 1..* LMPresentedFormOrderCz "A.4 - Vizuální podoba dokumentu" """Vizuální podoba dokumentu čitelná lidským okem."""
* prilohy 0..* LMAttachmentsOrderCz "A.5 - Přílohy" """Další přílohy a doplňující soubory připojené k FT žádance."""
