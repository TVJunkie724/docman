---
name: ui-mocker
description: Use when creating isolated visual or interactive Flutter UI mocks for Mappm concepts inside the workspace. Mocks live under lib/presentation/screens/mocks, must be synthetic, and must not call real repositories, Drift, Isar, PocketBase, file storage, secure storage, Microcks, Mappm Cloud, or external APIs.
---

# Mappm UI Mocker

Use this skill for concept-validation mocks only. Mocks are not production UI
and must not leak into normal app navigation.

Read:

- `.codex/skills/ui-onboarding/SKILL.md`
- relevant concept/phase/design-system docs.

## Mock Location

```text
lib/presentation/screens/mocks/
├── MOCK_CATALOG.md
├── mock_NN_description/
│   ├── mock_NN_screen.dart
│   ├── mock_NN_state.dart
│   ├── mock_NN_controller.dart
│   └── widgets/
```

Launch through:

```bash
flutter run -d macos -t lib/main_mock_catalog.dart
```

or `scripts/run_mocks.sh` if available.

## Rules

- Presentation-only code.
- No real repositories, Drift, Isar, PocketBase, file storage, secure storage,
  HTTP, Microcks, Mappm Cloud, Local Development Cloud, or external APIs.
- Use fully synthetic data only. No real names, addresses, document text,
  screenshots, files, tokens, IDs, or secrets.
- Hardcoded data is allowed inside mocks; reusable production components must
  still use tokens and conventions.
- Keep mocks isolated; one mock must not depend on another.
- Prefer local state for interaction; do not build production Riverpod
  architecture unless the mock explicitly validates provider behavior.
- Register every mock in `MOCK_CATALOG.md`.
- Use the normative F37 object model in affected mocks: one Case type, typed
  links, distinct Unterlagen/Records, equal Custom/Guided capability and no
  copy-on-composition behavior.
- For F38 mocks, use only approved real processing stages and include
  background, Review Queue, partial failure and Reduced Motion. Never mock a
  fake percent/countdown or feature-advertising carousel.
- Subscription mocks stay visually slim. A chart requires at least two
  confirmed comparable values and must expose point values through hover, tap,
  keyboard focus and semantics.
- Use synthetic people, organizations and external parties with visibly
  distinct roles. Never present tax candidates as deductible or build
  bookkeeping/accounting behavior into a product mock.

## Workflow

1. Read the concept and dependencies.
2. Define mock question: what product/design decision does this mock answer?
3. Define scope and non-goals.
4. Create desktop/mobile ASCII layout and interaction states before code.
5. Implement isolated mock.
6. Register catalog entry.
7. Run targeted analysis if Dart files changed.
8. Report what the mock validates and what remains unproven.

## Conversion Rule

If a mock is accepted, do not promote it directly to production. Create a
real concept/phase, then a `ui-architect` implementation plan with
Domain interfaces, fake repositories, Riverpod state, tests, and audit gates.
