---
title: "Mappm SEC-00 Security And Trust Umbrella"
description: "Security-, Trust- und Verschluesselungsvertrag fuer sensible Dokumentverarbeitung"
tags: [security, privacy, encryption, trust, vault, cloud, playbook]
lastUpdated: "2026-07-15"
status: "accepted-direction"
owner: "security/product-concept"
---

# Mappm SEC-00 Security And Trust Umbrella

Local und Cloud Vault besitzen unterschiedliche Authority- und Trust-Grenzen.
Managed Cloud Storage, Backup, Verarbeitung, Account-/Device-Recovery,
Subscription Exit und Provider-Migration sind blockiert, bis ihre SEC-02/03-
Regeln und die anwendbaren VC-02/VC-07/VC-08-Entscheidungen akzeptiert sind.
Local Development Cloud ist eine isolierte synthetische Engineering-Umgebung,
kein Self-hosting-Modus fuer Kunden.

## Zweck

Mappm ist privacy-first und offline-faehig. Account, Local/Cloud Vault, Core
Assist, Sync, Sharing, Backup und Recovery benoetigen jeweils explizite
Trust-Grenzen. Security ist Bestandteil jeder Daten-, Backend-, Contract- und
UI-Entscheidung.

## Trust Model Direction

| Bereich | Richtung | Status |
|---|---|---|
| Lokale Daten | verschluesselter Store, sichere Keys und Recovery-/Verlustverhalten vor Produktion | planned |
| Cloud Vault | Transfer folgt gewaehltem Vault-Modus, Contract, Rechtsgrundlage, Zweck und transparenter Policy; kein per-Dokument-Consent wird pauschal erfunden | planned |
| Core Assist | sensible Verarbeitung braucht Zweck, Minimierung, Provider/Region, Retention, Training-Policy und sichtbare Folgen | planned |
| Backups | verschluesselt, restore-getestet, auditierbar und vom Sync unterschieden | planned |
| Sharing | Account-/Recipient-Identitaet, Scope, Ablauf, Widerruf und Audit vor Umsetzung | planned |
| Identity | EUDI Wallet/ID Austria sind optionale Provider-/Assurance-Boundaries, nicht automatisch Mappm-Account oder alleinige Authentifizierung | planned |

## Erforderliche Security-Konzepte

- Key Management und Secure Storage;
- Encryption at Rest und in Transit;
- Account-/Device-Trust und Session Lifecycle;
- Authorization/Tenant Isolation und auditrelevante Zugriffe;
- Provider-Austauschbarkeit;
- Loesch-, Export-, Migrations- und Restore-Garantien;
- Isolation von Local Development Cloud, Development, Staging und Production;
- Incident-, Telemetry- und Support-Diagnostic-Boundaries.

## Artefaktindex

| Artefakt | Verantwortung |
|---|---|
| `SEC-01_THREAT_MODEL.md` | Assets, Threat Actors, Abuse Cases, Controls und Residual Risks |
| `SEC-02_TRUST_BOUNDARIES.md` | Device-, Vault-, Cloud-, Provider-, Sharing- und Support-Grenzen |
| `SEC-03_ENCRYPTION_KEY_MANAGEMENT.md` | Key Ownership, Rotation, Recovery, Verlust und Crypto Agility |
| `SEC-04_VULNERABILITY_MANAGEMENT.md` | Intake, Triage, Remediation, Disclosure und Reporting |
| `SEC-05_SECURE_UPDATE_SUPPLY_CHAIN.md` | Dependencies, SBOM, Signing, Provenance und sichere Updates |

## Stop Rules

- Stop, wenn eine Phase Dokumentbytes, OCR-Text, Facts, Profile oder Model
  Output ohne dokumentierte Trust Boundary, Zweck und Lifecycle an einen
  Service uebertraegt.
- Stop, wenn Fake-/Demo-Daten mit echten sensiblen Daten verwechselt werden
  koennen.
- Stop, wenn Sharing, Backup oder Sync vor Access-, Revocation-, Conflict- und
  Recovery-Verhalten umgesetzt wird.
- Stop, wenn offene VC-02/VC-07/VC-08-Fragen implizit in Code oder Contract
  beantwortet werden.
