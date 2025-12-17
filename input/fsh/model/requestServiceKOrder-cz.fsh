Logical: LogCzRequestedServiceKOrderCz
Id: logRequestedServiceKOrder
Title: "A.2.3 - Požadované vyšetření / výkony"
Description: """Specifikace požadovaných konziliárních vyšetření,
ošetření nebo zdravotních výkonů."""

* typVysetreni 1..1 CodeableConcept "Typ požadovaného vyšetření"
  """Konziliární vyšetření, vyšetření nebo ošetření."""

* slovniPopisVysetreni 1..1 string "Požadované vyšetření slovem"
  """Slovní popis požadovaných zdravotních služeb."""

* vykony 0..* CodeableConcept "Výkony"
  """Seznam kódů požadovaných zdravotních výkonů dle číselníku VZP."""
