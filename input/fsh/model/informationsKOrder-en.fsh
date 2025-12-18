Logical: LogEnKOrderInformationCz				
Id: logKOrderInformation
Title: "A.2.1 - Order information and A.2.2 - Order reason"				
Description:  """Information about order and order reason"""		

* insert SetFmmandStatusRule( 1, draft)	

* orderDetails 0..* Base "A.2.1 - Order information" """Order information could respond to multiple test orders """				
* orderDetails.identifier 1..* Identifier "A.2.1.1 - Order Id" """An identifier of the K-order."""				
* orderDetails.dateTime 1..1 dateTime "A.2.1.2 - Order date and time" """Date and time of the order placement."""		 		
* orderDetails.requestedExecdateTime 0..1 dateTime "A.2.1.3 - Date and time of requested execution" """Date and time of requested execution"""				
* orderDetails.urgency 0..1 CodeableConcept "A.2.1.4 - Urgency of the order" """Urgency of the order (routine, urgent, statim). Preferred system(s): HL7:RequestPriority"""				
* orderDetails.orderText 0..1 string "A.2.1.5 - Order text" """A textual description of the order or additional requirements, specific to each type of order, if they cannot be expressed formally."""				
* orderDetails.infoForPatient 0..1 string "A.2.1.6 - Information for the patient" """Patient instructions related to the order. E.g. fasting collection, etc."""	

* diagnoses 1..* Base "A.2.2 – Diagnoses" """Reason of imaging order"""				
* diagnoses.primaryDiagnosis 1..1 CodeableConcept "A.2.2.1 - Primary diagnosis"
  """Primary diagnosis justifying the request according to ICD-10 (UZIS)."""
* diagnoses.secondaryDiagnoses 0..* CodeableConcept "A.2.2.2 - Secondary diagnoses"
  """Additional relevant patient diagnoses according to ICD-10 (UZIS)."""
* reimbursementCode 0..1 CodeableConcept "A.2.3 - Reimbursement code"
  """Code of reimbursement type or program according to the VZP reimbursement code list."""
