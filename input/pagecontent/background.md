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

### Supporting information

Supporting information helps the recipient assess and plan care. An order represents it at two levels:

| Location | Purpose |
|---|---|
| `Composition.section[supportingInformation]` | Organizes clinical context for the complete document, with a readable summary in `text` and structured references in `entry`. |
| `ServiceRequest.supportingInfo` | Explicitly associates an individual requested service with the clinical resources relevant to it. |
| `ServiceRequest.reasonCode` / `reasonReference` | States why the service is requested. In these profiles, `reasonReference` targets a Condition. |

Listing a resource in a Composition section does not automatically associate it with every ServiceRequest. If a mobility observation affects two services, both requests can reference that same Observation. Include one instance in the document Bundle and reuse its reference in the Composition and the relevant requests.

**Choosing a document section.** In a K-order, prefer `significantMedicalHistory` for established history, `differentialDiagnosis` for diagnostic alternatives, `currentTreatment` for medication and `examinationResults` for DiagnosticReport resources. Use `supportingInformation` for the remaining relevant context. In an FT-order, `reasons` is narrative-only and prohibits `entry`; structured conditions can be listed in `supportingInformation`, with the indication for an individual service linked through its `reasonReference`. Both document types use `medicalDevices` for device use; FT uses `goals` for intended outcomes.

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

An individual laboratory result conforming to CZ_ObservationOrder uses the open part of the list, outside the named specialized slices. Open slicing still respects the declared target profiles. Composition also permits CZ_CarePlanCore, while neither ServiceRequest profile permits it in `supportingInfo`. A DiagnosticReport belongs in the K-order `examinationResults` section rather than directly in `supportingInfo`.

ServiceRequest additionally provides `supportingInfo[implant]`, referencing DeviceUseStatement, which in turn references Device. FT ServiceRequest also provides `supportingInfo[goal]` for Goal. In Composition these resources belong in `medicalDevices` and `goals`.

**FT example after hip arthroplasty.** In the [hip rehabilitation example](Bundle-BundleFTHipRehabilitation.html), the diagnosis is the indication in `reasonReference`; current mobility is in `supportingInformation`, device use in `medicalDevices` and the intended outcome in `goals`. The ServiceRequest links the relevant device use and goal. Where an explicit association between mobility and this service is also needed, reuse the existing Observation:

```fsh
// Addition to the existing FTServiceRequest-HipRehabilitation:
* supportingInfo[mobility] = Reference(Observation-FTHipMobility)
```

This is usage guidance for the existing profiles and adds no mandatory cardinalities. Select relevant information, retain dates and status, and keep the narrative consistent with the structured data. An omitted entry does not assert the absence of a finding, such as an allergy. A BundleOrderCz document also includes the referenced resources.

The base element semantics are defined in FHIR R4: [ServiceRequest.supportingInfo](https://hl7.org/fhir/R4/servicerequest-definitions.html#ServiceRequest.supportingInfo) and [Composition.section](https://hl7.org/fhir/R4/composition-definitions.html#Composition.section).
