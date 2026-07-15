---
title: "Plattform-Säule - Account, Cloud, Identity and Sync"
description: "Mappm Account- und Gerätevertrauen für alle Normalmodi sowie Cloud-Vault-Lifecycle, Entitlements, Capture, Sync und Provider-Migration"
tags: [pillar, platform, account, cloud, identity, vault, sync, entitlements, recovery, migration]
lastUpdated: "2026-07-15"
version: "1.1"
status: "accepted"
owner: "product-concept/contract-api"
---

# Plattform-Säule - Account, Cloud, Identity and Sync

## Zweck

Diese Säule besitzt Mappm Account/Device/Entitlement für alle normalen Local-
und Cloud-Modi sowie die verwaltete Mappm-Cloud-Plattform und alle
Client/Server-Grenzen, die einen Cloud Vault ermöglichen. Sie besitzt nicht die
fachliche Dokument-, Vorgangs- oder Aufgabenlogik; diese bleibt in den
jeweiligen Produkt-Säulen.

Kundenseitiges Self-Hosting ist kein aktiver Produktscope. Die Local
Development Cloud ist ausschliesslich Entwickler-Infrastruktur und nie ein
verkaufbarer Deploymentmodus.

## Verantwortungen

- Mappm Account, Geräte-Session, Offline-Kontinuität, Detached Recovery,
  Reattachment und Autorisierung für jeden normalen Modus.
- Cloud-Vault-Erstellung, -Auswahl und serverseitige Authority.
- Plan, Entitlement, Quota und Subscription-Lifecycle.
- Upload, Download, Cache-/Pending-Bestätigung, Sync und Konflikte.
- Local-to-Cloud- und Cloud-to-Local-Migration mit Inventar, Checkpoints,
  Checksums, Verifikation und Source Preservation.
- Cloud-Export, Vault-Löschung, Account-Löschung und Retention-Ausführung.
- Contract-, Backend-, Infrastruktur-, Betriebs- und Support-Handoffs.

## Commercial-Core-Slices

| Slice | Ergebnis | Abhängigkeiten |
|---|---|---|
| Cloud contract foundation | versionierte OpenAPI-Familien, Microcks-Szenarien, Fehler- und Idempotenzmodell | VC-01, VC-02, VC-08 |
| Account and device trust | Anmeldung, Free/Paid Entitlement, Offline-Session, Widerruf, Recovery, Detached Recovery, Access-denied für Local/Cloud | VC-03/08, SEC-02/03, REG-01/04 |
| Cloud Vault foundation | Vault-Lifecycle, Authority, Cache/Pending, Quota | F2, F10-F12, F36 |
| Capture and sync | dauerhafter Offline-Upload, Bestätigung, Konflikte, Multi-Device | Capture-Säule, DATA/SEC/OPS |
| Commercial lifecycle | Entitlement, Kündigung, Grace/Read-only, Reaktivierung | COM-01/02, REG-06/08 |
| Exit and deletion | Export, verifizierte Local-Migration, getrennte Vault-/Account-Löschung | DATA-02/03/05, F36 |

Account, Device Trust, Offline-Entitlement und Detached Recovery sind unabhaengig
von VC-01 Commercial-Core-Foundation. VC-01 entscheidet, welche
Cloud-spezifischen Slices Commercial 1.0 erreichen. Jeder aktivierte Slice muss
production-ready sein.

## Local Development Cloud

Die Local Development Cloud startet denselben Backend-/Contract-Stack im
lokalen Netzwerk für Entwicklung und Integration. Sie:

- verwendet ausschließlich synthetische Daten und eigene Secrets;
- ist kein Kundenfeature und erscheint nicht in Production Settings;
- darf keine Produktionsdaten, Accounts, Schlüssel oder Telemetrie übernehmen;
- muss dieselben akzeptierten Contract-Versionen und Migrationen wie Staging
  und Production ausführen können.

## Quality Gates

- Local und Cloud Authority sind in Domain, UI und Tests unmissverständlich.
- Account/Session, Entitlement, Vault-Autoritaet, Assist-Verarbeitung und Backup
  sind getrennte Zustaende.
- Vertragsänderungen bestehen Lint, Breaking-Change-Prüfung, Microcks Consumer
  und Provider Verification.
- Wiederholung nach Timeout erzeugt keine doppelten Dokumente oder Buchungen.
- Migration und Kündigung löschen keine Quelldaten implizit.
- Export und Cloud-to-Local bleiben im Grace-/Read-only-Zustand erreichbar.
- Logs, Metrics, Traces, Audit und Support-Bundles enthalten keine Dokumente,
  OCR-Texte, Tokens, signierten URLs oder direkten Account-Identifier.

## Stop Rules

Stop, wenn:

- VC-01 für einen Cloud-Vault-spezifischen Slice oder VC-02/VC-08 für den
  jeweils betroffenen Trust-/Identity-Slice offen ist;
- Frontend oder Roadmap DTOs, Endpunkte, Mapping, Persistence oder Backend
  Policy Architecture festlegt;
- Subscription-Kündigung, Vault-Löschung und Account-Löschung vermischt werden;
- Account-Loeschung lokale Daten still remote loeschen kann oder Detached
  Recovery ein aktives Service-Token benoetigt;
- ein Cloud-Feature ohne Offline-, Retry-, Idempotenz-, Quota-, Recovery-,
  Retention-, Support- und Rollback-Verhalten geplant wird;
- die Local Development Cloud als verkaufbares Self-hosted-Produkt erscheint.

## Handoff

- Produkt-/UX-Verhalten: `ui-concept`, danach `ui-architect`.
- Daten-/Cache-/Migrationsmodell: `data-architect`.
- OpenAPI/Microcks: `contract-api`.
- Backend, DTOs, Endpunkte, Mapping, Persistence und Policy Architecture:
  separates Backend-Team/-Issue.
- Tests/Release-Gates: `quality-readiness`.

Diese Säule übernimmt den Enterprise Quality Contract aus
`docs/execution/PILLAR_ENTERPRISE_QUALITY_CONTRACT.md`.
