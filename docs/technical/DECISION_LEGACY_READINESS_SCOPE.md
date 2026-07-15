---
title: "Decision - Legacy Readiness Scope"
description: "Nur der Mappm-Zielpfad ist production-ready; Legacy bleibt zeitlich begrenzte Referenz"
tags: [decision, legacy, production-readiness, clean-rebuild]
lastUpdated: "2026-07-15"
status: "accepted"
owner: "foundation-builder/quality-readiness"
---
# Decision - Legacy Readiness Scope

## Status

Angenommen. Der bestehende Spike ist keine Produktbasis und keine alternative
Architektur.

## Zielpfad

Production-Readiness gilt für die gemäß F1 aufgebaute Zielstruktur:

- `lib/app/`, `lib/core/`, `lib/domain/`, `lib/data/`, `lib/presentation/`;
- freigegebene Entry Points einschließlich `lib/main.dart` und isoliertem
  Mock-Katalog;
- `test/`, `integration_test/`, `scripts/` und `contracts/`;
- aktive Konzepte, Decisions, Roadmaps und Phase Contracts.

Dieser Pfad muss formatierbar, analysierbar, testbar, reproduzierbar und durch
die aktuellen CI-/Security-/Compliance-Gates prüfbar sein.

## Legacy-Grenze

Alte BLoC-, GetIt-, Isar-, PocketBase-, Incident- und Spike-Pfade dürfen als
visuelle oder fachliche Referenz gelesen werden. Sie dürfen nicht:

- neue Architektur oder Domainverträge bestimmen;
- neue Features, Tests oder Provider erhalten;
- die Qualitätsmessung des Zielpfads verwässern;
- als Rechtfertigung für alte Zieltechnologien dienen.

Neue Produktpfade importieren keine Legacy-Technologien. Blockiert Legacy
Build, Analyze oder Tests, wird es kontrolliert isoliert, migriert oder
entfernt. Eine kurzfristig unvermeidbare Abhängigkeit braucht ein GitHub Issue
mit Owner, Akzeptanzkriterien, Verification und Entfernungsbedingung.

## Quality Gates

Ein Gate ist nur grün, wenn der aktive Produkt-Entry-Point, die Zielanalyse,
Tests, Builds und Codegen frei von unbeabsichtigter Legacy-Kopplung sind.
Isolierte Legacy-Warnungen müssen nicht kosmetisch behoben werden, dürfen aber
nicht aus der aktiven Verifikation ausgeblendet werden, solange der Produktpfad
noch davon abhängt.

Legacy darf gelöscht werden, sobald sein relevanter fachlicher oder visueller
Nutzen in Concepts, Mocks, Fixtures oder Features übertragen und überprüft ist.
