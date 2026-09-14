# Analýza ServiceRequest.supportingInfo v K/FT

Stav k 10. 9. 2026, po odstranění podpisové sekce Composition. Analýza a doporučení; bez změn profilů.

**Závěr:** K/FT mají několik překrývajících se míst pro klinické informace a jejich mapování může působit jako povinnost vyplnit vše dvakrát. Není ale správné odstranit z supportingInfo všechny typy zdrojů, které se objevují jinde. Rozhodující je význam vztahu ke konkrétnímu výkonu. Doporučuji upřednostnit přímé elementy ServiceRequest, omezit mechanické kopírování referencí a zjednodušit slices, které pouze opakují typ cílového zdroje.

## Co bylo porovnáno

- [K ServiceRequest](../input/fsh/profiles/serviceRequest-K-Order.fsh), [FT ServiceRequest](../input/fsh/profiles/serviceRequest-FT-Order.fsh).
- [K Composition](../input/fsh/profiles/composition-K-Order.fsh), [FT Composition](../input/fsh/profiles/composition-FT-Order.fsh).
- [Společné popisy supporting information](../input/fsh/rule-sets/supporting-information-descriptions.fsh).
- [Logický model klinických informací](../input/fsh/czech-model/A.3.1_clinicalInformation-cz.fsh), [klinická událost](../input/fsh/czech-model/A.2.3_clinicalEvent-cz.fsh), [mapování klinických informací](../input/includes/clinical-information-map-cs.xml).
- CZ_Encounter z lokálně instalovaného CZ Core 1.0.0 a vygenerované příklady ve fsh-generated/resources.

ServiceRequest nemá dokumentové sekce ani `supportingInfo.entry`. Obsahuje jedno pole referencí `supportingInfo`; hospitalization, medication apod. jsou pojmenované slices tohoto pole. V instanci JSON neexistuje klíč `hospitalization`. Zápis `supportingInfo[hospitalization]` je označení slice v profilu/FSH.

