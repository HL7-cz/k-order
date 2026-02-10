
Logical: LogCzAttachmentsCz
Id: logAttachmentsKOrderCz
Title: "A.5 - Ostatní přílohy"
Description: """Ostatní přílohy zprávy z obrazového vyšetření"""



* typObsahu 0..1 CodeableConcept "A.5.1 - Typ obsahu" """Typ obsahu - je  požadován MIME typ"""
* jazyk 0..1 CodeableConcept "A.5.2 - Jazyk obsahu" """Jazyk obsahu - je požadována hodnata z HL7 valueset Languages"""
* data 1..1 base64Binary "A.5.3 - Data obsahu" """Data v base64"""
* url 0..1 url "A.5.4 - URL obsahu" """Uri kde lze data nalézt"""
* nazev 1..1 string "A.5.5 - Název obsahu" """Titulek, který bude zobrazen před daty"""
* vytvoreni 0..1 dateTime "A.5.6 - Datum vytvoření" """Datum, kdy byl obsah poprvé vytvořen"""
