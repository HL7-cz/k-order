### Příklady konziliární žádanky

Příklady instancí jsou publikovány v této příručce. Funkční specifikace eŽádanky K uvádí tytéž příklady pod stejnými názvy a v témže pořadí, ale bez jejich obsahu.

| Příklad | Co demonstruje | Instance |
|---|---|---|
| Kardiologické konzilium pro námahovou dušnost | Neadresná eŽádanka s více požadovanými službami v jednom dokumentu, konziliárním vyšetřením a echokardiografií, a s dodatečným příjemcem výsledku. Praktický lékař žádá o posouzení, zda je zhoršující se námahová dušnost kardiálního původu. | [BundleKOrderExample](Bundle-BundleKOrderExample.html) |
| Dermatologické konzilium pro suspektní pigmentový útvar | Adresná eŽádanka se zvýšenou naléhavostí a s obrazovou přílohou, která doplňuje strukturovaný obsah. Praktický lékař odesílá pacienta s rychle se měnícím pigmentovým útvarem do konkrétní pigmentové poradny. | [BundleDermatologyUrgentExample](Bundle-BundleDermatologyUrgentExample.html) |
| Nefrologické konzilium při progresi chronického onemocnění ledvin | eŽádanka ve scénáři doporučení převzetí do péče, tedy nikoli jednorázového posouzení. Nese hodnoty kreatininu a eGFR jako podpůrné klinické informace. | [BundleNephrologyHandoverExample](Bundle-BundleNephrologyHandoverExample.html) |

### Příklady žádanky o fyzioterapii

| Příklad | Co demonstruje | Instance |
|---|---|---|
| Rehabilitace po totální endoprotéze kyčle | Neadresná eŽádanka u pacienta se sníženou mobilitou a implantátem. Na eŽádance je datum operace, povolená zátěž operované končetiny, typ implantátu a snížená mobilita pacienta. | připravuje se |
| Respirační fyzioterapie u pacienta s chronickou obstrukční plicní nemocí | Kompletně vyplněný poukaz s počtem procedur a s péčí v místě pobytu pacienta. Uvedeny jsou konkrétní výkony, deset procedur, dvakrát týdně, terapie se provádí u pacienta doma. | připravuje se |
| Fyzioterapie u dětského pacienta s vadným držením těla | Částečně vyplněný poukaz, kde rozsah péče navrhuje fyzioterapeut. Uvedena je jen diagnóza a cíl terapie, konkrétní výkony ani jejich počet vyplněny nejsou. Součástí eŽádanky je zákonný zástupce. | připravuje se |

Příklady odpovídají Tabulce 7 ve Funkční specifikaci eŽádanky FT. Do doby, než budou dodány, je v příručce publikován technický příklad [BundleFTExample](Bundle-BundleFTExample.html), který ukazuje detailní model preskripce: jeden požadovaný výkon odpovídá jednomu zdroji požadované služby.

Všechny příklady lze nalézt rovněž na stránce [Artifacts](artifacts.html).

### Příklady profilů

* [Kompozice konziliární žádanky](Composition-KOrderCompositionExample.html)
* [Kompozice žádanky o fyzioterapii](Composition-FTCompositionExample.html)
* [Požadovaná služba – konziliární vyšetření](ServiceRequest-KOrderServiceRequest-1.html)
* [Požadovaná služba – fyzioterapeutický výkon](ServiceRequest-d9f2a8b0-1b9b-4f66-9c53-2f1e5b62d6a1.html)
* [Pacient](Patient-48a9d440-4194-42c1-87ad-b5a39020a4d0.html)
* [Zdravotnický pracovník](Practitioner-a81e74c9-fe94-4eb1-9233-4c8f0b2d4e3a.html)
* [Role zdravotnického pracovníka](PractitionerRole-2b7e9637-5018-4542-9faf-d5abdee7b849.html)
* [Poskytovatel zdravotních služeb](Organization-ace081ba-e0a8-4b89-a4a7-c5b7cd3c8169.html)
* [Podřízené pracoviště poskytovatele](Organization-af2b3114-e872-43b9-9875-cceb39122f7f.html)
* [Zdravotní pojišťovna](Organization-Organization-Insurance111.html)
* [Pojistný vztah](Coverage-KOrderCoverage-Example.html)
* [Indikační diagnóza](Condition-KOrderCondition-Main.html)
* [Pozorování – kreatinin](Observation-Observation-CreatinineExample.html)
* [Příloha – klinická fotodokumentace](DocumentReference-DermatologyLesionPhoto.html)
