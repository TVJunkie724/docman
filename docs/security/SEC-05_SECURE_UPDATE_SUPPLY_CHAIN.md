---
title: "SEC-05 Secure Update Supply Chain"
description: "Dependency security, SBOM, signing, provenance and secure updates"
tags: [security, supply-chain, updates]
status: "draft"
owner: "security/release"
lastUpdated: "2026-07-12"
---

# SEC-05 Secure Update Supply Chain

## 2026 Product Scope

The supply chain includes Flutter/Dart/native dependencies, build runners,
generated clients, backend/worker/container dependencies, infrastructure
modules and store/direct-distribution tooling. Client and backend artifacts are
signed, provenance/SBOM evidence is retained, secrets are isolated and update
rollback cannot bypass schema/Vault compatibility or security revocation.

## Required Decisions

- Dependency review and vulnerability scanning.
- SBOM generation.
- Artifact signing and notarization.
- Update channel and rollout.
- Rollback and emergency patch path.
- Provenance and build reproducibility.
- Dependency pinning, build isolation and emergency key/signing rotation.

## Stop Rules

- Stop release if artifact provenance, signing/update path or dependency
  vulnerability policy is missing.
