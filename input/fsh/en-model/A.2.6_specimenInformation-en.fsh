Logical: LMEnSpecimenInformationCz
Id: LMEnSpecimenInformationCz
Title: "A.2.6 - Specimen information"
Description: """Information about the specimen related to the order."""

* ^version = "1.0.0"

* insert SetFmmandStatusRule( 2, trial-use )

* identifier 1..* Identifier "A.2.6.1 - Specimen identifier" """Unique identifier of the specimen within a given context."""
* species 0..1 CodeableConcept "A.2.6.2 - Species" """Biological species of the subject for non-human specimens."""
* material 0..1 CodeableConcept "A.2.6.3 - Material" """Type of specimen material."""
* collectionDateTime 1..1 dateTime "A.2.6.4 - Collection date and time" """Date and time of collection or of completion of collection."""
* transportDateTime 0..1 dateTime "A.2.6.5 - Transport date and time" """Date and time when transport of the specimen started."""
* specimenType 0..1 CodeableConcept "A.2.6.6 - Specimen type" """Type of specimen or collected material."""
* anatomicLocation 0..1 CodeableConcept "A.2.6.7 - Anatomic location" """Collection site including laterality, if applicable."""
* morphology 0..1 CodeableConcept "A.2.6.8 - Morphology" """Morphological abnormality of the collection site."""
* device 0..1 CodeableConcept "A.2.6.9 - Device" """Instrument or device used for collection."""
* collectionMethod 0..1 CodeableConcept "A.2.6.10 - Collection method" """Collection procedure or method."""
* sourceDevice 0..1 CodeableConcept "A.2.6.11 - Source device" """Device from which the specimen originates, if not collected directly from the patient."""
* collectionSite 0..1 CodeableConcept "A.2.6.12 - Collection site" """Location or environment where the material was collected."""
* note 0..1 string "A.2.6.13 - Note" """Free-text note about the specimen."""

* container 0..* Base "A.2.6.14 - Container" """Information about the specimen container."""
* container.type 0..1 CodeableConcept "A.2.6.14.1 - Type" """Type of specimen container including any additives."""
* container.count 0..1 integer "A.2.6.14.2 - Count" """Number of identical containers with the specimen."""
* container.deviceId 1..1 Identifier "A.2.6.14.3 - Device ID" """Machine-readable identifier of the container."""
* container.label 0..1 Identifier "A.2.6.14.4 - Label" """Human-readable identifier of the container."""

* additionalData 0..1 Base "A.2.6.15 - Other formalized data" """Additional formalized data about the specimen."""
* additionalData.date 0..1 date "A.2.6.15.1 - Date" """Date when the data item was determined, if different from the order date."""
* additionalData.code 1..1 CodeableConcept "A.2.6.15.2 - Code" """Code identifying the meaning of the additional data item."""
* additionalData.value 0..1 Narrative "A.2.6.15.3 - Value" """Value of the data item including the unit."""

* collector 0..1 Base "A.2.6.16 - Collector" """Identification of the person or entity who collected the specimen."""
* collector.identifier 1..* Identifier "A.2.6.16.1 - Collector identifier" """Identifier of the specimen collector."""
* collector.name 1..1 HumanName "A.2.6.16.2 - Collector name" """Name of the specimen collector."""
* collector.contact 1..1 ContactPoint "A.2.6.16.3 - Collector contact" """Contact details of the specimen collector."""
* collector.organization 0..1 Base "A.2.6.16.4 - Collector organisation" """Organisation under which the specimen collector acts."""
