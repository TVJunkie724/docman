---
name: ui-onboarding
description: Use before substantial Mappm Flutter work to understand the app structure, Commercial Core roadmap, Clean Architecture boundaries, Riverpod target architecture, Local/Cloud Vault providers, legacy debt, and UI workflow constraints.
---

# Mappm UI Onboarding

Read this skill before planning, implementing, or auditing Mappm Flutter work.

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
- SQLite + Drift is the target client structured persistence layer: authority
  for Local Vaults and cache/pending state for Cloud Vaults.
- Isar is legacy until migrated or removed. Do not add new Isar surface area.
- PocketBase is historical spike/backend-adapter code, not target architecture.
- Files and documents are stored separately from structured metadata.
- Secrets belong behind Secure Storage boundaries, not normal local DB tables.
- Freezed may be used for immutable entities and union types. Generated Dart artifacts are ignored and reproduced through `scripts/codegen.sh`.
- `font_awesome_flutter` is available for icons.

The managed backend direction is ASP.NET Core with PostgreSQL and
S3-compatible object storage behind OpenAPI contracts. Flutter must not import
server DTOs, storage SDKs or backend implementation details. Authentication and
device/entitlement state are required for every normal Local and Cloud mode.
Local Vault data remains local-authoritative and available under bounded
offline continuity; Detached Recovery preserves account-independent exit.
Provider, key and recovery details remain explicit decisions.

Home Hub, Tailscale pairing and customer self-hosting are superseded product
assumptions. `local-development-cloud` is developer-only infrastructure with
synthetic data and the same accepted contracts as managed environments.

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

## Product And Roadmap Anchors

- Commercial Core means every included slice is secure, tested, accessible,
  supportable, distributable and operable; no prototype-only release path.
- Foundation covers Riverpod, Local/Cloud repository providers, Drift authority
  semantics, secure boundaries, account/device sessions and migration state.
- Quality covers deterministic Local/Cloud fakes, Microcks, Local Development
  Cloud, migrations, cancellation/entitlement and target-path gates.
- Product slices include Core Assist in capture/review and guided document/case
  work; Advanced Assist, sharing and broader automation remain later.
- Cloud timing and cryptographic trust model remain explicit decision gates;
  implementation must not silently choose them.
- The process model has one `Case` entity. `Subvorgang` is only a UI role for
  `CaseLink(part_of)`; the target is a typed graph, not a folder tree or a
  separate Subcase model.
- A Case can remain a lightweight named document collection/context. Guided
  workflow and domain template are optional enrichments; the UI must not ask
  users to navigate a large Case-type taxonomy.
- Workflow stage, step, task, event, branch and Claim remain inside a Case until
  work gains its own independently understandable goal, lifecycle and outcome.
- `follow_up_to` links independent successor Cases as chains/branches without
  parent ownership; `caused_by` remains a separate confirmed causal relation.
- Guided, Assist-suggested and manual/Custom Cases use the same capabilities.
  Users can compose a parent/linked Case from selected documents, Records,
  tasks and Cases without copying or deleting content.
- A lightweight Custom Case may initially contain only a Backend/Core-Assist-
  generated editable title, Managed Subject and one document. Tasks, workflow
  and completion outcome are optional at that point.
- Global mobile/desktop capture is the primary ingestion path. Automatic
  analysis/matching always runs; `Neuen Vorgang starten` is the only primary
  optional pre-capture intent and never opens a blank metadata/title form.
- Current release Case/Record routing is confirmed from a concise visible
  result. Completed review requires a primary Case or Record. Mobile capture
  closes one explicit logical document before **Naechstes Dokument scannen**;
  all session/import items are matched per document and may not inherit one
  Case from session proximity.
- `Vorgänge` and `Unterlagen` are equal primary product areas. Unterlagen are
  durable Records such as passports, birth certificates, contracts, policies
  and warranties; documents/files are their evidence or versions.
- Contracts/subscriptions are calm Record contexts with recurring invoices,
  tasks and an optional minimal confirmed-value chart. Do not build an
  accounting dashboard.
- Managed subjects include people and, when release scope permits,
  organizations. External providers/issuers are ExternalParty, not managed
  organization profiles.
- Tax collection is country-/regime-/period-specific review support only. UI
  must not claim deductibility, calculate tax, provide advice or file returns.
- Agenda is a focused tasks/deadlines/appointments/expected-responses view,
  not a general calendar; external calendar sync remains opt-in and later.
- Medical Case types, care-course boundaries, reimbursement composition and
  relationship defaults are still open in
  `docs/discovery/MEDICAL_CASE_MODEL_DISCOVERY.md`. Do not treat its candidate
  families or examples as accepted decisions.
- OQ-011 blocks final Document-/Case-taxonomy implementation; OQ-012 blocks
  medical workflow/record/claim implementation, not generic capture or CaseLink
  mechanics.

GitHub Issues are the source of truth for actionable follow-up work. Accepted decisions stay in `docs/technical/DECISION_*.md`.

## Verification Scripts

- `scripts/bootstrap.sh`: fresh checkout setup and codegen; optional strict verify with `--verify`.
- `scripts/codegen.sh`: Freezed/JSON/Drift generation; generated Dart artifacts are local build output, not source of truth.
- `scripts/verify.sh`: strict local gate. It may currently fail until R3 narrows checks to the target path and removes legacy leaks.

## UI Conventions

- Read `lib/presentation/theme/` before introducing visual tokens.
- Prefer existing shared widgets in `lib/presentation/widgets/`.
- Do not duplicate components when extension or reuse is possible.
- Nutze ASCII fuer kompakte Code- und Dateifluss-Skizzen. Nutze Mermaid fuer
  komplexe Beziehungen, wenn das Zielartefakt es unterstuetzt. Diagramme
  ersetzen niemals die exakte textuelle Spezifikation.
- Use `const` constructors where possible.
- Widget filename should match the widget class name.

## Before Implementation

1. Read this onboarding skill and the role-specific Mappm skill.
2. Inspect existing screens, providers or legacy blocs, widgets, domain entities, repositories, theme, and dependency setup.
3. Verify current health when required by the role: prefer `scripts/verify.sh`; otherwise run targeted `flutter analyze`, `flutter test`, or `scripts/codegen.sh`.
4. Respect Clean Architecture boundaries throughout.
