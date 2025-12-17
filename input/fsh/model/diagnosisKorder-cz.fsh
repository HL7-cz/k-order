Logical: LogCzDiagnosisKOrderCz
Id: logDiagnosisKOrder
Title: "A.2.1 - Diagnózy"
Description: """Diagnózy odůvodňující žádanku na konziliární nebo jinou zdravotní službu."""

* hlavniDiagnoza 1..1 CodeableConcept "Hlavní diagnóza"
  """Hlavní diagnóza zdůvodňující žádost dle MKN-10 (ÚZIS)."""

* vedlejsiDiagnozy 0..* CodeableConcept "Vedlejší diagnózy"
  """Další relevantní diagnózy pacienta dle MKN-10 (ÚZIS)."""

* kodNahrady 0..1 CodeableConcept "Kód náhrady"
  """Kód typu úhrady nebo programu dle číselníku VZP."""