---
title: "OPS-07 CI/CD Pipeline"
description: "CI/CD provider, branch protection, release pipelines, approvals, secrets and artifacts"
tags: [ops, ci, cd, release, quality]
status: "draft"
owner: "release/quality"
lastUpdated: "2026-07-23"
---

# OPS-07 CI/CD Pipeline

## Purpose

Defines operational CI/CD ownership for Mappm.

Flutter clients, OpenAPI/generated clients, backend/workers, containers and
infrastructure have separate pipelines and artifacts with explicit dependency
promotion. Local Development Cloud is reproducible integration tooling;
Development, Staging and Production use separate secrets, approvals and
deployments. No pipeline copies production data into a lower environment.

## Required Decisions

- CI/CD provider and runner trust model.
- Branch protection and required checks.
- Pull request, merge queue and release branch policy.
- Environment approvals.
- Secrets, signing keys and OIDC/short-lived credentials.
- Artifact retention, provenance and SBOM attachment.
- Platform build matrix.
- Release candidate promotion and rollback path.
- Emergency hotfix path.

## Required Gates

- Bootstrap and dependency restore.
- Format/lint/analyze.
- Codegen drift.
- Unit/provider/widget tests.
- Golden and integration tests where relevant.
- Contract/Microcks tests where API relevant.
- Local/Cloud provider, migration/split-brain, entitlement/grace and
  backup/restore drills where relevant.
- Backend provider conformance and infrastructure policy/migration checks.
- Dependency, license and secret scans.
- Scheduled source-health checks for published country/provider/rule packs
  according to `OPS-09_COUNTRY_PROVIDER_RULE_MAINTENANCE.md`.
- Release evidence that every applicable rule pack has a non-expired human
  review, named owner and resolvable primary source.
- Build smoke per target platform.
- Signing/notarization for distribution artifacts.
- REG-08 store/platform policy check before store submission.

## Stop Rules

- Stop release if branch protection, secrets, artifact provenance, signing or
  rollback path are undefined.
- Stop release of an affected workflow pack if its source check fails, its
  required human review is overdue or a changed rule has no approved
  replacement/withdrawal decision.
