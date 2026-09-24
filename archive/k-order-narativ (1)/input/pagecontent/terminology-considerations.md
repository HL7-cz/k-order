{% include variable-definitions.md %}

The following is a list of the code systems and value sets used, organised by terminology source. Every logical model element appears exactly once, in the section of the system that is decisive for it. Where an element also allows another system, that system is named in the Value column as an alternative. Where the value set differs between types K and FT, that is stated with the element.

National value sets are published by {{czTerminology}} and their values are available through the **TermX** terminology server. For the code systems of the health insurance companies the authoritative source is the code system package provided under the contractual relationship, publicly published pages are informative only. Where a national value set exists for an element, it is used in preference to an international one.

### Snomed-CT

| Item code | Item description | Value |
| :--- | :--- | :--- |
| A.2.2.2 | Clinical question, coded | SNOMED CT |
| A.2.2.4 | Order reason, coded | SNOMED CT |
| A.3.1.4.1 | Implant type | SNOMED CT, the value set is determined by the medical device profile in {{czCore}} |
| A.3.1.4.4 | Implant – body part | [body-site](https://hl7.org/fhir/valueset-body-site.html), SNOMED CT Body structure |
| A.3.1.6.2 | Mobility restriction – code of the information | [cz-mobility-type](ValueSet-cz-mobility-type.html) — four codes for the type of the assessed activity: walking, standing up, standing and moving in bed |
| A.3.1.6.3 | Mobility restriction – value of the information | [cz-mobility-value](ValueSet-cz-mobility-value.html) — eight codes of assessment for the types above |
| A.3.1.10 | Physical finding | SNOMED CT, clinical findings |
| A.3.1.12 | Vaccination | SNOMED CT |
| A.3.2.1.1 | Examination code | For type K [korder-procedures-vs](ValueSet-korder-procedures-vs.html), descendants of the concept `11429006` Consultation. For type FT [ft-order-procedures-vs](ValueSet-ft-order-procedures-vs.html), descendants of the concept `91251008` Physical therapy procedure. In both types the binding is `preferred`; the procedures of the health insurance companies are an alternative, see below. |
| A.3.2.1.3 | Body part of the requested care (FT) | SNOMED CT, Body structure |
| — | Request category, `ServiceRequest.category` | For type FT [ft-category-service-request](ValueSet-ft-category-service-request.html) — `91251008` physiotherapy, `84478008` occupational therapy. The category distinguishes the two models of prescription, because in the model with a delegated scope it is the only expression of the requested care. |

The preferred way of expressing the requested care is SNOMED CT; the preference is expressed by the strength of the binding in the profile. For type FT the SNOMED CT concept `91251008` is excluded from the value set of requested procedures, because general physiotherapy is expressed by the request category, not by a procedure.

### ICD-10 / Orphacode

| Item code | Item description | Value |
| :--- | :--- | :--- |
| A.2.2.1 | Problem / diagnosis / condition – indicating diagnosis | [mkn-10](https://uzis.cz/terminology/ValueSet/mkn-10) and [orphanet-rare-diseases](https://ncez.mzcr.cz/terminology/ValueSet/orphanet-rare-diseases), in both types with a `preferred` binding |
| A.3.1.2.1 | Code of the information – secondary diagnosis | [mkn-10](https://uzis.cz/terminology/ValueSet/mkn-10) |

The national value set [condition-cz](https://ncez.mzcr.cz/terminology/ValueSet/condition-cz) combines ICD-10, ORPHA and SNOMED CT clinical findings into a single value set and is usable as a whole for the indicating diagnosis.

### NČLPPOL

| Item code | Item description | Value |
| :--- | :--- | :--- |
| A.3.1.1.1.2 | Weight – code | [nclppol](https://ncez.mzcr.cz/nclp/ValueSet/nclppol) `20042`, alternatively SNOMED CT `27113001` |
| A.3.1.1.2.2 | Height – code | [nclppol](https://ncez.mzcr.cz/nclp/ValueSet/nclppol) `20411`, alternatively SNOMED CT `1153637007` |

### Code systems of the health insurance companies

| Item code | Item description | Value |
| :--- | :--- | :--- |
| A.1.4.3 | Reimbursement indicator | [vzp-nahrady-vs](ValueSet-vzp-nahrady-vs.html) — seven codes of reimbursement for health care, for example an injury caused by another person or an occupational injury |

The procedures of the health insurance companies are an alternative to SNOMED CT for the element `A.3.2.1.1 Examination code`. The guide defines two code systems for them, [korder-vzp-procedures-cs](CodeSystem-korder-vzp-procedures-cs.html) for procedures and [ft-vzp-procedures-cs](CodeSystem-ft-vzp-procedures-cs.html) for physiotherapy procedures. Both are marked as a `fragment` and contain only the demonstration subset of codes used in the examples; the binding source is the code system package of the insurer.

### LOINC

| Item code | Item description | Value |
| :--- | :--- | :--- |
| A.1.8.2 | Document category | [document-category](https://ncez.mzcr.cz/terminology/ValueSet/document-category) |
| — | Order type, `Composition.type` | [referralorder-types](https://ncez.mzcr.cz/terminology/ValueSet/referralorder-types) — for type K the code `57133-1`, for type FT the code `57154-7` |

The element `Composition.type` carries the order type from the national Referral Order Types value set. It is the only element of the header whose value differs between types K and FT. No `A.x` element is defined for the order type in the logical model, which is why the table gives it no number.

### FHIR

| Item code | Item description | Value |
| :--- | :--- | :--- |
| A.1.1.6 | Citizenship | [v3-Country2](https://terminology.hl7.org/ValueSet-v3-Country2.html) |
| A.1.1.7 | Gender | [administrative-gender-cz](https://ncez.mzcr.cz/terminology/ValueSet/administrative-gender-cz) |
| A.1.1.9 | Communication language | [all-languages](https://hl7.org/fhir/valueset-all-languages.html) |
| A.1.2.1 | Address – country | [v3-Country2](https://terminology.hl7.org/ValueSet-v3-Country2.html) |
| A.1.2.4.1 | Contact type | [contactrole-cz](https://ncez.mzcr.cz/terminology/ValueSet/contactrole-cz) |
| A.1.4.1 | Coverage kind | [cz-coverage-type](https://ncez.mzcr.cz/terminology/ValueSet/cz-coverage-type) — `HIP` health insurance, `pay` self-payer |
| A.1.8.3 | Document status | [composition-status](https://hl7.org/fhir/valueset-composition-status.html) — `preliminary`, `final`, `amended`, `entered-in-error`. The element maps to `Composition.status`, where the binding is required already in the base resource and the profile does not narrow it. |
| A.1.8.7 | Document confidentiality | [v3-Confidentiality](https://terminology.hl7.org/ValueSet-v3-Confidentiality.html) |
| A.1.8.8 | Document language | [all-languages](https://hl7.org/fhir/valueset-all-languages.html) |
| A.2.1.4 | Order urgency | [request-priority](https://hl7.org/fhir/valueset-request-priority.html) — `routine`, `urgent`, `asap`, `stat`. The guide defines the value set [korder-priority-vs](ValueSet-korder-priority-vs.html) for it, with Czech names of the values. |
| A.2.4.1 | Coverage kind in the body of the document | [cz-coverage-type](https://ncez.mzcr.cz/terminology/ValueSet/cz-coverage-type) |
| A.2.5.2 | Appointment status | [appointmentstatus](https://hl7.org/fhir/valueset-appointmentstatus.html) |
| A.4.1, A.5.1 | Content type of the presented form and of an attachment | MIME type, [urn:ietf:bcp:13](https://www.rfc-editor.org/rfc/rfc2046) |
| A.4.2, A.5.2 | Content language of the presented form and of an attachment | [all-languages](https://hl7.org/fhir/valueset-all-languages.html) |

The element `A.1.8.3 Document status` expresses the status of the document at the time of issue, not the state of the eReferral in the system. That is a property of the system, not of the document, see [Workflow](workflow.html).

### Recommendation to take the patient into care

| Item code | Item description | Value |
| :--- | :--- | :--- |
| — | Recommended disposition in type K | [korder-recommendation-disposition-vs](ValueSet-korder-recommendation-disposition-vs.html) — `ambulatory-care` taking into care, `hospitalization` hospitalisation |

In type K the recommended disposition is carried by an extension of the requested service profile and the binding of the value set is `required`. The scenario of recommending that the patient be taken into ambulatory or inpatient care is described in Funkční specifikace eŽádanky K. No `A.x` element is defined for this data item in the logical model, which is why the table gives it no number.

### UCUM

| Item code | Item description | Value |
| :--- | :--- | :--- |
| A.3.1.1.1.1 | Weight value – unit | [cz-observation-units-weight-vs](ValueSet-cz-observation-units-weight-vs.html) — `kg`, `g` |
| A.3.1.1.2.1 | Height value – unit | [cz-observation-units-height-vs](ValueSet-cz-observation-units-height-vs.html) — `m`, `cm` |

### Elements with no value set bound

For the following coded elements the guide does not yet bind a value set, because it has no profile or binding for them: `A.1.5` the specialty of the author, `A.3.1.5.1 Allergies and intolerances`, `A.3.2.1.4 Laterality` in type FT and the coded elements of `A.2.6 Specimen information`. Until they are bound, the terminology stated in the General Functional Specification of the eReferral Document applies to them.
