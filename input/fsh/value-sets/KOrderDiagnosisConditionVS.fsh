ValueSet: CZ_DiagnosisConditionVs
Id: cz-diagnosis-condition-vs
Title: "CZ Diagnosis Condition"
Description: "ValueSet for diagnosis in condition in the Czech general ordel project, using MKN-10 and ORPHA codes."
* ^experimental = false

* include $mkn10#I10 "Esenciální (primární) hypertenze"
* include $mkn10#E11 "Diabetes mellitus 2. typu"
* include codes from system $orpha
