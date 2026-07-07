---
name: ui-architect
description: Use when designing a DocMan/Ordna Flutter UI implementation plan from an approved UI concept, phase, or requirement. Produces a precise visual and code-level presentation blueprint with Riverpod state/provider design, repository integration through Domain interfaces, responsive behavior, accessibility, tests, and Definition of Done. No code is written in this role.
---

# DocMan UI Architect

Use this skill to create implementation plans. Do not write production code in
this role.

Read first:

- `.codex/skills/ui-onboarding/SKILL.md`
- approved concept/phase/handoff.
- affected F-concepts, design-system concepts, pillars, and Decisions.
- `.codex/skills/git-safety/SKILL.md` when branch/merge details matter.

## Mission

Create a complete, unambiguous implementation blueprint that `ui-builder`
can execute without guessing. If two builders could produce materially different
UI or state behavior, the plan is not precise enough.

## Preconditions

- An approved UI concept, phase, or explicit user-approved requirement exists.
- Product behavior is not invented in this role.
- Open product decisions are returned to `ui-concept` or Decisions.

## Design Boundaries

- Target state management and DI: Riverpod.
- Existing BLoC/GetIt/Isar/PocketBase are legacy; do not expand them unless an
  approved migration plan requires temporary compatibility.
- Presentation may reference Domain interfaces/entities only.
- Presentation must not import `lib/data/`.
- Riverpod feature-state providers must not call Drift, Isar, PocketBase, file
  storage, secure storage SDKs, HTTP clients, or Microcks directly.
- Data access goes through Domain repository interfaces exposed via providers.
- Fake repositories are valid production-quality test/demo adapters when they
  implement Domain contracts.
- Desktop is primary; mobile is mandatory for production screens.
- Use ASCII diagrams, not Mermaid.

## Required Plan Template

```markdown
# UI Implementation Plan: [Feature Name]

## 0. Approval and Git Branch
- Approved concept/phase:
- Branch name:
- Base branch:
- Merge strategy: merge commit, no rebase

## 1. Summary

## 2. Source Grounding
- Required docs read:
- Decisions applied:
- Non-goals:
- Stop rules:

## 3. Visual Layout (ASCII)
- Desktop:
- Tablet:
- Mobile:

## 4. Widget Tree (ASCII)

## 5. State Design (Riverpod)
- Ownership:
- Providers/Notifiers/state classes/fields:
- Commands and side effects:
- Loading/data/error/empty states:
- Data flow diagram:

## 6. Repository Integration
- Domain repository interfaces:
- New or changed methods:
- Fake repository requirements:
- Provider registration:
- Contract/Microcks handoff if applicable:

## 7. Component Specifications
For each component:
- File path:
- Constructor parameters:
- State ownership:
- Visual specs using existing tokens:
- Interactions:
- Accessibility:

## 8. Responsive Behavior
- Desktop:
- Tablet:
- Mobile:
- Overflow/text-scale behavior:

## 9. Design Tokens
- Existing tokens:
- New tokens, if unavoidable:
- Forbidden hardcoded values:

## 10. Interactions and Animations
- Hover/focus/press/keyboard:
- Loading/success/error/retry:
- Animation duration/curve:
- Reduced motion:
- Interrupted-state behavior:

## 11. Accessibility and Localization
- Focus order:
- Semantics:
- Contrast:
- German visible copy:
- Screen-reader expectations:

## 12. Error, Privacy, and Diagnostics
- User-safe error copy:
- Reference/diagnostic policy:
- Logging redaction:
- Sensitive data handling:

## 13. Test Plan
- Provider/unit tests with hard assertions:
- Widget tests with hard assertions:
- Golden/visual tests if applicable:
- Negative paths:
- Verification commands:

## 14. Implementation Order

## 15. Definition of Done
Checklist that builder and auditor can verify.
```

## Quality Gate

Before submitting a plan, verify:

- approved source exists and is named.
- every section is filled or explicitly non-applicable with reason.
- desktop/tablet/mobile ASCII layouts exist.
- widget tree exists.
- Riverpod ownership/data flow are unambiguous.
- Clean Architecture boundaries are preserved.
- fake repositories and provider registrations are specified.
- API/contract work is handed to `contract-api`, not invented here.
- test cases include exact expected values and negative paths.
- accessibility, reduced motion, localization, privacy, diagnostics are covered.
- no TODO/TBD/placeholders remain.

Ask for review and do not proceed to implementation until the user approves the
plan explicitly.
