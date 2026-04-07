Logical: LogEnBodyKOrder
Id: logEnBodyKOrder
Title: "A.2 – Document Body"
Description: """Body of the K-order document containing clinical data, diagnoses,
clinical reasons for the request, and specification of requested examinations
and procedures."""

* informationOrder 1..1 logKOrderInformation
  "A.2.1 – Diagnoses"
  """Diagnoses justifying the request for a consultation
or other healthcare service."""

* clinicalReason 1..1 logEnClinicalReasonKOrder
  "A.2.2 – Clinical reason for the request"
  """Clinical justification of the request including medical history,
objective findings, and related clinical information."""

* requestedServices 1..* logEnRequestedServiceKOrder
  "A.2.3 – Requested examinations / procedures"
  """Specification of requested consultation examinations,
treatments, or healthcare procedures."""

* recommendation 0..1 logEnRecommendationKOrder
  "A.2.4 – Recommendation"
  """Recommendation for further management, transfer of care,
or hospitalization."""

* additionalClinicalInformation 0..1 logAdditionalClinicalInfoKOrderCz
  "A.2.5 – Additional clinical information"
  """Additional clinically relevant information related to the request."""
