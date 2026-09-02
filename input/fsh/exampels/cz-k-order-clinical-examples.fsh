// Additional K-order clinical examples. Shared patient, author, and coverage instances
// are declared in cz-k-order-bandle.fsh.

// ------------------------- Example 2: urgent dermatology -------------------------
Instance: DermatologyCondition-PigmentedLesion
InstanceOf: CZ_ConditionCore
Usage: #example
* id = "DermatologyCondition-PigmentedLesion"
* subject = Reference(Patient-Novak-Petr)
* code.coding[0] = $mkn10#D48.5
* code.text = "Rychle se menici pigmentovy utvar na zadech"

Instance: Practitioner-Dermatologist
InstanceOf: CZ_PractitionerCore
Usage: #example
* id = "Practitioner-Dermatologist"
* name.text = "MUDr. Eva Cerná"
* name.family = "Cerna"
* name.given[0] = "Eva"

Instance: Organization-DermatologyClinic
InstanceOf: CZ_OrganizationCore
Usage: #example
* id = "Organization-DermatologyClinic"
* identifier[0].system = $cz-organization-ico
* identifier[0].value = "12345679"
* name = "Nemocnice Demo, a.s. - pigmentova poradna"
* partOf = Reference(Organization-1) "Nemocnice Demo, a.s."

Instance: PractitionerRole-Dermatologist
InstanceOf: CZ_PractitionerRoleOrder
Usage: #example
* id = "PractitionerRole-Dermatologist"
* practitioner = Reference(Practitioner-Dermatologist)
* organization = Reference(Organization-DermatologyClinic)
* code = $cz-nrzp_povolani#L00 "Lekar"
* specialty[0].coding[0].system = "https://ncez.mzcr.cz/terminology/CodeSystem/vzp-smluvni-odbornost"
* specialty[0].coding[0].code = #404
* specialty[0].text = "Dermatovenerologie"

Instance: DermatologyServiceRequest-Urgent
InstanceOf: KOrderServiceRequestCz
Usage: #example
* id = "DermatologyServiceRequest-Urgent"
* identifier[0].value = "KORD-DERM-2026-0001"
* status = #active
* intent = #order
* priority = #urgent
* authoredOn = "2026-09-02T09:10:00+02:00"
* subject = Reference(Patient-Novak-Petr)
* requester = Reference(Practitioner-Author-detail)
* performer[0] = Reference(PractitionerRole-Dermatologist)
* category[0].coding[0].system = "https://ncez.mzcr.cz/fhir/korder/category"
* category[0].coding[0].code = #CONSULT
* code.coding[0] = $sctCZ#185387006
* code.text = "Urgentni dermatologicke konziliarni vysetreni"
* reasonReference[0] = Reference(DermatologyCondition-PigmentedLesion)
* bodySite[0].coding[0] = $sct#77568009
* bodySite[0].text = "Kuže zad"
* note[0].text = "Rychla zmena velikosti a pigmentace; prilozena fotodokumentace s oznacenim lokalizace."

Instance: DermatologyLesionPhoto
InstanceOf: CZ_Attachment
Usage: #example
* id = "DermatologyLesionPhoto"
* status = #current
* subject = Reference(Patient-Novak-Petr)
* type.text = "Klinicka fotodokumentace pigmentoveho utvaru"
* content[0].attachment.contentType = #image/jpeg
* content[0].attachment.url = "https://example.cz/fhir/Binary/dermatology-lesion-photo"
* content[0].attachment.title = "Pigmentovy utvar na zadech - klinicka fotografie"
* content[0].attachment.creation = "2026-09-02T09:05:00+02:00"
* context.related[0] = Reference(DermatologyServiceRequest-Urgent)

Instance: DermatologyCompositionExample
InstanceOf: KOrderCompositionCz
Usage: #example
* id = "DermatologyCompositionExample"
* status = #final
* date = "2026-09-02T09:15:00+02:00"
* title = "Urgentni dermatologicka zadanka pro pigmentovy utvar"
* type = $loinc#57133-1
* subject = Reference(Patient-Novak-Petr)
* author[0] = Reference(Practitioner-Author-detail)
* identifier.value = "KORD-DERM-COMP-2026-0001"
* section[coverage].entry[0] = Reference(KOrderCoverage-Example)
* section[orderInformation].entry[0] = Reference(DermatologyServiceRequest-Urgent)
* section[differentialDiagnosis].entry[0] = Reference(DermatologyCondition-PigmentedLesion)
* section[attachments].entry[0] = Reference(DermatologyLesionPhoto)

