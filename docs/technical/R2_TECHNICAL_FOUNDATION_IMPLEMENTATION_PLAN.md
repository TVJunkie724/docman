---
title: "R2 Technical Foundation Implementation Plan"
description: "Implementation-ready plan for migrating the current DocMan Flutter spike into the R2 foundation baseline"
tags: [implementation-plan, r2, foundation, flutter, riverpod, drift, clean-architecture]
lastUpdated: "2026-05-01"
status: "proposed"
sourceIssue: "https://github.com/TVJunkie724/docman/issues/4"
---

# R2 Technical Foundation Implementation Plan

## 0. Git Branch

- Branch name: `codex/r2-technical-foundation`
- Base branch: `master`
- Merge strategy: merge commit, no rebase

Before implementation:

```bash
git checkout master
git pull --no-rebase origin master
git checkout -b codex/r2-technical-foundation
```

After implementation:

```bash
flutter analyze
flutter test
git status --short
```

## 1. Summary

R2 turns the current Flutter spike into a clean foundation for the MVP.

The implementation migrates new work to:

- Riverpod for app state and dependency injection.
- SQLite + Drift for structured local data.
- repository boundaries instead of direct SDK coupling.
- explicit Failure/Result types.
- config and secure-storage boundaries for Home Hub pairing.
- fakes and test helpers for future UI work.
- a real DocMan test baseline.

R2 does not implement the full Desktop MVP, Mobile Capture, Home Hub, sync backend, OCR, LLM, app distribution, or complete product rename.

## 2. Architecture Layout (ASCII)

```text
lib/
  main.dart
  app/
    app.dart
    bootstrap/
      app_bootstrap.dart
      app_startup.dart
    providers/
      app_providers.dart
  core/
    config/
      app_config.dart
      app_mode.dart
      config_repository.dart
    errors/
      app_failure.dart
      result.dart
    logging/
      app_logger.dart
      redaction.dart
    security/
      secure_storage_repository.dart
      secure_storage_keys.dart
    storage/
      app_file_store.dart
      local_database.dart
    sync/
      sync_metadata.dart
      sync_status.dart
    time/
      clock.dart
  features/
    cases/
      domain/
      data/
      presentation/
    documents/
      domain/
      data/
      presentation/
    draft_inbox/
      domain/
      data/
      presentation/
    home_hub/
      domain/
      data/
      presentation/
    profiles/
      domain/
      data/
      presentation/
  shared/
    testing/
      fake_data.dart
      provider_overrides.dart

legacy during R2:
  lib/injection.dart
  lib/data/local/isar_*
  lib/data/repositories/pocketbase_*
  lib/presentation/blocs/*
  lib/presentation/screens/* incident/draft spike screens
```

## 2.1 Foundation UI Widget Tree (ASCII)

R2 does not design the final MVP UI. It may introduce only a minimal foundation status surface so startup, providers, and fakes can be verified without PocketBase/Isar.

```text
ProviderScope
  DocManApp
    MaterialApp
      FoundationStatusScreen
        Scaffold
          AppBar
            Text(working product name)
          SafeArea
            ListView
              FoundationStatusHeader
              StatusTile(Local database)
              StatusTile(App mode)
              StatusTile(Home Hub pairing)
              StatusTile(Secure storage)
              StatusTile(Log redaction)
              LegacyRouteNotice
```

Widget ownership:

- `DocManApp` owns app theme and routing.
- `FoundationStatusScreen` reads providers only.
- `StatusTile` is dumb UI and receives label/status/semantic description.
- no foundation UI widget imports `lib/data`, Drift, Isar, PocketBase, or secure-storage SDKs.

## 3. Current Spike Findings

Existing files that R2 must treat as spike/legacy:

