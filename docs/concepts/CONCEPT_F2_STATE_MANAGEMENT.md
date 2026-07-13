---
title: "Konzept F2 - State Management"
description: "Mappm-Riverpod-Konzept fuer Local/Cloud Vault authority, cache, pending operations, entitlement, migration and testability"
tags: [concept, foundation, riverpod, state-management, dependency-injection, local-first]
lastUpdated: "2026-07-12"
version: "4.0"
status: "accepted-rebaseline"
---

# Konzept F2 - State Management

## Status

Accepted rebaseline. The legacy detail appendix is not implementation-authorizing.

## 2026 Vault/Cloud Rebaseline

State must model Vault authority, local availability, Cloud confirmation,
pending operations, entitlement/grace/quota and migration as separate
dimensions. Local Vault repositories are authoritative; Cloud Vault repository
state is server-authoritative with durable local cache/queue. A generic
`connected` or `syncStatus` flag is insufficient.

Dieses Konzept ersetzt den importierten F2-Inhalt aus dem alten Projekt.

## Legacy Detail Baseline (non-normative)

The remaining imported detail is retained only for migration context and useful
feature-specific examples. It must not authorize Home Hub, Tailscale, customer
self-hosting, universal local-first authority, old milestone scope or QR server
pairing. Where it differs, the rebaseline above,
`DECISION_VAULT_STORAGE_AND_CLOUD_PRODUCT_MODEL.md`,
`DECISION_COMMERCIAL_CORE_SCOPE.md` and F36 are authoritative. Before this
concept is used for implementation, its affected detail must be rewritten into
the phase's approved implementation contract.

## Zweck

F2 definiert, wie DocMan Riverpod als State Management und Dependency Injection nutzt.

DocMan ist local-first. State Management muss deshalb lokale Datenströme, Offline-Queues, Draft-Zustände, Home-Hub-Erreichbarkeit und spätere Sync-Zustände sauber abbilden.

## Verbindliche Entscheidungen

- Riverpod ist Zielarchitektur für State Management und DI.
- BLoC und GetIt sind Spike-/Legacy-Pfade und werden nicht weiter ausgebaut.
- Presentation darf nicht direkt Data oder SDKs ansprechen.
- Lokale Datenbank und Home-Hub-Zugriff laufen über Repository-Verträge.
- Core-Workflows müssen ohne Netzwerkzustand nutzbar bleiben.

## Zielmodell

```text
Widget
  -> watches Feature Provider
      -> Notifier / AsyncNotifier / StreamProvider
          -> Application Service / Repository Contract
              -> Data Implementation
                  -> Local DB / File Store / Home Hub
```

Riverpod ist dabei:

- State Container.
- Dependency Injection.
- Test-Override-System.
- Brücke von lokalen Streams zur UI.

## Provider-Kategorien

| Kategorie | Zweck | Beispiele |
|---|---|---|
| Repository Provider | Data-Implementierungen bereitstellen | caseRepositoryProvider, draftRepositoryProvider |
| Stream Provider | lokale reaktive Daten lesen | openCasesProvider, draftInboxProvider |
| Notifier | UI-/Feature-State und Aktionen steuern | caseEditorProvider, uploadQueueProvider |
| AsyncNotifier | Laden/Speichern mit async Status | homeHubStatusProvider |
| Derived Provider | abgeleitete Sichten | filteredCasesProvider, activeProfileCasesProvider |
| App Provider | App-weite Konfiguration | appConfigProvider, activeProfileProvider |

## Feature-State-Regeln

Jedes Feature besitzt eigene Provider unter:

```text
features/<feature>/presentation/providers/
```

Provider dürfen:

- Domain-Repository-Verträge lesen.
- Application-Services orchestrieren.
- Loading/Data/Error/Empty-Zustände modellieren.
- User-Aktionen als Methoden anbieten.

Provider dürfen nicht:

- lokale DB-SDKs direkt importieren.
- HTTP-/Backend-SDKs direkt importieren.
- fachliche Regeln in Widgets auslagern.
- andere Features willkürlich intern importieren.

## Local-first State

Lokale Daten sind primär.

Beispiele:

- Case-Liste beobachtet lokale Datenbank.
- Draft-Inbox beobachtet lokale Drafts und mobile Uploads.
- Suche filtert lokale Daten.
- Home-Hub-Status ergänzt UI, blockiert aber lokale Kernflows nicht.

