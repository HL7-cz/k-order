Logical: LogCzFTSpecificFTOrder
Id: logFTSpecificKOrder
Title: "A.3.3 - Specifické údaje pro FT"
Description: """Specifické klinické a organizační údaje eŽádanky typu FT
(poukaz na vyšetření/ošetření fyzioterapie nebo ergoterapie)."""

* insert SetFmmandStatusRule( 1, draft)

* specifickeUdajeFT 0..1 Base
  "A.3.3 - Specifické údaje pro FT"
  """Sekce obsahující údaje specifické pro indikaci FT."""

* specifickeUdajeFT.stavVyadujiciFT 0..* string
  "A.3.3.1 - Stav vyžadující FT"
  """Stručná epikríza a popis funkčního stavu."""

* specifickeUdajeFT.cilTerapie 0..* string
  "A.3.3.2 - Cíl terapie"
  """Očekávané funkční a klinické cíle."""

* specifickeUdajeFT.rizika 0..* Base
  "A.3.3.3 - Rizika, kontraindikace, upozornění"
  """Bezpečnostní informace pro provedení terapie."""

* specifickeUdajeFT.rizika.text 0..1 string
  "A.3.3.3.1 - Rizika (text)"

* specifickeUdajeFT.rizika.strukturovaneHodnoceni 0..1 Reference
  "A.3.3.3.2 - Strukturované hodnocení rizika"

* specifickeUdajeFT.lokalizacePostizeni 1..* CodeableConcept
  "A.3.3.4 - Lokalizace postižení"
  """Anatomická lokalizace postižení (SNOMED CT)."""

* specifickeUdajeFT.pozadovano 0..1 Base
  "A.3.3.5 - Požadováno"
  """Specifikace požadované péče — detailní výkony nebo obecný druh péče."""

* specifickeUdajeFT.pozadovano.detailniVykony 0..* Base
  "A.3.3.5.1 - Detailní výkony"
  """Konkrétní požadované výkony."""

* specifickeUdajeFT.pozadovano.detailniVykony.vykon 1..1 CodeableConcept
  "A.3.3.5.1.1 - Kód výkonu"

* specifickeUdajeFT.pozadovano.detailniVykony.pocet 0..1 integer
  "A.3.3.5.1.2 - Počet"

* specifickeUdajeFT.pozadovano.detailniVykony.frekvence 0..1 string
  "A.3.3.5.1.3 - Frekvence"

* specifickeUdajeFT.pozadovano.obecnyDruhPece 0..1 CodeableConcept
  "A.3.3.5.2 - Obecný druh péče"
  """Druh péče dle číselníku (delegovaný model)."""

* specifickeUdajeFT.domaciPece 0..1 Base
  "A.3.3.6 - Péče v domácím prostředí"

* specifickeUdajeFT.domaciPece.adresa 1..1 Address
  "A.3.3.6.1 - Adresa poskytování péče"

* specifickeUdajeFT.kontrola 0..1 Base
  "A.3.3.7 - Lékařská kontrola"

* specifickeUdajeFT.kontrola.datum 1..1 dateTime
  "A.3.3.7.1 - Datum kontroly"
