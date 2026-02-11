Logical: LogCzBodyFTOrderCz
Id: logBodyFTOrder
Title: "A.3 - Tělo dokumentu FT žádanky"
Description: """Tělo dokumentu eŽádanky typu FT obsahující klinické údaje,
zdůvodnění indikace fyzioterapie / ergoterapie a specifikaci požadované péče."""

* insert SetFmmandStatusRule( 1, draft)

* informaceKZadance 1..1 logKOrderInformationCz
  "A.3.1 - Diagnózy"
  """Diagnózy odůvodňující indikaci FT péče."""

* klinickeZduvodneni 1..1 LogCzClinicalReasonKOrderCz
  "A.3.2 - Klinické zdůvodnění žádosti"
  """Klinické odůvodnění požadavku včetně anamnézy,
nálezu a souvisejících informací."""

* specifickeUdajeFT 1..1 logFTSpecificOrder
  "A.3.3 - Specifické údaje pro FT"
  """Specifické údaje požadované pro FT žádanku."""

* doporuceni 0..1 logRecommendationKOrder
  "A.3.4 - Doporučení"
  """Doporučení dalšího postupu nebo návazné péče."""

* doplnujiciKlinickeUdaje 0..1 logAdditionalClinicalInfoKOrder
  "A.3.5 - Doplňující klinické informace"
  """Další klinicky relevantní informace."""