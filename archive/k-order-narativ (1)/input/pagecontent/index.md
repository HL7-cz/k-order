{% include variable-definitions.md %}

### Introduction

This implementation guide is based on [FHIR version R4](https://hl7.org/fhir/R4/) and defines a common framework for electronic request documents, that is eReferrals, in the Czech national context. It is prepared in accordance with the European eHN guidelines and the Xt-EHR concepts.

On top of that common framework the guide defines **two types of eReferral**:

- the **consultation order, type K**, by which the requesting physician asks for the expert opinion of a specialist, for an examination or treatment by a specialist, or recommends that the patient be taken into ambulatory or inpatient care,
- the **physiotherapy order, type FT**, by which the treating physician requests physiotherapy or occupational therapy.

Both types are part of the patient's medical records and authorise the requested health service, so where the care is covered by public health insurance they are a precondition of its reimbursement. The statutory definition of the eReferral and the regulations governing its content are stated in the References chapter.

The guide defines the content components of the document and the structure in which it is assembled: the logical model, its mapping to FHIR profiles and resources, the structure of the FHIR Bundle, the value sets and examples of instances. The aim is for the eReferral to be electronically exchangeable between healthcare providers, their information systems and the national e-health infrastructure.

In the future the common framework is expected to be extended to other types of request documents, such as the laboratory order.

#### Common skeleton and type-specific differences

Both types are built on a single skeleton of the logical model. They share the document header `A.1`, the document body `A.2`, the presented form `A.4` and the attachments `A.5`, and they **differ only in section `A.3`**, specifically in the element `A.3.2 Order data elements`, which carries the definition of the requested care specific to the given type.

The skeleton and the element numbering are common to all types of eReferral, including those published in other implementation guides. The element `A.1.7` therefore denotes the same data item regardless of the type.

#### The two parts of an eReferral

From the interface point of view an eReferral consists of two parts.

| Part | What it carries | Where it is described |
|---|---|---|
| System header | The type of the referral, the requester, the patient, the addressee, the additional recipients of the result and the reference to a parent referral. It carries no clinical content and may change during the lifecycle. | Standard of the eReferral System, schema in the OpenAPI specification |
| FHIR Bundle of type `document` | All the clinical content of the document. It is assembled and signed at issue and does not change for the whole lifecycle of the eReferral. | **This guide**, the General Functional Specification of the eReferral Document and the Special Functional Specification of the given type |

**This guide describes only the FHIR Bundle.** It does not describe the system header.

This guide does not describe the method of exchange of the document.

#### Relationship to the rest of the documentation

The documentation of eReferrals is divided into the set below.

| Document | What it describes |
|---|---|
| Standard „Systém eŽádanka“ (Standard of the eReferral System) | The eReferral system as a whole: actors, roles and permissions, architecture, state model and lifecycle, processes and interface operations, integrations, cyber security and operating conditions. |
| Obecná funkční specifikace dokumentu eŽádanka (General Functional Specification of the eReferral Document) | The content and the properties of the eReferral document common to all types. |
| Funkční specifikace eŽádanky K (Special Functional Specification of eReferral type K) | The specifics of type K: clinical scenarios, type-specific content requirements, the mapping table to the data interface and the type-specific value sets. |
| Funkční specifikace eŽádanky FT (Special Functional Specification of eReferral type FT) | The same for type FT, including the rules of both models of prescription. |
| Implementation specification (this guide for types K and FT) | The complete logical model, the mapping to FHIR resources and profiles, the structure of the FHIR Bundle, the value sets and their code systems, examples of instances. |
| OpenAPI specification of the interface | The data schemas of the interface: fields, data types, cardinalities, examples and error responses. |

Each type of eReferral has its own special functional specification. Where this guide refers to the Special Functional Specification of the given type, it therefore means *Funkční specifikace eŽádanky K* for type K and *Funkční specifikace eŽádanky FT* for type FT.

### Brief Overview

This guide is divided into several pages, which are listed at the top of each page in the menu bar.

- [Home](index.html): This page provides introductory information, the relationship to the rest of the documentation, a brief overview, references, dependencies, a version comparison, and an intellectual property statement.
- Introduction:
  - [Scope and Content](scope-and-content.html): This section defines what the guide covers and what it does not, and states the skeleton of the logical model of the document.
  - [Background](background.html): This section contains information about the origins of the definition of the consultation order and the physiotherapy order.
- Functional:
  - [Use cases](use-cases.html): This section refers to the clinical scenarios and to the instances that realise them.
  - [Workflow](workflow.html): This section defines what is and what is not a state of an eReferral.
  - [Logical Models](logical-models.html): This section contains the list of logical models with the numbers and names of the elements.
  - [Terminology considerations](terminology-considerations.html): This section contains information about the code systems and value sets used.
- Implementation:
  - [Logical Model Mapping](model-map.html): This section contains the mapping of the logical model to the profiles.
  - [Examples](examples.html): This section contains examples of instances.
  - [Implementation notes](implementation-notes.html): This section contains information for implementation.
- About:
  - [Changes](changes.html): This section contains an overview of the changes in the individual versions of the guide.
  - [Authors](authors.html): This section contains information about the authors.
  - [Downloads](downloads.html): This section contains information about options for downloading the implementation specification content.
  - [Dependencies](dependencies.html): This section contains information about the dependencies.
  - [Copyright](copyright.html): This section contains information about the copyright.
- [Artifacts](artifacts.html): This page provides a list of FHIR artifacts defined as part of this implementation guide.

### References

The paper templates are the **Referral for examination/treatment of type K** and the **Referral for physiotherapy/occupational therapy of type FT**. The content requirements for a request for further health services are laid down in `Annex No. 1, Part 2 to Decree No. 444/2024 Coll., on medical records`, as in force on 19 February 2025.

* Related specifications:
  * {{czImgOrder}}
    * The sister guide of the same documentation set. It shares the skeleton of the logical model and the element numbering with this guide.
  * {{hl7XtEHR}}
    * This specification inspired many of the design patterns defined in this IG.
  * {{czLabOrder}}
    * This specification shares common design principles for electronic requisition forms.
  * {{czImg}}
    * This specification shares common design principles for electronic requisition forms.
  * {{czCore}}
    * Where possible, specifications were inherited from the CZ Core definitions.

### Dependencies

{% include dependency-table.xhtml %}

### Cross-Version Analysis

{% include cross-version-analysis.xhtml %}

### Intellectual Property Statements

{% include ip-statements.xhtml %}