- `lib/main.dart` initializes Isar and uses a global `themeNotifier`.
- `lib/injection.dart` registers GetIt, PocketBase, Isar, cached repositories, and BLoCs.
- `lib/domain/repositories/i_auth_repository.dart` imports `package:pocketbase/pocketbase.dart`, so Domain is not clean.
- `lib/domain/entities/incident.dart`, `document.dart`, `task.dart` still use `Incident` naming.
- `lib/data/local/isar_service.dart` and `isar_collections.dart` are Isar-based.
- `lib/data/repositories/pocketbase_*` are backend-SDK implementations.
- `lib/presentation/blocs/*` and `lib/presentation/screens/login_screen.dart` use BLoC/GetIt.
- `test/widget_test.dart` still expects Flutter template `MyApp` and counter UI.
- `pubspec.yaml` does not yet include Riverpod, Drift, secure storage, or test helpers needed by R2.

R2 does not delete all spike code immediately. It creates a target path, migrates foundation services, and marks/removes legacy paths only when no active route depends on them.

## 4. State Design (Riverpod)

### Ownership

App-level providers live under:

```text
lib/app/providers/
lib/core/**/
```

Feature providers live under:

```text
lib/features/<feature>/presentation/providers/
```

Data providers expose repository implementations. Feature-state providers consume repository contracts, not Drift, PocketBase, Isar, filesystem APIs, or secure-storage SDKs directly.

### App Provider Diagram

```text
ProviderScope
  -> appConfigProvider
  -> appModeProvider
  -> clockProvider
  -> idGeneratorProvider
  -> appLoggerProvider
  -> localDatabaseProvider
  -> appFileStoreProvider
  -> secureStorageRepositoryProvider
  -> caseRepositoryProvider
  -> documentRepositoryProvider
  -> draftInboxRepositoryProvider
  -> homeHubClientProvider
```

### Initial Provider Set

R2 creates these provider boundaries:

| Provider | File | Responsibility |
|---|---|---|
| `appConfigProvider` | `lib/app/providers/app_providers.dart` or `lib/core/config/config_providers.dart` | current app mode, non-secret runtime config |
| `clockProvider` | `lib/core/time/clock.dart` | deterministic time in tests |
| `idGeneratorProvider` | `lib/core/id/id_generator.dart` | deterministic IDs in tests |
| `appLoggerProvider` | `lib/core/logging/app_logger.dart` | redacted logging boundary |
| `localDatabaseProvider` | `lib/core/storage/local_database.dart` | opens Drift database |
| `appFileStoreProvider` | `lib/core/storage/app_file_store.dart` | owns document file paths and future encrypted payload boundary |
| `secureStorageRepositoryProvider` | `lib/core/security/secure_storage_repository.dart` | secrets only |
| `caseRepositoryProvider` | `lib/features/cases/data/case_repository_provider.dart` | Drift-backed case repository |
| `documentRepositoryProvider` | `lib/features/documents/data/document_repository_provider.dart` | Drift/file-backed document repository |
| `draftInboxRepositoryProvider` | `lib/features/draft_inbox/data/draft_inbox_repository_provider.dart` | draft and upload queue metadata |
| `homeHubClientProvider` | `lib/features/home_hub/data/home_hub_client_provider.dart` | fake/client boundary, no real backend required in R2 |

### Data Flow

```text
Widget
  watches Provider/Notifier
    calls Application command/query
      calls Domain Repository contract
        implemented by Data repository
          uses Drift / file store / secure storage / fake Home Hub
```

## 5. Repository Integration

### Target Repository Contracts

Create target contracts in feature domains. These names replace `IIncidentRepository` style for new target code:

```text
lib/features/cases/domain/entities/case.dart
lib/features/cases/domain/repositories/case_repository.dart
lib/features/documents/domain/entities/document.dart
lib/features/documents/domain/repositories/document_repository.dart
lib/features/draft_inbox/domain/entities/draft_document.dart
lib/features/draft_inbox/domain/repositories/draft_inbox_repository.dart
lib/features/home_hub/domain/repositories/home_hub_client.dart
lib/features/profiles/domain/entities/profile.dart
lib/features/profiles/domain/repositories/profile_repository.dart
```

R2 uses new target types instead of renaming every existing generated `Incident` file in place. Legacy `Incident` code remains isolated until feature migration.

