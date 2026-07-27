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
- `docs/technical/DECISION_TEMPORAL_FACT_EVENT_AGENDA_MODEL.md`
- `docs/technical/DECISION_DOCUMENT_TYPE_CATALOG.md`
- `docs/technical/DECISION_MEDICAL_CARE_COST_SETTLEMENT_MODEL.md` when
  medical Care/Cost/submission persistence is affected
- `docs/technical/DECISION_ACCIDENT_DAMAGE_SETTLEMENT_MODEL.md` when accident,
  damage-cost, policy or insurance-settlement persistence is affected
- `docs/technical/DECISION_INSURANCE_SETTLEMENT_MODEL.md` whenever insurance,
  submission/resubmission, external damage references or policy links are in
  scope

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
- Keep lifecycle status, workflow stage, branch, submission, task, event,
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
  processing/proposal versions, generated-title provenance, optional
  capture-time type/subtype/fact/subject/new-or-existing-Case user input,
  user corrections, partial batch status and intent across restart/idempotency.
- Treat explicit Mobile completion and one Desktop file as authoritative
  logical document boundaries in the current release. Mixed semantic content
  does not create an `invalid` document or `separate_documents_required`.
  Page-coherence warnings and segmentation require a separate later contract.
- Allow zero Case/Record links only while capture/review is pending. Accepted
  review has a primary Case or Record; lightweight Custom Cases may begin with
  title, subject and optionally one document without fake
  tasks/workflow/outcome. A persisted Case itself is always valid with zero,
  one or many documents; do not add an `invalid` Case state or document-set
  invariant.
- Keep document base type, semantic variant, domain, Record kind, source/format
  and link role separate; relationship role is not one global Document field.
- Preserve minimum sufficient classification in schemas and repositories. Do
  not add an enum value/table/DTO subtype for every recognized document term or
  Case scenario. Prefer broad/general type plus title/alias, Fact, Party,
  relationship role, Record kind or source/format unless the accepted
  product-value gate proves durable later use or materially different behavior.
- Treat PersonProfile and OrganizationProfile as ManagedSubject variants while
  keeping account identity, ManagementGrant and ExternalParty separate.
- Model recurring contracts/subscriptions as durable Records with versions,
  cadence, invoices, confirmed facts, tasks and optional workflow context.
- Financial roll-up is derived, deduplicated by stable FinancialEntry identity
  and automatic only across eligible `part_of` links. Tax candidate/review
  status is not accounting truth or a deductibility fact.
- Keep technical timestamps separate from typed temporal facts, events,
  appointments, deadlines, tasks, expected responses and reminders. Preserve
  date-only values, partial precision, intervals, IANA timezone, provenance,
  proposal/confirmation state and correction history without one universal
  `documentDate`.
- Mappm has no Claim entity, table, repository or matching target. A concrete
  insurance handling context is a normal `insurance_settlement` Case;
  submissions/resubmissions are repeatable Events/steps with document links,
  external references are Facts, insurers are ExternalParties and policies are
  Records.
- The current Medical baseline uses normal Case/CaseLink/Document/Fact/Event
  structures: one
  neutral Care Case, one `part_of` Cost Settlement Case per independent
  economic obligation and payer submissions as repeatable events/branches. Do not create Medical
  or Subcase storage silos. Later care evidence is matched per document. A new
  linked Medical Case starts from one anchor document or explicit intent; do
  not model a free M1 multi-document split command. Recurrence is optional
  planning, not a Case type. Store multiple payer relationships and
  at most one explicit default per accepted category without encoding coverage
  or benefit calculations. Keep payment, each payer-submission path and Case lifecycle as
  separate provenance-bearing state dimensions. Special contractual benefits
  remain generic Insurance content in Medical M1.
- The current Accident/Damage baseline uses the same generic primitives: one
  `accident_or_damage_settlement` per confirmed event/discovery and regulation
  context, optional `part_of` `damage_cost_settlement` per independently
  tracked damage obligation, normal `insurance_settlement` Cases able to
  reference several invoices/cost Cases, repeatable submission events, named
  image collections over immutable originals, and policies as Records.
  `Medizinischer Unfall` maps directly to `medical_care`; add an accident Case
  and `caused_by` only when nonmedical regulation becomes independently
  relevant. Do not merge Medical and Damage Cost Settlement or encode policy
  matching as confirmed coverage. Medical is accepted; OQ-014 blocks only
  Accident/Damage schema work until its requested family review is accepted.
- Preserve Case completion/reopen history. `done`/`archived` Cases remain
  matchable; linking late evidence does not itself reopen them.
- The M1 media/folder archive is created only by the rare desktop action inside
  an existing confirmed `medical_care` Case. It is one immutable ZIP
  `FileRecord` plus manifest behind normal Document/File ports, with a manual
  title and optional examination date. Preserve contained executables as inert
  bytes, never execute/extract them automatically, and return the stored ZIP
  byte-identically. Do not expose global/nonmedical/mobile import or introduce
  a DICOM entity silo.

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
- Can explicitly separated mobile documents and imported files retain their
  authoritative logical boundaries, originals and accepted siblings after
  partial failure without semantic invalidation? Treat later coherence
  warnings/file segmentation as a separate approved contract, not as a
  current-release assumption.
- Can reprocessing suggest a better title without overwriting a confirmed one?
- Can a custom umbrella Case be created from a selection of existing objects
  and later dissolved without data loss?
- Are recurring invoice matching, subject context, tax context and confirmed
  financial entries represented without turning document types into hidden
  workflow or accounting state machines?
- Can one document retain several differently typed dates without inventing a
  primary event date, and can date-only/partial/zoned values round-trip without
  precision or timezone loss?

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
