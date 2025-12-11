Logical: LogEnRequestedPerformerKOrderCz
Id: RequestedPerformerKOrderCz
Title: "A.1.6 - Requested Performer (processing person)"
Description: """Person who is requested to process document."""

* insert SetFmmandStatusRule ( 1, draft )

* identifier 1..* Identifier "A.1.6.1 -Requested Performer identifier" """The health professional identification number. Either an internal identifier assigned by a healthcare provider institution or (preferably) a national health professional ID such as the licence or registration number."""
* name 1..1 HumanName "A.1.6.2 - Requested Performer name" """Person name [the structure of the name will be the same as for the patient (given name, family name / surname)]."""
* organizationID 0..* Identifier "A.1.6.3 - Requested Performer organisation ID" """The healthcare provider organisation identifier. Identifier that is unique within a defined scope. Example: National healthcare provider ID. Multiple identifiers could be provided."""
* organization 1..1 Base "A.1.6.4 - Requested Performer organisation" """The healthcare provider organisation information."""