### Required Method Shape

The exact Dart signatures are implementation detail, but each repository must support these capabilities:

- watch open cases by profile.
- load case by ID.
- create/update case locally.
- soft-delete or close case without hard sync-breaking delete.
- watch documents by case.
- create local document metadata.
- create draft document from local file reference.
- watch draft inbox.
- persist upload queue item and status.
- read/write non-secret Home-Hub config.
- read/write pairing/session secret only through secure storage.

All methods that can fail for expected reasons return the R2 Result/Failure model, not raw exceptions.

## 6. Slice Plan

### Slice R2.1 - Dependency And Bootstrap Foundation

Goal: Add Riverpod, Drift, secure storage, and new app bootstrap without changing product behavior more than necessary.

Files edited:

- `pubspec.yaml`
- `pubspec.lock`
- `lib/main.dart`

Files added:

- `lib/app/app.dart`
- `lib/app/bootstrap/app_bootstrap.dart`
- `lib/app/providers/app_providers.dart`
- `lib/core/time/clock.dart`
- `lib/core/id/id_generator.dart`

Dependency commands:

```bash
flutter pub add flutter_riverpod riverpod_annotation drift drift_flutter sqlite3_flutter_libs path flutter_secure_storage
flutter pub add --dev drift_dev
flutter pub get
```

Implementation note: R2.1 uses manual Riverpod providers. `riverpod_generator`, `riverpod_lint`, and `custom_lint` are deferred until the Flutter/analyzer/codegen stack is upgraded far enough to resolve cleanly with current `drift_dev`.

Implementation rules:

- `main.dart` calls a bootstrap function and runs `ProviderScope`.
- `DocManApp` moves to `lib/app/app.dart`.
- Global `themeNotifier` is not expanded. It may remain temporarily or be wrapped by a Riverpod provider in the next slice.
- Do not initialize Isar in the target bootstrap.
- Do not remove `lib/injection.dart` until routes no longer need legacy screens.

Acceptance:

- `ProviderScope` wraps the app.
- app starts through a target bootstrap path.
- no new GetIt registrations.
- no new BLoCs.
- legacy bootstrap remains isolated.

Verification:

```bash
flutter pub get
flutter analyze
```

### Slice R2.2 - Core Failure, Result, Logging, Config

Goal: Establish shared foundation types before repositories grow.

Files added:

- `lib/core/errors/app_failure.dart`
- `lib/core/errors/result.dart`
- `lib/core/logging/app_logger.dart`
- `lib/core/logging/redaction.dart`
- `lib/core/config/app_config.dart`
- `lib/core/config/app_mode.dart`
- `lib/core/config/config_repository.dart`
- `lib/core/sync/sync_status.dart`
- `lib/core/sync/sync_metadata.dart`

Core requirements:

- `AppFailure` covers F5 categories: validation, localStorage, secureStorage, network, auth, upload, conflict, permission, parse, unexpected.
- `Result<T>` supports success/failure without exposing SDK exceptions.
- logger has explicit redaction helpers.
- config separates non-secret Home-Hub URL from secrets.
- sync metadata includes local ID, optional remote ID, created/updated/deleted timestamps, dirty/sync status, optional revision.

Acceptance:

- Domain/Application can represent expected errors without throwing raw SDK exceptions.
- logging helpers reject or redact sensitive values by convention.
- no document contents, OCR text, pairing tokens, or sensitive metadata are logged.
- config model supports local-only and Home-Hub-connected modes.

Verification:

```bash
flutter analyze
flutter test test/core/errors/result_test.dart test/core/logging/redaction_test.dart
```

### Slice R2.3 - Drift Local Database Skeleton

Goal: Introduce SQLite + Drift as target persistence without fully migrating every feature.

Files added:

- `lib/core/storage/local_database.dart`
- `lib/core/storage/local_database_connection.dart`
- `lib/core/storage/tables/cases_table.dart`
- `lib/core/storage/tables/documents_table.dart`
- `lib/core/storage/tables/drafts_table.dart`
- `lib/core/storage/tables/upload_queue_table.dart`
- `lib/core/storage/tables/profiles_table.dart`
- generated Drift file from build runner

