Logical: LMKOrderCz
Id: LMKOrderCz
Title: "K-žádanka"
Description: """Kompletní logický model K-žádanky obsahující hlavičku dokumentu,
tělo žádanky, prezentovanou formu a přílohy.""" 

* insert SetFmmandStatusRule ( 0, draft )

* hlavicka 1..1 LMHeaderOrder
  "A.1 - Hlavička"
  """Hlavička dokumentu K-žádanky."""

* telo 1..1 LMBodyKOrder
  "A.2 - Tělo dokumentu (K)"
  """Tělo dokumentu K-žádanky obsahující informace o objednávce,
klinické údaje, úhradu, termín návštěvy a specifikaci požadovaných služeb."""

* prezentovanaForma 0..* LMPresentedFormOrderCz
  "A.4 - Prezentovaná forma"
  """Lidsky čitelná reprezentace dokumentu."""

* prilohy 0..* LMAttachmentsOrderCz
  "A.5 - Přílohy"
  """Přílohy připojené ke K-žádance."""