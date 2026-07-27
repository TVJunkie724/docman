---
title: "Konzept F15 - Mock Repository Blueprint"
description: "Deterministische Fake-, Fixture-, UI-Mock- und Contract-Mock-Strategie fuer Mappm"
tags: [concept, foundation, fake-repository, mock, fixtures, microcks, ui-mock, testing]
lastUpdated: "2026-07-22"
version: "5.0"
status: "accepted"
owner: "quality-readiness/ui-concept"
---

# Konzept F15 - Mock Repository Blueprint

## Status und Zweck

Akzeptiert. F15 definiert, wie Mappm ohne fertiges Backend, ohne private Daten
und ohne instabile Umgebung entwickelt, getestet und visuell validiert wird.
Es ersetzt Fake-Home-Hub-, QR-Pairing- und Draft-Inbox-Fallback-Szenarien.

## Vier getrennte Ebenen

| Ebene | Zweck | Darf nicht |
|---|---|---|
| Fake Repository/Port | Domain-, Provider- und Widget-Verhalten deterministisch testen | Netzwerk oder echte Persistenz verwenden |
| UI-Konzeptmock | Form, Dichte und Interaktion eines noch nicht produktiven Flows pruefen | Produktnavigation oder reale Adapter verwenden |
| Microcks Contract Mock | OpenAPI-Verbraucherverhalten und Responses pruefen | Domain- oder UI-Logik ersetzen |
| Local Development Cloud | reale Client-/Server-Integration mit synthetischen Daten pruefen | als Fake oder Production-Ersatz gelten |

Ein Fake Cloud Repository testet App-Verhalten. Microcks testet den Vertrag.
Local Development Cloud testet die echte Integration. Staging prueft den
managed Betriebsweg. Die Ebenen werden in Reports und Testnamen klar benannt.

## Fake-Regeln

- Fakes implementieren dieselben Domain-Ports wie produktive Adapter.
- Fakes enthalten keine alternative Produktlogik; sie liefern Daten, Zeit,
  Fehler und bestaetigte Transaktionen kontrollierbar aus.
- Jeder Fake ist deterministisch und erhaelt Clock, ID Generator und
  Szenariokonfiguration explizit.
- Ein Fake darf niemals still eine echte Cloud, lokale private Dateien, Drift,
  Secure Storage oder externe APIs aufrufen.
- Production Composition darf nicht auf Fakes zurueckfallen. Fehlende
  Konfiguration fuehrt zu einem klaren Startfehler.
- Fakes simulieren auch Fehler, Restart, Konflikte, Latenz und Teilresultate;
  sie sind nicht nur Happy-Path-Listen.

## Verbindliche Fake-Matrix

### Foundation

- Fake Clock und kontrollierbarer Scheduler.
- Fake ID Generator.
- Fake Secure Storage ohne produktionsaehnliche Secrets.
- In-Memory Structured Store und Fake File Store.
- Fake Account-/Device-Session und Offline-Berechtigung.
- Fake Entitlement, Quota, Grace und Retention Clock.

### Vaults und Lifecycle

- Local Vault Repository als lokale Autoritaet.
- Cloud Vault Repository als Cloud-Autoritaet.
- lokaler Cache und Pending-Operation-Store.
- Konflikte, Tombstones, Cache Miss offline und Reauth.
- Local-to-Cloud/Cloud-to-Local mit Checkpoints, Verifikation und Fehlern.
- Export, Delete, Restore und Detached Recovery.

### Produktdomain

- Cases und CaseLinks.
- Records, Documents, Versicherungsabwicklungs-Cases, Submission Events,
  Tasks, Termine und Profile; kein Claim-Repository.
- Search/Facts mit kleinen synthetischen Indizes.
- Custom Case als normaler, minimal befuellter Case.

### Capture und Assist

- technische Session mit einem oder mehreren logischen Dokumenten.
- ein Dokument mit mehreren Seiten; keine Vermischung zweier Dokumente in
  einer Scan-Einheit.
- dauerhafte Originalannahme und 1-2 Minuten simulierbare Verarbeitung.
- Upload-, OCR-, Extraction-, Index- und Matching-Stufen.
- hoher, mittlerer, niedriger und unzureichender Confidence-Bereich.
- immer gerankte beste Kandidaten und bei sehr niedriger Confidence ein neuer
  leichter Custom Case zuerst.
- verpflichtender Titelvorschlag fuer neue Cases sowie Typ-, Fakten- und
  Case-/Record-Vorschlaege mit Provenance.
- optionaler New-Case-/Case-Intent als Signal, niemals als finale Zuordnung.
- technische Teilfehler, Cancel, Retry, Restart und Reprocessing; keine
  erfundene semantische Outlier-/Wrong-Case-Faehigkeit.
- erhaltene bestaetigte Titel/Fakten und reversible Korrektur.

## Synthetische Fixtures

