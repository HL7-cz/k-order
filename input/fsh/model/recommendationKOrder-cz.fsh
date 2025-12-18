Logical: LogCzRecommendationKOrderCz
Id: logRecommendationKOrder
Title: "A.2.4 - Doporučení"
Description: """Doporučení dalšího postupu, převzetí do péče
nebo hospitalizace."""

* doporuceniKam 0..1 CodeableConcept "A.2.4.1 - Doporučeno (kam)"
  """Převzetí do péče nebo hospitalizace."""

* doporuceniSlovem 0..1 string "A.2.4.2 - Doporučení slovem"
  """Slovní doplnění specifikace doporučení."""
