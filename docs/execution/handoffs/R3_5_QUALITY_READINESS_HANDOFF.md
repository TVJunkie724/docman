---
title: "Handoff R3.5 to Quality Readiness"
description: "Approval-gated handoff for the first playbook implementation-ready phase"
tags: [handoff, r3, quality, playbook]
lastUpdated: "2026-07-12"
status: "ready-for-user-approval"
owner: "project-bootstrap-runner"
---

# Handoff: R3.5 Target Path Quality Baseline -> quality-readiness

## 1. Status

Ready for explicit user/product-owner approval. Implementation has not started
and is not authorized by this handoff until the approval record below is filled.

Approval record: pending (`approvedBy`, `approvedAt`, and acceptance reference
must be recorded here before handoff execution).

## 2. Context

- Phase: `docs/roadmap/phases/R3_5_TARGET_PATH_QUALITY_BASELINE.md`.
- Roadmap: R3.5, M1 Foundation and Quality.
- Pillars: Quality Assurance; Developer Experience/Architecture Governance.
- Issue: #25.

## 3. Objective

Implement the deterministic target-path verification command defined by R3.5
without hiding the full-project legacy baseline.

## 4. Required Reading

- `.codex/skills/ui-onboarding/SKILL.md`.
- `.codex/skills/quality-readiness/SKILL.md`.
- `.codex/skills/frontend-test-coverage/SKILL.md`.
- F1, F3, F4, F15, F16 and OPS-08.
- the complete R3.5 phase contract and issue #25.

## 5. Scope

Exactly the scope and non-goals of R3.5. Do not add product UI, backend,
contracts, persistence migration, CI vendor setup or broad legacy cleanup.

## 6. Developer UX Contract

The command is exactly `./frontend.sh verify-target`, delegated to
`scripts/verify_target.sh`. It prints the fixed target list from R3.5, exits `0`
only when all checks pass, uses `1` for target-check failures and `2` for
preflight/invocation failures. User-facing app UX is not applicable.

## 7. Data / Contract Grounding

No product repository or API contract changes. Synthetic test data only.
Microcks is not applicable to this phase.

## 8. Security / Privacy / Trust

Do not print secrets, runtime env values or private document data. Do not use
real/anonymized household artifacts as fixtures.

## 9. Accessibility / Localization

App accessibility/localization is not directly applicable. Shell output must be
clear, stable and usable in local and future CI logs.

## 10. Tests / Verification

Run every command and pass/fail criterion in R3.5. Record full verify debt
separately. Verify a target violation produces a non-zero result.

## 11. Stop Rules

Stop on scope weakening, global analyzer suppression, hidden full-gate debt,
legacy expansion, unrelated formatting churn or any need for a product/backend
decision.

## 12. Open Questions

No implementation-design questions remain. Explicit user/product-owner approval
is still required. CI provider selection and full legacy cleanup remain outside
this phase.
