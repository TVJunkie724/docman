---
title: "MP-DS-07 Platform Adaptation"
description: "Platform adaptation contract for Mappm desktop and mobile UI"
tags: [design-system, platform, desktop, mobile, flutter]
lastUpdated: "2026-07-12"
status: "active-draft"
owner: "ui-concept/platform"
---

# MP-DS-07 Platform Adaptation

## Scope

Defines product-level adaptation for macOS and mobile capture first, with iOS,
Android and later Windows/Linux gates. It does not authorize native plugins,
permissions or packaging choices without foundation/platform planning.

## Required Adaptation

| Area | Desktop | Mobile |
|---|---|---|
| Navigation | persistent shell/sidebar where space permits | compact navigation, sheets/fullscreen selection |
| Input | keyboard, pointer, drag/drop and file picker | touch targets, camera/scan and permission recovery |
| Workbench | list/detail/preview compositions | single-task capture/review progression |
| Feedback | inline/panel feedback without sensitive shell leakage | interruption-safe queue/offline feedback |
| Lifecycle | window resize, resume and multi-window decision | background/resume, permission changes, interrupted upload |

## Platform Gates

- Every phase names supported platforms and explicit non-goals.
- Permission denial and later settings recovery are specified.
- Platform-native behavior may vary, but domain result, privacy and terminology
  remain consistent.
- Store, signing, entitlements and native dependency review belong to release,
  compliance and foundation owners.

## Verification And Stop Rules

Plans require responsive/widget evidence plus real target-platform smoke checks
where native behavior is involved. Stop if a phase says "responsive" without
reference sizes/states, assumes one platform's permission model for another, or
adds a native dependency without owner and release impact. Handoff to
`ui-architect` for UI and `foundation-builder` for native/platform work.
