---
name: github-issue
description: Use when creating, classifying, triaging, or updating GitHub Issues for DocMan/Mappm, including bugs, feature requests, epics, frontend/backend/API handoffs, documentation/foundation work, labels, milestones, native dependencies, and replacing markdown-only trackers. GitHub Issues are the source of truth for actionable bugs, feature requests, epics, and implementation handoffs.
---

# GitHub Issue - DocMan / Mappm

GitHub Issues are the source of truth for actionable DocMan/Mappm bugs,
feature requests, epics, and implementation handoffs. Do **not** create new
markdown FR/bug tracker files when an issue is the right artifact.

The target for every issue is **enterprise-grade + production-ready**. The
issue body must make that target executable for the next agent through exact
scope, contracts, tests, error handling, verification, dependencies, and done
criteria.

Do not use GitHub Issues to replace accepted decisions. Decisions belong in
`docs/technical/DECISION_*.md`; issues track follow-up work after a decision is
made.

## Required Repository

Default repo:

```bash
TVJunkie724/docman
```

Before creating or editing issues, verify GitHub auth and repo access:

```bash
gh auth status
gh repo view TVJunkie724/docman --json nameWithOwner
```

## Cross-Skill Body Authoring

GitHub Issues are the tracker source of truth, but the body must still be
written with the specialist skill that owns the work quality.

Use the relevant DocMan skill while drafting or reviewing the issue body:

| Work type | Skill to apply |
|---|---|
| UI/frontend concept, phase, roadmap, design-system, form-family, mock, UX issue | `ui-concept` or `ui-architect` as appropriate |
| UI implementation or audit follow-up | `ui-builder`, `ui-auditor`, or `ui-audit-review` as appropriate |
| Backend/API/OpenAPI/Home Hub/Sync/Capture contract work | `contract-api` |
| Foundation/Riverpod/Drift/bootstrap/secure boundaries | `foundation-builder` |
| Data/storage/schema/repository architecture | `data-architect` |
| Quality/readiness/tests/fakes/fixtures/CI | `quality-readiness` |
| Whole-product strategy/roadmap/decisions | `product-concept` |

Do not create a soft issue that only says "plan", "make responsive",
"improve UX", "add tests", "update docs", or "wire this up". First enrich the
body through the owning skill until it is executable.

## Required Owner Prefix

Every new or substantially updated issue title must start with exactly one
owner prefix:

| Prefix | Use for |
|---|---|
| `Frontend:` | Flutter UI, shell/navigation, frontend state, frontend repositories, generated/client consumption, fake/Microcks consumer fixtures, visual/UX behavior, frontend-owned tests |
| `Backend:` | Home Hub/server/API implementation, persistence, sync runtime, backend security, backend-owned tests, backend contract provider work |
| `Contract:` | OpenAPI/Microcks/API contract source-of-truth work that does not itself implement frontend or backend runtime |
| `Foundation:` | Riverpod foundation, repository interfaces, local storage boundaries, bootstrap, codegen, architecture cleanup |
| `Quality:` | test infrastructure, fixtures, analyzer/format debt, CI, production-readiness gates |
| `Docs:` | documentation/process-only work, accepted decision follow-up, roadmap/pillar/phase hygiene |
| `Epic:` | tracking/coordination issue that groups implementation issues and does not own implementation itself |

Do not use legacy prefixes such as `UI_`, `B_`, `FR_`, `BUG_`, or mixed
prefixes such as `Frontend/Backend:`. The prefix is an ownership and handoff
signal, not a replacement for labels.

## Non-Mixed Implementation Issue Rule

Frontend and backend implementation work must not share one implementation
issue.

Binding rules:

- A `Backend:` issue owns backend/API/persistence/runtime work only.
- A `Frontend:` issue owns Flutter/client/fake/Microcks consumer/UI work only.
- A `Contract:` issue may own OpenAPI/Microcks contract definitions, but if
  implementing the provider and consumer also requires code changes, create
  linked `Backend:` and `Frontend:` follow-up issues.
- Do not put both `layer:frontend` and `layer:backend` on the same
  implementation issue.
- If backend and frontend both need implementation changes, create separate
  issues and link them with native GitHub dependencies.
- Every backend issue that creates, changes, decides, or exposes a
  frontend-consumed contract must have a linked frontend or contract follow-up
  before the backend issue is tracker-complete.
