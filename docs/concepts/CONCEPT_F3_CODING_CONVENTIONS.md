---
title: "Konzept F3 - Coding Conventions"
description: "DocMan-spezifische Dart-/Flutter-Konventionen für Clean Architecture, Riverpod, local-first Features, Naming, Imports und Dokumentationsnähe"
tags: [concept, foundation, coding-conventions, flutter, dart, riverpod, clean-architecture]
lastUpdated: "2026-04-26"
version: "3.0"
status: "accepted"
---

# Konzept F3 - Coding Conventions

## Status

Accepted.

Dieses Konzept ersetzt den importierten F3-Inhalt aus dem alten Projekt.

## Zweck

F3 definiert Codierungsregeln für DocMan, damit Code, Tests und Konzepte dieselbe Sprache sprechen.

## Sprache und Begriffe

Im Code gelten die Domain-Begriffe:

- `Case`
- `Event`
- `Document`
- `Task`
- `Profile`
- `Draft`
- `HomeHub`
- `MobileCapture`

In deutschsprachiger UI:

- Vorgang.
- Ereignis.
- Dokument.
- Aufgabe.

`Incident` wird nur in Migrationskontexten verwendet.

## Dateinamen

- Dateien: `snake_case.dart`.
- Klassen: `PascalCase`.
- Provider: fachlich benannt, nicht nach UI-Position.
- Tests spiegeln den getesteten Pfad.

Beispiele:

```text
case_repository.dart
case_list_provider.dart
draft_inbox_screen.dart
mobile_upload_queue_state.dart
home_hub_status_provider.dart
```

## Architekturregeln

- Domain importiert kein Flutter, Riverpod, DB- oder Backend-SDK.
- Presentation importiert nicht direkt Data.
- Data übersetzt SDK-/Storage-Modelle in Domain-Typen.
- Repository-Verträge leben bei der fachlichen Domain.
- Feature-übergreifende Typen wandern nur bewusst nach `shared/domain`.

## Riverpod-Regeln

- Neue Zielarchitektur nutzt Riverpod.
- Keine neuen BLoCs.
- Keine neuen GetIt-Registrierungen.
- Provider sind testbar durch Overrides.
- Businesslogik gehört in Notifier/Application, nicht in `build()`.
- Widget-State bleibt nur für visuelle Controller und Fokus/Scroll.

## Local-first Regeln

- Netzwerk darf lokale Kernflows nicht blockieren.
- Uploads und Drafts dürfen nicht verloren gehen.
- Offline ist ein Status, kein Ausnahmezustand.
- Home-Hub-Begriffe bleiben aus Domain-Kontrakten fern, außer das Feature ist ausdrücklich `home_hub`.
- Tailscale erscheint nicht im Code als Produktlogik.

## Fehlerregeln

- Planbare Fehler werden über F5-Failures modelliert.
- UI zeigt keine rohen Exception-Texte.
- Logs enthalten keine Dokumentinhalte oder Secrets.

## UI-Regeln

- Screens beobachten Provider.
- Reusable fachliche Widgets bleiben im Feature.
- App-weite primitives/components gehören nach `core/ui`.
- Texte verwenden Produktbegriffe konsistent.
- UI darf spätere KI-Vorschläge nur als Review-/Vorschlagszustand darstellen.

## Tests

- Neue fachliche Logik braucht Tests.
- Provider werden mit Overrides getestet.
- Fakes nutzen synthetische Daten.
- Keine echten privaten Dokumente in Fixtures.

## Dokumentationsnähe

Neue Implementation-Pläne müssen auf aktuelle Konzepte/Decisions verweisen.

Wenn Code einem akzeptierten Konzept widerspricht, wird entweder der Code angepasst oder die Decision bewusst neu diskutiert.

## Definition of Done

F3 gilt als umgesetzt, wenn:

- neue Dateien DocMan-Begriffe verwenden.
- keine alten Projektnamen in Zielcode entstehen.
- Riverpod-/Clean-Architecture-Grenzen eingehalten werden.
- lokale und remote Verantwortungen sprachlich getrennt bleiben.

## Offene Folgefragen

- Welche Lints erzwingen Architekturgrenzen?
- Welche Namenskonvention bekommt der spätere Server-Stack?
- Wird Codegen für Riverpod/Freezed direkt verbindlich oder phasenweise eingeführt?

