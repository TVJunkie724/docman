---
title: "Superseded Decision - Auth and Pairing"
description: "Historischer Verweis; ersetzt durch Account, Cloud Identity and Device Trust"
tags: [decision, historical, superseded, identity]
lastUpdated: "2026-07-15"
status: "superseded"
owner: "product-concept/security"
---

# Superseded Decision - Auth and Pairing

Diese Entscheidung autorisiert keine Implementierung. QR-/Code-Pairing mit
einem privaten Home Hub und ein accountfreier Local-Modus wurden verworfen.

Verbindlich sind:

- `docs/technical/DECISION_ACCOUNT_VAULT_ASSIST_PRODUCT_MODEL.md`;
- `docs/technical/DECISION_CLOUD_IDENTITY_DEVICE_TRUST.md`;
- `docs/concepts/CONCEPT_F36_VAULT_MODES_CLOUD_LIFECYCLE.md`;
- `docs/pillars/PILLAR_CLOUD_IDENTITY_SYNC.md`.

Normale Local- und Cloud-Nutzung verwendet Mappm Account, autorisierte Geraete,
widerrufbare Sessions und begrenzte Offline-Berechtigung. Detached Recovery ist
der accountunabhaengige Exit fuer vorhandene lokale Daten, nicht ein normaler
Onboardingmodus. Historische Pairing-Details werden bewusst nicht erhalten,
damit kein zweiter Auth-Vertrag entsteht.