- Frontend may describe backend needs from the UI, client, fake repository,
  Microcks consumer, or user-flow perspective, but must not decide backend
  contracts, DTOs, endpoint shapes, mapping rules, persistence design, sync
  semantics, authorization policy architecture, or server-side processing
  architecture. The backend team or the owning backend/contract/security skill
  decides contracts, DTOs, endpoints, mapping, persistence, policy architecture,
  and server-side processing.
- A `Frontend:` issue that needs backend capability must phrase it as a
  requirement or open contract question, then create or link a `Backend:` or
  `Contract:` follow-up. It must not smuggle backend implementation design into
  acceptance criteria.

This rule is stricter than convenience. Even when the work feels small, do not
create mixed frontend/backend implementation issues.

## Issue Types

Use exactly one type label:

| Situation | Label |
|---|---|
| Existing behavior is broken, blocked, unsafe, inconsistent with accepted docs, or blocks the planned foundation | `type:bug` |
| New capability, planned product work, refactoring work, documentation cleanup, architecture/foundation task, or handoff work | `type:feature-request` |
| Tracking issue that groups related implementation issues without owning implementation itself | `type:epic` |

If unsure: if DocMan already promises or depends on the behavior, create a bug.
If it adds or plans capability, create a feature request. If it coordinates a
workstream, create an epic.

If `type:epic` does not exist yet in the repository, create or request it
before creating a real epic; do not silently downgrade epics to feature
requests.

## Required Labels

Every issue must have:

- one `type:*`
- exactly one lifecycle label, usually `status:open`
- at least one `area:*`
- at least one `layer:*`
- `scope:cross-cutting` when the issue spans multiple pillars, governance
  boundaries, shared infrastructure, or repository-wide standards
- bug: one `severity:*`
- feature request or epic: one `priority:*`

Do not invent labels unless you have verified they exist or the user has asked
you to create them. If labels or milestones are missing, report that clearly
and ask whether to create them or proceed with available metadata.

## Area Labels

Use all that apply:

| Label | Meaning |
|---|---|
| `area:foundation` | Technical foundation, architecture decisions, project cleanup, R2/R3 |
| `area:cases` | Cases/Vorgaenge, workflows, status, tasks |
| `area:documents` | Documents, metadata, upload, versioning, viewer, draft inbox |
| `area:capture` | Mobile capture, scan flow, batch scan, draft intake |
| `area:profiles` | Family profiles, household model, permissions |
| `area:auth` | Login, identity providers, pairing, sessions, secure token storage |
| `area:sync` | Local/private/cloud sync, conflicts, replication, remote storage |
| `area:ai-analysis` | OCR, LLM, auto-tagging, status suggestions, future intelligence |
| `area:frontend` | Flutter screens, navigation, widgets, UX implementation |
| `area:design-system` | Theme, tokens, shared widgets, visual system |
| `area:security` | Privacy, secrets, auth hardening, sensitive data handling |
| `area:distribution` | App store, packaging, signing, legal/public distribution |
| `area:docs` | Documentation-only work |
| `area:quality` | Test coverage, fake repositories, analyzer/format debt, CI quality gates |
| `area:api-contracts` | OpenAPI, Microcks, contract mocks, Home Hub/Capture/Sync API boundaries |
| `area:data-storage` | Drift, SQLite, file store, local migrations, legacy persistence retirement |
| `area:platform` | Cross-cutting infrastructure that does not fit one product area |

For issues that affect multiple product pillars, apply every relevant
`area:*` label and add `scope:cross-cutting`. Choose the milestone for the
primary product outcome.

## Layer Labels

Use all that apply, within the non-mixed implementation rule:

| Label | Meaning |
|---|---|
| `layer:frontend` | Flutter UI/client behavior |
| `layer:domain` | Entities, repository interfaces, use cases, workflows |
| `layer:data` | Drift, SQLite, file store, persistence, storage, legacy adapters, sync data |
| `layer:backend` | Home Hub/server work, API handling, backend configuration |
| `layer:sync` | Replication, conflict handling, offline queue, sync status |
| `layer:tests` | Test infrastructure, fake fixtures, contract-test harnesses, QA evidence |
| `layer:docs` | Documentation/process-only work |
| `layer:platform` | Tooling, config, CI/CD, packaging, repo setup |
| `layer:security` | Auth, secrets, privacy, sensitive-data controls |
| `layer:api` | OpenAPI, client/server contract, request/response behavior, Microcks mocks |