Instance: BundleDermatologyUrgentExample
InstanceOf: BundleOrderCz
Usage: #example
* id = "BundleDermatologyUrgentExample"
* type = #document
* timestamp = "2026-09-02T09:15:00+02:00"
* identifier.system = "https://hospital.example.cz/korder"
* identifier.value = "KORD-DERM-2026-0001"
* entry[0].fullUrl = "https://example.cz/fhir/Composition/DermatologyCompositionExample"
* entry[0].resource = DermatologyCompositionExample
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
* entry[+].fullUrl = "https://example.cz/fhir/Condition/DermatologyCondition-PigmentedLesion"
* entry[=].resource = DermatologyCondition-PigmentedLesion
* entry[+].fullUrl = "https://example.cz/fhir/Practitioner/Practitioner-Dermatologist"
* entry[=].resource = Practitioner-Dermatologist
* entry[+].fullUrl = "https://example.cz/fhir/PractitionerRole/PractitionerRole-Dermatologist"
* entry[=].resource = PractitionerRole-Dermatologist
* entry[+].fullUrl = "https://example.cz/fhir/Organization/Organization-DermatologyClinic"
* entry[=].resource = Organization-DermatologyClinic
* entry[+].fullUrl = "https://example.cz/fhir/ServiceRequest/DermatologyServiceRequest-Urgent"
* entry[=].resource = DermatologyServiceRequest-Urgent
* entry[+].fullUrl = "https://example.cz/fhir/DocumentReference/DermatologyLesionPhoto"
* entry[=].resource = DermatologyLesionPhoto

// ------------------------- Example 3: nephrology handover -------------------------
Instance: NephrologyCondition-CKDStage4
InstanceOf: CZ_ConditionCore
Usage: #example
* id = "NephrologyCondition-CKDStage4"
* subject = Reference(Patient-Novak-Petr)
* code.coding[0] = $mkn10#N18.4
* code.text = "Chronicke onemocneni ledvin, stadium 4"

Instance: Practitioner-Nephrologist
InstanceOf: CZ_PractitionerCore
Usage: #example
* id = "Practitioner-Nephrologist"
* name.text = "MUDr. Jan Svoboda"
* name.family = "Svoboda"
* name.given[0] = "Jan"

Instance: Organization-NephrologyClinic
InstanceOf: CZ_OrganizationCore
Usage: #example
* id = "Organization-NephrologyClinic"
* identifier[0].system = $cz-organization-ico
* identifier[0].value = "12345679"
* name = "Nemocnice Demo, a.s. - nefrologicka ambulance"
* partOf = Reference(Organization-1) "Nemocnice Demo, a.s."

Instance: PractitionerRole-Nephrologist
InstanceOf: CZ_PractitionerRoleOrder
Usage: #example
* id = "PractitionerRole-Nephrologist"
* practitioner = Reference(Practitioner-Nephrologist)
* organization = Reference(Organization-NephrologyClinic)
* code = $cz-nrzp_povolani#L00 "Lekar"
* specialty[0].coding[0].system = "https://ncez.mzcr.cz/terminology/CodeSystem/vzp-smluvni-odbornost"
* specialty[0].coding[0].code = #108
* specialty[0].text = "Nefrologie"

Instance: Observation-eGFRExample
InstanceOf: CZ_ObservationOrder
Usage: #example
* id = "Observation-eGFRExample"
* status = #final
* subject = Reference(Patient-Novak-Petr)
* category[0].coding[0].system = "http://terminology.hl7.org/CodeSystem/observation-category"
* category[0].coding[0].code = #laboratory
* effectiveDateTime = "2026-08-28T08:30:00+02:00"
* code.coding[LOINC] = $loinc#62238-1
* code.text = "eGFR"
* valueQuantity.value = 24
* valueQuantity.unit = "mL/min/1.73 m2"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #mL/min/{1.73_m2}

