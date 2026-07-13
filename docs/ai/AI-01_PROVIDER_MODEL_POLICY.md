---
title: "AI-01 Provider Model Policy"
description: "AI provider, model, region, retention and contract policy"
tags: [ai, provider, llm]
status: "draft"
owner: "ai/compliance"
lastUpdated: "2026-07-12"
---

# AI-01 Provider Model Policy

## Required Decisions

- Provider and model.
- Hosting region.
- Data retention and training use.
- DPA/processor terms.
- Subprocessors.
- Offline/local fallback.
- Model versioning and change control.
- exact payload minimization per Core/Advanced Assist capability.
- processing-job artifact deletion and evidence retention.
- Local-Vault processing contract that cannot imply durable Cloud storage,
  backup, sync or training consent.

## Stop Rules

- Stop if sensitive data would be sent to an AI provider without provider,
  retention, region and contract decision.
