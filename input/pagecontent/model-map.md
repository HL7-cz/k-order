This page lists the pages that document, with a graphical representation, the mapping between the logical models and the FHIR profiles used. The English labels use the terminology of the [EHDS Document model](https://build.fhir.org/ig/Xt-EHR/xt-ehr-common/en/StructureDefinition-EHDSDocument.html), including *Subject*, *Author*, *Document type*, *Document title*, *Custodian*, and *Information recipient*.

**Consultation request (K)**

| Logical model section | Logical model | Mapping |
| :--- | :--- | :--- |
| `A.1` Document header | [Header](StructureDefinition-LMEnHeaderOrder.html) | [K-Header-map](K-Header-map.html) |
| `A.2` and `A.3` Document body | [Body](StructureDefinition-LMEnBodyKOrder.html) | [K-Body-map](K-Body-map.html) |
| `A.4` Presented form | [Presented form](StructureDefinition-LMEnPresentedFormOrderCz.html) | [K-Attachment-map](K-Attachment-map.html) |
| `A.5` Attachments | [Attachments](StructureDefinition-LMEnAttachmentsOrderCz.html) | [K-Attachment-map](K-Attachment-map.html) |

**Physiotherapy request (FT)**

| Logical model section | Logical model | Mapping |
| :--- | :--- | :--- |
| `A.1` Document header | [Header](StructureDefinition-LMEnHeaderOrder.html) | [FT-Header-map](FT-Header-map.html) |
| `A.2` and `A.3` Document body | [Body](StructureDefinition-LMEnBodyFTOrder.html) | [FT-Body-map](FT-Body-map.html) |
| `A.4` Presented form | [Presented form](StructureDefinition-LMEnPresentedFormOrderCz.html) | [FT-Attachment-map](FT-Attachment-map.html) |
| `A.5` Attachments | [Attachments](StructureDefinition-LMEnAttachmentsOrderCz.html) | [FT-Attachment-map](FT-Attachment-map.html) |