Important:

- Do not put `layer:frontend` and `layer:backend` on the same implementation
  issue.
- Use `layer:tests` only when the issue directly owns test infrastructure,
  contract-test harnesses, generated-client verification fixtures,
  fake/Microcks scenario foundations, or test-only remediation. Do not add it
  merely because an implementation issue contains mandatory verification.

## Priority And Severity

For feature requests and epics, use one:

- `priority:high`
- `priority:medium`
- `priority:low`

For bugs, use one:

- `severity:critical` - data loss, security issue, app cannot start, login
  completely blocked, or private data exposed
- `severity:high` - important user flow blocked or serious readiness risk
- `severity:medium` - degraded behavior with workaround or limited blast radius
- `severity:low` - polish, flaky/non-blocking test, minor inconsistency

## Milestones

Milestones represent product workstreams, not implementation layers.

Use one milestone:

| Milestone | Use for |
|---|---|
| `Mappm M1 Foundation and Quality` | R0-R3 decisions, documentation cleanup, technical foundation, quality readiness |
| `Mappm M2 Capture and Review Core` | Capture, draft inbox, review, documents, cases, search, tasks |
| `Mappm M3 Assisted Review` | OCR/text extraction, metadata suggestions, review of suggestions |
| `Mappm M4 Household and Sync` | Household profiles, pairing, Home Hub, sync, extended mobile |
| `Mappm M5 Facts, Workflows and Insights` | Facts, claims, workflows, insights, external actions |
| `Mappm M6 Automation, Resilience and Distribution` | Backup, restore, compliance, release, sharing, local LLMs, operations |

For deferred or explicitly later work, use the milestone that owns the future
product outcome instead of a generic `post-mvp` label. If the work is not yet
milestone-ready, say so in the issue body and keep the issue out of active
execution views until the milestone decision is made.

## Enterprise-Grade Issue Contract

Every issue is a handoff contract for the next agent. It must be clear enough
that an implementing agent can start immediately and reach the production-ready
target without asking follow-up questions.

An issue is executable only when it includes, where applicable:

| Area | Required content |
|---|---|
| Goal | One concrete target outcome, not a theme or vague direction |
| Boundary | Owning pillar, layer, files/contracts/models/UI surfaces, and out-of-scope work |
| Evidence | Current behavior, logs, files, endpoints, concepts, screenshots, observed responses, or source docs |
| Contract | Exact request/response fields, DTO names, enum values, defaults, client impact, backward compatibility |
| UX | Exact visible copy, empty/loading/error/success states, disabled states, accessibility and localization expectations |
| Error handling | Exact status codes, ProblemDetails shape, reference/error code policy, retry/no-retry behavior, leakage prohibition |
| Security/privacy | AuthN/AuthZ, household/profile denial, PII/secrets/token handling, admin-only gates, diagnostics hygiene |
| Data/state | Persistence, migration/defaulting, idempotency, side effects, cache invalidation, stale/legacy handling |
| Tests | Unit/integration/widget/golden/Microcks/contract tests with exact assertions and negative paths |
| Verification | Exact commands or smoke checks, expected pass result, contract/mock/client regeneration gates |
| Dependencies | Native GitHub blockers when explicit and unambiguous |
| Done boundary | What closes the issue, what remains out of scope, and acceptable residual risk |

Weak criteria are not allowed when the expected outcome can be stated. Do not
write only `works`, `handled`, `validated`, `tested`, `no crash`,
`NotBeNull`, `NotBeEmpty`, `>= 0`, or `returns something`. Replace them with
the exact observable outcome.

Contract precision is required only inside the correct ownership boundary.
Frontend-authored issues may specify required client behavior, user-visible
states, fake repository scenarios, and contract questions, but must leave
backend-owned DTOs, endpoints, mapping, persistence, policy architecture, and
server processing decisions to `Backend:`, `Contract:`, `Foundation:`, or
security-owned follow-up work.

## Implementation Decision Required

The issue may leave something open only when the implementing backend,
architecture, domain, or UI agent genuinely must make a design decision that
cannot be decided from current context.

Use this section:

```markdown
## Implementation Decision Required

- Decision owner:
- Decision to make:
- Allowed options:
- Forbidden options:
- Minimum acceptance criteria regardless of option:
- Tests that must prove the chosen option:
```

Do not hide uncertainty behind vague phrases like "as needed", "if necessary",
"validate properly", "handle gracefully", "wire this up", or "make it
production-ready". If a decision is required, name it. If no decision is
required, choose the exact expected behavior in the issue.

## Issue Body Templates

### Bug

```markdown
## Problem

## Evidence / Logs

## Expected Behavior

## Suspected Boundary

## Non-Goals

## Acceptance Criteria
- [ ] ...

## Test Coverage
- [ ] Unit:
- [ ] Integration/contract:
- [ ] Widget/golden/E2E:
- [ ] Negative paths:

## Error Handling
- [ ] ...

## Verification
- [ ] Exact command or smoke check
```

### Feature Request

```markdown
## Decision / Desired Capability

## Context

## Scope

## Non-Goals

## Contract / Data / UX Details

## Test Coverage
- [ ] Unit:
- [ ] Integration/contract:
- [ ] Widget/golden/E2E:
- [ ] Negative paths:

## Error Handling
- [ ] ...

## Acceptance Criteria
- [ ] ...

## Verification
- [ ] ...
```

### Epic / Tracking

```markdown
## Summary

## Issue Map
- #123 - Foundation: ...
- #124 - Frontend: ...

## Scope

## Non-Goals

## Acceptance Criteria
- [ ] Every grouped issue has correct owner prefix, labels, milestone, and native blockers where required.
- [ ] The epic does not own mixed implementation work.

## Verification
- [ ] Issue labels, title prefixes, milestone, and blockers were verified.
```

## Creation Workflow

1. Search for duplicates:

```bash
gh issue list \
  --repo TVJunkie724/docman \
  --state all \
  --search "keywords in:title,body" \
  --json number,title,state,labels,milestone
```

2. Classify bug vs feature request vs epic.
3. Select owner prefix, labels, and milestone.
4. Check for blockers/dependencies:
   - Search issue text and surrounding task context for explicit `blocked by`,
     `depends on`, `Blocker`, `Voraussetzung`, open tasklist items, or
     dependency-table language.
   - If explicit and unambiguous, set a native GitHub relationship after
     creation.
   - If ambiguous, do not guess; mention the ambiguity in the handoff.
5. Write the issue body with concrete acceptance criteria and verification.
6. Run the issue-quality self-review:
   - Does the title start with exactly one required owner prefix?
   - Is this issue free of mixed frontend/backend implementation scope?
   - If this is a `Frontend:` issue, does it describe backend needs without
     deciding backend contracts, DTOs, endpoints, mapping, persistence, policy
     architecture, or server processing?
   - If backend capability is required, is there a linked `Backend:` or
     `Contract:` follow-up?
   - Can the next agent implement without asking what behavior is intended?
   - Are all happy, unhappy, boundary, auth, household/profile, malformed input,
     validation, stale-data, retry/idempotency, accessibility, localization,
     and observability paths either covered or explicit non-goals?
   - Are acceptance criteria exact enough to fail a wrong implementation?
   - Are tests and verification commands specific?
   - Is error handling exact and user-safe?
   - Are open decisions limited to `Implementation Decision Required`?
7. Create the issue:

```bash
gh issue create \
  --repo TVJunkie724/docman \
  --title "Frontend: Short actionable title" \
  --body-file /tmp/issue-body.md \
  --label "type:feature-request,status:open,area:frontend,layer:frontend,priority:high" \
  --milestone "Mappm M2 Capture and Review Core"
```

8. Re-open and verify:

```bash
gh issue view <number> \
  --repo TVJunkie724/docman \
  --json number,title,state,labels,milestone,url
```

9. Set and verify native blocker relationships for every explicit blocker.

## Updating Existing Issues

If an issue exists, update it instead of creating a duplicate.

When updating an issue:

- If the title lacks an owner prefix, add one.
- If the title uses a legacy prefix, replace it and keep legacy IDs only in
  body text if historically useful.
- If the issue is mixed frontend/backend implementation work, split it or
  convert it to an `Epic:` coordination issue and create child issues.
- If the update spans multiple pillars or shared standards, add
  `scope:cross-cutting` and all relevant `area:*` labels.
