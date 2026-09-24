{% include variable-definitions.md %}

### Oblasti řešení

#### Zahrnuté oblasti

Tato příručka pokrývá **eŽádanku typu K, Konziliární žádanku**, a **eŽádanku typu FT, Žádanku o fyzioterapii**. Oba typy sdílí kostru logického modelu i číslování prvků a liší se pouze v prvku `A.3.2 Datové elementy objednávky`.

**Konziliární žádankou** se rozumí žádanka, jejímž předmětem je odborné posouzení nebo výkon v kompetenci specialisty a jejímž výsledkem je klinický dokument, typicky konziliární nebo ambulantní zpráva.

**Žádankou o fyzioterapii** se rozumí žádanka na fyzioterapii nebo ergoterapii u pacienta s poruchou funkce, kterou lze terapií ovlivnit. Vlastní tomuto typu je volba mezi dvěma modely preskripce: ošetřující lékař buď sám vypíše konkrétní požadované výkony, jejich počet a frekvenci, nebo určí pouze kategorii požadované péče, tedy fyzioterapii nebo ergoterapii, a sestavení terapeutického plánu deleguje na terapeuta se specializovanou způsobilostí. Obsahová pravidla obou modelů uvádí Speciální funkční specifikace eŽádanky typu FT.

U obou typů lze na jedné eŽádance požadovat více služeb současně, protože prvek `A.3.2.1 Požadované vyšetření` má kardinalitu `1..*`. Obory hodnot, kterými se požadovaná péče vyjadřuje, uvádí stránka [Terminologické aspekty](terminology-considerations-cs.html).

#### Nezahrnuté oblasti

Tato příručka neřeší celkový ekosystém eŽádanek ani způsob jejich přenosu. Dále nepokrývá:

- **ostatní typy eŽádanky** — mají vlastní implementační příručky, viz {{czImgOrder}},
- **chování systému eŽádanky** — stavy a jejich přechody, operace rozhraní, oprávnění, notifikace a provozní podmínky popisuje Standard systému eŽádanka,
- **systémovou hlavičku eŽádanky** — tato příručka popisuje pouze FHIR Bundle, viz [Domovská stránka](index-cs.html),
- **klinické scénáře a typové požadavky na obsah** — jsou ve Speciální funkční specifikaci příslušného typu, tedy ve Funkční specifikaci eŽádanky K a ve Funkční specifikaci eŽádanky FT,
- **vykazování a úhradu vyžádané péče** — mapování na datové rozhraní zdravotních pojišťoven je ve Speciální funkční specifikaci příslušného typu,
- **terapeutický plán sestavený terapeutem** — u modelu s delegovaným rozsahem jej terapeut zaznamenává do vlastní zdravotnické dokumentace, nikoli do eŽádanky.

### Obsah

#### Informační modely

##### Koncepční pohled

Kostra logického modelu je pro všechny typy eŽádanek jednotná a číslují se v ní stejná čísla prvků. Číslo prvku, například `A.1.7`, označuje tentýž údaj bez ohledu na typ eŽádanky a bez ohledu na to, ve které implementační příručce je definován. Na položky logického modelu se proto odkazuje **číslem a názvem prvku**, nikoli názvem modelu.

| Číslo | Sekce | Co obsahuje | Kdo ji definuje |
|---|---|---|---|
| `A.1` | Hlavička dokumentu | Administrativní údaje. | společná pro všechny typy |
| `A.2` | Tělo dokumentu | Informace o objednávce a její odůvodnění, klinická událost, úhrada, termín návštěvy a informace o vzorku. | společná pro všechny typy |
| `A.3` | Podpůrné informace a datové elementy | Podpůrné klinické informace a vymezení požadované péče. Prvek `A.3.2` je typový. | částečně společná, `A.3.2` odlišné pro K a pro FT |
| `A.4` | Prezentovaná forma | Lidsky čitelná podoba dokumentu. | společná pro všechny typy |
| `A.5` | Přílohy | Přílohy připojené k eŽádance. | společná pro všechny typy |

