---
title: "Superseded - Home Hub and Sync"
description: "Historische Plattform-Säule; ersetzt durch Cloud, Identity and Sync"
tags: [pillar, platform, home-hub, sync, pairing, self-hosted]
lastUpdated: "2026-07-12"
version: "1.0"
status: "superseded"
---

# Superseded - Home Hub and Sync

Dieses Dokument ist nicht mehr normativ. Es wird vollständig ersetzt durch
`PILLAR_CLOUD_IDENTITY_SYNC.md` und
`docs/technical/DECISION_VAULT_STORAGE_AND_CLOUD_PRODUCT_MODEL.md`.

Home Hub, Tailscale-Pairing und ein kundenseitig self-hosted Server sind kein
aktiver Produktpfad. Die lokale Serverumgebung ist ausschließlich eine Local
Development Cloud mit synthetischen Daten.

## Historischer Inhalt

## Zweck

Diese Säule beschreibt den privaten, self-hosted Weg von DocMan:

- Mobile Pairing.
- Upload an Home Hub.
- späterer Sync.
- Konfliktbehandlung.
- austauschbare Backend-Implementierung.

## Grundsatz

DocMan bleibt local-first und backend-agnostisch.

Tailscale/Home Hub ist eine erste private Betriebsform, aber keine Produktfessel. Eine spätere self-hosted Cloud oder andere Infrastruktur muss möglich bleiben, wenn die Schnittstellen stabil bleiben.

## M2-Scope

M2:

- QR Pairing und manueller Code als Fallback.
- Mobile Upload-Token.
- Upload in Draft-Inbox.
- Gerät widerrufbar machen.
- keine vollständige bidirektionale Synchronisation.

spaetere Milestones:

- Sync-Journal.
- Konfliktansicht.
- Remote-Dateispeicher.
- Multi-Geräte-Sync.
- optionale Identity Provider.

## Enterprise-Grenzen

- Dokumentdateien und Metadaten sind beide sensibel.
- Secrets gehören in Secure Storage.
- Logs dürfen keine Dokumentinhalte oder Tokens enthalten.
- Sync muss später E2EE-/Zero-Knowledge-fähig bleiben.

## Enterprise Quality Contract

This pillar adopts `docs/execution/PILLAR_ENTERPRISE_QUALITY_CONTRACT.md`.
Its milestone slices and domain boundaries remain authoritative; the shared
contract supplies mandatory owner separation, phase slicing, security/privacy,
accessibility/localization, verification, stop-rule and handoff requirements.
The pillar itself is never sufficient authorization for implementation.
