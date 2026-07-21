---
name: contract-api
description: Use for Mappm Cloud API contract work, including Vaults, identity/device sessions, capture upload, sync, migration, entitlements, export/deletion, OpenAPI, Microcks, client/server handoffs, errors, and contract verification.
---

# Mappm Contract API

Use this skill for API boundaries and contract mocks.

Read:

- `docs/concepts/CONCEPT_F11_API_INTEGRATION.md`
- `docs/technical/DECISION_VAULT_STORAGE_AND_CLOUD_PRODUCT_MODEL.md`
- `docs/technical/DECISION_ACCOUNT_VAULT_ASSIST_PRODUCT_MODEL.md`
- `docs/technical/DECISION_CLOUD_IDENTITY_DEVICE_TRUST.md`
- `docs/technical/DECISION_HOME_HUB_BACKEND_TECHNOLOGY.md` (managed Cloud and
  Local Development Cloud rebaseline only)
- `docs/technical/DECISION_BACKEND_CONTRACT_FIRST_ARCHITECTURE.md`
- `docs/technical/DECISION_API_CONTRACT_MOCKS.md`
- `docs/concepts/CONCEPT_F17_MOBILE_CAPTURE_PLAN.md`
- `docs/technical/DECISION_CAPTURE_FIRST_ASSISTED_ROUTING.md`
- `docs/technical/DECISION_TEMPORAL_FACT_EVENT_AGENDA_MODEL.md`
- `docs/technical/DECISION_MEDICAL_CARE_COST_SETTLEMENT_MODEL.md` when a
  medical Assist, Case, Claim or workflow contract is affected
- `docs/concepts/CONCEPT_F4_TESTING_STRATEGY.md`

## Core Assumptions

- Client/domain architecture is backend-implementation-agnostic while Mappm
  Cloud is the managed product backend.
- Home Hub/Tailscale/customer self-hosting and QR server pairing are
  superseded. Local Development Cloud is developer-only and synthetic.
- Every normal Local and Cloud mode requires the accepted account/device and
  entitlement contract. Local Vault data remains local-authoritative; only
  account, entitlement and approved Assist operations cross service contracts.
- Detached Recovery has no service dependency and is not an anonymous normal
  onboarding mode.
- Documents and metadata are sensitive.
- API contracts use OpenAPI as the source of truth for HTTP boundaries.
- Microcks validates contracts before the real backend is complete.
- Do not plan Prism/WireMock as default fallbacks. Re-evaluate only if Microcks fails a concrete requirement.

## Contract Boundaries

Typical boundaries:

- service health/readiness for operations, never as customer server setup.
- account, device session, recovery and authorization.
- Vault, plan, entitlement, quota and read-only lifecycle.
- Mobile capture upload.
- capture batch/page/document manifests and partial results.
- asynchronous processing jobs, proposal versions and correction/idempotency.
- mandatory generated Document/Case/Record title with provenance. The accepted
  M1 exception is the contextual medical desktop media package, whose required
  title and optional examination date are user-entered.
- typed temporal proposals with semantic kind, precision, timezone, evidence,
  provenance and proposal/confirmation status; never one ambiguous document
  date.
- minimum-sufficient document classification: contracts keep base type,
  optional variant, Domain, Record kind, source/format and relationship role
  separate, but do not expose one DTO enum value per recognized fachlicher
  term. Preserve finer meaning through title, aliases/search, Facts, Parties,
  links or pack context unless the accepted product-value gate explicitly
  authorizes a stable type/variant.
- medical compound proposals preserve one Care anchor, one `part_of` Cost
  Settlement per independent economic obligation and payer submissions as
  Claims without exposing backend DTO ownership to Flutter. Later evidence is
  matched per document; a new linked Medical Case is created from one confirmed
  anchor document or explicit intent, not a free M1 multi-document split.
  Reopen remains an explicit reversible command. Case contracts allow zero,
  one or many documents without an `invalid` Case status. Contracts may carry user-selected payer
  category defaults but must never return inferred coverage or calculated
  expected benefits. Payment, payer Claims and Case lifecycle remain separate
  provenance-bearing states; only confirmed social-insurance result suggests
  the normal supplementary step. Special contractual benefits remain generic
  Insurance content in Medical M1.
- media-archive contracts preserve one immutable ZIP payload plus manifest,
  integrity, progress/resume and byte-identical export semantics; contained
  executables stay inert. Only the contextual desktop action inside an existing
  confirmed `medical_care` Case creates the archive; global capture,
  nonmedical Cases and Mobile M1 do not import it.
- primary/additional Case/Record/Claim/workflow candidates and visible
  confirmation semantics.
- Capture Inbox handoff.
- Sync status and conflict responses.
- Local-to-Cloud/Cloud-to-Local migration inventory, checkpoint and verification.
- export, Vault deletion and account deletion.
- Core Assist job submission/status/cancellation/deletion without implying
  Cloud Vault storage.

## Workflow

1. Identify the client/server boundary and primary product outcome.
2. Define request, response, status codes, retry behavior, and error mapping.
3. Define privacy/security constraints: authority, auth, token handling,
   redaction, file handling, payload limits, retention and idempotency.
4. Keep the contract backend-agnostic.
5. Plan fake client usage for app tests separately from Microcks contract tests.
6. Create/update GitHub Issues for actionable contract work.

## Output

For contract planning include:

- endpoint or operation name
- request/response fields
- error cases and retry behavior
- account/device-session and authorization requirements
- privacy constraints
- Microcks/mock scenario list
- client verification steps
- backend verification steps

Do not implement product UI here. Hand UI flows to `ui-architect`.
