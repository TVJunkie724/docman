---
title: "Konzept F7 - Logging"
description: "DocMan-spezifisches Logging für lokale App, Mobile Capture, Home Hub, Upload Queue und privacy-sensible Diagnose"
tags: [concept, foundation, logging, diagnostics, privacy, home-hub]
lastUpdated: "2026-05-05"
version: "3.1"
status: "accepted"
---

# Konzept F7 - Logging

## Status

Accepted.

Dieses Konzept ersetzt den importierten F7-Inhalt aus dem alten Projekt.

## Zweck

F7 definiert, welche Ereignisse DocMan protokolliert und welche Daten niemals in Logs landen dürfen.

F18 ergänzt F7 um das größere Runtime-Readiness-Modell: UserNotifications, Telemetry Events, Audit Events, Correlation IDs und spätere Observability. F7 bleibt die Quelle für Log-Kategorien und Log-Privacy.

## Grundsatz

Logs helfen bei Diagnose, aber DocMan verwaltet sensible Dokumente. Privacy gewinnt gegen Bequemlichkeit.

## Was geloggt werden darf

- App-Start und Version.
- Feature-Initialisierung.
- Home-Hub-Reachability-Status.
- Upload-Queue-Status ohne Dateiinhalte.
- Retry-/Failure-Kategorien nach F5.
- Storage-Migrationsergebnisse.
- Performance grober Operationen.

## Was nicht geloggt werden darf

- Dokumentinhalte.
- OCR-Texte.
- Formularinhalte.
- Tokens, Pairing Secrets, Schlüssel.
- vollständige private Dateipfade, wenn vermeidbar.
- personenbezogene Daten ohne bewusste Redaction.

## Log-Kategorien

| Kategorie | Beispiele |
|---|---|
| app | Start, Shutdown, Konfiguration |
| storage | DB geöffnet, Migration, Dateioperation |
| capture | Scan erfasst, Queue aktualisiert |
| upload | Upload gestartet, retry, abgeschlossen |
| home_hub | Health, Capability, Pairing-Status |
| security | Secret fehlt, unpair, auth failure |
| ui | schwer reproduzierbare UI-Fehler |

## Lokale Logs

Desktop darf lokale Diagnose-Logs führen. Mobile nur zurückhaltend.

Logs sollen rotieren oder begrenzt werden. Export von Diagnose-Logs muss später bewusst über UI erfolgen.

## Home-Hub-Korrelation

Später sollten App und Home Hub eine harmlose Korrelations-ID nutzen können.

Keine Korrelation über personenbezogene Daten, Dateinamen oder Tokens.

F18 definiert Correlation IDs / Operation IDs als Querschnitt für Upload, Import, Sync, Failure, Telemetry und Audit.

## Observability-Grenze

Logging ist nur ein Teil von Observability.

F7 beschreibt lokale Logs. F18 beschreibt zusätzlich:

- Telemetry Events.
- Audit Events.
- Metrics-Zielbild.
- lokale Diagnoseansicht.
- spätere Home-Hub-/OpenTelemetry-kompatible Exportgrenze.

## Definition of Done

F7 gilt als umgesetzt, wenn:

- Logging-Kategorien definiert sind.
- sensible Daten redacted bleiben.
- F5-Failure-Kategorien logbar sind.
- Upload-Queue diagnostizierbar ist.
- Diagnose-Export keine Secrets enthält.
- F18-Redaction-Regeln bei Telemetry und Audit eingehalten werden.

## Offene Folgefragen

- Welches Logging-Package verwenden wir?
- Wie lange werden lokale Logs aufbewahrt?
- Gibt es im M2 bereits einen Diagnose-Export?
- Welche Logs werden später zu Telemetry Events oder Audit Events nach F18?
