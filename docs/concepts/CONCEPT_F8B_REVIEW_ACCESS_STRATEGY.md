---
title: "Konzept F8b - Review Access Strategy"
description: "Mappm-Strategie für Demo-/Review-Zugänge, synthetische Daten und getrennte Local-/Cloud-Testumgebungen"
tags: [concept, review, demo, distribution, synthetic-data]
lastUpdated: "2026-07-12"
version: "3.0"
status: "accepted"
---

# Konzept F8b - Review Access Strategy

## Status

Accepted.

Dieses Konzept ersetzt den importierten F8b-Inhalt aus dem alten Projekt.

## Zweck

F8b beschreibt, wie DocMan später prüfbar wird, ohne echte private Dokumente oder einen öffentlichen Demo-Cloud-Dienst zu benötigen.

## Grundsatz

Review-Daten sind synthetisch.

Keine echten Haushaltsdokumente, keine echten Ausweise, keine echten Rechnungen.

## Review-Modi

| Modus | Zweck |
|---|---|
| Local Demo Data | App mit synthetischem Haushalt und Dokumenten |
| Fake Cloud Provider | Account, Vault, Upload, Sync, Entitlement und Ausfälle simulieren |
| Local Development Cloud | echten Contract-/Backend-Stack ausschließlich mit synthetischen Daten prüfen |
| Managed Review Environment | kontrollierte Staging-/Review-Accounts und synthetische Vaults |

## Anforderungen

- reproduzierbare Demo-Daten.
- klarer Review-Pfad.
- kein Cloud-SaaS-Zwang.
- keine echten Secrets.
- Mobile Capture prüfbar ohne echte privaten Dokumente.

## Definition of Done

F8b gilt als umgesetzt, wenn:

- Demo-/Review-Datenkonzept existiert.
- Reviewer keine echten Daten brauchen.
- Fake-/Microcks-/Local-Development-Cloud-/Staging-Review mit F15 zusammenpasst.

## Offene Folgefragen

- Wann brauchen wir Review-Artefakte wirklich?
- Soll es einen Demo-Modus in der App geben?
- Welche synthetischen Dokumente decken Kernflows ab?


## Enterprise Quality Contract

This concept adopts `docs/execution/CONCEPT_ENTERPRISE_QUALITY_CONTRACT.md`.
Its own scope and status remain authoritative; the shared contract supplies the
mandatory ownership, security/privacy, accessibility/localization, verification,
stop-rule and handoff defaults wherever this file does not define a stricter
rule. Any conflict must stop the affected phase and be resolved in this concept.
