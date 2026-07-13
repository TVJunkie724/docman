---
title: "Mappm - Concept Enterprise Quality Contract"
description: "Verbindlicher Mindestvertrag fuer bestehende Mappm F-Konzepte"
tags: [concept, governance, quality, production-readiness]
lastUpdated: "2026-07-12"
status: "accepted"
owner: "ui-concept"
---

# Mappm - Concept Enterprise Quality Contract

## Status And Applicability

Accepted. Every `docs/concepts/CONCEPT_F*.md` file explicitly adopting this
contract must satisfy this contract in addition to its domain-specific content.
The concept's own status remains authoritative; adoption does not promote a
draft concept to accepted.

## Required Interpretation

### Product Operating Baseline

Every F-concept also inherits:

- `docs/technical/DECISION_COMMERCIAL_CORE_SCOPE.md`.
- `docs/technical/DECISION_VAULT_STORAGE_AND_CLOUD_PRODUCT_MODEL.md`.
- `docs/concepts/CONCEPT_F36_VAULT_MODES_CLOUD_LIFECYCLE.md`.

Conflicting statements that make Mappm universally local-first, make a customer
Home Hub/self-hosted deployment the product direction, or treat Cloud as a
later generic sync toggle are superseded. An affected phase must distinguish
Local Vault authority, Cloud Vault authority, local availability, pending
operations, entitlement/grace and migration state. Concepts outside that scope
mark the details not directly applicable but may not contradict the baseline.

- The concept's purpose and normative rules define its scope.
- Anything not named in scope is out of scope; downstream phases may not infer
  product behavior from silence.
- Deferred work must remain in the roadmap or an owning GitHub Issue.
- `ui-concept` owns frontend/product concepts; `foundation-builder`,
  `quality-readiness`, `data-architect` or `contract-api` owns a concept when its
  subject is primarily technical.
- User, admin, developer and support behavior is applicable only where the
  concept exposes such behavior. Otherwise it is explicitly not applicable at
  concept level and must be resolved by the affected phase.
- Documents, metadata, OCR/LLM output, profile data, secrets and diagnostics are
  sensitive by default. A concept may narrow this only through an accepted
  security/privacy decision.
- UI-facing concepts require German copy, keyboard and semantics expectations,
  text scaling, contrast, reduced-motion treatment and desktop/mobile behavior.
  Non-UI concepts mark accessibility/localization as not directly applicable,
  but may not prevent downstream compliance.
- Logging and diagnostics must use redaction, stable error/reference codes and
  synthetic evidence. No private document data is valid test evidence.
- Verification must be falsifiable in the owning phase through named unit,
  provider/repository, widget/semantics/golden, contract/Microcks or manual
  checks. "Tested" without assertions is not evidence.
- Cloud cancellation, quota or payment failure may never remove export,
  Cloud-to-Local migration or legally required access/delete behavior.
- Local Development Cloud, Microcks, shared Development, Staging and Production
  are distinct environments and may contain only data allowed by their policy.

## Universal Stop Rules

Stop and return to the owning concept or decision when:

- scope, owner, dependency, source of truth or normative status is ambiguous.
- a phase needs behavior that the concept does not define.
- a phase uses old Home-Hub/local-first product assumptions without an explicit
  historical/development-only classification.
- frontend work decides backend contracts, DTOs, endpoints, mapping,
  persistence or policy architecture.
- sensitive data can enter logs, fixtures, screenshots, analytics or support
  packages without an accepted boundary.
- a UI phase lacks accessibility, localization, responsive or failure states.
- verification cannot distinguish a correct implementation from an incorrect
  one.

## Required Handoff

The next handoff is selected by ownership:

- UI/product behavior: `ui-architect` after concept and plan review.
- foundation: `foundation-builder`.
- data/storage: `data-architect`.
- contracts/API: `contract-api`.
- tests/readiness/CI: `quality-readiness`.

No builder receives a concept directly when an architect or specialist plan is
required.
