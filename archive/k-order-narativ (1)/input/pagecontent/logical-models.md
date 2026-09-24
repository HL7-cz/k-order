{% include variable-definitions.md %}

This page lists HL7 FHIR logical models used to represent the K-ORDERS.

The skeleton of the logical model is uniform for all types of eReferral, see [Scope and content](scope-and-content.html#conceptual-view). An element number denotes the same data item regardless of the type of eReferral and regardless of the implementation guide in which it is defined. Items are therefore referenced **by element number and name**, not by model name — model names differ between guides.

The sections `A.1`, `A.2`, `A.4` and `A.5` are common to all types of eReferral. Section `A.3` is completed in the element `A.3.2` by the model of the particular type.

The following three models describe the document as a whole. The general order model is the skeleton without type-specific content; the K-order and FT-order models differ from it only in the model used for the document body. These three document-level models are defined once and their titles are in Czech.

{% sql {
  "query" : "SELECT name AS Name, title AS Title, Type, Description, Web FROM Resources WHERE Type='StructureDefinition' AND Name IN ('LMGeneralOrderCz','LMKOrderCz','LMFTOrderCz') ORDER BY Name",
  "class" : "lines",
  "columns" : [
    { "name" : "Title"      , "type" : "link"     , "source" : "Name", "target" : "Web"},
    { "name" : "Name"       , "type" : "markdown" , "source" : "Title" },
    { "name" : "Description", "type" : "markdown" , "source" : "Description"}
  ]
} %}

The following models describe the individual sections and elements. Their titles begin with the element number, by which they are ordered.

{% sql {
  "query" : "SELECT name AS Name, title AS Title, Type, Description, Web FROM Resources WHERE Type='StructureDefinition' AND Name LIKE 'LMEn%' ORDER BY Title",
  "class" : "lines",
  "columns" : [
    { "name" : "Title"      , "type" : "link"     , "source" : "Name", "target" : "Web"},
    { "name" : "Name"       , "type" : "markdown" , "source" : "Title" },
    { "name" : "Description", "type" : "markdown" , "source" : "Description"}
  ]
} %}

The Czech version of the models is listed on the Czech version of this page, see [Logické modely](logical-models-cs.html).
