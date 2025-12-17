Logical: LogCzAdditionalClinicalInfoKOrderCz
Id: logAdditionalClinicalInfoKOrder
Title: "A.2.5 - Doplňující klinické informace"
Description: """Doplňující klinické informace a poznámky
vztahující se ke konziliární žádance."""

* poznamka 0..1 string "Poznámka"
  """Obecná poznámka k žádance."""

* zavaznaAnamneza 0..1 string "Závažná anamnestická data"
  """Závažná anamnestická data relevantní pro posouzení žádosti."""

* vysledkyVysetreni 0..1 string "Výsledky provedených vyšetření"
  """Shrnutí dostupných výsledků již provedených vyšetření."""

* diferencialniRozvaha 0..1 string "Diferenciálně diagnostická rozvaha"
  """Úvaha nad možnými diagnózami a dalšími postupy."""

* soucasnaLecba 0..1 string "Současná léčba"
  """Aktuální léčba a medikace včetně dávkování."""
