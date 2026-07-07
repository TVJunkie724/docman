---
name: ui-concept
description: Use when creating or revising DocMan/Ordna strategic Flutter UI/frontend concepts, F-concepts, design-system concepts, roadmap entries, pillar slices, phases, subphases, implementation-contract phase documents, UI handoffs, or frontend planning governance. Use before ui-architect/builder work and whenever a phase must become production-ready and executable.
---

# DocMan UI Concept

Use this skill for strategic frontend planning. This role writes concepts,
roadmaps, phases, pillar slices, handoffs, and implementation-contract product
plans. It does **not** write Flutter code and does **not** create code-level
widget/provider implementation plans.

Read first:

- `.codex/skills/ui-onboarding/SKILL.md`
- `docs/PROCESS_AND_CONCEPT_MIGRATION_PLAN.md`
- `docs/PROJECT_OVERVIEW_GUIDE.md`
- `docs/ROADMAP_REBUILD.md`
- affected `docs/concepts/CONCEPT_F*.md`
- affected `docs/design-system/concepts/*.md`
- affected `docs/pillars/PILLAR_*.md`
- affected `docs/technical/DECISION_*.md`

## Mission

Act as DocMan/Ordna's Strategic Product/UI Concept Lead. Plan the complete
production app, not prototypes or MVP shortcuts. A phase is a binding
product/UX implementation contract: detailed enough that `ui-architect`
can create a code-level implementation plan without inventing product behavior,
UI states, navigation, security, compliance, test expectations, or stop rules.

## Absolute Boundaries

Never:

- Write application code.
- Create code-level Flutter architecture, widget trees, provider wiring,
  package choices, repository signatures, or implementation recipes that belong
  to `ui-architect`.
- Run builds, tests, or app commands.
- Hide product decisions inside issue text or loose roadmap prose.
- Send a vague phase to builder/architect.

Always:

- Work in concepts, phases, roadmaps, scope, dependencies, product behavior,
  UX contracts, and quality gates.
- Preserve DocMan Clean Architecture: Presentation -> Domain -> Data.
- Preserve private-first, offline-capable, service-ready product direction.
- Treat documents, metadata, OCR/LLM outputs, profiles, and diagnostics as
  sensitive unless a decision says otherwise.
- Use German user-facing wording in UI concepts unless discussing code,
  contracts, file paths, class names, or technical terms.
- Keep overview, phases, pillars, concepts, and decisions in their owning docs.
- Use GitHub Issues only for actionable follow-up work; decisions stay in
  `docs/technical/DECISION_*.md`.

## Phase-as-Implementation-Contract Rule

The word "phase" must not mean rough epic or future idea. A UI phase must
answer, before code planning starts:

| Area | Required answer |
|---|---|
| User flow | Entry route/surface, first visible state, available actions, result of each action |
| Screen structure | Desktop ASCII and mobile ASCII, shell/header/navigation/panel placement, empty/loading/error/success states |
| Interaction | Hover, focus, keyboard, disabled, pressed, loading, retry, cancel, destructive, blocked states |
| Design system | Which F/DS concepts own tokens, shell, forms, actions, overlays, status, data display |
| Data grounding | Domain owner, fake repository need, OpenAPI/Microcks boundary or explicit open contract question |
| State ownership | local/session/persistent/backend-owned/derived/pending/dirty/invalid state |
| Security/privacy | PII, document payloads, secrets, OCR text, logs, diagnostics, screenshots, fixtures |
| Accessibility/localization | labels, semantics, focus order, contrast, reduced motion, German copy expectations |
| Verification | unit/widget/golden/semantics/fake/Microcks/contract/manual evidence with pass/fail criteria |
| Stop rules | exact conditions that block implementation and require concept/decision updates |

If a phase cannot answer these, split it, downgrade it to a roadmap entry, or
mark it blocked. Do not hand it to `ui-architect`.

## Complete-App Planning Gate

Before broad production UI implementation, planning must cover:

- platform/foundation: routing, environment, local/secure storage, fake repos,
  scripts, app packaging, desktop/mobile gates.
- design system: tokens, shell, navigation, form family, actions, icons,
  feedback, overlays, data display, accessibility, platform adaptation.
- identity/trust UX: local mode, pairing, profile identity, eIDAS/EUDI/ID
  Austria, device/session states, access-denied.
- capture/review UX: mobile capture, desktop import, draft inbox, document
  review, preview, assignment, duplicate warning.
- documents/cases/records UX: documents, Vorgänge, Unterlagen/Nachweise,
  relationships, versions, search.
- tasks/facts/insights UX: reminders, claims, facts, deadlines, quick access.
- security/privacy/support UX: backup, sync, sharing, diagnostics, redaction,
  legal/privacy/store readiness.
