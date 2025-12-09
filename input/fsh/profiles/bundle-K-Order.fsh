////////////////////////////////////////////////////////////
// INVARIANTS
////////////////////////////////////////////////////////////

Invariant: one-comp
Description: "A K-Order Bundle SHALL include one and only one Composition."
Expression: "entry.resource.ofType(Composition).count() = 1"
Severity: #error

Invariant: same-servicerequest-performer
Description: "All ServiceRequests SHALL have the same performer."
Expression: "entry.resource.ofType(ServiceRequest).performer.all($this = %context.entry.resource.ofType(ServiceRequest).performer)"
Severity: #warning

Invariant: same-servicerequest-occurrence
Description: "All ServiceRequests SHALL have the same occurrence (dateTime or period)."
Expression: "entry.resource.ofType(ServiceRequest).occurrence.all($this = %context.entry.resource.ofType(ServiceRequest).occurrence)"
Severity: #warning

////////////////////////////////////////////////////////////
// PROFILE
////////////////////////////////////////////////////////////

Profile: BundleKOrderCz
Parent: Bundle
Id: BundleKOrderCz
Title: "Bundle: K-Order (CZ)"
Description: "Clinical document container for Czech K-Order consultation request."

* ^publisher = "HL7 CZ"
* ^purpose = "A structured Czech consultation request bundle containing Composition + related resources."
* . ^short = "K-Order consultation request Bundle"
* . ^definition = "The document Bundle for a K-Order. It SHALL contain exactly one Composition and all referenced resources."

// enforce invariants
* obeys one-comp
* obeys same-servicerequest-performer
* obeys same-servicerequest-occurrence

////////////////////////////////////////////////////////////
// FIXED BUNDLE METADATA
////////////////////////////////////////////////////////////

* type = #document
* type ^short = "This SHALL be a document bundle"

* identifier 1..1
* identifier ^short = "Business identifier of this K-Order document"

* timestamp 1..1
* timestamp ^short = "Timestamp when the bundle was assembled"

// forbid unsupported elements
* total 0..0
* link 0..0

////////////////////////////////////////////////////////////
// ENTRY SLICING
////////////////////////////////////////////////////////////

* entry 1..*
* entry ^slicing.discriminator[0].type = #type
* entry ^slicing.discriminator[0].path = "resource"
* entry ^slicing.discriminator[+].type = #profile
* entry ^slicing.discriminator[=].path = "resource"
* entry ^slicing.rules = #open

* entry contains
    composition 1..1 and
    patient 1..1 and
    serviceRequest 1..* and
    condition 0..* and
    practitioner 0..* and
    practitionerRole 0..* and
    organization 0..* and
    coverage 0..* and
    attachment 0..*

////////////////////////////////////////////////////////////
// RESOURCE BINDINGS
////////////////////////////////////////////////////////////

// Composition
* entry[composition].resource 1..
* entry[composition].resource only KOrderCompositionCz

// Patient
* entry[patient].resource 1..
* entry[patient].resource only CZ_PatientCore

// ServiceRequest (main content)
* entry[serviceRequest].resource only KOrderServiceRequestCz

// Condition
* entry[condition].resource only KOrderConditionCz

// Practitioner
* entry[practitioner].resource only CZ_PractitionerCore

// PractitionerRole
* entry[practitionerRole].resource only CZ_PractitionerRoleCore

// Organization
* entry[organization].resource only CZ_OrganizationCore

// Coverage
* entry[coverage].resource only CZ_Coverage

// Attachments
* entry[attachment].resource only CZ_Attachment

////////////////////////////////////////////////////////////
// SIGNATURE
////////////////////////////////////////////////////////////

* signature 0..1
* signature only CZ_Signature
* signature ^short = "Digital signature of the K-Order"