Instance: Observation-CreatinineExample
InstanceOf: CZ_ObservationOrder
Usage: #example
* id = "Observation-CreatinineExample"
* status = #final
* subject = Reference(Patient-Novak-Petr)
* category[0].coding[0].system = "http://terminology.hl7.org/CodeSystem/observation-category"
* category[0].coding[0].code = #laboratory
* effectiveDateTime = "2026-08-28T08:30:00+02:00"
* code.coding[LOINC] = $loinc#2160-0
* code.text = "Kreatinin v seru"
* valueQuantity.value = 245
* valueQuantity.unit = "umol/L"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #umol/L

Instance: NephrologyServiceRequest-Handover
InstanceOf: KOrderServiceRequestCz
Usage: #example
* id = "NephrologyServiceRequest-Handover"
* identifier[0].value = "KORD-NEPH-2026-0001"
* status = #active
* intent = #order
* authoredOn = "2026-09-02T10:00:00+02:00"
* subject = Reference(Patient-Novak-Petr)
* requester = Reference(Practitioner-Author-detail)
* performer[0] = Reference(PractitionerRole-Nephrologist)
* category[0].coding[0].system = "https://ncez.mzcr.cz/fhir/korder/category"
* category[0].coding[0].code = #CONSULT
* code.coding[0] = $sctCZ#185387006
* code.text = "Nefrologicke konziliarni vysetreni a prevzeti do pece"
* reasonReference[0] = Reference(NephrologyCondition-CKDStage4)
* supportingInfo[0] = Reference(Observation-eGFRExample)
* supportingInfo[1] = Reference(Observation-CreatinineExample)
* extension[recommendationDisposition].valueCodeableConcept = KOrderRecommendationDispositionCS#ambulatory-care
* note[0].text = "Progrese chronickeho onemocneni ledvin; zadost o prevzeti pacienta do nefrologicke ambulantni pece."

Instance: NephrologyCompositionExample
InstanceOf: KOrderCompositionCz
Usage: #example
* id = "NephrologyCompositionExample"
* status = #final
* date = "2026-09-02T10:05:00+02:00"
* title = "Nefrologicka zadanka pri progresi chronickeho onemocneni ledvin"
* type = $loinc#57133-1
* subject = Reference(Patient-Novak-Petr)
* author[0] = Reference(Practitioner-Author-detail)
* identifier.value = "KORD-NEPH-COMP-2026-0001"
* section[coverage].entry[0] = Reference(KOrderCoverage-Example)
* section[orderInformation].entry[0] = Reference(NephrologyServiceRequest-Handover)
* section[significantMedicalHistory].title = "Relevant medical history"
* section[significantMedicalHistory].entry[0] = Reference(NephrologyCondition-CKDStage4)
* section[supportingInformation].entry[0] = Reference(Observation-eGFRExample)
* section[supportingInformation].entry[1] = Reference(Observation-CreatinineExample)

Instance: BundleNephrologyHandoverExample
InstanceOf: BundleOrderCz
Usage: #example
* id = "BundleNephrologyHandoverExample"
* type = #document
* timestamp = "2026-09-02T10:05:00+02:00"
* identifier.system = "https://hospital.example.cz/korder"
* identifier.value = "KORD-NEPH-2026-0001"
* entry[0].fullUrl = "https://example.cz/fhir/Composition/NephrologyCompositionExample"
* entry[0].resource = NephrologyCompositionExample
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
* entry[+].fullUrl = "https://example.cz/fhir/Practitioner/Practitioner-Nephrologist"
* entry[=].resource = Practitioner-Nephrologist
* entry[+].fullUrl = "https://example.cz/fhir/PractitionerRole/PractitionerRole-Nephrologist"
* entry[=].resource = PractitionerRole-Nephrologist
* entry[+].fullUrl = "https://example.cz/fhir/Organization/Organization-NephrologyClinic"
* entry[=].resource = Organization-NephrologyClinic
* entry[+].fullUrl = "https://example.cz/fhir/ServiceRequest/NephrologyServiceRequest-Handover"
* entry[=].resource = NephrologyServiceRequest-Handover
* entry[+].fullUrl = "https://example.cz/fhir/Observation/Observation-eGFRExample"
* entry[=].resource = Observation-eGFRExample
* entry[+].fullUrl = "https://example.cz/fhir/Observation/Observation-CreatinineExample"
* entry[=].resource = Observation-CreatinineExample
