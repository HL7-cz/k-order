Logical: LogCzRecommendationKOrderCz
Id: logRecommendationKOrder
Title: "A.2.4 - Doporučení"
Description: """Doporučení dalšího postupu, převzetí do péče
nebo hospitalizace."""

* doporuceniKam 0..1 CodeableConcept "Doporučeno (kam)"
  """Převzetí do péče nebo hospitalizace."""

* doporuceniSlovem 0..1 string "Doporučení slovem"
  """Slovní doplnění specifikace doporučení."""
