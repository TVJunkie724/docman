---
title: "Konzept F4 - Testing Strategy"
description: "DocMan-spezifische Teststrategie für Domain, Riverpod, lokale Persistenz, Draft-Inbox, Mobile Capture, Home Hub und spätere Sync-/Intelligence-Flows"
tags: [concept, foundation, testing, flutter, riverpod, local-first, mobile-capture]
lastUpdated: "2026-05-06"
version: "3.6"
status: "accepted"
---

# Konzept F4 - Testing Strategy

## Status

Accepted.

Dieses Konzept ersetzt den importierten F4-Inhalt aus dem alten Projekt.

## Zweck

F4 definiert, wie DocMan getestet wird.

Tests sollen nicht eine perfekte Enterprise-Fassade erzeugen, sondern die wichtigsten Produktversprechen schützen:

- lokale Arbeit ohne Netzwerk.
- Dokumente gehen nicht verloren.
- Mobile Upload Queue ist robust.
- Draft-Inbox bleibt nachvollziehbar.
- Provider und Repository-Grenzen bleiben sauber.

R3 `Quality & Production Readiness` operationalisiert dieses Konzept. Ab R3 darf Testabdeckung nicht mehr nur "neuer Code hat Tests" bedeuten; der Zielpfad muss belastbar werden und der alte Spike-Bestand muss aus Produkt-, Build- und Analyze-Pfaden herauswandern.

## Testpyramide

| Ebene | Fokus | Priorität |
|---|---|---|
| Domain Unit Tests | Cases, Documents, Drafts, Statusregeln, Value Objects | Hoch |
| Application/Notifier Tests | Riverpod Notifier, Upload Queue, Draft Review | Hoch |
| Repository Tests | lokale DB Fakes/In-Memory, Mapper, File Store | Hoch |
| Widget Tests | wichtige Screens und Zustände | Mittel |
| Integration/Smoke Tests | MVP-Flows Desktop + Mobile Capture | Mittel |
| Golden Tests | zentrale UI-Komponenten, wenn Design stabil ist | Später |
| Backend Contract Tests | Home-Hub/Capture/Sync Gateway, Microcks-gestützte API-Verträge | Sobald API existiert |

## Zweistufige Testgrenze

DocMan braucht zwei verschiedene Testebenen, die nicht vermischt werden dürfen:

| Ebene | Ziel | Typische Tests |
|---|---|---|
| Fake Repositories | App- und Domain-Verhalten schnell und deterministisch prüfen | Domain, Riverpod Notifier, Widget Tests, Offline-Flows |
| Contract Mock Backend | API-Verträge unabhängig vom echten Backend stabilisieren | Home-Hub Health, Pairing, Capture Upload, Sync-Fehler, Client-Integration |

Fake-Repositories ersetzen keine API-Verträge. Microcks ersetzt keine App-Unit-Tests. Die Kombination verhindert, dass die Flutter-App an ein zufälliges Backend klebt oder dass Backend-Verträge erst beim echten Server auffallen.

## MVP-kritische Flows

Diese Flows brauchen Tests:

- Vorgang anlegen und lokal wieder laden.
- Dokument als Draft erfassen.
- Draft einem Vorgang zuordnen.
- Mobile Scan lokal in Queue legen.
- Upload wartet, wenn Home Hub nicht erreichbar ist.
- Upload Retry verliert Datei nicht.
- direkte mobile Vorgangszuordnung fällt bei ungültiger `caseId` in Draft-Inbox zurück.
- Home-Hub-Status blockiert lokale Desktop-Arbeit nicht.

## Riverpod Tests

Riverpod wird nicht gemockt.

Tests verwenden:

- ProviderContainer.
- ProviderScope Overrides.
- Fake Repositories.
- Fake Clock/ID Generator.
- Fake HomeHubClient.
- Fake SecureStorageRepository.

Jeder produktive Notifier mit fachlicher Logik braucht Unit Tests.

## Local Storage Tests

F10-Anforderungen müssen beweisbar sein:

- persistierte Cases/Documents/Drafts.
- Queue über App-Neustart konzeptionell haltbar.
- Mapping zwischen Storage-Modell und Domain-Typ.
- Fehlerfälle bei fehlenden Dateien.
- keine Secrets in normaler lokaler DB.

Wenn echte lokale DB-Tests zu schwer sind, starten wir mit Repository-Fakes plus wenigen Integrationstests gegen echte Storage-Implementierung.

## API/Home-Hub Tests

F11-Anforderungen werden später mit Contract-/Integrationstests geprüft:

- Health Check.
- Capture Upload.
- Auth/Pairing-Fehler.
- Upload zu Draft-Inbox.
- Fehler-Mapping nach F5.

Solange kein Backend existiert, werden zwei Wege genutzt:

- Fake-Clients für App-Logik und Provider-/Widget-Tests.
- Microcks für API-Spezifikationen und Client-Integrationsgrenzen.

Die Contract-Quelle ist OpenAPI. Der echte Home-Hub-Server muss später denselben Vertrag erfüllen.

## Bestehender Code

