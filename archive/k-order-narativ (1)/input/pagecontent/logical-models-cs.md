{% include variable-definitions.md %}

Tato stránka uvádí logické modely HL7 FHIR používané k reprezentaci konziliární žádanky a žádanky o fyzioterapii.

Kostra logického modelu je pro všechny typy eŽádanek jednotná, viz [Rozsah použití a obsah](scope-and-content-cs.html#koncepční-pohled). Číslo prvku označuje tentýž údaj bez ohledu na typ eŽádanky a bez ohledu na to, ve které implementační příručce je definován. Na položky se proto odkazuje **číslem a názvem prvku**, nikoli názvem modelu — názvy modelů se mezi příručkami liší.

Sekce `A.1`, `A.2`, `A.4` a `A.5` jsou společné všem typům eŽádanek. Sekci `A.3` doplňuje v prvku `A.3.2` model konkrétního typu.

Následující tři modely popisují dokument jako celek. Model obecné žádanky je kostrou bez typového obsahu, modely K-žádanky a FT-žádanky se od něj liší pouze modelem použitým pro tělo dokumentu.

{% sql {
  "query" : "SELECT name AS Name, title AS Title, Type, Description, Web FROM Resources WHERE Type='StructureDefinition' AND Name IN ('LMGeneralOrderCz','LMKOrderCz','LMFTOrderCz') ORDER BY Name",
  "class" : "lines",
  "columns" : [
    { "name" : "Title"      , "type" : "link"     , "source" : "Name", "target" : "Web"},
    { "name" : "Name"       , "type" : "markdown" , "source" : "Title" },
    { "name" : "Description", "type" : "markdown" , "source" : "Description"}
  ]
} %}

Následující modely popisují jednotlivé sekce a prvky. Jejich názvy začínají číslem prvku, podle kterého jsou seřazeny.

{% sql {
  "query" : "SELECT name AS Name, title AS Title, Type, Description, Web FROM Resources WHERE Type='StructureDefinition' AND Name LIKE 'LMCz%' ORDER BY Title",
  "class" : "lines",
  "columns" : [
    { "name" : "Title"      , "type" : "link"     , "source" : "Name", "target" : "Web"},
    { "name" : "Name"       , "type" : "markdown" , "source" : "Title" },
    { "name" : "Description", "type" : "markdown" , "source" : "Description"}
  ]
} %}

Anglická verze modelů je uvedena na anglické verzi této stránky, viz [Logical models](logical-models.html).
