---
name: docman-ui-onboarding
description: Use before substantial UI, architecture, or implementation work in the DocMan Flutter workspace to understand the app structure, tech stack, Clean Architecture boundaries, Riverpod target architecture, and UI workflow constraints.
---

# DocMan UI Onboarding

Read this skill before planning, implementing, or auditing DocMan UI work.

## Project Structure

```text
docman/
├── lib/
│   ├── main.dart
│   ├── injection.dart               ← legacy GetIt setup until foundation migration
│   ├── data/
│   │   ├── local/
│   │   └── repositories/
│   ├── domain/
│   │   ├── entities/
│   │   ├── repositories/
│   │   └── workflows/
│   └── presentation/
│       ├── blocs/                   ← legacy BLoC setup until foundation migration
│       ├── screens/
│       ├── theme/
│       ├── utils/
│       └── widgets/
├── test/
└── assets/images/
```

## Stack

- Riverpod is the target architecture for state management and dependency injection.
- Existing `flutter_bloc` and GetIt code is spike/legacy code until the foundation migration is complete.
- Isar for local persistence. Schemas live in `lib/data/local/`.
- PocketBase access, if used, must go through repository interfaces.
- Freezed for immutable entities and union types.
- `font_awesome_flutter` is available for icons.

No NSwag or .NET backend assumptions.

## Clean Architecture Boundaries

```text
Presentation -> Domain -> Data
```

- Presentation may reference Domain interfaces and entities.
- Presentation must not import `lib/data/`.
- Riverpod feature-state providers must not call Isar or PocketBase directly.
- Data implements Domain repository interfaces.
- Entities live in `lib/domain/entities/`.
- Repository interfaces live in `lib/domain/repositories/`.
- Repository implementations live in `lib/data/repositories/`.

## Riverpod Conventions

- Use Riverpod as both state management and dependency injection.
- Model feature state with Notifier, AsyncNotifier, StreamProvider, or generated providers as appropriate.
- Screens are smart widgets that watch providers.
- Child widgets are dumb widgets that receive data via constructors.
- Handle loading, data, error, and empty states for async flows.
- Keep business logic out of `build()` methods.
- Keep local Flutter `StatefulWidget` state for visual-only concerns such as animation controllers, text controllers, focus, and scroll.

## UI Conventions

- Read `lib/presentation/theme/` before introducing visual tokens.
- Prefer existing shared widgets in `lib/presentation/widgets/`.
- Do not duplicate components when extension or reuse is possible.
- Use ASCII diagrams for planning. Do not use Mermaid for DocMan UI plans.
- Use `const` constructors where possible.
- Widget filename should match the widget class name.

## Before Implementation

1. Read this onboarding skill and the role-specific DocMan skill.
2. Inspect existing screens, providers or legacy blocs, widgets, domain entities, repositories, theme, and dependency setup.
3. Verify current health when required by the role: `flutter analyze` and `flutter test`.
4. Respect Clean Architecture boundaries throughout.
