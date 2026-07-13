---
title: "Konzept F8 - Distribution Readiness"
description: "Mappm-Distribution fuer verkaufbare Local/Cloud-Pläne, signierte Builds, Stores, entitlements and review access"
tags: [concept, distribution, app-store, mobile, desktop, cloud, entitlements]
lastUpdated: "2026-07-12"
version: "4.0"
status: "accepted-rebaseline"
---

# Konzept F8 - Distribution Readiness

## Status

Accepted rebaseline. The legacy detail appendix is not implementation-authorizing.

## 2026 Commercial Distribution Rebaseline

Private/self-hosted is not an early release exception. Every sold Local or Cloud
build needs selected-channel signing, update, privacy/legal, licensing,
entitlement, cancellation/export and support readiness. Store review uses
synthetic accounts/Vaults. Cloud subscriptions must obey current platform rules
and preserve Local migration/export when entitlement ends.

Dieses Konzept ersetzt den importierten F8-Inhalt aus dem alten Projekt.

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

F8 hält fest, wie DocMan später verteilt werden kann. Distribution ist nicht M2-führend, darf aber Architektur nicht überraschen.

## M2-Richtung

Die erste produktive Richtung ist privat/self-hosted. R10-D1 bestaetigt diese
Linie in `docs/technical/DECISION_DISTRIBUTION_STRATEGY.md`.
R10-D2 bestaetigt zusaetzlich, dass Privacy/Legal bei der Implementierung
mitgedacht werden, aber erst vor Store/Public Release als eigenes Gate blocken.

Primär:

- lokale Desktop-Builds.
- Mobile Testbuilds.
- Home Hub im privaten Setup.

Nicht primär:

- öffentliche App Stores.
- Cloud-SaaS-Vertrieb.
- Enterprise-Mandantenprodukt.

## Spätere Distribution

Mögliche Pfade:

- signierte Desktop-Builds.
- TestFlight/Android interne Tests.
- private Familien-/Haushaltsinstallation.
- später öffentliche Store-Prüfung, falls gewünscht.

## Store-Relevanz

Mobile Capture kann Stores später relevant machen. Deshalb sollte DocMan:

- Privacy-Texte sauber halten.
- keine versteckten externen Dienste nutzen.
- Review ohne echte private Daten ermöglichen.
- App-Berechtigungen minimal halten.
- Store-Regeln fuer Apple, Google und Microsoft vorbereiten, ohne M2/private
  Nutzung davon abhaengig zu machen.
- Legal-/Privacy-Readiness als Gate vor Store/Public Release fuehren.

## Definition of Done

F8 gilt als umgesetzt, wenn:

- M2 nicht von Store-Distribution abhängt.
- spätere Mobile-Distribution nicht blockiert wird.
- Privacy-/Permission-Anforderungen sichtbar sind.
- Review-/Demo-Modus ohne echte private Daten geplant ist.
- public/store Distribution nicht ohne Legal-/Privacy-Gate erfolgt.

## Offene Folgefragen

- Wann brauchen wir TestFlight/Android Internal Testing?
- Wird Desktop signiert verteilt?
- Wann wird die Store-Policy-Matrix konkret ausgearbeitet?
- Wer fuehrt die rechtliche/praktische Privacy-Review vor Public Release durch?

## Enterprise Quality Contract

This concept adopts `docs/execution/CONCEPT_ENTERPRISE_QUALITY_CONTRACT.md`.
Its own scope and status remain authoritative; the shared contract supplies the
mandatory ownership, security/privacy, accessibility/localization, verification,
stop-rule and handoff defaults wherever this file does not define a stricter
rule. Any conflict must stop the affected phase and be resolved in this concept.
