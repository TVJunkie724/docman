---
title: "Mappm - Open Questions Register"
description: "Open product, compliance, roadmap and implementation questions found during playbook reconciliation"
tags: [discovery, questions, blockers, playbook]
lastUpdated: "2026-07-12"
status: "active"
owner: "product-concept"
---

# Mappm - Open Questions Register

| ID | Question | Owner | Status | Blocks | Re-check trigger |
|---|---|---|---|---|---|
| OQ-001 | Soll die Repo-/Package-Identitaet irgendwann von `docman` auf `mappm` umbenannt werden? | product/foundation | planned | release/package/store work | before R10 distribution |
| OQ-002 | Ersetzt durch VC-01 bis VC-08: Local und Cloud Vault sind akzeptiert; Release-Timing und Policies bleiben offen. | product/commercial/security | resolved 2026-07-12 | none | Vault/Cloud decision |
| OQ-003 | Welche Daten verlassen das Geraet fuer Core/Advanced Assist und unter welchen Provider-, Region-, Retention-, Redaction-, Subprocessor- und Training-Regeln? | ai/compliance/security | open-blocking | C2 Core Assist and all real-document AI processing | before any real-document Assist processing |
| OQ-004 | Welche eIDAS/EUDI/ID Austria Use Cases sind wirklich produktrelevant: Login, Account binding, signing, sharing trust, audit? | identity/compliance | planned | identity provider design | before R6/R14 identity work |
| OQ-005 | Welche Stores/Distribution Channels werden zuerst bedient: direct desktop, macOS notarization, iOS, Android, Microsoft Store? | release/compliance | planned | R10 release readiness | before external beta |
| OQ-006 | Welche Support- und SLA-Erwartung gilt fuer zahlende Nutzer oder Haushalte? | commercial/support | planned | COM/OPS support slices | before paid/trial launch |
| OQ-007 | Welche CI/CD-Plattform und Branch-Protection-Regeln gelten dauerhaft? | quality/release | planned | R3/R10 gates | before shared delivery |
| OQ-008 | Welche Design-System-Familien muessen vor dem ersten echten UI-Slice approved sein? | ui-concept/design | resolved 2026-07-10 | none | Relevant MP-DS-01/02/04/06/07 rows plus phase-specific F concepts must be reviewed before handoff |
| VC-01 | Muss Commercial 1.0 bereits Cloud-Vault-Speicher/Multi-Device enthalten oder darf ein accountbasierter Local-Vault-Release mit Managed Core Assist zuerst erscheinen? | product/commercial | open-blocking | Cloud-Vault C1/C2/C4 scope and milestone/issue reshaping; not Account/Core-Assist backend | before Cloud-Vault C1 approval |
| VC-02 | Welches kryptografische Trust-Modell gilt fuer Cloud Vault und Managed Assist: Managed Trust oder Zero-Knowledge/E2EE, inklusive Recovery und Server-Processing? | product/security/ai | open-blocking | Cloud storage, keys, recovery, Core Assist, OCR/LLM, sharing | before Cloud data or real-document Assist implementation |
| VC-03 | Welche Free/Paid-Local/Cloud-Pläne, Core/Advanced-Assist-Quotas, Preise, Geräte- und Vault-Limits gelten? | product/commercial | open-blocking | entitlement, billing, quota UX/contracts and Free value promise | before C1 entitlement/C2 Assist/C4 billing implementation |
| VC-04 | Wie lang dauern Grace/Read-only und Retention vor Löschung, und welche Benachrichtigungen sind Pflicht? | product/legal/commercial | open-blocking | cancellation, retention, support/legal copy | before C4 implementation |
| VC-05 | Welche Plattformen dürfen Cloud-to-Local migrieren und welche Kapazitäts-/Dateisystem-Preflights gelten? | product/data/platform | open-blocking | migration UX and implementation | before C4 implementation |
| VC-06 | Welche Cloud-Cache-Defaults gelten pro Plattform, Speicherklasse und Offline-Policy? | product/data/platform | open-blocking | cache UX, quotas, offline guarantees | before Cloud provider implementation |
| VC-07 | Wie werden Local-Vault-Metadaten, Dateien und Exportpakete je Plattform verschlüsselt, gesichert und bei Schlüssel-/Geräteverlust wiederhergestellt? | security/data/platform | open-blocking | Local persistence, backup/restore, commercial Local release | before Local data implementation |
| VC-08 | Welcher Mappm Identity Provider sowie welche Verifikations-, MFA/Passkey-, Offline-Session-, Recovery-Proof-, Reattachment- und Account/Household-Binding-Policy gelten? | security/product/identity | open-blocking | account/device sessions for all normal modes and support recovery | before account/device implementation |
| WF-01 | Welche Länder, Regionen und Golden-Workflow-Familien werden für Commercial 1.0 fachlich unterstützt und beworben? | product/domain/commercial | open-blocking-for-workflow-claims | country-pack scope, fixtures, localization, marketing and release evidence | before approving C0 scope or any country-specific workflow phase |
| WF-02 | Wer owns, prüft und haftet für fachliche Workflow-Inhalte, Quellen, Änderungsbeobachtung, Withdrawal und Incident-Korrekturen je Rechtsraum? | product/legal/compliance/domain | open-blocking-for-workflow-claims | catalog publication and maintenance operating model | before publishing the first reviewed workflow pack |

## Rules

- A question may remain open only if affected phases name it as blocker or
  deferred dependency.
- No implementation may answer an open question implicitly in code.
- Closing a question requires updating the owning decision, concept, roadmap or
  phase document.
