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

### Podpůrné klinické informace {#supporting-information}

Podpůrné informace pomáhají příjemci posoudit a naplánovat péči. V žádance mají dvě úrovně:

| Umístění | Účel |
|---|---|
| `Composition.section[supportingInformation]` | Uspořádání klinického kontextu celého dokumentu; čitelný souhrn je v `text`, odkazy na strukturovaná data v `entry`. |
| `ServiceRequest.supportingInfo` | Výslovná vazba mezi konkrétním požadovaným výkonem a podklady, které jsou pro něj relevantní. |
| `ServiceRequest.reasonCode` / `reasonReference` | Indikace: proč je výkon požadován. `reasonReference` v těchto profilech odkazuje na `Condition`. |

Zařazení údaje do sekce Composition samo o sobě nevytváří vazbu na každý ServiceRequest. Pokud například omezená mobilita ovlivňuje dva požadované výkony, oba mohou odkazovat na tutéž Observation. V dokumentovém Bundlu se tato instance předá jednou; odkazy na ni se mohou opakovat v Composition i v jednotlivých požadavcích.

**Volba sekce dokumentu.** U K-žádanky patří známá anamnéza přednostně do `significantMedicalHistory`, diagnostické alternativy do `differentialDiagnosis`, medikace do `currentTreatment` a zprávy DiagnosticReport do `examinationResults`. Sekce `supportingInformation` doplňuje další relevantní kontext. U FT-žádanky je `reasons` pouze textová sekce bez `entry`; strukturované diagnózy lze uvést v `supportingInformation` a indikaci konkrétního výkonu v jeho `reasonReference`. Implantáty a pomůcky mají u obou dokumentů sekci `medicalDevices`; očekávané výsledky FT péče mají sekci `goals`.

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

Jednotlivý laboratorní výsledek podle CZ_ObservationOrder patří do otevřené části seznamu, mimo pojmenované specializované položky. Otevřený slicing ale stále respektuje povolené cílové profily. Composition navíc dovoluje CZ_CarePlanCore; oba ServiceRequest profily jej v `supportingInfo` nepovolují. DiagnosticReport patří do K sekce `examinationResults`, nikoli přímo do `supportingInfo`.

ServiceRequest má navíc `supportingInfo[implant]` odkazující na DeviceUseStatement, který následně odkazuje na Device. FT ServiceRequest má také `supportingInfo[goal]` pro Goal. V Composition se tyto zdroje řadí do sekcí `medicalDevices` a `goals`.

**Příklad FT po náhradě kyčle.** V [příkladu rehabilitace po TEP](Bundle-BundleFTHipRehabilitation.html) je diagnóza indikací v `reasonReference`, současná mobilita je v sekci `supportingInformation`, implantát v `medicalDevices` a cíl v `goals`. ServiceRequest odkazuje na relevantní implantát a cíl. Pokud příjemce potřebuje i výslovnou vazbu mobility na tento výkon, lze využít stejnou Observation:

```fsh
// Doplnění existujícího FTServiceRequest-HipRehabilitation:
* supportingInfo[mobility] = Reference(Observation-FTHipMobility)
```

Jde o doporučení k použití stávajících profilů, nikoli o nové povinné kardinality. Vybírejte relevantní údaje, zachovejte jejich data a stav a udržujte textový souhrn v souladu se strukturovanými daty. Chybějící položka neznamená například nepřítomnost alergií. V dokumentovém Bundlu dle BundleOrderCz se předávají i odkazované zdroje.

Základní význam elementů popisuje FHIR R4: [ServiceRequest.supportingInfo](https://hl7.org/fhir/R4/servicerequest-definitions.html#ServiceRequest.supportingInfo) a [Composition.section](https://hl7.org/fhir/R4/composition-definitions.html#Composition.section).
