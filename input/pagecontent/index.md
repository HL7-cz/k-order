### Introduction
This implementation guide is based on [FHIR version R4](https://hl7.org/fhir/R4/). It specifies a common framework for electronic request documents (request forms) in the Czech national context, in accordance with the European eHN guidelines and Xt-EHR concepts.
The main objective of this implementation guide is to define common content components, logical models, and design principles used for the construction of electronic requests in the Czech Republic. This specification provides a common foundation for various types of request documents and ensures a unified approach to representing the administrative, identification, and workflow aspects of requests.
The currently defined K-Request and FT-Request document types are based on a common logical model for requests. Individual request types differ primarily in the “body” section, specifically in the data elements representing the actual requested content and the professional context of the specific request type.
In the future, this common base is expected to be expanded to include other types of request documents, such as laboratory requests or requests for imaging studies.
The purpose of this standard is to define an interoperable structure for the electronic request form as a healthcare document intended for the electronic exchange of health information between individual healthcare providers, information systems, and the national e-health infrastructure in the Czech Republic.
This guide does not describe the method of transport or exchange of these documents.

### Brief Overview
This guide is divided into several pages, which are listed at the top of each page in the menu bar.
- [Home](index.html): This page provides introductory information, a brief overview, references, dependencies, a version comparison, and an intellectual property statement.
- Introduction:
  - [Scope and Content](scope-and-content.html): This section contains introductory general information about the Common Request Model.
  - [Background](background.html): This section contains general information about the origins of the common request model definition.
- Functional:
  - [Logical Models](logical-models.html): This section contains information about logical models.
- Implementation:
  - [Logical Model Mapping](model-map.html): This section contains information about mapping the logical model to FHIR profiles.
- About:
  - [Downloads](downloads.html): This section contains information about options for downloading the implementation specification content.
- [Artifacts](artifacts.html): This page provides a list of FHIR artifacts defined as part of this implementation guide.

### References
The paper templates for electronic request forms are the relevant types of medical forms defined by Czech legislation and related national standards for medical documentation.
* Related specifications:
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
