---
name: docman-ui-concept
description: Use when creating or revising strategic DocMan UI/frontend concept, roadmap, phase, subphase, pillar-slice, or handoff documentation. Always preserve the DocMan roadmap structure: overview in ROADMAP_REBUILD, implementation-sized phases/subphases in docs/roadmap/PHASE_INDEX.md, pillar slices in docs/roadmap/PILLAR_ROADMAP_INDEX.md and docs/pillars. For whole-product, foundation, data, quality, or API concepts prefer the matching DocMan project skill when available.
---

# DocMan UI Concept

Use this skill for strategic frontend/UI planning: screens, navigation, presentation architecture, design-system direction, responsive behavior, UI phase scope, and UI handoffs.

First read `.codex/skills/docman-ui-onboarding/SKILL.md`.

Also read the planning structure that anchors the work:

- `docs/ROADMAP_REBUILD.md` for top-level phases, decision register, and active overview.
- `docs/roadmap/PHASE_INDEX.md` for implementation-sized phases and subphases.
- `docs/roadmap/PILLAR_ROADMAP_INDEX.md` for pillar slices and MVP/Post-MVP/Enterprise split.
- `docs/pillars/PILLAR_INDEX.md` plus the affected `docs/pillars/PILLAR_*.md` files for pillar responsibility.

## Boundaries

Never:

- Write or generate application code.
- Create implementation plans; that belongs to `docman-ui-architect`.
- Run builds, tests, or execution commands.
- Decide exact widgets, provider wiring, package versions, or repository method signatures.

Always:

- Work in concepts, phases, roadmaps, dependencies, and scope.
- Stay UI/frontend-focused. Use `docman-product-concept`, `docman-foundation-builder`, `docman-quality-readiness`, `docman-data-architect`, or `docman-contract-api` for non-UI work when those skills fit better.
- Document what should exist, why it matters, and how it fits the product.
- Keep future implementation possible without prescribing low-level implementation.
- Treat every phase as a future implementation plan. If a UI phase is too broad, split it into subphases with clear separation of concerns.
- For every UI decision or handoff, identify the MVP/Baseline slice and the Post-MVP/Enterprise slice, even when the current task only changes the MVP part.
- Keep overview, phase details, and pillar details in their proper documents.

## Documentation Structure

Use the current DocMan planning structure:

```text
docs/
├── PROJECT_OVERVIEW_GUIDE.md
├── ROADMAP_REBUILD.md
├── ROADMAP_EXECUTION_PLAN.md
├── roadmap/
│   ├── PHASE_INDEX.md
│   └── PILLAR_ROADMAP_INDEX.md
├── pillars/
│   ├── PILLAR_INDEX.md
│   └── PILLAR_*.md
├── concepts/
│   └── CONCEPT_F*.md
└── technical/
    ├── DECISION_*.md
    └── TECHNICAL_FOUNDATION_PLAN.md
```

Rules:

- `ROADMAP_REBUILD.md` is the overview. It may contain top-level phases, the decision register overview, and short pointers. Do not put detailed UI phase plans there.
- `docs/roadmap/PHASE_INDEX.md` owns implementation-sized phases and subphases. Add or split UI subphases there when a phase is too large or mixes responsibilities.
- `docs/roadmap/PILLAR_ROADMAP_INDEX.md` owns pillar-slice overview: MVP/Baseline, Post-MVP, and Enterprise/Operations per pillar.
- `docs/pillars/PILLAR_*.md` owns the durable responsibility of a product/platform/governance pillar.
- `docs/concepts/CONCEPT_F*.md` owns cross-cutting frontend/foundation concepts, not product feature pillars.
- `docs/technical/DECISION_*.md` owns accepted or provisional decisions. Do not hide decisions only in roadmap prose.

GitHub Issues are the source of truth for actionable bugs, feature requests, and follow-up work. Do not create markdown feature-request or bug tracker files.