Files isolated:

- `lib/data/local/isar_service.dart`
- `lib/data/local/isar_collections.dart`
- `lib/data/local/isar_collections.g.dart`

Schema minimum:

- cases table with local ID, optional remote ID, title, description, owner profile ID, type, status, tags JSON, workflow type, created/updated/deleted, sync status/revision.
- documents table with local ID, optional remote ID, case ID, title, sender, document type, local file reference, hash, MIME type, size, draft flag, created/updated/deleted, sync status/revision.
- drafts table with draft ID, optional case ID, file reference, source, note, review status, created/updated.
- upload queue table with upload ID, file reference, optional case ID, target Home Hub ID/address key, status, retry count, last failure code, created/updated.
- profiles table with profile ID, display name, avatar reference, sensitive metadata minimized.

Rules:

- No large document BLOBs in SQLite.
- No secrets in SQLite.
- Drift table classes remain in Data/Core storage only.
- Future E2EE is not blocked: document file references must allow encrypted payloads later.

Acceptance:

- Drift database opens in app documents/support directory.
- schema version starts at `1`.
- tables include sync-ready fields.
- Isar is not used by target repositories.

Verification:

```bash
dart run build_runner build --delete-conflicting-outputs
flutter analyze
flutter test test/core/storage/local_database_test.dart
```

### Slice R2.4 - File Store And Secure Storage Boundaries

Goal: Separate document payloads and secrets from structured metadata.

Files added:

- `lib/core/storage/app_file_store.dart`
- `lib/core/storage/stored_file_ref.dart`
- `lib/core/security/secure_storage_repository.dart`
- `lib/core/security/flutter_secure_storage_repository.dart`
- `lib/core/security/in_memory_secure_storage_repository.dart`
- `test/fakes/fake_secure_storage_repository.dart`

File store capabilities:

- create stable app-managed file reference.
- copy/import a file into app storage.
- read/delete local file by reference.
- compute optional hash.
- leave room for encrypted payload storage later.

Secure storage capabilities:

- read/write/delete pairing secret.
- read/write/delete session token.
- read/write/delete device secret.
- clear Home-Hub secrets without deleting local documents.

Acceptance:

- Secrets do not enter Drift tables.
- lost secure storage implies re-pairing, not data deletion.
- file store never logs private filenames without redaction.

Verification:

```bash
flutter analyze
flutter test test/core/security/secure_storage_repository_test.dart test/core/storage/app_file_store_test.dart
```

### Slice R2.5 - Target Domain Contracts And Fakes

Goal: Create DocMan target repository boundaries and fake implementations.

Files added:

- `lib/features/cases/domain/entities/case.dart`
- `lib/features/cases/domain/repositories/case_repository.dart`
- `lib/features/cases/data/fake_case_repository.dart`
- `lib/features/documents/domain/entities/document.dart`
- `lib/features/documents/domain/repositories/document_repository.dart`
- `lib/features/documents/data/fake_document_repository.dart`
- `lib/features/draft_inbox/domain/entities/draft_document.dart`
- `lib/features/draft_inbox/domain/entities/upload_queue_item.dart`
- `lib/features/draft_inbox/domain/repositories/draft_inbox_repository.dart`
- `lib/features/draft_inbox/data/fake_draft_inbox_repository.dart`
- `lib/features/home_hub/domain/entities/home_hub_status.dart`
- `lib/features/home_hub/domain/repositories/home_hub_client.dart`
- `lib/features/home_hub/data/fake_home_hub_client.dart`
- `lib/shared/testing/fake_data.dart`

Rules:

- Use `Case`, not `Incident`, in target files.
- Domain entities do not import Flutter, Riverpod, Drift, Isar, PocketBase, or secure-storage SDKs.
- Fakes use synthetic household data only.
- Fake Home Hub supports reachable, unreachable, auth failure, upload failure, invalid case ID fallback.

Acceptance:

