---
name: docman-github-issue
description: Use when creating, classifying, triaging, or updating GitHub Issues for DocMan, including bugs, feature requests, documentation tasks, architecture/foundation work, labels, milestones, and replacing markdown-only bug or feature trackers. GitHub Issues are the source of truth for actionable bugs and feature requests.
version: 0.3.0
user-invocable: true
---

# GitHub Issue - DocMan

GitHub Issues are the source of truth for actionable DocMan bugs and feature requests. Do not create new markdown FR/bug tracker files when an issue is the right artifact.

Use this skill for:

- bug reports
- feature requests
- documentation cleanup tasks
- architecture/foundation follow-up work
- quality/readiness/test coverage work
- data/storage/migration work
- Home Hub, Capture, Sync, OpenAPI, or Microcks contract work
- frontend/data/domain/sync handoff issues
- label or milestone cleanup
- converting a discussion, audit finding, or debug finding into an actionable issue

Do not use GitHub Issues to replace accepted decision documents. Decisions belong in `docs/technical/DECISION_*.md`; issues may track the follow-up work after a decision is made.

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

## Core Rules

- Treat legacy names such as `Incident`, `Case`, `P1`, `R0`, `FR`, or `BUG` as context only; use labels and milestones for classification.
- Do not create an issue that only says "fix this". First make it actionable.
- Search for duplicates before creating a new issue.
- Use GitHub-native labels, milestones, and issue relationships where possible.
- If labels or milestones are missing, report that clearly and ask whether to create them or proceed with available metadata.
- Lifecycle labels are mutually exclusive. An issue must have exactly one `status:*` label.
- Do not use markdown-only blockers when a dependency is explicit and unambiguous; set a native GitHub relationship.

## Issue Types

Use exactly one type label:

| Situation | Label |
|---|---|
| Existing behavior is broken, blocked, unsafe, inconsistent with accepted docs, or blocks the planned foundation | `type:bug` |
| New capability, planned product work, refactoring work, documentation cleanup, architecture/foundation task, or handoff work | `type:feature-request` |

If unsure: if DocMan already promises or depends on the behavior, create a bug. If it adds or plans capability, create a feature request.

## Required Labels

Every issue must have:

- one `type:*`
- one lifecycle label, usually `status:open`
- at least one `area:*`
- at least one `layer:*`
- bug: one `severity:*`
- feature request: one `priority:*`

## Area Labels

Use all that apply:

| Label | Meaning |
|---|---|
| `area:foundation` | Technical foundation, architecture decisions, project cleanup, R2/R3 |
| `area:cases` | Cases/Vorgaenge, former Incident Management, workflows, status, tasks |
| `area:documents` | Documents, metadata, upload, versioning, viewer, draft inbox |
| `area:capture` | Mobile capture, scan flow, batch scan, draft intake |
| `area:profiles` | Family profiles, household model, permissions |
| `area:auth` | Login, OAuth, sessions, secure token storage |
| `area:sync` | Local-first sync, backend replication, conflicts, remote storage |
| `area:ai-analysis` | OCR, auto-tagging, status suggestions, future intelligence |
| `area:frontend` | Flutter screens, navigation, widgets, UX implementation |
| `area:design-system` | Theme, tokens, shared widgets, visual system |
| `area:security` | Privacy, secrets, auth hardening, sensitive data handling |
| `area:distribution` | App store, packaging, signing, legal/public distribution |
| `area:docs` | Documentation-only work |
| `area:quality` | Test coverage, fake repositories, analyzer/format debt, CI quality gates |
| `area:api-contracts` | OpenAPI, Microcks, contract mocks, Home Hub/Capture/Sync API boundaries |
| `area:data-storage` | Drift, SQLite, file store, local migrations, legacy persistence retirement |
| `area:platform` | Cross-cutting infrastructure that does not fit one product area |

## Layer Labels

Use all that apply:

| Label | Meaning |
|---|---|
| `layer:frontend` | Flutter UI/client behavior |
| `layer:domain` | Entities, repository interfaces, use cases, workflows |
| `layer:data` | Drift, SQLite, file store, persistence, storage, legacy adapters, sync data |
| `layer:backend` | Future DocMan server/Home Hub work, API handling, backend configuration |
| `layer:sync` | Replication, conflict handling, offline queue, sync status |
| `layer:tests` | Unit/widget/integration tests or QA evidence |
| `layer:docs` | Documentation/process-only work |
| `layer:platform` | Tooling, config, CI/CD, packaging, repo setup |
| `layer:security` | Auth, secrets, privacy, sensitive-data controls |
| `layer:api` | OpenAPI, client/server contract, request/response behavior, Microcks mocks |

A single issue may carry multiple layer labels.

## Priority And Severity

For feature requests, use one:

- `priority:high`
- `priority:medium`
- `priority:low`

For bugs, use one:

