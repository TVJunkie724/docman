---
title: "Konzept F16 - CI/CD Pipeline and Quality Gates"
description: "DocMan-spezifische Quality Gates für Flutter App, Dokumentation, spätere Home-Hub/Compose-Checks und sichere Releases"
tags: [concept, ci, cd, quality-gates, flutter, docs, compose]
lastUpdated: "2026-05-01"
version: "3.1"
status: "accepted"
---

# Konzept F16 - CI/CD Pipeline and Quality Gates

## Status

Accepted.

Dieses Konzept ersetzt den importierten F16-Inhalt aus dem alten Projekt.

## Zweck

F16 definiert, welche Qualitätsprüfungen DocMan lokal und in GitHub braucht.

## Grundsatz

Quality Gates schützen Produktversprechen, nicht nur Stil.

## Frühe Gates

- Format/Analyze für Flutter.
- relevante Unit-/Widget-Tests.
- keine Template-Tests als Scheinsicherheit.
- Dokumentationslinks und Markdown-Grundprüfung.
- keine bekannten alten Projektnamen in aktiver Doku.
- reproduzierbares Bootstrap-/Codegen-/Verify-Scriptset für lokale Entwicklung.

## Spätere Gates

- Home-Hub Backend Tests.
- Docker/Compose Validate.
- API Contract Tests.
- Microcks oder vergleichbarer Contract-Mock für Home-Hub/Capture/Sync.
- Mobile Capture Smoke.
- Storage Migration Tests.
- Release Signing Checks.

## Lokale Script-Gates

DocMan soll drei lokale Standardscripts haben:

| Script | Zweck |
|---|---|
| `scripts/bootstrap.sh` | frischen Checkout vorbereiten, Dependencies holen und Codegen ausführen; strenge Checks optional mit `--verify` |
| `scripts/codegen.sh` | Freezed/JSON/Drift/spätere Riverpod-Generatoren reproduzierbar ausführen |
| `scripts/verify.sh` | lokales Quality Gate vor Commit/PR |

Die Scripts sind absichtlich klein und transparent. Sie sollen lokal und später in CI wiederverwendbar sein.

## Generierte Dateien

Generierte Dateien werden committed, solange sie Teil des regulären Flutter-/Dart-Workflows sind:

- `.freezed.dart`
- `.g.dart`
- Drift-generierte Dateien
- spätere Riverpod-generierte Provider

Das Setup-Script muss diese Dateien trotzdem reproduzierbar regenerieren können. Dadurch bleiben Reviews vollständig und neue Arbeitsumgebungen starten ohne manuelle Generator-Schritte.

## Contract-Mock Gate

Sobald Home-Hub-, Capture- oder Sync-APIs entstehen, bekommt die CI ein Contract-Gate:

- API-Spezifikation validieren.
- Microcks/Contract-Mock starten.
- Client-Contract-Smoke gegen Mock ausführen.
- echte Backend-Implementierung später gegen denselben Vertrag prüfen.

Dieses Gate ist getrennt von Flutter-Fake-Repository-Tests. Fake-Repos prüfen App-Verhalten; Contract-Mocks prüfen Schnittstellen.

## Dokumentations-Gate

Solange Konzepte neu geschrieben werden:

- neue Planung verweist auf aktuelle Decisions.
- alte Roadmaps sind als Legacy markiert oder ersetzt.
- Concepts mit `accepted` dürfen keine fremden Projektnamen enthalten.

## Definition of Done

F16 gilt als umgesetzt, wenn:

- lokale und CI-Prüfungen dokumentiert sind.
- Flutter Analyze/Test laufen.
- Docs-Drift sichtbar wird.
- spätere Backend-/Compose-Gates vorgesehen sind.
- Bootstrap-, Codegen- und Verify-Scripts im Repo existieren.
- Contract-Mock-Grenze für Microcks oder ein vergleichbares Tool dokumentiert ist.

## Offene Folgefragen

- Welche CI-Runner stehen zur Verfügung?
- Welche Checks sind vor MVP verpflichtend?
- Wann wird Docker/Compose in CI geprüft?
- Wann wird Microcks als Compose-Service ergänzt?
- Welche API-Spezifikation wird zuerst contract-getestet?
