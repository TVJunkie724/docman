---
title: "Mappm AI-00 AI Governance Umbrella"
description: "Planning contract for OCR, LLM, document intelligence and assisted review"
tags: [ai, ocr, llm, assisted-review, eu-ai-act, privacy, playbook]
lastUpdated: "2026-07-24"
status: "accepted-direction"
owner: "ai/compliance"
---

# Mappm AI-00 AI Governance Umbrella

## Purpose

Mappm remains manually accessible offline and in Detached Recovery, but the
normal sellable product promise includes Core Assist. Automatic document
recognition, OCR mapping and workflow/case suggestions likely require managed
services for consistent quality across supported devices. These services are
not a casual add-on: Core Assist is a C2/C3 capability with privacy, security
and regulatory gates; Advanced Assist remains later.

The normative capability contract is
`../technical/DECISION_INTELLIGENCE_SCOPE.md`. Every AI concept, eval,
provider policy and release gate must assume small or medium general-purpose
models unless a narrowly named capability has its own accepted feasibility
evidence.

## Capability Boundary

| Capability | Local-only feasibility | Product status |
|---|---|---|
| Manual document organization | feasible | offline/opt-out/recovery fallback, not full product promise |
| Synthetic demo assistant | feasible with fake repositories | allowed for mocks/prototypes |
| Production OCR/extraction | limited locally; service-backed likely | required Core Assist slice |
| Coarse issuer/field candidates and Case-/Record-ranking | service-backed likely for useful quality; small-/medium-model baseline | required Core Assist slice |
| Affected-person, workflow-state, deadline, causality or relationship truth | not a reliable general-model capability | excluded as autonomous Core Assist authority |
| Advanced LLM assistance | service-backed likely | later/conditional |
| AI audit/appeal/explanation UX | required before production AI assistance | required gate |

## Required Before Production AI

- data minimization and purpose statement.
- provider and model boundary.
- retention and training-use policy.
- user consent/notice UX where required.
- confidence, review and correction workflow.
- AI error handling and human override.
- EU AI Act review against current rules at implementation date.
- security review for sensitive document transfer.

## Artefaktindex

| Artefakt | Verantwortung |
|---|---|
| `AI-01_PROVIDER_MODEL_POLICY.md` | Provider, Modell, Region, Version und Training-/Retention-Policy |
| `AI-02_DATA_REDACTION_PROMPT_BOUNDARY.md` | Minimierung, Redaction, Prompt-/Context- und Output-Grenzen |
| `AI-03_HUMAN_REVIEW_EVIDENCE.md` | Nutzerbestaetigung, Korrektur, Provenance und Audit-Evidenz |
| `AI-04_CONFIDENCE_EXPLAINABILITY.md` | Confidence, Evidence, Alternativen und erklaerbare sichtbare Folgen |
| `AI-05_EVALS_MONITORING.md` | Evals, Qualitaetsschwellen, Drift und Produktionsmonitoring |
| `AI-06_AI_INCIDENT_FALLBACK.md` | Incident, Kill Switch, Degraded/Manual Fallback und Recovery |

## Stop Rules

- Stop if AI/OCR/LLM is implemented with real user documents before REG, SEC
  and DATA gates are updated.
- Stop if generated suggestions can overwrite user-owned facts without review.
- Stop if synthetic demo assistant behavior is presented as production-grade
  intelligence.
- Stop if model output is treated as authority for Managed Subject, Case
  boundary, mixed-document validity, workflow state, deadline, causality or
  relationship.
