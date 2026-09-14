Logical: LMEnOrderClinicalInformationCz
Id: LMEnClinicalInformationCz
Title: "A.3.1 - Clinical Information (Medical History)"
Description: """Information and data communicated to the performing site that may affect execution of the order or interpretation of the results."""

* insert SetFmmandStatusRule( 1, draft)

* clinicalInformationText 0..1 string "A.3.1.1 - Clinical information in free text" """Clinical information necessary for correct execution of the order or interpretation of the results."""
* clinicalInformationCode 0..1 CodeableConcept "A.3.1.2 - Clinical information (medical history), formalized" """Formalized clinical information (medical history)."""
* description 0..* CodeableConcept "A.3.1.3 - Description of problem / diagnosis / condition" """Diagnoses and other clinical information affecting the course or outcome of the examination.
- Preferred systems: ICD-10
- Preferred systems: Orphacode"""
* medication 0..* Base "A.3.1.4 - Medication" """Medication block containing information on medication affecting the course or outcome of the examination or its interpretation.
- Preferred systems: DLP
- Preferred systems: ATC"""
* medication.id 0..* Identifier "A.3.1.4.1 - Medication ID" """Medication ID."""
* medication.code 0..* code "A.3.1.4.2 - Medication code" """Medication code."""
* medication.quantity 0..1 Ratio "A.3.1.4.3 - Quantity" """Medication quantity."""
* vaccination 0..* CodeableConcept "A.3.1.5 - Vaccination" """Vaccination."""
/
* additionalData 0..1 Base "A.3.1.6 - Additional formalized data" """"""
* additionalData.date 0..1 dateTime "A.3.1.6.1 - Date" """Date when the data was determined; provided if different from the order issue date."""
* additionalData.code 1..1 CodeableConcept "A.3.1.6.2 - Code" """Observation code identifying the meaning of the data item (height, weight, week of pregnancy, etc.).
- Preferred systems: NCLP
- Preferred systems: SNOMED CT"""
* additionalData.value 0..1 Narrative "A.3.1.6.3 - Value" """Value of the data item including measurement unit."""
