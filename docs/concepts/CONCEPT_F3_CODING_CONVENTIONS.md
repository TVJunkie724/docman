---
title: "Konzept F3 - Coding Conventions"
description: "Mappm-Konventionen für Dart/Flutter, Clean Architecture, Riverpod, Vaults, Contracts und Tests"
tags: [concept, foundation, coding-conventions, flutter, dart, riverpod, clean-architecture]
lastUpdated: "2026-07-15"
version: "5.0"
status: "accepted"
owner: "foundation-builder"
---
# Konzept F3 - Coding Conventions

## Zweck

F3 sorgt dafür, dass Code, Tests, Contracts und Konzepte dieselbe Sprache und
dieselben Architekturgrenzen verwenden. F1 besitzt die Ordnerstruktur; F2 die
State-/Providerregeln; F3 definiert Namens- und Codekonventionen.

## Sprache und Naming

- Dateien `snake_case.dart`, Typen `PascalCase`, Members `lowerCamelCase`.
- Provider werden fachlich nach bereitgestelltem Zustand oder Port benannt,
  nicht nach Bildschirmposition.
- Tests spiegeln den Zielpfad und enden entsprechend ihrer Ebene.
- Neue Domainbegriffe folgen `DECISION_PRODUCT_LANGUAGE.md`, insbesondere
  `Case`, `CaseLink`, `Document`, `Record`, `Task`, `ManagedSubject`,
  `ExternalParty`, `Vault` und `Entitlement`.
- `Incident`, `Draft`, `Subcase`, `HomeHub`, Tailscale und Customer-
  Self-hosting erscheinen nur in klar markiertem Legacy-/Migrationskontext.
- Sichtbare deutsche UI verwendet „Vorgang“, „Unterlage“, „Dokument“,
  „Aufgabe“, „Person/Organisation“ und „Eingang/Review“.

Beispiele:

```text
case_repository.dart
case_graph_provider.dart
capture_review_screen.dart
capture_queue_state.dart
cloud_vault_status_provider.dart
```

## Architektur

- `domain` importiert weder Flutter/Riverpod noch Data-, DB-, HTTP- oder
  Plattform-SDKs.
- `data` implementiert Domain-Ports und übersetzt Adapter-/Contractmodelle.
- `presentation` beobachtet Riverpod-State und importiert Data nicht direkt.
- `app` verdrahtet Routing, Theme, Bootstrap und top-level Provider.
- `core` enthält nur wirklich app-weite technische oder UI-Grundlagen.
- Featureübergreifende Fachtypen gehören bewusst in `domain`, nicht in einen
  informellen `shared/domain`-Ablageort.
- Generierte Clients, Drift- und Plattformtypen bleiben hinter Mappm-eigenen
  Ports und Mappern.

## Riverpod und State

- Riverpod ist das einzige Zielsystem für DI und App-/Feature-State.
- Neue Pfade führen weder BLoC noch GetIt fort.
- Fachlogik liegt in Domain/Application-/Notifier-Code, nicht in Widget
  `build()`.
- Rein visueller, kurzlebiger State wie Fokus, Scroll und Animation darf lokal
  im Widget bleiben.
- Provider sind durch Overrides testbar; Produktprovider werden nicht durch
  globale Service-Locator umgangen.
- Authority, Connectivity, Local Availability, Pending Work, Processing,
  Entitlement und Migration sind getrennte Zustandsdimensionen.

## Vault-, Assist- und Contractregeln

- Local Vault und Cloud Vault verwenden dieselben Domainverträge mit
  unterschiedlicher Authority-/Cache-Semantik.
- Offline blockiert Local Authority nicht; Cloud UI behauptet offline keine
  unbelegte Vollständigkeit.
- Capture-Originale, Pending Operations und bestätigte Zustände gehen bei
  Neustart nicht verloren.
- Core Assist erzeugt sensitive, nachvollziehbare Vorschläge mit Provenienz;
  aktuelle Routingentscheidungen benötigen die definierte Bestätigung.
- Frontend beschreibt Backend-Bedarf, besitzt aber nicht DTOs, Endpunkte,
  Mapping, Persistence oder Policy-Architektur.
- OpenAPI/Microcks und generierte Clients bleiben vom Domainmodell getrennt.

## Fehler, Privacy und Accessibility

- Erwartbare Fehler verwenden F5 `Failure`/`Result`; rohe Exceptions erreichen
  keine UI.
- Logs, Telemetrie, Benachrichtigungen und Supportpakete enthalten keine
  Dokumentinhalte, privaten Titel, Tokens oder hochsensiblen Identifikatoren.
- Neue sichtbare Strings sind lokalisierbar; Semantics, Fokus, Textskalierung,
  Kontrast und Reduced Motion gehören zum Feature, nicht zur Nacharbeit.
- Kommentare erklären nur nicht offensichtliche Entscheidungen oder
  Sicherheitsgrenzen.

## Tests und Review

- Neue Fachlogik erhält Unit-/Provider-Tests, UI-Verhalten Widget-/Semantics-
  Tests und kritische Flows Integration-/Contract-Tests gemäß F4.
- Fakes und Fixtures sind deterministisch und vollständig synthetisch.
- Kein Test, Mock, Screenshot oder OpenAPI-Beispiel verwendet private Echtdaten.
- Analyzer-, Formatter-, Import-, Codegen- und Testgates laufen über die
  projektlokalen Scripts.

## Stop Rules

Stop, wenn neue Pfade Legacy-Technologien importieren, Data-Typen in Domain/UI
leaken, Vault-Semantik in Widgets dupliziert wird, Backendverträge im Frontend
erfunden werden, private Daten in Evidenz landen oder ein Feature ohne seine
verbindlichen Tests und Konzepte als fertig gilt.

## Definition of Done

F3 ist erfüllt, wenn der Zielpfad die Begriffe und Layer aus F1/F2 nutzt,
Riverpod-/Repository-Grenzen eingehalten sind, Local/Cloud/Assist sprachlich
getrennt bleiben und CI die Regeln prüfbar macht.

F3 übernimmt den verbindlichen Enterprise Quality Contract aus
`docs/execution/CONCEPT_ENTERPRISE_QUALITY_CONTRACT.md`.
