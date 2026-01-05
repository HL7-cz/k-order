// ============================================================================
// FT – nové instance (recyklují Patient/Practitioner/Org/Coverage/Condition)
// ============================================================================


// ------------------------- Composition (FT) -------------------------
Instance: FTCompositionExample
InstanceOf: KOrderCompositionCz
Usage: #example
* id = "FTCompositionExample"
* status = #final
* date = "2025-10-29T10:15:00+01:00"
* title = "Poukaz FT – eŽádanka (example)"
* subject = Reference(Patient-Novak-Petr)
* author[0] = Reference(Practitioner-Author-detail)

// insurance sekce – recyklujeme existující Coverage
* section[insurance].entry[0] = Reference(KOrderCoverage-Example)

// reasons – společné pro celý poukaz (stav/cíl/rizika)
* section[reasons].text.status = #generated
* section[reasons].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Stav vyžadující FT: B<br/>Cíl, kterého má být dosaženo: C<br/>Rizika / upozornění: D</div>"

// examinations – více FT ServiceRequestů
* section[examinations].entry[0] = Reference(FTServiceRequest-21113)
* section[examinations].entry[1] = Reference(FTServiceRequest-21225)
* section[examinations].entry[2] = Reference(FTServiceRequest-21415)
* section[examinations].entry[3] = Reference(FTServiceRequest-21413)

// identifier.system je fixed v profilu → nastavuje se jen value
* identifier.value = "FT-COMP-2025-001"

// Type – FT dokument (nový typový systém)
* type.coding[0].system = "https://ncez.mzcr.cz/fhir/ft/type"
* type.coding[0].code = #FT
* type.coding[0].display = "Žádanka fyzioterapie (FT)"


// ============================================================================
// FT – ServiceRequests (1 řádek poukazu = 1 SR)
// ============================================================================

Instance: FTServiceRequest-21113
InstanceOf: FTServiceRequestCz
Usage: #example
* id = "FTServiceRequest-21113"
* identifier.system = "urn:ietf:rfc:4122"
* identifier.value = "d9f2a8b0-1b9b-4f66-9c53-2f1e5b62d6a1"
* status = #active
* intent = #order
* authoredOn = "2025-10-29T10:00:00+01:00"
* subject = Reference(Patient-Novak-Petr)
* requester = Reference(Practitioner-Author-detail)

// performer recykluj dle potřeby – dávám Organization-1 jako placeholder
* performer[0] = Reference(Organization-1)

* category[0].coding[0].system = "https://ncez.mzcr.cz/fhir/ft/category"
* category[0].coding[0].code = #FT
* category[0].coding[0].display = "Fyzioterapie"

* code.coding[0].system = "urn:oid:1.2.203.7898.1.5"
* code.coding[0].code = #21113
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
* id = "FTServiceRequest-21225"
* identifier.system = "urn:ietf:rfc:4122"
* identifier.value = "2b7a3e62-3a40-4c65-9c1d-0e4b7b9c2e91"
* status = #active
* intent = #order
* authoredOn = "2025-10-29T10:00:30+01:00"
* subject = Reference(Patient-Novak-Petr)
* requester = Reference(Practitioner-Author-detail)
* performer[0] = Reference(Organization-1)

* category[0].coding[0].system = "https://ncez.mzcr.cz/fhir/ft/category"
* category[0].coding[0].code = #FT
* category[0].coding[0].display = "Fyzioterapie"

* code.coding[0].system = "urn:oid:1.2.203.7898.1.5"
* code.coding[0].code = #21225
* code.text = "LTV"

* quantityQuantity.value = 12
* quantityQuantity.unit = "x"

* reasonReference[0] = Reference(KOrderCondition-Main)
* insurance = Reference(KOrderCoverage-Example)



