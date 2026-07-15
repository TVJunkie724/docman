---
title: "Superseded Decision - Trust, Encryption and Deployment Model"
description: "Historischer Verweis; Vault-, Account-, Assist- und Security-Entscheidungen sind verbindlich"
tags: [decision, historical, superseded, trust, encryption]
lastUpdated: "2026-07-15"
status: "superseded"
owner: "security/product"
---

# Superseded Decision - Trust, Encryption and Deployment Model

Die fruehere private-first-/Home-Hub-Deploymentmatrix und eine implizite
Zero-Knowledge-Richtung sind nicht akzeptiert und autorisieren keine
Implementierung.

Verbindlich sind:

- `docs/technical/DECISION_VAULT_STORAGE_AND_CLOUD_PRODUCT_MODEL.md`;
- `docs/technical/DECISION_ACCOUNT_VAULT_ASSIST_PRODUCT_MODEL.md`;
- `docs/technical/DECISION_SECURITY_PRIVACY_MODEL.md`;
- `docs/technical/DECISION_PRIVACY_SYNC_SCOPE.md`;
- `docs/concepts/CONCEPT_F12_SECURE_STORAGE.md`.

Local/Cloud Vault, Core Assist, Account/Device Trust und Deployment sind
getrennte Dimensionen. Managed Trust versus E2EE/Zero Knowledge, Key Ownership,
Recovery und Server-Klartextzugriff bleiben in VC-02/SEC-Gates offen. Keine
Phase darf aus diesem historischen Dokument eine Verschluesselungs- oder
Deploymententscheidung ableiten.
