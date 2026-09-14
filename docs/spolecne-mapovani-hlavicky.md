# Společné mapování hlavičky IMG, K a FT

Aktualizace 11. 9. 2026. Implementované sjednocení se týká hlavičky A.1, nikoli dosud rozdílných částí těla a logických modelů.

Všechny tři žádanky používají stejných 70 mapovacích řádků a stejné cíle z CZ Core 1.0.0: CZ_PatientCore, CZ_PractitionerCore, CZ_PractitionerRoleCore, CZ_OrganizationCore, CZ_RelatedPersonCore a CZ_Coverage. Composition, ServiceRequest a Bundle zůstávají doménovými profily. CZ_PractitionerRoleOrder je specializace dostupná přímo v CZ Core; tabulka popisuje společný základ a neodstraňuje omezení konkrétní žádanky.

## Zdroje a údržba

- Jediný upravovaný zdroj řádků: [header-mapping.json](../input/data/header-mapping.json).
- Generování českých a anglických includes a napojení šesti stránek: `python scripts/sync-header-mapping.py`.
- Kontrola shody a existence cílových elementů v nainstalovaných FHIR/CZ Core balíčcích: `python scripts/check-header-mapping.py`.
- Pro jinou cestu IMG checkoutu: generátor podporuje `--img-root C:/cesta/IMG`; kontrolní skript přijímá cestu jako první argument.

Generátor aktualizuje tento projekt Order a skutečný sousední projekt `../RTG`. IMG má vlastní kopie vygenerovaných includes, aby zůstal samostatně sestavitelný. Archiv `archive/RTG` se nemění. Při předání změn je nutné zahrnout oba projekty. `--check` ověří i shodu těchto kopií.

Obě jazykové tabulky záměrně odkazují na české logické modely. Rozdíly v samostatných anglických logických modelech nejsou touto úpravou odstraněny; překlad tabulky nemění cílové FHIR elementy.

## Věcné opravy vůči původním tabulkám

- FT doplňuje organizaci a kontakty preferovaného lékaře i kontaktní osoby. Identifikátor zdravotníka je společně na Practitioner.identifier; PractitionerRole.identifier identifikuje roli.
- Číslo pojištěnce je v Coverage.subscriberId. Coverage.identifier podle CZ Core označuje krytí nebo pojistnou smlouvu. Ze zdrojového Identifier se přenáší value.
- Reference mají explicitní průchody `resolve()`, příjemce používá `extension[informationRecipient].valueReference` a lékař `PractitionerRole.practitioner`. Tabulkový zápis slice není doslovný FHIRPath.
- Občanství a pohlaví pro klinické použití vedou na hodnoty skutečných vnořených rozšíření CZ Core. Verze dokumentu má standardní URL rozšíření composition-clinicaldocument-versionNumber.
- Podpis dokumentu je shodně Bundle.signature. CZ_Provenance může zvlášť vyjádřit podpisy zdrojů; nejde o jiné mapování stejné hlavičky FT. Čas podpisu v signature.when není samostatný kryptografický token časového razítka.
- Patient.contact nemá identifier. Tabulka tento údaj výslovně označuje jako údaj bez přímého mapování namísto předstírání ekvivalence s Patient.contact.

Zůstává samostatné rozhodnutí o doplňujícím K/FT logickém údaji A.1.4.3 kodNahrady, který IMG v hlavičce nemá a pro který současné profily nedefinují přímé mapování. Společná tabulka nevymýšlí FHIR element ani nový profil. Sjednocení tabulkového mapování rovněž nesjednocuje kardinality původních logických modelů.
