Logical: LogCzAdditionalClinicalInfoKOrderCz
Id: logAdditionalClinicalInfoKOrder
Title: "A.2.5 - Doplňující klinické informace"
Description: """Doplňující klinické informace a poznámky
vztahující se ke konziliární žádance."""

* poznamka 0..1 string "2.5.1 - Poznámka"
  """Obecná poznámka k žádance."""

* zavaznaAnamneza 0..1 string "2.5.2 - Závažná anamnestická data"
  """Závažná anamnestická data relevantní pro posouzení žádosti."""

* vysledkyVysetreni 0..1 string "2.5.3 - Výsledky provedených vyšetření"
  """Shrnutí dostupných výsledků již provedených vyšetření."""

* diferencialniRozvaha 0..1 string "2.5.4 - Diferenciálně diagnostická rozvaha"
  """Úvaha nad možnými diagnózami a dalšími postupy."""

* soucasnaLecba 0..1 string "2.5.5 - Současná léčba"
  """Aktuální léčba a medikace včetně dávkování."""
