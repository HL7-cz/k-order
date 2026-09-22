# Úplný logický model K-žádanky

`LMKOrderCompleteCz` rozbaluje `LMKOrderCz` a jeho dílčí modely do jednoho
StructureDefinition. Obsah se udržuje výhradně v původních FSH modelech.
Výstup `input/resources/StructureDefinition-LMKOrderCompleteCz.json` se neupravuje
ručně. Je uložen v Gitu, aby ho mohly publikovat i běžné buildy IG.

Generování a sestavení IG v jednom kroku (Python 3, SUSHI a Java na PATH):

```sh
python scripts/build-ig.py
```

Výchozí terminologický server je `https://tx.hl7.cz/r4`, který podporuje českou
MKN-10 a českou edici SNOMED CT. Přepnout jej lze pomocí `-tx URL`.
Argumenty se předávají Publisheru, například `python scripts/build-ig.py -tx n/a`
vypne serverovou validaci pro offline diagnostiku.
Tento vstupní bod nejprve obnoví úplné modely K-žádanky i FT-žádanky, spustí SUSHI pro registraci artefaktů
a poté Publisher. Režim `-watch` není podporován; po úpravě zdrojů build zopakujte.
Po dokončení musí existovat nový `output/qa.json`. Chybějící či neplatný report
nebo nenulový počet validačních chyb způsobí nenulový návratový kód skriptu.
Po změně terminologického serveru spusťte jednou `python scripts/build-ig.py -resetTx`,
aby Publisher obnovil terminologickou cache. Používá se původní Publisher JAR bez úprav.

Samostatné generování a kontrola aktuálnosti:

```sh
python scripts/expand-k-order-model.py
python scripts/expand-k-order-model.py --check
```

Oba příkazy kompilují aktuální české logické modely a jejich pomocné definice
pomocí SUSHI do dočasného adresáře, nezávisle na rozpracovaných klinických
profilech a příkladech. Názvy,
aliasy a RuleSety řeší SUSHI, generátor neparsuje FSH text. Chyba kompilace
zastaví generování. Při použití původních `_build` / `_genonce` skriptů nebo
externího CI je nutné generátor spustit před nimi; samy JSON neobnovují.

Při rozbalení se typ odkazující na místní logický model nahradí `Base` a pod něj
se vloží jeho položky. Typ `Base` odpovídá seskupením používaným ve zdrojových
modelech a nepřidává FHIR položky `id` a `extension`. Standardní datové typy jako
Identifier, Address a CodeableConcept zůstávají datovými typy a dále se nerozbalují.
Popisy, kardinality, vazby na číselníky a další vlastnosti elementů se kopírují.
Kardinality se nenásobí přes rodiče: povinná položka uvnitř nepovinné sekce zůstává
povinná jen tehdy, když je tato sekce přítomná.

Generátor odmítá cykly, nevyřešené místní typy, typové alternativy obsahující
logické modely, slicing, inline přepis potomků podmodelu a dědičnost nad jiným
rodičem než Base. Tyto konstrukce současná datová sada nepotřebuje; případné
budoucí použití vyvolá chybu namísto neúplného výstupu. Omezení na kořeni
podmodelu rovněž vyžadují explicitní podporu, jinak se generování zastaví.

Společný generátor je `scripts/expand-order-models.py`. Původní příkaz
`scripts/expand-k-order-model.py` zůstává dostupný pro samostatnou K-žádanku.
[Úplný model FT-žádanky](uplny-logicky-model-ft.md) se generuje stejným postupem
z vlastního kořenového modelu `LMFTOrderCz` a jeho podmodelů.

Model je dostupný ze stránek logických modelů a ve skupině artefaktů K-order.
Není novým ručně udržovaným zdrojem datové sady ani modelem FT-žádanky.
