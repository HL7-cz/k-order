# Sjednocení sekcí K/FT podle IMG-Order: analýza a návrh

Výchozí analýza k 10. 9. 2026. Tabulky níže zachycují stav před implementací návrhu.

První realizovaný krok: sekce `signature` byla odstraněna z K i FT Composition. Bundle nyní výslovně deklaruje volitelné položky `provenance` s profilem CZ_Provenance; podpis celého dokumentu zůstává v Bundle.signature. Mapování FT vede na Provenance v Bundle a podepsané zdroje identifikuje Provenance.target.

Aktualizace 11. 9. 2026: K/FT nyní sdílejí `clinicalQuestion 0..1` (LOINC 104720-8, text 1..1, volitelné ConditionCore) a `carePlan 0..1` (LOINC 18776-5, CarePlanCore). FT `reasons` je nahrazeno klinickou indikací. CarePlan byl přesunut ze supportingInformation do carePlan v profilech i mapování A.3.3. Příklady a česká i anglická dokumentace obsahují nový model a převodní pravidla. Společná strukturovaná medikace zůstává v supportingInformation; supportingInformation K rozpracovává A.3.2.5. Změna kódů příloh a změny samotného IMG-Order dosud implementovány nejsou. Následující tabulky zachycují původní stav a návrh.

**Doporučení:** sjednotit význam a názvy společných sekcí K/FT, jejich vazbu na jednotlivé ServiceRequest a používané profily CZ Core. Z IMG-Order převzít zejména explicitní klinickou indikaci a plán péče. Zachovat odborné sekce K a cíle FT. Mapování IMG-Order nejprve opravit, protože některé jeho cesty neodpovídají skutečným profilům.

## Podklady a rozsah

RTG existuje jako sousední projekt `../RTG` i jako kopie v [archive/RTG](../archive/RTG). Porovnávané profily, tři mapovací soubory a konfigurace jsou v obou umístěních totožné. IMG-Order má canonical `https://hl7.cz/fhir/img-order`, verzi `0.1.0`, FHIR R4 a závislost na CZ Core `1.0.0`.

- K: [Composition](../input/fsh/profiles/composition-K-Order.fsh), [ServiceRequest](../input/fsh/profiles/serviceRequest-K-Order.fsh).
- FT: [Composition](../input/fsh/profiles/composition-FT-Order.fsh), [ServiceRequest](../input/fsh/profiles/serviceRequest-FT-Order.fsh).
- RTG: [Composition](../archive/RTG/input/fsh/profiles/composition.fsh), [ServiceRequest — order-information.fsh](../archive/RTG/input/fsh/profiles/order-information.fsh).
- IMG-Order mapování: [tělo dokumentu](../archive/RTG/input/pagecontent/Body-map-cs.xml), [hlavička](../archive/RTG/input/pagecontent/Header-map-cs.xml), [přílohy](../archive/RTG/input/pagecontent/Attachment-map-cs.xml).
- Současné Order mapování: [důvod objednávky](../input/includes/order-reason-map-cs.xml), [navazující péče](../input/includes/follow-up-orders-map-cs.xml).

Rozhodující pro současná omezení je FSH. Například průvodní text RTG uvádí povinnou úhradu a termín a pevné pořadí sekcí, ale profil je má nepovinné a slicing sekcí neuspořádaný. Pomlčka v tabulkách znamená nepřítomnost pojmenovaného slice; otevřený slicing obecně umožňuje další sekce.

## Současné sekce Composition

Kardinality v tabulce patří sekcím, nikoli jejich `entry`.

