Logical: LogCzClinicalReasonKOrderCz
Id: logClinicalReasonKOrder
Title: "A.2.2 – Klinické zdůvodnění žádosti"
Description: """Klinické důvody (reason) žádosti o konziliární vyšetření
nebo jinou zdravotní službu, včetně anamnézy, objektivního nálezu
a dalších souvisejících klinických informací."""

* textZduvodneni 1..1 string "Zdůvodnění žádosti"
  """Klinické důvody žádosti (anamnéza, objektivní nález, hlavní klinické okolnosti)."""

* zavaznaAnamneza 0..1 string "Závažná anamnestická data"
  """Významná anamnestická data důležitá pro posouzení žádosti."""

* vysledkyVysetreni 0..1 string "Výsledky provedených vyšetření"
  """Shrnutí dostupných výsledků již provedených vyšetření."""

* diferencialniRozvaha 0..1 string "Diferenciálně diagnostická rozvaha"
  """Klinická úvaha nad možnými diagnózami."""

* soucasnaLecba 0..1 string "Současná léčba"
  """Aktuální léčba a medikace včetně dávkování."""
