Logical: LMEnCoverageBodyCz
Id: LMEnCoverageBodyCz
Title: "A.2.4 - Coverage"
Description: """Information about the payment method for the requested examination."""

* insert SetFmmandStatusRule ( 1, draft )

* paymentMethod 1..1 CodeableConcept "A.2.4.1 - Payment method" """Method of payment for the order (health insurance, paid by the patient, other)."""
* payerInformation 0..1 Base "A.2.4.2 - Payer information" """Payer identification data and additional information when reimbursement is not covered by health insurance."""
* payerInformation.name 0..1 HumanName "A.2.4.2.1 - Payer name" """Given name and family name of the payer."""
* payerInformation.organizationID 0..* Identifier "A.2.4.2.2 - Payer organization ID" """Identifier of the payer organization."""
* payerInformation.organization 0..1 Base "A.2.4.2.3 - Payer organization" """Payer organization."""
* payerInformation.address 0..1 Address "A.2.4.2.4 - Address" """Payer address."""
* payerInformation.country 1..1 CodeableConcept "A.2.4.2.5 - Country" """Country from which payment is provided."""
* payerInformation.telecom 0..* ContactPoint "A.2.4.2.6 - Telecom" """Telecommunication contact for the payer."""
* comment 0..1 string "A.2.4.3 - Comment" """Optional payment clarification."""


