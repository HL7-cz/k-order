### Poukaz K a FT

Elektronické dokumenty typu K-Žádanka a FT-Žádanka představují specializované požadavkové dokumenty určené pro výměnu informací mezi poskytovateli zdravotních služeb v rámci diagnostických a terapeutických procesů.

Oba dokumenty vycházejí ze společné báze logického modelu žádanek definované v této implementační příručce. Sdílí společné administrativní, identifikační a workflow komponenty a liší se především ve specifické části „body“, která obsahuje odborné datové elementy reprezentující vlastní požadované zdravotní služby.

Poukaz typu K je určen zejména pro žádosti o komplementární vyšetření. FT-Žádanka je určena především pro požadavky související s fyzioterapeutickou a rehabilitační péčí. Oba dokumenty zachovávají jednotný princip reprezentace zdravotnické dokumentace a umožňují interoperabilní elektronickou výměnu dat.

V oblasti zdravotnických informačních systémů je cílem sjednotit způsob reprezentace požadavkových dokumentů napříč různými odbornými doménami a vytvořit společný základ pro budoucí rozšiřování dalších typů elektronických žádanek.

Stejně jako jiné zdravotnické dokumenty využívají K-Žádanka a FT-Žádanka standardy a terminologické systémy používané v českém i evropském prostředí elektronického zdravotnictví. Jedná se zejména o:
- HL7 FHIR,
- SNOMED CT,
- MKN-10,
- národní číselníky a identifikátory,
- případně další oborově specifické terminologie.

