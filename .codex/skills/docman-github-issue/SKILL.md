---
name: docman-github-issue
description: Use when creating, classifying, triaging, or updating GitHub Issues for DocMan, including bugs, feature requests, documentation tasks, architecture/foundation work, labels, milestones, and replacing markdown-only bug or feature trackers. GitHub Issues are the source of truth for actionable bugs and feature requests.
version: 0.1.0
user-invocable: true
---

# GitHub Issue - DocMan

GitHub Issues are the source of truth for actionable DocMan bugs and feature requests. Do not create new markdown FR/bug tracker files when an issue is the right artifact.

Use this skill for:

- bug reports
- feature requests
- documentation cleanup tasks
- architecture/foundation follow-up work
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
| `area:foundation` | Technical foundation, architecture decisions, project cleanup |
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
| `area:platform` | Cross-cutting infrastructure that does not fit one product area |

## Layer Labels

Use all that apply:

| Label | Meaning |
|---|---|
| `layer:frontend` | Flutter UI/client behavior |
| `layer:domain` | Entities, repository interfaces, use cases, workflows |
| `layer:data` | Isar, PocketBase adapters, persistence, storage, sync data |
| `layer:backend` | PocketBase/backend configuration or future server-side work |
| `layer:sync` | Replication, conflict handling, offline queue, sync status |
| `layer:tests` | Unit/widget/integration tests or QA evidence |
| `layer:docs` | Documentation/process-only work |
| `layer:platform` | Tooling, config, CI/CD, packaging, repo setup |
| `layer:security` | Auth, secrets, privacy, sensitive-data controls |

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
| `DocMan Foundation` | R0-R2 decisions, documentation cleanup, technical foundation |
| `DocMan Local Desktop MVP` | First local desktop product slice |
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
4. Write the issue body with concrete acceptance criteria and verification.
5. Create the issue:

```bash
gh issue create \
  --repo TVJunkie724/docman \
  --title "Short actionable title" \
  --body-file /tmp/issue-body.md \
  --label "type:feature-request,status:open,area:foundation,layer:docs,priority:high" \
  --milestone "DocMan Foundation"
```

6. Re-open the created issue and verify title, labels, milestone, and body:

```bash
gh issue view <number> \
  --repo TVJunkie724/docman \
  --json number,title,state,labels,milestone,url
```

## Updating Existing Issues

If an issue exists, update it instead of creating a duplicate:

```bash
gh issue edit <number> \
  --repo TVJunkie724/docman \
  --add-label "area:foundation,layer:docs,priority:high" \
  --milestone "DocMan Foundation"
```

When closing an issue, add a short comment with:

- commit or PR reference
- verification evidence
- residual risk, if any

Then close it and keep or add `status:done` where available.

## Dependencies And Blockers

Use native GitHub issue relationships for blockers/dependencies when they are explicit and unambiguous.

Relationship direction:

- If issue `A` cannot be completed until issue `B` is done, set `A` as blocked by `B`.
- In GraphQL `addBlockedBy`, `issueId` is the blocked issue and `blockingIssueId` is the blocker.

Set relationships for explicit wording such as:

- `blocked by #123`
- `depends on #123`
- `Voraussetzung: #123`
- open tasklist item `- [ ] #123` in an epic or tracking issue

Do not infer relationships from "related", "verwandt", "reference", "optional", or ambiguous old identifiers.

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

If a relationship is likely but not fully clear, do not guess. Leave it unset and mention the ambiguity.

## Status Lifecycle

- New actionable issues: `status:open`
- Draft concept proposals: `status:draft`
- Active implementation: `status:in-progress`
- Completed issues: close the GitHub issue and add or keep `status:done`

## Quality Gate

Do not create an issue without:

- specific problem or desired capability
- enough context to act without re-reading the chat
- acceptance criteria
- verification steps
- labels and milestone selected or a clear note that repo labels/milestones are missing

Do not encode implementation shortcuts, fake auth/config, or workaround language as the expected solution. If a workaround is explicitly forbidden, say so in the issue.
