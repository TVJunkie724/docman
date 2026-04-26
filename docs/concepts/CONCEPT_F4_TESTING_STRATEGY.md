---
title: "Konzept F4 - Testing Strategy"
description: "DocMan-spezifische Teststrategie für Domain, Riverpod, lokale Persistenz, Draft-Inbox, Mobile Capture, Home Hub und spätere Sync-/Intelligence-Flows"
tags: [concept, foundation, testing, flutter, riverpod, local-first, mobile-capture]
lastUpdated: "2026-04-26"
version: "3.0"
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

## Testpyramide

| Ebene | Fokus | Priorität |
|---|---|---|
| Domain Unit Tests | Cases, Documents, Drafts, Statusregeln, Value Objects | Hoch |
| Application/Notifier Tests | Riverpod Notifier, Upload Queue, Draft Review | Hoch |
| Repository Tests | lokale DB Fakes/In-Memory, Mapper, File Store | Hoch |
| Widget Tests | wichtige Screens und Zustände | Mittel |
| Integration/Smoke Tests | MVP-Flows Desktop + Mobile Capture | Mittel |
| Golden Tests | zentrale UI-Komponenten, wenn Design stabil ist | Später |
| Backend Contract Tests | Home-Hub/Capture Gateway | Sobald API existiert |

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

Solange kein Backend existiert, werden Fake-Clients genutzt.

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

## Regression Gate

Vor Implementationsabschluss einer Phase:

- Flutter Analyze.
- relevante Unit Tests.
- relevante Widget Tests.
- Smoke Test für den betroffenen Flow.

Exakte Commands gehören in Implementation-Pläne, nicht in dieses Konzept.

## Definition of Done für F4

F4 gilt als umgesetzt, wenn:

- Teststruktur zur F1-Zielstruktur passt.
- Riverpod-Provider testbar sind.
- Storage und Queue mit Fakes testbar sind.
- MVP-kritische Flows abgedeckt werden.
- alte Flutter-Counter-Template-Tests entfernt oder ersetzt sind.
- Tests keine echten Secrets oder privaten Dokumente verwenden.

## Offene Folgefragen

- Welche Test-Helper werden zentral gebaut?
- Welche echte lokale DB-Implementierung bekommt Integrationstests?
- Wann führen wir Golden Tests ein?
- Wie testen wir Mobile Capture ohne echte Kamera im MVP?

