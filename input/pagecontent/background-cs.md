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

Společné sekce zachovávají pořadí IMG-Order: `orderInformation`, `clinicalQuestion` (protějšek IMG `clinicalQuestion`), `coverage`, `appointment`, `carePlan`, `medicalDevices`, `supportingInformation`, `attachments`. Nejdříve má být zřejmé, co se požaduje a na jakou otázku má péče odpovědět. Přílohy jsou vždy poslední.

Specializované sekce bez samostatného protějšku v IMG-Order doplňují tento sled podle významu pro posouzení žádanky:

| Profil | Umístění a pořadí | Odůvodnění |
| --- | --- | --- |
| FT | Za `clinicalQuestion`: `goals` | Očekávaný funkční výsledek přímo upřesňuje účel požadované terapie. |

Jde o doporučené pořadí prezentace, promítnuté do deklarace profilů a příkladů. Stejně jako IMG-Order ponecháváme `section.slicing.ordered = false`; samotné odlišné pořadí ve vstupním dokumentu proto není validační chybou. Priorita sekce nemění její kardinalitu ani povinnost vyplnění. Závažná upozornění z `supportingInformation` má uživatelské rozhraní zvýraznit i při tomto pořadí sekcí.

### Podpůrné klinické informace {#supporting-information}

Závažné anamnestické údaje patří do narativu `supportingInformation`; strukturované stavy se odkazují přes `entry` na `CZ_ConditionCore`. Zapůjčená i jiná doplňující dokumentace patří do `attachments`, s odkazy na `CZ_Attachment` pro vložené dokumenty i dokumenty dostupné přes URL.

Současná medikace se předává v `Composition.section[supportingInformation].entry` a pro příslušný požadavek také v `ServiceRequest.supportingInfo`. Použijte `CZ_MedicationStatementCore` pro užívání léčiva a `CZ_MedicationAdministrationCore` pro konkrétní podání. Odkazy vedou na stejný zdroj, nikoli jeho kopie. Volný text léčby lze shrnout v narativu sekce; informace o užívání sama nedokládá konkrétní podání.

Výsledky vyšetření podle `CZ_MedicalTestResultCore` se předávají v `Composition.section[supportingInformation].entry` a zároveň v `ServiceRequest.supportingInfo`, pokud jsou podkladem daného požadavku. Obě reference směřují na stejnou Observation; výsledek se nekopíruje. Typ vyšetření patří do `code`, výsledek do `value[x]` nebo `component` a komentář do `note`.

Diferenciální diagnózy se předávají jako `CZ_ConditionCore` v `supportingInformation.entry`. Diferenciální diagnóza má mít vyplněný `Condition.verificationStatus`, například `differential`; zdůvodnění rozvahy lze zaznamenat v `Condition.note`. Pro konkrétní službu se stejný zdroj odkazuje ze `ServiceRequest.supportingInfo`, případně z `reasonReference`, pokud je přímou indikací. Samostatná sekce diferenciálních diagnóz se nepoužívá.

