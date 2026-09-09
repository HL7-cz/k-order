// Shared documentation for the clinical-information slices in K/FT requests
// and Composition sections. This rule set adds descriptions only.
RuleSet: OrderSupportingInformationDescriptions(path)
* {path}[bodyHeight] ^short = "Height relevant to the requested care"
* {path}[bodyHeight] ^definition = "Reference to a body-height measurement needed to assess or plan the requested care. Record the measurement date and unit in the Observation so the recipient can assess its relevance."
* {path}[bodyWeight] ^short = "Weight relevant to the requested care"
* {path}[bodyWeight] ^definition = "Reference to a body-weight measurement relevant to assessment, treatment planning or equipment selection. Record the measurement date and unit in the Observation."
* {path}[relevantCondition] ^short = "Conditions affecting assessment or treatment"
* {path}[relevantCondition] ^definition = "Reference to a diagnosis or other condition that influences the requested care. Use ServiceRequest.reasonReference for a condition that directly explains why that service is requested. A condition can serve both roles; reuse the same Condition instance when both references are needed."
* {path}[medication] ^short = "Relevant medication use"
* {path}[medication] ^definition = "Reference to a MedicationStatement describing medication use relevant to the requested care, such as treatment affecting interpretation of findings or planning of an intervention. Include the applicable status and period in the referenced resource."
* {path}[allergyIntolerance] ^short = "Allergies and intolerances relevant to care"
* {path}[allergyIntolerance] ^definition = "Reference to a recorded allergy or intolerance relevant to assessment or provision of the requested service. Use AllergyIntolerance for the structured allergy record; use the warning slice for a separate clinical alert when appropriate."
* {path}[warning] ^short = "Alerts affecting provision of care"
* {path}[warning] ^definition = "Reference to a Flag carrying an alert that the recipient should consider when planning or providing care. Describe the alert and its validity in the Flag. An absent reference does not assert that the patient has no alerts or risks."
* {path}[mobility] ^short = "Current mobility and assistance needs"
* {path}[mobility] ^definition = "Reference to a patient-mobility Observation describing the ability to move and relevant assistance needs. Use the observed state and observation date, for example when arranging access to the service or planning physiotherapy. A desired future level of mobility belongs in a Goal."
* {path}[physicalFinding] ^short = "Relevant physical examination findings"
* {path}[physicalFinding] ^definition = "Reference to a physical-examination Observation, such as a finding on inspection or clinical examination. Use the physical-finding profile for examination findings and retain the date and relevant anatomical location in the Observation."
* {path}[hospitalization] ^short = "Relevant hospital stay or care encounter"
* {path}[hospitalization] ^definition = "Reference to an Encounter whose clinical context is relevant to the request, for example the hospital stay associated with a recent operation. ServiceRequest.encounter identifies the encounter in which the request was made; supporting information may refer to another relevant encounter. The slice name does not itself constrain the Encounter to an inpatient stay."
* {path}[immunization] ^short = "Relevant vaccination history"
* {path}[immunization] ^definition = "Reference to an Immunization record relevant to the requested care. Include the event status and date in the resource; omission of this slice does not mean that the patient is unvaccinated."

RuleSet: OrderServiceRequestSupportingInformation
* supportingInfo ^short = "Clinical context for this requested service"
* supportingInfo ^definition = "References to existing clinical information used to assess, plan or perform this particular requested service. Select information relevant to this ServiceRequest, such as measurements, medication, allergies, alerts, mobility or an implant. The list provides clinical context in addition to the indication recorded in reasonCode or reasonReference."
* supportingInfo ^requirements = "Additional structured observations use CZ_MedicalTestResultCore directly in the open part of the list. No Order-specific survey category is required. Use a named specialized slice when the resource represents that specialized clinical content."
* supportingInfo ^comment = "Composition sections organize the complete order document; supportingInfo explicitly links a clinical resource to this individual service. Information in a Composition section is not automatically assigned to every ServiceRequest. When both relationships are relevant, reference the same resource instance from the section and the ServiceRequest. Do not create duplicate clinical resources. The named slices identify supported clinical categories; open slicing still requires references to satisfy the allowed target profiles. See [usage guidance](background.html#supporting-information)."
* reasonReference ^definition = "References to conditions that directly justify the requested service. Use supportingInfo for additional conditions or other clinical facts that influence assessment or provision of that service."
* reasonCode ^definition = "Coded or textual indication explaining why this service is requested. Use reasonReference when the indication is represented by an existing Condition resource."
* note ^definition = "Additional free-text comments about this requested service. Where a relevant clinical fact is available as a supported structured resource, reference it through supportingInfo rather than documenting it only in a note."
* supportingInfo[implant] ^short = "Use of a relevant implant or medical device"
* supportingInfo[implant] ^definition = "Reference to a DeviceUseStatement describing the patient's use of an implant or device relevant to this service. The DeviceUseStatement points to the Device containing its identification and properties. The same DeviceUseStatement can be listed in Composition.section[medicalDevices]."
* insert OrderSupportingInformationDescriptions(supportingInfo)

RuleSet: OrderCompositionSupportingInformation
* section[supportingInformation] ^comment = "Use this section to make relevant clinical context available in the order document. Its entries do not automatically populate ServiceRequest.supportingInfo. When a fact is relevant to a specific requested service, also link the same resource from that ServiceRequest. Prefer the dedicated Composition sections for content that has a specific document role. See [usage guidance](background.html#supporting-information)."
* section[supportingInformation].text ^definition = "Human-readable summary of the supporting clinical context. Keep the narrative consistent with the structured entries, including relevant dates and qualifications. An omitted section or entry does not assert the absence of clinical findings."
* section[supportingInformation].entry ^definition = "References to the structured clinical resources summarized by this section. Reuse resource instances already referenced elsewhere in the document. The open list also permits the declared general Observation and CarePlan profiles even when no dedicated slice is defined for them."
* section[orderInformation] ^comment = "This section identifies the requested ServiceRequest instances. Each request carries its own indication and links to the supporting resources relevant to that service; the document-level clinical sections provide the organized presentation of the order."
* section[medicalDevices] ^comment = "Place device-use information here at document level. If an implant or device affects a particular requested service, also reference the same DeviceUseStatement from ServiceRequest.supportingInfo[implant]. Reference the Device through DeviceUseStatement.device."
* insert OrderSupportingInformationDescriptions(section[supportingInformation].entry)
