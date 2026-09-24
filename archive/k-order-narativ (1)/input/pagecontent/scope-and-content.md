{% include variable-definitions.md %}

### Scope

#### Included Areas

This guide covers the **eReferral of type K, the consultation order**, and the **eReferral of type FT, the physiotherapy order**. Both types share the skeleton of the logical model and the element numbering and differ only in the element `A.3.2 Order data elements`.

The **consultation order** is a referral whose subject is an expert assessment or a procedure within the competence of a specialist and whose result is a clinical document, typically a consultation or an outpatient report.

The **physiotherapy order** is a referral for physiotherapy or occupational therapy in a patient with a functional disorder that therapy can influence. Specific to this type is the choice between two models of prescription: the treating physician either writes out the specific requested procedures, their number and frequency, or states only the category of the requested care, that is physiotherapy or occupational therapy, and delegates the composition of the therapeutic plan to a therapist with specialised competence. The content rules of both models are stated in the Special Functional Specification of eReferral type FT.

In both types more than one service can be requested on a single eReferral, because the element `A.3.2.1 Requested examination` has the cardinality `1..*`. The value sets by which the requested care is expressed are stated on the [Terminology considerations](terminology-considerations.html) page.

#### Excluded Areas

This guide does not address the overall ecosystem of eReferrals nor the method of their transport. It further does not cover:

- the **other types of eReferral** — they have their own implementation guides, see {{czImgOrder}},
- the **behaviour of the eReferral system** — the states and their transitions, the interface operations, the permissions, the notifications and the operating conditions are described in the Standard of the eReferral System,
- the **system header of the eReferral** — this guide describes only the FHIR Bundle, see [Home](index.html),
- **clinical scenarios and type-specific content requirements** — they are in the Special Functional Specification of the given type, that is in Funkční specifikace eŽádanky K and in Funkční specifikace eŽádanky FT,
- **reporting and reimbursement of the requested care** — the mapping to the data interface of the health insurance companies is in the Special Functional Specification of the given type,
- the **therapeutic plan composed by the therapist** — in the model with a delegated scope the therapist records it in their own medical records, not in the eReferral.

### Content

#### Information Models

##### Conceptual view

The skeleton of the logical model is uniform for all types of eReferral and the same element numbers are used in it. An element number, for example `A.1.7`, denotes the same data item regardless of the type of eReferral and regardless of the implementation guide in which it is defined. Items of the logical model are therefore referenced **by element number and name**, not by model name.

| Number | Section | What it contains | Who defines it |
|---|---|---|---|
| `A.1` | Document header | Administrative data. | common to all types |
| `A.2` | Document body | Order information and its reason, the clinical event, the coverage, the appointment and the specimen information. | common to all types |
| `A.3` | Supporting information and data elements | Supporting clinical information and the definition of the requested care. The element `A.3.2` is type-specific. | partly common, `A.3.2` differs for K and for FT |
| `A.4` | Presented form | The human-readable form of the document. | common to all types |
| `A.5` | Attachments | Attachments enclosed with the eReferral. | common to all types |

The guide defines the skeleton as a separate model, **General order**, and two type-specific models on top of it, **K-order** and **FT-order**. These differ from each other only in the model used for the document body.

###### Order Form Structure

<figure>
  {% include orderDiagram-cz.svg %}
</figure>

###### Order Form Header

<figure>
  {% include orderHeaderDiagram.svg %}
</figure>

###### Order Body

<figure>
  {% include orderBodyDiagram.svg %}
</figure>

#### Subject

The patient, the healthcare practitioner and the healthcare provider are defined in {{czCore}} and this guide only uses them. The patient profile localises the basic concepts including identifiers and terminology for use in the Czech context, the practitioner profile makes it possible to assign a role to a person, and the provider profile defines the way an organisation is represented, including superior and subordinate departments.

#### Objects

The medical device and the medical product are also defined in {{czCore}}. The same holds for components shared by several documents, for example the body measurements, which are defined identically across documents.

### Order structure

The following sections state the elements of the individual sections of the skeleton. The complete list of elements with their cardinalities, data types and value sets is on the [Logical models](logical-models.html) page, the mapping to FHIR profiles on the [Logical Model Mapping](model-map.html) page.

#### Document header

The header is identical for both types.

