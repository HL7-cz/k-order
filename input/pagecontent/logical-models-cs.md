Tato stránka uvádí logické modely HL7 FHIR používané k reprezentaci K-žádanky a FT-žádanky.

[K-žádanka – úplný logický model](StructureDefinition-LMKOrderCompleteCz.html)
zobrazuje hlavičku, tělo, prezentovanou formu a přílohy v jedné hierarchii včetně
položek všech dílčích modelů. Kardinality se vztahují k bezprostředně nadřazené
položce. Přehled se automaticky odvozuje ze stejných definic jako dílčí modely.

[FT-žádanka – úplný logický model](StructureDefinition-LMFTOrderCompleteCz.html)
rozbaluje hlavičku, tělo FT-žádanky, prezentovanou formu a přílohy včetně všech
sdílených podmodelů. Obsahuje i FT specifikaci požadované péče: počet, frekvenci,
část těla, lateralitu a místo poskytnutí. Také tento přehled se generuje z dílčích
LM definic a zachovává jejich popisy, číselníkové vazby a lokální kardinality.

{% sql {
  "query" : "SELECT name AS Name, title AS Title, Type, Description, Web FROM Resources WHERE Type='StructureDefinition' AND Name LIKE 'LMG%' ORDER BY Title",
  "class" : "lines",
  "columns" : [
    { "name" : "Title"      , "type" : "link"     , "source" : "Name", "target" : "Web"},
    { "name" : "Name"       , "type" : "markdown" , "source" : "Title" },
    { "name" : "Description", "type" : "markdown" , "source" : "Description"}
  ]
} %}

{% sql {
  "query" : "SELECT name AS Name, title AS Title, Type, Description, Web FROM Resources WHERE Type='StructureDefinition' AND Name LIKE 'LMK%' ORDER BY Title",
  "class" : "lines",
  "columns" : [
    { "name" : "Title"      , "type" : "link"     , "source" : "Name", "target" : "Web"},
    { "name" : "Name"       , "type" : "markdown" , "source" : "Title" },
    { "name" : "Description", "type" : "markdown" , "source" : "Description"}
  ]
} %}

{% sql {
  "query" : "SELECT name AS Name, title AS Title, Type, Description, Web FROM Resources WHERE Type='StructureDefinition' AND Name LIKE 'LMF%' ORDER BY Title",
  "class" : "lines",
  "columns" : [
    { "name" : "Title"      , "type" : "link"     , "source" : "Name", "target" : "Web"},
    { "name" : "Name"       , "type" : "markdown" , "source" : "Title" },
    { "name" : "Description", "type" : "markdown" , "source" : "Description"}
  ]
} %}