Die geplante Zielablage fuer App-Fixtures ist `test/fixtures/`, fuer Contract
Examples `contracts/examples/`. Diese Pfade werden erst in ihrer freigegebenen
Implementation-Phase angelegt. Jede Fixture ist frei erfunden und enthaelt:

- stabilen Zweck/Scenario-Key.
- erwartete Klassifikation, Fakten und Beziehungen.
- erlaubte Testebenen.
- keine echten Namen, Adressen, Kontonummern, Versicherungsdaten, Dokumente,
  Screenshots oder Metadaten.

Auch anonymisierte private Haushaltsdokumente sind verboten. PDF-/Bild-Fixtures
werden synthetisch erzeugt und visuell als Testdaten kenntlich gemacht.

## UI-Konzeptmocks

UI-Mocks liegen gemaess `ui-mocker` unter
`lib/presentation/screens/mocks` und laufen ueber einen eigenen Entry Point. Die
Produktnavigation kennt sie nicht. Ein Mock darf keine echten Repositories,
Drift, Secure Storage, Microcks, Mappm Cloud oder externen APIs aufrufen.

Geeignete Mocks sind unter anderem:

- globales Capture und asynchrone Verarbeitung.
- kompakte Review fuer Titel, Typ, Fakten und Case-/Record-Matching.
- mehrere zusammenhaengende oder nicht zusammenhaengende Dokumente.
- Case-/Record-Detail, Search, Tasks und Vault-Lifecycle.
- Fehler-, Offline-, Quota-, Migration- und Accessibility-Zustaende.

Der konkrete UI-Aufbau wird spaeter mit der Nutzerin konzipiert. F15 legt keine
Karten, Buttons, Swipe-Gesten oder Screen-Komposition vorweg. Der Mock muss aber
die fachlichen Zustaende vollstaendig simulieren und darf nicht nur eine
statische Happy-Path-Ansicht sein.

## Szenariosteuerung

Tests konfigurieren Szenarien per typisierten Buildern oder Fixtures, nicht ueber
globale versteckte Flags. UI-Mocks duerfen eine Dev-only Szenarioauswahl
besitzen, wenn sie:

- eindeutig als Mock markiert ist.
- keine Produktionskonfiguration veraendert.
- deterministisch reproduzierbare Szenario-IDs ausgibt.
- auf kleinen und grossen Viewports bedienbar ist.

## Microcks-Abgrenzung

Microcks-Szenarien werden aus akzeptierter OpenAPI und synthetischen Examples
abgeleitet. Sie pruefen unter anderem Identity, Entitlement, Capture,
Processing, Sync, Migration, Export und Delete. Ein App-Test darf einen
Microcks-Response nicht als Beweis fuer Domain-Invarianten verwenden.

## Sicherheit, Accessibility und Localization

- Keine privaten Daten oder echten Secrets in Fixtures, Goldens, Screenshots
  oder Reports.
- Mock-Modus ist visuell und semantisch eindeutig, aber kein produktiver Banner.
- Relevante UI-Mocks enthalten Tastatur-, Fokus-, Semantics-, Textscale- und
  Kontrastzustaende.
- Nutzernahe Mock-Texte sind Deutsch und lokalisierbar angelegt.
- Dev-Szenarionamen duerfen technisch sein, erscheinen aber nie im Produktpfad.

## Tests und Verifikation

- Contract-Tests stellen sicher, dass Fakes ihre Domain-Ports vollstaendig
  implementieren.
- Determinismustests laufen mit gleicher Clock/ID zweimal identisch.
- Negative Tests beweisen, dass Fakes kein Netzwerk oder echte Dateipfade
  verwenden.
- Jede kritische Matrixzeile besitzt Happy-, Failure- und Restart-Szenario.
- Mock Entry Point wird separat gebaut und ist aus Production unerreichbar.
- Fixture-Scan prueft verbotene Secrets/PII und dokumentiert synthetische Quelle.

## Stop Rules

Stop, wenn:

- ein Fake echte Infrastruktur oder private Daten verwendet.
- Fake-Logik eine fehlende Domain-Regel verdeckt.
- ein UI-Mock als fertige Produktentscheidung behandelt wird.
- Microcks, Fake und Local Development Cloud nicht eindeutig unterschieden sind.
- Production bei Konfigurationsfehler still auf Fake-Daten startet.
- Capture-Szenarien Titelvorschlag, niedrige Confidence, Teilfehler oder
  User-Korrektur auslassen.

## Handoff

Fake-/Fixture-Umsetzung geht an `quality-readiness` und
`frontend-test-coverage`; UI-Mocks an `ui-mocker`; API-Szenarien an
`contract-api`.

## Enterprise Quality Contract

Dieses Konzept uebernimmt
`docs/execution/CONCEPT_ENTERPRISE_QUALITY_CONTRACT.md`. Bei Widerspruechen gilt
die strengere Regel und die betroffene Phase stoppt.
