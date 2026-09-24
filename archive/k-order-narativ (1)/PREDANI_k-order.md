# Předání — narovnaná narativní část k-order

Návrh úprav narativních stránek příručky **HL7 Czech Order Implementation Guide**
(`https://github.com/HL7-cz/k-order`), typy K a FT, 4. 9. 2026.

Narovnáno podle odevzdané sady dokumentace eŽádanek — Standardu systému eŽádanka,
Obecné funkční specifikace dokumentu eŽádanka, Funkční specifikace eŽádanky K 6.2
a Funkční specifikace eŽádanky FT 7.0. Osnova stránek odpovídá sesterské příručce
img-order, obory hodnot jsou ověřené proti publikovanému HL7 Czech Terminology IG
0.3.0 a proti profilům v repozitáři.

Návrh vychází ze stavu repozitáře po commitu `f50b405` z 3. 9. 2026, tedy včetně
stránek Examples a Changes a anonymizovaných příkladů.

## Dva typy v jedné příručce

Příručka je implementační specifikací **dvou typů eŽádanky**, konziliární žádanky K
a žádanky o fyzioterapii FT. Každý z nich má vlastní speciální funkční specifikaci:
**Funkční specifikaci eŽádanky K** a **Funkční specifikaci eŽádanky FT**. Narativ proto
nikde nemluví o jedné speciální funkční specifikaci, ale odkazuje na tu příslušného
typu, a u prvků, kde se obsah mezi typy liší, uvádí obě varianty — zejména u prvku
`A.3.2 Datové elementy objednávky`, který je jediným místem, kde se modely obou typů
rozcházejí.

## Co je v balíku

| Cesta | Co s tím |
|---|---|
| `input/pagecontent/*.md` | 20 souborů, deset stránek česky a anglicky. Čtyři stránky jsou nové (Případy užití, Workflow, Terminologické aspekty, Poznámky k implementaci), ostatní **nahradit**. |
| `input/includes/variable-definitions.md` | Nový soubor. Příručka dosud proměnné `{{czCore}}`, `{{czImg}}` a další používala, ale nikde je nedefinovala, takže se na stránkách nevykreslovaly. Přidána je i proměnná `czImgOrder` pro odkaz na sesterskou příručku. |
| `sushi-config-menu.yaml` | Náhrada bloků `pages:` a `menu:`. U této příručky je změna konfigurace nutná, protože `pages:` je spravován ručně a bez zápisu se nové stránky nepublikují. |
| `nahled-k-order.html` | Náhled výsledku, jeden soubor, otevře se v prohlížeči. Není to publikace ani sestavený IG, jen pomůcka k prohlédnutí návrhu před čtením samotných souborů. |

## Co návrh záměrně nedělá

**Nemění logický model ani profily.** Platí pravidlo, že se model nepřejmenovává. Narativ proto používá názvy prvků tak, jak je nazývá model, a rozpory mezi názvy uvnitř příručky i proti Obecné funkční specifikaci narativ neopravuje, jen je respektuje.

**Nemění diagramy.** Soubory `orderDiagram-cz.plantuml`, `orderHeaderDiagram.plantuml`, `orderBodyDiagram.plantuml` ani mapovací diagramy zůstávají beze změny. Jejich návěstí pojmenovávají prvky modelu, takže jejich změna by byla změnou modelu.

**Nemění příklady instancí.** Stránka Příklady popisuje instance tak, jak v repozitáři jsou. Přejmenování ani doplnění příkladů typu FT není součástí návrhu.

**Nemění `title`, `id` ani `canonical`.** Název příručky HL7 Czech Order Implementation Guide je vedle typů K a FT obecný, ale jeho změna není součástí tohoto návrhu.

**Nemaže žádný soubor.** Na rozdíl od img-order zde není co osiřelého. Dvě nepublikované mapovací stránky návrh needituje, protože jejich smazání je rozhodnutí autora.

## Změny po stránkách

U každé stránky je uvedeno, co se mění proti dnešnímu stavu a proč. Anglická verze
odpovídá české, osnovy jsou u všech deseti stránek shodné.

### 1. Domovská stránka

`index-cs.md`, `index.md`

