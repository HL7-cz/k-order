Logical: LogCzBodyKOrderCz
Id: logBodyKOrder
Title: "A.2 - Tělo dokumentu"
Description: """Tělo dokumentu K-žádanky obsahující klinické údaje, diagnózy,
zdůvodnění žádosti a specifikaci požadovaných vyšetření a výkonů."""

* diagnozy 1..1 LogCzDiagnosisKOrderCz
  "A.2.1 - Diagnózy"
  """Diagnózy odůvodňující žádanku na konziliární nebo jinou zdravotní službu."""

* klinickeZduvodneni 1..1 LogCzClinicalReasonKOrderCz
  "A.2.2 - Klinické zdůvodnění žádosti"
  """Klinické odůvodnění požadavku včetně anamnézy,
objektivního nálezu a souvisejících informací."""

* pozadovanaVysetreni 1..* LogCzRequestedServiceKOrderCz
  "A.2.3 - Požadované vyšetření / výkony"
  """Specifikace požadovaných konziliárních vyšetření,
ošetření nebo zdravotních výkonů."""

* doporuceni 0..1 LogCzRecommendationKOrderCz
  "A.2.4 - Doporučení"
  """Doporučení dalšího postupu, převzetí do péče
nebo hospitalizace."""

* doplnujiciKlinickeUdaje 0..1 LogCzAdditionalClinicalInfoKOrderCz
  "A.2.5 - Doplňující klinické informace"
  """Další klinicky relevantní informace vztahující se k žádance."""

