Tato stránka obsahuje poznámky k implementaci konziliární žádanky a žádanky o fyzioterapii. Týkají se sestavení FHIR Bundle a naplnění jeho profilů daty.

### Přehled

Oba typy eŽádanky jsou reprezentovány jako FHIR Bundle typu `document`, který obsahuje kompozici příslušného typu a všechny zdroje ve stromové struktuře zdrojů, na které se odkazuje, viz [$document operation](https://www.hl7.org/fhir/composition-operation-document.html). V jednom bundlu je vždy právě jedna kompozice: u typu K `KOrderCompositionCz`, u typu FT `FTOrderCompositionCz`.

```
classDiagram
  direction LR
  class BundleOrderCz{
    <<Bundle>>
  }
  BundleOrderCz *-- "0..1" KOrderCompositionCz
  BundleOrderCz *-- "0..1" FTOrderCompositionCz
  BundleOrderCz *-- "1" CZ_PatientCore
  BundleOrderCz *-- "1..*" KOrderServiceRequestCz
  BundleOrderCz *-- "1..*" FTServiceRequestCz
  BundleOrderCz *-- "1..*" CZ_Coverage
  BundleOrderCz *-- "0..*" CZ_ConditionCore
  BundleOrderCz *-- "0..*" CZ_PractitionerCore
  BundleOrderCz *-- "0..*" CZ_PractitionerRoleOrder
  BundleOrderCz *-- "0..*" CZ_OrganizationCore
  BundleOrderCz *-- "0..*" CZ_ObservationOrder
  BundleOrderCz *-- "0..*" CZ_Attachment

  KOrderCompositionCz --> CZ_PatientCore: subject
  KOrderCompositionCz --> CZ_PractitionerRoleOrder: author
  KOrderCompositionCz --> CZ_OrganizationCore: custodian
  KOrderCompositionCz --> KOrderServiceRequestCz: section[orderInformation]
  KOrderCompositionCz --> CZ_Coverage: section[coverage]
  KOrderCompositionCz --> CZ_ConditionCore: section[significantMedicalHistory]
  KOrderCompositionCz --> CZ_ObservationOrder: section[supportingInformation]
  KOrderCompositionCz --> CZ_Attachment: section[attachments]

  FTOrderCompositionCz --> CZ_PatientCore: subject
  FTOrderCompositionCz --> CZ_PractitionerRoleOrder: author
  FTOrderCompositionCz --> FTServiceRequestCz: section[orderInformation]
  FTOrderCompositionCz --> CZ_Coverage: section[coverage]
  FTOrderCompositionCz --> CZ_Attachment: section[attachments]
```

Obsah jednotlivých sekcí a význam prvků jsou uvedeny na stránce [Rozsah použití a obsah](scope-and-content-cs.html#koncepční-pohled) a v definicích logických modelů, viz [Logické modely](logical-models-cs.html). Tato stránka je neopakuje.

### Jeden požadovaný výkon, jeden zdroj požadované služby

Jednomu požadovanému výkonu odpovídá jeden zdroj požadované služby, tedy jeden `ServiceRequest`, a všechny se odkazují ze sekce `section[orderInformation]`. Kardinalita `1..*` znamená, že jedna eŽádanka může nést více požadovaných výkonů — u typu K například konziliární vyšetření a echokardiografii, u typu FT jednotlivé řádky poukazu.

U typu FT je počet a frekvence provedení vlastností konkrétního požadovaného výkonu, ne dokumentu jako celku. Nese je proto zdroj požadované služby, nikoli kompozice.

### Sekce kompozice u typu K

Prvky `A.3.2.2` až `A.3.2.6` konziliární žádanky nesou samostatné sekce kompozice. Následující tabulka uvádí jejich vazbu, protože z názvu sekce není zřejmá.

| Prvek | Sekce kompozice | Kód sekce | Čím je sekce naplněna |
|---|---|---|---|
| `A.3.2.2` Závažná anamnestická data | `section[significantMedicalHistory]` | LOINC `11348-0` | odkazy na diagnózy |
| `A.3.2.3` Výsledky provedených vyšetření | `section[examinationResults]` | LOINC `30954-2` | odkazy na nálezy |
| `A.3.2.4` Diferenciálně diagnostická rozvaha | `section[differentialDiagnosis]` | LOINC `51848-0` | odkazy na diagnózy |
| `A.3.2.5` Současná léčba, medikace včetně dávkování | `section[currentTreatment]` | LOINC `11506-3` | odkazy na medikaci |
| `A.3.2.6` Zapůjčená dokumentace | `section[referencedDocumentation]` | LOINC `77599-9` | odkazy na dokumenty |

U typu FT nese prvek `A.3.2.2 Cíl vyšetření` sekce `section[goals]` s kódem LOINC `61146-7`. Klinické odůvodnění, tedy stav vyžadující terapii, cíl a rizika, nese u typu FT sekce `section[reasons]` textem, protože pro celý poukaz je společné.

Nejsou-li pro povinnou sekci k dispozici žádná data, vyjádří se důvod v `composition.section.emptyReason`.

### Důsledky neměnnosti pro sestavení bundlu

Bundle je sestaven a podepsán při vystavení a dál se nemění, viz [Workflow](workflow-cs.html). Neměnnost je vlastností dokumentu, ale to, které údaje se v průběhu zpracování mění, určuje systém, kterým se dokument vyměňuje. Následující dva důsledky proto platí v kontextu systému eŽádanka, tedy české implementace.

1. **Údaje, které se v průběhu zpracování mění, do bundlu nepatří.** Byl-li v prvku `A.1.6 Provádějící` uveden doporučený poskytovatel a péči nakonec poskytne jiný, zůstává v dokumentu i nadále ten původní. Totéž platí pro rozesílání výsledku vůči prvku `A.1.7 Příjemce nálezu`.
2. **Doplnění obsahu se neprovádí novou verzí dokumentu.** Prvek `A.2.5 Termín návštěvy` nese termín požadovaný nebo dohodnutý při vystavení, nikoli termín, na který byl pacient objednán později. U typu FT to platí i pro terapeutický plán sestavený terapeutem v modelu s delegovaným rozsahem: terapeut jej zaznamenává do vlastní zdravotnické dokumentace, ne do eŽádanky.

### Identifikátory

V dokumentu i mimo něj vystupují tři různé identifikátory, které je třeba odlišit.

| Identifikátor | Kde je | K čemu je |
|---|---|---|
| `A.2.1.1` ID objednávky | v dokumentu, prvek logického modelu | Identifikuje objednávku v systému žadatele. Přiděluje jej odesílající systém při sestavení dokumentu. |
| Systémový identifikátor eŽádanky (`id`, UUID) | mimo dokument, přiděluje systém eŽádanky při uložení | Jednoznačně identifikuje eŽádanku v celém ekosystému. Navazující klinické dokumenty jej používají pro odkaz na původní eŽádanku. |
| Kód eŽádanky (osm alfanumerických znaků) | mimo dokument, přiděluje systém eŽádanky při uložení | Sděluje se pacientovi a slouží k uplatnění eŽádanky u poskytovatele vyžádané péče. |

Systémový identifikátor ani kód nejsou součástí FHIR Bundle, protože v okamžiku jeho sestavení a podpisu ještě neexistují.

### Podpis dokumentu

Prvek `A.1.9 Elektronické podpisy` nese elektronický podpis nebo pečeť dokumentu a časové razítko. Osoba, která žádanku sepsala, a osoba, která ji podepsala, jsou v dokumentu identifikovány bezvýznamovým identifikátorem zdravotnického pracovníka a nemusí to být tatáž osoba.

Způsob podpisu ani jeho ověření tato příručka nepopisuje. Řídí se obecnou metodikou pro podpis dokumentů ve formátu FHIR.

### Přijetí se zobecněním požadované péče

Koncepty v oborech hodnot [korder-procedures-vs](ValueSet-korder-procedures-vs.html) a [ft-order-procedures-vs](ValueSet-ft-order-procedures-vs.html) jsou uspořádány hierarchicky, takže lze odvodit, že požadovaný koncept je podřazen konceptu, se kterým pracuje provádějící pracoviště, a požadavek přijmout. Původní kódovaná informace i její textová podoba přitom musí zůstat pro provádějícího viditelné. Informační systém žadatele musí podporovat celý obor hodnot požadované péče, přípustné je nabízet při zadávání pouze podvýběr.

Je-li požadovaná péče vyjádřena výkonem zdravotní pojišťovny, zobecnění tímto způsobem provést nelze, protože tyto číselníky hierarchii konceptů nemají.
