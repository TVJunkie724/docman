# Checklist - Case-Family-Review

## SSOT

- [ ] genau eine Owning Family-Decision
- [ ] Katalog besitzt ID, deutschen Titel, Status und Owner
- [ ] Discovery ist nicht normativ
- [ ] keine widersprechende parallele Liste

## Family-Vertrag

- [ ] Zweck/Nutzerziel
- [ ] Einstieg/Anker und dokumentlose Anlage
- [ ] exakte Case-Grenze
- [ ] Beziehungen
- [ ] Workflow/Spuren
- [ ] typische optionale Inhalte
- [ ] Aufgaben/Zeit/Wiederholung
- [ ] Personen/Parteien/Records/Assets
- [ ] Finanzen/Deduplizierung
- [ ] Matching/Assist
- [ ] Lifecycle/Inaktivitaet/spaete Evidenz
- [ ] Country-/Provider-Grenze
- [ ] Zielrelease/Ausschluesse
- [ ] Verifikation

## Globale Invarianten

- [ ] ein generischer Case
- [ ] keine Claim-/Subcase-Sonderentitaet
- [ ] null/ein/mehrere Dokumente immer gueltig
- [ ] keine Pflicht-/Vollstaendigkeitsliste
- [ ] Parent-/Child-Lifecycle unabhaengig
- [ ] Abschluss immer bestaetigt
- [ ] Inaktivitaet nie Auto-Close
- [ ] `done`/`archived` bleiben matchbar
- [ ] gemischter Dokumentinhalt erzeugt keine Invalidierung, Ablehnung oder
  M1-Segmentierung

## Dokumenttaxonomie

- [ ] typische Inhalte sind keine Typenliste
- [ ] sinnvolle Subtypen nicht pauschal entfernt
- [ ] jeder neue Typ besteht Produktwerttest
- [ ] Country-/Providerdetails bleiben Overlay
- [ ] generischer Fallback vorhanden
- [ ] keine rechtliche Dokumentgueltigkeitspruefung behauptet

## Matching und Feasibility

- [ ] Signal-Matrix mit Provenienz und Anti-Signalen
- [ ] vier Vorschlagsstufen familiespezifisch belegt
- [ ] bestaetigter Nutzerkontext bleibt autoritativ
- [ ] stark/mittel/schwach fuehrt zur definierten sichtbaren Candidate-Ausgabe
- [ ] kein schwaches Einzelsignal und keine reine Modell-Confidence erzeugt
  starke Kontinuitaet
- [ ] Pipeline trennt Extraktion, berechtigungsgefiltertes Retrieval, Ranking
  und Nutzerreview
- [ ] Suchfallback und `new Case`
- [ ] Relationen hoechstens als optionale best-effort Matching-Ausgabe mit
  Nutzerbestaetigung und manuellem Fallback
- [ ] Backend-Feasibility fuer Extraktion/Ranking/Latenz/Privacy
- [ ] starke Nutzerprovenienz wird nie still ersetzt
- [ ] keine Small-Model-Ueberschreitung fuer Person, Case,
  Dokumentkohaerenz, Workflow, Frist oder Kausalitaet

## Tasks, Zeit und Trust

- [ ] Ausgangs-Facts korrekt bestaetigt
- [ ] reversible interne Ableitung ohne zweite Bestaetigung
- [ ] externe Aktion/Notification/Abschluss bestaetigungsgebunden
- [ ] Agenda versus Timeline sauber
- [ ] Country-/Provider-Regeln datiert, versioniert, reviewed

## Evidence und Handoff

- [ ] synthetische positive/negative/unknown/conflict Fixtures
- [ ] Offline/Retry/Correction
- [ ] spaete Evidenz und Wiedereroeffnung
- [ ] Open Questions mit Owner/Phase/Fallback
- [ ] Backend-/Data-Register synchron
- [ ] getrennte Frontend-/Backend-/API-Issues