- Re-check blockers/dependencies and native relationships.
- Re-run the Enterprise-Grade Issue Contract review.

Closing an issue requires a short comment with:

- commit or PR reference
- verification evidence
- residual risk, if any

Then close it and replace stale lifecycle labels with `status:done`.

## Commit And Push Discipline

When committing work, connect the commit to GitHub Issues when a relevant issue
already exists. Do not create a low-quality placeholder issue only to satisfy a
commit footer.

Before committing:

1. Check whether the work has a clear issue from the chat, branch name,
   implementation plan, PR, or `gh issue list` search.
2. If relevant, reference it in the commit body footer:

```text
Refs #14
```

3. Use `Closes #<number>` only when the commit truly completes the issue.
4. If no relevant issue exists, commit without a reference and mention that in
   the handoff.

After pushing to the default branch, check the latest GitHub Actions runs that
include the pushed commit when workflows exist. If no workflows exist, say so
explicitly.

Recommended commands:

```bash
default_branch=$(git remote show origin | sed -n 's/.*HEAD branch: //p')
git rev-parse HEAD
gh run list --repo TVJunkie724/docman --branch "$default_branch" --limit 10
gh run view <run-id> --repo TVJunkie724/docman --json status,conclusion,headSha,url
```

## Native Project Fields

Use native GitHub metadata for size, dates, and board status when DocMan gets a
GitHub Projects v2 board. Do not encode size or target dates only as labels,
comments, body text, or markdown checklists once native fields exist.

DocMan does not currently assume a fixed project owner, project number, field
IDs, or option IDs in this skill. Discover them before editing project fields.

Discovery commands:

```bash
owner="TVJunkie724"
gh project list --owner "$owner" --format json
gh project field-list <project-number> --owner "$owner" --format json
```

## Dependencies And Blockers

Use native GitHub issue relationships for blockers/dependencies when they are
explicit and unambiguous.

Relationship direction:

- If issue `A` cannot be completed until issue `B` is done, set `A` as
  blocked by `B`.
- In GraphQL `addBlockedBy`, `issueId` is the blocked issue and
  `blockingIssueId` is the blocker.

Create a relationship:

```bash
blocked_issue=90
blocking_issue=62

blocked_id=$(gh issue view "$blocked_issue" \
  --repo TVJunkie724/docman \
  --json id --jq .id)

blocking_id=$(gh issue view "$blocking_issue" \
  --repo TVJunkie724/docman \
  --json id --jq .id)

gh api graphql \
  -f issueId="$blocked_id" \
  -f blockingIssueId="$blocking_id" \
  -f query='mutation($issueId: ID!, $blockingIssueId: ID!) {
    addBlockedBy(input: {
      issueId: $issueId,
      blockingIssueId: $blockingIssueId
    }) {
      issue { number }
      blockingIssue { number }
    }
  }'
```

Verify relationships:

```bash
issue_id=$(gh issue view 90 \
  --repo TVJunkie724/docman \
  --json id --jq .id)

gh api graphql \
  -f issueId="$issue_id" \
  -f query='query($issueId: ID!) {
    node(id: $issueId) {
      ... on Issue {
        number
        blockedBy(first: 100) {
          totalCount
          nodes { number title state }
        }
        blocking(first: 100) {
          totalCount
          nodes { number title state }
        }
      }
    }
  }'
```

If a relationship is likely but not fully clear, do not guess. Leave it unset
and mention the ambiguity.

## Status Lifecycle

- New actionable issues: `status:open`
- Draft concept proposals: `status:draft`
- Active implementation: `status:in-progress`
- Completed issues: close the GitHub issue and add or keep `status:done`

Lifecycle labels are mutually exclusive. Whenever changing lifecycle state,
remove every stale `status:*` label so the issue has exactly one lifecycle
label.

## Quality Gate

Do not create or update an issue unless it has:

- concrete owner prefix
- specific problem or desired capability
- enough context to act without re-reading the chat
- scope and non-goals
- acceptance criteria
- test coverage expectations with hard assertions
- verification steps
- error handling and privacy/security constraints where applicable
- labels and milestone selected or a clear note that repo metadata is missing
- native blockers set or explicitly called out as ambiguous/not applicable

Do not encode implementation shortcuts, fake auth/config, or workaround
language as the expected solution. If a workaround is forbidden, say so in the
issue.