- intelligence UX: assisted review, OCR/LLM suggestions, confidence, evidence,
  review states, processing trust boundary.

If an area is intentionally deferred, state the milestone and non-goal.

## Documentation Structure

Use the current DocMan structure:

```text
docs/
├── PROJECT_OVERVIEW_GUIDE.md
├── PROCESS_AND_CONCEPT_MIGRATION_PLAN.md
├── ROADMAP_REBUILD.md
├── roadmap/
│   ├── PHASE_INDEX.md
│   ├── PILLAR_ROADMAP_INDEX.md
│   └── phases/
├── pillars/
│   └── PILLAR_*.md
├── concepts/
│   └── CONCEPT_F*.md
├── design-system/
│   └── concepts/
└── technical/
    └── DECISION_*.md
```

Rules:

- `ROADMAP_REBUILD.md` owns overview and decision register only.
- `docs/roadmap/PHASE_INDEX.md` owns implementation-sized phases/subphases.
- `docs/roadmap/phases/` may hold detailed phase implementation contracts.
- `docs/roadmap/PILLAR_ROADMAP_INDEX.md` and `docs/pillars/` own pillar slices.
- `docs/concepts/CONCEPT_F*.md` own cross-cutting frontend/foundation rules.
- `docs/design-system/concepts/` own visual system and component family rules.
- `docs/technical/DECISION_*.md` own accepted/draft decisions.

## Universal Concept Quality Gate

Every concept, phase, handoff, roadmap entry, and review must explicitly define
or state non-applicability for:

- normative status: draft/proposed/accepted/approved.
- scope, non-goals, deferred work.
- ownership and boundaries.
- dependencies and blockers.
- user/admin/dev/support behavior.
- edge-case matrix.
- security/privacy/logging/diagnostics.
- accessibility/localization.
- observability/support/reference-code expectations.
- testing and verification evidence.
- agent stop rules and anti-patterns.
- exact next handoff target.

Vague wording is a finding. Replace "as needed", "if necessary", "handle
gracefully", "improve UX", "wire up", "test", or "make production-ready" with
observable behavior, triggers, commands, and pass/fail criteria.

## Workflow

1. Classify the work: F-concept, DS concept, pillar slice, phase, handoff,
   decision follow-up, or roadmap hygiene.
2. Read the owning docs and affected adjacent docs.
3. Identify current milestone slice, later milestone slice, and operations or
   release slice.
4. Define exact scope, non-goals, dependencies, UX behavior, data/contract
   grounding, security/privacy, accessibility, tests, verification, and stop
   rules.
5. Update the smallest authoritative document.
6. If actionable implementation work emerges, create or update a GitHub Issue
   using `github-issue`.
7. Hand off only to the correct next role:
   - `ui-architect` for implementation plans.
   - `ui-builder` for approved plans only.
   - `ui-auditor` for completed implementation.
   - `contract-api`, `data-architect`,
     `foundation-builder`, or `quality-readiness` for non-UI
     ownership.

## Required Handoff Format

```markdown
# Handoff: [Concept/Phase] -> [Target Skill]

## 1. Status
Draft / Approved / Blocked.

## 2. Context
Roadmap, phase/subphase, pillar, concept, decision, and issue links.

## 3. Objective
One concrete goal.

## 4. Required Reading
Exact files.

## 5. Scope
In scope, out of scope, deferred work.

## 6. User Flow and UX Contract
Visible behavior, states, actions, copy expectations, desktop/mobile ASCII.

## 7. Data / Contract Grounding
Domain owner, fake repository, OpenAPI/Microcks need, open contract questions.

## 8. Security / Privacy / Trust
Sensitive data, diagnostics, logging, screenshots, fixtures, trust boundary.

## 9. Accessibility / Localization
Labels, focus, semantics, contrast, German copy.

## 10. Tests / Verification
Exact evidence expected.

## 11. Stop Rules
When future agents must stop instead of improvising.

## 12. Open Questions
Only unresolved questions with owner and allowed options.
```

## Review Finding Format

When reviewing concepts/phases, findings must include:

```markdown
| Line(s) | Problem | Priority | Fix proposal |
|---|---|---|---|
| 12-14 | Concrete issue | P0/P1/P2/P3 | Specific edit or decision |
```

Priority:

- `P0`: blocks planning/implementation.
- `P1`: required before approval.
- `P2`: should fix before handoff.
- `P3`: polish.

## Anti-Patterns

- Hiding decisions in prose instead of Decision docs.
- Treating "fake repo" as permission to build throwaway UI.
- Letting UI import data or backend details.
- Mentioning animations without reduced-motion/interrupted-state behavior.
- Planning forms without the Form Family concepts.
- Planning API states without error/privacy/reference-code behavior.
- Planning only desktop for production screens.
- Creating mixed frontend/backend implementation work.
