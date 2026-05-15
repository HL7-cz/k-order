### Úvod

Tato implementační příručka je založena na [FHIR version R4](https://hl7.org/fhir/R4/). Specifikuje společnou bázi pro elektronické požadavkové dokumenty (žádanky) v českém národním kontextu v souladu s evropskými směrnicemi eHN a koncepty Xt-EHR.

Hlavním cílem této implementační příručky je definovat společné obsahové komponenty, logické modely a návrhové principy používané pro konstrukci elektronických žádanek v České republice. Tato specifikace představuje společný základ pro různé typy požadavkových dokumentů a zajišťuje jednotný přístup k reprezentaci administrativních, identifikačních a workflow aspektů žádanek.

Aktuálně definované dokumenty typu K-Žádanka a FT-Žádanka vycházejí ze společné báze logického modelu žádanek. Jednotlivé typy žádanek se liší především v části „body“, konkrétně v datových elementech reprezentujících vlastní požadovaný obsah a odborný kontext konkrétního typu žádanky.

Do budoucna se předpokládá rozšíření této společné báze také o další typy požadavkových dokumentů, například laboratorní žádanku nebo žádanku na zobrazovací komplement.

Účelem tohoto standardu je definovat interoperabilní strukturu elektronické žádanky jako zdravotnického dokumentu určeného pro elektronickou výměnu zdravotních informací mezi jednotlivými poskytovateli zdravotních služeb, informačními systémy a národní infrastrukturou elektronického zdravotnictví v České republice.

Tato příručka nepopisuje způsob transportu nebo výměny těchto dokumentů.

### Stručný rozsah

Tato příručka je rozdělena na několik stránek, které jsou uvedeny v horní části každé stránky na liště nabídek.

- [Home - Domovská stránka](index-cs.html): Tato stránka poskytuje úvodní informace, stručný rozsah použití, reference, závislosti, rozdílovou analýzu verzí a prohlášení o duševním vlastnictví.
- Introduction:
  - [Rozsah použití a obsah](scope-and-content-cs.html): Tento segment obsahuje úvodní obecné informace o společné bázi žádanek.
  - [Background](background-cs.html): Tento segment obsahuje obecné informace o původu definice společného modelu žádanek.
- Functional:
  - [Logické modely](logical-models-cs.html): Tento segment obsahuje informace o logických modelech.
- Implementation:
  - [Mapování logického modelu](model-map-cs.html): Tento segment obsahuje informace o mapování logického modelu na FHIR profily.
- About:
  - [Downloads](downloads-cs.html): Tento segment obsahuje informace o možnostech stahování obsahu implementační specifikace.
- [Artifacts](artifacts.html): Tato stránka poskytuje seznam FHIR artefaktů definovaných jako součást této implementační příručky.

### Reference

Papírovými předlohami pro elektronické žádanky jsou příslušné typy zdravotnických formulářů definovaných českou legislativou a souvisejícími národními standardy zdravotnické dokumentace.

* Související specifikace:
  * {{hl7XtEHR}}
    * Tato specifikace inspirovala mnoho návrhových vzorů definovaných v tomto IG.
  * {{czLabOrder}}
    * Tato specifikace sdílí společné návrhové principy pro elektronické žádanky.
  * {{czImg}}
    * Tato specifikace sdílí společné návrhové principy pro elektronické žádanky.
  * {{czCore}}
    * Kde to bylo možné, byly poděděny specifikace z definic CZ Core.

### Závislosti

{% include dependency-table.xhtml %}

### Rozdílová analýza verzí

{% include cross-version-analysis.xhtml %}

### Prohlášení o duševním vlastnictví

{% include ip-statements.xhtml %}
