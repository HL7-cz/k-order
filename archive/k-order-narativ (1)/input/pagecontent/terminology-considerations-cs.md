{% include variable-definitions.md %}

Následuje seznam použitých code systémů a oborů hodnot, členěný podle zdroje terminologie. Každý prvek logického modelu je uveden právě jednou, v sekci systému, který je pro něj rozhodující. Připouští-li prvek i jiný systém, je uveden ve sloupci Hodnota jako alternativa. Liší-li se obor hodnot mezi typy K a FT, je to u prvku uvedeno.

Národní obory hodnot publikuje {{czTerminology}} a jejich hodnoty jsou dostupné prostřednictvím terminologického serveru **TermX**. U číselníků zdravotních pojišťoven je autoritativním zdrojem balík číselníků poskytovaný v rámci smluvního vztahu, veřejně publikované stránky mají pouze informativní povahu. Existuje-li pro prvek národní obor hodnot, použije se přednostně před mezinárodním.

### Snomed-CT

| Kód položky | Popis položky | Hodnota |
| :--- | :--- | :--- |
| A.2.2.2 | Klinická otázka kódem | SNOMED CT |
| A.2.2.4 | Důvod objednávky kódem | SNOMED CT |
| A.3.1.4.1 | Druh implantátu | SNOMED CT, obor hodnot určuje profil zdravotnického prostředku v {{czCore}} |
| A.3.1.4.4 | Část těla implantátu | [body-site](https://hl7.org/fhir/valueset-body-site.html), SNOMED CT Body structure |
| A.3.1.6.2 | Omezení pohyblivosti – kód informace | [cz-mobility-type](ValueSet-cz-mobility-type.html) — čtyři kódy typu hodnoceného úkonu: chůze, vstávání, stání a pohyb na lůžku |
| A.3.1.6.3 | Omezení pohyblivosti – hodnota informace | [cz-mobility-value](ValueSet-cz-mobility-value.html) — osm kódů hodnocení k typům výše |
| A.3.1.10 | Fyzikální nález | SNOMED CT, klinické nálezy |
| A.3.1.12 | Očkování | SNOMED CT |
| A.3.2.1.1 | Kód vyšetření | U typu K [korder-procedures-vs](ValueSet-korder-procedures-vs.html), potomci konceptu `11429006` Consultation. U typu FT [ft-order-procedures-vs](ValueSet-ft-order-procedures-vs.html), potomci konceptu `91251008` Physical therapy procedure. U obou typů je vazba `preferred`, alternativou jsou výkony zdravotních pojišťoven, viz níže. |
| A.3.2.1.3 | Část těla požadované péče (FT) | SNOMED CT, Body structure |
| — | Kategorie požadavku, `ServiceRequest.category` | U typu FT [ft-category-service-request](ValueSet-ft-category-service-request.html) — `91251008` fyzioterapie, `84478008` ergoterapie. Kategorie odlišuje oba modely preskripce, protože v modelu s delegovaným rozsahem je jediným vyjádřením požadované péče. |

Preferovaným způsobem vyjádření požadované péče je SNOMED CT; preference je vyjádřena silou vazby v profilu. U typu FT je koncept SNOMED CT `91251008` z oboru hodnot požadovaných výkonů vyloučen, protože obecná fyzioterapie se vyjadřuje kategorií požadavku, ne výkonem.

### MKN-10 / Orphacode

| Kód položky | Popis položky | Hodnota |
| :--- | :--- | :--- |
| A.2.2.1 | Popis problému / diagnózy / stavu – indikační diagnóza | [mkn-10](https://uzis.cz/terminology/ValueSet/mkn-10) a [orphanet-rare-diseases](https://ncez.mzcr.cz/terminology/ValueSet/orphanet-rare-diseases), u obou typů vazbou `preferred` |
| A.3.1.2.1 | Kód informace – vedlejší diagnóza | [mkn-10](https://uzis.cz/terminology/ValueSet/mkn-10) |

Národní obor hodnot [condition-cz](https://ncez.mzcr.cz/terminology/ValueSet/condition-cz) sdružuje MKN-10, ORPHA i klinické nálezy SNOMED CT do jednoho oboru hodnot a je pro indikační diagnózu použitelný jako celek.

### NČLPPOL

| Kód položky | Popis položky | Hodnota |
| :--- | :--- | :--- |
| A.3.1.1.1.2 | Váha – kód | [nclppol](https://ncez.mzcr.cz/nclp/ValueSet/nclppol) `20042`, alternativně SNOMED CT `27113001` |
| A.3.1.1.2.2 | Výška – kód | [nclppol](https://ncez.mzcr.cz/nclp/ValueSet/nclppol) `20411`, alternativně SNOMED CT `1153637007` |

### Číselníky zdravotních pojišťoven

| Kód položky | Popis položky | Hodnota |
| :--- | :--- | :--- |
| A.1.4.3 | Kód náhrady | [vzp-nahrady-vs](ValueSet-vzp-nahrady-vs.html) — sedm kódů náhrad za zdravotní péči, například úraz zaviněný jinou osobou nebo pracovní úraz |

Výkony zdravotních pojišťoven jsou u prvku `A.3.2.1.1 Kód vyšetření` alternativou k SNOMED CT. Příručka pro ně definuje dva code systémy, [korder-vzp-procedures-cs](CodeSystem-korder-vzp-procedures-cs.html) pro výkony a [ft-vzp-procedures-cs](CodeSystem-ft-vzp-procedures-cs.html) pro výkony fyzioterapie. Oba jsou označeny jako `fragment` a obsahují pouze demonstrační podmnožinu kódů použitou v příkladech; závazným zdrojem je balík číselníků pojišťovny.

### LOINC

| Kód položky | Popis položky | Hodnota |
| :--- | :--- | :--- |
| A.1.8.2 | Kategorie dokumentu | [document-category](https://ncez.mzcr.cz/terminology/ValueSet/document-category) |
| — | Typ žádanky, `Composition.type` | [referralorder-types](https://ncez.mzcr.cz/terminology/ValueSet/referralorder-types) — pro typ K kód `57133-1`, pro typ FT kód `57154-7` |

Prvek `Composition.type` nese typ žádanky z národního oboru hodnot Typy žádanek. Je to jediný prvek hlavičky, jehož hodnota se mezi typy K a FT liší. Pro typ žádanky není v logickém modelu definován prvek `A.x`, proto je v tabulce uveden bez čísla.

### FHIR

| Kód položky | Popis položky | Hodnota |
| :--- | :--- | :--- |
| A.1.1.6 | Státní občanství | [v3-Country2](https://terminology.hl7.org/ValueSet-v3-Country2.html) |
| A.1.1.7 | Pohlaví | [administrative-gender-cz](https://ncez.mzcr.cz/terminology/ValueSet/administrative-gender-cz) |
| A.1.1.9 | Komunikační jazyk | [all-languages](https://hl7.org/fhir/valueset-all-languages.html) |
| A.1.2.1 | Adresa – země | [v3-Country2](https://terminology.hl7.org/ValueSet-v3-Country2.html) |
| A.1.2.4.1 | Typ kontaktu | [contactrole-cz](https://ncez.mzcr.cz/terminology/ValueSet/contactrole-cz) |
| A.1.4.1 | Způsob úhrady | [cz-coverage-type](https://ncez.mzcr.cz/terminology/ValueSet/cz-coverage-type) — `HIP` zdravotní pojištění, `pay` samoplátce |
| A.1.8.3 | Stav dokumentu | [composition-status](https://hl7.org/fhir/valueset-composition-status.html) — `preliminary`, `final`, `amended`, `entered-in-error`. Prvek se mapuje na `Composition.status`, kde je vazba povinná už v základním zdroji, a profil ji nezužuje. |
| A.1.8.7 | Důvěrnost dokumentu | [v3-Confidentiality](https://terminology.hl7.org/ValueSet-v3-Confidentiality.html) |
| A.1.8.8 | Jazyk dokumentu | [all-languages](https://hl7.org/fhir/valueset-all-languages.html) |
| A.2.1.4 | Urgentnost objednávky | [request-priority](https://hl7.org/fhir/valueset-request-priority.html) — `routine`, `urgent`, `asap`, `stat`. Příručka k němu definuje obor hodnot [korder-priority-vs](ValueSet-korder-priority-vs.html) s českými názvy hodnot běžně, urgentně a statim. |
| A.2.4.1 | Způsob úhrady v těle dokumentu | [cz-coverage-type](https://ncez.mzcr.cz/terminology/ValueSet/cz-coverage-type) |
| A.2.5.2 | Stav termínu | [appointmentstatus](https://hl7.org/fhir/valueset-appointmentstatus.html) |
| A.4.1, A.5.1 | Typ obsahu prezentované formy a přílohy | MIME typ, [urn:ietf:bcp:13](https://www.rfc-editor.org/rfc/rfc2046) |
| A.4.2, A.5.2 | Jazyk obsahu prezentované formy a přílohy | [all-languages](https://hl7.org/fhir/valueset-all-languages.html) |

Prvek `A.1.8.3 Stav dokumentu` vyjadřuje stav dokumentu v okamžiku vystavení, ne stav eŽádanky v systému. Ten je vlastností systému, ne dokumentu, viz [Workflow](workflow-cs.html).

### Doporučení převzetí do péče

| Kód položky | Popis položky | Hodnota |
| :--- | :--- | :--- |
| — | Doporučení převzetí do péče u typu K | [korder-recommendation-disposition-vs](ValueSet-korder-recommendation-disposition-vs.html) — `ambulatory-care` převzetí do péče, `hospitalization` hospitalizace |

Doporučení převzetí do péče nese u typu K rozšíření profilu požadované služby a vazba oboru hodnot je `required`. Scénář doporučení převzetí do ambulantní nebo ústavní péče popisuje Funkční specifikace eŽádanky K. Pro tento údaj není v logickém modelu definován prvek `A.x`, proto je v tabulce uveden bez čísla.

### UCUM

| Kód položky | Popis položky | Hodnota |
| :--- | :--- | :--- |
| A.3.1.1.1.1 | Hodnota váhy – jednotka | [cz-observation-units-weight-vs](ValueSet-cz-observation-units-weight-vs.html) — `kg`, `g` |
| A.3.1.1.2.1 | Hodnota výšky – jednotka | [cz-observation-units-height-vs](ValueSet-cz-observation-units-height-vs.html) — `m`, `cm` |

### Prvky bez navázaného oboru hodnot

U následujících kódovaných prvků příručka obor hodnot dosud nenavazuje, protože pro ně nemá profil nebo vazbu: `A.1.5` odbornost objednatele, `A.3.1.5.1 Alergie a intolerance`, `A.3.2.1.4 Lateralita` u typu FT a kódované prvky `A.2.6 Informace o vzorku`. Do doby, než budou navázány, se pro ně použije terminologie uvedená v Obecné funkční specifikaci dokumentu eŽádanka.
