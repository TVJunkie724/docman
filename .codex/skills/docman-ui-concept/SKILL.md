---
name: docman-ui-concept
description: Use when creating or revising strategic DocMan frontend concept, roadmap, phase, or handoff documentation. This is documentation-only work and must not write application code, implementation plans, or run builds/tests.
---

# DocMan UI Concept

Use this skill for strategic frontend planning: roadmaps, concepts, phases, dependencies, scope, and handoffs.

First read `.codex/skills/docman-ui-onboarding/SKILL.md`.

## Boundaries

Never:

- Write or generate application code.
- Create implementation plans; that belongs to `docman-ui-architect`.
- Run builds, tests, or execution commands.
- Decide exact widgets, provider wiring, package versions, or repository method signatures.

Always:

- Work in concepts, phases, roadmaps, dependencies, and scope.
- Document what should exist, why it matters, and how it fits the product.
- Keep future implementation possible without prescribing low-level implementation.

## Documentation Structure

Use the current DocMan planning structure:

```text
docs/
├── PROJECT_OVERVIEW_GUIDE.md
├── ROADMAP_REBUILD.md
├── concepts/
│   └── CONCEPT_F*.md
└── technical/
    ├── DECISION_*.md
    └── TECHNICAL_FOUNDATION_PLAN.md
```

GitHub Issues are the source of truth for actionable bugs, feature requests, and follow-up work. Do not create markdown feature-request or bug tracker files.

Do not resurrect the deleted P1-P7 roadmap files unless the user explicitly asks for new product-phase planning. If later product pillars are needed, create them as fresh DocMan-specific documents that reference `ROADMAP_REBUILD.md`.

## Workflow

1. Understand the user's vision and identify affected DocMan phase, concept, or decision area.
2. Define or update scope: in scope, out of scope, dependencies.
3. Create or update roadmap, concept, decision, or foundation-plan documents with links.
4. Write concept documents with summary, motivation, scope, dependencies, open questions, related concepts, and roadmap anchor.
5. Write phase documents with summary, prerequisites, deliverables, acceptance criteria, and roadmap anchor.
6. Review with the user and iterate until approved.

## Handoff Format

When concept or phase work is ready for another role, produce a handoff:

```markdown
# Handoff: [Phase/Concept Name] -> [Target Skill]

## 1. Context
- Roadmap, phase, concept, and decision links.

## 2. Objective
One clear goal.

## 3. Required Reading
All documentation files to read.

## 4. Scope
In scope and out of scope.

## 5. Constraints & Decisions
Decisions already made.

## 6. Acceptance Criteria
Concrete, verifiable criteria.

## 7. Dependencies
Prerequisites.

## 8. Open Questions
Only unresolved questions.
```

Target `docman-ui-architect` for implementation plans, `docman-ui-builder` for approved implementation, and `docman-ui-auditor` for completed implementation audits.

## Anti-Patterns

- Do not include code or pseudocode.
- Do not prescribe exact Flutter widget choices.
- Do not duplicate content; cross-reference instead.
- Do not use Mermaid diagrams.
