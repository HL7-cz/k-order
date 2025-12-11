Logical: LogEnAuthorKOrderCz
Id: AuthorKOrderCz
Title: "A.1.5 - Author"
Description: """Author (by whom the Lab order was/were authored). Multiple authors could be provided."""

* insert SetFmmandStatusRule ( 1, draft )

* identifier 1..* Identifier "A.1.5.1 - Author identifier" """The health professional identifier that will allow addressing recipients within a national or international data exchange infrastructure, such as the licence or registration number. In case when the recipient is not a health professional, e.g. patient, appropriate personal identifier should be used."""
* name 1..1 HumanName "A.1.5.2 - Author name" """Person name [the structure of the name will be the same as for the patient (given name, family name / surname)]."""
* address 0..* Base "A.1.5.3 - Author's address" """Contact details of the person placing the order (address and telecommunication details)."""
* organization 1..1 Base "A.1.5.4 - Author organisation" """The healthcare provider organisation information."""

