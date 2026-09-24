### Poukaz K a FT

Papírovými vzory pro tyto dva typy eŽádanky jsou **Poukaz na vyšetření/ošetření typu K** a **Poukaz na fyzioterapii/ergoterapii typu FT**. Aktuální verze tiskopisů jsou dostupné na stránkách [VZP – tiskopisy pro poskytovatele](https://www.vzp.cz/poskytovatele/tiskopisy).

Stejně jako jiné zdravotnické dokumenty využívají oba typy standardy a terminologické systémy používané v českém i evropském prostředí elektronického zdravotnictví. Jde zejména o HL7 FHIR, SNOMED CT, MKN-10 a národní číselníky a identifikátory, u požadovaných výkonů také o číselníky zdravotních pojišťoven. Přehled použitých code systémů a oborů hodnot je na stránce [Terminologické aspekty](terminology-considerations-cs.html).

Požadavky na obsah vyžádání dalších zdravotních služeb stanoví `příloha č. 1 v části 2 k vyhlášce č. 444/2024 Sb., o zdravotnické dokumentaci`. Ve znění k 19. 2. 2025 obsahuje vyžádání dalších zdravotních služeb:

a) požadované zdravotní služby,
b) zdůvodnění požadavku,
c) naléhavost požadavku,
d) údaje o posledně zjištěném zdravotním stavu, včetně těch výsledků laboratorních a dalších pomocných vyšetření, které jsou podstatné pro poskytnutí vyžádaných zdravotních služeb,
e) údaje o dosavadní léčbě a reakci pacienta na ni,
f) pracovní diagnózu,
g) uvedení zásadních anamnestických údajů souvisejících s požadovanými zdravotními službami.

Tato implementační příručka převádí uvedené legislativní požadavky do interoperabilní elektronické podoby založené na standardu HL7 FHIR R4. Které prvky logického modelu jednotlivé požadavky naplňují, uvádí Speciální funkční specifikace příslušného typu, tedy Funkční specifikace eŽádanky K a Funkční specifikace eŽádanky FT.
