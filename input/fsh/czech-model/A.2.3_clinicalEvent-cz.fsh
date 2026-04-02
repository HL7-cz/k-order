Logical: LMCzClinicalEventCz
Id: LMClinicalEventCz
Title: "A.2.3 - Klinická událost (encounter)"
Description: """Informace o klinické události, ke které se objednávka vztahuje (odkaz na návštěvu)"""

* insert SetFmmandStatusRule ( 0, draft )

* identifikator 1..* Identifier "A.2.3.1 - ID klinické události" """Jednoznačný, globálně unikátní identifikátor klinické události, k němuž se objednávka vztahuje."""
* typ 0..* CodeableConcept "A.2.3.2 - Typ klinické události" """Typ klinické události dle číselníku typů. (např. hospitalizace, ambulantní návštěva apod.)."""
* dalsiInformace 0..1 string "A.2.3.3 - Další informace o klinické události" """Typ poskytovaných služeb, období či délka klinické události, vazba na další klinické události apod."""
