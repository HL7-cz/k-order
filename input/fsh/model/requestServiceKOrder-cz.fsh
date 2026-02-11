Logical: LogCzRequestedServiceKOrderCz
Id: logRequestedServiceKOrder
Title: "A.2.3 - Požadované vyšetření / výkony"
Description: """Specifikace požadovaných konziliárních vyšetření,
ošetření nebo zdravotních výkonů."""

* typVysetreni 1..1 CodeableConcept "A.2.3.1 - Typ požadovaného vyšetření"
  """Konziliární vyšetření, vyšetření nebo ošetření."""

* slovniPopisVysetreni 1..1 string "A.2.3.2 - Požadované vyšetření slovem"
  """Slovní popis požadovaných zdravotních služeb."""

* vykony 0..* CodeableConcept "A.2.3.3 - Výkony"
  """Seznam kódů požadovaných zdravotních výkonů dle číselníku VZP."""
