Logical: LogEnAdditionalRecipientKOrderCz
Id: AdditionalRecipientKOrderCz
Title: "A.1.7 - Additional Recipient"
Description: """Additional Recipient (Additional recipients of the finding in addition to the author)"""

* insert SetFmmandStatusRule ( 1, draft )

* identifier 1..* Identifier "A.1.7.1 - Additional Recipient identifier" """The health professional identification number. Either an internal identifier assigned by a healthcare provider institution or (preferably) a national health professional ID such as the licence or registration number. Multiple identifiers could be provided."""
* name 1..1 HumanName "A.1.7.2 - Additional Recipient name" """Person name [the structure of the name will be the same as for the patient (given name, family name / surname)]."""
* organizationID 0..* Identifier "A.1.7.3 - Additional Recipient organisation ID" """The healthcare provider organisation identifier. Identifier that is unique within a defined scope. Example: National healthcare provider ID. Multiple identifiers could be provided."""
* organization 1..1 Base "A.1.7.4 - Additional Recipient organisation" """The healthcare provider organisation information."""

