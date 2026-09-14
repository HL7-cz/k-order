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

### Order section sequence

Common sections retain the IMG-Order sequence: `orderInformation`, `clinicalIndication` (the counterpart of IMG `clinicalQuestion`), `coverage`, `appointment`, `carePlan`, `medicalDevices`, `supportingInformation`, `attachments`. The requested service and the question it should answer come first. Attachments come last.

Specialized sections without a separate IMG-Order counterpart are inserted according to their relevance to assessing the request:

| Profile | Position and sequence | Rationale |
| --- | --- | --- |
| K | After `clinicalIndication`: `differentialDiagnosis`, `examinationResults`, `currentTreatment`, `significantMedicalHistory` | Present suspected diagnoses to assess, available results, current treatment and historical context in that order. Include information relevant to the requested care. |
| FT | After `clinicalIndication`: `goals` | The expected functional outcome directly clarifies the purpose of the requested therapy. |
| K | Before `attachments`: `referencedDocumentation` | Links to further documentation follow the clinical content; transmitted attachments close the document. |

This recommended presentation order is reflected in profile declarations and examples. As in IMG-Order, `section.slicing.ordered = false`, so a different incoming section order alone is not a validation error. Priority does not change section cardinalities or population requirements. User interfaces should highlight significant alerts from `supportingInformation` even with this section sequence.

### Supporting information

**Recommendation for hospital admission or transfer of care.** Represent each such service by a separate `ServiceRequest` with its own identifier, `code`, patient and requester. Use `intent = proposal` for a recommendation and `intent = order` for an actual order. Reference the new request from `Composition.section[orderInformation].entry` and include it in the document Bundle. If no service code has been agreed, use `code.text`. Do not place the recommendation in a disposition extension on a request for another examination. Use `basedOn` only when the new request actually fulfils the referenced proposal or order; chronological sequence alone is insufficient. See the standard element definitions in [FHIR R4 ServiceRequest](https://hl7.org/fhir/R4/servicerequest-definitions.html) and the [hospital admission recommendation example](Bundle-BundleHospitalAdmissionRecommendationExample.html).

Supporting information helps the recipient assess and plan care. An order represents it at two levels:

| Location | Purpose |
|---|---|
| `Composition.section[supportingInformation]` | Organizes clinical context for the complete document, with a readable summary in `text` and structured references in `entry`. |
| `ServiceRequest.supportingInfo` | Explicitly associates an individual requested service with the clinical resources relevant to it. |
| `ServiceRequest.reasonCode` / `reasonReference` | States why the service is requested. In these profiles, `reasonReference` targets a Condition. |

Listing a resource in a Composition section does not automatically associate it with every ServiceRequest. If a mobility observation affects two services, both requests can reference that same Observation. Include one instance in the document Bundle and reuse its reference in the Composition and the relevant requests.

**Choosing a document section.** K and FT share `clinicalIndication` for the reason and clinical question (required narrative when present, optional CZ_ClinicalQuestion entries), `carePlan` for A.3.3 planned care, and `supportingInformation` for shared A.3.1 clinical data and A.3.4 additional information. Keep structured medication and conditions in the common clinical section. K-specific sections describe A.3.2 consultation content; reuse existing resources if references are also needed there. Both document types use `medicalDevices` for device use; FT uses `goals` for intended outcomes. The indication for each individual service remains in ServiceRequest.reasonCode or reasonReference.

**Migration.** Replace FT `reasons` (LOINC 29299-5) with `clinicalIndication` (LOINC 104720-8), retaining the indication narrative. Move planned CarePlan references from `supportingInformation` to `carePlan` (LOINC 18776-5). Both new sections are optional and occur at most once. These sections adapt the clinical-question and care-plan sections of IMG-Order to K/FT using CZ Core target profiles; the IMG-Order profile itself is maintained separately.

**Choosing a slice.** The following names apply to both `supportingInfo` and `supportingInformation.entry`:

| Slice | Intended use |
|---|---|
| `bodyHeight`, `bodyWeight` | Measurements relevant to care, with the observation date and unit recorded in the Observation. |
| `relevantCondition` | A condition affecting care. Also use `reasonReference` when the condition is represented as the direct structured indication. |
| `medication` | Relevant medication use represented by MedicationStatement. |
| `allergyIntolerance` | A structured allergy or intolerance record. |
| `warning` | A clinical alert represented by Flag, including its validity. |
| `mobility` | Observed mobility and assistance needs; use Goal for an intended future state. |
| `physicalFinding` | A physical-examination finding conforming to CZ_PhysicalFindingOrder. |
| `hospitalization` | A relevant hospital stay or other Encounter. The slice name does not constrain the Encounter class to inpatient care. |
| `immunization` | A relevant vaccination record. |
| `additionalObservation` | A formalized observation conforming to CZ_AdditionalObservationOrder with category `survey`; this is not a generic slot for laboratory results. |

An individual laboratory result conforming to CZ_ObservationOrder uses the open part of the list, outside the named specialized slices. Open slicing still respects the declared target profiles. Composition permits CZ_CarePlanCore in `carePlan`, while neither ServiceRequest profile permits it in `supportingInfo`. A DiagnosticReport belongs in the K-order `examinationResults` section rather than directly in `supportingInfo`.

ServiceRequest additionally provides `supportingInfo[implant]`, referencing DeviceUseStatement, which in turn references Device. FT ServiceRequest also provides `supportingInfo[goal]` for Goal. In Composition these resources belong in `medicalDevices` and `goals`.

**FT example after hip arthroplasty.** In the [hip rehabilitation example](Bundle-BundleFTHipRehabilitation.html), the diagnosis is the indication in `reasonReference`; current mobility is in `supportingInformation`, device use in `medicalDevices` and the intended outcome in `goals`. The ServiceRequest links the relevant device use and goal. Where an explicit association between mobility and this service is also needed, reuse the existing Observation:

```fsh
// Addition to the existing FTServiceRequest-HipRehabilitation:
* supportingInfo[mobility] = Reference(Observation-FTHipMobility)
```

This is usage guidance for the existing profiles and adds no mandatory cardinalities. Select relevant information, retain dates and status, and keep the narrative consistent with the structured data. An omitted entry does not assert the absence of a finding, such as an allergy. A BundleOrderCz document also includes the referenced resources.

The base element semantics are defined in FHIR R4: [ServiceRequest.supportingInfo](https://hl7.org/fhir/R4/servicerequest-definitions.html#ServiceRequest.supportingInfo) and [Composition.section](https://hl7.org/fhir/R4/composition-definitions.html#Composition.section).
