---
title: "Mappm - Decision Interview Summary"
description: "Zusammenfassung der bisherigen Produktentscheidungen fuer den Playbook-Agent-Track"
tags: [discovery, decisions, product, playbook]
lastUpdated: "2026-07-08"
status: "accepted-baseline"
owner: "product-concept"
---

# Mappm - Decision Interview Summary

## Purpose

This summary closes the playbook discovery interview for the current
reconciliation baseline. It records what has already been discussed and where
future owner review is still required.

## Accepted Baseline Answers

| Area | Answer | Owning source |
|---|---|---|
| Product name | Product name is `Mappm`; DocMan remains technical repo/workspace name for now. | `docs/technical/DECISION_PRODUCT_NAME.md` |
| Product language | German user-facing language; `Case` in code maps to "Vorgang" in UI. | `docs/technical/DECISION_PRODUCT_LANGUAGE.md` |
| Product direction | Private-first, offline-capable and service-ready document management. | `docs/technical/DECISION_DATA_FLOW.md` |
| Backend role | Backend is not required for the earliest manual/local utility, but is required for sync, sharing, backup and useful OCR/LLM assistance. | `docs/technical/DECISION_BACKEND_ROLE.md`, `DECISION_INTELLIGENCE_SCOPE.md` |
| Data layer | Provider/exchangeable data layer is required so local-only, Home Hub and managed cloud variants remain possible. | `docs/technical/DECISION_TRUST_ENCRYPTION_DEPLOYMENT_MODEL.md` |
| Backend technology direction | Home Hub direction is ASP.NET Core, PostgreSQL, S3-compatible storage and OpenAPI/Microcks contracts. | `docs/technical/DECISION_HOME_HUB_BACKEND_TECHNOLOGY.md` |
| Sensitive data | Documents, metadata, OCR/LLM output, profiles and diagnostics are sensitive by default. | `docs/technical/DECISION_SECURITY_PRIVACY_MODEL.md` |
| AI/OCR/LLM | Not required for M2, but strategically central for M3 Assisted Review and likely service-backed for useful quality. | `docs/technical/DECISION_INTELLIGENCE_SCOPE.md` |
| Identity trust | eIDAS/EUDI and ID Austria are strategically relevant as later identity provider boundaries. | `docs/technical/DECISION_TRUST_ENCRYPTION_DEPLOYMENT_MODEL.md` |
| Frontend/backend ownership | Frontend may describe backend needs, but backend/API owners decide contracts, DTOs, endpoints, mapping, persistence and policy architecture. | `.codex/skills/github-issue/SKILL.md`, `docs/ops/OPS-08_PROJECT_ENTRYPOINTS.md` |
| Demo/fake buildout | UI can be built before backend through fake repositories and synthetic demo content. | `docs/concepts/CONCEPT_F15_MOCK_REPOSITORY.md` |

## Planning Consequence

The app may be built iteratively with fake repositories, but the roadmap must
keep cloud, sync, backup, sharing, AI, compliance, store, CI/CD, support and
commercial work visible from the beginning.

## Open Review Areas

Open items are tracked in
`docs/discovery/OPEN_QUESTIONS_REGISTER.md`. They are not blockers for the
current reconciliation baseline, but they block affected implementation phases.
