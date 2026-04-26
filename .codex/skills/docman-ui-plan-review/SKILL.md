---
name: docman-ui-plan-review
description: Use when reviewing a DocMan UI implementation plan before approval. Checks the plan from architect and builder perspectives for completeness, unambiguity, Clean Architecture, testability, exactness, and absence of placeholders.
---

# DocMan UI Plan Review

Use this skill before an implementation plan is approved for building.

Read `.codex/skills/docman-ui-onboarding/SKILL.md` and, if Git workflow is covered, `.codex/skills/docman-git-safety/SKILL.md`.

## Mandatory Criteria

Check all criteria:

1. Deep concept understanding: the plan reflects the concept and referenced docs.
2. Unambiguity: a builder can implement without follow-up questions.
3. No over-engineering: only necessary work for this phase.
4. No side effects: other areas are not broken or negatively affected.
5. Type compatibility: Domain, Data, and Presentation boundaries align.
6. Completeness: every plan template section is filled.
7. ASCII layout diagram exists.
8. Widget-tree ASCII diagram exists.
9. No hardcoded tokens; colors, spacing, and dimensions reference theme tokens.
10. Riverpod state/provider design is fully specified.
11. Clean Architecture boundaries are respected.
12. Provider registration is specified for new services, repositories, and state.
13. Tests use hard assertions.
14. Provider/Notifier unit tests are specified where state logic exists.
15. Widget tests are specified for key UI behavior.
16. Coverage is sufficient: at least 2 happy path, 2 unhappy path, and 5 edge cases per testable unit, or a concrete justification for fewer.
17. Definition of Done is precise and complete.
18. No placeholders such as TODO, TBD, or unresolved examples.

## Review Perspectives

Review twice:

- Architect perspective: technical correctness, completeness, consistency, scalability.
- Builder perspective: can it be implemented exactly as written?

## Process

1. Read the associated concept and all referenced documents.
2. Read the plan completely.
3. Check every criterion.
4. Apply simple unambiguous fixes when the user asked for direct edits.
5. Ask the user only when a decision is genuinely required.
6. Repeat until there are no gaps.
7. Present the result and wait for explicit approval before build work.

## Output

Lead with findings. For each finding include location, problem, priority, and exact fix. If no findings remain, state that the plan is ready for approval.
