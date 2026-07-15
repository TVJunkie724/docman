---
name: ui-concept-review
description: Use when reviewing DocMan/Mappm UI concepts, F-concepts, design-system concepts, roadmap entries, pillar slices, phase documents, or handoffs for production readiness, executability, completeness, over-engineering, contradictions, missing stop rules, and phase-as-implementation-contract quality.
---

# Mappm UI Concept Review

Use this skill before UI concepts or phases are approved or handed to
`ui-architect`.

Read first:

- `.codex/skills/ui-onboarding/SKILL.md`
- `.codex/skills/ui-concept/SKILL.md`
- affected concepts, roadmap, pillars, decisions, and phase documents.

## Review Standard

Be strict. The document must be executable by a future agent without inventing
product behavior. "Clear enough" is not enough.

Check every applicable area:

1. Correct source of truth: content lives in the owning doc.
2. Normative status: draft/proposed/accepted/approved is explicit.
3. Scope/non-goals/deferred work are complete.
4. Phase-as-implementation-contract fields are present where this is a phase.
5. User flow, states, actions, copy expectations, desktop/mobile behavior are
   explicit.
6. Data/contract grounding is exact or open questions are named.
7. Security/privacy/trust/logging/diagnostics are addressed.
8. Accessibility/localization are addressed.
9. Test/verification evidence is concrete and falsifiable.
10. Stop rules tell future agents when to stop.
11. No over-engineering or contradiction with milestone scope.
12. No hidden backend/data/foundation work in UI-owned docs.
13. Cross-concept consistency with F-concepts, design-system concepts, pillars,
    and accepted Decisions.
14. GitHub Issue follow-ups use `github-issue` standards.

## Process

1. Read the reviewed document completely.
2. Read every referenced or owning document needed to verify it.
3. Check for contradictions, missing anchors, vague wording, and ownership
   leaks.
4. Apply obvious typo/link fixes only if the user asked for direct edits.
5. Do not approve while P0/P1 findings remain.
6. If no findings remain, state residual risks and whether it can proceed to
   `ui-architect`.

## Finding Format

Lead with findings:

```markdown
| Line(s) | Problem | Priority | Fix proposal |
|---|---|---|---|
| 12-14 | ... | P0/P1/P2/P3 | ... |
```

Then include:

- open questions or assumptions.
- residual risks.
- approval status.
