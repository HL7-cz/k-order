Logical: LogEnKOrderHeaderCz				
Id: KOrderHeader			
Title: "A.1 Order header data elements"				
Description:  """Order header data elements"""		

* insert SetFmmandStatusRule( 1, draft)	

* subject 1..1 SubjectKOrderCz "A.1.1 - Identification and A.1.2 - related contact information of the Patient/subject" """Identification of the patient/subject and Patient/subject related contact information"""
* payer 1..1 PayerKOrderCz "A.1.3 - Health insurance and payment information - Health insurance information is not always required, however, in some jurisdictions, the insurance number is also used as the patient identifier. It is necessary not just for identification but also forms access to funding for care." """Health insurance and payment information - Health insurance information is not always required, however, in some jurisdictions, the insurance number is also used as the patient identifier. It is necessary not just for identification but also forms access to funding for care."""
* coverage 1..1 CoverageKOrderCz "A.1.4 - Information about coverage - the default value will be the patient's insurance company" """Coverage information - Information about method of coverage, payer identification data and additional information"""
* author 1..* AuthorKOrderCz "A.1.5 - Author (who requested the order). Multiple authors could be provided." """Author (who requested the order). Multiple authors could be provided."""
* requestedPerformer 0..1 RequestedPerformerKOrderCz "A.1.6 - Requested performer" """Requested performer ."""
* additionalRecipient 0..* AdditionalRecipientKOrderCz "A.1.7 - Additional recipient" """Additional recipient of produced order report"""
* documentMetadata 1..1 DocumentMetadataKOrderCz "A.1.8 - Document metadata" """Document metadata"""
* digitalSignature 1..* DigitalSignatureKOrderCz "A.1.9 - Digital signatures" """Digital signatures"""