Remote-Zustand darf lokale Nutzbarkeit nicht überschreiben. Wenn Home Hub offline ist, bleibt die App bedienbar und zeigt Queue-/Sync-Zustände.

## M2 Provider-Bereiche

| Bereich | Provider-Verantwortung |
|---|---|
| Cases | offene Vorgänge, Detailansicht, Editor-State, Statusänderung |
| Documents | Dokument-Metadaten, Datei-Referenzen, Zuordnung |
| Draft Inbox | ungeprüfte Dokumente, Review-State, Zuordnung zu Vorgängen |
| Mobile Capture | lokale Capture-Queue, Upload-Status, Retry |
| Profiles | betroffene Person / Haushaltsprofil, einfache Profilliste |
| Home Hub | Health, Verbindung, Upload-Fähigkeit |
| Search | lokale Filter und Suchabfragen |
| Settings | Home-Hub-URL, nicht geheime Präferenzen |

## Async- und Error-State

Provider müssen explizit zwischen diesen Zuständen unterscheiden:

- loading
- data
- empty
- offline
- queued
- uploading
- failed retryable
- failed needs user action
- conflict / needs review

F5 definiert das konkrete Failure-Modell. F2 legt nur fest, dass diese Zustände nicht als freie Strings oder verstreute Booleans wachsen dürfen.

## Upload Queue State

Mobile Upload Queue ist ein eigener State-Bereich.

Er muss zeigen können:

- wie viele Uploads warten.
- welcher Upload gerade läuft.
- ob der Home Hub erreichbar ist.
- welcher Upload fehlgeschlagen ist.
- ob ein Upload direkt einem Vorgang zugeordnet wurde.
- ob ein Upload in die Draft-Inbox zurückgefallen ist.

Queue-Operationen müssen idempotent gedacht werden. Retry darf keine Duplikate erzeugen.

## Smart/Dumb Widgets

Screens sind Smart Widgets und lesen Provider.

Kind-Widgets sind Dumb Widgets und bekommen Daten/Funktionen per Konstruktor.

Erlaubter lokaler Widget-State:

- TextController.
- FocusNode.
- ScrollController.
- AnimationController.
- visuelle Auswahlzustände ohne fachliche Bedeutung.

Nicht in Widgets:

- Datenbankzugriff.
- Upload-Logik.
- Status-Transitions.
- Parsing oder Mapping.

## Provider Overrides und Tests

Jeder externe Zugriff muss überschreibbar sein:

- lokale Repositories.
- Home-Hub-Client.
- Secure-Storage-Repository.
- Clock/Time Provider.
- ID Generator.

Tests verwenden Provider Overrides und echte Notifier-Logik. Riverpod selbst wird nicht gemockt.

## Migration vom Spike

Die Migration erfolgt geplant:

1. `ProviderScope` als App-Root vorbereiten.
2. Repository Provider für neue Zielstruktur definieren.
3. Auth-/Home-Hub-/Local-Storage-Zugriffe über Provider kapseln.
4. BLoC-Screens nur ersetzen, wenn ein Feature in Zielstruktur migriert wird.
5. GetIt erst entfernen, wenn kein Zielpfad mehr davon abhängt.

## Definition of Done für F2

F2 gilt als umgesetzt, wenn:

- neue Feature-States in Riverpod modelliert werden.
- keine neuen BLoCs oder GetIt-Registrierungen entstehen.
- lokale Streams über Provider in UI fließen.
- Draft-Inbox und Upload-Queue eigene Provider-Grenzen haben.
- Home-Hub-Status sichtbar, aber nicht blockierend ist.
- Tests Provider Overrides verwenden können.

## Offene Folgefragen

- Nutzen wir Riverpod Codegen direkt oder starten wir manuell und migrieren später?
- Welche Provider werden `keepAlive`?
- Wie genau wird Person-/Profilkontext appweit gehalten, ohne stille Default-Zuordnung zu erzwingen?
- Welche gemeinsamen Test-Helpers brauchen ProviderScope und Overrides?

## Enterprise Quality Contract

This concept adopts `docs/execution/CONCEPT_ENTERPRISE_QUALITY_CONTRACT.md`.
Its own scope and status remain authoritative; the shared contract supplies the
mandatory ownership, security/privacy, accessibility/localization, verification,
stop-rule and handoff defaults wherever this file does not define a stricter
rule. Any conflict must stop the affected phase and be resolved in this concept.