R3 macht nicht den alten Spike production-ready. R3 definiert und schützt den Zielpfad:

- harte Analyzer-Fehler im Zielpfad blockieren Abschluss.
- Legacy-Warnungen im eingefrorenen Altbestand sind kein Produktqualitaetsziel.
- wenn Legacy den Zielpfad, Build oder Analyze blockiert, wird es isoliert, migriert oder gelöscht.
- alte Template-Tests werden entfernt.
- Spike-Screens bekommen nicht nachträglich Produkt-Tests; sie werden Referenz, Mock-Ausgangspunkt oder verlassen den Produktpfad.
- BLoC/GetIt/Isar/PocketBase-Reste werden nicht erweitert und nicht modernisiert, sondern aus Zielpfaden entfernt.

## Widget Tests

Wichtige UI-Zustände:

- Loading.
- Empty.
- Data.
- Offline/Home Hub unreachable.
- Upload queued.
- Upload failed retryable.
- Review needed.

Widget Tests prüfen Verhalten und Sichtbarkeit, nicht Pixelperfektion.

## Testdaten

DocMan-Testdaten sollen realistisch, aber nicht sensibel sein:

- fiktive Rechnungen.
- fiktive Schulzettel.
- fiktive Versicherungsfälle.
- keine echten personenbezogenen Daten.
- keine echten Dokumente aus dem Haushalt.

Zentrale App-Testfixtures liegen unter `test/fixtures/`.

```text
test/fixtures/
  domain/
  files/
  ui/
```

API-/Microcks-Beispiele liegen bei den API-Vertraegen unter `contracts/`.

```text
contracts/
  openapi/
  examples/
```

Fixtures duerfen keine anonymisierten privaten Daten verwenden. Auch anonymisierte echte Dokumente bleiben verboten, weil Rueckschluesse, Metadaten und versehentliche Reste zu riskant sind.

## Regression Gate

Vor Implementationsabschluss einer Phase:

- Flutter Analyze.
- relevante Unit Tests.
- relevante Widget Tests.
- Smoke Test für den betroffenen Flow.
- Contract-Mock-Checks, sobald API-Slices betroffen sind.

Exakte Commands gehören in Implementation-Pläne, nicht in dieses Konzept.

DocMan nutzt die Gate-Stufen aus `docs/technical/DECISION_MVP_QUALITY_GATES.md`:

- Local Change Gate fuer konkrete Aenderungen.
- R3 Foundation Gate fuer Foundation-/Quality-Abschluss.
- MVP Readiness Gate fuer MVP-Abschluss.

Tests duerfen Legacy-Schuld nicht verstecken. Wenn ein Legacy-Problem den Zielpfad oder ein Gate blockiert, braucht es Isolation, Entfernung oder ein GitHub Issue mit Acceptance Criteria und Verification. Einzelne alte Warnungen ohne Einfluss auf den Zielpfad werden nicht als Production-Readiness-Arbeit behandelt.

## Setup und Codegen

Ein frischer Checkout muss reproduzierbar arbeitsfähig werden:

- Bootstrap-Script für Dependencies und Codegen, mit optionalem strengen Verify-Lauf.
- Codegen-Script für Freezed, JSON, Drift und spätere Riverpod-Generatoren.
- Verify-Script als lokales Quality Gate vor Commit/PR.

Generierte Dart-Artefakte werden nicht committed. Ein frischer Checkout muss sie per Script erzeugen können; sonst ist das Setup nicht production-ready.

Nicht committed werden:

- `*.freezed.dart`
- `*.g.dart`
- Drift-generierter Dart-Code
- Riverpod-generator Output

Committed bleiben Quellen und Verträge: `pubspec.lock`, Generator-Konfiguration, OpenAPI-Spezifikationen, synthetische Examples und handgeschriebene Migrationen.

## Definition of Done für F4

F4 gilt als umgesetzt, wenn:

- Teststruktur zur F1-Zielstruktur passt.
- Riverpod-Provider testbar sind.
- Storage und Queue mit Fakes testbar sind.
- API-Grenzen für Home Hub, Capture und Sync contract-testbar geplant sind.
- Bootstrap-, Codegen- und Verify-Scripts existieren.
- generierte Dart-Artefakte ignoriert und reproduzierbar erzeugt werden.
- MVP-kritische Flows abgedeckt werden.
- alte Flutter-Counter-Template-Tests entfernt oder ersetzt sind.
- Tests keine echten Secrets oder privaten Dokumente verwenden.
- zentrale synthetische Fixtures unter `test/fixtures/` liegen.
- API-/Microcks-Beispiele unter `contracts/` liegen.
- R3/MVP-Gates aus `DECISION_MVP_QUALITY_GATES.md` operationalisiert sind.

## Offene Folgefragen

- Welche Test-Helper werden zentral gebaut?
- Welche echte lokale DB-Implementierung bekommt Integrationstests?
- Wann führen wir Golden Tests ein?
- Wie testen wir Mobile Capture ohne echte Kamera im MVP?
- Wann wird Microcks konkret in Docker/Compose eingebunden?
- Welche OpenAPI-Spec wird zuerst umgesetzt?
