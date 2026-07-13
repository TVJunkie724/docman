---
title: "REG-02 EU AI Act Governance"
description: "EU AI Act applicability, risk classification and AI governance contract"
tags: [regulatory, ai-act, ai, eu]
status: "draft"
owner: "ai/compliance"
lastUpdated: "2026-07-12"
jurisdiction: "EU/EEA, Austria"
regulatoryAsOf: "2026-07-11"
sourcesCheckedAt: "2026-07-11"
nextReviewDue: "2026-08-11"
primarySources: ["docs/regulatory/REGULATORY_SOURCE_REGISTER.md"]
legalReviewer: "legal/AI compliance review required"
---

# REG-02 EU AI Act Governance

## Purpose

Defines AI Act applicability and product obligations for OCR/LLM/ML features.
Core Assist is planned for C2/C3 and cannot be treated as a distant optional
feature. This concept must be accepted with a dated source/legal review before
real customer documents enter Core Assist.

## Required Decisions

- Role: provider, deployer, importer, distributor, integrator or customer tool.
- Use-case risk class and prohibited-practice exclusion.
- High-risk applicability or explicit non-applicability.
- GPAI/model provider relationship.
- AI literacy and user/admin instructions.
- Transparency, human review and contestability.
- Logging/evidence, monitoring and incident handling.

## Product Requirements

- AI suggestions remain reviewable and correctable.
- Confidence, source evidence and uncertainty are visible where relevant.
- Sensitive inputs/outputs are redacted according to AI and privacy policy.
- Model/provider changes trigger renewed review.

## Stop Rules

- Stop if an AI/OCR/LLM feature lacks role classification, risk decision,
  provider policy, redaction, human review and fallback behavior.
