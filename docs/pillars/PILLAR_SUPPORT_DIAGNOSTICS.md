---
title: "Enterprise-Säule - Support and Diagnostics"
description: "Enterprise-Bereich fuer Diagnosepakete, Support-Modus, Fehleranalyse, Nutzerhilfe und sichere Debuggability"
tags: [pillar, enterprise, support, diagnostics]
lastUpdated: "2026-06-12"
version: "0.2"
status: "proposed"
---

# Enterprise-Säule - Support and Diagnostics

## Zweck

Auch ein privates/self-hosted Produkt braucht Antworten auf: Was ist kaputt, warum sehe ich meinen Upload nicht, und wie kann man helfen, ohne sensible Daten offenzulegen?

## Scope

- Diagnosepaket.
- Support-Modus.
- Upload-/Sync-Fehleranalyse.
- Health-Zusammenfassung.
- redigierte Log-Exporte.
- Nutzerhilfen für häufige Fehler.

## M2-Minimum

- verständliche Fehlerzustände.
- keine privaten Inhalte oder Secrets in normalen Logs/Fehlerzustaenden.
- Upload-Queue und Pairing-Status erklärbar machen.

## Offene Entscheidung

R12-D1 bleibt offen und ist kein M1-Thema:

- konkretes Diagnosepaket.
- Support-Modus.
- Exportformat fuer Supportdaten.
- Umfang redigierter Log-Exporte.

Diese Themen werden in R12 entschieden. Bis dahin gilt nur die
Security-Basislinie: keine Dokumentinhalte, Secrets oder sensiblen Rohdaten in
normalen Logs und Fehlerzustaenden.

## Verwandte Säulen

- Observability and Runtime Operations.
- Admin, Settings and Storage Health.
- Security and Privacy Architecture.