| Sekce | K | FT | IMG-Order | Významný rozdíl |
|---|---|---|---|---|
| `orderInformation` | 1..1; 57133-1 | 1..1; 57154-7 | 1..*; 55115-0 | K/FT vyžadují alespoň jeden ServiceRequest v sekci; RTG dovoluje nulový počet entry. |
| Klinická indikace / otázka | — | `reasons` 0..1; 29299-5 | `clinicalQuestion` 1..*; 18785-6 | FT zakazuje entry; RTG vyžaduje text a dovoluje ConditionClinicalQuestion. |
| `coverage` | 1..1 | 1..1 | 0..* | Společný kód 87520-3; K/FT vyžadují entry, RTG nikoli. |
| `appointment` | 0..1 | 0..1 | 0..1 | Společný kód 56446-8; odlišné cílové profily Appointment. |
| `carePlan` | — | — | 0..1; 18776-5 | K/FT dnes ukládají CarePlanCore do supportingInformation. |
| `supportingInformation` | 0..1 | 0..1 | 0..1 | Společný kód 55752-0, ale odlišné povolené reference. |
| `medicalDevices` | 0..* | 0..* | 0..* | Společný kód 97813-0; K/FT vyžadují entry, RTG nikoli. |
| `attachments` | 0..*; 55107-7 | 0..*; 55107-7 | 0..*; 77599-9 | Rozdílná sémantika kódu. |
| `signature` | 0..1; Provenance | 0..1; Provenance | — | RTG mapuje podpis do Bundle.signature; jde o odlišnou reprezentaci. |
| `goals` | — | 0..1; Goal | — | Očekávané výsledky FT, nikoli aktuální nálezy. |

## ServiceRequest a supportingInfo

