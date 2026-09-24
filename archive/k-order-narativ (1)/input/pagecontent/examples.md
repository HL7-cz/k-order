### Examples of the consultation order

Examples of instances are published in this guide. Funkční specifikace eŽádanky K states the same examples under the same names and in the same order, but without their content.

| Example | What it demonstrates | Instance |
|---|---|---|
| Cardiology consultation for exertional dyspnoea | A non-addressed eReferral with several requested services in one document, a consultation examination and an echocardiography, and with an additional recipient of the result. The general practitioner asks for an assessment of whether the worsening exertional dyspnoea is of cardiac origin. | [BundleKOrderExample](Bundle-BundleKOrderExample.html) |
| Dermatology consultation for a suspect pigmented lesion | An addressed eReferral with increased urgency and with an image attachment that supplements the structured content. The general practitioner sends a patient with a rapidly changing pigmented lesion to a specific pigmented lesion clinic. | [BundleDermatologyUrgentExample](Bundle-BundleDermatologyUrgentExample.html) |
| Nephrology consultation on the progression of chronic kidney disease | An eReferral in the scenario of recommending that the patient be taken into care, that is not a one-off assessment. It carries the creatinine and eGFR values as supporting clinical information. | [BundleNephrologyHandoverExample](Bundle-BundleNephrologyHandoverExample.html) |

### Examples of the physiotherapy order

| Example | What it demonstrates | Instance |
|---|---|---|
| Rehabilitation after total hip replacement | A non-addressed eReferral in a patient with reduced mobility and an implant. The eReferral carries the date of the operation, the permitted load on the operated limb, the type of the implant and the reduced mobility of the patient. | in preparation |
| Respiratory physiotherapy in a patient with chronic obstructive pulmonary disease | A fully completed referral form with the number of procedures and with care at the patient's place of stay. The specific procedures are stated, ten procedures, twice a week, the therapy is performed at the patient's home. | in preparation |
| Physiotherapy in a paediatric patient with faulty posture | A partially completed referral form where the scope of care is proposed by the physiotherapist. Only the diagnosis and the goal of the therapy are stated, neither the specific procedures nor their number are filled in. A legal representative is part of the eReferral. | in preparation |

The examples correspond to Table 7 of Funkční specifikace eŽádanky FT. Until they are delivered, the guide publishes the technical example [BundleFTExample](Bundle-BundleFTExample.html), which shows the detailed model of prescription: one requested procedure corresponds to one requested service resource.

All the examples can also be found on the [Artifacts](artifacts.html) page.

### Examples of profiles

* [Composition of the consultation order](Composition-KOrderCompositionExample.html)
* [Composition of the physiotherapy order](Composition-FTCompositionExample.html)
* [Requested service – consultation examination](ServiceRequest-KOrderServiceRequest-1.html)
* [Requested service – physiotherapy procedure](ServiceRequest-d9f2a8b0-1b9b-4f66-9c53-2f1e5b62d6a1.html)
* [Patient](Patient-48a9d440-4194-42c1-87ad-b5a39020a4d0.html)
* [Practitioner](Practitioner-a81e74c9-fe94-4eb1-9233-4c8f0b2d4e3a.html)
* [Practitioner role](PractitionerRole-2b7e9637-5018-4542-9faf-d5abdee7b849.html)
* [Healthcare provider](Organization-ace081ba-e0a8-4b89-a4a7-c5b7cd3c8169.html)
* [Subordinate department of a provider](Organization-af2b3114-e872-43b9-9875-cceb39122f7f.html)
* [Health insurance company](Organization-Organization-Insurance111.html)
* [Coverage](Coverage-KOrderCoverage-Example.html)
* [Indicating diagnosis](Condition-KOrderCondition-Main.html)
* [Observation – creatinine](Observation-Observation-CreatinineExample.html)
* [Attachment – clinical photo documentation](DocumentReference-DermatologyLesionPhoto.html)
