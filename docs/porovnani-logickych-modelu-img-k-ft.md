# Porovnání logických modelů a mapování IMG / K / FT

Stav k 10. 9. 2026. Použity zdroje Order a lokální kopie IMG-Order v archive/RTG. Tento dokument je analýza, nikoli změna modelů nebo profilů.

Aktualizace 11. 9. 2026: tabulkové mapování hlavičky A.1 a přehledové diagramy byly následně sjednoceny pro K, FT a skutečný sousední projekt IMG-Order (`../RTG`). Aktuální společný zdroj, kontroly a zbývající omezení popisuje [Společné mapování hlavičky](spolecne-mapovani-hlavicky.md). Níže uvedené rozdíly mapování hlavičky popisují původní stav; rozdíly logických modelů a těla tím nejsou odstraněny.

**Cílové pravidlo podle zadání:** všechny tři žádanky mají společnou strukturu, význam, datové typy a kardinality mimo A.3.2. Specializované údaje IMG, K a FT se nacházejí v A.3.2. Jazykové verze mají stejný model. Mapování společných částí používá stejné významové vztahy a společné profily; doménové názvy Composition/ServiceRequest se mění jako parametry.

**Zjištění:** české modely K/FT tomuto pravidlu již z velké části odpovídají díky sdíleným podmodelům. IMG se ale mimo A.3.2 liší také povinnostmi, strukturou a typy. Existují navíc rozdíly mezi CZ/EN a mezi mapováním společných částí K/FT. RTG proto nelze použít jako nezpochybnitelnou předlohu; je druhým vstupem pro společné sjednocení.

## Podklady a způsob porovnání

- Kořenové modely: [K](../input/fsh/czech-model/K_Order-cz.fsh), [FT](../input/fsh/czech-model/FT_Order-cz%20.fsh), [IMG](../archive/RTG/input/fsh/czech-model/ImageOrder-cz.fsh).
- Těla: [K](../input/fsh/czech-model/A.2_A.3_bodyKOrder-cz.fsh), [FT](../input/fsh/czech-model/A.2_A.3_bodyFTOrder-cz.fsh), [IMG](../archive/RTG/input/fsh/czech-model/BodyImageOrder-cz.fsh).
- Klinické informace: [K/FT A.3.1](../input/fsh/czech-model/A.3.1_clinicalInformation-cz.fsh), [IMG A.3.1](../archive/RTG/input/fsh/czech-model/SupportingInformation-cz.fsh).
- Mapování: [K hlavička](../input/pagecontent/K-Header-map.xml), [FT hlavička](../input/pagecontent/FT-Header-map.xml), [K tělo](../input/pagecontent/K-Body-map.xml), [FT tělo](../input/pagecontent/FT-Body-map.xml), [IMG hlavička](../archive/RTG/input/pagecontent/Header-map-cs.xml), [IMG tělo](../archive/RTG/input/pagecontent/Body-map-cs.xml), [IMG přílohy](../archive/RTG/input/pagecontent/Attachment-map-cs.xml).

Porovnány deklarované elementy FSH, jejich hierarchie, kardinality, datové typy a příslušné mapovací řádky včetně sdílených includes Order. Zakomentované elementy nejsou považovány za součást modelu. Shoda tabulkového čísla A.x sama nestačí: stejné číslo místy označuje jiný obsah. Shoda základních deklarací také sama neprokazuje shodu všech popisů, terminologie a cílových FHIR profilů.

## K versus FT

České kořenové modely mají stejnou strukturu. Obě těla odkazují na stejné podmodely pro A.2.1–A.2.6, A.3.1, A.3.3 a A.3.4. Liší se typem `datoveElementyObjednavkyVysetreni`: LMKOrderDataElementsCz versus LMFTOrderDataElementsCz. Hlavička, prezentovaná forma a přílohy jsou společné.

To je vhodný základ cílového řešení. Samostatné sekce Composition K pro anamnézu, výsledky, rozvahu, léčbu a dokumentaci vycházejí z K A.3.2.2–A.3.2.6; FT goals vychází z FT A.3.2.2. Tyto rozdíly jsou v rámci zadání oprávněné, i když se na FHIR úrovni realizují jako samostatné sekce Composition.

## Rozdíly českých modelů IMG versus společný K/FT

