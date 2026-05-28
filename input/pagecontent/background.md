### K and FT Order

The electronic documents of the K-Order and FT-Order types are specialized request documents designed for the exchange of information between healthcare providers within diagnostic and therapeutic processes.

Both documents are based on a common logical model of request forms defined in this implementation guide. They share common administrative, identification, and workflow components and differ primarily in the specific “body” section, which contains specialized data elements representing the actual requested healthcare services.

The Type K referral is intended primarily for requests for complementary examinations. The FT-Request is intended primarily for requests related to physical therapy and rehabilitation care. Both documents adhere to a unified principle of healthcare documentation representation and enable interoperable electronic data exchange.

In the field of healthcare information systems, the goal is to unify the method of representing request documents across various specialized domains and to create a common foundation for the future expansion of other types of electronic requests.

Like other healthcare documents, the K-Request and FT-Request utilize standards and terminological systems used in both the Czech and European e-health environments. These include, in particular:
- HL7 FHIR,
- SNOMED CT,
- ICD-10,
- national codes and identifiers,
- and, where applicable, other field-specific terminology.
  
The paper template for electronic requests is the Type K Examination/Treatment Voucher form and related forms used in the Czech healthcare system. The current versions of these forms are available on the [VZP – Forms for Providers](https://www.vzp.cz/poskytovatele/tiskopisy) website. 

As of February 19, 2025, requests for additional healthcare services include, in particular:
- the requested healthcare services,
- justification for the request,
- urgency of the request,
- information on the patient’s most recent health status, including relevant examination results,
- information on previous treatment and the patient’s response,
- working diagnosis,
- essential medical history data related to the requested healthcare services.

This implementation guide translates the aforementioned legislative requirements into an interoperable electronic format based on the HL7 FHIR R4 standard.