**Doporučení k hospitalizaci nebo převzetí do péče.** Každou takovou službu vyjádřete samostatným `ServiceRequest` s vlastním identifikátorem, `code`, pacientem a žadatelem. Pro doporučení použijte `intent = proposal`, pro skutečnou objednávku `intent = order`. Nový požadavek zařaďte do `Composition.section[orderInformation].entry` a jeho zdroj do dokumentového Bundle. Pokud není dohodnutý kód služby, použijte `code.text`. Doporučení se nepředává jako disposition extension na požadavku na jiné vyšetření. `basedOn` použijte pouze tehdy, když nový požadavek skutečně naplňuje odkazovaný návrh nebo objednávku; samotná časová návaznost nestačí. Podrobnosti standardních elementů uvádí [FHIR R4 ServiceRequest](https://hl7.org/fhir/R4/servicerequest-definitions.html). Viz [příklad doporučení k hospitalizaci](Bundle-BundleHospitalAdmissionRecommendationExample.html).

K-žádanka musí v `Composition.section[orderInformation].entry` odkazovat alespoň na jeden `ServiceRequest` s `intent = order`. Samotné doporučení ani soubor požadavků pouze s `intent = proposal` netvoří platnou K-žádanku. Toto pravidlo vynucuje invariant `k-order-requires-order` na profilu `KOrderCompositionCz`. Při validaci musí být odkazované požadavky dostupné, typicky v dokumentovém Bundle.

Podpůrné informace pomáhají příjemci posoudit a naplánovat péči. V žádance mají dvě úrovně:

| Umístění | Účel |
|---|---|
| `Composition.section[supportingInformation]` | Uspořádání klinického kontextu celého dokumentu; čitelný souhrn je v `text`, odkazy na strukturovaná data v `entry`. |
| `ServiceRequest.supportingInfo` | Výslovná vazba mezi konkrétním požadovaným výkonem a podklady, které jsou pro něj relevantní. |
| `ServiceRequest.reasonCode` / `reasonReference` | Indikace: proč je výkon požadován. `reasonReference` v těchto profilech odkazuje na `Condition`. |

Zařazení údaje do sekce Composition samo o sobě nevytváří vazbu na každý ServiceRequest. Pokud například omezená mobilita ovlivňuje dva požadované výkony, oba mohou odkazovat na tutéž Observation. V dokumentovém Bundlu se tato instance předá jednou; odkazy na ni se mohou opakovat v Composition i v jednotlivých požadavcích.

**Volba sekce dokumentu.** K a FT sdílejí sekci `clinicalQuestion` pro důvod žádanky a klinickou otázku (povinný text při přítomnosti sekce, volitelné odkazy na CZ_ClinicalQuestion), `carePlan` pro plánovanou péči A.3.3 a `supportingInformation` pro společné klinické údaje A.3.1 a další informace A.3.4. Strukturovaná medikace a zdravotní problémy mají společné umístění v `supportingInformation`. Specializované sekce K rozpracovávají konziliární obsah A.3.2; případné reference znovu využívají stejné zdroje. Implantáty a pomůcky mají sekci `medicalDevices`; očekávané výsledky FT sekci `goals`. Indikace jednotlivého výkonu zůstává v ServiceRequest.reasonCode nebo reasonReference.

**Převod dokumentů.** FT sekci `reasons` (LOINC 29299-5) nahrazuje `clinicalQuestion` (LOINC 104720-8) se zachováním textu indikace. Odkazy na plánovanou péči CarePlan se přesouvají ze `supportingInformation` do `carePlan` (LOINC 18776-5). Obě nové sekce jsou nepovinné a nejvýše jednou. Přebírají význam klinické otázky a plánu péče z IMG-Order s použitím cílových profilů CZ Core pro K/FT; samotný profil IMG-Order je spravován samostatně.

**Podpůrné reference.** `Composition.section[supportingInformation].entry` i `ServiceRequest.supportingInfo` používají jeden seznam referencí bez slicingu. Jednotlivé typy nemají vlastní kardinality; všechny reference musí odpovídat povoleným cílovým profilům.

Výsledky a měření se předávají jako Observation, zdravotní stavy jako Condition, alergie jako AllergyIntolerance, upozornění jako Flag a očkování jako Immunization. Užívání léčiv popisuje MedicationStatement, konkrétní podání MedicationAdministration. Zachovejte stav, čas a jednotky údajů. Přímá indikace patří do `reasonReference`; diferenciální diagnóza má mít vyplněný `Condition.verificationStatus`.

Podpůrný Encounter lze odkázat ze seznamu; kontakt, při němž žádanka vznikla, patří do `ServiceRequest.encounter`. Použití pomůcky vyjadřuje DeviceUseStatement. FT navíc dovoluje Goal pro očekávaný výsledek, zatímco aktuální pohyblivost zachycuje Observation. Composition řadí pomůcky do `medicalDevices` a cíle do `goals`. CarePlan patří do sekce `carePlan`; ServiceRequest jej v `supportingInfo` nepovoluje.

**Příklad FT po náhradě kyčle.** V [příkladu rehabilitace po TEP](Bundle-BundleFTHipRehabilitation.html) je diagnóza indikací v `reasonReference`, současná mobilita je v sekci `supportingInformation`, implantát v `medicalDevices` a cíl v `goals`. ServiceRequest odkazuje na relevantní implantát a cíl. Pokud příjemce potřebuje i výslovnou vazbu mobility na tento výkon, lze využít stejnou Observation:

```fsh
// Doplnění existujícího FTServiceRequest-HipRehabilitation:
* supportingInfo[2] = Reference(Observation-FTHipMobility)
```

Jde o doporučení k použití stávajících profilů, nikoli o nové povinné kardinality. Vybírejte relevantní údaje, zachovejte jejich data a stav a udržujte textový souhrn v souladu se strukturovanými daty. Chybějící položka neznamená například nepřítomnost alergií. V dokumentovém Bundlu dle BundleOrderCz se předávají i odkazované zdroje.

Základní význam elementů popisuje FHIR R4: [ServiceRequest.supportingInfo](https://hl7.org/fhir/R4/servicerequest-definitions.html#ServiceRequest.supportingInfo) a [Composition.section](https://hl7.org/fhir/R4/composition-definitions.html#Composition.section).