Instance: FTServiceRequest-21415
InstanceOf: FTServiceRequestCz
Usage: #example
* id = "FTServiceRequest-21415"
* identifier.system = "urn:ietf:rfc:4122"
* identifier.value = "0a6f4d9a-9e7e-4c23-95d3-2f7f7b5b3d55"
* status = #active
* intent = #order
* authoredOn = "2025-10-29T10:01:00+01:00"
* subject = Reference(Patient-Novak-Petr)
* requester = Reference(Practitioner-Author-detail)
* performer[0] = Reference(Organization-1)

* category[0].coding[0].system = "https://ncez.mzcr.cz/fhir/ft/category"
* category[0].coding[0].code = #FT
* category[0].coding[0].display = "Fyzioterapie"

* code.coding[0].system = "urn:oid:1.2.203.7898.1.5"
* code.coding[0].code = #21415
* code.text = "Mobilizace"

* quantityQuantity.value = 12
* quantityQuantity.unit = "x"

* reasonReference[0] = Reference(KOrderCondition-Main)
* insurance = Reference(KOrderCoverage-Example)



Instance: FTServiceRequest-21413
InstanceOf: FTServiceRequestCz
Usage: #example
* id = "FTServiceRequest-21413"
* identifier.system = "urn:ietf:rfc:4122"
* identifier.value = "b2e9d1d2-6f3e-4a0b-a4c0-6e2f0f3d9b11"
* status = #active
* intent = #order
* authoredOn = "2025-10-29T10:01:30+01:00"
* subject = Reference(Patient-Novak-Petr)
* requester = Reference(Practitioner-Author-detail)
* performer[0] = Reference(Organization-1)

* category[0].coding[0].system = "https://ncez.mzcr.cz/fhir/ft/category"
* category[0].coding[0].code = #FT
* category[0].coding[0].display = "Fyzioterapie"

* code.coding[0].system = "urn:oid:1.2.203.7898.1.5"
* code.coding[0].code = #21413
* code.text = "MT"

* quantityQuantity.value = 12
* quantityQuantity.unit = "x"

* reasonReference[0] = Reference(KOrderCondition-Main)
* insurance = Reference(KOrderCoverage-Example)


// ============================================================================
// FT – Bundle (document) – recykluje všechny existující resources z K příkladu
// ============================================================================

Instance: BundleFTExample
InstanceOf: BundleKOrderCz
Usage: #example
* id = "BundleFTExample"
* type = #document
* timestamp = "2025-10-29T10:15:00+01:00"
* identifier.system = "https://hospital.example.cz/ft"
* identifier.value = "FT-2025-000123"

// Composition musí být první
* entry[0].fullUrl = "urn:uuid:FTCompositionExample"
* entry[0].resource = FTCompositionExample

// Recyklované resources (NEVYTVÁŘÍM znovu, jen přidávám do Bundle)
* entry[+].fullUrl = "urn:uuid:Patient-Novak-Petr"
* entry[+].resource = Patient-Novak-Petr

* entry[+].fullUrl = "urn:uuid:Practitioner-Author-detail"
* entry[+].resource = Practitioner-Author-detail

* entry[+].fullUrl = "urn:uuid:ace081ba-e0a8-4b89-a4a7-c5b7cd3c8169"
* entry[+].resource = Organization-1

* entry[+].fullUrl = "urn:uuid:KOrderCoverage-Example"
* entry[+].resource = KOrderCoverage-Example

* entry[+].fullUrl = "urn:uuid:KOrderCondition-Main"
* entry[+].resource = KOrderCondition-Main

// Nové FT ServiceRequesty
* entry[+].fullUrl = "urn:uuid:FTServiceRequest-21113"
* entry[+].resource = FTServiceRequest-21113

* entry[+].fullUrl = "urn:uuid:FTServiceRequest-21225"
* entry[+].resource = FTServiceRequest-21225

* entry[+].fullUrl = "urn:uuid:FTServiceRequest-21415"
* entry[+].resource = FTServiceRequest-21415

* entry[+].fullUrl = "urn:uuid:FTServiceRequest-21413"
* entry[+].resource = FTServiceRequest-21413
