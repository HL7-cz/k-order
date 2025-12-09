/*// ------------------------- Composition (K-order) -------------------------
Instance: KOrderCompositionExample
InstanceOf: KOrderCompositionCz
Usage: #example
* id = "KOrderCompositionExample"
* status = #final
* date = "2025-02-01T10:15:00+01:00"
* title = "Konziliární žádost – K-order example"
* subject = Reference(Patient-Novak-Petr) "Patient-Novak-Petr"
* author[0] = Reference(Practitioner-Author-detail) "Practitioner-Author-detail"
* section[0].title = "Diagnózy"
* section[0].code.text = "A.2 Diagnózy"
* section[0].entry[0] = Reference(KOrderCondition-Main)
* section[0].entry[1] = Reference(KOrderCondition-Secondary)
* section[1].title = "Požadovaná vyšetření"
* section[1].code.text = "A.4 Požadovaná vyšetření"
* section[1].entry[0] = Reference(KOrderServiceRequest-1)
* section[1].entry[1] = Reference(KOrderServiceRequest-2)

// ------------------------- Conditions ------------------------------------
Instance: KOrderCondition-Main
InstanceOf: KOrderConditionCz
Usage: #example
* id = "KOrderCondition-Main"
* subject = Reference(Patient-Novak-Petr)
* code.coding[+].system = "http://hl7.org/fhir/sid/icd-10"
* code.coding[=].code = "I10"
* code.coding[=].display = "Hypertenze"

Instance: KOrderCondition-Secondary
InstanceOf: KOrderConditionCz
Usage: #example
* id = "KOrderCondition-Secondary"
* subject = Reference(Patient-Novak-Petr)
* code.coding[+].system = "http://hl7.org/fhir/sid/icd-10"
* code.coding[=].code = "E11"
* code.coding[=].display = "Diabetes mellitus 2. typu"

// ------------------------- ServiceRequests --------------------------------
Instance: KOrderServiceRequest-1
InstanceOf: KOrderServiceRequestCz
Usage: #example
* id = "KOrderServiceRequest-1"
* identifier[+].system = "https://hl7.cz/fhir/korder/ids"
* identifier[=].value = "KORD-SR-2025-0001"
* status = #active
* intent = #order
* authoredOn = "2025-02-01T09:50:00+01:00"
* subject = Reference(Patient-Novak-Petr)
* requester = Reference(Practitioner-Author-detail)
* code.text = "Konziliární vyšetření internistou"
* code.coding[+].system = "https://vzp.cz/cis/vykony"
* code.coding[=].code = "09513"
* reasonReference[0] = Reference(KOrderCondition-Main)

Instance: KOrderServiceRequest-2
InstanceOf: KOrderServiceRequestCz
Usage: #example
* id = "KOrderServiceRequest-2"
* identifier[+].system = "https://hl7.cz/fhir/korder/ids"
* identifier[=].value = "KORD-SR-2025-0002"
* status = #active
* intent = #order
* authoredOn = "2025-02-01T09:52:00+01:00"
* subject = Reference(Patient-Novak-Petr)
* requester = Reference(Practitioner-Author-detail)
* code.text = "EKG – kontrolní vyšetření"
* code.coding[+].system = "https://vzp.cz/cis/vykony"
* code.coding[=].code = "08911"

// ------------------------- Coverage ---------------------------------------
Instance: KOrderCoverage-Example
InstanceOf: CZ_Coverage
Usage: #example
* id = "KOrderCoverage-Example"
* status = #active
* beneficiary = Reference(Patient-Novak-Petr)
* payor[0] = Reference(Organization-1) // uses Organization-1 from your examples
* identifier[+].system = "https://ncez.mzcr.cz/fhir/sid/pojistovna"
* identifier[=].value = "111"

// ------------------------- Attachment (DocumentReference) ------------------
Instance: KOrderAttachment-1
InstanceOf: DocumentReference
Usage: #example
* id = "KOrderAttachment-1"
* status = #current
* content[0].attachment.contentType = "application/pdf"
* content[0].attachment.title = "Příloha k žádance"
* content[0].attachment.url = "https://example.cz/files/korder-attachment-1.pdf"

// ------------------------- Bundle (K-Order) -------------------------------
Instance: BundleKOrderExample
InstanceOf: BundleKOrderCz
Usage: #example
* id = "BundleKOrderExample"
* type = #document
* timestamp = "2025-02-01T10:15:00+01:00"
* identifier.system = "https://hospital.example.cz/korder"
* identifier.value = "KORD-2025-000123"

* entry[0].fullUrl = "urn:uuid:KOrderCompositionExample"
* entry[0].resource = Reference(KOrderCompositionExample)

* entry[1].fullUrl = "urn:uuid:Patient-Novak-Petr"
* entry[1].resource = Reference(Patient-Novak-Petr)

* entry[2].fullUrl = "urn:uuid:Practitioner-Author-detail"
* entry[2].resource = Reference(Practitioner-Author-detail)

* entry[3].fullUrl = "urn:uuid:Organization-1"
* entry[3].resource = Reference(Organization-1)

* entry[4].fullUrl = "urn:uuid:KOrderCondition-Main"
* entry[4].resource = Reference(KOrderCondition-Main)

* entry[5].fullUrl = "urn:uuid:KOrderCondition-Secondary"
* entry[5].resource = Reference(KOrderCondition-Secondary)

* entry[6].fullUrl = "urn:uuid:KOrderServiceRequest-1"
* entry[6].resource = Reference(KOrderServiceRequest-1)

* entry[7].fullUrl = "urn:uuid:KOrderServiceRequest-2"
* entry[7].resource = Reference(KOrderServiceRequest-2)

* entry[8].fullUrl = "urn:uuid:KOrderCoverage-Example"
* entry[8].resource = Reference(KOrderCoverage-Example)

* entry[9].fullUrl = "urn:uuid:KOrderAttachment-1"
* entry[9].resource = Reference(KOrderAttachment-1)
*/