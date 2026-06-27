# ADR-0001 - Design System Structure

## Status

Accepted draft.

## Decision

Ordna keeps a dedicated design-system area under:

```text
docs/design-system/
```

The structure follows the reviewable pattern used by the MatchMia design-system
workspace:

- `Brand/` for stakeholder-readable brand direction.
- `Decisions/` for short design decision records.
- `Mock/` for a static HTML review surface.
- `concepts/` for normative design-system source-of-truth documents.

## Rationale

Ordna needs visual decisions before the Flutter rebuild starts. Otherwise R2/R3
can become technically clean but visually inconsistent.

The static HTML mock gives the user a fast way to review corporate design,
palette, typography, and shell direction without waiting for Flutter
implementation.

## Consequences

- Flutter UI work must not invent its own visual language without checking this
  design-system area.
- Current documents are draft planning input, not production Flutter tokens.
- Stable visual decisions should be promoted to ADRs and concept documents.