| Number | Element | What it carries |
|---|---|---|
| `A.1.1` | Patient identification | The sectoral identifier and the identification data of the patient. |
| `A.1.2` | Patient contact information | The address, the contact details and the contact persons. The type of contact person distinguishes emergency contacts, legal representatives and other persons related to the patient. |
| `A.1.3` | Health insurance | The health insurance company and the insurance relationship of the patient. The insurer need not be the payer of the requested care. |
| `A.1.4` | Coverage | The method of payment for the requested care. |
| `A.1.5` | Author | The requester, that is the provider, the department and the persons who wrote and signed the order. |
| `A.1.6` | Requested performer | The provider of the requested care **recommended at issue**. In a non-addressed eReferral it need not be stated. The actually performing provider is carried by the system header, not by this element. |
| `A.1.7` | Additional recipient | Additional recipients of the result beside the author, as determined by the requester **at issue**. The distribution of the result is governed by the system header, not by this element. |
| `A.1.8` | Document metadata | Data about the document as such, for example its identifier, category, date of creation and custodian. |
| `A.1.9` | Electronic signatures | The electronic signature or seal of the document under Act No. 327/2011 Coll., Section 54a, and the time stamp. |

The elements `A.1.1` and `A.1.2` are carried by a single element in the model, because the identification of the patient and their contact information are modelled together.

#### Document body

In section `A.2` the body is identical for both types.

| Number | Element | What it carries |
|---|---|---|
| `A.2.1` | Order information | The identifier and the date of the order, the requested date of performance, the urgency, the order text and information for the patient. |
| `A.2.2` | Order reason | The indicating diagnosis, the clinical question and the reason for the order, both coded and as text. In the model it is a part of the element `A.2.1`. |
| `A.2.3` | Clinical event | The context of care to which the order relates, for example the outpatient visit at which the order arose. |
| `A.2.4` | Coverage | Data on the method of payment for the requested care in the body of the document, including payer information and a comment. |
| `A.2.5` | Appointment | The requested or agreed date of performance, its duration, place and instructions for the patient. |
| `A.2.6` | Specimen information | Data on a biological specimen for the cases where its examination is the subject of the request. |

#### Supporting information and data elements

| Number | Element | What it carries |
|---|---|---|
| `A.3.1` | Clinical information | Data communicated to the provider of the requested care that influence its provision or the interpretation of the result: body measurements, other relevant clinical information, medication, implants, urgent information, restrictions of patient mobility, physical findings, the date of hospitalisation, vaccination and other formalised data. |
| `A.3.2` | Order data elements | The definition of the requested care. The content differs between types K and FT, see below. |
| `A.3.3` | Planned care orders | References to orders of planned care following on from this order. |
| `A.3.4` | Other supporting information | Other supporting information, for example the date by which the result is needed. |

##### Order data elements of the consultation order

| Number | Element | What it carries |
|---|---|---|
| `A.3.2.1` | Requested examination | The code and the name of the requested service and a note of the author. The block may repeat. |
| `A.3.2.2` | Significant medical history | A textual description of the medical history data significant for the requested care. |
| `A.3.2.3` | Examination results | A summary or selection of the results of examinations already performed that are relevant for clinical decision-making. |
| `A.3.2.4` | Differential diagnosis | The diagnoses considered and their justification. |
| `A.3.2.5` | Current treatment, medication including dosage | An overview of the ongoing treatment including dosage. |
| `A.3.2.6` | Referenced documentation | A list or description of the medical documentation lent with the order. |

##### Order data elements of the physiotherapy order

| Number | Element | What it carries |
|---|---|---|
| `A.3.2.1` | Requested examination | The code and the name of the requested care, the body part, the laterality, the number, the frequency, a note and the requested place of provision, for example the patient's home. The block may repeat. |
| `A.3.2.2` | Goal of the examination | The goal to be achieved by the therapy. |

In the model of a general indication with a delegated scope the treating physician does not state the specific procedures and expresses the requested care only by its category.

#### Presented form

The human-readable form of the document in the required PDF format. It carries the content type, the language, the title, the data or the URL of the content and the date of creation.

#### Attachments

Other attachments by which the structured content may be supplemented, for example outpatient or discharge reports, image documentation or data provided by the patient. An attachment does not replace a structured data item: a data item for which a structured element is defined in the logical model must be stated by that element.

The attachments of the eReferral must be distinguished from the documents of the consignment by which the result is handed over when the eReferral is completed. Those follow the rules of the Temporary Repository and are unrelated to the body of the eReferral.
