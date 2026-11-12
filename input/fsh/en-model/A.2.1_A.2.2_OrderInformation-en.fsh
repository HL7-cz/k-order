Logical: LMEnOrderInformationCz
Id: LMEnOrderInformationCz
Title: "A.2.1 - Order information and A.2.2 - Order reason"
Description:  """Order information and the reason for the examination (order reason)."""

* ^version = "1.0.0"

* insert SetFmmandStatusRule( 2, trial-use )

* orderDetails 0..* Base "A.2.1 - Order information" """Order information"""
* orderDetails.identifier 0..* Identifier "A.2.1.1 - Order ID" """Identifier of the examination order."""
* orderDetails.dateTime 1..1 dateTime "A.2.1.2 - Order date and time" """Date and time when the order was placed."""
* orderDetails.requestedDateTime 0..1 dateTime "A.2.1.3 - Requested date and time of execution" """Requested date and time of execution."""
* orderDetails.urgency 0..1 CodeableConcept "A.2.1.4 - Order urgency" """Urgency of the order (routine, urgent, stat).
- Preferred system: HL7:RequestPriority"""
* orderDetails.orderText 0..1 string "A.2.1.5 - Order text" """Textual description of the order or additional requirements specific to each type of order, if they cannot be expressed in a formalized way."""
* orderDetails.patientInstructions 0..1 string "A.2.1.6 - Information for the patient" """Patient instructions related to the order, e.g. fasting."""

* orderReason 1..1 Base "A.2.2 - Order reason (reason for examination)" """Reason for the examination (order reason)"""
* orderReason.problem 1..* CodeableConcept "A.2.2.1 - Description of problem / diagnosis / condition – indication diagnosis" """Reason for issuing the examination order expressed as structured text and/or a code.
- Preferred system: ICD-10
- Preferred system: Orphacode"""
* orderReason.clinicalQuestionCode 0..* CodeableConcept "A.2.2.2 - Clinical question, coded" """Coded information from A.2.2.3, if provided.
- Preferred system: SNOMED CT"""
* orderReason.clinicalQuestionText 1..1 string "A.2.2.3 - Clinical question, text" """Clinical question that the requested examination or care is expected to answer. It is mapped to the clinical section text; if it describes a clinical problem represented as a Condition, also to CZ_ClinicalQuestion.code.text."""
* orderReason.reasonCode 0..* CodeableConcept "A.2.2.4 - Order reason, coded" """Coded information from A.2.2.5, if provided.
- Preferred system: SNOMED CT – clinical findings (condition-code value set)"""
* orderReason.reasonText 0..1 string "A.2.2.5 - Order reason, text" """Reason for issuing the examination order expressed as free text (e.g. \"cough persisting for 3 weeks\")."""
