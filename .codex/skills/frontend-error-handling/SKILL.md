---
name: frontend-error-handling
description: Plan, review or debug Mappm frontend error behavior across Riverpod state, Domain Failure/Result boundaries, forms, offline flows, upload queues, fake repositories, Microcks consumers, user notifications, reference codes, logging and diagnostics. Use when a UI flow introduces loading, validation, retry, conflict, permission, network, storage, unexpected or support-visible failure behavior.
---

# Mappm Frontend Error Handling

Read `ui-onboarding`, F5, F7, F18 and the affected phase/decision before work.

## Error Contract

- Preserve Presentation -> Domain -> Data.
- Map SDK/HTTP/storage exceptions at Data boundaries; never expose raw
  exceptions to Presentation.
- Keep offline as a usable state when local product behavior can continue.
- Classify validation, local storage, secure storage, network, auth, upload,
  entitlement/quota, Assist processing, detached recovery, conflict,
  permission, parse and unexpected failures.
- For each failure define retryability, user action, persistence, cancellation,
  stale-result behavior and data-loss protection.

## User And Support Behavior

- Use German, actionable copy without stack traces, endpoints, private paths,
  tokens, document contents or OCR text.
- Use inline feedback for fields, banners/status for recoverable global state,
  dialogs only for blocking decisions and persistent surfaces for unresolved
  queued work.
- Provide a privacy-safe reference/operation code only when support can use it.
- Ensure keyboard focus moves to actionable feedback and semantics announce
  errors without duplicate noise.

## Fakes And Contracts

Fake repositories cover deterministic app behavior. Microcks covers API consumer
contracts. Test success, retryable, final, auth/reauthentication, bounded
offline session, Free/Paid quota, Assist opt-out/manual fallback, Detached
Recovery, malformed, conflict, permission and stale-response scenarios. Verify
that Assist failure never changes Vault authority. Frontend issue text may ask contract
questions but must create/link a Contract or Backend follow-up for server work.

## Verification

Require exact unit/provider/widget/semantics/contract assertions and a negative
privacy check. Verify that logs and diagnostics are redacted and that retry or
cancel cannot duplicate, lose or silently overwrite documents.

## Stop Rules

Stop if failure copy, retry classification, persistence, privacy, accessibility,
reference-code ownership or backend contract grounding is missing. Do not invent
server behavior in a frontend fix.