- target repositories can be provided via Riverpod overrides.
- fake data contains no private or real household data.
- no target domain file imports `package:pocketbase`, `package:isar`, `package:drift`, or `package:flutter`.

Verification:

```bash
rg "Incident|PocketBase|Isar|Drift|package:flutter" lib/features/*/domain lib/shared/testing
flutter analyze
flutter test test/features/cases/fake_case_repository_test.dart test/features/draft_inbox/fake_draft_inbox_repository_test.dart
```

### Slice R2.6 - Drift Repository Implementations

Goal: Back target repositories with Drift and file store for local-first behavior.

Files added:

- `lib/features/cases/data/drift_case_repository.dart`
- `lib/features/cases/data/case_mappers.dart`
- `lib/features/documents/data/drift_document_repository.dart`
- `lib/features/documents/data/document_mappers.dart`
- `lib/features/draft_inbox/data/drift_draft_inbox_repository.dart`
- `lib/features/draft_inbox/data/draft_mappers.dart`

Rules:

- map Drift rows to target Domain types.
- catch Drift/file exceptions and map to `AppFailure.localStorage`.
- hard delete only for clearly temporary data; sync-relevant records use tombstones/soft delete.
- upload queue retry increments do not duplicate items.
- documents store local file references, not BLOBs.

Acceptance:

- target repositories are local-first and do not call PocketBase.
- repository streams can feed Riverpod providers.
- expected storage failures are returned as Failures.

Verification:

```bash
flutter analyze
flutter test test/features/cases/drift_case_repository_test.dart test/features/documents/drift_document_repository_test.dart test/features/draft_inbox/drift_draft_inbox_repository_test.dart
```

### Slice R2.7 - Riverpod Provider Wiring

Goal: Wire target dependencies with Riverpod and keep legacy isolated.

Files added/edited:

- `lib/app/providers/app_providers.dart`
- `lib/features/cases/data/case_repository_provider.dart`
- `lib/features/documents/data/document_repository_provider.dart`
- `lib/features/draft_inbox/data/draft_inbox_repository_provider.dart`
- `lib/features/home_hub/data/home_hub_client_provider.dart`
- `lib/shared/testing/provider_overrides.dart`

Provider rules:

- production mode uses Drift repositories.
- dev fake mode can use fakes and is visible/configured.
- tests use provider overrides.
- feature-state providers do not import Data.

Acceptance:

- ProviderContainer tests can override every external boundary.
- no target path uses GetIt.
- no target path creates BLoCs.
- existing legacy screens still compile until replaced.

Verification:

```bash
flutter analyze
flutter test test/app/providers/provider_overrides_test.dart
rg "getIt|flutter_bloc|Bloc<|Cubit<" lib/app lib/core lib/features lib/shared
```

### Slice R2.8 - Minimal Foundation UI Shell And Spike Isolation

Goal: Give the app a target root that can run without PocketBase/Isar while keeping R3 UI work separate.

Files edited:

- `lib/app/app.dart`
- `lib/main.dart`
- `lib/presentation/screens/login_screen.dart` only if necessary to stop startup from requiring PocketBase login

Files added:

- `lib/app/routing/app_router.dart`
- `lib/features/settings/presentation/screens/foundation_status_screen.dart`

R2 UI scope:

- simple foundation status screen is allowed.
- it may show local-only mode, Drift database ready, fake/real mode, Home-Hub unconfigured, and security baseline labels.
- it must not pretend to be the final Desktop MVP.

ASCII layout:

```text
+------------------------------------------------------+
| Working-name app shell                               |
+------------------------------------------------------+
| Foundation Status                                    |
|                                                      |
| [Local DB: ready]        [Mode: Local only]           |
| [Home Hub: not paired]   [Storage: app local]         |
| [Secrets: secure store]  [Logs: redacted]            |
|                                                      |
| Existing spike screens remain behind legacy route    |
+------------------------------------------------------+
```

Acceptance:

- app can start without `http://YOUR_NAS_IP:8090`.
- no product path requires PocketBase.
- no final MVP UI is implied by the foundation status screen.
- legacy spike screens are clearly not the target product path.