- Nový Úvod: příručka je implementační specifikací dvou typů eŽádanky, K a FT. Zachována původní teze o společné bázi požadavkových dokumentů i o budoucím rozšíření o další typy. Doplněno zákonné vymezení eŽádanky s odkazem na Reference.
- Nové: pododdíl Společná kostra a typové odlišnosti — sdílené sekce A.1, A.2, A.4 a A.5 a typový prvek A.3.2. Uvádí, že kostra i číslování prvků jsou společné všem typům eŽádanky, tedy i těm z jiných příruček, ale konkrétní jiný typ nejmenuje.
- Nové: pododdíl Dvě části eŽádanky — systémová hlavička a FHIR Bundle, s větou, že příručka popisuje pouze bundle.
- Nové: pododdíl Vztah k ostatní dokumentaci s tabulkou šesti dokumentů. Speciální funkční specifikace jsou uvedeny jako dvě samostatné, Funkční specifikace eŽádanky K a Funkční specifikace eŽádanky FT, a je výslovně řečeno, že odkaz na Speciální funkční specifikaci příslušného typu znamená u typu K jednu a u typu FT druhou.
- Zachován původní nadpis Stručný rozsah. Rozpis stránek doplněn o pět nových stránek a o oddíl About podle konfigurace příručky.
- Reference: doplněny oba papírové vzory, Poukaz typu K i Poukaz typu FT, a vyhláška č. 444/2024 Sb. Originál uváděl jen obecnou větu o příslušných typech zdravotnických formulářů.
- Vypuštěna věta o hlavním cíli příručky a o zajištění jednotného přístupu k reprezentaci. Co příručka definuje, je nově řečeno věcně v jednom odstavci.
- Vypuštěny zmínky o typu Z. Sesterská příručka je v Referencích uvedena jako příručka téže sady dokumentace, se kterou se sdílí kostra modelu a číslování prvků, bez uvádění typu, který pokrývá. Dosud se obě příručky navzájem neodkazovaly vůbec.
- Anglická verze srovnaná s českou: shodná osnova i shodný obsah, s ponechanými původními anglickými názvy oddílů.

### 2. Rozsah použití a obsah

`scope-and-content-cs.md`, `scope-and-content.md`

- Stránka měla 263 B a tvořily ji tři diagramy bez textu. Nově má stejnou osnovu jako img-order: Oblasti řešení, Obsah a Struktura žádanky.
- Původní nadpisy diagramů jsou zachovány — Skladba žádanky, Hlavička žádanky a Tělo žádanky. Přesunuly se pod Koncepční pohled, kde je nově i kostra logického modelu A.1 až A.5.
- Nové: Zahrnuté oblasti vymezují oba typy a u typu FT oba modely preskripce. Obory hodnot, kterými se požadovaná péče vyjadřuje, se tu neuvádějí — vazba na SNOMED CT je pouze `preferred`, takže by na tomto místě definici typu zkreslovala. Odkazuje se na stránku Terminologické aspekty.
- Nové: Nezahrnuté oblasti — ostatní typy eŽádanky bez jmenování konkrétního typu, chování systému eŽádanky, systémová hlavička, klinické scénáře, vykazování a úhrada, a terapeutický plán sestavený terapeutem v modelu s delegovaným rozsahem.
- Nové: tabulky prvků A.1.1 až A.1.9, A.2.1 až A.2.6 a A.3.1 až A.3.4, a k tomu dvě typové tabulky prvku A.3.2, jedna pro konziliární žádanku a jedna pro žádanku o fyzioterapii.
- U prvků A.1.6 a A.1.7 je doplněno, že chování systému řídí systémová hlavička, ne tyto prvky.
- Doplněno, že prvky A.1.1 a A.1.2 nese v modelu jeden prvek a že prvek A.2.2 je v modelu součástí prvku A.2.1. Bez toho čísla prvků v modelu nedohledáte.
- Prvek A.1.6 se nazývá Provádějící a sekce A.4 Prezentovaná forma, tedy tak, jak je nazývají modely dokumentu a jak je nazývá Obecná funkční specifikace. Samotný model sekce A.4 je nazván Vizuální podoba dokumentu, viz otevřené body. Model se podle pravidla z 4. 9. nepřejmenovává.
- Anglická verze srovnaná s českou: shodná osnova i shodný obsah, s ponechanými původními anglickými názvy oddílů.

### 3. Background

`background-cs.md`, `background.md`

- Zachován původní nadpis Poukaz K a FT.
- Vypuštěny tři odstavce, které se překrývají s Domovskou stránkou a s Rozsahem použití: společná báze a odlišnost v části body, popis obou typů a odstavec o cíli sjednotit reprezentaci požadavkových dokumentů.
- Doplněn papírový vzor typu FT. Originál uváděl jen Poukaz typu K a související formuláře.
- Výčet obsahu vyžádání podle vyhlášky č. 444/2024 Sb. je nově strukturovaný seznam a) až g) podle znění přílohy. Dosud to byl volný výčet bez označení bodů.
- Doplněn odkaz na stránku Terminologické aspekty a věta, že které prvky modelu jednotlivé požadavky naplňují, uvádí obě speciální funkční specifikace.
- Anglická verze srovnaná s českou: shodná osnova i shodný obsah, s ponechanými původními anglickými názvy oddílů.

