---
title: "Mappm - Decision Interview Summary"
description: "Zusammenfassung der bisherigen Produktentscheidungen fuer den Playbook-Agent-Track"
tags: [discovery, decisions, product, playbook]
lastUpdated: "2026-07-25"
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
| AI/OCR/LLM | Core Assist is part of the sellable C2/C3 product; Advanced Assist remains later. Small-/medium-model output is fallible but productively useful: supported document types/variants define a few review fields, Assist prefills semantic candidates, and the user confirms or corrects them once. Normal M1 corrections change user data only and are no consent to document donation, human review, training, online learning or fine-tuning. Real processing waits for trust/provider/retention/AI gates. | `docs/technical/DECISION_INTELLIGENCE_SCOPE.md`, `DECISION_ASSISTED_REVIEW_SUGGESTIONS.md` |
| Identity trust | Every normal mode requires account/device trust with offline continuity; Detached Recovery remains account-independent; eIDAS/EUDI and ID Austria remain optional provider boundaries. | `docs/technical/DECISION_CLOUD_IDENTITY_DEVICE_TRUST.md`, REG-04 |
| Frontend/backend ownership | Frontend may describe backend needs, but backend/API owners decide contracts, DTOs, endpoints, mapping, persistence and policy architecture. | `.codex/skills/github-issue/SKILL.md`, `docs/ops/OPS-08_PROJECT_ENTRYPOINTS.md` |
| Demo/fake buildout | UI can be built before backend through fake repositories and synthetic demo content. | `docs/concepts/CONCEPT_F15_MOCK_REPOSITORY.md` |
| Customer self-hosting | Not active product scope; the former Home Hub exists only as superseded history. | Vault/Cloud decision, Cloud/Identity/Sync pillar |
| Capture and routing | Global capture starts in a visible Managed-Subject context; small-/medium-model Assist provides OCR, coarse classification, simple candidates and progressive Case-/Record ranking; sessions contain explicit logical documents and multi-file items are processed separately; Mobile page editing happens locally before document close and queue/upload; a mixed PDF is not semantically invalidated/rejected or automatically split; users may optionally provide known type/useful subtype, confirmed facts, coarse routing, new-Case intent or an existing Case without a general form; Backend/Core Assist preserves user provenance and proposes conservative date-free titles plus ranked contexts; routing and optional relations are user-confirmed. | `docs/technical/DECISION_INTELLIGENCE_SCOPE.md`, `DECISION_CAPTURE_FIRST_ASSISTED_ROUTING.md`, `DECISION_DOCUMENT_CAPTURE.md`, `docs/concepts/CONCEPT_F38_ASYNC_PROCESSING_WAIT_EXPERIENCE.md` |
| Assisted metadata review | The review is a compact prefilled form, not a metadata questionnaire. Product/Document Concept defines the few relevant fields per supported type/variant. A date field shows the semantic top candidate, detected alternatives, `Kein Datum` and manual entry; additional detected dates remain under optional details. No proposed meaning creates a task, deadline, reminder or workflow state before the bundled user confirmation. | `docs/technical/DECISION_ASSISTED_REVIEW_SUGGESTIONS.md`, `DECISION_TEMPORAL_FACT_EVENT_AGENDA_MODEL.md`, F29/F30 |
| Primary context | Every accepted document has a primary Case or Record. When no existing/guided Case or durable Record fits, a lightweight Custom Case may start with generated title, Managed Subject and one document. | Capture-first decision, Case/Record model |
| Case graph | There is one `Case` entity; `part_of`, `caused_by`, `follow_up_to` and `related_to` express composition, causality, successor chains and context without content ownership. | `docs/technical/DECISION_CASE_RELATIONSHIP_WORKFLOW_COMPOSITION.md` |
| Document taxonomy | Accepted permanent minimum-sufficient principle: Mappm optimizes household findability/actionability, but minimum sufficient is neither a subtype ban nor a target to minimize subtype count. Base type, semantic variant, domain, Record kind, source/format and relationship role are separate axes. Useful types/variants stay when they provide durable reuse or materially different behavior; details otherwise remain generated title, Facts, Parties, role and search vocabulary. Provider, country, year and state stay separate. The reviewed external candidates retain invoice, payment proof/receipt, contract, pay statement, account statement, credential/identity and likely sick-note value while generic information/letter remain fallback; advertising is excluded. Cards/passes are deferred to a later Wallet slice, with bank cards behind a separate Security gate. The remaining catalog is open in OQ-011 and grows case-family by case-family. | `docs/technical/DECISION_DOCUMENT_TYPE_CATALOG.md` |
| Case/workflow catalog | Mappm has one generic Case. Die verlinkte Decision ist die alleinige SSOT fuer Workflow-Muster, Fachvorlagen-IDs, deutsche Titel, Status und Disposition; R0.6 prueft die offenen Katalogeintraege und Varianten. | `docs/technical/DECISION_INITIAL_CASE_WORKFLOW_CATALOG.md` |
| Case-family subconcepts | A dedicated Case-family workshop remains discussion-only until the complete result is summarized in chat and the user explicitly approves documentation. Only then is exactly one owning family Decision created/continued and registered; no Draft/workshop stub is created beforehand. New files use `DECISION_<CASE_FAMILY>_MODEL.md`, while one unambiguous existing Decision may remain the owner. The catalog owns ID/title/status/disposition/coverage; the family Decision owns approved behavior and is required before acceptance, workflow selection, contract/schema work or implementation. Medical, Accident/Damage and Insurance Settlement have owners; Medical is accepted, while Accident/Damage retains its requested re-review under OQ-014. | `docs/technical/DECISION_INITIAL_CASE_WORKFLOW_CATALOG.md` |
| Insurance settlement model | Accepted 2026-07-22: Mappm has no Claim entity or Claim matching. A concrete insurance handling context is a normal `insurance_settlement` Case, normally one per insurer and coherent handling context. It may contain multiple invoices and repeated submission/resubmission events. A policy remains a Record, the insurer an ExternalParty and external damage/business numbers are Facts. No Case is created merely from a possible policy match or per invoice/submission. | `docs/technical/DECISION_INSURANCE_SETTLEMENT_MODEL.md` |
| Medical Case model | Accepted through 2026-07-24: neutral Care anchor and exactly one `part_of` Cost Settlement per independently issued invoice/honorarium note. Corrections, credits, payment proof and repeatable payer submission/response events stay in that Cost Case; an event may reference zero/one/many documents. Medical matching is per document; M1 has no free Medical multi-document split. Cases remain valid with zero/one/many documents; payment, every payer track, independent deadlines, household-finance facts and lifecycle states remain separate. Care closes manually and may be done while Cost remains active; Cost completion is always user-confirmed after all actually started payer paths are terminal or deliberately ended. Typical contents are optional suggestions, never requirements. There are no Claims or Subcase entities. OQ-012 and the Medical part of OQ-014 are resolved. | `docs/technical/DECISION_MEDICAL_CARE_COST_SETTLEMENT_MODEL.md`, `docs/technical/DECISION_RULE_DERIVED_DEADLINES_REMINDERS.md`, `docs/technical/DECISION_AUSTRIA_MEDICAL_PAYER_RULE_PACK.md`, `docs/technical/DECISION_CASE_DOCUMENT_RECORD_MODEL.md`, `docs/technical/DECISION_DESKTOP_IMPORT_SCOPE.md` |
| Accident/Damage Case model | Baseline documented from 2026-07-21 and corrected 2026-07-22: one accident/damage context with only coarse optional variants; `Medizinischer Unfall` routes directly to `medical_care`; an insurance handling context is a normal linked Case with repeated submission events; damage-cost Cases are optional for independently tracked obligations; named image collections group original photos; policy matching never proves coverage. OQ-014 requires the requested family re-review before implementation. | `docs/technical/DECISION_ACCIDENT_DAMAGE_SETTLEMENT_MODEL.md`, `docs/technical/DECISION_INSURANCE_SETTLEMENT_MODEL.md` |
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
