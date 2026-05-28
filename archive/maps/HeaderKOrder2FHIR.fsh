
Instance: LabOrderHeader2FHIRcz-cz
InstanceOf: ConceptMap
Usage: #definition
* url = "https://hl7.cz/fhir/k-order/ConceptMap/KOrderHeader2FHIRcz-cz"
* name = "KOrderHeader2FHIRcz"
* title = "CZ Header Model to this guide Map"
* status = #draft
* experimental = true
* description = """CZ Laboratory Order Header Model to this guide mapping"""
				
* group[+].source = "https://hl7.cz/fhir/k-order/StructureDefinition/SubjectKOrderCz"
* group[=].target = "https://hl7.cz/fhir/core/StructureDefinition/cz-patient-core"
* group[=].element[+].code = #Subject.identification					
* group[=].element[=].display = "A.1.1 Identification of the patient/subject"					
* group[=].element[=].target.code = #Patient					
* group[=].element[=].target.display = ""					
* group[=].element[=].target.equivalence = #relatedto	
* group[=].element[+].code = #Subject.identification.givenName					
* group[=].element[=].display = "A.1.1.1 Given name"					
* group[=].element[=].target.code = #Patient.name.given					
* group[=].element[=].target.display = ""					
* group[=].element[=].target.equivalence = #equivalent				
* group[=].element[+].code = #Subject.identification.familyName					
* group[=].element[=].display = "A.1.1.2 Familyname/surname"					
* group[=].element[=].target.code = #Patient.name.family					
* group[=].element[=].target.display = ""					
* group[=].element[=].target.equivalence = #equivalent					
* group[=].element[+].code = #Subject.identification.dateOfBirth					
* group[=].element[=].display = "A.1.1.3 Date of birth"					
* group[=].element[=].target.code = #Patient.birthDate					
* group[=].element[=].target.display = ""					
* group[=].element[=].target.equivalence = #equivalent		
* group[=].element[+].code = #Subject.identification.dateOfDeath					
* group[=].element[=].display = "A.1.1.4 Date of death"					
* group[=].element[=].target.code = #Patient.deceased[x].deceasedDateTime					
* group[=].element[=].target.display = ""					
* group[=].element[=].target.equivalence = #equivalent			
* group[=].element[+].code = #Subject.identification.identifier					
* group[=].element[=].display = "A.1.1.5 Patient identifier"					
* group[=].element[=].target.code = #Patient.identifier					
* group[=].element[=].target.display = ""					
* group[=].element[=].target.equivalence = #equivalent	
* group[=].element[+].code = #Subject.identification.citizenship					
* group[=].element[=].display = "A.1.1.6 Citizenship"					
* group[=].element[=].target.code = #Patient.patient-citizenship					
* group[=].element[=].target.display = ""					
* group[=].element[=].target.equivalence = #equivalent	
* group[=].element[+].code = #Subject.identification.gender					
* group[=].element[=].display = "A.1.1.7 Gender"					
* group[=].element[=].target.code = #Patient.gender					
* group[=].element[=].target.display = ""					
* group[=].element[=].target.equivalence = #equivalent	
* group[=].element[+].code = #Subject.identification.genderForClinicalUse					
* group[=].element[=].display = "A.1.1.8 Gender"					
* group[=].element[=].target.code = #Patient.extension:sex-for-clinical-use					
* group[=].element[=].target.display = ""					
* group[=].element[=].target.equivalence = #equivalent	
* group[=].element[+].code = #Subject.identification.languageOfCommunication					
* group[=].element[=].display = "A.1.1.9 Language of communication"					
* group[=].element[=].target.code = #Patient.communication.language					
* group[=].element[=].target.display = ""					
* group[=].element[=].target.equivalence = #equivalent
* group[=].element[+].code = #Subject.identification.handicap					
* group[=].element[=].display = "A.1.1.10 Handicap"					
* group[=].element[=].target.code = #Patient.text					
* group[=].element[=].target.display = ""					
* group[=].element[=].target.equivalence = #equivalent
* group[=].element[+].code = #Subject.contactInfo					
* group[=].element[=].display = "A.1.2 Patient/subject related contact information"					
* group[=].element[=].target.code = #Patient					
* group[=].element[=].target.display = ""					
* group[=].element[=].target.equivalence = #relatedto					
* group[=].element[+].code = #Subject.contactInfo.address					
* group[=].element[=].display = "A.1.2.1 Address"					
* group[=].element[=].target.code = #Patient.address					
* group[=].element[=].target.display = ""					
* group[=].element[=].target.equivalence = #equivalent					
* group[=].element[+].code = #Subject.contactInfo.telecom					
* group[=].element[=].display = "A.1.2.2 Telecom"					
* group[=].element[=].target.code = #Patient.telecom					
* group[=].element[=].target.display = ""					
* group[=].element[=].target.equivalence = #equivalent					
* group[=].element[+].code = #Subject.contactInfo.preferedPhysician					
* group[=].element[=].display = "A.1.2.3 Prefered physician"					
* group[=].element[=].target.code = #Patient.generalPractitioner					
* group[=].element[=].target.display = ""					
* group[=].element[=].target.equivalence = #equivalent
* group[=].element[+].code = #Subject.contactInfo.legalRepresent					
* group[=].element[=].display = "A.1.2.4 Legal representatives and other contact persons"					
* group[=].element[=].target.code = #Patient.contact				
* group[=].element[=].target.display = ""					
* group[=].element[=].target.equivalence = #equivalent	
* group[=].element[+].code = #Subject.contactInfo.legalRepresent.type					
* group[=].element[=].display = "A.1.2.4.1 Contact type"					
* group[=].element[=].target.code = #Patient.contact.relationship					
* group[=].element[=].target.display = ""					
* group[=].element[=].target.equivalence = #relatedto	
* group[=].element[+].code = #Subject.contactInfo.legalRepresent.relationToSubject					
* group[=].element[=].display = "A.1.2.4.2 Relationship to the patient"					
* group[=].element[=].target.code = #Patient.contact.relationship					
* group[=].element[=].target.display = ""					
* group[=].element[=].target.equivalence = #equivalent	
* group[=].element[+].code = #Subject.contactInfo.legalRepresent.identifier					
* group[=].element[=].display = "A.1.2.4.3 Person identifier"					
* group[=].element[=].target.code = #Patient.contact				
* group[=].element[=].target.display = ""					
* group[=].element[=].target.equivalence = #relatedto	
* group[=].element[+].code = #Subject.contactInfo.legalRepresent.givenName					
* group[=].element[=].display = "A.1.2.4.4 Given name"					
* group[=].element[=].target.code = #Patient.contact.name.given					
* group[=].element[=].target.display = ""					
* group[=].element[=].target.equivalence = #equivalent	
* group[=].element[+].code = #Subject.contactInfo.legalRepresent.familyName					
* group[=].element[=].display = "A.1.2.4.5 Family name/surname"					
* group[=].element[=].target.code = #Patient.contact.name.family					
* group[=].element[=].target.display = ""					
* group[=].element[=].target.equivalence = #equivalent	
* group[=].element[+].code = #Subject.contactInfo.legalRepresent.address					
* group[=].element[=].display = "A.1.2.4.6 Contact person address"					
* group[=].element[=].target.code = #Patient.contact.address				
* group[=].element[=].target.display = ""					
* group[=].element[=].target.equivalence = #equivalent	
* group[=].element[+].code = #Subject.contactInfo.legalRepresent.telecom					
* group[=].element[=].display = "A.1.2.4.7 Telecom"					
* group[=].element[=].target.code = #Patient.contact.telecom					
* group[=].element[=].target.display = ""					
* group[=].element[=].target.equivalence = #equivalent	
* group[+].source = "https://hl7.cz/fhir/k-order/StructureDefinition/SubjectKOrderCz"					
* group[=].target = "https://hl7.cz/fhir/core/StructureDefinition/cz-practitioner-core"	
* group[=].element[+].code = #Subject.contactInfo.preferedPhysician					
* group[=].element[=].display = "A.1.2.3 Prefered physician"					
* group[=].element[=].target.code = #Practitioner					
* group[=].element[=].target.display = ""					
* group[=].element[=].target.equivalence = #equivalent
* group[=].element[+].code = #Subject.contactInfo.preferedPhysician.Identifier		
* group[=].element[=].display = "A.1.2.3.1 Identification of the prefered physician"					
* group[=].element[=].target.code = #Practitioner.identifier					
* group[=].element[=].target.display = ""					
* group[=].element[=].target.equivalence = #equivalent		
* group[=].element[+].code = #Subject.contactInfo.preferedPhysician.Name		
* group[=].element[=].display = "A.1.2.3.2 Name of the prefered physician"					
* group[=].element[=].target.code = #Practitioner.name					
* group[=].element[=].target.display = ""					
* group[=].element[=].target.equivalence = #equivalent		
* group[=].element[+].code = #Subject.contactInfo.preferedPhysician.telecom		
* group[=].element[=].display = "A.1.2.3.6 Telecom"					
* group[=].element[=].target.code = #Practitioner.telecom					
* group[=].element[=].target.display = ""					
* group[=].element[=].target.equivalence = #equivalent		
* group[+].source = "https://hl7.cz/fhir/k-order/StructureDefinition/SubjectKOrderCz"					
* group[=].target = "https://hl7.cz/fhir/core/StructureDefinition/cz-practitionerrole-core"	
* group[=].element[+].code = #Subject.contactInfo.preferedPhysician					
* group[=].element[=].display = "A.1.2.3 Prefered physician"					
* group[=].element[=].target.code = #PractitionerRole					
* group[=].element[=].target.display = ""					
* group[=].element[=].target.equivalence = #equivalent
* group[=].element[+].code = #Subject.contactInfo.preferedPhysician.Identifier		
* group[=].element[=].display = "A.1.2.3.1 Identification of the prefered physician"					
* group[=].element[=].target.code = #PractitionerRole.identifier					
* group[=].element[=].target.display = ""					
* group[=].element[=].target.equivalence = #equivalent		
* group[=].element[+].code = #Subject.contactInfo.preferedPhysician.Name		
* group[=].element[=].display = "A.1.2.3.2 Name of the prefered physician"					
* group[=].element[=].target.code = #PractitionerRole.practiotioner.name					
* group[=].element[=].target.display = ""					
* group[=].element[=].target.equivalence = #equivalent		
* group[=].element[+].code = #Subject.contactInfo.preferedPhysician.Specialization		
* group[=].element[=].display = "A.1.2.3.3 Specialization of the prefered physician"					
* group[=].element[=].target.code = #PractitionerRole.speciality					
* group[=].element[=].target.display = ""					
* group[=].element[=].target.equivalence = #equivalent	
* group[=].element[+].code = #Subject.contactInfo.preferedPhysician.providerIdentifierName		
* group[=].element[=].display = "A.1.2.3.4 Identification and name of the provider the doctor represents"					
* group[=].element[=].target.code = #PractitionerRole.organization.name					
* group[=].element[=].target.display = ""					
* group[=].element[=].target.equivalence = #equivalent		
* group[=].element[+].code = #Subject.contactInfo.preferedPhysician.providerAddress		
* group[=].element[=].display = "A.1.2.3.5 Provider address"					
* group[=].element[=].target.code = #PractitionerRole.organization.address					
* group[=].element[=].target.display = ""					
* group[=].element[=].target.equivalence = #equivalent	
* group[=].element[+].code = #Subject.contactInfo.preferedPhysician.telecom		
* group[=].element[=].display = "A.1.2.3.6 Telecom"					
* group[=].element[=].target.code = #PractitionerRole.telecom					
* group[=].element[=].target.display = ""					
* group[=].element[=].target.equivalence = #equivalent
* group[+].source = "https://hl7.cz/fhir/k-order/StructureDefinition/PayerKOrderCz"
* group[=].target = "https://hl7.cz/fhir/core/StructureDefinition/cz-coverage"
* group[=].element[+].code = #Header.payer
* group[=].element[=].display = "A.1.3 - Health insurance and payment information - Health insurance information is not always required, however, in some jurisdictions, the insurance number is also used as the patient identifier. It is necessary not just for identification but also forms access to funding for care."
* group[=].element[=].target.code = #Composition.section:order.insurance		
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #relatedto					
* group[=].element[=].target.comment = "Composition.section:order.entry.ofType(CZ_ImagingInformationAboutOrder).insurance.ofType(CZ_Coverage)"
* group[=].element[+].code = #Header.payer.insuranceCode
* group[=].element[=].display = "A.1.3.1 - Health insurance code"
* group[=].element[=].target.code = #CZ_Coverage.payor.identifier
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent					
* group[=].element[+].code = #Header.payer.insuranceName
* group[=].element[=].display = "A.1.3.2 - Health insurance name"
* group[=].element[=].target.code = #CZ_Coverage.payor.name
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent
* group[=].element[+].code = #Header.payer.insuranceNumber
* group[=].element[=].display = "A.1.3.3 - Health insurance number"
* group[=].element[=].target.code = #CZ_Coverage.identifier
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent		
* group[+].source = "https://hl7.cz/fhir/k-order/StructureDefinition/CoverageKOrderCz"
* group[=].target = "https://hl7.cz/fhir/core/StructureDefinition/cz-coverage"
* group[=].element[+].code = #Header.coverage
* group[=].element[=].display = "A.1.4 - Information about coverage"
* group[=].element[=].target.code = #Composition.section:Coverage					
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #relatedto					
* group[=].element[=].target.comment = "Composition.section:Coverage.entry.ofType(CZ_Coverage)"
* group[=].element[+].code = #Header.coverage.method
* group[=].element[=].display = "A.1.4.1 - Coverage method"
* group[=].element[=].target.code = #CZ_Coverage.type					
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent					
* group[=].element[+].code = #Header.coverage.informationPayor
* group[=].element[=].display = "A.1.4.2 - Information about Payor"
* group[=].element[=].target.code = #CZ_Coverage.payor					
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent					
* group[+].source = "https://hl7.cz/fhir/k-order/StructureDefinition/AuthorKOrderCz"
* group[=].target = "https://hl7.cz/fhir/core/StructureDefinition/cz-practitionerRole-core"
* group[=].element[+].code = #Header.author
* group[=].element[=].display = "A.1.5 - Author (by whom the Imaging Order was/were authored)"
* group[=].element[=].target.code = #Composition.author
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent					
* group[=].element[=].target.comment = "Composition.author.resolve().ofType(CZ_PractitionerRoleCore)"
* group[=].element[+].code = #Header.author.identifier
* group[=].element[=].display = "A.1.5.1 - Author identifier"
* group[=].element[=].target.code = #CZ_PractitionerRoleCore.practictioner.identifier					
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent					
* group[=].element[+].code = #Header.author.name
* group[=].element[=].display = "A.1.5.2 - Author name"
* group[=].element[=].target.code = #CZ_PractitionerRoleCore.practictioner.name					
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent					
* group[=].element[+].code = #Header.author.address
* group[=].element[=].display = "A.1.5.3 - Author address"
* group[=].element[=].target.code = #CZ_PractitionerRoleCore.practictioner.address					
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent					
* group[=].element[=].target.comment = "ID Organization"
* group[=].element[+].code = #Header.author.organization
* group[=].element[=].display = "A.1.5.4 - Author organisation"
* group[=].element[=].target.code = #Z_PractitionerRoleCore.organization.name					
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent		
* group[+].source = "https://hl7.cz/fhir/k-order/StructureDefinition/AuthorKOrderCz"
* group[=].target = "https://hl7.cz/fhir/core/StructureDefinition/cz-encounter"					
* group[=].element[+].code = #AuthorCz.organization
* group[=].element[=].display = "A.1.5.4 - Author organisation"
* group[=].element[=].target.code = #CZ_Encounter.serviceProvider					
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #relatedto
* group[+].source = "https://hl7.cz/fhir/k-order/StructureDefinition/RequestedPerformerKOrderCz"
* group[=].target = "https://hl7.cz/fhir/core/StructureDefinition/cz-practitionerRole-core"					
* group[=].element[+].code = #Header.requestedPerformer
* group[=].element[=].display = "A.1.6 - Requested Performer"
* group[=].element[=].target.code = #CZ_ImagingInformationAboutOrder.performer
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent					
* group[=].element[+].code = #Header.requestedPerformer.identifier
* group[=].element[=].display = "A.1.6.1 - Requested Performer identifier"
* group[=].element[=].target.code = #CZ_PractitionerRoleCore.practictioner.identifier				
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent					
* group[=].element[+].code = #Header.requestedPerformer.name
* group[=].element[=].display = "A.1.6.2 - Requested Performer name"
* group[=].element[=].target.code = #CZ_PractitionerRoleCore.practictioner.name					
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent					
* group[=].element[+].code = #Header.requestedPerformer.organizationID
* group[=].element[=].display = "A.1.6.3 - Requested Performer organisation ID"
* group[=].element[=].target.code = #CZ_PractitionerRoleCore.organization.identifier					
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent					
* group[=].element[+].code = #Header.requestedPerformer.organization
* group[=].element[=].display = "A.1.6.4 - Requested Performer organisation"
* group[=].element[=].target.code = #CZ_PractitionerCore.organization.name					
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent	
* group[+].source = "https://hl7.cz/fhir/k-order/StructureDefinition/AdditionalRecipientKOrderCz"
* group[=].target = "https://hl7.cz/fhir/core/StructureDefinition/cz-practitionerRole-core"				
* group[=].element[+].code = #Header.additionalRecipient
* group[=].element[=].display = "A.1.7 - Additional Recipient"
* group[=].element[=].target.code = #Composition.extension:informationRecipient					
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent					
* group[=].element[+].code = #Header.additionalRecipient.identifier
* group[=].element[=].display = "A.1.7.1 - Additional Recipient identifier"
* group[=].element[=].target.code = #CZ_PractitionerRoleCore.practitioner.identifier					
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent					
* group[=].element[+].code = #Header.additionalRecipient.name
* group[=].element[=].display = "A.1.7.2 - Additional Recipient name"
* group[=].element[=].target.code = #CZ_PractitionerRoleCore.practictioner.name					
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent					
* group[=].element[+].code = #Header.additionalRecipient.organizationID
* group[=].element[=].display = "A.1.7.3 - Additional Recipient organisation ID"
* group[=].element[=].target.code = #CZ_PractitionerRoleCore.organization.identifier					
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent					
* group[=].element[+].code = #Header.additionalRecipient.organization
* group[=].element[=].display = "A.1.7.4 - Additional Recipient organisation"
* group[=].element[=].target.code = #CZ_PractitionerRoleCore.organization.name					
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent					
* group[+].source = "https://hl7.cz/fhir/k-order/StructureDefinition/DocumentMetadataKOrderCz"
* group[=].target = "https://hl7.cz/fhir/k-order/StructureDefinition/BundleKOrderCz"
* group[=].element[+].code = #Header.documentMetadata.identifier
* group[=].element[=].display = "A.1.8.1 - Document ID"
* group[=].element[=].target.code = #Bundle.identifier					
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent					
* group[=].element[=].target.comment = "If it is the identifier of a particular order instance"
* group[=].element[+].code = #Header.documentMetadata.dateTime
* group[=].element[=].display = "A.1.8.4 - Order date and time"
* group[=].element[=].target.code = #Bundle.timeStamp
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent					
* group[=].element[=].target.comment = "If it is when this particular version of  this order has been assembled into a Bundle."
* group[+].source = "https://hl7.cz/fhir/k-order/StructureDefinition/KOrderHeaderCz"
* group[=].target = "https://hl7.cz/fhir/k-order/StructureDefinition/KOrderCompositionCz"
* group[=].element[+].code = #Header.subject
* group[=].element[=].display = "A.1.1 - Identification and A.1.2 - related contact information of the Patient/subject"
* group[=].element[=].target.code = #Composition.subject		
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent		
* group[=].element[+].code = #Header.author.dateTime
* group[=].element[=].display = "A.1.5.5 - Date Time"
* group[=].element[=].target.code = #Composition.date					
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent													
* group[=].element[+].code = #Header.documentMetadata
* group[=].element[=].display = "A.1.8 - Document metadata"
* group[=].element[=].target.code = #Composition					
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #relatedto					
* group[=].element[+].code = #Header.documentMetadata.category
* group[=].element[=].display = "A.1.8.2 - Document category"
* group[=].element[=].target.code = #Composition.category					
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent					
* group[=].element[+].code = #Header.documentMetadata.status
* group[=].element[=].display = "A.1.8.3 - Document status"
* group[=].element[=].target.code = #Composition.status					
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent					
* group[=].element[+].code = #Header.documentMetadata.dateTime
* group[=].element[=].display = "A.1.8.4 - Order date and time"
* group[=].element[=].target.code = #Composition.date					
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent					
* group[=].element[=].target.comment = "If it is when this document has been created (indipendently by its version)"
* group[=].element[+].code = #Header.documentMetadata.title
* group[=].element[=].display = "A.1.8.5 - Document title"
* group[=].element[=].target.code = #Composition.title					
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent					
* group[=].element[+].code = #Header.documentMetadata.custodian
* group[=].element[=].display = "A.1.8.6 - Order custodian"
* group[=].element[=].target.code = #Composition.custodian					
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent					
* group[=].element[+].code = #Header.documentMetadata.confidentiality
* group[=].element[=].display = "A.1.8.7 - Confidentiality"
* group[=].element[=].target.code = #Composition.confidentiality					
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent					
* group[=].element[+].code = #Header.documentMetadata.language
* group[=].element[=].display = "A.1.8.8 - Language"
* group[=].element[=].target.code = #Composition.language		
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #relatedto					
* group[=].element[+].code = #Header.documentMetadata.version
* group[=].element[=].display = "A.1.8.9 - Version"
* group[=].element[=].target.code = #Composition.extension:versionNumber.valueString					
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent					
* group[=].element[=].target.comment = "As business version, not as resource version"
* group[+].source = "https://hl7.cz/fhir/k-order/StructureDefinition/digitalSignatureKOrderCz"
* group[=].target = "https://hl7.cz/fhir/k-order/StructureDefinition/BundleKOrderCz"
* group[=].element[+].code = #Header.digitalSignatureCz.digitalSignature
* group[=].element[=].display = "A.1.9.1 - Electronic signature or document seal"
* group[=].element[=].target.code = #Bundle.signature.data		
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent					
* group[=].element[+].code = #Header.digitalSignatureCz.timestamp
* group[=].element[=].display = "A.1.9.2 - Electronic time stamp"
* group[=].element[=].target.code = #Bundle.signature.when					
* group[=].element[=].target.display = ""
* group[=].element[=].target.equivalence = #equivalent					
* group[=].element[=].target.comment = ""
