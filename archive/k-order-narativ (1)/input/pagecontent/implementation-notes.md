This page contains notes for implementers of the consultation order and the physiotherapy order. They concern the assembly of the FHIR Bundle and the population of its profiles with data.

### Overview

Both types of eReferral are represented as a FHIR Bundle of type `document` containing the composition of the given type and all resources in the tree of referenced resources, see [$document operation](https://www.hl7.org/fhir/composition-operation-document.html). One bundle always contains exactly one composition: `KOrderCompositionCz` for type K, `FTOrderCompositionCz` for type FT.

```
classDiagram
  direction LR
  class BundleOrderCz{
    <<Bundle>>
  }
  BundleOrderCz *-- "0..1" KOrderCompositionCz
  BundleOrderCz *-- "0..1" FTOrderCompositionCz
  BundleOrderCz *-- "1" CZ_PatientCore
  BundleOrderCz *-- "1..*" KOrderServiceRequestCz
  BundleOrderCz *-- "1..*" FTServiceRequestCz
  BundleOrderCz *-- "1..*" CZ_Coverage
  BundleOrderCz *-- "0..*" CZ_ConditionCore
  BundleOrderCz *-- "0..*" CZ_PractitionerCore
  BundleOrderCz *-- "0..*" CZ_PractitionerRoleOrder
  BundleOrderCz *-- "0..*" CZ_OrganizationCore
  BundleOrderCz *-- "0..*" CZ_ObservationOrder
  BundleOrderCz *-- "0..*" CZ_Attachment

  KOrderCompositionCz --> CZ_PatientCore: subject
  KOrderCompositionCz --> CZ_PractitionerRoleOrder: author
  KOrderCompositionCz --> CZ_OrganizationCore: custodian
  KOrderCompositionCz --> KOrderServiceRequestCz: section[orderInformation]
  KOrderCompositionCz --> CZ_Coverage: section[coverage]
  KOrderCompositionCz --> CZ_ConditionCore: section[significantMedicalHistory]
  KOrderCompositionCz --> CZ_ObservationOrder: section[supportingInformation]
  KOrderCompositionCz --> CZ_Attachment: section[attachments]

  FTOrderCompositionCz --> CZ_PatientCore: subject
  FTOrderCompositionCz --> CZ_PractitionerRoleOrder: author
  FTOrderCompositionCz --> FTServiceRequestCz: section[orderInformation]
  FTOrderCompositionCz --> CZ_Coverage: section[coverage]
  FTOrderCompositionCz --> CZ_Attachment: section[attachments]
```

The content of the individual sections and the meaning of the elements are stated on the [Scope and content](scope-and-content.html#conceptual-view) page and in the definitions of the logical models, see [Logical models](logical-models.html). This page does not repeat them.

### One requested procedure, one requested service resource

One requested procedure corresponds to one requested service resource, that is to one `ServiceRequest`, and all of them are referenced from the `section[orderInformation]` section. The cardinality `1..*` means that a single eReferral may carry several requested procedures — in type K for example a consultation examination and an echocardiography, in type FT the individual lines of the referral form.

In type FT the number and the frequency of performance are a property of the particular requested procedure, not of the document as a whole. They are therefore carried by the requested service resource, not by the composition.

### Composition sections in type K

The elements `A.3.2.2` to `A.3.2.6` of the consultation order are carried by separate sections of the composition. The following table states their binding, because it is not apparent from the name of the section.

| Element | Composition section | Section code | What the section is populated with |
|---|---|---|---|
| `A.3.2.2` Significant medical history | `section[significantMedicalHistory]` | LOINC `11348-0` | references to conditions |
| `A.3.2.3` Examination results | `section[examinationResults]` | LOINC `30954-2` | references to diagnostic reports |
| `A.3.2.4` Differential diagnosis | `section[differentialDiagnosis]` | LOINC `51848-0` | references to conditions |
| `A.3.2.5` Current treatment, medication including dosage | `section[currentTreatment]` | LOINC `11506-3` | references to medication statements |
| `A.3.2.6` Referenced documentation | `section[referencedDocumentation]` | LOINC `77599-9` | references to documents |

In type FT the element `A.3.2.2 Goal of the examination` is carried by the `section[goals]` section with the LOINC code `61146-7`. The clinical justification, that is the condition requiring therapy, the goal and the risks, is carried in type FT by the `section[reasons]` section as text, because it is common to the whole referral form.

Where no data are available for a required section, the reason is expressed in `composition.section.emptyReason`.

### Consequences of immutability for assembling the bundle

The bundle is assembled and signed at issue and does not change afterwards, see [Workflow](workflow.html). Immutability is a property of the document, but which data change during processing is determined by the system through which the document is exchanged. The two consequences below therefore apply in the context of the eReferral system, that is the Czech implementation.

1. **Data that change during processing do not belong in the bundle.** If a recommended provider was stated in the element `A.1.6 Requested performer` and the care is eventually provided by another one, the original provider remains in the document. The same applies to the distribution of the result with respect to the element `A.1.7 Additional recipient`.
2. **Content is not supplemented by issuing a new version of the document.** The element `A.2.5 Appointment` carries the date requested or agreed at the time of issue, not the date for which the patient was booked later. In type FT this also holds for the therapeutic plan composed by the therapist in the model with a delegated scope: the therapist records it in their own medical records, not in the eReferral.

### Identifiers

Three different identifiers appear in and around the document and must be distinguished.

| Identifier | Where it is | What it is for |
|---|---|---|
| `A.2.1.1` Order identifier | in the document, an element of the logical model | Identifies the order in the requester's system. It is assigned by the sending system when the document is assembled. |
| System identifier of the eReferral (`id`, UUID) | outside the document, assigned by the eReferral system on storage | Uniquely identifies the eReferral in the whole ecosystem. Subsequent clinical documents use it to reference the original eReferral. |
| Code of the eReferral (eight alphanumeric characters) | outside the document, assigned by the eReferral system on storage | It is communicated to the patient and serves to present the eReferral to the provider of the requested care. |

Neither the system identifier nor the code is part of the FHIR Bundle, because they do not yet exist at the moment the bundle is assembled and signed.

### Signature of the document

The element `A.1.9 Electronic signatures` carries the electronic signature or seal of the document and the time stamp. The person who wrote the order and the person who signed it are identified in the document by the non-semantic identifier of a healthcare practitioner, and they need not be the same person.

Neither the signing method nor its verification is described in this guide. It follows the general methodology for signing FHIR documents.

### Acceptance with generalisation of the requested care

The concepts in the [korder-procedures-vs](ValueSet-korder-procedures-vs.html) and [ft-order-procedures-vs](ValueSet-ft-order-procedures-vs.html) value sets are arranged hierarchically, so it can be derived that a requested concept is subsumed by a concept the performing workplace works with, and the request can be accepted. The original coded information and its textual form must remain visible to the performer. The requester's information system must support the whole value set of the requested care, offering only a subset at data entry is acceptable.

Where the requested care is expressed by a procedure of a health insurance company, generalisation in this way cannot be performed, because those code systems have no hierarchy of concepts.
