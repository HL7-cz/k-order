Logical: LogKOrderEn
Id: LogKOrderEn
Title: "K-order (Referral Form) – Logical Model (CZ)"
Description: """
Logical model for the national implementation guide of K-order (referral form) in the Czech Republic.
The model represents structured data for requesting medical services or consultation requests, 
aligned with CZ Core FHIR profiles and national code systems.
"""

* kOrder 1..1 Base "K-order Referral" """Record of a medical referral or request for healthcare service, 
used for communication between hospital, or outpatient systems within the Czech eHealth ecosystem."""

  * orderIdentifier 1..1 Identifier "K-order Identifier" """System-generated unique identifier (UUID) for the referral form."""
  * authoredOn 1..1 dateTime "Date and Time of Creation" """Date and time when the referral was created and authorized (ISO 8601 format)."""
  * status 1..1 code "Order Status" """Current status of the referral in its lifecycle (draft, active, completed, cancelled)."""
  * category 1..1 CodeableConcept "Order Category" """Type of referral according to the national code list (e.g., Poukaz K)."""
  * priority 0..1 code "Request Priority" """Level of urgency (routine, urgent, statim)."""

  * patient 1..1 Base "Patient Identification" """Information about the patient for whom the referral is issued."""
    * givenName 1..1 string "Given Name" """Patient's given name(s)."""
    * familyName 1..1 string "Family Name" """Patient's family name."""
    * birthDate 1..1 date "Date of Birth" """Patient's date of birth (YYYY-MM-DD)."""
    * patientIdentifier 1..1 Identifier "Patient Identifier" """RID, RCIS, or another national/international identifier."""
    * citizenship 0..1 CodeableConcept "Citizenship" """Patient’s citizenship (ISO 3166-1 alpha-2)."""
    * gender 0..1 code "Administrative Gender" """Patient's administrative gender (HL7 administrativeGender)."""
    * language 0..1 code "Communication Language" """Preferred patient language (ISO 639-1)."""
    * contactInfo 0..* Base "Patient Contact Information" """Address, email and telephone contacts of the patient."""
      * address 0..1 Address "Patient Address" """Permanent or correspondence address."""
      * email 0..1 string "Email" """Patient’s contact email."""
      * phone 0..1 string "Phone" """Patient’s contact phone number."""
    * legalGuardian 0..* Base "Legal Guardian or Contact" """Persons authorized to act on behalf of or contact the patient."""
      * contactType 0..1 CodeableConcept "Contact Type" """Type of contact (guardian, emergency contact, other)."""
      * relationship 0..1 CodeableConcept "Relationship to Patient" """Relationship between the contact person and patient (e.g., father, mother, guardian)."""
      * contactIdentifier 0..1 Identifier "Contact Person Identifier" """Unique identifier of the contact person."""
      * givenName 0..1 string "Contact Person Given Name" """Contact person’s given name."""
      * familyName 0..1 string "Contact Person Family Name" """Contact person’s family name."""
      * address 0..1 Address "Contact Address" """Contact person’s address."""
      * telecom 0..* ContactPoint "Contact Telecom" """Email, phone or other telecom contact."""

  * insurance 1..1 Base "Health Insurance" """Information about the patient's insurance and payment."""
    * payerCode 1..1 CodeableConcept "Insurance Company Code" """Code of the health insurance company (VZP list, OID 1.2.203.7898.1.1)."""
    * payerName 0..1 string "Insurance Company Name" """Name of the health insurance company."""
    * insuredNumber 1..1 string "Insurance Number" """Patient’s insurance number (usually national ID without slash)."""
    * paymentType 0..1 CodeableConcept "Payment Type" """Type of payment or reimbursement (VZP Reimbursement list)."""

  * requester 1..1 Base "Requester (Referring Practitioner/Facility)" """Information about the healthcare provider issuing the referral."""
    * icp 1..1 Identifier "ICP of Requester" """Identifier of the requesting facility (OID 1.2.203.7898.1.3)."""
    * ico 0..1 Identifier "ICO of Requester Organization" """Identifier of the healthcare provider (ICO)."""
    * organizationName 1..1 string "Requester Organization Name" """Official name of the requesting facility."""
    * specialty 1..1 CodeableConcept "Requester Specialty" """Specialty code according to national list (OID 1.2.203.7898.1.4)."""
    * practitionerId 1..1 Identifier "Requester Practitioner ID" """Practitioner identifier according to payer registry."""
    * practitionerName 1..1 string "Requester Practitioner Name" """Full name of the requesting practitioner."""

  * performer 0..1 Base "Performer (Recipient)" """Target facility or laboratory receiving the referral."""
    * icpPerformer 0..1 Identifier "Performer ICP" """Identifier of the performer facility."""
    * icoPerformer 0..1 Identifier "Performer ICO" """ICO of the recipient healthcare organization."""
    * performerName 0..1 string "Performer Name" """Name of the performer organization."""
    * performerSpecialty 0..1 CodeableConcept "Performer Specialty" """Specialty of the target facility or department."""

  * diagnoses 1..* Base "Diagnoses" """Clinical diagnoses justifying the referral request."""
    * primaryDiagnosis 1..1 CodeableConcept "Primary Diagnosis" """Main diagnosis coded in ICD-10-CZ."""
    * secondaryDiagnoses 0..* CodeableConcept "Secondary Diagnoses" """Additional diagnoses coded in ICD-10-CZ."""

  * justification 0..1 string "Clinical Justification" """Clinical reasoning for the request (anamnesis, objective findings)."""

  * requestedServices 1..* Base "Requested Services or Procedures" """List of requested medical procedures or examinations."""
    * textDescription 1..1 string "Requested Service Description" """Verbal description of the requested examination or service."""
    * procedureCode 0..* CodeableConcept "Procedure Code" """Procedure code according to VZP performance list."""
    * recommendation 0..1 string "Recommendation Text" """Additional recommendation or comment (e.g., hospitalization)."""

  * attachment 0..* Attachment "Attachments" """Supplementary documentation attached to the referral."""
  * signature 0..1 Base "Electronic Signature" """Electronic signature or seal of the referral document."""
    * author 1..1 string "Author of Signature" """Person or system that signed the referral electronically."""
    * timestamp 0..1 dateTime "Timestamp" """Date and time of the electronic signature."""
