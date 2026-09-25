{% include variable-definitions.md %}

### Úvod

Tato implementační příručka je založena na [FHIR version R4](https://hl7.org/fhir/R4/) a definuje společnou bázi pro elektronické požadavkové dokumenty, tedy eŽádanky, v českém národním kontextu. Je zpracována v souladu s evropskými směrnicemi eHN a koncepty Xt-EHR.

Nad touto společnou bází příručka definuje **dva typy eŽádanky**:

- **Konziliární žádanku, typ K**, kterou žádající lékař vyžaduje odborný názor specialisty, vyšetření nebo ošetření specialistou, případně doporučuje převzetí pacienta do ambulantní či ústavní péče,
- **Žádanku o fyzioterapii, typ FT**, kterou ošetřující lékař vyžaduje fyzioterapii nebo ergoterapii.

Oba typy jsou součástí zdravotnické dokumentace pacienta a autorizují vyžádanou zdravotní službu, takže tam, kde je péče hrazena z veřejného zdravotního pojištění, jsou předpokladem její úhrady. Zákonné vymezení eŽádanky a předpisy určující její obsah uvádí kapitola Reference.

Příručka vymezuje obsahové komponenty dokumentu a strukturu, ve které se sestavuje: logický model, jeho mapování na FHIR profily a resources, strukturu FHIR Bundle, obory hodnot a příklady instancí. Cílem je, aby byla eŽádanka elektronicky vyměnitelná mezi poskytovateli zdravotních služeb, jejich informačními systémy a národní infrastrukturou elektronického zdravotnictví.

Do budoucna se předpokládá rozšíření společné báze o další typy požadavkových dokumentů.

#### Společná kostra a typové odlišnosti

Oba typy vycházejí z jednotné kostry logického modelu. Sdílí hlavičku dokumentu `A.1`, tělo dokumentu `A.2`, prezentovanou formu `A.4` a přílohy `A.5` a **liší se pouze v sekci `A.3`**, konkrétně v prvku `A.3.2 Datové elementy objednávky`, který nese vymezení požadované péče vlastní danému typu.

Kostra i číslování prvků jsou společné všem typům eŽádanky, tedy i těm, které jsou publikovány v jiných implementačních příručkách. Prvek `A.1.7` proto označuje tentýž údaj bez ohledu na typ.

#### Dvě části eŽádanky

Z pohledu rozhraní se eŽádanka skládá ze dvou částí.

| Část | Co nese | Kde je popsána |
|---|---|---|
| Systémová hlavička | Typ žádanky, žadatele, pacienta, adresáta, dodatečné příjemce výsledku a odkaz na nadřízenou žádanku. Nenese klinický obsah a v průběhu životního cyklu se může měnit. | Standard systému eŽádanka, schéma v OpenAPI specifikaci |
| FHIR Bundle typu `document` | Veškerý klinický obsah dokumentu. Je sestaven a podepsán při vystavení a po celý životní cyklus eŽádanky se nemění. | **Tato příručka**, Obecná funkční specifikace dokumentu eŽádanka a Speciální funkční specifikace příslušného typu |

**Tato příručka popisuje pouze FHIR Bundle.** Systémovou hlavičku nepopisuje.

Tato příručka nepopisuje způsob výměny dokumentu.

#### Vztah k ostatní dokumentaci

Dokumentace eŽádanek je členěna do níže uvedené sady.

| Dokument | Co popisuje |
|---|---|
| Standard „Systém eŽádanka“ | Systém eŽádanky jako celek: aktéři, role a oprávnění, architektura, stavový model a životní cyklus, procesy a operace rozhraní, integrace, kybernetická bezpečnost a provozní podmínky. |
| Obecná funkční specifikace dokumentu eŽádanka | Obsah a vlastnosti dokumentu eŽádanka společné všem typům. |
| Speciální funkční specifikace eŽádanky typu K | Specifika typu K: klinické scénáře, typové požadavky na obsah, mapovací tabulka na datové rozhraní a typové obory hodnot. |
| Speciální funkční specifikace eŽádanky typu FT | Totéž pro typ FT, včetně pravidel obou modelů preskripce. |
| Implementační specifikace (tato příručka pro typy K a FT) | Kompletní logický model, mapování na FHIR resources a profily, struktura FHIR Bundle, obory hodnot a jejich code systémy, příklady instancí. |
| OpenAPI specifikace rozhraní | Datová schémata rozhraní: pole, datové typy, kardinality, příklady a chybové odpovědi. |

Každý typ eŽádanky má vlastní speciální funkční specifikaci. Tam, kde tato příručka odkazuje na Speciální funkční specifikaci příslušného typu, jde tedy u typu K o *Funkční specifikaci eŽádanky K* a u typu FT o *Funkční specifikaci eŽádanky FT*.

### Stručný rozsah

Tato příručka je rozdělena na několik stránek, které jsou uvedeny v horní části každé stránky na liště nabídek.

- [Home - Domovská stránka](index-cs.html): Tato stránka poskytuje úvodní informace, vztah k ostatní dokumentaci, stručný rozsah použití, reference, závislosti, rozdílovou analýzu verzí a prohlášení o duševním vlastnictví.
- Introduction:
  - [Rozsah použití a obsah](scope-and-content-cs.html): Tento segment vymezuje, co příručka pokrývá a co ne, a uvádí kostru logického modelu dokumentu.
  - [Background](background-cs.html): Tento segment obsahuje informace o původu definice konziliární žádanky a žádanky o fyzioterapii.
- Functional:
  - [Logické modely](logical-models-cs.html): Tento segment obsahuje seznam logických modelů s čísly a názvy prvků.
- Implementation:
  - [Mapování logického modelu](model-map-cs.html): Tento segment obsahuje mapování logického modelu na profily.
  - [Příklady](examples-cs.html): Tento segment obsahuje příklady instancí.
- About:
  - [Záznam změn](changes-cs.html): Tento segment obsahuje přehled změn v jednotlivých verzích příručky.
  - [Autoři](authors-cs.html): Tento segment obsahuje informace o autorech.
  - [Downloads](downloads-cs.html): Tento segment obsahuje informace o možnostech stahování obsahu implementační specifikace.
  - [Závislosti](dependencies-cs.html): Tento segment obsahuje informace o závislostech.
  - [Autorská práva](copyright-cs.html): Tento segment obsahuje informace o autorských právech.
- [Artifacts](artifacts.html): Tato stránka poskytuje seznam FHIR artefaktů definovaných jako součást této implementační příručky.

### Reference

Papírovými vzory jsou **Poukaz na vyšetření/ošetření typu K** a **Poukaz na fyzioterapii/ergoterapii typu FT**. Požadavky na obsah vyžádání dalších zdravotních služeb stanoví `příloha č. 1 v části 2 k vyhlášce č. 444/2024 Sb., o zdravotnické dokumentaci`, ve znění k 19. 2. 2025.

* Související specifikace:
  * {{czImgOrder}}
    * Sesterská příručka téže sady dokumentace. Sdílí s touto příručkou kostru logického modelu a číslování prvků.
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
