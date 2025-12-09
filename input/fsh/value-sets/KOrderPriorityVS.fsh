ValueSet: KOrderPriorityVS
Id: korder-priority-vs
Title: "K-order Priority ValueSet (CZ)"
Description: "Prioritizace pro konziliární žádanky K-order, s českými názvy."
* ^publisher = "HL7 CZ"

// routine — běžně
* include http://hl7.org/fhir/request-priority#routine "Běžně"

// urgent — urgentně
* include http://hl7.org/fhir/request-priority#urgent "Urgentně"

// asap — statim
* include http://hl7.org/fhir/request-priority#asap "Statim"

// immediate — okamžitě (pouze výjimečně)
* include http://hl7.org/fhir/request-priority#immediate "Okamžitě"
