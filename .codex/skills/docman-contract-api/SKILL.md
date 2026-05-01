---
name: docman-contract-api
description: Use for DocMan API contract work, including Home Hub, mobile capture upload, sync, auth/pairing, OpenAPI specs, Microcks or equivalent mock backend setup, client/server handoffs, request/response errors, and contract verification.
---

# DocMan Contract API

Use this skill for API boundaries and contract mocks.

Read:

- `docs/concepts/CONCEPT_F11_API_INTEGRATION.md`
- `docs/technical/DECISION_BACKEND_ROLE.md`
- `docs/technical/DECISION_DATA_FLOW.md`
- `docs/technical/DECISION_AUTH_PAIRING.md`
- `docs/technical/DECISION_PRIVACY_SYNC_SCOPE.md`
- `docs/concepts/CONCEPT_F17_MOBILE_CAPTURE_PLAN.md`
- `docs/concepts/CONCEPT_F4_TESTING_STRATEGY.md`

## Core Assumptions

- Product architecture is backend-agnostic.
- Home Hub/Tailscale may be the first self-hosted operating mode, not a hard product assumption.
- Cloud OAuth can come later; MVP pairing is QR first, manual code fallback.
- Documents and metadata are sensitive.
- API contracts should be machine-readable, preferably OpenAPI.
- Microcks or an equivalent mock backend validates contracts before the real backend is complete.

## Contract Boundaries

Typical boundaries:

- Home Hub health/status.
- Pairing session and device token.
- Mobile capture upload.
- Draft inbox handoff.
- Sync status and conflict responses.
- Later OCR/AI analysis handoff.

## Workflow

1. Identify the client/server boundary and primary product outcome.
2. Define request, response, status codes, retry behavior, and error mapping.
3. Define privacy/security constraints: auth, token handling, redaction, file handling, payload limits.
4. Keep the contract backend-agnostic.
5. Plan fake client usage for app tests separately from Microcks contract tests.
6. Create/update GitHub Issues for actionable contract work.

## Output

For contract planning include:

- endpoint or operation name
- request/response fields
- error cases and retry behavior
- auth/pairing requirements
- privacy constraints
- Microcks/mock scenario list
- client verification steps
- backend verification steps

Do not implement product UI here. Hand UI flows to `docman-ui-architect`.
