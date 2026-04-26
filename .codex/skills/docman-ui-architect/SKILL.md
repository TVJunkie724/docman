---
name: docman-ui-architect
description: Use when designing a DocMan Flutter UI implementation plan from an approved concept or requirement. Produces a precise architecture and visual blueprint, including widget tree, Riverpod state/provider design, repository integration, responsive behavior, accessibility, tests, and definition of done.
---

# DocMan UI Architect

Use this skill to create implementation plans. Do not write production code in this role.

Read `.codex/skills/docman-ui-onboarding/SKILL.md`. Use `.codex/skills/docman-git-safety/SKILL.md` when branch or merge details matter.

## Design Boundaries

- DocMan target architecture uses Riverpod for state management and dependency injection.
- Existing BLoC/GetIt code is spike/legacy until the foundation migration is complete.
- Data access must go through Domain repository interfaces exposed via Riverpod providers.
- Presentation must not import `lib/data/`.
- No Isar or PocketBase calls from Presentation widgets or feature-state providers.
- Desktop is primary, mobile is mandatory.
- Use ASCII diagrams, not Mermaid.

## Responsibilities

- Define exact widget tree and state ownership.
- Specify Riverpod providers, Notifiers, state shapes, side effects, lifecycles, and data flow.
- Define file and folder changes.
- Specify repository interface changes and provider registrations.
- Specify layout, spacing, typography, color tokens, breakpoints, interactions, animations, loading/error/empty states, and accessibility.
- Make the plan precise enough that a builder can implement it without guessing.

## Workflow

1. Understand the requirement and affected areas: layout, navigation, state, widgets, theme, repositories.
2. Research existing screens, providers or legacy BLoCs, widgets, theme, domain entities, repository interfaces, and dependency setup.
3. Create an ASCII visual layout.
4. Produce a complete implementation plan using the template below.
5. Request review and do not proceed to implementation until approved.

## Required Plan Template

```markdown
# UI Implementation Plan: [Feature Name]

## 0. Git Branch
- Branch name:
- Base branch:
- Merge strategy: merge commit, no rebase

## 1. Summary

## 2. Visual Layout (ASCII)

## 3. Widget Tree

## 4. State Design (Riverpod)
- Ownership
- Providers, Notifiers, state classes, and fields
- Commands/methods and side effects
- Data flow diagram (ASCII)
- Side effects and triggers

## 5. Repository Integration
- Repository interfaces
- New methods
- Provider registration

## 6. Component Specifications
For each new or modified component:
- File path
- Constructor parameters
- State ownership
- Widget skeleton or pseudocode
- Visual specs using theme tokens

## 7. Responsive Behavior
Desktop, tablet, and mobile breakpoints with exact changes.

## 8. Design Tokens
Existing tokens and any new required tokens.

## 9. Interactions & Animations
Hover, focus, press, drag, transitions, loading and error behavior.

## 10. Accessibility
Focus order, semantic labels, contrast.

## 11. Test Plan
Concrete happy path, unhappy path, and edge case tests with hard assertions.

## 12. Definition of Done
Checklist the builder and auditor can verify.
```

## Quality Gate

Before submitting a plan, verify:

- Branch strategy is addressed.
- Every section is filled.
- ASCII visual layout exists.
- Widget tree exists.
- State ownership and data flow are unambiguous.
- Clean Architecture boundaries are preserved.
- All new services, repositories, and providers have registration instructions.
- Tests have hard assertions and exact expected outcomes.
- No TODO, TBD, or placeholder references remain.
