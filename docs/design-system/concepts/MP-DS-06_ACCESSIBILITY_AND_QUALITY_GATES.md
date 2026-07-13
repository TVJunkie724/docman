---
title: "MP-DS-06 Accessibility And Quality Gates"
description: "Accessibility, responsive and visual verification contract for Mappm"
tags: [design-system, accessibility, quality, visual-qa]
lastUpdated: "2026-07-12"
status: "active-baseline"
owner: "ui-concept/quality-readiness"
---

# MP-DS-06 Accessibility And Quality Gates

## Baseline

Accessibility is a product requirement from the first UI slice, independent of
the final legal applicability assessment. Applicable phases additionally check
the European Accessibility Act and selected store/platform rules against the
dated regulatory register.

## Required Gates

- semantics and accessible names for controls, fields, status and document
  preview actions.
- deterministic keyboard traversal, visible focus and escape/cancel behavior.
- no meaning through color, position, animation or icon alone.
- text scaling and long German copy without clipping or overlap.
- reduced-motion behavior and interruption-safe progress.
- contrast evidence for text, controls, focus and status roles.
- desktop and mobile screenshots/goldens for approved reference sizes.
- synthetic content only; screenshots and diagnostics contain no private data.

## Evidence

Each UI plan names exact semantics/widget/golden/manual checks and pass/fail
criteria. Visual evidence must use stable fonts/assets and record viewport,
platform and state. A review note without reproducible evidence is not a gate.

## Stop Rules And Handoff

Stop if keyboard, semantics, text scale, contrast, responsive layout or reduced
motion is unspecified. `ui-plan-review` verifies the plan; `ui-auditor` verifies
the implementation evidence; `quality-readiness` owns shared test tooling.
