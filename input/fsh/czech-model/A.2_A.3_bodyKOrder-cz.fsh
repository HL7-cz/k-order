Logical: LMCzBodyKOrderCz
Id: LMBodyKOrder
Title: "A.2 - Tělo dokumentu"
Description: """Tělo dokumentu K-žádanky obsahující informace o objednávce,
klinické údaje, úhradu, termín návštěvy a specifikaci požadovaných služeb.""" 

* infoObjednavce 0..1 LMOrderInformationCz
  "A.2.1 - Informace o objednávce"
  """Základní informace o žádance včetně diagnóz a důvodu žádosti."""

* klinickaUdalost 0..1 LMClinicalEventCz
  "A.2.3 - Klinická událost"
  """Informace o klinické události související s požadavkem."""

* uhrada 1..* LMCoverageBodyCz
  "A.2.4 - Úhrada"
  """Informace o typu úhrady zdravotní služby."""

* terminNavstevy 0..1 LMAppointmentCz
  "A.2.5 - Termín návštěvy"
  """Informace o plánovaném termínu návštěvy nebo objednání pacienta."""

* klinickeInformace 1..1 LMClinicalInformationCz
  "A.3.1 - Klinické informace"
  """Klinické informace vztahující se k žádance,
např. anamnéza, nález, výsledky vyšetření,
diferenciální diagnostická rozvaha nebo léčba."""

* datoveElementy 1..1 LMKOrderDataElementsCz
  "A.3.2 - Datové elementy objednávky"
  """Strukturovaná specifikace požadovaných zdravotních služeb,
výkonů a doporučení dalšího postupu.
Obsah odpovídá ServiceRequest.code a ServiceRequest.orderDetail."""
