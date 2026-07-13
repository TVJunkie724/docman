---
title: "Konzept F3 - Coding Conventions"
description: "Mappm-Dart-/Flutter-Konventionen fuer Clean Architecture, Riverpod, Vault providers, Cloud clients, naming and imports"
tags: [concept, foundation, coding-conventions, flutter, dart, riverpod, clean-architecture]
lastUpdated: "2026-07-12"
version: "4.0"
status: "accepted"
---

# Konzept F3 - Coding Conventions

## Status

Accepted.

## 2026 Vault/Cloud Rebaseline

Use provider-neutral product terms such as `Vault`, `StorageMode`,
`LocalVault`, `CloudVault`, `CloudClient`, `LocalAvailability`, `Entitlement`
and `VaultMigration`. Do not introduce `HomeHub` into new product code.
`LocalDevelopmentCloud` is tooling/configuration vocabulary only.

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
- `CloudVault`
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

## Vault-Authority-Regeln

- Netzwerk darf lokale Kernflows nicht blockieren.
- Uploads und Drafts dürfen nicht verloren gehen.
- Offline ist ein Status, kein Ausnahmezustand.
- `HomeHub`, Tailscale und customer-self-hosting erscheinen nicht in neuem Produktcode.
- Local-/Cloud-Unterschiede werden über `Vault`, `StorageMode`, Provider,
  Authority, Cache/Pending und Migration modelliert, nicht über Server-URLs.

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


## Enterprise Quality Contract

This concept adopts `docs/execution/CONCEPT_ENTERPRISE_QUALITY_CONTRACT.md`.
Its own scope and status remain authoritative; the shared contract supplies the
mandatory ownership, security/privacy, accessibility/localization, verification,
stop-rule and handoff defaults wherever this file does not define a stricter
rule. Any conflict must stop the affected phase and be resolved in this concept.
