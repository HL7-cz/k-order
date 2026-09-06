// ============================================================================
// FT – nové instance (recyklují Patient/Practitioner/Org/Coverage/Condition)
// ============================================================================


// ------------------------- Composition (FT) -------------------------
Instance: FTCompositionExample
InstanceOf: FTOrderCompositionCz
Usage: #example
Description: """
CZ: Composition fyzioterapeutické eŽádanky se čtyřmi požadovanými výkony.
EN: Physiotherapy order Composition with four requested procedures.
"""
* id = "FTCompositionExample"
* status = #final
* date = "2025-10-29T10:15:00+01:00"
* title = "Poukaz FT – eŽádanka (example)"
* subject = Reference(Patient-Novak-Petr)
* author[0] = Reference(Practitioner-Author-detail)
* extension[presentedForm].valueAttachment.contentType = #application/pdf
* extension[presentedForm].valueAttachment.url = "https://example.cz/files/ft-document.pdf"
* type = $loinc#57154-7 "Physical therapy Referral note"
// coverage sekce – recyklujeme existující Coverage
* section[coverage].entry[0] = Reference(KOrderCoverage-Example)

// reasons – společné pro celý poukaz (stav/cíl/rizika)
* section[reasons].text.status = #generated
* section[reasons].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Stav vyžadující FT: B<br/>Cíl, kterého má být dosaženo: C<br/>Rizika / upozornění: D</div>"

// orderInformation – více FT ServiceRequestů
* section[orderInformation].entry[0] = Reference(FTServiceRequest-21113)
* section[orderInformation].entry[1] = Reference(FTServiceRequest-21225)
* section[orderInformation].entry[2] = Reference(FTServiceRequest-21415)
* section[orderInformation].entry[3] = Reference(FTServiceRequest-21413)

// identifier.system je fixed v profilu → nastavuje se jen value
* identifier.value = "FT-COMP-2025-001"


// ============================================================================
// FT – ServiceRequests (1 řádek poukazu = 1 SR)
// ============================================================================

Instance: FTServiceRequest-21113
InstanceOf: FTServiceRequestCz
Usage: #example
Description: """
CZ: Požadavek na fyzioterapeutický výkon MGT, elektro.
EN: Request for the MGT electrotherapy procedure.
"""
* id = "d9f2a8b0-1b9b-4f66-9c53-2f1e5b62d6a1"
* identifier.system = "urn:ietf:rfc:4122"
* identifier.value = "d9f2a8b0-1b9b-4f66-9c53-2f1e5b62d6a1"
* status = #active
* intent = #order
* authoredOn = "2025-10-29T10:00:00+01:00"
* subject = Reference(Patient-Novak-Petr)
* requester = Reference(Practitioner-Author-detail)

// performer recykluj dle potřeby – dávám Organization-1 jako placeholder
* performer[0] = Reference(Organization-1)

* code.coding[0] = $sctCZ#62868009
* code.text = "MGT, elektro"

* quantityQuantity.value = 12
* quantityQuantity.unit = "x"

// volitelně: diagnostické odůvodnění (recyklace existující Condition)
* reasonReference[0] = Reference(KOrderCondition-Main)

// recyklace pojištění
* insurance = Reference(KOrderCoverage-Example)



Instance: FTServiceRequest-21225
InstanceOf: FTServiceRequestCz
Usage: #example
Description: """
CZ: Požadavek na léčebnou tělesnou výchovu.
EN: Request for therapeutic exercise.
"""
* id = "2b7a3e62-3a40-4c65-9c1d-0e4b7b9c2e91"
* identifier.system = "urn:ietf:rfc:4122"
* identifier.value = "2b7a3e62-3a40-4c65-9c1d-0e4b7b9c2e91"
* status = #active
* intent = #order
* authoredOn = "2025-10-29T10:00:30+01:00"
* subject = Reference(Patient-Novak-Petr)
* requester = Reference(Practitioner-Author-detail)
* performer[0] = Reference(Organization-1)

* code.coding[0] = $sctCZ#229065009
* code.text = "LTV"

* quantityQuantity.value = 12
* quantityQuantity.unit = "x"

