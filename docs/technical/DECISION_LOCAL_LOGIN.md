---
title: "Superseded Decision - Local Login"
description: "Historischer Verweis; normale Local- und Cloud-Nutzung verwendet Account und Device Trust"
tags: [decision, historical, superseded, identity]
lastUpdated: "2026-07-15"
status: "superseded"
owner: "product-concept/security"
---

# Superseded Decision - Local Login

Der fruehere accountfreie Local-Modus und Home-Hub-Device-Pairing sind
verworfen. Dieses Dokument autorisiert keine Implementierung.

Verbindlich sind:

- `docs/technical/DECISION_ACCOUNT_VAULT_ASSIST_PRODUCT_MODEL.md`;
- `docs/technical/DECISION_CLOUD_IDENTITY_DEVICE_TRUST.md`;
- `docs/concepts/CONCEPT_F36_VAULT_MODES_CLOUD_LIFECYCLE.md`.

Normale Local- und Cloud-Nutzung verwendet Mappm Account, autorisierte Geraete
und begrenzte Offline-Berechtigung. Ein gesunder Local Vault bleibt offline
nutzbar, ohne bei jedem Start einen Live-Request zu verlangen. Detached
Recovery ist der accountunabhaengige Exit fuer bestehende lokale Daten, nicht
ein normaler Login-/Onboardingmodus.
