---
title: "Konzept F15 - Mock Repository Blueprint"
description: "DocMan-spezifische Mock- und Fake-Strategie für UI, Riverpod, lokale Daten, Home Hub, Mobile Capture und spätere Sync-Fälle"
tags: [concept, foundation, mocks, fakes, testing, riverpod, mobile-capture]
lastUpdated: "2026-04-26"
version: "3.0"
status: "accepted"
---

# Konzept F15 - Mock Repository Blueprint

## Status

Accepted.

Dieses Konzept ersetzt den importierten F15-Inhalt aus dem alten Projekt.

## Zweck

F15 definiert, wie DocMan ohne fertigen Server, ohne echte private Dokumente und ohne instabile Testdaten entwickelt und getestet werden kann.

## Ebenen

| Ebene | Zweck |
|---|---|
| Fake Repository | schnelle UI/Provider-Tests mit deterministischen Daten |
| Fake Home Hub Client | Mobile Upload, Health, Pairing simulieren |
| In-Memory Storage | lokale Persistenz ohne echte DB-Dateien |
| Fixture Files | harmlose Test-PDFs/Bilder |
| Real Integration | später gegen echten Compose/Home-Hub-Stack |

## Regeln

- Fakes implementieren dieselben Repository-Verträge wie echte Data-Implementierungen.
- Fakes dürfen keine Produktlogik ersetzen.
- Testdaten sind synthetisch und nie privat.
- Fake-Modus muss in UI/Dev klar erkennbar sein.
- Production darf nicht still auf Fake-Daten laufen.

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

## Definition of Done

F15 gilt als umgesetzt, wenn:

- jedes MVP-Repository eine Fake-Strategie hat.
- Riverpod Tests Provider Overrides nutzen.
- UI-Mocks ohne echten Home Hub laufen.
- Fake-Daten keine privaten Dokumente enthalten.
- Real-Integration später ergänzbar bleibt.

## Offene Folgefragen

- Wo liegen Fixture-Dateien?
- Gibt es einen globalen Dev-Fake-Modus?
- Welche Fake-Szenarien werden im UI auswählbar?

