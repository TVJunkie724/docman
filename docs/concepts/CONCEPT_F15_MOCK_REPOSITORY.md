---
title: "Konzept F15 - Mock Repository Blueprint"
description: "DocMan-spezifische Mock- und Fake-Strategie für UI, Riverpod, lokale Daten, Home Hub, Mobile Capture und spätere Sync-Fälle"
tags: [concept, foundation, mocks, fakes, testing, riverpod, mobile-capture]
lastUpdated: "2026-05-01"
version: "3.1"
status: "accepted"
---

# Konzept F15 - Mock Repository Blueprint

## Status

Accepted.

Dieses Konzept ersetzt den importierten F15-Inhalt aus dem alten Projekt.

## Zweck

F15 definiert, wie DocMan ohne fertigen Server, ohne echte private Dokumente und ohne instabile Testdaten entwickelt und getestet werden kann.

Dieses Konzept ist die App-seitige Hälfte der R3-Teststrategie. Es beschreibt Fake-Repositories und Fake-Clients. API-Verträge gegen einen mockbaren Server gehören ergänzend zu F4/F16 und ersetzen diese Fakes nicht.

## Ebenen

| Ebene | Zweck |
|---|---|
| Fake Repository | schnelle UI/Provider-Tests mit deterministischen Daten |
| Fake Home Hub Client | Mobile Upload, Health, Pairing simulieren |
| In-Memory Storage | lokale Persistenz ohne echte DB-Dateien |
| Fixture Files | harmlose Test-PDFs/Bilder |
| Contract Mock Backend | API-Verträge über Microcks oder vergleichbares Tool prüfen |
| Real Integration | später gegen echten Compose/Home-Hub-Stack |

## Regeln

- Fakes implementieren dieselben Repository-Verträge wie echte Data-Implementierungen.
- Fakes dürfen keine Produktlogik ersetzen.
- Testdaten sind synthetisch und nie privat.
- Fake-Modus muss in UI/Dev klar erkennbar sein.
- Production darf nicht still auf Fake-Daten laufen.
- Fake-Repositories laufen im Prozess der Flutter-Tests und benötigen kein Netzwerk.
- Contract-Mocks laufen außerhalb der App und prüfen API-Verträge, nicht Domain-Logik.

## MVP-Fakes

Benötigt:

- Cases Fake.
- Documents Fake.
- Draft-Inbox Fake.
- Upload-Queue Fake.
- Home-Hub Fake mit reachable/unreachable/error.
- Secure-Storage Fake.
- Clock/ID Generator Fake.

## Mobile Capture Szenarien

Fakes müssen abbilden:

- Upload erfolgreich.
- Home Hub offline.
- Auth/Pairing ungültig.
- Datei fehlt.
- `caseId` ungültig, Fallback Draft-Inbox.
- Retry erzeugt kein Duplikat.

## Abgrenzung zu Microcks

Fake-Repositories sind für schnelle App-Tests gedacht:

- Domain- und Use-Case-Tests.
- Riverpod Provider/Notifier mit Overrides.
- Widget Tests mit stabilen Zuständen.
- Offline-Verhalten und lokale Queue-Logik.

Microcks oder ein vergleichbarer Contract-Mock ist für Schnittstellen gedacht:

- Home-Hub Health.
- Pairing und Token-Fehler.
- Capture Upload.
- Draft-Inbox Übergabe.
- spätere Sync- und Konfliktantworten.

Beide Ebenen verwenden synthetische Daten. Keine Ebene darf private Dokumente oder echte Secrets benötigen.

## Test-Helper Zielbild

R3 sollte zentrale Test-Helper definieren:

- Fake Clock.
- Fake ID Generator.
- Fake Secure Storage.
- Fake Case Repository.
- Fake Document Repository.
- Fake Draft Inbox Repository.
- Fake Upload Queue Repository.
- Fake Home Hub Client.
- synthetische Fixture-Dateien.

Diese Helper sollen Provider Overrides einfach machen, ohne dass Tests konkrete Data-Implementierungen kennen.

## Definition of Done

F15 gilt als umgesetzt, wenn:

- jedes MVP-Repository eine Fake-Strategie hat.
- Riverpod Tests Provider Overrides nutzen.
- UI-Mocks ohne echten Home Hub laufen.
- API-nahe Flows klar zwischen Fake-Client und Contract-Mock unterscheiden.
- Fake-Daten keine privaten Dokumente enthalten.
- Real-Integration später ergänzbar bleibt.

## Offene Folgefragen

- Wo liegen Fixture-Dateien?
- Gibt es einen globalen Dev-Fake-Modus?
- Welche Fake-Szenarien werden im UI auswählbar?
