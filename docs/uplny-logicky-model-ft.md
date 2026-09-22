# Úplný logický model FT-žádanky

`LMFTOrderCompleteCz` rozbaluje `LMFTOrderCz` a všechny jeho dílčí logické modely
do jediné hierarchie. Hlavička vychází z `LMHeaderOrder`, tělo z `LMBodyFTOrder`
a specifikace požadované péče z `LMFTOrderDataElementsCz`. Zahrnuty jsou také
sdílené klinické údaje, prezentovaná forma a přílohy.

Jediným ručně udržovaným zdrojem zůstávají FSH definice v `input/fsh/czech-model`.
Soubor `input/resources/StructureDefinition-LMFTOrderCompleteCz.json` je generovaný
a neupravuje se ručně. Je uložen v repozitáři a lze jej zpracovat běžným FHIR IG
Publisherem bez úprav Publisheru.

Samostatné generování a kontrola aktuálnosti FT modelu:

```sh
python scripts/expand-order-models.py --order ft
python scripts/expand-order-models.py --order ft --check
```

Generování obou úplných modelů a kompletní build:

```sh
python scripts/expand-order-models.py
python scripts/expand-order-models.py --check
python scripts/build-ig.py
```

Generátor nejprve přeloží české LM definice pomocí SUSHI v izolovaném adresáři.
Odkazy na dílčí logické modely nahradí skupinou `Base` a vloží jejich potomky.
Standardní FHIR datové typy, například `CodeableConcept`, nerozbaluje. Zachovává
pořadí položek, popisy, vazby na číselníky a kardinality vůči bezprostřednímu rodiči.
Povinná položka uvnitř nepovinné sekce zůstává povinná jen při přítomnosti sekce.

Oba modely používají stejná ochranná pravidla: cyklus, nevyřešený lokální typ,
slicing, typové alternativy s podmodelem, inline přepis potomků nebo nepodporovaná
dědičnost generování zastaví. Při společném generování se oba modely nejprve
úspěšně rozbalí a teprve potom se zapisují výstupy.

Model je uveden ve skupině artefaktů „Logický model FT žádanky“ a na české i
anglické stránce logických modelů.