* reasonReference[0] = Reference(KOrderCondition-Main)
* insurance = Reference(KOrderCoverage-Example)



Instance: FTServiceRequest-21415
InstanceOf: FTServiceRequestCz
Usage: #example
Description: """
CZ: Požadavek na mobilizační fyzioterapeutický výkon.
EN: Request for a mobilization physiotherapy procedure.
"""
* id = "0a6f4d9a-9e7e-4c23-95d3-2f7f7b5b3d55"
* identifier.system = "urn:ietf:rfc:4122"
* identifier.value = "0a6f4d9a-9e7e-4c23-95d3-2f7f7b5b3d55"
* status = #active
* intent = #order
* authoredOn = "2025-10-29T10:01:00+01:00"
* subject = Reference(Patient-Novak-Petr)
* requester = Reference(Practitioner-Author-detail)
* performer[0] = Reference(Organization-1)

* code.coding[0] = $sctCZ#62868009
* code.text = "Mobilizace"

* quantityQuantity.value = 12
* quantityQuantity.unit = "x"

* reasonReference[0] = Reference(KOrderCondition-Main)
* insurance = Reference(KOrderCoverage-Example)



Instance: FTServiceRequest-21413
InstanceOf: FTServiceRequestCz
Usage: #example
Description: """
CZ: Požadavek na manuální terapii.
EN: Request for manual therapy.
"""
* id = "b2e9d1d2-6f3e-4a0b-a4c0-6e2f0f3d9b11"
* identifier.system = "urn:ietf:rfc:4122"
* identifier.value = "b2e9d1d2-6f3e-4a0b-a4c0-6e2f0f3d9b11"
* status = #active
* intent = #order
* authoredOn = "2025-10-29T10:01:30+01:00"
* subject = Reference(Patient-Novak-Petr)
* requester = Reference(Practitioner-Author-detail)
* performer[0] = Reference(Organization-1)

* code.coding[0] = $sctCZ#62868009
* code.text = "MT"

* quantityQuantity.value = 12
* quantityQuantity.unit = "x"

* reasonReference[0] = Reference(KOrderCondition-Main)
* insurance = Reference(KOrderCoverage-Example)


// ============================================================================
// FT – Bundle (document) – recykluje všechny existující resources z K příkladu
// ============================================================================

Instance: BundleFTExample
InstanceOf: BundleOrderCz
Usage: #example
Description: """
CZ: Dokumentový Bundle fyzioterapeutické eŽádanky.
EN: Document Bundle for the physiotherapy order.
"""
* id = "BundleFTExample"
* type = #document
* timestamp = "2025-10-29T10:15:00+01:00"
* identifier.system = "https://hospital.example.cz/ft"
* identifier.value = "FT-2025-000123"

// Composition musí být první
* entry[0].fullUrl = "https://example.cz/fhir/Composition/FTCompositionExample"
* entry[0].resource = FTCompositionExample

// Recyklované resources (NEVYTVÁŘÍM znovu, jen přidávám do Bundle)
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

* entry[+].fullUrl = "https://example.cz/fhir/Coverage/KOrderCoverage-Example"
* entry[=].resource = KOrderCoverage-Example

* entry[+].fullUrl = "https://example.cz/fhir/Condition/KOrderCondition-Main"
* entry[=].resource = KOrderCondition-Main

// Nové FT ServiceRequesty
* entry[+].fullUrl = "https://example.cz/fhir/ServiceRequest/d9f2a8b0-1b9b-4f66-9c53-2f1e5b62d6a1"
* entry[=].resource = FTServiceRequest-21113

* entry[+].fullUrl = "https://example.cz/fhir/ServiceRequest/2b7a3e62-3a40-4c65-9c1d-0e4b7b9c2e91"
* entry[=].resource = FTServiceRequest-21225

* entry[+].fullUrl = "https://example.cz/fhir/ServiceRequest/0a6f4d9a-9e7e-4c23-95d3-2f7f7b5b3d55"
* entry[=].resource = FTServiceRequest-21415

* entry[+].fullUrl = "https://example.cz/fhir/ServiceRequest/b2e9d1d2-6f3e-4a0b-a4c0-6e2f0f3d9b11"
* entry[=].resource = FTServiceRequest-21413
