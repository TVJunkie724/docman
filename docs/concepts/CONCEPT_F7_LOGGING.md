---
title: "Konzept F7 - Logging"
description: "Mappm-Logging fuer Local/Cloud Vaults, migration, entitlement, capture and privacy-safe managed operations"
tags: [concept, foundation, logging, diagnostics, privacy, home-hub]
lastUpdated: "2026-07-12"
version: "4.0"
status: "accepted-rebaseline"
---

# Konzept F7 - Logging

## Status

Accepted rebaseline. The legacy detail appendix is not implementation-authorizing.

## 2026 Vault/Cloud Rebaseline

Logs may record provider kind, environment, safe operation/reference code and
coarse migration/entitlement state. They never record Vault names, document
names/content, OCR text, account identifiers, tokens, signed URLs, local private
paths or payment details. Local Development Cloud and production telemetry are
separate sinks and production data is never copied into development.

Dieses Konzept ersetzt den importierten F7-Inhalt aus dem alten Projekt.

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

## Enterprise Quality Contract

This concept adopts `docs/execution/CONCEPT_ENTERPRISE_QUALITY_CONTRACT.md`.
Its own scope and status remain authoritative; the shared contract supplies the
mandatory ownership, security/privacy, accessibility/localization, verification,
stop-rule and handoff defaults wherever this file does not define a stricter
rule. Any conflict must stop the affected phase and be resolved in this concept.
