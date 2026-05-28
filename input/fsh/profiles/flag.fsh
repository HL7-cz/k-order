Profile:  CZ_Flag
Parent:   Flag
Id:       cz-flag
Title:    "Flag: Order (CZ)"
Description: "Czech profile for flag."

* insert SetFmmandStatusRule (1, draft)

* extension contains $flag-detail named flagDetailExt 0..*
* extension contains $flag-priority named flagPriorityExt 0..1
* extension[flagDetailExt]
* extension[flagPriorityExt]
* status ^short = "Alert status"
* code ^short = "Coded or textual message to display to user."
* subject only Reference(CZ_PatientCore)
