---
title: "Plattform-Säule - Home Hub and Sync"
description: "Plattformbereich fuer Home Hub, Pairing, Upload, Sync, Konflikte und backend-agnostische Self-Hosted-Basis"
tags: [pillar, platform, home-hub, sync, pairing, self-hosted]
lastUpdated: "2026-05-06"
version: "0.1"
status: "proposed"
---

# Plattform-Säule - Home Hub and Sync

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

## MVP-Scope

MVP:

- QR Pairing und manueller Code als Fallback.
- Mobile Upload-Token.
- Upload in Draft-Inbox.
- Gerät widerrufbar machen.
- keine vollständige bidirektionale Synchronisation.

Post-MVP:

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
