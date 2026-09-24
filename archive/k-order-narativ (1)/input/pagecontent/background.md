### K and FT Order

The paper templates for these two types of eReferral are the **Referral for examination/treatment of type K** and the **Referral for physiotherapy/occupational therapy of type FT**. The current versions of the forms are available on the [VZP – forms for providers](https://www.vzp.cz/poskytovatele/tiskopisy) pages.

Like other healthcare documents, both types use the standards and terminology systems used in the Czech and the European e-health environment. These are in particular HL7 FHIR, SNOMED CT, ICD-10 and national code systems and identifiers, and for the requested procedures also the code systems of the health insurance companies. An overview of the code systems and value sets used is on the [Terminology considerations](terminology-considerations.html) page.

The content requirements for a request for further health services are laid down in `Annex No. 1, Part 2 to Decree No. 444/2024 Coll., on medical records`. As in force on 19 February 2025, a request for further health services contains:

a) the requested health services,
b) the justification of the request,
c) the urgency of the request,
d) data on the most recently established state of health, including those results of laboratory and other supporting examinations that are essential for the provision of the requested health services,
e) data on the treatment provided so far and the response of the patient to it,
f) the working diagnosis,
g) the essential anamnestic data related to the requested health services.

This implementation guide translates these legislative requirements into an interoperable electronic form based on the HL7 FHIR R4 standard. Which elements of the logical model satisfy the individual requirements is stated in the Special Functional Specification of the given type, that is in Funkční specifikace eŽádanky K and in Funkční specifikace eŽádanky FT.