- `severity:critical` - data loss, security issue, app cannot start, login completely blocked, or private data exposed
- `severity:high` - important user flow blocked or serious readiness risk
- `severity:medium` - degraded behavior with workaround or limited blast radius
- `severity:low` - polish, flaky/non-blocking test, minor inconsistency

## Milestones

Milestones represent product workstreams, not implementation layers.

Use one milestone:

| Milestone | Use for |
|---|---|
| `DocMan Foundation` | R0-R3 decisions, documentation cleanup, technical foundation, quality readiness |
| `DocMan Local Desktop MVP` | First local desktop product slice / R4 product MVP |
| `DocMan Cases` | Case/Vorgang management and workflows |
| `DocMan Documents` | Document management, metadata, drafts, viewer |
| `DocMan Capture` | Mobile scan/capture and draft intake |
| `DocMan Profiles` | Profiles, household, permissions |
| `DocMan Auth & Sync` | Auth, sessions, local-first sync, conflicts |
| `DocMan AI Analysis` | OCR, auto-tagging, status suggestions |
| `DocMan Distribution` | App store, packaging, legal/distribution readiness |

If an issue spans multiple areas, choose the milestone for the primary product outcome. Keep secondary ownership in labels.

## Bug Issue Body

Bug issues must be actionable without re-reading the chat.

Use:

```markdown
## Problem

## Evidence / Logs

## Expected Behavior

## Suspected Boundary

## Acceptance Criteria
- [ ] ...

## Verification
- [ ] Exact command, smoke check, or document review
```

For handoff bugs, include:

- observed request/response, stack trace, file/line, or screenshot context
- why it belongs to the suspected boundary
- forbidden workaround, if relevant
- expected contract
- tests or checks that prove the fix

## Feature Request Body

Feature requests must be implementation-ready.

Use:

```markdown
## Decision / Desired Capability

## Context

## Scope

## Non-Goals

## Acceptance Criteria
- [ ] ...

## Verification
- [ ] ...
```

For documentation/foundation issues, link the relevant docs, such as:

- `docs/PROJECT_OVERVIEW_GUIDE.md`
- `docs/ROADMAP_REBUILD.md`
- `docs/technical/DECISION_*.md`
- `docs/technical/R2_TECHNICAL_FOUNDATION_IMPLEMENTATION_PLAN.md`
- `docs/concepts/CONCEPT_F4_TESTING_STRATEGY.md`
- `docs/concepts/CONCEPT_F15_MOCK_REPOSITORY.md`
- `docs/concepts/CONCEPT_F16_CI_CD_PIPELINE.md`

## Quality / R3 Issue Body

Use for analyzer debt, test coverage, fake repositories, scripts, CI, production readiness, and legacy hardening:

```markdown
## Desired Readiness Outcome

## Current Evidence

## Scope

## Non-Goals

## Acceptance Criteria
- [ ] ...

## Verification
- [ ] Exact command or quality gate

## Residual Risk
```

## API Contract Issue Body

Use for Home Hub, Capture, Sync, OpenAPI, Microcks, and client/server handoff:

```markdown
## Contract Boundary

## Context

## Request / Response Expectations

## Error Mapping

## Security / Privacy Constraints

## Acceptance Criteria
- [ ] ...

## Verification
- [ ] Contract mock, client check, or backend check
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

2. Classify bug vs feature request.
3. Select labels and milestone from the tables above.
4. Check for blockers/dependencies before creating the issue:
   - Search the chat/context/body for explicit `blocked by`, `depends on`, `Blocker`, `Voraussetzung`, open tasklist items, or dependency-table language.
   - If a blocker is explicit and unambiguous, plan to set a native GitHub relationship after creation.
   - If a likely blocker is ambiguous, do not guess; mention the ambiguity in the handoff.
5. Write the issue body with concrete acceptance criteria and verification.
6. Create the issue:

```bash
gh issue create \
  --repo TVJunkie724/docman \
  --title "Short actionable title" \
  --body-file /tmp/issue-body.md \
  --label "type:feature-request,status:open,area:foundation,layer:docs,priority:high" \
  --milestone "DocMan Foundation"
```

7. Re-open the created issue and verify title, labels, milestone, and body:

```bash
gh issue view <number> \
  --repo TVJunkie724/docman \
  --json number,title,state,labels,milestone,url
```

8. Set and verify native blocker relationships for every explicit blocker. Use the commands in [Dependencies And Blockers](#dependencies-and-blockers).

## Updating Existing Issues

If an issue exists, update it instead of creating a duplicate:

```bash
gh issue edit <number> \
  --repo TVJunkie724/docman \
  --add-label "area:foundation,layer:docs,priority:high" \
  --milestone "DocMan Foundation"
