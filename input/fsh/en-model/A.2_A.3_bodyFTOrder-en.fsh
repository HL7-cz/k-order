Logical: LMEnBodyFTOrderCz
Id: LMEnBodyFTOrder
Title: "A.2 - Document Body"
Description: """Body of the FT-order document containing order information,
clinical data, coverage, appointment details, and specification of requested services."""

* orderInformation 0..1 LMEnOrderInformationCz
  "A.2.1 - Order information"
  """Basic information about the request including diagnoses and the reason for the request."""

* clinicalEvent 0..1 LMEnClinicalEventCz
  "A.2.3 - Clinical event"
  """Information about the clinical event related to the request."""

* coverage 1..* LMEnCoverageBodyCz
  "A.2.4 - Coverage"
  """Information about the type of coverage for the healthcare service."""

* appointment 0..1 LMEnAppointmentCz
  "A.2.5 - Appointment"
  """Information about the planned appointment date or patient booking."""

* clinicalInformation 1..1 LMEnClinicalInformationCz
  "A.3.1 - Clinical information"
  """Clinical information related to the request,
such as medical history, findings, examination results,
differential diagnostic considerations, or treatment."""

* dataElements 1..1 LMEnFTOrderDataElementsCz
  "A.3.2 - Order data elements"
  """Structured specification of requested healthcare services,
procedures, and recommendations for further management.
Content corresponds to ServiceRequest.code and ServiceRequest.orderDetail."""
