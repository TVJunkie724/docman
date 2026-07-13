---
title: "Mappm - Pillar Enterprise Quality Contract"
description: "Verbindlicher Mindestvertrag fuer Mappm Produkt- und Governance-Saeulen"
tags: [pillars, governance, quality, roadmap]
lastUpdated: "2026-07-12"
status: "accepted"
owner: "product-concept"
---

# Mappm - Pillar Enterprise Quality Contract

## Status And Purpose

Accepted. A pillar is a durable responsibility space, not an implementation
epic. Every `docs/pillars/PILLAR_*.md` file adopting this contract must expose
its current milestone slice, later slice, dependencies, risks and handoff
boundaries without pretending the whole pillar is implemented at once.

## Required Rules

- The pillar document owns responsibility, boundaries and milestone slicing.
- Roadmap phases own implementation-sized work; GitHub Issues own actionable
  delivery; decisions own accepted product or architecture choices.
- Every phase using the pillar must name the exact pillar slice and applicable
  F/MP-DS/REG/SEC/DATA/AI/OPS/COM concepts.
- Frontend, backend, contract, data, security and quality work must have separate
  owners and linked handoffs where more than one implementation owner is needed.
- Sensitive data, accessibility, localization, support, observability and
  verification are applicable to every user-facing or operational slice. A
  phase may mark one not applicable only with a concrete reason.
- Verification is phase-specific and must name pass/fail evidence. Pillar-level
  acceptance means all required phase gates are linked, not that all future
  work is complete.

## Stop Rules

Stop when:

- a pillar becomes a broad implementation issue.
- a roadmap phase pulls work from the pillar without a bounded slice.
- owner boundaries are mixed or a frontend artifact decides backend internals.
- a release-relevant slice omits security, privacy, accessibility, operations,
  support or regulatory gates.
- deferred work has no owner, trigger, review date and target phase/issue.

## Verification And Handoff

- `product-concept` verifies pillar-to-roadmap coverage.
- `ui-concept-review` verifies UI-facing pillar slices before `ui-architect`.
- Specialist owners verify foundation, data, contract, security and quality
  slices.
- The next handoff must be an implementation-contract phase or a specialist
  planning issue; never the pillar document by itself.
