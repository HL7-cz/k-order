Logical: LMCzKOrderCz
Id: LMKOrderCz
Title: "A - Souhrnný logický model K žádanky"
Description: """Souhrnný logický model K žádanky složený z hlavičky, těla K žádanky, vizuální podoby a příloh."""

* hlavicka 1..1 LMHeaderOrder "A.1 - Hlavička dokumentu" """Hlavička K žádanky obsahující identifikaci subjektů, administrativní údaje a metadata dokumentu."""
* telo 1..1 LMBodyKOrder "A.2 a A.3 - Tělo dokumentu" """Tělo K žádanky obsahující informace o objednávce, klinickém kontextu a požadovaných vyšetřeních nebo službách."""
* prezentacniForma 1..* LMPresentedFormOrderCz "A.4 - Vizuální podoba dokumentu" """Vizuální podoba dokumentu čitelná lidským okem."""
* prilohy 0..* LMAttachmentsOrderCz "A.5 - Přílohy" """Další přílohy a doplňující soubory připojené ke K žádance."""
