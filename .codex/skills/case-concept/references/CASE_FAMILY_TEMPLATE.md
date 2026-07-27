# Template - Case-Family-Decision

> Erst nach ausdruecklicher Dokumentationsfreigabe verwenden. Globale
> Invarianten verlinken, nicht kopieren.

## Frontmatter

- Deutscher Titel
- praezise Description
- Tags
- `lastUpdated`
- Status
- Owner

## Status, Scope und SSOT

- Datum und Art der Freigabe
- registrierte globale Family-ID und deutscher Titel
- Owning Decision/Katalogverweis
- Zielrelease
- bewusst ausgeschlossener Scope

## Zweck und Nutzerziel

- reales Nutzerziel
- verstaendliches Ergebnis
- warum ein eigener Case und nicht Record, Task, Event oder nur Dokumentlink

## Einstieg und Anker

- Dokument-/Medien-/Record-/Event-Anker
- dokumentlose manuelle Anlage
- Capture-Hints und konservative automatische Titelvorschlaege ohne
  standardmaessiges Datum

## Case-Grenze

- was gehoert zusammen
- was trennt ausdruecklich nicht
- wann neuer eigenstaendiger Case
- Grenz-/Gegenbeispiele

## Beziehungen

- `part_of`
- `caused_by`
- `follow_up_to`
- `related_to`
- ausgeschlossene/fehlerhafte Beziehungen

## Workflow und Spuren

- Ablaufspuren
- wiederholbare Events
- unabhaengige Statusdimensionen
- erwartbare terminale Ergebnisse

## Typische optionale Inhalte

- Dokumente/Medien/Records/Facts/Rollen
- kontextuelle Vorschlaege
- keine Pflicht-/Vollstaendigkeitsliste
- Verweis auf Taxonomie-Disposition

## Aufgaben und Zeit

| Bestaetigter Ausloeser | Aufgabe/Erwartung | Zeitquelle | Zweite Bestaetigung? | Lifecycle-Wirkung |
|---|---|---|---|---|

## Personen, Parteien, Records und Assets

- Managed Subject
- External Parties
- Records/Vertraege/Polizzen
- Assets
- Access-/Privacy-Grenzen

## Finanzen

- Verpflichtung
- Zahlung/Ausgang
- Eingang/Erstattung
- Status versus Betrag
- Roll-up und Deduplizierung

## Matching und Assist

- Matching-Matrix aus `MATCHING_BOUNDARY_MATRIX.md`
- familiespezifische Belegung aller vier Vorschlagsstufen:
  bestaetigter Nutzerkontext, starke Kontinuitaet, kombinierte mittlere
  Signale, schwach/unbekannt
- ausdruecklich immer schwache Signale und Anti-Signale
- Extraktion -> berechtigungsgefiltertes Retrieval -> Ranking -> Review
- realistische Small-/Medium-Model-Baseline und bewusst nicht automatisch
  erkennbare Signale
- Candidate-Ausgabe
- `new Case` und Suchfallback
- geschlossene/archivierte Kandidaten
- Titelvorschlag
- Korrektur/Undo
- optionale Relationen nur best-effort und nutzerbestaetigt
- Backend-/Data-Feasibility

## Lifecycle

- manueller Abschluss
- Abschlussvorschlag
- sechsmonatiger Inaktivitaetsreview und Suppression
- spaete Evidenz
- Wiedereroeffnung
- Parent-/Child-Unabhaengigkeit

## Country-/Provider-Grenze

- universeller Kern
- Pack-Overlays
- Fallback
- Quellen-/Reviewbedarf

## Verifikation

- positive Szenarien
- negative/Anti-Signale
- `unknown`/generischer Fallback
- Korrektur ohne semantische Wrong-Case-/Wrong-Profile-Behauptung
- gemischter Dokumentinhalt ohne Invalidierung, Ablehnung oder Auto-Split
- Offline/Restart
- spaete Evidenz
- Country-Pack vorhanden/fehlend/veraltet
- Berechtigung/Managed Subject

## Offene Entscheidungen und Handoffs

- Product/Domain
- Backend/Data/Intelligence-Feasibility
- API/Contract
- UI/Accessibility
- Legal/Compliance/Country Pack
- GitHub Issues

## Stop Rules

- familienlokale Risiken
- uebernommene globale Stop Rules
