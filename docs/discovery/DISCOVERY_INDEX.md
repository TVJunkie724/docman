---
title: "Mappm Discovery Index"
description: "Inventar der Discovery-Baselines, offenen Fragen und nicht normativen Workshop-Entwuerfe"
tags: [discovery, index, questions, applicability, taxonomy]
lastUpdated: "2026-07-15"
status: "active"
owner: "product-concept"
---

# Mappm Discovery Index

## Zweck

Dieser Index trennt akzeptierte Discovery-Baselines und das zentrale
Fragenregister von nicht normativen Workshop-Entwuerfen. Ein `draft` in diesem
Ordner darf weder Schema, UI-Picker, Country Pack noch Workflow-Verhalten
autorisieren.

| Artefakt | Status | Rolle |
|---|---|---|
| `APPLICABILITY_MATRIX.md` | `accepted-baseline` | anwendbare, bedingte und spaeter zu aktivierende Playbook-/Produktbereiche |
| `DECISION_INTERVIEW_SUMMARY.md` | `accepted-baseline` | konsolidierte Produkt- und Architektur-Richtung aus der Discovery |
| `OPEN_QUESTIONS_REGISTER.md` | `active` | einzige Statusquelle fuer offene Fragen, Blocker und Re-Check-Trigger |
| `CASE_DOCUMENT_TAXONOMY_CANDIDATES.md` | `draft` | Workshop-Kandidaten fuer ein schlankes Case-/Dokumentmodell; OQ-011 |
| `DYNAMIC_DOMAIN_COUNTRY_PACK_MODEL_DRAFT.md` | `draft` | dynamische Pack-/Versionierungsrichtung; OQ-011, WF-01/02 |
| `AUSTRIA_CASE_WORKFLOW_COUNTRY_PACK_DRAFT.md` | `draft` | oesterreichische Workflow-/Provider-Beispiele, kein Produktkatalog |
| `AUSTRIA_TAX_CASE_CATALOG_DRAFT.md` | `draft` | oesterreichischer Steuer-Discovery-Input; OQ-010 |
| `MEDICAL_CASE_MODEL_DISCOVERY.md` | `draft` | medizinische Case-/Claim-/Relationship-Discovery; OQ-012 |

## Regeln

- Der Status einer offenen Frage wird nur in
  `OPEN_QUESTIONS_REGISTER.md` geaendert.
- Ein Workshop-Entwurf wird erst nach User-/Domain-Review ueber eine Decision,
  Roadmap-Aenderung und betroffene Konzepte normativ.
- Laender-, Steuer- und Medizin-Entwuerfe brauchen weiterhin WF-01/WF-02 sowie
  benannte fachkundige Owner vor Produktclaims oder Implementierung.

## Stop Rules

- Stop, wenn ein Draft-Key direkt als hartcodierter Produkt-Case-Typ verwendet
  wird.
- Stop, wenn historische oder verworfene Kandidaten als zweite parallele
  Taxonomie erhalten bleiben.
- Stop, wenn eine offene Frage ausserhalb des zentralen Registers geschlossen
  oder verschoben wird.
