Logical: LMCzBodyOrderCz
Id: LMBodyOrder
Title: "A.2 - Tělo dokumentu"
Description: """Tělo dokumentu K-žádanky obsahující informace o objednávce,
klinické údaje, úhradu, termín návštěvy a specifikaci požadovaných služeb.""" 

* informaceOZadance 0..1 LMOrderInformationCz
  "A.2.1 - Informace o objednávce"
  """Základní informace o žádance včetně diagnóz a důvodu žádosti."""

* klinickaUdalost 0..1 LMClinicalEventCz
  "A.2.3 - Klinická událost"
  """Informace o klinické události související s požadavkem."""

* uhrada 1..* LMCoverageBodyCz
  "A.2.4 - Úhrada"
  """Informace o typu úhrady zdravotní služby."""

* terminVysetreni 0..1 LMAppointmentCz
  "A.2.5 - Termín návštěvy"
  """Informace o plánovaném termínu návštěvy nebo objednání pacienta."""

* informaceOVzorku 0..* LMSpecimenInformationCz
  "A.2.6 - Informace o vzorku"
  """Informace o vzorku souvisejícím s žádankou."""

* klinickeInformace 1..1 LMClinicalInformationCz
  "A.3.1 - Podpůrné informace"
  """Klinické a další podpůrné informace relevantní pro provedení žádanky a interpretaci výsledků."""

* datoveElementyObjednavkyVysetreni 1..1 LMOrderDataElementsCz
  "A.3.2 - Datové elementy objednávky"
  """Strukturovaná specifikace požadovaných zdravotních služeb nebo vyšetření."""

* odkazyNaObjednavkyPlanovanePece 0..1 LMPlannedCareOrdersCz
  "A.3.3 - Odkazy na objednávky plánované péče navazující na tuto žádanku"
  """Odkazy na související objednávky plánované péče."""

* ostatniPodpurneInformace 0..* LMOtherSupportingInformationCz
  "A.3.4 - Ostatní podpůrné informace"
  """Odkazy na další podpůrné informace související s žádankou."""