Příručka definuje kostru jako samostatný model **Obecná žádanka** a nad ním dva typové modely, **K-žádanka** a **FT-žádanka**. Ty se od sebe liší pouze modelem použitým pro tělo dokumentu.

###### Skladba žádanky

<figure>
  {% include orderDiagram-cz.svg %}
</figure>

###### Hlavička žádanky

<figure>
  {% include orderHeaderDiagram.svg %}
</figure>

###### Tělo žádanky

<figure>
  {% include orderBodyDiagram.svg %}
</figure>

#### Subjekty

Pacient, zdravotnický pracovník a poskytovatel zdravotních služeb jsou definováni v {{czCore}} a tato příručka je pouze používá. Profil pacienta lokalizuje základní pojmy včetně identifikátorů a terminologie pro použití v českém kontextu, profil zdravotnického pracovníka umožňuje osobě přidělit roli, a profil poskytovatele vymezuje způsob reprezentace organizace včetně nadřízených a podřízených pracovišť.

#### Objekty

Zdravotnický přístroj a zdravotnický prostředek jsou rovněž definovány v {{czCore}}. Totéž platí pro komponenty společné více dokumentům, například pro biometrické údaje, které jsou napříč dokumenty definovány shodně.

### Struktura žádanky

Následující oddíly uvádějí prvky jednotlivých sekcí kostry. Úplný seznam prvků s jejich kardinalitami, datovými typy a obory hodnot je na stránce [Logické modely](logical-models-cs.html), mapování na FHIR profily na stránce [Mapování logického modelu](model-map-cs.html).

#### Hlavička dokumentu

Hlavička je pro oba typy shodná.

| Číslo | Prvek | Co nese |
|---|---|---|
| `A.1.1` | Identifikace pacienta | Resortní identifikátor a identifikační údaje pacienta. |
| `A.1.2` | Kontaktní informace pacienta | Adresu, kontaktní údaje a kontaktní osoby. Typ kontaktní osoby rozlišuje emergentní kontakty, zákonné zástupce a ostatní osoby se vztahem k pacientovi. |
| `A.1.3` | Zdravotní pojištění | Zdravotní pojišťovna a pojistný vztah pacienta. Pojišťovna nemusí být plátcem vyžádané péče. |
| `A.1.4` | Úhrada | Způsob úhrady vyžádané péče. |
| `A.1.5` | Objednatel | Žadatel, tedy poskytovatel, pracoviště a osoby, které žádanku sepsaly a podepsaly. |
| `A.1.6` | Provádějící | Poskytovatel vyžádané péče **doporučený při vystavení**. U neadresné eŽádanky nemusí být uveden. Skutečně provádějícího poskytovatele nese systémová hlavička, ne tento prvek. |
| `A.1.7` | Příjemce nálezu | Dodateční příjemci výsledku vedle objednatele, tak jak je žadatel určil **při vystavení**. Rozesílání výsledku řídí systémová hlavička, ne tento prvek. |
| `A.1.8` | Metadata dokumentu | Údaje o dokumentu jako takovém, například jeho identifikátor, kategorie, datum vytvoření a správce. |
| `A.1.9` | Elektronické podpisy | Elektronický podpis nebo pečeť dokumentu podle zákona č. 327/2011 Sb., § 54a, a časové razítko. |

Prvky `A.1.1` a `A.1.2` nese v modelu jeden prvek, protože identifikace pacienta a jeho kontaktní informace jsou modelovány společně.

#### Tělo dokumentu

Tělo je v sekci `A.2` pro oba typy shodné.

