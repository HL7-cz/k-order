Logical: LMCzSpecimenInformationCz
Id: LMSpecimenInformationCz
Title: "A.2.6 - Informace o vzorku"
Description: """Informace o vzorku souvisejícím s žádankou."""

* insert SetFmmandStatusRule( 1, draft)

* identifikator 1..* Identifier "A.2.6.1 - Identifikátor vzorku" """Jednoznačný identifikátor vzorku v daném kontextu."""
* druhOrganismu 0..1 CodeableConcept "A.2.6.2 - Druh organismu" """Biologický druh subjektu u nehumánních vzorků."""
* material 0..1 CodeableConcept "A.2.6.3 - Materiál" """Typ materiálu vzorku."""
* datumACasOdberu 1..1 dateTime "A.2.6.4 - Datum a čas odběru" """Datum a čas odběru nebo dokončení odběru."""
* datumACasTransportu 0..1 dateTime "A.2.6.5 - Datum a čas transportu" """Datum a čas zahájení transportu vzorku."""
* typVzorku 0..1 CodeableConcept "A.2.6.6 - Typ vzorku" """Typ vzorku nebo odebraného materiálu."""
* anatomickaLokalizace 0..1 CodeableConcept "A.2.6.7 - Anatomická lokalizace" """Místo odběru materiálu včetně případné laterality."""
* morfologie 0..1 CodeableConcept "A.2.6.8 - Morfologie" """Morfologická abnormalita místa odběru."""
* nastroj 0..1 CodeableConcept "A.2.6.9 - Nástroj" """Nástroj nebo pomůcka použitá při odběru."""
* metodaOdberu 0..1 CodeableConcept "A.2.6.10 - Metoda odběru" """Postup nebo metoda odběru."""
* zdrojoveZarizeni 0..1 CodeableConcept "A.2.6.11 - Zdrojové zařízení" """Zařízení, ze kterého vzorek pochází, pokud nebyl odebrán přímo pacientovi."""
* mistoOdberu 0..1 CodeableConcept "A.2.6.12 - Místo odběru" """Prostor nebo prostředí, kde byl materiál odebrán."""
* poznamka 0..1 string "A.2.6.13 - Poznámka" """Volná poznámka ke vzorku."""

* nadoba 0..* Base "A.2.6.14 - Nádoba" """Informace o odběrové nádobě."""
* nadoba.typ 0..1 CodeableConcept "A.2.6.14.1 - Typ" """Typ odběrové nádoby včetně případných aditiv."""
* nadoba.pocet 0..1 integer "A.2.6.14.2 - Počet" """Počet identických nádob se vzorkem."""
* nadoba.idZarizeni 1..1 Identifier "A.2.6.14.3 - ID zařízení" """Strojově čitelný identifikátor nádoby."""
* nadoba.oznaceni 0..1 Identifier "A.2.6.14.4 - Označení" """Čitelný identifikátor nádoby."""

* dalsiUdaje 0..1 Base "A.2.6.15 - Další formalizované údaje" """Doplňující formalizované údaje o vzorku."""
* dalsiUdaje.datum 0..1 date "A.2.6.15.1 - Datum" """Datum zjištění údaje, pokud se liší od data žádanky."""
* dalsiUdaje.kod 1..1 CodeableConcept "A.2.6.15.2 - Kód" """Kód určující význam doplňujícího údaje."""
* dalsiUdaje.hodnota 0..1 Narrative "A.2.6.15.3 - Hodnota" """Hodnota údaje včetně jednotky."""

* odberatel 0..1 Base "A.2.6.16 - Odběratel" """Identifikace osoby nebo subjektu, který vzorek odebral."""
* odberatel.identifikator 1..* Identifier "A.2.6.16.1 - Identifikátor odběratele" """Identifikátor odběratele vzorku."""
* odberatel.jmeno 1..1 HumanName "A.2.6.16.2 - Jméno odběratele" """Jméno odběratele vzorku."""
* odberatel.kontakt 1..1 ContactPoint "A.2.6.16.3 - Kontakt odběratele" """Kontaktní údaje odběratele vzorku."""
* odberatel.organizace 0..1 Base "A.2.6.16.4 - Organizace odběratele" """Organizace, pod kterou odběratel vzorku působí."""
