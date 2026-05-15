Logical: LMEnBodyKOrderCz
Id: LMEnBodyKOrder
Title: "A.2 A.3“ Document Body"
Description: """Body of the K-order document containing clinical data, diagnoses,
clinical reasons for the request, and specification of requested orderInformation
and procedures."""

* orderInformation 0..1 LMEnOrderInformationCz "A.2.1 - Order and A.2.2 order reason"
* clinicalEvent 0..1 LMEnClinicalEventCz "A.2.3 - Clinical Event" """Information about the clinical event to which the order relates"""
* coverage 1..* LMEnCoverageBodyCz "A.2.4 - Coverage" """Coverage information - Information about method of coverage, payer identification data and additional information"""
* appointment 0..1 LMEnAppointmentCz "A.2.5 - Appointment" """Information about planned care order related to this request form"""


//specific elements
* supportingInformation 1..1 LMEnClinicalInformationCz "A.3.1 - Supporting clinical information" """
Information and data provided by the performing organization that impact the execution of the examination or the interpretation of the examination results.
"""
* orderDataElements 1..1 LMEnKOrderDataElementsCz "A.3.2 - Order data elements" """Information about Required orderInformation (service request)"""
