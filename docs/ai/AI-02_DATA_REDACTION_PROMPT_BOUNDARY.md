---
title: "AI-02 Data Redaction Prompt Boundary"
description: "Prompt/input/output redaction and sensitive data minimization"
tags: [ai, privacy, redaction, prompts]
status: "draft"
owner: "ai/compliance"
lastUpdated: "2026-07-12"
---

# AI-02 Data Redaction Prompt Boundary

## Rules

- Send minimum required context.
- Redact secrets and unnecessary personal data.
- Separate prompt templates from user data.
- Do not log raw sensitive prompts or outputs.
- Define allowed and forbidden data classes per AI use case.

## Stop Rules

- Stop if prompt payloads are not classified, minimized and redacted.