Verification:

```bash
flutter analyze
flutter test test/app/app_smoke_test.dart
```

### Slice R2.9 - Test Baseline Replacement

Goal: Replace template tests with DocMan foundation tests.

Files edited/deleted:

- `test/widget_test.dart`

Files added:

- `test/app/app_smoke_test.dart`
- `test/core/errors/result_test.dart`
- `test/core/logging/redaction_test.dart`
- `test/core/security/secure_storage_repository_test.dart`
- `test/features/draft_inbox/upload_queue_state_test.dart`
- `test/shared/testing/provider_overrides_test.dart`

Rules:

- remove counter `MyApp` test.
- no real private files, addresses, or secrets in fixtures.
- use ProviderScope/ProviderContainer overrides.
- test failure categories with hard assertions.

Acceptance:

- test names describe DocMan behavior.
- `flutter test` passes.
- no template counter assertions remain.

Verification:

```bash
rg "Counter|MyApp|increments smoke" test
flutter test
```

### Slice R2.10 - Legacy Cleanup Gate

Goal: Decide what can be removed, what remains isolated, and what must wait for R3.

Inspect:

- `lib/injection.dart`
- `lib/data/local/isar_*`
- `lib/data/repositories/pocketbase_*`
- `lib/presentation/blocs/*`
- `lib/presentation/screens/*`
- generated `*.freezed.dart`, `*.g.dart`

Allowed in R2:

- remove or stop routing to legacy startup paths if target app no longer depends on them.
- keep legacy files under a documented compatibility section if R3 still references them.
- delete generated files only when their source files are removed and build output is regenerated.

Not allowed:

- destructive deletion without confirming target app and tests pass.
- partial rename from Incident to Case that leaves broken generated code.
- deleting user/unrelated iOS/macOS changes.

Acceptance:

- `git status --short` shows only intentional R2 changes.
- target `lib/app`, `lib/core`, `lib/features`, and `lib/shared` paths are free of legacy GetIt/BLoC/PocketBase/Isar imports.
- remaining legacy files are not on the app startup path.

Verification:

```bash
flutter analyze
flutter test
rg "getIt|flutter_bloc|PocketBase|Isar|IsarService" lib/app lib/core lib/features lib/shared
git status --short
```

## 7. Dependency And Package Notes

Add packages through `flutter pub add` during implementation so the lockfile records compatible current versions.

Required target dependencies:

- `flutter_riverpod`
- `riverpod_annotation`
- `drift`
- `drift_flutter`
- `sqlite3_flutter_libs`
- `path`
- `flutter_secure_storage`

Required target dev dependencies:

- `drift_dev`

Deferred target dev dependencies:

- `riverpod_generator`
- `riverpod_lint`
- `custom_lint`

These are deferred because the current Flutter SDK pins analyzer/meta versions that do not resolve cleanly with current Drift and Riverpod codegen at the same time. R2 uses manual providers until this dependency stack can be upgraded safely.

Legacy dependencies may remain temporarily until unused imports are gone:

- `flutter_bloc`
- `get_it`
- `isar`
- `isar_flutter_libs`
- `isar_generator`
- `pocketbase`

Remove legacy dependencies only after `rg` confirms there are no imports and `flutter analyze` passes.

## 8. Responsive Behavior

R2 has no final MVP UI. Any foundation status screen must:

- work at desktop widths above 1024 px.
- collapse into one column below 700 px.
- avoid blocking text overflow.
- use existing `ThemeData` while avoiding new brand-heavy visuals because product name is still open.

R3 will own product UI layout and feature screens.

## 9. Design Tokens

R2 does not redesign the UI system.

Allowed:

- reuse `lib/presentation/theme/app_theme.dart`.
- add minimal semantic status colors only if needed for foundation status screen.

Not allowed:

- new brand palette.
- logo/name expansion.
- design-system refactor.

Reason: product name is open in Issue #13.

## 10. Interactions And States

R2 target states that must exist at least as model/test concepts:

