---
title: "Mappm - Open Questions Register"
description: "Open product, compliance, roadmap and implementation questions found during playbook reconciliation"
tags: [discovery, questions, blockers, playbook]
lastUpdated: "2026-07-08"
status: "active"
owner: "product-concept"
---

# Mappm - Open Questions Register

| ID | Question | Owner | Status | Blocks | Re-check trigger |
|---|---|---|---|---|---|
| OQ-001 | Soll die Repo-/Package-Identitaet irgendwann von `docman` auf `mappm` umbenannt werden? | product/foundation | planned | release/package/store work | before R10 distribution |
| OQ-002 | Welche Betriebsformen werden kommerziell angeboten: local-only, Home Hub, managed cloud, hybrid? | product/commercial/security | planned | pricing, sync, backup, support, privacy docs | before R6/R10/R15 acceptance |
| OQ-003 | Welche Daten verlassen das Geraet fuer OCR/LLM und unter welchen Provider-/Retention-/Training-Regeln? | ai/compliance/security | planned | R5/R9 AI implementation | before any real-document AI processing |
| OQ-004 | Welche eIDAS/EUDI/ID Austria Use Cases sind wirklich produktrelevant: Login, Account binding, signing, sharing trust, audit? | identity/compliance | planned | identity provider design | before R6/R14 identity work |
| OQ-005 | Welche Stores/Distribution Channels werden zuerst bedient: direct desktop, macOS notarization, iOS, Android, Microsoft Store? | release/compliance | planned | R10 release readiness | before external beta |
| OQ-006 | Welche Support- und SLA-Erwartung gilt fuer zahlende Nutzer oder Haushalte? | commercial/support | planned | COM/OPS support slices | before paid/trial launch |
| OQ-007 | Welche CI/CD-Plattform und Branch-Protection-Regeln gelten dauerhaft? | quality/release | planned | R3/R10 gates | before shared delivery |
| OQ-008 | Welche Design-System-Familien muessen vor dem ersten echten UI-Slice approved sein? | ui-concept/design | active | R4 UI implementation | before first ui-architect handoff |

## Rules

- A question may remain open only if affected phases name it as blocker or
  deferred dependency.
- No implementation may answer an open question implicitly in code.
- Closing a question requires updating the owning decision, concept, roadmap or
  phase document.
