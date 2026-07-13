---
name: frontend-test-coverage
description: Design, review or extend production-ready Mappm frontend test coverage for Domain behavior, Riverpod providers, fake repositories, widgets, semantics, responsive/golden states, integration flows and Microcks contract consumers. Use when a phase, plan, issue, implementation or audit needs exact happy, unhappy and boundary-path coverage without real private data.
---

# Mappm Frontend Test Coverage

Read `ui-onboarding`, F4, F15, F16, MP-DS-06 and the affected phase/plan.
Coordinate repository-wide gates with `quality-readiness` and API tests with
`contract-api`.

## Coverage Model

- Domain/unit: invariants, value objects, policies and transitions.
- Riverpod/provider: loading/data/empty/error, cancellation, stale results and
  provider overrides through fake repositories.
- Repository/data consumer: mapping, persistence-facing behavior and failures;
  use in-memory/isolated storage only when the data owner approves it.
- Widget/semantics: visible states, actions, focus, labels, long German copy and
  text scaling.
- Golden/responsive: approved DS references and stable desktop/mobile sizes.
- Integration/smoke: critical user flow across approved local boundaries.
- Contract consumer: generated/manual client behavior against OpenAPI/Microcks.

## Required Scenario Matrix

For each applicable operation cover success, empty, loading, validation,
retryable/final failure, offline, permission denied, conflict/stale data,
cancellation, duplicate/idempotent action and unexpected redacted failure.
Document why any row is not applicable.

For Account/Vault/Assist work additionally cross Free/Paid entitlement, Local
and Cloud authority, bounded offline session, Assist quota/opt-out/manual
fallback and Detached Recovery. Tests must prove Assist processing never changes
Vault authority or implies backup.

## Fixture Rules

Use deterministic synthetic names, documents, IDs, clocks and files. Never use
real, anonymized or production-derived household documents, secrets, tokens,
addresses, medical facts or OCR text.

## Evidence Standard

Write assertions that can fail a wrong implementation. Name exact test files,
commands and expected results in plans/issues. Separate known legacy baseline
debt from regressions; new target-path work may not increase analyzer, format or
test debt.

## Stop Rules

Stop when coverage says only "add tests", when a fake diverges from the Domain
contract, when Microcks substitutes app tests, when tests depend on timing or
network without control, or when privacy/accessibility negative paths are absent.