- local only.
- Home Hub unconfigured.
- Home Hub unreachable.
- paired.
- auth/pairing invalid.
- upload queued.
- upload failed retryable.
- review required.
- local storage failure.
- secure storage failure.

These states are shown only in simple foundation/dev surfaces during R2 when a visual verification surface exists. R3 will define product UX.

## 11. Accessibility

Any R2 UI surface must:

- expose text labels for status chips.
- not rely on color alone.
- keep focus order top-to-bottom.
- avoid animated-only status changes.
- avoid showing sensitive data in screen-reader labels.

R2 tests do not need a full accessibility audit; R3 UI plans will.

## 12. Test Plan

Minimum tests before R2 can be considered done:

| Test | Required assertion |
|---|---|
| app smoke | app pumps with ProviderScope and no PocketBase URL |
| provider overrides | fake repositories replace real providers in ProviderContainer |
| result/failure | expected failure returns `AppFailure`, not raw exception |
| redaction | tokens/document text are removed or replaced before logging |
| secure storage fake | secrets can be written/read/deleted without OS keychain |
| local DB | Drift DB opens and migrates schema 1 |
| repository fake | fake case/document/draft repositories return deterministic synthetic data |
| upload queue | queued item survives repository round trip and retry does not duplicate |

### Required Cases Per Testable Unit

For each testable unit introduced in R2, the builder creates at least these cases or documents why the unit is pure data with no behavior beyond construction:

Happy paths:

- successful read/load/watch using synthetic data.
- successful write/update/delete or equivalent command with exact state assertion.

Unhappy paths:

- expected failure maps to `AppFailure` without raw exception in Presentation-facing result.
- missing/unavailable dependency produces recoverable failure or explicit setup failure.

Edge cases:

- empty data set.
- duplicate ID or repeated retry command.
- deleted/tombstoned record.
- offline/Home-Hub-unreachable state where applicable.
- sensitive value passed through logger/redaction boundary.

Full verification:

```bash
flutter analyze
flutter test
rg "TODO|FIXME|HACK|print\\(" lib/app lib/core lib/features lib/shared test
rg "getIt|flutter_bloc|PocketBase|Isar|IsarService" lib/app lib/core lib/features lib/shared
```

## 13. Definition Of Done

R2 is done when:

- `ProviderScope` is the app root.
- new target paths exist under `lib/app`, `lib/core`, `lib/features`, and `lib/shared`.
- Riverpod provides app/config/storage/security/repository dependencies.
- Drift is the target local database for structured data.
- document files and secrets are separate from Drift.
- target Domain has no Flutter/Riverpod/Drift/Isar/PocketBase imports.
- target Presentation has no Data imports.
- expected failures use the R2 Failure/Result model.
- logs do not include document contents, OCR text, tokens, or sensitive metadata.
- fake repositories and provider overrides support UI/test work.
- template counter test is gone.
- `flutter analyze` passes.
- `flutter test` passes.
- remaining legacy BLoC/GetIt/Isar/PocketBase paths are isolated or removed.
- Issue #4 can be closed with verification evidence.

## 14. Open Constraints

These are not blockers for writing R2, but they must be respected during implementation:

- Product name remains open in Issue #13; avoid brand-heavy UI and broad rename work.
- Full backend technology remains draft; R2 must use `HomeHubClient`/repository boundaries, not a concrete server SDK.
- Exact encryption/key-management is future work; R2 must not block it.
- Full mobile capture implementation is R3; R2 only prepares queue/storage/pairing boundaries.
- Full Case rename from legacy `Incident` is migration work; R2 creates target `Case` paths without risky big-bang generated-code edits.

## 15. Builder Handoff

Recommended first builder order:

1. Slice R2.1.
2. Slice R2.2.
3. Slice R2.3.
4. Slice R2.4.
5. Slice R2.5.
6. Stop and run review before continuing to R2.6-R2.10.

Reason: the first five slices establish architecture boundaries. Repository implementation and legacy cleanup starts only after those boundaries compile and test.
