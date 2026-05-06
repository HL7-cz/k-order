Logical: LMCzOrderCz
Id: LMOrderCz
Title: "A - Souhrnný logický model obecné žádanky"
Description: """Souhrnný logický model žádanky složený z hlavičky, těla dokumentu, vizuální podoby a příloh."""

* hlavicka 1..1 LMHeaderOrder
  "A.1 - Hlavička dokumentu"
  """Hlavička žádanky obsahující identifikaci subjektů, administrativní údaje a metadata dokumentu."""

* telo 0..1 LMBodyOrder
  "A.2 / A.3 - Tělo dokumentu"
  """Tělo žádanky. Podle typu žádanky se specializuje na konkrétní model těla, např. K žádanka nebo FT žádanka."""

* prezentacniForma 1..* LMPresentedFormOrderCz
  "A.4 - Prezentovatelná podoba dokumentu"
  """Vizuální podoba dokumentu čitelná lidským okem."""

* prilohy 0..* LMAttachmentsOrderCz
  "A.5 - Přílohy"
  """Další přílohy a doplňující soubory připojené k žádance."""
