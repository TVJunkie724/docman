---
title: "Decision - Codegen Artifact Policy"
description: "Entscheidung, dass DocMan generierte Dart-Artefakte nicht committed und Codegen stattdessen reproduzierbar erzwingt"
tags: [decision, codegen, r3, ci, production-readiness, generated-files]
lastUpdated: "2026-05-06"
status: "accepted"
---

# Decision - Codegen Artifact Policy

## Status

Accepted.

## Entscheidung

DocMan committed keine generierten Dart-Artefakte als Source of Truth.

Das Repository enthält Quellen, Verträge, Konfiguration und Migrationsnachweise. Generator-Output wird in frischen Checkouts, lokaler Entwicklung und CI reproduzierbar erzeugt.

Nicht committen:

- `*.freezed.dart`
- `*.g.dart`
- Riverpod-generator Output
- Drift-generierter Dart-Code
- OpenAPI-generierte Clients, solange sie vollständig reproduzierbar sind

Committen:

- `pubspec.yaml`
- `pubspec.lock`, weil DocMan eine App ist
- `build.yaml` und Generator-Konfiguration
- OpenAPI-Spezifikationen und synthetische Examples unter `contracts/`
- Drift-Schema- oder Migration-Snapshots, falls sie als Migrationsnachweis oder Testfixture dienen
- handgeschriebene Migrationsdateien

## Begründung

Diese Policy reduziert Review-Rauschen und verhindert, dass generierter Code als Architekturquelle missverstanden wird. Sie ist aber nur production-ready, wenn Reproduzierbarkeit hart erzwungen wird.

Deshalb gilt: Nicht committen ist kein Komfortmodus. Nicht committen ist nur erlaubt, wenn Bootstrap, Codegen und Verify zuverlässig funktionieren.

## Enterprise-Grade Anforderungen

### 1. Eine Codegen-Quelle

Alle Generatoren laufen über:

```bash
scripts/codegen.sh
```

Niemand ruft im normalen Workflow manuell unterschiedliche `build_runner`-Varianten auf.

### 2. Bootstrap baut einen frischen Checkout

Ein frischer Checkout muss genügen:

```bash
scripts/bootstrap.sh --verify
```

Das Script holt Dependencies, führt Codegen aus und startet die lokalen Mindestchecks.

### 3. Verify erzwingt Reproduzierbarkeit

`scripts/verify.sh` muss mindestens prüfen:

```bash
scripts/codegen.sh
flutter analyze <target paths>
flutter test
```

Wenn Codegen fehlschlägt, ist der Build rot. Wenn generierte Imports fehlen, ist Analyze rot.

### 4. Git bleibt frei von Generator-Output

`.gitignore` muss generierte Dart-Dateien ausschließen. Bereits getrackte Legacy-Generator-Dateien werden in einer R3-Cleanup-Änderung aus Git entfernt, sobald der Zielpfad ohne sie reproduzierbar ist.

Nach dem R3-Cleanup prueft CI zusätzlich:

```bash
git ls-files | rg '(\\.freezed\\.dart|\\.g\\.dart)$'
```

Bis dahin gibt es entweder noch keinen harten CI-Blocker oder eine explizite Legacy-Allowlist. Für dauerhafte Ausnahmen braucht es eine explizite Begründung in dieser Decision oder einer Folge-Decision.

### 5. Generator-Versionen sind gepinnt

Generatoren und Runtime-Pakete werden über `pubspec.lock` stabilisiert. Upgrades erfolgen bewusst und werden mit Codegen, Analyze und Tests geprüft.

### 6. Keine privaten Daten im Output

Generatoren dürfen keine lokalen Pfade, Secrets, Nutzerdateien oder private Testdaten in erzeugte Dateien schreiben. Falls ein Generator solche Daten erzeugen könnte, wird er nicht in den Standard-Codegen aufgenommen.

## Umgang mit Legacy

Der aktuelle Spike enthält bereits getrackte `*.freezed.dart`- und `*.g.dart`-Dateien. Diese Dateien gelten als Legacy-Artefakte.

R3 entfernt sie nicht blind. Die sichere Reihenfolge ist:

1. Zielpfad-Codegen definieren.
2. `.gitignore` und CI-Regel ergänzen.
3. Zielpfad-Analyze und Tests gegen frisch erzeugte Artefakte grün bekommen.
4. Legacy-Generator-Dateien aus Git entfernen, sobald keine Zielpfade mehr davon abhängen.
5. alte Isar/BLoC/Incident-Artefakte zusammen mit dem Legacy-Pfad löschen oder isolieren.

## Konsequenzen

- R3-D4 ist entschieden.
- Codegen-Reproduzierbarkeit wird ein R3- und MVP-Gate.
- Reviews konzentrieren sich auf Quellen, Verträge, Tests und Scripts.
- Generator-Output darf lokal existieren, aber nicht als geplante Git-Änderung landen.

## Nicht entschieden

- ob einzelne Drift-Migrations-Snapshots dauerhaft committed werden.
- wann OpenAPI-generierte Clients entstehen.
- ob Riverpod-Codegen im MVP genutzt wird oder erst nach dem manuellen Riverpod-Start.