| Oblast | K/FT | IMG | Vyhodnocení |
|---|---|---|---|
| Kořen: tělo | 1..1 | 0..1 | Skutečný rozdíl povinnosti mimo A.3.2. |
| Kořen: A.4 prezentovaná forma | 0..1 | 1..* | Skutečný rozdíl povinnosti i opakovatelnosti. |
| A.1 hlavička | provadejici | zpracovatel | Srovnatelná role a kardinalita; sjednotit identitu elementu a text. |
| A.1.1–A.1.2 pacient | Společná struktura | Stejné deklarace cest, typů a kardinalit | Ověřeno 29 deklarací; vhodný společný modul. |
| A.1.3 zdravotní pojištění | 3 elementy | Stejné 3 elementy | Strukturální shoda. |
| A.1.4 úhrada | Navíc kodNahrady 0..1 CodeableConcept | Chybí kodNahrady | Přidat do společného modulu jako obecný volitelný údaj, nebo při výlučně doménovém významu přesunout do A.3.2. |
| A.1.5–A.1.8 | Autor, provádějící, příjemci, metadata | Stejné základní deklarace | Ověřena strukturální shoda těchto podmodelů; mapování přesto není stejné. |
| A.1.9 podpis | Vnitřní elektronickyPodpis 1..1 | Vnitřní elektronickyPodpis 0..* | V obou hlavičkách je nadřazený blok podpisu 1..*. IMG tedy může mít blok bez podpisu a opakování na dvou úrovních. |
| A.2.1–A.2.2 | identifikator, datumACasPozadovanehoProvedeni, informaceProPacienta | id, datumPozadovanehoProvedeni, infoProPacienta | Především názvy; po jejich přiřazení je základní struktura shodná. |
| A.2.3 klinická událost | identifikator, typ, dalsiInformace | Stejné | Zachovat společně, včetně role vůči A.3.1. |
| A.2.4 úhrada | informaceOPlatci a vnořené názvy | infoOPlatci a zkrácené názvy | Základní typy a kardinality odpovídají, cesty se liší. |
| A.2.5 návštěva | 8 elementů | Stejné deklarace | Není důvod k rozdílnému obecnému mapování. |
| A.2.6 vzorek | dalsiUdaje.hodnota: Narrative | dalsiData.hodnota: Quantity | Skutečný rozdíl datového typu; další rozdíly jsou především přejmenování cest. |
| A.3.1 | Rozšířený společný model Order | Starší radiologicky formulovaný model | Podrobnosti níže. |
| A.3.3 plánované/navazující objednávky | identifikator 0..1; nazev 1..1 | identifikator 0..1; nazev 0..1 | Odlišná povinnost názvu a nevyjasněný význam CarePlan versus objednávka. |
| A.3.4 další podklady | identifikator 0..1; nazev 1..1 | identifikator 0..*; nazev 0..* | Rozdílná kardinalita i způsob seskupení informací. |
| A.4 vnitřní struktura | Navíc vizualniPodoba 0..1 Base; ostatní pole jsou její sourozenci | Bez tohoto elementu | Element v Order není skutečným obalem polí. Rozhodnout, zda jej odstranit, nebo správně definovat hierarchii. |
| A.5 přílohy | 6 elementů | Stejné deklarace | Strukturální shoda; mimo jiné oba vyžadují data 1..1, takže samotné URL nestačí. |

Shoda A.5 neznamená, že je model ideální pro všechny způsoby předání přílohy. Pokud mají být povoleny přílohy pouze odkazem, musí se společně změnit datová povinnost; nestačí změnit popis mapování.

## A.3.1: největší rozdíly mimo povolenou specializaci

| Obsah | K/FT | IMG | Doporučení společného modelu |
|---|---|---|---|
| Biometrie | Blok 0..1; váha a výška každá 0..1 | Blok 1..1; váha a výška každá 1..1 | Použít společné volitelné podklady. Případné podmíněné požadavky na konkrétní výkon definovat výslovně a jednotně. |
| Další relevantní diagnózy | dalsiRelevantniKlinickeInformace | dalsiRelevantniUdaje | Stejný obecný význam; sjednotit názvy a roli vůči indikaci v A.2.2. |
| Medikace | medikace 0..* s identifikátorem, kódem a množstvím | Obal mozneKontraindikaceVlivemMedikaci 0..*, pod ním medikace 0..* | Společná obecná medikace; radiologický účel kontraindikace ponechat v popisu použití. Dvojí opakování bez jiných atributů obalu nepřebírat automaticky. |
| Číslování medikace | Údaje A.3.1.3.1–3 | Údaje A.3.1.3.1.1–3 | Potřebuje převodní tabulku, nikoli jen přejmenování textů. |
| Alergie | CodeableConcept 1..* | Base 1..* bez deklarovaných dětí | Datový model není stejný. Zvolit společnou explicitní strukturu; samotný prázdný Base neurčuje obsah alergie. |
| Mobilita | Volitelný blok 0..1 s datem, kódem a hodnotou | Povinný Base 1..1 bez těchto deklarovaných dětí | Sjednotit na explicitní společnou strukturu. Mapování IMG je podrobnější než jeho logický model. |
| Fyzikální nález | A.3.1.10, 0..* | Bez samostatného elementu | Zachovat jako obecný volitelný údaj společný všem třem. |
| Datum hospitalizace | A.3.1.11, 0..* | Bez samostatného elementu | Zachovat společně; nevkládat pouze do K/FT A.3.2. Rozlišit kontextový a další relevantní Encounter. |
| Očkování | A.3.1.12, 0..* | Bez samostatného elementu | Stejný přístup jako u dalších obecných klinických údajů. |
| Ostatní formalizované hodnoty | A.3.1.13; hodnota Narrative | A.3.1.7; hodnota Quantity | Jiný kód položky i typ. Navrhnout společnou reprezentaci hodnot, která neztratí číselné jednotky ani nenumerické informace. |

