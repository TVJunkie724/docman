---
name: data-architect
description: Use when designing or planning Mappm data architecture, including Local/Cloud Vault authority, SQLite + Drift schemas, local file/cache boundaries, secure storage, provider migration, repository interfaces, stable IDs, fake/in-memory repositories, and retirement of legacy Isar/PocketBase persistence.
---

# Mappm Data Architect

Use this skill for data/storage architecture and implementation planning. Use `foundation-builder` for concrete foundation implementation and `quality-readiness` for tests/coverage.

Read:

- `.codex/skills/ui-onboarding/SKILL.md`
- `docs/technical/DECISION_LOCAL_DATABASE.md`
- `docs/concepts/CONCEPT_F10_LOCAL_STORAGE.md`
- `docs/concepts/CONCEPT_F12_SECURE_STORAGE.md`
- `docs/technical/DECISION_SECURITY_PRIVACY_MODEL.md`

## Target Direction

- SQLite + Drift for structured local metadata.
- Files/documents outside structured DB, referenced by stable file records.
- Secure Storage for secrets, tokens, device/session credentials, recovery
  material and encryption keys.
- Repository interfaces in Domain; implementations in Data.
- Sync-ready stable IDs and timestamps.
- No new Isar/PocketBase expansion.
- Local Vault metadata and files are authoritative on the device.
- Cloud Vault metadata and files are authoritative in Mappm Cloud; client
  storage is policy-limited cache plus durable pending operations.
- Local-to-Cloud and Cloud-to-Local migration use inventory, checkpoints,
  checksums, verification and source preservation.
- Normal Local and Cloud modes are account-based, but account/device state,
  Vault authority, Assist jobs and entitlements remain separate persisted
  concepts. Detached Recovery must preserve Local access without a live account.
- Model exactly one `Case` entity plus typed graph edges in `CaseLink`:
  `part_of`, `caused_by`, `follow_up_to`, `related_to`. Do not introduce a
  separate Subcase table or a strict `parentCaseId` target model. `part_of`
  must be acyclic; links do not imply cascade deletion or exclusive ownership.
- Keep lifecycle status, workflow stage, branch, Claim/submission, task, event,
  Record and Document relationships distinct. Stable many-to-many links must
  allow documents and Records to participate in multiple Cases without copies.
- Support manual, Assist-suggested and guided Case origins without changing
  the Case capability model.
- Do not add a required `caseType` enum. A Case may remain a lightweight named
  document/context collection; domain template and pinned workflow definition
  are optional references, and reusable workflow patterns need not be stored as
  an exclusive Case classification.
- Persist capture/session/document-unit/page/file manifests, explicit mobile
  document boundaries,
  processing/proposal versions, generated-title provenance, user corrections,
  partial batch status and explicit new-Case intent across restart/idempotency.
- Allow zero Case/Record links only while capture/review is pending. Accepted
  review has a primary Case or Record; lightweight Custom Cases may begin with
  title, subject and one document without fake tasks/workflow/outcome.
- Keep document base type, semantic variant, domain, Record kind, source/format
  and link role separate; relationship role is not one global Document field.
- Treat PersonProfile and OrganizationProfile as ManagedSubject variants while
  keeping account identity, ManagementGrant and ExternalParty separate.
- Model recurring contracts/subscriptions as durable Records with versions,
  cadence, invoices, confirmed facts, tasks and optional workflow context.
- Financial roll-up is derived, deduplicated by stable FinancialEntry identity
  and automatic only across eligible `part_of` links. Tax candidate/review
  status is not accounting truth or a deductibility fact.

## Design Checks

- Does each record make its Vault and authority unambiguous?
- Does Local mode remain available offline under bounded cached account/device
  state, without requiring a live network check at every launch?
- Can a Local Vault detach into account-independent Recovery without key loss,
  implicit upload or remote wipe?
- Is Assist job/payload state separate from Local/Cloud authority and backup?
- Does Cloud mode distinguish cache/pending state from Cloud confirmation?
- Are both migration directions resumable, verified and non-destructive?
- Are documents and metadata both treated as sensitive?
- Are secrets separated from normal DB tables?
- Can fake repositories implement the same contract?
- Can Drift tests run in memory or isolated temp storage?
- Are migrations explicit and reversible enough for C0/C1 data-safety gates?
- Does UI access data only through providers/domain repositories?
- Can Case links be added, changed and removed without moving, copying or
  deleting linked documents, Records, tasks or other Cases?
- Can `follow_up_to` form chains/branches without parent ownership or cascade?
- Can explicitly separated mobile documents and imported mixed batches
  split/merge/reassign while preserving original pages and accepted siblings
  after partial failure?
- Can reprocessing suggest a better title without overwriting a confirmed one?
- Can a custom umbrella Case be created from a selection of existing objects
  and later dissolved without data loss?
- Are recurring invoice matching, subject context, tax context and confirmed
  financial entries represented without turning document types into hidden
  workflow or accounting state machines?

## Planning Output

For data implementation plans include:

- entities/value objects affected
- Drift tables and indexes at conceptual level
- repository interface changes
- file store boundary
- secure storage boundary
- migration/legacy-retirement strategy
- Vault provider, cache, pending-operation and provider-migration strategy
- fake/in-memory test strategy
- verification and data-loss risk checks

Do not prescribe UI widgets. Hand UI surfaces to `ui-architect`.
