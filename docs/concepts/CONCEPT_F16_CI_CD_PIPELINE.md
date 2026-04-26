---
title: "Konzept F16 - CI/CD Pipeline and Quality Gates"
description: "DocMan-spezifische Quality Gates für Flutter App, Dokumentation, spätere Home-Hub/Compose-Checks und sichere Releases"
tags: [concept, ci, cd, quality-gates, flutter, docs, compose]
lastUpdated: "2026-04-26"
version: "3.0"
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

## Spätere Gates

- Home-Hub Backend Tests.
- Docker/Compose Validate.
- API Contract Tests.
- Mobile Capture Smoke.
- Storage Migration Tests.
- Release Signing Checks.

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

## Offene Folgefragen

- Welche CI-Runner stehen zur Verfügung?
- Welche Checks sind vor MVP verpflichtend?
- Wann wird Docker/Compose in CI geprüft?

