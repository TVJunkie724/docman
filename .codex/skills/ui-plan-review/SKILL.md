---
name: ui-plan-review
description: Use when reviewing a DocMan/Mappm UI implementation plan before approval. Checks the plan from architect and builder perspectives for concept fidelity, unambiguity, Clean Architecture, Riverpod/provider design, fake repository and contract boundaries, exact tests, accessibility, privacy, stop rules, and absence of placeholders.
---

# Mappm UI Plan Review

Use this skill before a UI implementation plan is approved for build.

Read:

- `.codex/skills/ui-onboarding/SKILL.md`
- `.codex/skills/ui-concept/SKILL.md`
- `.codex/skills/ui-architect/SKILL.md`
- the approved concept/phase/handoff.
- every referenced F-concept, DS concept, pillar, and Decision.

## Mandatory Criteria

Check every criterion. Do not skip "simple" plans.

1. Concept fidelity: plan matches approved concept/phase exactly.
2. Unambiguity: builder can implement without follow-up questions.
3. No over-engineering: only phase scope is included.
4. No side effects: no unrelated migrations or behavior changes.
5. Clean Architecture: Presentation -> Domain -> Data is preserved.
6. Riverpod design: ownership, providers, state, commands, side effects clear.
7. Repository integration: Domain interfaces, fakes, provider registration clear.
8. Contract boundary: OpenAPI/Microcks/API needs handed off properly.
9. ASCII layouts: desktop, tablet, mobile.
10. Widget-tree ASCII.
11. Tokens: no unapproved hardcoded colors/spacing/dimensions.
12. Interactions: hover/focus/press/keyboard/loading/error/retry/destructive.
13. Animations: trigger, duration, curve, reduced motion, interrupted state.
14. Accessibility/localization: focus, semantics, contrast, German copy.
15. Privacy/diagnostics: sensitive data, logs, screenshots, reference codes.
16. Tests: hard assertions, happy/unhappy/edge paths, negative paths.
17. Verification commands and expected pass results.
18. Definition of Done is exact and auditable.
19. Stop rules exist.
20. No TODO/TBD/placeholders/vague wording.
21. Intelligence realism: Assist/Capture/Review behavior obeys
    `DECISION_INTELLIGENCE_SCOPE.md`, assumes small/medium general-purpose
    models, uses only Product-/Document-defined type-dependent review fields
    with top candidate/alternatives/no-value/manual fallback, and does not
    invent semantic profile/case/document conflicts, mixed-document
    rejection/splitting, autonomous workflow/deadline/relation truth,
    date-bearing automatic titles or M1 training/donation flows.

## Review Perspectives

Review twice:

- Architect perspective: correctness, consistency, scalability, boundaries.
- Builder perspective: can this be executed 1:1 with no interpretation?

## Process

1. Read the plan and all sources.
2. Check every criterion.
3. Apply small unambiguous wording fixes only when the user asked for edits.
4. Ask the user only when a real decision is required.
5. Do not approve while P0/P1 findings remain.

## Output

Lead with findings:

```markdown
| Section/Line | Problem | Priority | Exact fix |
|---|---|---|---|
| ... | ... | P0/P1/P2/P3 | ... |
```

If no findings remain, state:

- ready for approval or approved if the user already approved.
- residual risks.
- required builder skill.