V K/FT už tedy není A.3.1 pouze kopií IMG. Podle zadání mají být jeho obecná rozšíření dostupná také pro IMG, s jednotnými kardinalitami. Nemají se odstranit z K/FT jen proto, že ve starším RTG chybí.

Společná slabina: urgentní informace jsou nepovinný blok, ale uvnitř vyžadují alespoň jednu alergii. Samotné varování bez alergie tak v modelu tento blok nenaplní. Sjednocení je příležitost posoudit tento požadavek pro všechny žádanky, nikoli z něj dělat rozdíl IMG/K/FT.

## A.3.2: odůvodněné rozdíly a chyba hierarchie IMG

- **IMG:** kód a název vyšetření, modalita, část těla, lateralita, poznámka.
- **K:** požadované služby a specifické textové údaje poukazu: anamnéza, výsledky, diferenciální rozvaha, současná léčba, zapůjčená dokumentace.
- **FT:** požadované výkony, část těla, lateralita, počet, frekvence, poznámka, místo péče a cíle.

V [IMG A.3.2](../archive/RTG/input/fsh/czech-model/OrderDataElements-cz.fsh) jsou kod, nazev, modalita a další údaje deklarované jako sourozenci `pozadovaneVysetreni`, přestože číslování A.3.2.1.x naznačuje děti opakovaného vyšetření. Číslování v názvu hierarchii nevytváří. Pro více výkonů tak není strukturálně určeno, který kód či modalita patří ke kterému vyšetření. Doporučená oprava: `pozadovaneVysetreni.kod`, `.modalita` atd.

FT deklaruje frekvenci v modelu, ale v zkontrolované tabulce FT-Body-map.xml nemá vlastní mapovací řádek. Toto je nedokončené mapování specializace A.3.2, které je vhodné opravit spolu se společnou částí.

## Rozdíly mapování

Stejný logický model nevyžaduje totožný název cílové Composition nebo kód požadovaného výkonu. Vyžaduje ale konzistentní význam cílového elementu a jasně popsané doménové parametry. Nepřímá reference v tabulce musí uvádět celou navigaci; označení FSH slice není samo o sobě vykonatelný FHIRPath.

| Oblast | Zjištění | Směr sjednocení |
|---|---|---|
| A.1.2 kontakty | K mapuje více kontaktů než FT. Identifikátor preferovaného lékaře vede v K na Practitioner.identifier, ve FT na PractitionerRole.identifier. | Jeden společný výklad identity osoby versus role a úplné mapování kontaktů. |
| A.1.9 podpis | K a IMG tabulky používají Bundle.signature; FT používá Provenance v Bundle. Odstranění sekce signature tento rozdíl mapování neodstranilo. | Společně popsat podpis dokumentového Bundle a podpisy zdrojů v Provenance, včetně toho, co přesně reprezentuje údaj modelu. Bez návratu podpisové sekce Composition. |
| A.2.2 indikace | IMG používá klinickou sekci a lokální ConditionClinicalQuestion. K/FT tabulky obsahují neexistující reasonCode.coding[diagnosis]/[reason]. | Jednotná role indikace a klinické otázky; následně opravit cesty a sladit povolené cíle. |
| A.2.3 událost | IMG u typu události uvádí Composition.type. | Typ klinické události mapovat na odpovídající Encounter; nezaměňovat s typem dokumentu. |
| A.2.5 termín | IMG mapuje plánovaný čas na Appointment.created. | Společně rozlišit vytvoření rezervace a čas návštěvy. |
| A.3.1 reference | Obě větve používají dokumentový a výkonový kontext; IMG cesty často vynechávají entry a průchod referencí. | Jedna pravidla pro Composition.entry versus ServiceRequest.supportingInfo a úplné logické cesty. |
| A.3.1 Flag | IMG tabulka uvádí CZ_Flag, ale jeho Composition/ServiceRequest jej nepovolují. K/FT používají CZ_FlagPatientCore. | Společný Core cíl a soulad mapování s profily. |
| A.3.1 datum mobility | IMG uvádí valueDateTime, ale hodnotou profilu je CodeableConcept. | Datum odlišit od hodnoty pozorování. |
| A.3.3 navazující objednávka | IMG → samostatná carePlan/CZ_CarePlanImage; K/FT → supportingInformation/CZ_CarePlanCore. | Nejdřív společně rozhodnout význam objednávky versus plánu a směr návaznosti. Pouhé přesunutí do sekce CarePlan problém neřeší. |
| A.3.3 identifikátor | IMG používá CarePlan.code; Order již identifier. | Nepřebírat chybnou cestu IMG. |
| A.3.4 jiné podklady | IMG uvádí Observation.code jako identifikátor a title jako název; Order identifier a code.text. | Společné přesné mapování a vyjasnění rozdílu vůči dalším hodnotám A.3.1. |
| A.4–A.5 | IMG má samostatnou tabulku; přehled mapování Order odkazuje jen na hlavičky/těla, Attatchmant-map.xml obsahuje pouze diagram. | Doplnit společné dostupné tabulkové mapování obou částí a odkazy z přehledu. |

