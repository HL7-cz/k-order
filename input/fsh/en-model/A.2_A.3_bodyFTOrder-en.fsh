Logical: LMEnBodyFTOrderCz
Id: LMEnBodyFTOrder
Title: "A.2 - FT-order document body"
Description: """Body of the FT-order document containing order information,
clinical data, coverage, appointment details, and specification of requested services."""

* ^version = "1.0.0"

* orderInformation 0..1 LMEnOrderInformationCz
  "A.2.1 - Order information"
  """Basic information about the order including diagnoses and the reason for the request."""

* clinicalEvent 0..1 LMEnClinicalEventCz
  "A.2.3 - Clinical event"
  """Information about the clinical event related to the request."""

* coverage 1..* LMEnCoverageBodyCz
  "A.2.4 - Coverage"
  """Information about the type of coverage for the healthcare service."""

* appointment 0..1 LMEnAppointmentCz
  "A.2.5 - Appointment"
  """Information about the planned appointment date or patient booking."""

* specimenInformation 0..* LMEnSpecimenInformationCz
  "A.2.6 - Specimen information"
  """Information about the specimen related to the order."""

* clinicalInformation 1..1 LMEnClinicalInformationCz
  "A.3.1 - Supporting information"
  """Clinical and other supporting information relevant to execution of the order and interpretation of the results."""

* orderDataElements 1..1 LMEnFTOrderDataElementsCz
  "A.3.2 - Order data elements"
  """Structured specification of the requested healthcare services or examinations."""

* plannedCareOrders 0..1 LMEnPlannedCareOrdersCz
  "A.3.3 - References to planned care orders following this order"
  """References to related planned care orders."""

* otherSupportingInformation 0..* LMEnOtherSupportingInformationCz
  "A.3.4 - Other supporting information"
  """References to other supporting information related to the order."""