Do not resurrect deleted P1-P7 roadmap files. If later product pillars or phase details are needed, create or update DocMan-specific documents inside the current structure above.

## Phase and Pillar Discipline

When planning UI/frontend work:

- Start from the affected phase and subphase, e.g. `R4.2 Desktop Import + Draft Inbox` or `R4.15 UX/A11y MVP Gate`.
- Identify the affected pillars, e.g. Capture & Inbox, Cases/Documents/Records, Tasks/Reminders, Design System/UX, QA, Security/Privacy.
- If the phase/subphase does not exist yet, add a concise entry to `docs/roadmap/PHASE_INDEX.md`.
- If the pillar slice is missing or too vague, update `docs/roadmap/PILLAR_ROADMAP_INDEX.md` or the relevant `docs/pillars/PILLAR_*.md`.
- If the change belongs to a cross-cutting UI rule, update the relevant `docs/concepts/CONCEPT_F*.md`.
- If the work implies a new product/architecture decision, create or update `docs/technical/DECISION_*.md` and add a short row to the decision register in `ROADMAP_REBUILD.md`.

Do not put all detail into one large matrix document. Keep:

- overview in `ROADMAP_REBUILD.md`.
- phase/subphase detail in `PHASE_INDEX.md` or a later dedicated phase handoff.
- pillar responsibility/slices in `PILLAR_ROADMAP_INDEX.md` and `docs/pillars/`.
- implementation instructions in later architect/builder plans, not UI concepts.

## Workflow

1. Understand the user's vision and identify affected DocMan phase/subphase, pillar(s), concept, and decision area.
2. Check whether the work belongs in UI concept, phase/subphase structure, pillar roadmap, technical decision, or a later implementation plan.
3. Define or update scope: in scope, out of scope, dependencies, MVP/Baseline slice, Post-MVP/Enterprise slice.
4. If the requested phase is too large, split it into smaller subphases before writing handoff content.
5. Update the smallest authoritative document:
   - overview/decision register: `ROADMAP_REBUILD.md`
   - phase/subphase: `docs/roadmap/PHASE_INDEX.md`
   - pillar slice: `docs/roadmap/PILLAR_ROADMAP_INDEX.md` or `docs/pillars/PILLAR_*.md`
   - cross-cutting UI rule: `docs/concepts/CONCEPT_F*.md`
   - decision: `docs/technical/DECISION_*.md`
6. Write concept documents with summary, motivation, scope, dependencies, open questions, related concepts, roadmap anchor, phase/subphase anchor, and pillar anchor.
7. Write phase/handoff documents with summary, prerequisites, deliverables, acceptance criteria, roadmap anchor, phase/subphase anchor, pillar anchor, and explicit non-goals.
8. Review with the user and iterate until approved.

## Handoff Format

When concept or phase work is ready for another role, produce a handoff:

```markdown
# Handoff: [Phase/Concept Name] -> [Target Skill]

## 1. Context
- Roadmap, phase/subphase, pillar, concept, and decision links.

## 2. Objective
One clear goal.

## 3. Required Reading
All documentation files to read.

## 4. Scope
In scope and out of scope.

## 5. MVP/Baseline and Post-MVP
- MVP/Baseline slice.
- Post-MVP/Enterprise slice.

## 6. Constraints & Decisions
Decisions already made.

## 7. Architecture Boundaries
- UI/presentation boundaries.
- Domain/API/storage boundaries relevant to the UI.
- What must not leak into UI.

## 8. Acceptance Criteria
Concrete, verifiable criteria.

## 9. Dependencies
Prerequisites.

## 10. Open Questions
Only unresolved questions.
```

Target `docman-ui-architect` for implementation plans, `docman-ui-builder` for approved implementation, and `docman-ui-auditor` for completed implementation audits.

## Anti-Patterns

- Do not include code or pseudocode.
- Do not prescribe exact Flutter widget choices.
- Do not duplicate content; cross-reference instead.
- Do not use Mermaid diagrams.
