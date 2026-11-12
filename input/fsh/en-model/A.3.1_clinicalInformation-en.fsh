Logical: LMEnOrderClinicalInformationCz
Id: LMEnClinicalInformationCz
Title: "A.3.1 - Clinical information / supporting information"
Description: """Information and data communicated to the performing site that may affect execution of the order or interpretation of the results."""

* ^version = "1.0.0"

* insert SetFmmandStatusRule( 2, trial-use )

* biometricData 0..1 Base "A.3.1.1 - Biometric data" """Biometric data relevant to execution of the order."""
* biometricData.weight 0..1 Base "A.3.1.1.1 - Weight" """Patient's body weight."""
* biometricData.weight.value 1..1 Quantity "A.3.1.1.1.1 - Weight value" """Weight value including the unit."""
* biometricData.weight.code 1..1 CodeableConcept "A.3.1.1.1.2 - Weight code" """Code identifying the meaning of the weight data item."""
* biometricData.weight.dateTime 1..1 dateTime "A.3.1.1.1.3 - Weight date and time" """Date and time when the weight was determined."""
* biometricData.height 0..1 Base "A.3.1.1.2 - Height" """Patient's body height."""
* biometricData.height.value 1..1 Quantity "A.3.1.1.2.1 - Height value" """Height value including the unit."""
* biometricData.height.code 1..1 CodeableConcept "A.3.1.1.2.2 - Height code" """Code identifying the meaning of the height data item."""
* biometricData.height.dateTime 1..1 dateTime "A.3.1.1.2.3 - Height date and time" """Date and time when the height was determined."""

* otherClinicalInformation 0..1 Base "A.3.1.2 - Other relevant clinical information" """Other clinical information relevant to performing the order or interpreting the results. This includes, among other things, secondary diagnoses."""
* otherClinicalInformation.code 0..* CodeableConcept "A.3.1.2.1 - Information code (secondary diagnosis)" """Diagnoses and other clinical information important for performing the order or interpreting the results."""
* otherClinicalInformation.text 0..1 string "A.3.1.2.2 - Information text" """Textual description of other relevant clinical information."""

* medication 0..* Base "A.3.1.3 - Medication" """Information on medication affecting the course or outcome of the examination or care."""
* medication.identifier 0..* Identifier "A.3.1.3.1 - Medication ID" """Medication identifier."""
* medication.code 0..* CodeableConcept "A.3.1.3.2 - Medication code" """Medication code."""
* medication.quantity 0..1 Ratio "A.3.1.3.3 - Quantity" """Quantity or dose of the medication."""

* implant 0..* Base "A.3.1.4 - Implant" """List of implants or devices affecting execution of the order or interpretation of the results."""
* implant.type 1..1 CodeableConcept "A.3.1.4.1 - Implant type" """Type of implant."""
* implant.identifier 0..* Identifier "A.3.1.4.2 - Implant ID" """Normalised implant identifier, e.g. UDI."""
* implant.model 1..1 string "A.3.1.4.3 - Specific model" """Specific model of the implant."""
* implant.bodySite 0..* CodeableConcept "A.3.1.4.4 - Body site" """Body site where the implant is located."""

* urgentInformation 0..1 Base "A.3.1.5 - Urgent information" """Urgent information important for carrying out the order."""
* urgentInformation.allergyIntolerance 1..* CodeableConcept "A.3.1.5.1 - Allergies and intolerances" """Allergies and intolerances important for carrying out the order or interpreting the results."""
* urgentInformation.warning 0..* string "A.3.1.5.2 - Warnings" """Warnings and alerts affecting execution of the order or interpretation of the results."""

* mobilityLimitation 0..1 Base "A.3.1.6 - Patient mobility limitation" """Structured information about the patient's mobility limitation."""
* mobilityLimitation.dateTime 1..1 dateTime "A.3.1.6.1 - Information date and time" """Date and time when the mobility information was determined."""
* mobilityLimitation.code 1..1 CodeableConcept "A.3.1.6.2 - Information code" """Code of the type of mobility assessed."""
* mobilityLimitation.value 1..1 CodeableConcept "A.3.1.6.3 - Information value" """Value of the patient's mobility assessment."""
* vaccination 0..* CodeableConcept "A.3.1.7 - Vaccination" """Information about vaccinations, if relevant."""

* additionalFormalizedData 0..* Base "A.3.1.8 - Other formalized data" """Other formalized data communicated to the performing site."""
* additionalFormalizedData.dateTime 1..1 dateTime "A.3.1.8.1 - Date" """Date when the data item was determined."""
* additionalFormalizedData.code 1..1 CodeableConcept "A.3.1.8.2 - Code" """Observation code identifying the meaning of the data item."""
* additionalFormalizedData.value 0..1 Narrative "A.3.1.8.3 - Value" """Value of the data item including the unit of measurement."""
