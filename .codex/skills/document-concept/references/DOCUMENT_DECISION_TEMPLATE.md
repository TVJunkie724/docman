# Template - Dokumenttaxonomie-Entscheidung

## Kandidat

- Begriff und deutscher Titel
- Herkunft/Case-Familie
- Nutzerwert
- Zielrelease

## Achsen-Disposition

| Achse | Entscheidung | Begruendung |
|---|---|---|
| Base Type | | |
| semantische Variante/Subtyp | | |
| Domain | | |
| Relationship Role/Slot | | |
| Record Kind | | |
| Fact/Party | | |
| Source/Format | | |
| Titel/Alias/Suchvokabular | | |
| Country-/Provider-Layer | | |

## Produktwerttest

- langlebige gezielte Wiederverwendung?
- materiell anderes Matching/Workflow/Task/Frist/State/Export/Handoff?
- reicht Titel/Fact/Party/Domain/Record/Rolle/Alias?
- stabile, verstaendliche Semantik?
- Korrektur-/Fallback-/Abstention-Pfad?
- Nutzen groesser als Schema-/Migration-/UI-Komplexitaet?

## Feasibility

- Zielmodellklasse: kleine/mittlere General-Purpose-Modelle
- Erkennungs-/Abstention-Evidenz
- bewusste Nutzereingabe als alternativer Erkennungspfad
- grober/generischer Fallback ohne Funktionsverlust
- konservativer automatischer Titel ohne Datum als Standard
- usergewaehlter Managed Subject/Case-Kontext bleibt autoritativ
- gemischter semantischer Inhalt bleibt ohne Invalidierung, Ablehnung oder
  Auto-Split generisch nutzbar
- relevante Laender-/Providerunterschiede
- synthetische Fixtures
- Kosten/Latenz/Privacy
- Backend-Register-ID

## Entscheidung

- accepted / broad-generic / alias-only / role / record / deferred / rejected
- stabiler Key, falls akzeptiert
- Migration/Versionierung
- Owner und Reviewdatum
