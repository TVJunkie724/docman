---
name: ui-onboarding
description: Use before substantial DocMan Flutter work to understand the app structure, rebuild roadmap, Clean Architecture boundaries, Riverpod target architecture, Drift/local-first direction, legacy debt, and UI workflow constraints.
---

# DocMan UI Onboarding

Read this skill before planning, implementing, or auditing DocMan Flutter work.

## Project Structure

```text
docman/
├── lib/
│   ├── app/                        ← current Riverpod bootstrap and app shell
│   ├── core/                       ← cross-cutting clock/id/etc. helpers
│   ├── main.dart
│   ├── injection.dart              ← legacy GetIt setup until migration removes it
│   ├── data/
│   │   ├── local/                  ← legacy Isar plus future Drift during migration
│   │   └── repositories/
│   ├── domain/
│   │   ├── entities/
│   │   ├── repositories/
│   │   └── workflows/
│   └── presentation/
│       ├── blocs/                  ← legacy BLoC setup until migration removes it
│       ├── screens/
│       ├── theme/
│       ├── utils/
│       └── widgets/
├── test/
├── scripts/
│   ├── bootstrap.sh
│   ├── codegen.sh
│   └── verify.sh
└── assets/images/
```

## Stack

- Riverpod is the target architecture for state management and dependency injection.
- Existing `flutter_bloc` and GetIt code is legacy/spike code. Do not expand it except for temporary compatibility explicitly required by an approved migration plan.
- SQLite + Drift is the target local structured persistence layer.
- Isar is legacy until migrated or removed. Do not add new Isar surface area.
- PocketBase is historical spike/backend-adapter code, not target architecture.
- Files and documents are stored separately from structured metadata.
- Secrets belong behind Secure Storage boundaries, not normal local DB tables.
- Freezed may be used for immutable entities and union types. Generated Dart artifacts are ignored and reproduced through `scripts/codegen.sh`.
- `font_awesome_flutter` is available for icons.

No NSwag, .NET, PocketBase, cloud-first, or mandatory OAuth assumptions.

## Clean Architecture Boundaries

```text
Presentation -> Domain -> Data
```

- Presentation may reference Domain interfaces and entities.
- Presentation must not import `lib/data/`.
- Riverpod feature-state providers must not call Drift, Isar, PocketBase, file storage, or HTTP clients directly.
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

## Rebuild Roadmap Anchors

- R2 Technical Foundation: bootstrap, Riverpod, Drift direction, secure boundaries, migration away from legacy patterns.
- R3 Quality & Production Readiness: tests, fake repositories, Microcks/contract mocks, scripts, target-path analyzer/format gates, legacy isolation/removal.
- R4/M2 Capture and Review Core: first product slice after foundation/quality.
- R5/M3 Assisted Review: OCR/extraction suggestions for metadata so optional fields do not become permanent manual work.

GitHub Issues are the source of truth for actionable follow-up work. Accepted decisions stay in `docs/technical/DECISION_*.md`.

## Verification Scripts

- `scripts/bootstrap.sh`: fresh checkout setup and codegen; optional strict verify with `--verify`.
- `scripts/codegen.sh`: Freezed/JSON/Drift generation; generated Dart artifacts are local build output, not source of truth.
- `scripts/verify.sh`: strict local gate. It may currently fail until R3 narrows checks to the target path and removes legacy leaks.

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
3. Verify current health when required by the role: prefer `scripts/verify.sh`; otherwise run targeted `flutter analyze`, `flutter test`, or `scripts/codegen.sh`.
4. Respect Clean Architecture boundaries throughout.