ServiceRequest nemá dokumentové sekce. `Composition.section.entry` organizuje zdroje v dokumentu; `ServiceRequest.supportingInfo` vyjadřuje podklady konkrétního požadavku. Diagnóza, která přímo odůvodňuje výkon, patří do `reasonCode` nebo `reasonReference`. Tyto role vycházejí z definic [Composition.section](https://hl7.org/fhir/R4/composition-definitions.html#Composition.section) a [ServiceRequest](https://hl7.org/fhir/R4/servicerequest-definitions.html#ServiceRequest.supportingInfo).

| Oblast | K/FT dnes | IMG-Order dnes | Doporučení |
|---|---|---|---|
| Základní podklady | 10 společných pojmenovaných slices v Composition a ServiceRequest: výška, váha, mobilita, diagnóza, medikace, alergie, Flag, fyzikální nález, encounter, očkování | Jen výška, váha a mobilita jako pojmenované slices | Zachovat společné K/FT členění; RTG případně rozšířit podle klinické potřeby. |
| Ostatní měření | CZ_MedicalTestResultCore v otevřeném seznamu referencí | Lokální CZ_ObservationImage odvozený z Core | Preferovat Core; specializované profily používat jen pro skutečná dodatečná omezení. |
| Upozornění | CZ_FlagPatientCore v obou úrovních | Mapování odkazuje CZ_Flag, ale targetProfile Flag nepovoluje | Při úpravě RTG výslovně povolit CZ_FlagPatientCore; samotné open slicing nestačí. |
| Implantát / použití přístroje | Composition.medicalDevices a ServiceRequest.supportingInfo → DeviceUseStatement | Dokumentová sekce používá DeviceUseStatement, supportingInfo dovoluje Device | Sjednotit význam na použití přístroje; samotný Device popisuje přístroj. |
| CarePlan | Composition jej dovoluje; K/FT ServiceRequest.supportingInfo nikoli | Dovolen v sekci carePlan i supportingInfo | Oddělit plán dokumentu, podklad výkonu a plán, který výkon naplňuje. |
| Goal | FT sekce goals a supportingInfo | Bez specializace | Zachovat FT rozšíření. |
| Diagnóza jako důvod | reasonReference → ConditionCore | reasonReference bez místního zúžení; klinická otázka má lokální Condition profil v Composition | Sdílet pravidla pro indikaci, ne automaticky převádět každou otázku na Condition. |

Stejný zdroj má být uložen jednou a podle potřeby odkazován z dokumentu i konkrétního výkonu. Přítomnost v Composition neznamená, že se vztahuje ke všem ServiceRequest. Například hmotnost může být podkladem jednoho výkonu; cíl zlepšit chůzi je Goal, současná omezená mobilita Observation.

CZ Core 1.0.0 obsahuje také `CZ_DeviceUseStatementCore` s canonical `https://hl7.cz/fhir/core/StructureDefinition/deviceUseStatement-cz-core`. Před náhradou lokálního DeviceUseStatement je nutné porovnat jeho omezení včetně timing. Shodný FSH název lokálního profilu v Order a RTG neznamená shodný canonical ani zaměnitelnost.

## Vazba návrhu na mapování IMG-Order

Následující zápis je logická navigace, nikoli doslovný FHIRPath. `section[název]` označuje slice profilu.

| Oblast modelu IMG-Order | Doporučené umístění v K/FT | Vazba na konkrétní výkon |
|---|---|---|
| A.2.1 a A.3.2 — objednávka a požadované služby | section[orderInformation].entry → ServiceRequest | Vlastní požadavek, code a další parametry. |
| A.2.2 — indikace a klinická otázka | Společná klinická sekce s textem a případnými ConditionCore | reasonCode / reasonReference; otázka nemusí být diagnózou. |
| A.2.3 — klinická událost | Composition.encounter | ServiceRequest.encounter, pokud je pro výkon relevantní. |
| A.2.4 — úhrada | section[coverage].entry → Coverage | insurance → příslušný Coverage. |
| A.2.5 — termín | section[appointment].entry → Appointment | Vazbu na objednávku popsat přes příslušné reference Appointment. |
| A.2.6 — vzorek | ServiceRequest.specimen → Specimen | Nepřidávat kvůli tomu obecnou dokumentovou sekci. |
| A.3.1.1 — biometrie | supportingInformation → Observation | supportingInfo[bodyHeight/bodyWeight]. |
| A.3.1.2 — zdravotní problémy | supportingInformation; historické stavy lze uvést v anamnéze K. Diferenciální diagnózy se předávají jako CZ_ConditionCore s vyplněným verificationStatus. | reasonReference pro přímou indikaci, supportingInfo pro kontext. |
| A.3.1.3 — medikace | K i FT supportingInformation | supportingInfo (CZ_MedicationStatementCore nebo CZ_MedicationAdministrationCore). |
| A.3.1.4 — implantáty | medicalDevices → DeviceUseStatement → Device | supportingInfo. |
| A.3.1.5 — alergie, upozornění, mobilita | supportingInformation → příslušný zdroj | supportingInfo[allergyIntolerance/warning/mobility]. |
| A.3.1.7 a A.3.4 — další informace | supportingInformation → odpovídající Observation/Core profil | supportingInfo, pokud podklad náleží výkonu; nevytvářet duplicitní Observation. |
| A.3.3 — plánovaná péče | Nová section[carePlan].entry → CZ_CarePlanCore | basedOn, pokud výkon plán naplňuje; supportingInfo jen pokud jde o podklad. |
| A.4 — prezentovaná podoba dokumentu | Composition.extension[presentedForm].valueAttachment | Dokumentová reprezentace. |
| A.5 — přílohy | section[attachments].entry → DocumentReference | Případnou vazbu na výkon dovolit explicitně; dnešní K/FT supportingInfo DocumentReference nepovoluje. |

K/FT nyní `basedOn` omezují na ServiceRequest. Použití CarePlan v `basedOn`, případně v `supportingInfo`, proto vyžaduje vědomou změnu profilů, nikoli pouze přepsání mapovací tabulky.

## Nesrovnalosti, které se nesmějí převzít

1. **Chybí průchod referencemi.** IMG Body map obsahuje například `Composition.section:OrderInformation.supportingInfo` a `Composition.section:SupportingInformation.ofType(...)`. supportingInfo je na odkazovaném ServiceRequest; zdroje podpůrné sekce jsou v entry. Skutečná navigace potřebuje `entry.resolve()` a následně `supportingInfo.resolve()`. FHIRPath `ofType()` vybírá typ zdroje, například Observation, nikoli název FSH profilu.
2. **Flag není povolen.** Řádky kolem 974–988 mapují CZ_Flag, ale oba profily RTG tuto referenci nepovolují. K/FT již Core Flag používají správně.
3. **Nesprávné vlastnosti.** IMG mapování používá `CZ_PatientMobility.valueDateTime` pro datum, přestože hodnotou je CodeableConcept; datum patří do effectiveDateTime. CarePlan identifikátor mapuje na neexistující `.code` místo `.identifier`; další Observation na `.code` jako identifikátor a `.title` jako název místo `.identifier` a `.code.text`.
4. **Modalita.** `orderDetail.modality` není cesta ve zdroji; profil má slice `orderDetail.coding[modality]`. V instanci se vybírá příslušné Coding, nikoli JSON pole modality.
5. **Indikace v Order.** Stávající K/FT mapování používá `reasonCode.coding[diagnosis]` a `[reason]`, ale definované slices coding jsou mkn-10, snomed a orphacode. Jde o záměnu klinické role s kódovým systémem. Mapovat na skutečné reasonCode/ reasonReference; případné rozlišení rolí navrhnout zvlášť.
6. **Hlavička a přílohy.** RTG hlavička používá starší názvy sekcí/profilů; mapování presentedForm odkazuje `.document` místo `valueAttachment`. Tyto části je potřeba aktualizovat společně s tělem mapování.

Příklad skutečného FHIRPath pro zdroje podpůrné sekce:

```fhirpath
Composition.section.where(
  code.coding.where(system = 'http://loinc.org' and code = '55752-0').exists()
).entry.resolve().ofType(Observation)
```

`resolve()` předpokládá prostředí schopné vyhledat reference, typicky obsah document Bundle. Úspěšný Publisher build sám nezaručuje správnost cest zapsaných jako text mapovací tabulky.

## Navržený cílový stav a postup

1. **Společná klinická sekce K/FT:** zavést `clinicalQuestion 0..1`, text při přítomnosti sekce `1..1`, entry `0..*` ConditionCore. Do textu patří důvod žádanky i otázka pro příjemce; do Condition pouze skutečný nebo suspektní zdravotní stav se správným stavem ověření. FT `reasons` migrovat na tuto sekci. Pro obecnou indikaci je kandidát LOINC [104720-8 — Clinical indication Narrative](https://loinc.org/104720-8). RTG dnes používá radiologický [18785-6](https://loinc.org/18785-6); převod RTG by byl samostatnou změnou jeho IG, včetně rozhodnutí o povinnosti a počtu sekcí.
2. **Plán péče:** přidat do obou Composition `carePlan 0..1`, kód 18776-5, entry CarePlanCore. Přemapovat A.3.3 z supportingInformation. Nevynucovat dvojí uvedení plánu v dokumentu. Ostatní podpůrná data nechat v supportingInformation; specializované sekce K a goals FT zachovat.
3. **Přílohy:** sjednotit K/FT na jednu sekci pro doplňující dokumenty bez rozdělení podle toho, zda jsou vložené nebo odkazované. Kód [55107-7 znamená Addendum Document](https://loinc.org/55107-7), tedy dodatek, nikoli obecnou přílohu. Kandidát IMG [77599-9 — Additional documentation](https://loinc.org/77599-9/) lépe odpovídá účelu, ale v LOINC je ve stavu TRIAL; finální volbu zahrnout do terminologického rozhodnutí. Při jeho použití sloučit K referencedDocumentation s attachments, jinak dva slices sdílejí stejný diskriminační kód. DocumentReference podporuje odkaz i vložený obsah; zachovat potřebná omezení CZ_Attachment a rozhodnout, kam patří logo organizace.
4. **Společná pravidla podpůrných dat:** sdílet FSH RuleSets pro K/FT typy referencí, názvy slices a popisy. Rozdíly, například FT Goal, přidávat explicitně. Nezavádět obecný pojmenovaný slice Observation překrývající výšku, váhu a další specializace. RTG rozšířit o Core Flag a další typy až v jeho vlastní změně. Ke kompatibilitě slicing viz [FHIR R4 profiling](https://hl7.org/fhir/R4/profiling.html#discriminator).
5. **Povinnosti zachovat podle typu žádanky:** K/FT ponechat orderInformation a coverage 1..1. Neodvozovat jejich povinnost z volnějšího RTG. Společný základ může dovolovat více sekcí a specializace jej zpřísnit; případné sloučení opakovaných RTG sekcí vyžaduje migraci. Doménové kódy orderInformation ani podpisové mechanismy neměnit jen kvůli vizuální jednotnosti.
6. **Nejdřív mapování a migrační pravidla, potom profily:** opravit české i anglické tabulky, sjednotit odkazy a vysvětlit rozdíl mezi dokumentovým kontextem a podkladem výkonu. Přidat příklady K a FT se dvěma ServiceRequest, sdíleným zdrojem a jedním podkladem platným pouze pro jeden výkon. Při implementaci spustit SUSHI a Publisher a ověřit skutečnou validaci příkladů i cíle referencí.

Změna kódu příloh, odstranění referencedDocumentation a nahrazení FT reasons jsou změny struktury existujících dokumentů. Patří do oznámené nové verze s převodními pravidly; nyní lze bez změny modelu opravit popisy a chybné mapovací cesty. Import profilů z IMG-Order do Order ani dědění K/FT z radiologické Composition není pro tento návrh potřeba.