### 4. Případy užití — nová stránka

`use-cases-cs.md`, `use-cases.md`

- Nová stránka. Menu ji dosud mělo zakomentované a soubor neexistoval.
- Dva odstavce: případy užití a klinické scénáře popisují Funkční specifikace eŽádanky K a Funkční specifikace eŽádanky FT, příručka je neopisuje, a instance, které je realizují, jsou na stránce Příklady.
- Anglická verze srovnaná s českou: shodná osnova i shodný obsah, s ponechanými původními anglickými názvy oddílů.

### 5. Workflow — nová stránka

`workflow-cs.md`, `workflow.md`

- Nová stránka. Menu ji dosud mělo zakomentované a soubor neexistoval.
- Tři odstavce bez nadpisů. Nese jedinou věc, kterou neříká žádný jiný dokument sady: že prvky status ve zdrojích bundlu nejsou stavem eŽádanky.
- Stavový model se neopisuje. Stavy, přechody a operace popisuje Standard systému eŽádanka, odkazuje se na něj.
- Anglická verze srovnaná s českou: shodná osnova i shodný obsah, s ponechanými původními anglickými názvy oddílů.

### 6. Logické modely

`logical-models-cs.md`, `logical-models.md`

- Doplněno pravidlo, že kostra logického modelu je jednotná napříč typy i příručkami a že se na prvky odkazuje číslem a názvem prvku.
- Doplněno, které sekce jsou společné a že sekci A.3 doplňuje v prvku A.3.2 model konkrétního typu.
- Opraven výběr modelů. Původní tři dotazy na LMG%, LMK% a LMF% vracely pouze tři modely dokumentu, kdežto všech 25 modelů sekcí a prvků má název začínající LMCz% a na stránce se vůbec nezobrazovalo. Nově jeden dotaz vypisuje modely dokumentu a druhý modely sekcí.
- V anglické verzi je druhý dotaz na LMEn%. Anglická sada modelů je menší než česká, viz otevřené body.
- Anglická verze srovnaná s českou: shodná osnova i shodný obsah, s ponechanými původními anglickými názvy oddílů.

### 7. Terminologické aspekty — nová stránka

`terminology-considerations-cs.md`, `terminology-considerations.md`

- Nová stránka. Menu ji dosud mělo zakomentované a soubor neexistoval.
- Členění je podle číselníku, stejně jako v img-order a jako na odpovídající stránce publikovaného HL7 Czech Imaging Report IG: Snomed-CT, MKN-10 / Orphacode, NČLPPOL, číselníky zdravotních pojišťoven, LOINC, FHIR, doporučení převzetí do péče a UCUM. Sloupce jsou Kód položky, Popis položky, Hodnota.
- Každý prvek je uveden právě jednou. Liší-li se obor hodnot mezi typy K a FT, je to uvedeno u prvku, ne zdvojením řádku.
- Obory hodnot ověřeny proti publikovanému terminologickému IG 0.3.0 a proti profilům v repozitáři: cz-coverage-type u A.1.4.1 a A.2.4.1, condition-cz a mkn-10 u indikační diagnózy, administrative-gender-cz u pohlaví, contactrole-cz u typu kontaktu, document-category u kategorie dokumentu.
- Typ žádanky, Composition.type, je uveden s národním oborem hodnot referralorder-types a s kódy 57133-1 pro typ K a 57154-7 pro typ FT. V logickém modelu pro něj prvek A.x není, proto je uveden bez čísla. Totéž platí pro doporučení převzetí do péče, které nese rozšíření profilu.
- Uvedeno, že code systémy korder-vzp-procedures-cs a ft-vzp-procedures-cs jsou označeny jako fragment a obsahují jen demonstrační podmnožinu kódů použitou v příkladech, takže závazným zdrojem je balík číselníků pojišťovny.
- U omezení pohyblivosti jsou uvedeny oba obory hodnot, cz-mobility-type se čtyřmi kódy typu hodnoceného úkonu a cz-mobility-value s osmi kódy hodnocení.
- Poslední oddíl vyjmenovává kódované prvky, u kterých příručka obor hodnot dosud nenavazuje: odbornost objednatele, alergie a intolerance, lateralita u typu FT a kódované prvky informací o vzorku.
- Anglická verze srovnaná s českou: shodná osnova i shodný obsah, s ponechanými původními anglickými názvy oddílů.