Order již sdílí includes pro klinické informace, část důvodů, výběr vzorku, plátce a navazující objednávky. Rozšíření tohoto přístupu na celou společnou část odstraní rozdíly vzniklé ruční údržbou K a FT tabulek.

## Jazykové verze se strukturálně rozcházejí

1. Anglická těla K/FT nemají A.2.6, A.3.3 a A.3.4, které česká těla obsahují. Navíc K používá názvy supportingInformation/orderDataElements, FT clinicalInformation/dataElements pro odpovídající společné pozice.
2. Anglické Order A.3.1 má jiné členění a číslování: nemá samostatnou českou biometrii, mobilita a implantát jsou zakomentované a A.3.1.7 označuje datum hospitalizace. V českém IMG stejná pozice označuje další formalizované údaje. Automatické párování pouze podle čísla by bylo chybné.
3. IMG A.3.3 má v češtině název 0..1, v angličtině name 1..1. IMG A.3.4 má v češtině identifikátor/název 0..*/0..*, v angličtině 0..1/1..1.

Nejde tedy jen o překladové opravy. Potřebujeme jednotný zdroj struktury a stabilní identitu každého elementu; jazyk má měnit popisky a definice, nikoli povinnosti, typy nebo hierarchii.

## Navržený cílový model a pořadí práce

```text
Žádanka — společný základ
  A.1        Hlavička
  A.2.1–2.6  Informace o objednávce, indikace, událost, úhrada, termín, vzorek
  A.3.1      Klinické podklady
  A.3.2      Jediný specializovaný modul: IMG | K | FT
  A.3.3      Navazující objednávky / plán — význam musí být vyjasněn
  A.3.4      Další odkazy na podpůrné informace
  A.4        Prezentovaná forma
  A.5        Přílohy
```

1. **Vytvořit společný slovník elementů:** stabilní ID, CZ/EN název a definice, cesta, typ, kardinalita, mapování a pravidlo použití. Rozhodnout zjištěné věcné rozdíly mimo A.3.2. Jednotná struktura zahrnuje také kořenové kardinality, nikoli pouze podmodely.
2. **Sjednotit A.3.1 jako první obsahový modul:** společná explicitní biometrie a mobilita, obecná medikace, alergie, upozornění, implantáty, relevantní události, fyzikální nálezy, očkování a další hodnoty. Nenutit obecné klinické údaje do A.3.2 jen kvůli historii jednotlivých IG.
3. **Oddělit sémantiku A.3.3 od volby FHIR zdroje:** navazující ServiceRequest a CarePlan nejsou automatická synonyma. Převod z referencí na objednávky do CarePlan musí mít oporu v dohodnutém významu.
4. **Udržovat tři implementace A.3.2:** opravit hierarchii IMG a doplnit chybějící mapování FT. Specifické sekce Composition jsou přípustné jako realizace tohoto modulu.
5. **Generovat společná mapování:** doménové profily dosazovat parametry, specializované řádky mít jen v A.3.2. Společné popisy mají určit, kdy se použije dokumentová reference, výkonová reference nebo obě na jednu instanci.
6. **Převést jazykové verze na stejnou strukturu a ověřit shodu:** automaticky porovnávat elementy, typy a kardinality společných modulů mimo A.3.2, a kontrolovat existenci cest uvedených v mapování. Následně příklady všech tří žádanek a Publisher.

Není nutné, aby logický model měl jednu položku na každý slice supportingInfo nebo jednu položku na každou sekci Composition. Logický model vyjadřuje informaci a její význam; FHIR profil určuje její reprezentaci. Společné A.3.1 tedy může mapovat obecné klinické podklady do supportingInfo a současně do dokumentové prezentace, aniž by vznikaly dvě kopie klinického zdroje.

Pro toto porovnání se neměnily FSH, mapovací tabulky ani RTG. Další krok doporučuji omezit na návrh definitivního společného A.3.1 včetně kardinalit a mapování; poté jej použít ve všech třech žádankách.
