---
title: "AI-06 AI Incident Fallback"
description: "AI outages, unsafe output, provider incidents and manual fallback"
tags: [ai, incident, fallback]
status: "draft"
owner: "ai/compliance"
lastUpdated: "2026-07-12"
---

# AI-06 AI Incident Fallback

## Required Behavior

- Manual workflow exists without AI.
- AI provider outage has visible degraded state.
- Unsafe output can be reported and suppressed.
- Model/provider incident triggers user-safe communication if needed.

## Stop Rules

- Stop if core product utility depends on AI without manual fallback.
