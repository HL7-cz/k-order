// Shared clinical indication and care plan sections, adapted from IMG-Order.
RuleSet: OrderclinicalQuestionSection
// Slices are declared in each Composition to preserve its presentation order.
* section[clinicalQuestion]
  * ^short = "Clinical indication and question"
  * ^definition = "Reason for issuing the order and the clinical question to be addressed by the recipient. Entries may identify actual or suspected conditions supporting the indication."
  * code = $loinc#104720-8
  * title = "Clinical indication and question"
  * text 1..1 MS
  * text ^short = "Clinical question and indication text"
  * entry 0..*
  * entry only Reference(CZ_ClinicalQuestion)
  * ^comment = "Record the indication for each individual service in ServiceRequest.reasonCode or reasonReference. Reuse the same Condition when applicable. A clinical question can be expressed in the narrative without creating a Condition."
RuleSet: OrderCarePlanSection
* section[carePlan]
  * ^short = "Planned care"
  * ^definition = "Care plans describing related planned care in A.3.3 of the order document."
  * code = $loinc#18776-5
  * title = "Care plan"
  * entry 0..*
  * entry only Reference(CZ_CarePlanCore)
  * ^comment = "Present planned care here rather than repeating the CarePlan in supportingInformation. Inclusion does not assign the plan to every ServiceRequest."
