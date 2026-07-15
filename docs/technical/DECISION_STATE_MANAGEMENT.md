---
title: "Decision - State Management and Dependency Injection"
description: "Riverpod als einziges Zielsystem für State Management und Dependency Injection"
tags: [decision, architecture, riverpod, state-management, dependency-injection]
lastUpdated: "2026-07-15"
status: "accepted"
owner: "foundation-builder/ui-architect"
---
# Decision - State Management and Dependency Injection

## Status

Angenommen. Mappm verwendet Riverpod als gemeinsames Zielsystem für
Dependency Injection und reaktiven App-/Feature-State. Bestehende BLoC-/GetIt-
Pfade sind Legacy und werden kontrolliert isoliert oder migriert.

## Zustandsmodell

Folgende Dimensionen werden nicht zu einem einzigen `syncState` vermischt:

- aktiver Vault und dessen Authority;
- lokale Verfügbarkeit und belegbare Cache-Reichweite;
- Connectivity;
- Pending Upload/Sync/Migration;
- Processing und Review;
- Account, Session und Device Trust;
- Entitlement, Quota, Grace und Read-only;
- Fehler, Retry und Nutzeraktion.

## Regeln

- Kein neuer Mischbetrieb mit BLoC oder GetIt.
- Domain-Repository- und Service-Ports werden durch Riverpod-Provider
  bereitgestellt.
- Notifier/AsyncNotifier/Stream-basierte Provider kapseln langlebigen
  fachlichen State; genaue API und Codegen-Konvention folgen der im
  Implementation Contract gepinnten Riverpod-Version.
- Widgets beobachten State und senden Intents, enthalten aber keine
  Repository-, Mapping- oder Persistenzlogik.
- Fokus, Scroll, Animation und andere rein visuelle Controller bleiben lokaler
  Flutter-State.
- Provider Overrides liefern Fakes, Contract-Mocks und Testkonfigurationen.
- Presentation importiert keine Drift-, HTTP-, OpenAPI- oder Plattformtypen.

## Migration

Die Foundation plant `ProviderScope`, Bootstrap-Provider, Ablösung globaler
Service-Locator, Vault-/Account-/Capture-Provider, Testcontainer und selektive
Legacy-Entfernung. Abhängigkeiten werden erst entfernt, wenn kein aktiver
Produkt- oder Buildpfad mehr davon abhängt.

## Verifikation

Provider-Tests decken Local/Cloud Authority, Offline-Cache, Pending Work,
Session/Entitlement, Restart, Fehler/Retry und Override-Isolation ab. Widget-
Tests prüfen Loading/Empty/Error/Partial/Ready und Accessibility-Zustände.

Die konkrete Riverpod-Version, Codegen-Nutzung und Migrationsreihenfolge werden
vor C1-Implementierung anhand der aktuellen offiziellen Pakete und des
freigegebenen Foundation-Plans entschieden.