Papírovým vzorem pro elektronické žádanky je formulář Poukazu na vyšetření/ošetření typu K a související formuláře používané v českém zdravotnictví. Aktuální verze tiskopisů jsou dostupné na stránkách [VZP – tiskopisy pro poskytovatele](https://www.vzp.cz/poskytovatele/tiskopisy). 

K 19. 2. 2025 obsahuje vyžádání dalších zdravotních služeb zejména:
- požadované zdravotní služby,
- zdůvodnění požadavku,
- naléhavost požadavku,
- údaje o posledně zjištěném zdravotním stavu včetně relevantních výsledků vyšetření,
- údaje o dosavadní léčbě a reakci pacienta,
- pracovní diagnózu,
- zásadní anamnestické údaje související s požadovanými zdravotními službami.

Tato implementační příručka převádí uvedené legislativní požadavky do interoperabilní elektronické podoby založené na standardu HL7 FHIR R4.

### Pořadí sekcí žádanky

Společné sekce zachovávají pořadí IMG-Order: `orderInformation`, `clinicalIndication` (protějšek IMG `clinicalQuestion`), `coverage`, `appointment`, `carePlan`, `medicalDevices`, `supportingInformation`, `attachments`. Nejdříve má být zřejmé, co se požaduje a na jakou otázku má péče odpovědět. Přílohy jsou vždy poslední.

Specializované sekce bez samostatného protějšku v IMG-Order doplňují tento sled podle významu pro posouzení žádanky:

| Profil | Umístění a pořadí | Odůvodnění |
| --- | --- | --- |
| K | Za `clinicalIndication`: `differentialDiagnosis`, `examinationResults`, `currentTreatment`, `significantMedicalHistory` | Nejprve podezření, která má konzilium posoudit, poté dostupné výsledky, současná léčba a historický kontext. Uvádějí se pouze údaje relevantní pro požadovanou péči. |
| FT | Za `clinicalIndication`: `goals` | Očekávaný funkční výsledek přímo upřesňuje účel požadované terapie. |
| K | Před `attachments`: `referencedDocumentation` | Odkazy na další dokumentaci navazují na klinický obsah; předávané přílohy uzavírají dokument. |

Jde o doporučené pořadí prezentace, promítnuté do deklarace profilů a příkladů. Stejně jako IMG-Order ponecháváme `section.slicing.ordered = false`; samotné odlišné pořadí ve vstupním dokumentu proto není validační chybou. Priorita sekce nemění její kardinalitu ani povinnost vyplnění. Závažná upozornění z `supportingInformation` má uživatelské rozhraní zvýraznit i při tomto pořadí sekcí.

### Podpůrné klinické informace {#supporting-information}

**Doporučení k hospitalizaci nebo převzetí do péče.** Každou takovou službu vyjádřete samostatným `ServiceRequest` s vlastním identifikátorem, `code`, pacientem a žadatelem. Pro doporučení použijte `intent = proposal`, pro skutečnou objednávku `intent = order`. Nový požadavek zařaďte do `Composition.section[orderInformation].entry` a jeho zdroj do dokumentového Bundle. Pokud není dohodnutý kód služby, použijte `code.text`. Doporučení se nepředává jako disposition extension na požadavku na jiné vyšetření. `basedOn` použijte pouze tehdy, když nový požadavek skutečně naplňuje odkazovaný návrh nebo objednávku; samotná časová návaznost nestačí. Podrobnosti standardních elementů uvádí [FHIR R4 ServiceRequest](https://hl7.org/fhir/R4/servicerequest-definitions.html). Viz [příklad doporučení k hospitalizaci](Bundle-BundleHospitalAdmissionRecommendationExample.html).

Podpůrné informace pomáhají příjemci posoudit a naplánovat péči. V žádance mají dvě úrovně:

| Umístění | Účel |
|---|---|
| `Composition.section[supportingInformation]` | Uspořádání klinického kontextu celého dokumentu; čitelný souhrn je v `text`, odkazy na strukturovaná data v `entry`. |
| `ServiceRequest.supportingInfo` | Výslovná vazba mezi konkrétním požadovaným výkonem a podklady, které jsou pro něj relevantní. |
| `ServiceRequest.reasonCode` / `reasonReference` | Indikace: proč je výkon požadován. `reasonReference` v těchto profilech odkazuje na `Condition`. |

Zařazení údaje do sekce Composition samo o sobě nevytváří vazbu na každý ServiceRequest. Pokud například omezená mobilita ovlivňuje dva požadované výkony, oba mohou odkazovat na tutéž Observation. V dokumentovém Bundlu se tato instance předá jednou; odkazy na ni se mohou opakovat v Composition i v jednotlivých požadavcích.

**Volba sekce dokumentu.** K a FT sdílejí sekci `clinicalIndication` pro důvod žádanky a klinickou otázku (povinný text při přítomnosti sekce, volitelné odkazy na CZ_ClinicalQuestion), `carePlan` pro plánovanou péči A.3.3 a `supportingInformation` pro společné klinické údaje A.3.1 a další informace A.3.4. Strukturovaná medikace a zdravotní problémy mají společné umístění v `supportingInformation`. Specializované sekce K rozpracovávají konziliární obsah A.3.2; případné reference znovu využívají stejné zdroje. Implantáty a pomůcky mají sekci `medicalDevices`; očekávané výsledky FT sekci `goals`. Indikace jednotlivého výkonu zůstává v ServiceRequest.reasonCode nebo reasonReference.

**Převod dokumentů.** FT sekci `reasons` (LOINC 29299-5) nahrazuje `clinicalIndication` (LOINC 104720-8) se zachováním textu indikace. Odkazy na plánovanou péči CarePlan se přesouvají ze `supportingInformation` do `carePlan` (LOINC 18776-5). Obě nové sekce jsou nepovinné a nejvýše jednou. Přebírají význam klinické otázky a plánu péče z IMG-Order s použitím cílových profilů CZ Core pro K/FT; samotný profil IMG-Order je spravován samostatně.

**Výběr položky (slice).** Následující názvy se používají jak v `supportingInfo`, tak v `supportingInformation.entry`:

| Položka | Kdy ji použít |
|---|---|
| `bodyHeight`, `bodyWeight` | Výška a hmotnost relevantní pro péči, včetně data měření a jednotky v Observation. |
| `relevantCondition` | Onemocnění nebo stav ovlivňující péči. Přímá indikace patří také do `reasonReference`, pokud je takto strukturovaně vyjádřena. |
| `medication` | Relevantní užívání léčiv jako MedicationStatement. |
| `allergyIntolerance` | Strukturovaný záznam alergie či intolerance. |
| `warning` | Klinické upozornění jako Flag, včetně jeho platnosti. |
| `mobility` | Zjištěná pohyblivost a potřeba dopomoci; cílový budoucí stav se vyjadřuje pomocí Goal. |
| `physicalFinding` | Nález z fyzikálního vyšetření podle profilu CZ_PhysicalFindingOrder. |
| `hospitalization` | Relevantní hospitalizace nebo jiný Encounter. Název slice sám neomezuje třídu Encounter na hospitalizaci. |
| `immunization` | Relevantní záznam očkování. |
| `additionalObservation` | Formalizované pozorování podle CZ_AdditionalObservationOrder s kategorií `survey`. Nejde o obecnou položku pro všechny laboratorní výsledky. |

Jednotlivý laboratorní výsledek podle CZ_ObservationOrder patří do otevřené části seznamu, mimo pojmenované specializované položky. Otevřený slicing ale stále respektuje povolené cílové profily. Composition dovoluje CZ_CarePlanCore v sekci `carePlan`; oba ServiceRequest profily jej v `supportingInfo` nepovolují. DiagnosticReport patří do K sekce `examinationResults`, nikoli přímo do `supportingInfo`.

ServiceRequest má navíc `supportingInfo[implant]` odkazující na DeviceUseStatement, který následně odkazuje na Device. FT ServiceRequest má také `supportingInfo[goal]` pro Goal. V Composition se tyto zdroje řadí do sekcí `medicalDevices` a `goals`.

**Příklad FT po náhradě kyčle.** V [příkladu rehabilitace po TEP](Bundle-BundleFTHipRehabilitation.html) je diagnóza indikací v `reasonReference`, současná mobilita je v sekci `supportingInformation`, implantát v `medicalDevices` a cíl v `goals`. ServiceRequest odkazuje na relevantní implantát a cíl. Pokud příjemce potřebuje i výslovnou vazbu mobility na tento výkon, lze využít stejnou Observation:

```fsh
// Doplnění existujícího FTServiceRequest-HipRehabilitation:
* supportingInfo[mobility] = Reference(Observation-FTHipMobility)
```

Jde o doporučení k použití stávajících profilů, nikoli o nové povinné kardinality. Vybírejte relevantní údaje, zachovejte jejich data a stav a udržujte textový souhrn v souladu se strukturovanými daty. Chybějící položka neznamená například nepřítomnost alergií. V dokumentovém Bundlu dle BundleOrderCz se předávají i odkazované zdroje.

Základní význam elementů popisuje FHIR R4: [ServiceRequest.supportingInfo](https://hl7.org/fhir/R4/servicerequest-definitions.html#ServiceRequest.supportingInfo) a [Composition.section](https://hl7.org/fhir/R4/composition-definitions.html#Composition.section).
