Logical: LMCzRequestedPerformerOrderCz
Id: LMRequestedPerformerOrderCz
Title: "A.1.6 - Provádějící"
Description: """Předpokládaný Provádějící žádanky (u neadresné žádanky nebude Provádějící uveden)."""

* insert SetFmmandStatusRule ( 1, draft )

* id 0..1 Identifier "A.1.6.1 -ID Provádějícího" """Identifikátor, který se vztahuje na tuto osobu v této roli. Identifikátor z KRZP."""
* jmeno 0..1 HumanName "A.1.6.2 - Jméno Provádějícího" """Jméno a příjmení osoby provádějícíe žádanky."""
* idOrganizace 0..1 Identifier "A.1.6.3 - ID organizace Provádějícího" """Identifikátor organizace provádějícího, který se používá k identifikaci organizace v různých informačních systémech. V ČR se využívá KRPZS identifikátor tedy IČO """
* organizace 0..1 Base "A.1.6.4 - Organizace Provádějícího" """Název, identifikační a kontaktní údaje zdravotnického zařízení Provádějícího, případně také pracoviště Provádějícího."""