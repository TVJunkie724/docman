---
title: "Konzept F15 - Mock Repository Blueprint"
description: "DocMan-spezifische Mock- und Fake-Strategie für UI, Riverpod, lokale Daten, Home Hub, Mobile Capture und spätere Sync-Fälle"
tags: [concept, foundation, mocks, fakes, testing, riverpod, mobile-capture]
lastUpdated: "2026-05-05"
version: "3.2"
status: "accepted"
---

# Konzept F15 - Mock Repository Blueprint

## Status

Accepted.

Dieses Konzept ersetzt den importierten F15-Inhalt aus dem alten Projekt.

## Zweck

F15 definiert, wie DocMan ohne fertigen Server, ohne echte private Dokumente und ohne instabile Testdaten entwickelt, getestet und visuell validiert werden kann.

Dieses Konzept ist die App-seitige Hälfte der R3-Teststrategie und der praktische Rahmen fuer UI-Konzeptmocks. Es beschreibt Fake-Repositories, Fake-Clients und isolierte Mock-UI. API-Verträge gegen einen mockbaren Server gehören ergänzend zu F4/F16 und ersetzen diese Fakes nicht.

## Ebenen

| Ebene | Zweck |
|---|---|
| Fake Repository | schnelle UI/Provider-Tests mit deterministischen Daten |
| UI-Konzeptmock | isolierte Screen-/Flow-Validierung mit synthetischen Daten |
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
- UI-Konzeptmocks sind kein Produktpfad und duerfen keine echte Datenbank, kein Dateisystem, keinen Home Hub und keine externen APIs ansprechen.
- Die Legacy-App bleibt nur Design- und Fachreferenz. Neue Mocks duerfen keine BLoC-, GetIt-, Isar- oder PocketBase-Flaeche erweitern.

## UI-Konzeptmocks

UI-Konzeptmocks dienen dazu, Form, Interaktion und fachliche Begriffe schnell zu pruefen, bevor ein Feature verbindlich geplant wird.

Geeignete Mock-Kandidaten:

- Vorgangsliste und Vorgangsdetail.
- Dokumentdetail mit Status, Datei, Ereignissen und Review-Hinweisen.
- Draft-Inbox fuer mobile Uploads.
- Mobile Capture Flow mit Upload-Queue.
- QR-Pairing Flow.
- OCR-/AI-Vorschlag fuer Formularfelder als spaeterer Nicht-MVP-Spike.

Mock-UI soll nah genug an der spaeteren Architektur liegen, damit die Erkenntnisse wiederverwendbar sind, aber nicht so tun, als waere sie bereits produktiv. Wenn ein Mock weitergebaut wird, braucht er einen Feature-Plan mit Domain-Vertrag, Riverpod-Provider, Teststrategie und klarer Definition of Done.

Mock-UI wird ueber einen eigenen Entry Point gestartet:

```bash
flutter run -d macos -t lib/main_mock_catalog.dart
```

Ein Script wie `scripts/run_mocks.sh` darf diesen Befehl kapseln. Die normale Produktnavigation darf Mock-Screens nicht kennen.

Der erste Mock-Flow ist Mobile Capture zu Draft-Inbox zu optionaler Vorgangszuordnung. Er soll als interaktiver Flutter-only Mock starten, also ohne Repositories, Drift, Home Hub, Microcks oder echte Dateien.

Mock-Daten muessen realistisch genug fuer Produktentscheidungen, aber vollstaendig synthetisch sein. Erlaubt sind frei erfundene Haushalts-, Vorgangs-, Upload- und Dokumentbeispiele. Nicht erlaubt sind echte Namen, echte Adressen, echte Dokumentinhalte, Screenshots privater Dokumente oder echte Secrets.

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
- UI-Mocks getrennt vom Produktpfad liegen und keine Legacy-Architektur erweitern.
- der Mock-Katalog ueber einen eigenen Entry Point startbar ist.
- der erste Mobile-Capture/Draft-Inbox-Mock als interaktiver Stufe-2-Mock pruefbar ist.
- API-nahe Flows klar zwischen Fake-Client und Contract-Mock unterscheiden.
- Fake-Daten keine privaten Dokumente enthalten.
- Real-Integration später ergänzbar bleibt.

## Offene Folgefragen

- Wo liegen Fixture-Dateien?
- Gibt es einen globalen Dev-Fake-Modus?
- Welche Fake-Szenarien werden im UI auswählbar?
