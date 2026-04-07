Logical: LogEnCoverageKOrderCz
Id: CoverageKOrderCz
Title: "A.1.4 - Information about coverage"
Description: """Coverage information - Information about method of coverage, payer identification data and additional information"""

* insert SetFmmandStatusRule ( 1, draft )

* method 1..1 CodeableConcept "A.1.4.1 - Method of coverage" """Method of payment for the order (health insurance, paid by the patient, other)"""
* informationPayor 0..1 Base "A.1.4.2 - Information about payor" """Payer identification data and additional information regarding reimbursement other than from health insurance. Identification data includes the identifier, name of the organization or name of the payer, address of the payer and telecommunications connection."""
* informationPayor.name 0..1 HumanName "A.1.4.2.1 - Payor name" """Person name [the structure of the name will be the same as for the patient (given name, family name / surname)]."""
* informationPayor.organizationID 0..* Identifier "A.1.4.2.2 - Payor organisation ID" """The healthcare provider organisation identifier. Identifier that is unique within a defined scope. Example: National healthcare provider ID. Multiple identifiers could be provided."""
* informationPayor.organization 0..1 Base "A.1.4.2.3 - Payor organisation" """The healthcare provider organisation information."""
* informationPayor.address 0..1 Address "A.1.4.2.4 - Address" """Mailing and home or office addresses. The addresses are always sequences of address parts (e.g. street address line, country, postcode, city) even if postal address formats may vary depending on the country. An address may or may not include a specific use code; if this attribute is not present it is assumed to be the default address useful for any purpose."""
* informationPayor.country 1..1 CodeableConcept "A.1.4.2.5 - Country" """Country of the intended recipient as part of the address."""
* informationPayor.telecom 0..* ContactPoint "A.1.4.2.6 - Telecom" """Telecommunication contact information (addresses) associated to a person, such as phone number, email, or messaging service. Multiple telecommunication addresses might be provided."""



