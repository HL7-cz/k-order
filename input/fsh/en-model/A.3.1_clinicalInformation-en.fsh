Logical: LMEnOrderClinicalInformationCz
Id: LMEnClinicalInformationCz
Title: "A.3.1 - Clinical information / supporting information"
Description: """Information and data communicated to the performing site that affect execution of the order or interpretation of the results."""

* insert SetFmmandStatusRule( 1, draft)

* biometricData 0..1 Base "A.3.1.1 - Biometric data" """Biometric data relevant for execution of the order."""
* biometricData.weight 0..1 Base "A.3.1.1.1 - Weight" """Information on the patient's body weight."""
* biometricData.weight.value 1..1 Quantity "A.3.1.1.1.1 - Weight value" """Weight value including the unit."""
* biometricData.weight.code 1..1 CodeableConcept "A.3.1.1.1.2 - Weight code" """Code specifying the meaning of the weight data item."""
* biometricData.weight.dateTime 0..1 dateTime "A.3.1.1.1.3 - Weight date and time" """Date and time when the weight was recorded, if different from the order date."""
* biometricData.height 0..1 Base "A.3.1.1.2 - Height" """Information on the patient's body height."""
* biometricData.height.value 1..1 Quantity "A.3.1.1.2.1 - Height value" """Height value including the unit."""
* biometricData.height.code 1..1 CodeableConcept "A.3.1.1.2.2 - Height code" """Code specifying the meaning of the height data item."""
* biometricData.height.dateTime 0..1 dateTime "A.3.1.1.2.3 - Height date and time" """Date and time when the height was recorded, if different from the order date."""

* otherRelevantClinicalInformation 0..1 Base "A.3.1.2 - Other relevant clinical information" """Additional clinical information relevant for execution of the order or interpretation of the results."""
* otherRelevantClinicalInformation.code 0..* CodeableConcept "A.3.1.2.1 - Information code / other diagnosis" """Diagnoses and other coded clinical information important for execution of the order or interpretation of the results."""
* otherRelevantClinicalInformation.text 0..1 string "A.3.1.2.2 - Information text" """Textual description of other relevant clinical information."""

* medication 0..* Base "A.3.1.3 - Medication" """Information about medication affecting the course or result of the examination or care."""
* medication.identifier 0..* Identifier "A.3.1.3.1 - Medication ID" """Medication identifier."""
* medication.code 0..* code "A.3.1.3.2 - Medication code" """Medication code."""
* medication.quantity 0..1 Ratio "A.3.1.3.3 - Quantity" """Quantity or dose of medication."""

* implant 0..* Base "A.3.1.4 - Implant" """List of implants or devices affecting execution of the order or interpretation of the results."""
* implant.type 1..1 CodeableConcept "A.3.1.4.1 - Implant type" """Type of implant."""
* implant.identifier 0..* Identifier "A.3.1.4.2 - Implant ID" """Normalized implant identifier, e.g. UDI."""
* implant.model 1..1 string "A.3.1.4.3 - Specific model" """Specific implant model."""
* implant.bodyPart 0..* CodeableConcept "A.3.1.4.4 - Body part" """Body part where the implant is located."""

* urgentInformation 0..1 Base "A.3.1.5 - Urgent information" """Urgent information important for execution of the order."""
* urgentInformation.allergiesAndIntolerances 1..* CodeableConcept "A.3.1.5.1 - Allergies and intolerances" """Allergies and intolerances important for execution of the order or interpretation of the results."""
* urgentInformation.warnings 0..* string "A.3.1.5.2 - Warnings" """Warnings and alerts affecting execution of the order or interpretation of the results."""

* limitationOfPatientMobility 0..1 string "A.3.1.6 - Limitation of patient mobility" """Description of the patient's mobility limitation."""

* clinicalInformationText 0..1 string "A.3.1.7 - Clinical information in free text" """Clinical information necessary for correct execution of the order or interpretation of the results."""
* clinicalInformationCode 0..1 CodeableConcept "A.3.1.8 - Formalized clinical information" """Clinical information expressed in a formalized way."""
* descriptionOfProblemDiagnosisCondition 0..* CodeableConcept "A.3.1.9 - Description of problem / diagnosis / condition" """Diagnoses and other clinical information affecting the course or result of the examination."""
* physicalFinding 0..* CodeableConcept "A.3.1.10 - Physical finding" """Physical findings relevant to the order."""
* hospitalizationDate 0..* dateTime "A.3.1.11 - Date of hospitalization" """Date of patient hospitalization, if relevant."""
* vaccination 0..* CodeableConcept "A.3.1.12 - Vaccination" """Vaccination information, if relevant."""

* additionalFormalizedData 0..* Base "A.3.1.13 - Additional formalized data" """Additional formalized data communicated to the performing site."""
* additionalFormalizedData.dateTime 0..1 dateTime "A.3.1.13.1 - Date" """Date and time when the data item was identified, if different from the order issue date."""
* additionalFormalizedData.code 1..1 CodeableConcept "A.3.1.13.2 - Code" """Observation code identifying the meaning of the data item."""
* additionalFormalizedData.value 0..1 Narrative "A.3.1.13.3 - Value" """Data value including the measurement unit."""
