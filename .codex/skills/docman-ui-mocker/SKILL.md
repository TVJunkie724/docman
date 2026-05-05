---
name: docman-ui-mocker
description: Use when creating isolated visual or interactive Flutter UI mocks for DocMan concepts inside the workspace. Mocks live under lib/presentation/screens/mocks and must not call real repositories, Drift, Isar, PocketBase, file storage, or external APIs.
---

# DocMan UI Mocker

Use this skill to create concept-validation mocks inside DocMan.

Read `.codex/skills/docman-ui-onboarding/SKILL.md` first.

Mocks are launched through a dedicated mock catalog entry point, not through
normal product navigation. Prefer:

```bash
flutter run -d macos -t lib/main_mock_catalog.dart
```

An optional `scripts/run_mocks.sh` may wrap this command.

## Mock Location

```text
lib/presentation/screens/mocks/
├── MOCK_CATALOG.md
├── mock_01_description/
│   ├── mock_01_screen.dart
│   ├── mock_01_state.dart
│   ├── mock_01_controller.dart
│   └── widgets/
└── mock_NN_description/
```

## Workflow

1. Read the concept and all required dependency docs.
2. Define the mock scope: layout, widgets, styles, animations, interactions.
3. Decide whether the mock is static or interactive.
4. Create an ASCII layout and widget-tree diagram before implementation.
5. Implement presentation-only code.
6. Register the mock in `MOCK_CATALOG.md`.
7. Run targeted analysis or tests as appropriate for changed files.

## Interactive Mock Helper Bar

For mocks that demonstrate interactions, add a helper bar below the app bar:

```text
+------------------------------------------------+
| <- Back   Mock NN: Description                 |
+------------------------------------------------+
| [Action 1] [Action 2] [Toggle State]           |
+------------------------------------------------+
| Mock content                                   |
+------------------------------------------------+
```

## Rules

- No real data layer calls.
- No Drift, Isar, PocketBase, repository, file storage, or API calls.
- No Microcks or Home Hub calls from UI concept mocks.
- Hardcoded values are allowed for mocks.
- Use realistic but fully synthetic data only. No real names, addresses,
  private document text, screenshots, files, tokens, or secrets.
- Prefer `StatefulWidget` or a small local controller for mock-only interaction.
- Do not over-engineer with full production Riverpod state unless explicitly required.
- Mocks are isolated and must not reference other mocks.
- Use theme tokens where possible so previews feel realistic.
- No tests are required unless the mock adds reusable production components.

## Current Baseline

The first approved mock is an interactive stage-2 Flutter-only flow:

```text
Mobile Capture
  -> Upload Queue
  -> Draft Inbox
  -> Review Document
  -> optional Case assignment
```

The review question is whether Mobile Capture with Draft Inbox and optional
case assignment feels right as the MVP core. If accepted, the mock is converted
through a real UI/feature plan with Domain contracts, Riverpod providers, fake
repositories, tests, and later real implementations.
