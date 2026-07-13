---
title: "Mappm - Decision Interview Summary"
description: "Zusammenfassung der bisherigen Produktentscheidungen fuer den Playbook-Agent-Track"
tags: [discovery, decisions, product, playbook]
lastUpdated: "2026-07-12"
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

## Planning Consequence

The app may be built iteratively with fake repositories, but the roadmap must
keep Cloud, sync, backup, both provider migrations, cancellation/entitlements,
sharing, AI, compliance, store, CI/CD, support and commercial work visible from
the beginning.

## Open Review Areas

Open items are tracked in
`docs/discovery/OPEN_QUESTIONS_REGISTER.md`. They are not blockers for the
current reconciliation baseline, but they block affected implementation phases.
