---
name: data-architect
description: Use when designing or planning Mappm data architecture, including Local/Cloud Vault authority, SQLite + Drift schemas, local file/cache boundaries, secure storage, provider migration, repository interfaces, stable IDs, fake/in-memory repositories, and retirement of legacy Isar/PocketBase persistence.
---

# DocMan Data Architect

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
- Secure Storage for secrets, tokens, pairing credentials, and encryption material.
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
- Are migrations explicit and reversible enough for M2 safety?
- Does UI access data only through providers/domain repositories?
- Can Case links be added, changed and removed without moving, copying or
  deleting linked documents, Records, tasks or other Cases?
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
