Logical: LogEnPayerOrderKOrderCz
Id: PayerKOrderCz
Title: "A.1.3 - Health insurance and payment information"
Description: """Health insurance and payment information - Health insurance information is not always required, however, in some jurisdictions, the insurance number is also used as the patient identifier. It is necessary not just for identification but also forms access to funding for care."""

* insert SetFmmandStatusRule ( 1, draft )

* insuranceCode 0..1 Identifier "A.1.3.1 - Health insurance code" """Unique health insurance company identification code."""
* insuranceName 0..1 string "A.1.3.2 - Health insurance name" """Full, official name of the healthcare insurance provider."""
* insuranceNumber 0..1 Identifier "A.1.3.3 - Health insurance number" """Number or code under which the insured person is registered at the insurance provider."""
