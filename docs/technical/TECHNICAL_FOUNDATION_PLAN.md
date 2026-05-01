---
title: "DocMan - Technical Foundation Plan"
description: "Technischer Foundation-Plan für die Überführung des aktuellen Flutter-Spikes in eine saubere DocMan-Basis"
tags: [technical, foundation, plan, flutter, riverpod, local-first, migration]
lastUpdated: "2026-04-27"
status: "draft"
---

# DocMan - Technical Foundation Plan

## Status

Draft.

Dieser Plan ist der Übergang von Konzeptarbeit zu Implementation-Planung. Er ist noch kein Low-Level-Implementation-Plan und schreibt keine konkreten Klassen- oder Provider-Signaturen vor.

## Ziel

Der aktuelle Spike wird in eine saubere, local-first, Riverpod-basierte DocMan-Basis überführt.

Die Foundation muss den MVP ermöglichen:

- Desktop-Verwaltung.
- Mobile Capture.
- Draft-Inbox.
- lokale Persistenz.
- minimale Home-Hub-Anbindung für Uploads.
- spätere Sync-/OCR-/LLM-Erweiterung ohne Bruch.

## Verbindliche Grundlagen

- F1 Project Structure.
- F2 State Management.
- F3 Coding Conventions.
- F4 Testing Strategy.
- F5 Error Handling.
- F6 Environment Configuration.
- F10 Local Storage.
- F11 API Integration.
- F12 Secure Storage.
- F15 Mock Repository Blueprint.
- F17 Mobile Capture Plan.
- DECISION_SECURITY_PRIVACY_MODEL.
- Decisions unter `docs/technical/`.

## Arbeitsfolge R2

### R2.1 Code- und Dokumentationshygiene

Ziel: Kein Agent arbeitet mehr gegen Legacy-Dokumente.

Deliverables:

- Alte Roadmaps/Refactoring-Pläne entfernt.
- `ROADMAP_REBUILD.md` ist primäre Roadmap.
- F1-F17 sind die aktiven Foundation-Konzepte.
- README wird später auf neue Richtung gebracht.

Akzeptanz:

- Kein aktives Dokument empfiehlt PocketBase als Zielarchitektur.
- Kein aktives Dokument empfiehlt BLoC/GetIt als Zielarchitektur.
- Alte `Incident`-Begriffe sind nur noch Migrationskontext.

### R2.2 Zielstruktur-Migration planen

Ziel: Von Layer-First-Spike zu F1-Zielstruktur, ohne Big-Bang.

Deliverables:

- Migrationsplan für `lib/app`, `lib/core`, `lib/features`.
- Liste der Spike-Pfade: behalten, isolieren, ersetzen, löschen.
- Entscheidung, ob neue Feature-Ordner parallel aufgebaut werden.

Akzeptanz:

- neue Arbeit hat klare Zielpfade.
- bestehende User-/Spike-Änderungen werden nicht unkontrolliert gelöscht.

### R2.3 Riverpod-Bootstrap

Ziel: Riverpod als App-State- und DI-Basis etablieren.

Deliverables:

- App-Root mit ProviderScope geplant.
- Repository Provider-Grenzen geplant.
- BLoC/GetIt-Migration nach Feature-Slices geplant.

Akzeptanz:

- keine neuen BLoCs.
- keine neuen GetIt-Registrierungen.
- Tests können Provider Overrides verwenden.

### R2.4 Local Storage Entscheidung

Ziel: Lokale DB und Dateiablage verbindlich entscheiden.

Deliverables:

- `DECISION_LOCAL_DATABASE.md` akzeptiert.
- lokale Dateiablage-Strategie.
- Sync-fähige IDs und Metadaten-Grundform.
- Draft-Inbox- und Upload-Queue-Persistenzkonzept.

Akzeptanz:

- lokale Daten sind source of truth.
- Drafts und Upload Queue sind persistierbar.
- Secrets bleiben außerhalb normaler DB.

### R2.5 Failure-/Result-Modell

Ziel: F5 in ein technisches Modell überführen.

Deliverables:

- Failure-Kategorien als technische Zielstruktur.
- Mapping für Local Storage, Secure Storage, Home Hub, Upload.
- UI-Zustandsmodell für retry/review/fatal.

Akzeptanz:

- keine rohen SDK-Exceptions in Presentation.
- Offline/Home-Hub-unreachable ist Status, nicht Absturz.

### R2.6 Config, Secure Storage und Pairing-Vorbereitung

Ziel: MVP-Setup ohne Cloud-OAuth vorbereiten und die Security-/Privacy-Baseline einhalten.

Deliverables:

- F6 Config-Strategie.
- F12 Secure-Storage-Package/Abstraktion.
- `DECISION_AUTH_PAIRING.md` als akzeptierte Vorgabe anwenden.
- `DECISION_SECURITY_PRIVACY_MODEL.md` als akzeptierte Vorgabe anwenden.

Akzeptanz:

- Home-Hub-URL ist konfigurierbar.
- Pairing Secrets landen nur in Secure Storage.
- Logs enthalten keine Dokumentinhalte, Tokens, OCR-Texte oder sensiblen Metadaten.
- Dateiablage und Sync-Grenzen verhindern keine spaetere E2EE-/Zero-Knowledge-faehige Architektur.
- Local-only Modus bleibt möglich.

### R2.7 Mock-/Fake-Basis

Ziel: UI- und Provider-Arbeit ohne echten Home Hub ermöglichen.

Deliverables:

- Fake-Repositories für Cases, Documents, Draft Inbox.
- Fake HomeHubClient.
- Fake SecureStorageRepository.
- synthetische Testdaten.

Akzeptanz:

- MVP-Screens können gegen Fakes geplant/getestet werden.
- Fake-Modus ist klar von Produktmodus getrennt.

### R2.8 Testbasis

Ziel: Tests bilden DocMan statt Flutter-Template ab.

Deliverables:

- Template-Counter-Test entfernen/ersetzen.
- Smoke-Test für App-Start.
- erste Domain-/Provider-Tests.
- Test-Helper für Provider Overrides.

Akzeptanz:

- Tests referenzieren echte App-Struktur.
- Testdaten enthalten keine privaten Dokumente.

## Nicht in R2

- vollständige Mobile-Capture-Implementation.
- vollständiger Home Hub.
- vollständiger Multi-Geräte-Sync.
- OCR/LLM.
- App-Store-Distribution.
- vollständiges Rollenmodell.

## Offene Entscheidungen vor Implementation

- konkrete Config-Strategie.
- Secure-Storage-Package.
- Mock-UI Umgang.
- Migrationsmodus: parallel oder in-place.

## Handoff zu Implementation

Vor Codearbeit braucht R2 einen separaten Implementation-Plan mit:

- konkreten Dateipfaden.
- Reihenfolge der Edits.
- Testkommandos.
- Rollback-/Kompatibilitätsregeln.
- Definition of Done pro Slice.
