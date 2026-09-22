// Hospital admission is a distinct proposed service, not a disposition extension.
// Shared patient, provider and clinical resources are defined in the K examples.
Instance: HospitalAdmissionConsultation-Example
InstanceOf: KOrderServiceRequestCz
Usage: #example
Description: "Objednávka konzilia při zhoršení renálních funkcí, doprovázená doporučením k hospitalizaci."
* language = #cs
* identifier.value = "726785fc-1274-44db-a9e8-a460ad4f6376"
* status = #active
* intent = #order
* authoredOn = "2026-09-03T10:00:00+02:00"
* subject = Reference(Patient-Novak-Petr)
* requester = Reference(Practitioner-Author-detail)
* performer[0] = Reference(Organization-1)
* code.coding[0] = $sctCZ#185387006 "konzultace s novým pacientem"
* code.text = "Konziliární vyšetření při zhoršení renálních funkcí"
* reasonReference[0] = Reference(NephrologyCondition-CKDStage4)
* supportingInfo[0] = Reference(Observation-eGFRExample)
* supportingInfo[1] = Reference(Observation-CreatinineExample)
* insurance = Reference(KOrderCoverage-Example)

Instance: HospitalAdmissionServiceRequest-Example
InstanceOf: KOrderServiceRequestCz
Usage: #example
Description: """
CZ: Samostatné doporučení k přijetí pacienta do nemocnice za účelem došetření zhoršení renálních funkcí.
EN: A separate recommendation for hospital admission to investigate worsening renal function.
"""
* language = #cs
* identifier.value = "b58b90d6-6354-4aa1-b57a-814e74dc2a59"
* status = #active
* intent = #proposal
* authoredOn = "2026-09-03T10:00:00+02:00"
* subject = Reference(Patient-Novak-Petr)
* requester = Reference(Practitioner-Author-detail)
* performer[0] = Reference(Organization-1)
* code.text = "Přijetí k hospitalizaci"
* reasonReference[0] = Reference(NephrologyCondition-CKDStage4)
* reasonCode.text = "Došetření zhoršení renálních funkcí za hospitalizace."
* supportingInfo[0] = Reference(Observation-eGFRExample)
* supportingInfo[1] = Reference(Observation-CreatinineExample)
* insurance = Reference(KOrderCoverage-Example)

Instance: HospitalAdmissionCompositionExample
InstanceOf: KOrderCompositionCz
Usage: #example
Description: """
CZ: K dokument s doporučením k hospitalizaci jako samostatným ServiceRequest.
EN: K document with a recommendation for hospital admission represented by its own ServiceRequest.
"""
* language = #cs
* status = #final
* date = "2026-09-03T10:05:00+02:00"
* title = "Doporučení k hospitalizaci"
* subject = Reference(Patient-Novak-Petr)
* author[0] = Reference(Practitioner-Author-detail)
* identifier.value = "8d16bc92-afdc-4198-b14c-6aef6a8c8b15"
* section[orderInformation].entry[0] = Reference(HospitalAdmissionServiceRequest-Example)
* section[orderInformation].entry[1] = Reference(HospitalAdmissionConsultation-Example)
* section[clinicalQuestion].text.status = #generated
* section[clinicalQuestion] insert CzechNarrative([[Žádáno konziliární vyšetření při zhoršení renálních funkcí. Současně doporučeno přijetí k hospitalizaci za účelem došetření.]])
* section[coverage].entry[0] = Reference(KOrderCoverage-Example)
* section[supportingInformation].entry[0] = Reference(Observation-eGFRExample)
* section[supportingInformation].entry[1] = Reference(Observation-CreatinineExample)
* section[supportingInformation].entry[2] = Reference(NephrologyCondition-CKDStage4)

Instance: BundleHospitalAdmissionRecommendationExample
InstanceOf: BundleOrderCz
Usage: #example
Description: """
CZ: Dokumentový Bundle K doporučení k hospitalizaci. Navržené přijetí má vlastní ServiceRequest s intent proposal, nikoli extension na jiném požadavku.
EN: Document Bundle for a K hospital admission recommendation. The proposed admission has its own ServiceRequest with intent proposal, rather than an extension on another request.
"""
* language = #cs
* type = #document
* timestamp = "2026-09-03T10:05:00+02:00"
* identifier.system = "urn:ietf:rfc:4122"
* identifier.value = "3ec722c6-0a48-4c79-9fb1-c8529d81b3cf"
* entry[0].fullUrl = "https://example.cz/fhir/Composition/HospitalAdmissionCompositionExample"
* entry[0].resource = HospitalAdmissionCompositionExample
* entry[+].fullUrl = "https://example.cz/fhir/ServiceRequest/HospitalAdmissionServiceRequest-Example"
* entry[=].resource = HospitalAdmissionServiceRequest-Example
* entry[+].fullUrl = "https://example.cz/fhir/ServiceRequest/HospitalAdmissionConsultation-Example"
* entry[=].resource = HospitalAdmissionConsultation-Example
* entry[+].fullUrl = "https://example.cz/fhir/Patient/48a9d440-4194-42c1-87ad-b5a39020a4d0"
* entry[=].resource = Patient-Novak-Petr
* entry[+].fullUrl = "https://example.cz/fhir/Practitioner/a81e74c9-fe94-4eb1-9233-4c8f0b2d4e3a"
* entry[=].resource = Practitioner-Author
* entry[+].fullUrl = "https://example.cz/fhir/PractitionerRole/2b7e9637-5018-4542-9faf-d5abdee7b849"
* entry[=].resource = Practitioner-Author-detail
* entry[+].fullUrl = "https://example.cz/fhir/Organization/ace081ba-e0a8-4b89-a4a7-c5b7cd3c8169"
* entry[=].resource = Organization-1
* entry[+].fullUrl = "https://example.cz/fhir/Organization/af2b3114-e872-43b9-9875-cceb39122f7f"
* entry[=].resource = Organization-L1-Odd
* entry[+].fullUrl = "https://example.cz/fhir/Organization/Organization-Insurance111"
* entry[=].resource = Organization-Insurance111
* entry[+].fullUrl = "https://example.cz/fhir/Coverage/KOrderCoverage-Example"
* entry[=].resource = KOrderCoverage-Example
* entry[+].fullUrl = "https://example.cz/fhir/Condition/NephrologyCondition-CKDStage4"
* entry[=].resource = NephrologyCondition-CKDStage4
* entry[+].fullUrl = "https://example.cz/fhir/Observation/Observation-eGFRExample"
* entry[=].resource = Observation-eGFRExample
* entry[+].fullUrl = "https://example.cz/fhir/Observation/Observation-CreatinineExample"
* entry[=].resource = Observation-CreatinineExample
* entry[+].fullUrl = "https://example.cz/fhir/Organization/Organization-OrderLaboratory"
* entry[=].resource = Organization-OrderLaboratory
