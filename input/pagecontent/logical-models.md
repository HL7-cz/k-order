This page lists HL7 FHIR logical models used to represent K-orders and FT-orders.

The [complete K-order logical model (Czech)](StructureDefinition-LMKOrderCompleteCz.html)
shows the header, body, presented form and attachments together with all nested
logical-model elements. Cardinalities are relative to the immediate parent.
This view is generated from the same definitions as the modular models.

The [complete FT-order logical model (Czech)](StructureDefinition-LMFTOrderCompleteCz.html)
expands the FT-order header, body, presented form and attachments, including all
shared submodels and the FT service details: quantity, frequency, body site,
laterality and care location. It preserves the source descriptions, terminology
bindings and cardinalities relative to each element's immediate parent.

To facilitate the references with the eHN data sets the short description of each element reports the label of the eHN element (e.g., A.1.7.2 Result validator name).

The HL7 FHIR logical model requires that element cardinality is specified, while the eHN data set doesn't define them on purpose. For this reason the elements' cardinality of the following FHIR Logical Model should be interpreted with this in mind, thus they should not be considered as "normative".


{% sql {
  "query" : "SELECT name AS Name, title AS Title, Type, Description, Web FROM Resources WHERE Type='StructureDefinition' AND Name LIKE 'LogEn%' ORDER BY Title",
  "class" : "lines",
  "columns" : [
    { "name" : "Title"      , "type" : "link"     , "source" : "Name", "target" : "Web"},
    { "name" : "Name"       , "type" : "markdown" , "source" : "Title" },
    { "name" : "Description", "type" : "markdown" , "source" : "Description"}
  ]
} %}
