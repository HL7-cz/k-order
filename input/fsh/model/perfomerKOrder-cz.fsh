Logical: LogCzRequestedPerformerKOrderCz
Id: LogRequestedPerformerKCz
Title: "A.1.6 - Zpracovatel"
Description: """Předpokládaný zpracovatel žádanky (u neadresné žádanky nebude zpracovatel uveden)."""

* insert SetFmmandStatusRule ( 1, draft )

* id 0..1 Identifier "A.1.6.1 -ID zpracovatele" """Identifikátor, který se vztahuje na tuto osobu v této roli."""
* jmeno 0..1 HumanName "A.1.6.2 - Jméno zpracovatele" """Jméno a příjmení osoby zpracovatele žádanky."""
* idOrganizace 0..1 Identifier "A.1.6.3 - ID organizace zpracovatele" """Identifikátor organizace zpracovatele, který se používá k identifikaci organizace v různých informačních systémech."""
* organizace 0..1 Base "A.1.6.4 - Organizace zpracovatele" """Název, identifikační a kontaktní údaje zdravotnického zařízení zpracovatele, případně také pracoviště zpracovatele."""