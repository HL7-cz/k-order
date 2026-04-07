Logical: LogEnRecommendationKOrder
Id: logEnRecommendationKOrder
Title: "A.2.4 – Recommendation"
Description: """Recommendation of further management, transfer of care,
or hospitalization."""

* recommendedDestination 0..1 CodeableConcept
  "A.2.4.1 - Recommended destination"
  """Transfer of care or hospitalization."""

* recommendationText 0..1 string
  "A.2.4.2 - Recommendation (text)"
  """Textual specification and additional details of the recommendation."""
