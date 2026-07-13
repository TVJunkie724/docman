---
title: "Konzept F13 - Configuration Pages"
description: "Mappm Settings UX fuer Account, Vault storage mode, Assist/plan, local cache, migration, recovery, profiles and diagnostics"
tags: [concept, configuration, ux, settings, account, vault, assist, cloud, recovery, profiles]
lastUpdated: "2026-07-12"
version: "4.0"
status: "accepted-rebaseline"
---

# Konzept F13 - Configuration Pages

## Status

Accepted rebaseline. The legacy detail appendix is not implementation-authorizing.

## 2026 Normative Settings Model

Remove customer server URL, Home Hub health and pairing settings. Settings must
show active Vault, `Auf diesem Gerät` versus `Mappm Cloud`, account/device,
Free/Paid plan, Core/Advanced Assist quota and processing state, local
availability/cache, backup/export, migration, offline continuity, Detached
Recovery and cancellation/grace/deletion surfaces. Provider change launches
the F36 migration flow; it is never a toggle. Assist enablement/opt-out never
looks like a storage-provider switch. Local Development Cloud configuration is
developer tooling and not visible in production settings.

Dieses Konzept ersetzt den importierten F13-Inhalt aus dem alten Projekt.

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

F13 definiert, welche Konfigurationsflächen DocMan braucht und wie sie sich fachlich verhalten.

## Grundsatz

Konfiguration ist kein Marketingbereich. Sie muss ruhig, klar und diagnosefähig sein.

## M2-Konfigurationsbereiche

| Bereich | Zweck |
|---|---|
| Allgemein | Sprache, Theme, lokale Präferenzen |
| Profile | Personen-/Profilverwaltung und Standardansichten |
| Haushalt | spätere Haushaltsmitglieder, Kinderprofile, Zugriffsstatus |
| Home Hub | URL, Health Check, Pairing-Status |
| Storage | lokale Speicherorte, Cache-Status, Export später |
| Mobile Capture | verbundenes Gerät, Upload-Status, Queue-Hinweise |
| Diagnose | App-Version, Logs, Health, Feature Flags |

## UX-Regeln

- Status zuerst, Details darunter.
- Keine Secrets anzeigen.
- Verbindungsprobleme handlungsorientiert erklären.
- Lokale Nutzung nicht als Fehler darstellen, wenn kein Home Hub verbunden ist.
- Riskante Aktionen brauchen Bestätigung.
- Diagnose darf technisch sein, aber nicht panisch.

## Home-Hub Setup

Die Home-Hub-Konfiguration muss zeigen:

- Backend-Adresse.
- Erreichbarkeit.
- Capabilities.
- Pairing-Status.
- letzte erfolgreiche Verbindung.
- Upload-Fähigkeit.

Tailscale wird höchstens als Setup-Hinweis erwähnt, nicht als Produktzustand.

## Definition of Done

F13 gilt als umgesetzt, wenn:

- Settings-Struktur für M2 klar ist.
- Home-Hub-Verbindung verständlich konfigurierbar ist.
- Secrets nicht sichtbar sind.
- Diagnose Status und nächste Aktion trennt.
- Profil- und Haushaltsbereiche getrennt geplant sind, damit M2-Profilwahl nicht mit späterer Rechteverwaltung vermischt wird.

## Offene Folgefragen

- Braucht der M2 einen Setup-Wizard?
- Wie wird Mobile Pairing dargestellt?
- Welche Storage-Informationen sind für normale Nutzer sinnvoll?
- Welche Haushalts-/Kinderprofilverwaltung ist R5-Minimum?

## Enterprise Quality Contract

This concept adopts `docs/execution/CONCEPT_ENTERPRISE_QUALITY_CONTRACT.md`.
Its own scope and status remain authoritative; the shared contract supplies the
mandatory ownership, security/privacy, accessibility/localization, verification,
stop-rule and handoff defaults wherever this file does not define a stricter
rule. Any conflict must stop the affected phase and be resolved in this concept.