| Číslo | Prvek | Co nese |
|---|---|---|
| `A.2.1` | Informace o objednávce | Identifikátor a datum objednávky, požadovaný termín provedení, urgentnost, text objednávky a informace pro pacienta. |
| `A.2.2` | Odůvodnění vyšetření | Indikační diagnózu, klinickou otázku a důvod objednávky, kódem i textem. V modelu je součástí prvku `A.2.1`. |
| `A.2.3` | Klinická událost | Kontext poskytnutí péče, ke kterému se žádanka váže, například návštěvu ambulance, při níž žádanka vznikla. |
| `A.2.4` | Úhrada | Údaje ke způsobu platby za vyžádanou péči v těle dokumentu, včetně informací o plátci a komentáře. |
| `A.2.5` | Termín návštěvy | Požadovaný nebo dohodnutý termín provedení, jeho délku, místo a instrukce pro pacienta. |
| `A.2.6` | Informace o vzorku | Údaje o biologickém vzorku pro případy, kdy je předmětem požadavku jeho vyšetření. |

#### Podpůrné informace a datové elementy

| Číslo | Prvek | Co nese |
|---|---|---|
| `A.3.1` | Klinické informace | Údaje sdělované poskytovateli vyžádané péče, které mají vliv na její poskytnutí nebo na interpretaci výsledku: biometrické údaje, další relevantní klinické informace, medikaci, implantáty, urgentní informace, omezení pohyblivosti pacienta, fyzikální nález, datum hospitalizace, očkování a další formalizované údaje. |
| `A.3.2` | Datové elementy objednávky | Vymezení požadované péče. Obsah se mezi typy K a FT liší, viz níže. |
| `A.3.3` | Objednávky plánované péče | Odkazy na objednávky plánované péče navazující na tuto žádanku. |
| `A.3.4` | Ostatní podpůrné informace | Ostatní podpůrné informace, například termín, ke kterému je výsledek potřebný. |

##### Datové elementy objednávky u konziliární žádanky

| Číslo | Prvek | Co nese |
|---|---|---|
| `A.3.2.1` | Požadované vyšetření | Kód a název požadované služby a poznámku objednatele. Blok se může opakovat. |
| `A.3.2.2` | Závažná anamnestická data | Textový popis anamnestických údajů významných pro požadovanou péči. |
| `A.3.2.3` | Výsledky provedených vyšetření | Souhrn nebo výběr výsledků již provedených vyšetření relevantních pro klinické rozhodování. |
| `A.3.2.4` | Diferenciálně diagnostická rozvaha | Zvažované diagnózy a jejich zdůvodnění. |
| `A.3.2.5` | Současná léčba, medikace včetně dávkování | Přehled probíhající léčby včetně dávkování. |
| `A.3.2.6` | Zapůjčená dokumentace | Seznam nebo popis zapůjčené zdravotnické dokumentace přiložené k objednávce. |

##### Datové elementy objednávky u žádanky o fyzioterapii

| Číslo | Prvek | Co nese |
|---|---|---|
| `A.3.2.1` | Požadované vyšetření | Kód a název požadované péče, část těla, lateralitu, počet, frekvenci, poznámku a požadované místo poskytnutí péče, například domácí prostředí pacienta. Blok se může opakovat. |
| `A.3.2.2` | Cíl vyšetření | Cíl, kterého má být terapií dosaženo. |

V modelu obecné indikace s delegovaným rozsahem ošetřující lékař konkrétní výkony neuvádí a požadovanou péči vyjadřuje pouze její kategorií.

#### Prezentovaná forma

Lidsky čitelná podoba dokumentu v požadovaném formátu PDF. Nese typ obsahu, jazyk, název, data nebo URL obsahu a datum vytvoření.

#### Přílohy

Ostatní přílohy, kterými lze doplnit strukturovaný obsah, například ambulantní nebo propouštěcí zprávy, obrazovou dokumentaci nebo data poskytnutá pacientem. Příloha nenahrazuje strukturovaný údaj: údaj, pro který je v logickém modelu definován strukturovaný prvek, musí být uveden tímto prvkem.

Přílohy eŽádanky je třeba odlišit od dokumentů zásilky, kterou se předává výsledek při vyřízení eŽádanky. Ty se řídí pravidly Dočasného úložiště a s tělem eŽádanky nesouvisejí.
