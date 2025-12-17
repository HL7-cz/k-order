Profile: KOrderCompositionCz
Parent: Composition
Id: KOrderCompositionCz
Title: "Composition: K-order (Žádanka) (CZ)"
Description: """
K-order Composition (žádanka) pro národní IG (CZ).
Kompozice slouží jako dokumentový kontejner nad ServiceRequest (KOrderServiceRequestCz),
Patient, Coverage (pojištění), Condition (diagnózy) a DocumentReference (přílohy).
Sekce poskytují čitelný přehled a odkazují na příslušné resources obsažené v Bundle.
"""
* ^publisher = "HL7 CZ"
* ^copyright = "HL7 CZ"
* . ^short = "K-order composition"
* . ^definition = """
K-order composition (žádanka). Composition definuje strukturu dokumentu. 
Plný obsah dokumentu je obsažen v Bundle, kde je Composition prvním resourcem.
Pole section.text by mělo obsahovat textovou reprezentaci všech uvedených entry.
"""

// --------------------------- general rules / metadata -------------------------
* insert SetFmmandStatusRule ( 0, draft )

* meta
  * security 0..* MS

* identifier 1..1 MS
* identifier.system = "urn:ietf:rfc:4122"


// --------------------------- extensions -------------------------------------
* extension contains DocumentPresentedForm named presentedForm 1..*
* extension[presentedForm] ^short = "Presented form"
* extension[presentedForm].valueAttachment
  * contentType
    * ^example[0].label = "pdf"
    * ^example[0].valueCode  = $mime#application/pdf
  * data ^short = "B64 in-line data"
  * url ^short = "URL of the document"

* extension contains
    $information-recipient-url  named informationRecipient 0..*
* extension[informationRecipient].valueReference only Reference(CZ_PractitionerCore or CZ_DeviceObserver or CZ_PatientCore or CZ_RelatedPersonCore or CZ_PractitionerRoleCore or CZ_OrganizationCore)


// --------------------------- lifecycle / status ------------------------------
* status 1..1 MS
* status = #final (exactly)
* title 1..1 MS
* date 1..1 MS


// --------------------------- subject / custodian / author --------------------
* subject 1..1 MS
* subject only Reference(CZ_PatientCore)

* custodian 0..1 MS
* custodian only Reference(CZ_OrganizationCore)

* author 1..* MS
* author only Reference(
    CZ_PractitionerCore
  or CZ_PractitionerRoleCore
  or CZ_DeviceObserver
  or CZ_OrganizationCore
)
* author ^short = "Who/what authored the K-order"


// --------------------------- attester ---------------------------------------
* attester 0..* MS
* attester ^slicing.discriminator.type = #value
* attester ^slicing.discriminator.path = "mode"
* attester ^slicing.rules = #open
* attester ^slicing.ordered = false

* attester.party only Reference(CZ_PractitionerCore or CZ_PractitionerRoleCore or CZ_OrganizationCore)

* attester contains
    legalAuthenticator 0..1 and
    resultValidator 0..1

* attester[legalAuthenticator]
  * mode 1..1 MS
  * mode = #legal
  * party only Reference(CZ_PractitionerRoleCore)

* attester[resultValidator]
  * mode 1..1 MS
  * mode = #professional
  * party only Reference(CZ_PractitionerRoleCore)


// --------------------------- event (optional) -------------------------------
* event.code
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "coding"
  * ^slicing.rules = #open
  * ^slicing.ordered = false


// --------------------------- encounter / context ----------------------------
* encounter 0..1
* encounter only Reference(CZ_Encounter)

/*
// --------------------------- invariant: text-or-section ----------------------
Invariant: text-or-section
Description: "A Composition SHALL have either text, at least one section, or both."
Expression: "text.exists() or section.exists()"
Severity: #error
*/
// --------------------------- section slicing --------------------------------
* section 1..* MS
* section ^slicing.discriminator.type = #pattern
* section ^slicing.discriminator.path = "code"
* section ^slicing.rules = #open
* section ^slicing.ordered = false

// --------------------------- section contains (UNIFIED) ----------------------
* section contains
    insurance 0..1 and
    reasons 0..1 and
    examinations 1..1 and
    attachments 0..* and
    signature 0..1 and
    replacement 0..1


// --------------------------- section definitions ----------------------------

// Insurance
* section[insurance].code = $loinc#48768-6
* section[insurance].title = "Insurance"
* section[insurance].entry 1..1
* section[insurance].entry only Reference(CZ_Coverage)


/* Diagnoses
* section[diagnoses].code = $loinc#11450-4
* section[diagnoses].title = "Diagnoses"
* section[diagnoses].entry 1..*
* section[diagnoses].entry only Reference(KOrderConditionCz)
*/
// Reasons
* section[reasons].code = $loinc#29299-5
* section[reasons].title = "Clinical justification"
* section[reasons].text 0..1 MS
* section[reasons].entry 0..0

// Examinations
* section[examinations].code = $loinc#57133-1
* section[examinations].title = "Requested examinations"
* section[examinations].entry 1..*
* section[examinations].entry only Reference(KOrderServiceRequestCz)

// Attachments
* section[attachments].code = $loinc#55107-7
* section[attachments].title = "Attachments"
* section[attachments].entry 0..*
* section[attachments].entry only Reference(CZ_Attachment)

// Signature
* section[signature].code = $loinc#64292-6
* section[signature].title = "Signature"
* section[signature].entry 0..1
* section[signature].entry only Reference(CZ_Provenance)




// --------------------------- section-level author rule -----------------------
* section.author only Reference(CZ_PractitionerCore or CZ_PractitionerRoleCore or CZ_DeviceObserver or CZ_PatientCore or CZ_RelatedPersonCore or CZ_OrganizationCore)


// --------------------------- helper Extension definition ---------------------
Extension: KOrderRequestReference
Id: korder-composition-requestReference
Title: "K-order Request Reference"
Description: """
Reference to the K-order ServiceRequest instance(s) that the Composition documents.
"""
* insert ExtensionContext(Composition)
* insert SetFmmandStatusRule ( 2, trial-use)
* value[x] only Reference(KOrderServiceRequestCz)
