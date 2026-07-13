---
title: "Mappm - Release Readiness Phases"
description: "Release, store, CI/CD, support and operations gates that must stay planned"
tags: [roadmap, release, cicd, store, support, playbook]
lastUpdated: "2026-07-12"
status: "active-baseline"
owner: "release/quality"
---

# Mappm - Release Readiness Phases

## Purpose

Release readiness is staged. It starts with local verification and ends with
store/commercial/support readiness when the app is ready for external users.

## Gates

| Gate | Target phase | Required evidence |
|---|---|---|
| Local target-path gate | R3 | format/analyze/test for non-legacy target path |
| Fake repository gate | R3 | deterministic fake repositories and synthetic fixtures |
| Contract mock gate | R3/R4/R6 | OpenAPI examples and Microcks verification for affected APIs |
| CI baseline gate | R3/R10 | codegen, test, analyze and artifact policy in CI |
| Security/privacy gate | R3/R6/R10/R11/R14 | data classes, trust boundaries, redaction, secure storage |
| Design-system visual gate | R3/R4 | MP-DS coverage and mock evidence for affected UI |
| Store/platform gate | R10 | dated policy review, permissions, signing/notarization, review access |
| Support/diagnostics gate | R12 | redacted diagnostics, reference codes, support handoff |
| Commercial gate | R10/R15 | licensing, entitlements, billing, SLA/support boundary |

## Current Baseline

- Narrow widget test and target app analysis pass.
- Full verify stops on 35 legacy formatting differences; full analyzer reports
  84 known legacy/generated Isar, PocketBase and deprecated-UI findings.
- No CI workflow has been established yet.

## Stop Rules

- Stop if external beta/store/release work starts before release gates are
  assigned to phases and owners.
- Stop if local commands and CI commands diverge without documented reason.
- Stop if generated artifacts or dependency upgrades become unreproducible.
