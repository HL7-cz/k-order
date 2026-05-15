Logical: LMEnPayerOrderCz
Id: LMEnPayerOrderCz
Title: "A.1.3 - Health coverage and payment information"
Description: """Health coverage and payment information - Health coverage information is not always required, however, in some jurisdictions, the coverage number is also used as the patient identifier. It is necessary not just for identification but also forms access to funding for care."""

* insert SetFmmandStatusRule ( 1, draft )

* coverageCode 0..1 Identifier "A.1.3.1 - Health coverage code" """Unique health coverage company identification code."""
* coverageName 0..1 string "A.1.3.2 - Health coverage name" """Full, official name of the healthcare coverage provider."""
* coverageNumber 0..1 Identifier "A.1.3.3 - Health coverage number" """Number or code under which the insured person is registered at the coverage provider."""