### 8. Mapování logického modelu

`model-map-cs.md`, `model-map.md`

- Doplněn sloupec se sekcí logického modelu a odkazy na samotné logické modely, dosud stránka odkazovala jen na mapovací stránky.
- Doplněny sekce A.4 a A.5 s odkazem na stránku Attatchmant-map. Ta v repozitáři existuje, ale neodkazovala na ni žádná stránka a nebyla uvedena v konfiguraci, takže se nepublikovala.
- Popisky odkazů sjednoceny s cíli. Původní tabulka měla u obou typů texty Header-map.html a Body-map.html bez ohledu na to, kam odkaz vede.
- Anglická verze srovnaná s českou: shodná osnova i shodný obsah, s ponechanými původními anglickými názvy oddílů.

### 9. Příklady

`examples-cs.md`, `examples.md`

- Stránka vznikla v commitu f50b405 z 3. 9. 2026, tento návrh na ni navazuje. Zachovává její obsah a doplňuje ho.
- Nadpisy sjednoceny na úroveň h3 jako na ostatních stránkách příručky. Původní verze používala h1 a h2, takže vedle titulku stránky generovaného publikátorem vznikal druhý nadpis první úrovně.
- Názvy příkladů typu K sjednoceny s Tabulkou 6 ve Funkční specifikaci eŽádanky K 6.2, aby byla vazba mezi FS a IG jednoznačná. Rozdíly jsou malé: FS nemá u dermatologického příkladu slovo „urgentní“ a nefrologický příklad nazývá „Nefrologické konzilium při progresi chronického onemocnění ledvin“.
- Doplněn sloupec Co demonstruje s textem z FS, takže klinické scénáře se nemusí v IG opisovat.
- U typu FT jsou uvedeny všechny tři příklady z Tabulky 7 ve Funkční specifikaci eŽádanky FT 7.0 se sloupcem Co demonstruje a se stavem „připravuje se“ ve sloupci Instance. Narovná se to, až budou instance dodány. Existující technický příklad BundleFTExample je zmíněn pod tabulkou.
- Doplněn výčet příkladů profilů s odkazy na instance.
- Anglická verze srovnaná s českou: shodná osnova i shodný obsah, s ponechanými původními anglickými názvy oddílů.

### 10. Poznámky k implementaci — nová stránka

`implementation-notes-cs.md`, `implementation-notes.md`

- Nová stránka. Menu ji dosud mělo zakomentované a soubor neexistoval.
- Osnova je stejná jako u img-order: Přehled s diagramem bundlu, Důsledky neměnnosti, Identifikátory, Podpis dokumentu a Přijetí se zobecněním.
- V Přehledu je uvedeno, že v jednom bundlu je vždy právě jedna kompozice, u typu K KOrderCompositionCz a u typu FT FTOrderCompositionCz.
- Nové: oddíl Jeden požadovaný výkon, jeden zdroj požadované služby. U typu FT nese počet a frekvenci provedení zdroj požadované služby, ne kompozice.
- Nové: tabulka vazby prvků A.3.2.2 až A.3.2.6 na sekce kompozice u typu K, včetně kódů LOINC a toho, čím je která sekce naplněna. Z názvů sekcí ta vazba není zřejmá.
- Doplněno, že u typu FT nese prvek A.3.2.2 Cíl vyšetření sekce goals a že klinické odůvodnění nese sekce reasons textem, protože je pro celý poukaz společné.
- Oddíl Důsledky neměnnosti je výslovně omezen na kontext systému eŽádanka, tedy na českou implementaci. U typu FT je doplněno, že totéž platí pro terapeutický plán sestavený terapeutem.
- Doplněno, že u výkonů zdravotních pojišťoven nelze přijetí se zobecněním provést, protože tyto číselníky nemají hierarchii konceptů.
- Anglická verze srovnaná s českou: shodná osnova i shodný obsah, s ponechanými původními anglickými názvy oddílů.

## Kontakt na zpracovatele

Návrh zpracoval tým revize dokumentace eŽádanek. K jednotlivým bodům je k dispozici
podrobný soupis nálezů, ze kterého návrh vychází, včetně odkazů na konkrétní kapitoly
Standardu systému eŽádanka a obou speciálních funkčních specifikací.