K deklaruje 11 slices, FT stejných 11 a navíc goal. Všechny jsou nepovinné. Výška, váha a mobilita mají maximum 1, ostatní maximum *. Diskriminátor je profil cíle reference přes `resolve()`, nikoli klinický účel reference. Otevřený slicing neruší seznam povolených targetProfile. Princip slicing popisuje [FHIR R4 profiling](https://hl7.org/fhir/R4/profiling.html#discriminator).

## Hospitalization versus encounter

V obou ServiceRequest platí:

```fsh
* encounter 0..1
* encounter only Reference(CZ_Encounter)
* supportingInfo[hospitalization] only Reference(CZ_Encounter)
```

Stejný profil určuje podobu odkazovaného Encounter. Neurčuje, že obě reference vedou na stejnou instanci nebo mají stejný účel. `ServiceRequest.encounter` zachycuje zdravotnický kontext vzniku požadavku; supportingInfo slouží pro další klinické podklady. Viz [definice FHIR R4](https://hl7.org/fhir/R4/servicerequest-definitions.html#ServiceRequest.encounter).

**Scénář s odlišnými rolemi:** žádanka na rehabilitaci vznikne při ambulantní kontrole E2. Předchozí hospitalizace E1 poskytuje kontext nedávné operace. ServiceRequest.encounter odkazuje E2; supportingInfo může odkazovat E1. Přesun E1 do encounter by přepsal kontext vzniku žádanky a při více pobytech by navíc nestačilo maximum 1.

**Scénář zbytečného opakování:** žádanka vznikla při pobytu E1 a supportingInfo obsahuje E1 pouze proto, že formulář znovu požaduje „datum hospitalizace“. V takovém případě doporučuji použít již existující encounter a jeho period; nevytvářet druhý zdroj ani automaticky druhou referenci. FHIR toto opakování obecně nezakazuje, proto nejde o současnou validační chybu.

Konkrétní slabiny nynějšího řešení:

1. CZ_Encounter nefixuje class na hospitalizaci ani status na ukončený pobyt. Název hospitalization je užší než to, co profil dovoluje. Společný RuleSet to sám přiznává formulací, že slice neomezuje Encounter na inpatient stay.
2. Encounter.period zůstává 0..1. Reference tedy může validovat i bez data hospitalizace, přestože právě datum je cílem mapování.
3. A.2.3 popisuje klinickou událost; A.3.1.11 obsahuje samostatné `datumHospitalizace 0..*`. Model neříká, že A.3.1.11 musí být vždy jiná nebo minulá událost. Označení historicalEncounter by bylo dalším neodůvodněným zúžením, pokud se nezmění model.
4. Mapování A.3.1.11 vede na period.start a současně vypisuje Composition entry i ServiceRequest supportingInfo. Nevysvětluje větev „je to již kontextový encounter“. Samotný datumový údaj také nemusí stačit k vytvoření korektního Encounter: jeho povinné status a class se nesmějí domýšlet.

**Doporučení:** zachovat možnost odkazovat na další relevantní Encounter, ale odstranit zavádějící pojmenovaný slice hospitalization při zjednodušování seznamu. Pokud mají pojmenované slices zůstat, přejmenovat jej na `relevantEncounter` a výslovně popsat jinou roli vůči encounter. Samostatný profil hospitalizačního Encounter vytvářet pouze při skutečném požadavku na omezení typu pobytu.

## Posouzení všech současných slices

Tabulka je návrh použití v tomto IG. „Nemá přímou alternativu“ se vztahuje k elementům ServiceRequest, nikoli k celému FHIR.

| Slice a kardinalita | Potenciální překryv | Posouzení a doporučení |
|---|---|---|
| bodyHeight 0..1 | Composition supportingInformation | Ponechat jako podklad výkonu. Přímá alternativa v ServiceRequest není. Slice má význam pro limit jednoho vybraného měření. |
| bodyWeight 0..1 | Composition supportingInformation | Ponechat. Nezaměňovat hmotnost pacienta s quantity požadovaného výkonu. |
| mobility 0..1 | Composition supportingInformation, FT goals, locationCode | Aktuální stav mobility není budoucí cíl ani místo výkonu. Ponechat, je-li pro výkon relevantní. |
| relevantCondition 0..* | reasonReference; K anamnéza a diferenciální diagnóza | Přímá indikace → reasonReference. Další ovlivňující stav → supportingInfo. Nepřidávat automaticky všechny reasonReference znovu. Samostatný název slice není nezbytný. |
| medication 0..* | K currentTreatment, Composition supportingInformation | Léčba pacienta jako podklad nemá přímou alternativu v ServiceRequest. V K ji dokumentově prezentovat přednostně v currentTreatment. Reference pro konkrétní výkon může zůstat v supportingInfo. |
| allergyIntolerance 0..* | Composition supportingInformation; warning | Alergie zůstává AllergyIntolerance. Nezakládat navíc Flag se stejným obsahem jen kvůli dalšímu políčku. Samostatný klinický alert může mít vlastní účel a životní cyklus. |
| warning 0..* | Composition supportingInformation; alergie nebo jiné klinické záznamy | CZ_FlagPatientCore zachovat jako povolený typ. Flag nepoužívat jako obecnou kopii všech rizikových nálezů. |
| physicalFinding 0..* | obecná Observation; K examinationResults | Fyzikální nález patří do Observation. K examinationResults obsahuje DiagnosticReport, tedy jiný druh zdroje. Pojmenovaný slice je volitelná kategorizace; specializovaný cílový profil může zůstat povolen. |
| hospitalization 0..* | ServiceRequest.encounter, Composition.encounter a podpůrná sekce | Největší riziko záměny role; viz výše. Zrušit název nebo použít relevantEncounter. Neodstraňovat možnost dalšího relevantního Encounter. |
| immunization 0..* | Composition supportingInformation | Podklad o provedeném očkování nemá přímou alternativu. Ponechat typ, samostatný slice není nutný. |
| implant 0..* | Composition medicalDevices; bodySite | Použití přístroje je DeviceUseStatement; bodySite označuje místo požadovaného výkonu. Nejde o náhradu implantátu. Název implant je užší než povolené použití přístroje; volitelně relevantDeviceUse. |
| goal 0..* — FT | Composition goals; mobility | Cíl konkrétního výkonu lze odkazovat stejným Goal jako v dokumentu. Aktuální mobilita zůstává Observation. FT podporu Goal zachovat, název slice slouží hlavně k dokumentaci. |

Další Observation jsou již povoleny přes CZ_MedicalTestResultCore bez samostatného obecného slice. To je použitelný vzor pro ostatní typy, které nepotřebují zvláštní kardinalitu nebo jiná omezení.

## Překryvy s ostatními elementy a omezení profilu

Pro K/FT doporučuji tuto přednost umístění:

| Údaj / vztah | Primární cesta | Důsledek pro supportingInfo |
|---|---|---|
| Kontext vystavení | encounter | Nepřidávat stejnou událost mechanicky znovu. |
| Přímý důvod výkonu | reasonReference nebo reasonCode | supportingInfo použít pro další podklady, nikoli povinnou kopii indikace. |
| Požadovaná služba a její parametry | code, orderDetail, quantity, occurrence, bodySite | Nezakládat Observation jen jako kopii zadání. |
| Úhrada | insurance | Coverage dnes ani není povoleným supportingInfo cílem. |
| Vzorek | specimen | Specimen dnes ani není povoleným supportingInfo cílem. |
| Plán / objednávka, který tento požadavek naplňuje | basedOn | Není to obecný další klinický podklad; K/FT však nyní dovolují pouze ServiceRequest. |
| Volná poznámka k požadavku | note | Nevytvářet povinnou paralelní kopii strukturovaného údaje. |

Tyto role odpovídají [definicím elementů ServiceRequest R4](https://hl7.org/fhir/R4/servicerequest-definitions.html). Tabulka stanovuje doporučený způsob použití; nezavádí zákaz všech souběžných reprezentací.

**Příliš úzké reasonReference:** oba profily povolují pouze ConditionCore. Obecný R4 připouští také Observation, DiagnosticReport a DocumentReference. Pokud je přímým důvodem výkonu již existující nález, nelze na něj v současném K/FT reasonReference odkázat. Doporučuji projednat alespoň přidání odpovídajícího Core Observation. Další typy přidávat podle konkrétních scénářů; nevytvářet umělou Condition jen kvůli omezení reference.

**Chybějící dokumentové podklady výkonu:** K má examinationResults → DiagnosticReport a dokumentové přílohy, ale ServiceRequest.supportingInfo tyto typy nepovoluje. Pouhé odstranění slices tuto mezeru nevyřeší. Pokud má být celá zpráva podkladem konkrétního výkonu, je potřeba rozšířit seznam povolených referencí. Není nutné ji rozkládat na nové Observation jen kvůli validaci.

**CarePlan:** Composition.supportingInformation jej povoluje, oba ServiceRequest.supportingInfo nikoli a basedOn jej místně také nepovoluje. Souvisí to s dosud nevyjasněnou sémantikou A.3.3 „navazující žádanky“. CarePlan nyní automaticky nepřidávat ani jej nepovažovat za synonymum navazujícího ServiceRequest.

**reasonCode a reasonReference:** mohou obsahovat stejnou indikaci v různých reprezentacích. Doporučuji referenci na existující Condition; kód přidávat, pokud jej potřebuje dohodnuté rozhraní, a udržovat jejich soulad. Není podklad pro obecný zákaz obou elementů současně. Slices mkn-10/snomed/orphacode rozlišují kódové systémy, nikoli hlavní/vedlejší diagnózu nebo důvod.

## Composition: kdy jsou dvě reference oprávněné

Composition organizuje obsah celého dokumentu a jeho prezentaci. Reference z její sekce a reference z jednotlivého ServiceRequest mají různý rozsah. Tento rozdíl je v souladu s [Composition.section.entry](https://hl7.org/fhir/R4/composition-definitions.html#Composition.section.entry).

Příklad v K: jedna MedicationStatement je v currentTreatment, protože patří do přehledu léčby. První ServiceRequest na ni odkazuje jako na relevantní podklad; druhý ji nepotřebuje. V Bundle je jedna MedicationStatement, dvě reference vyjadřují dvě potřebné vazby. Převod všech podkladů výhradně do Composition by odstranil informaci, ke kterému výkonu patří.

Skutečný prostor pro redukci je **uvnitř Composition**: K currentTreatment versus supportingInformation.medication; anamnéza/diferenciální diagnóza versus supportingInformation.relevantCondition. Preferovat jednu dokumentovou sekci podle role. Stejný údaj nezobrazovat několikrát jen proto, že profil několik umístění dovoluje. Současné popisy už tuto přednost uvádějí, není ale vynucena strukturou.

Composition.encounter a ServiceRequest.encounter mohou oprávněně odkazovat na stejnou instanci: kontext dokumentu a kontext požadavku mohou být totožné. Nezavádět globální zákaz stejné reference napříč zdroji. Ani dokument s jedním ServiceRequest automaticky neruší rozdíl jejich rolí; důležitý je způsob výměny a samostatného zpracování požadavku.

## Doporučené zjednodušení

1. **Nejprve pravidla použití a mapování.** U každého řádku uvést dokumentové umístění a podmínku vazby na konkrétní výkon. Dnešní `<br/>` mezi dvěma cestami nesmí být vykládáno jako požadavek obě vždy vyplnit. Pro datum hospitalizace rozlišit kontextový Encounter a další relevantní Encounter.
2. **Přednost přímých elementů.** encounter pro kontext; reasonReference/reasonCode pro indikaci; insurance, specimen a basedOn pro vlastní vztahy. supportingInfo jako doplňující klinický kontext.
3. **Zredukovat čistě kategoriální slices.** Doporučený menší profil zachová podporované targetProfile a ponechá pojmenované slices především pro bodyHeight, bodyWeight a mobility, kde se uplatňuje limit 0..1. Ostatní kategorie lze vysvětlit v jedné tabulce použití. FT goal lze ponechat pro čitelnost, není však nutný jen k povolení Goal. Odstranění názvu slice neznamená zákaz daného typu reference.
4. **Nepřidávat zákaz všech opakovaných referencí.** Začít doporučením nezdvojovat stejný vztah bez účelu. Případné kontroly shody referencí musí rozpoznávat i urn:uuid, relativní a absolutní reference na tentýž zdroj; prosté porovnání řetězců nestačí.
5. **Opravit omezení reasonReference a zvážit zprávy jako podklady.** Rozšíření typů zdůvodnit konkrétními scénáři a sladit se seznamem zdrojů v Bundle.
6. **Při implementaci doplnit scénáře.** Jeden kontextový Encounter bez opakování; jiný relevantní pobyt; více relevantních pobytů; indikující Condition a odlišná komorbidita; nález jako indikace; dva ServiceRequest s rozdílnými podklady a sdílenými zdroji. Pak SUSHI, Publisher a kontrola příkladů.

Pojmenované slices s max * dnes zpravidla přidávají kategorizaci a popis nad již povolené cíle. Jejich odstranění zasáhne FSH instance, mapování a navázané implementační požadavky, i když se JSON reference nemusí změnit. Odstranění slices s max 1 by navíc odstranilo jejich kardinalitní omezení. Před změnou proto inventarizovat závislosti; sjednocovat také společný RuleSet a odpovídající Composition slices.

## Co ukazují současné příklady

Vygenerované zdroje obsahují 11 samostatných příkladů ServiceRequest; 7 Bundle obsahuje rovněž 11 různých vložených ServiceRequest podle id. Samostatné příklady používají supportingInfo ve čtyřech případech: FT cíle, jeden implantát a nefrologické nálezy. Žádný ze samostatných ani vložených ServiceRequest nevyplňuje encounter; vložené příklady nepoužívají podporující reference ve tvaru Encounter/id.

Nenalezl jsem tedy konkrétní příklad stejného Encounter v obou polích. Nález je o nejasnosti modelu a nedostatečném pokrytí příklady, nikoli o prokázané duplicitě těchto existujících příkladů. Celý IG build nebyl pro tuto analýzu znovu spouštěn; profily se neměnily.
