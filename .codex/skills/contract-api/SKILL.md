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
- `docs/technical/DECISION_INTELLIGENCE_SCOPE.md`
- `docs/technical/DECISION_TEMPORAL_FACT_EVENT_AGENDA_MODEL.md`
- `docs/technical/DECISION_MEDICAL_CARE_COST_SETTLEMENT_MODEL.md` when a
  medical Assist, Case, submission event or workflow contract is affected
- `docs/technical/DECISION_ACCIDENT_DAMAGE_SETTLEMENT_MODEL.md` when an
  accident, damage-cost, policy-match or insurance-settlement contract is affected
- `docs/technical/DECISION_INSURANCE_SETTLEMENT_MODEL.md` whenever an
  insurance Case, repeated submission/resubmission event, external reference
  or policy relation is affected
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
- optional capture-time user input for type/useful subtype, confirmed facts,
  Managed Subject, coarse routing and new/existing Case with user provenance;
  input never disables analysis and is not semantically policed by model
  output.
- mandatory generated Document/Case/Record title with provenance. The accepted
  M1 exception is the contextual medical desktop media package, whose required
  title and optional examination date are user-entered.
- OCR date candidates with source location plus product-defined
  type-relevant temporal fields carrying a semantic top proposal, alternatives,
  precision, timezone, provenance and confirmation status. The contract must
  support no-date/manual-entry fallback and never one silently finalized
  universal document date.
- minimum-sufficient document classification: contracts keep base type,
  optional variant, Domain, Record kind, source/format and relationship role
  separate, but do not expose one DTO enum value per recognized fachlicher
  term. Preserve finer meaning through title, aliases/search, Facts, Parties,
  links or pack context unless the accepted product-value gate explicitly
  authorizes a stable type/variant.
- medical compound proposals preserve one Care anchor and exactly one
  `part_of` Cost Settlement per independently issued invoice/honorarium note.
  Corrections, credits, payment proof and payer submissions/replies remain in
  that Cost Settlement as repeatable events/branches without exposing backend
  DTO ownership to Flutter. A submission event may reference zero, one or many
  documents; provider-app upload restrictions are overlays, not global
  cardinality. Later evidence is matched per document; a new linked Medical
  Case is created from one confirmed anchor document or explicit intent, not a
  free M1 multi-document split.
  Reopen remains an explicit reversible command. Case contracts allow zero,
  one or many documents without an `invalid` Case status. Contracts may carry user-selected payer
  category defaults but must never return inferred coverage or calculated
  expected benefits. Payment, payer submissions and Case lifecycle remain separate
  provenance-bearing states; only confirmed social-insurance result suggests
  the normal supplementary step. Special contractual benefits remain generic
  Insurance content in Medical M1.
- accident/damage compound proposals keep the event/regulation Case, optional
  independently tracked `part_of` Damage Cost Settlements, policy Record
  candidates, named image collections and normal `insurance_settlement` Cases
  that may contain several invoices and repeatable submission events. Pure
  medical-accident routing returns Medical Care without an empty accident
  wrapper. Contracts never merge Medical and Damage Cost Settlement or imply
  coverage/expected payment.
- media-archive contracts preserve one immutable ZIP payload plus manifest,
  integrity, progress/resume and byte-identical export semantics; contained
  executables stay inert. Only the contextual desktop action inside an existing
  confirmed `medical_care` Case creates the archive; global capture,
  nonmedical Cases and Mobile M1 do not import it.
- coarse primary Case/Record candidates and visible confirmation semantics;
  additional links/relations are optional best-effort outputs behind a named
  feasibility gate and always require user confirmation.
- current-release document boundaries use explicit Mobile completion and one
  Desktop file. Contracts do not return semantic invalidity,
  `separate_documents_required` or automatic segmentation for mixed content.
- no Claim DTO, endpoint, repository contract or matching target. External
  damage/claim numbers are Facts; submissions/resubmissions are events linked
  to normal Cases and Documents. Medical is accepted; OQ-014 blocks only
  Accident/Damage contract work until its requested family review is accepted.
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
