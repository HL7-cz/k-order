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