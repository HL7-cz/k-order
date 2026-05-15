Logical: LMFTOrderCz
Id: LMFTOrderCz
Title: "FT-žádanka"
Description: """Kompletní logický model FT-žádanky obsahující hlavičku dokumentu,
tělo žádanky, prezentovanou formu a přílohy.""" 

* insert SetFmmandStatusRule ( 0, draft )

* hlavicka 1..1 LMHeaderOrder
  "A.1 - Hlavička"
  """Hlavička dokumentu FT-žádanky."""

* telo 1..1 LMBodyFTOrder
  "A.2 - Tělo dokumentu (FT)"
  """Tělo dokumentu FT-žádanky obsahující informace o objednávce,
klinické údaje, úhradu, termín návštěvy a specifikaci požadovaných služeb."""

* prezentovanaForma 0..* LMPresentedFormOrderCz
  "A.4 - Prezentovaná forma"
  """Lidsky čitelná reprezentace dokumentu."""

* prilohy 0..* LMAttachmentsOrderCz
  "A.5 - Přílohy"
  """Přílohy připojené ke FT-žádance."""