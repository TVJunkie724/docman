---
title: "Decision - Codegen Artifact Policy"
description: "Reproduzierbare Codegenerierung ohne generierte Dart-Artefakte als Source of Truth"
tags: [decision, codegen, ci, production-readiness, generated-files]
lastUpdated: "2026-07-15"
status: "accepted"
owner: "foundation-builder"
---
# Decision - Codegen Artifact Policy

## Status

Angenommen. Generierte Dart-Artefakte sind nicht die Source of Truth und werden
grundsätzlich nicht committed, solange sie aus gepinnten Quellen vollständig
reproduzierbar sind.

## Repository-Policy

Nicht committen:

- `*.freezed.dart` und `*.g.dart`;
- Riverpod-/Drift-Generatoroutput;
- vollständig reproduzierbare OpenAPI-Clients.

Committen:

- `pubspec.yaml` und bei der App `pubspec.lock`;
- Generator- und Build-Konfiguration;
- OpenAPI-Verträge und synthetische Examples unter `contracts/`;
- handgeschriebene Migrationen;
- ausdrücklich benötigte Drift-Schema-/Migrationssnapshots als überprüfbare
  Evidenz.

Eine Ausnahme braucht Begründung, Owner, Updateweg und CI-Verifikation in einer
Decision oder im betroffenen Implementation Contract.

## Reproduzierbarkeit

```bash
scripts/codegen.sh
scripts/bootstrap.sh --verify
scripts/verify.sh
```

- `scripts/codegen.sh` ist der einzige normale Codegen-Einstieg.
- Bootstrap muss einen frischen Checkout herstellen können.
- Verify führt Codegen, Format-/Analyze-Gates und Tests für den aktiven Zielpfad
  aus.
- Generator- und Runtime-Versionen sind über Lockfile/Toolchain gepinnt.
- CI erkennt unerwartet getrackten Generatoroutput oder eine dokumentierte
  Legacy-Allowlist.

## Legacy-Migration

Bereits getrackte Generatorartefakte werden erst entfernt, wenn der Zielpfad
sie aus einem frischen Checkout reproduzieren und analysieren kann. Reihenfolge:

1. Quellen, Generatoren und Toolchain fixieren;
2. Zielpfad erfolgreich generieren, analysieren und testen;
3. Ignore-/CI-Regeln aktivieren;
4. Legacy-Artefakte selektiv aus Git entfernen;
5. nicht mehr benötigte alte Generatorpfade isolieren oder löschen.

Generatoren dürfen keine Secrets, privaten Daten oder nutzerspezifischen
absoluten Pfade in Artefakte schreiben. Codegen-Reproduzierbarkeit ist ein
C1-/CI-Gate und gilt für jeden späteren Slice fortlaufend.
