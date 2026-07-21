---
title: "Mappm - Decision Interview Summary"
description: "Zusammenfassung der bisherigen Produktentscheidungen fuer den Playbook-Agent-Track"
tags: [discovery, decisions, product, playbook]
lastUpdated: "2026-07-21"
status: "accepted-baseline"
owner: "product-concept"
---

# Mappm - Decision Interview Summary

## Purpose

This summary closes the playbook discovery interview for the current
reconciliation baseline. It records what has already been discussed and where
future owner review is still required.

Baseline source: the product decisions recorded through the preceding user
question-and-answer discussion and their owning accepted decision documents.
The instruction to repair review findings is evidence of remediation scope, not
approval of a new phase or of open business/legal choices. Those choices remain
unaccepted and block only their affected phases.

## Accepted Baseline Answers

| Area | Answer | Owning source |
|---|---|---|
| Product name | Product name is `Mappm`; DocMan remains technical repo/workspace name for now. | `docs/technical/DECISION_PRODUCT_NAME.md` |
| Product language | German user-facing language; `Case` in code maps to "Vorgang" in UI. | `docs/technical/DECISION_PRODUCT_LANGUAGE.md` |
| Product direction | A sellable Commercial Core with explicit Local and Cloud Vault modes; included features are production-ready. | `docs/technical/DECISION_COMMERCIAL_CORE_SCOPE.md` |
| Market sequence | Commercial 1.0 is Austria-first. The German-speaking market area is the planned next expansion direction, with exact jurisdictions/order still open and separate country/provider evidence required. | `docs/technical/DECISION_COMMERCIAL_CORE_SCOPE.md`, WF-01/WF-03 |
| Account/Vault/Assist | Every normal Free/Paid Local and Cloud mode requires a Mappm Account; Local remains local-authoritative, Cloud remains cloud-authoritative, and Assist processing never changes authority. Detached Recovery is the account-independent exit guarantee. | `docs/technical/DECISION_ACCOUNT_VAULT_ASSIST_PRODUCT_MODEL.md`, `DECISION_VAULT_STORAGE_AND_CLOUD_PRODUCT_MODEL.md` |
| Exit after cancellation | Cloud cancellation leads through paid-active and bounded grace/read-only states; reactivation, export, Cloud-to-Local migration and deletion remain distinct actions. | `docs/technical/DECISION_VAULT_STORAGE_AND_CLOUD_PRODUCT_MODEL.md`, F36 |
| Backend role | Mappm Cloud is required for Cloud Vault, multi-device, managed backup, sharing and managed intelligence; Local Vault remains useful without it. | `docs/technical/DECISION_VAULT_STORAGE_AND_CLOUD_PRODUCT_MODEL.md` |
| Data layer | Provider/exchangeable repositories separate Local authority from Cloud authority/cache and support verified migration both ways. | F1, F2, F10, F36 |
| Backend technology direction | Managed Cloud direction is ASP.NET Core, PostgreSQL, S3-compatible storage and OpenAPI/Microcks; Local Development Cloud is synthetic developer infrastructure. | `docs/technical/DECISION_HOME_HUB_BACKEND_TECHNOLOGY.md` |
| Sensitive data | Documents, metadata, OCR/LLM output, profiles and diagnostics are sensitive by default. | `docs/technical/DECISION_SECURITY_PRIVACY_MODEL.md` |
| AI/OCR/LLM | Core Assist is part of the sellable C2/C3 product; Advanced Assist remains later. Real processing waits for trust/provider/retention/AI gates. | `docs/technical/DECISION_INTELLIGENCE_SCOPE.md` |
| Identity trust | Every normal mode requires account/device trust with offline continuity; Detached Recovery remains account-independent; eIDAS/EUDI and ID Austria remain optional provider boundaries. | `docs/technical/DECISION_CLOUD_IDENTITY_DEVICE_TRUST.md`, REG-04 |
| Frontend/backend ownership | Frontend may describe backend needs, but backend/API owners decide contracts, DTOs, endpoints, mapping, persistence and policy architecture. | `.codex/skills/github-issue/SKILL.md`, `docs/ops/OPS-08_PROJECT_ENTRYPOINTS.md` |
| Demo/fake buildout | UI can be built before backend through fake repositories and synthetic demo content. | `docs/concepts/CONCEPT_F15_MOCK_REPOSITORY.md` |
| Customer self-hosting | Not active product scope; the former Home Hub exists only as superseded history. | Vault/Cloud decision, Cloud/Identity/Sync pillar |
| Capture and routing | Global capture is normal; analysis/matching always runs asynchronously; mixed sessions are split per logical document; Backend/Core Assist must propose titles and ranked Case/Record contexts; current routing is user-confirmed from a compact result. | `docs/technical/DECISION_CAPTURE_FIRST_ASSISTED_ROUTING.md` |
| Primary context | Every accepted document has a primary Case or Record. When no existing/guided Case or durable Record fits, a lightweight Custom Case may start with generated title, Managed Subject and one document. | Capture-first decision, Case/Record model |
| Case graph | There is one `Case` entity; `part_of`, `caused_by`, `follow_up_to` and `related_to` express composition, causality, successor chains and context without content ownership. | `docs/technical/DECISION_CASE_RELATIONSHIP_WORKFLOW_COMPOSITION.md` |
| Document taxonomy | Accepted minimum-sufficient principle: Mappm optimizes household findability/actionability, not granular classification. Base type, optional semantic variant, domain, Record kind, source/format and relationship role are separate axes. New types require durable later use or materially different behavior plus justified complexity; other detail remains broad/general type, title/alias, Fact, role or search vocabulary. The exact reduced catalog remains open in OQ-011. | `docs/technical/DECISION_DOCUMENT_TYPE_CATALOG.md` |
| Case/workflow catalog | Mappm has one generic Case. Die verlinkte Decision ist die alleinige SSOT fuer Workflow-Muster, Fachvorlagen-IDs, deutsche Titel, Status und Disposition; R0.6 prueft die offenen Katalogeintraege und Varianten. | `docs/technical/DECISION_INITIAL_CASE_WORKFLOW_CATALOG.md` |
| Case-family subconcepts | Every dedicated Case-family workshop creates or continues exactly one living owning family Decision; new files use `DECISION_<CASE_FAMILY>_MODEL.md`, while one unambiguous existing Decision may remain the owner. A catalog row alone creates no empty stub. The catalog SSOT owns ID/title/status/disposition/coverage, while the family Decision owns behavior and must be reviewed before acceptance, workflow selection, contract/schema work or implementation. Medical is fully covered; Tax has a preliminary owner; Accident/Damage is next. | `docs/technical/DECISION_INITIAL_CASE_WORKFLOW_CATALOG.md` |
| Medical Case model | Accepted 2026-07-20: neutral Care anchor, one `part_of` Cost Settlement per independent economic obligation and payer submissions as Claims. Medical matching is per document; continuity keeps the Care Case, while a new linked Case starts from one confirmed anchor document or explicit intent. M1 has no free Medical multi-document split. Cases remain valid with zero/one/many documents; payment, payer Claims and lifecycle are separate provenance-bearing states. Only confirmed social-insurance settlement/rejection suggests the normal supplementary-insurance step. Treatment authorizations and special forms remain generic Care documents/steps; special contractual benefits are not specialized or calculated in Medical M1. Recurrence is planning, not a Case type. OQ-012 is closed. The media archive remains a rare desktop action inside an existing confirmed Care Case. | `docs/technical/DECISION_MEDICAL_CARE_COST_SETTLEMENT_MODEL.md`, `docs/technical/DECISION_CASE_DOCUMENT_RECORD_MODEL.md`, `docs/technical/DECISION_DESKTOP_IMPORT_SCOPE.md` |
| Capture input and cross-device | Mobile supports native scan, photo, gallery and file/share import; Desktop supports picker, multi-file and drag-and-drop. Desktop-webcam document scans are prohibited. Mobile-to-desktop, Local-to-Local and macOS Continuity Camera are Draft-only under OQ-013; normal Desktop does not require a phone. | `docs/technical/DECISION_DOCUMENT_CAPTURE.md`, `docs/technical/DECISION_CROSS_DEVICE_CAPTURE_HANDOFF.md`, OQ-013 |

## Planning Consequence

The app may be built iteratively with fake repositories, but the roadmap must
keep Cloud, sync, backup, both provider migrations, cancellation/entitlements,
sharing, AI, compliance, store, CI/CD, support and commercial work visible from
the beginning.

## Open Review Areas

Open items are tracked in
`docs/discovery/OPEN_QUESTIONS_REGISTER.md`. They are not blockers for the
current reconciliation baseline, but they block affected implementation phases.
