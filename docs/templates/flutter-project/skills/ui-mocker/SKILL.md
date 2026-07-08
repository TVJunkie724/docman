---
name: ui-mocker
description: Use when creating isolated visual or interactive [PROJECT_NAME] Flutter UI mocks for concept exploration, playground validation, visual state review, design-system exploration, responsive checks, or pre-implementation UI experiments. Mocks must not call real repositories, real storage, real backend APIs, or external services.
---

# [PROJECT_NAME] UI Mocker

## Mission

Create isolated mocks that help evaluate UX, layout, copy, states,
interaction, design-system fit, responsive behavior, and edge cases before
production implementation.

Mocks are a review tool, not a shortcut into production code.

## Required Reading

- `.codex/skills/onboarding/SKILL.md`
- relevant UI concept or exploration brief.
- relevant F-concepts.
- affected design-system concepts.
- existing template catalog or mock catalog when the project has one.
- existing production widgets/tokens that the mock is expected to mirror.

Also use:

- `frontend-error-handling` when the mock includes error banners, validation,
  auth/API failures, reference codes, diagnostics, or notification behavior.
- `frontend-test-coverage` when the mock creates reusable widgets, testable
  state, or visual QA expectations that may migrate to production.

## Template-Matching Gate

Before creating a mock:

1. Inspect existing mock templates, design-system primitives, shared widgets,
   and prior mocks.
2. Create a matching table:

```markdown
| Existing template/component | Use? | Reason |
|---|---|---|
| [name] | yes/no | concrete fit or gap |
```

3. Prefer copying or mirroring approved mock templates/widgets over inventing
   local visual replacements.
4. If no existing template fits, document the gap and create the smallest
   isolated mock needed to test the concept.

## Required Mock Plan

Every mock needs:

- objective.
- concept/source link.
- in-scope and out-of-scope behavior.
- desktop and mobile/narrow ASCII.
- widget tree.
- synthetic data states.
- interaction list.
- design-system tokens/components used.
- error/empty/loading/success states if async.
- privacy and fixture note.
- manual review checklist.

## Rules

- Use synthetic data only.
- Do not use real repositories, storage, backend APIs, or secrets.
- Do not reference other mocks directly unless the project explicitly has a
  shared mock-template package.
- Keep mocks presentation-only unless state is required to test interaction.
- If local state is required, keep it deterministic and resettable.
- Cover responsive states when relevant.
- Include empty, loading, error, and success examples when the flow is async.
- Mark mocks as non-production.
- Do not create production-looking fallback designs for missing assets,
  contracts, or widgets without documenting the gap.
- Do not use private data, real customer data, real tokens, real IDs, or
  sensitive screenshots.
- Do not invent new design-system primitives silently. Mark them as DS gaps.

## Output

Report:

- files created or updated.
- states represented.
- templates/components reused.
- intentional gaps.
- review instructions.
- production migration notes, if any.

## Stop Rules

Stop when the mock would need real data, real backend behavior, or unresolved
product decisions.

Also stop when:

- an existing design-system primitive should be changed instead.
- error behavior is required but no error-handling concept exists.
- the mock would imply a backend contract not yet owned by `contract-api`.
