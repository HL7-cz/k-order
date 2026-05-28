Profile: CZ_DeviceUseStatement
Parent: DeviceUseStatement
Id: cz-deviceUseStatement
Title: "Device Use Statement: Order (CZ)"
Description: "This profile represents the constraints applied to the DeviceUseStatement resource for the purpose of this guide. A device used by or implanted on the patient is described in the order as an instance of a Device resource constrained by this profile."

* text ^short = "Device usage description"
* subject only Reference(CZ_PatientCore)
* subject ^definition = "The patient using the device."
//* subject.reference 1.. 
* timing[x] 1..1 
* timing[x].extension contains $data-absent-reason named data-absent-reason 0..1 
* timing[x].extension[data-absent-reason] ^definition = "Provides a reason why the timing is missing."
* reasonCode ^short = "Why is used (code)"
* reasonReference only Reference ( Condition or Observation or Media or DiagnosticReport or DocumentReference)
  * ^short = "Why is used (details)"
* device only Reference(CZ_MedicalDevice)
* bodySite
* bodySite from $sctBodySite (preferred)