```

When updating an issue, also re-check blockers/dependencies:

- If the update adds explicit dependency language such as `blocked by`, `depends on`, `Blocker`, or `Voraussetzung`, set a native GitHub relationship.
- If the update removes or resolves a dependency, verify whether the native relationship still reflects reality.
- After editing, verify `blockedBy` and `blocking` through GraphQL when the issue has or may have dependencies.

When closing an issue, add a short comment with:

- commit or PR reference
- verification evidence
- residual risk, if any

Then close it and replace stale lifecycle labels with `status:done`.

## Commit And Push Discipline

When committing work in this repository, connect the commit to GitHub Issues when a relevant issue already exists. This is preferred but not a hard blocker: do not create a low-quality placeholder issue only to satisfy a commit footer.

Before committing:

1. Check whether the work already has a clear issue from the chat, branch name, implementation plan, PR, or `gh issue list` search.
2. If there is a relevant issue, reference it in the commit body footer:

```text
Refs #14
```

3. Use `Closes #<number>` only when the commit truly completes the issue and the issue should close after merge to the default branch.
4. If no relevant issue exists, commit without a reference and mention in the handoff that no issue was linked.

For multi-commit work:

- Reference the same leading issue in each commit when each commit materially advances that issue.
- Reference multiple issues only when the commit genuinely spans them.
- Prefer a short explanatory commit body over stuffing issue context into the subject line.

After pushing:

- If pushing a feature branch, check PR/branch checks when a PR exists or when the user asks.
- If pushing to the default branch, check the latest GitHub Actions runs that include the pushed commit when workflows exist.
- If no workflows or PR checks exist, say that explicitly instead of implying CI passed.

Recommended check commands:

```bash
default_branch=$(git remote show origin | sed -n 's/.*HEAD branch: //p')
git rev-parse HEAD
gh run list --repo TVJunkie724/docman --branch "$default_branch" --limit 10
gh run view <run-id> --repo TVJunkie724/docman --json status,conclusion,headSha,url
```

If a pushed-default-branch pipeline fails:

1. Verify whether the failing run belongs to the pushed commit.
2. Inspect failing jobs/logs with `gh run view --log` or targeted `gh run view` commands.
3. If the failure is caused by the just-pushed work, fix it immediately when reasonable, then push a follow-up commit that references the same issue.
4. If the failure is unrelated, pre-existing, flaky, or belongs to another area, create or update a bug issue only when there is enough evidence and acceptance criteria.
5. Report the run URL, failed job, suspected boundary, and whether an issue was created or updated.

## Native Project Fields

Use native GitHub metadata for size, dates, and board status when DocMan gets a GitHub Projects v2 board. Do not encode size or target dates only as labels, comments, body text, or markdown checklists once native fields exist.

DocMan does not currently assume a fixed project owner, project number, field IDs, or option IDs in this skill. Discover them before editing project fields.

Discovery commands:

```bash
owner="TVJunkie724"
gh project list --owner "$owner" --format json
gh project field-list <project-number> --owner "$owner" --format json
```

When a DocMan project board exists and an issue belongs on it:

1. Add the issue to the project, or reuse the existing project item.
2. Set native `Status` if available.
3. Set native `Size` if available.
4. Set native `Target date` or equivalent date field if available and meaningful.
5. Verify the project field values after bulk edits.

If GitHub Project fields are unavailable, report that limitation and continue with issue labels/milestones only.

## Dependencies And Blockers

Use native GitHub issue relationships for blockers/dependencies when they are explicit and unambiguous.

Every create/update workflow must consider blockers. This is not optional: scan the issue text and surrounding task context for dependency signals before reporting the issue work complete.

Relationship direction:

- If issue `A` cannot be completed until issue `B` is done, set `A` as blocked by `B`.
- In GraphQL `addBlockedBy`, `issueId` is the blocked issue and `blockingIssueId` is the blocker.

Set relationships for explicit wording such as:

- `blocked by #123`
- `depends on #123`
- `Voraussetzung: #123`
- open tasklist item `- [ ] #123` in an epic or tracking issue

Do not set a relationship for:

- `related`, `verwandt`, `reference`, `referenziert`, `superseded`, `optional`, `komplementaer`, or `unabhaengig/unabhängig`.
- Ambiguous legacy IDs unless they map to exactly one GitHub issue with no collision.
- Closed/done tasklist entries unless the issue still genuinely blocks the target.

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

Verify existing relationships before or after editing:

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

If a relationship is likely but not fully clear, do not guess. Leave it unset and mention the ambiguity.

## Status Lifecycle

- New actionable issues: `status:open`
- Draft concept proposals: `status:draft`
- Active implementation: `status:in-progress`
- Completed issues: close the GitHub issue and add or keep `status:done`

Lifecycle labels are mutually exclusive. Whenever changing lifecycle state, remove every stale `status:*` label so the issue has exactly one lifecycle label. In particular, closing an issue must remove `status:open`, `status:draft`, and `status:in-progress` before or while adding `status:done`.

## Quality Gate

Do not create an issue without:

- specific problem or desired capability
- enough context to act without re-reading the chat
- acceptance criteria
- verification steps
- labels and milestone selected or a clear note that repo labels/milestones are missing

Do not encode implementation shortcuts, fake auth/config, or workaround language as the expected solution. If a workaround is explicitly forbidden, say so in the issue.
