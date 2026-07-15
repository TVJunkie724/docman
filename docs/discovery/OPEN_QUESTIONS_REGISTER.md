---
title: "Mappm - Open Questions Register"
description: "Open product, compliance, roadmap and implementation questions found during playbook reconciliation"
tags: [discovery, questions, blockers, playbook]
lastUpdated: "2026-07-15"
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
| OQ-009 | Sind verwaltete Organisationen und getrennte Business-Kontexte Bestandteil von Commercial 1.0 oder ein spaeteres aktiviertes Produktpaket? | product/commercial/compliance | open-blocking-for-business-scope | C0/C3 scope, R5 managed-subject UX, business retention/export/support claims | before approving C0 scope or any OrganizationProfile implementation phase |
| OQ-010 | Welche Steuer-Rechtsraeume, Subjekttypen, Veranlagungsarten und Sammelintervalle werden zuerst fachlich geprueft und aktiviert? `AUSTRIA_TAX_CASE_CATALOG_DRAFT.md` ist nur datierter Discovery-Input. | product/legal/domain/compliance | open-blocking-for-tax-claims | tax collection packs, wording, fixtures, review actions and release claims | review the AT draft with named Tax/Legal owner before R8.11 or publication of any tax collection pack |
| OQ-011 | Wird das Zielmodell aus einem einzigen generischen Case, acht optionalen internen Workflow-Mustern, sichtbaren Domainvorlagen, getrennten Record-Arten sowie normalisierten Dokumentgrundarten/Varianten/Rollen akzeptiert; welche Muster/Grundarten werden kombiniert, getrennt oder verworfen und wie werden sie versioniert/gemappt? `CASE_DOCUMENT_TAXONOMY_CANDIDATES.md`, `AUSTRIA_CASE_WORKFLOW_COUNTRY_PACK_DRAFT.md` und `DYNAMIC_DOMAIN_COUNTRY_PACK_MODEL_DRAFT.md` sind nicht normative Workshop-Inputs. | product/domain/search/ai/data | open-blocking | R0.6; C2/C3 taxonomy schema, extraction, matching, fixtures and user-facing terminology | accept/revise the lean normalization and dynamic-pack boundaries in the dedicated R0.6 workshop before C2/C3 schema implementation |
| OQ-012 | Wird die aktuelle Medical-Discovery-Richtung akzeptiert: ein Medical-Care-Anker ab erstem medizinischem Dokument, ein `part_of` Cost-Settlement-Case je wirtschaftlicher Verpflichtung, Claims je Payer; und wie werden wiederkehrende Kontrollen, Benefits sowie echte Folge-Cases final abgegrenzt? | product/domain/compliance | open-blocking-for-medical-scope | medical catalog keys and any R8.12 medical workflow/record/claim implementation; not generic capture or CaseLink mechanics | resolve inside R0.6 with `docs/discovery/MEDICAL_CASE_MODEL_DISCOVERY.md`, then apply WF-01/WF-02 and AT/provider review |

## Rules

- A question may remain open only if affected phases name it as blocker or
  deferred dependency.
- No implementation may answer an open question implicitly in code.
- Closing a question requires updating the owning decision, concept, roadmap or
  phase document.
