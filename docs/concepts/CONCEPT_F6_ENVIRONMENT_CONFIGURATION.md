---
title: "Konzept F6 - Environment Configuration"
description: "Mappm-Konfiguration fuer Local, Local Development Cloud, Development, Staging and Production with safe instance defaults"
tags: [concept, foundation, configuration, environments, cloud, instances]
lastUpdated: "2026-07-12"
version: "4.0"
status: "accepted-rebaseline"
---

# Konzept F6 - Environment Configuration

## Status

Accepted rebaseline. The legacy detail appendix is not implementation-authorizing.

## 2026 Environment Model

Supported profiles are `local`, `local-development-cloud`, `development`,
`staging` and `production`. Local Vault use has no backend endpoint. Local
Development Cloud uses synthetic data and local service URLs. Managed
Development/Staging/Production use separate identity, API, storage, keys,
telemetry and app identity. Customer-entered server URLs, Tailscale and Home Hub
configuration are not product settings.

Dieses Konzept ersetzt den importierten F6-Inhalt aus dem alten Projekt.

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

F6 definiert, wie DocMan konfiguriert wird, ohne private Serveradressen, Secrets oder alte Cloud-Annahmen in Code oder Repo einzubauen.

## Grundsatz

DocMan ist local-first und self-hosted-orientiert.

Konfiguration muss deshalb:

- lokale Nutzung ohne Backend erlauben.
- optionalen Home Hub konfigurieren.
- private Serveradressen unterstützen.
- Tailscale/LAN/VPN nicht als Produktlogik behandeln.
- Secrets aus normaler Konfiguration heraushalten.

## Konfigurationsarten

| Art | Beispiele | Speicherort |
|---|---|---|
| Build-Konfiguration | App-Name, Feature-Flags, Flavor | Build/Dart define |
| Laufzeit-Settings | Home-Hub-URL, Sprache, Theme | F10 Local Storage |
| Secrets | Pairing Secret, Session Token | F12 Secure Storage |
| Dev-Konfiguration | Fake-Repositories, lokale Testdaten | Dev-only Config |
| Server-Konfiguration | Compose-Variablen, Storage-Pfade | Späterer Server-Stack |

## App-Modi

| Modus | Zweck |
|---|---|
| Local Only | Desktop-App ohne Home Hub, lokale Arbeit |
| Home Hub Connected | M2 mit Mobile Capture Upload |
| Dev Fake | UI-/Provider-Entwicklung ohne echten Server |
| Integration | Tests gegen lokalen Home-Hub/Compose-Stack |

Cloud-SaaS ist kein Zielmodus.

## Home-Hub-Konfiguration

Die App speichert nicht geheim:

- Home-Hub-URL.
- zuletzt geprüfter Health-Status.
- Capabilities.
- Anzeigename des Hubs.

Die App speichert geheim über F12:

- Pairing Secret.
- Session Token.
- Device Secret.

## Feature Flags

Feature Flags dürfen frühe Entwicklung erleichtern, aber nicht Produktlogik verstecken.

Mögliche Flags:

- mobileCaptureEnabled.
- homeHubUploadEnabled.
- fakeRepositoriesEnabled.
- intelligencePreviewEnabled.

Production-Defaults müssen konservativ sein.

## Definition of Done

F6 gilt als umgesetzt, wenn:

- keine harten IPs oder Platzhalter-URLs im Produktpfad stehen.
- Home-Hub-URL konfigurierbar ist.
- Secrets nur über F12 laufen.
- Dev Fake klar von Produktmodus getrennt ist.
- App ohne Home Hub sinnvoll startet.

## Offene Folgefragen

- Welche konkrete Config-Datei-/Dart-define-Strategie verwenden wir?
- Wie wird Mobile erstmalig mit der Home-Hub-Adresse versorgt?
- Welche Dev-Fakes sind im M2 erlaubt?


## Enterprise Quality Contract

This concept adopts `docs/execution/CONCEPT_ENTERPRISE_QUALITY_CONTRACT.md`.
Its own scope and status remain authoritative; the shared contract supplies the
mandatory ownership, security/privacy, accessibility/localization, verification,
stop-rule and handoff defaults wherever this file does not define a stricter
rule. Any conflict must stop the affected phase and be resolved in this concept.
