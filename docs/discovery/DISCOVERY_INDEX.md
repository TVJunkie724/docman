---
title: "Mappm Discovery Index"
description: "Inventar der Discovery-Baselines, offenen Fragen und nicht normativen Workshop-Entwuerfe"
tags: [discovery, index, questions, applicability, taxonomy]
lastUpdated: "2026-07-20"
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
| `CASE_DOCUMENT_TAXONOMY_CANDIDATES.md` | `draft` | Workshop-Kandidaten ausschliesslich fuer Dokumenttaxonomie, Rollen und Matching; Case-/Workflow-SSOT ist `../technical/DECISION_INITIAL_CASE_WORKFLOW_CATALOG.md`; OQ-011 |
| `DYNAMIC_DOMAIN_COUNTRY_PACK_MODEL_DRAFT.md` | `draft` | dynamische Pack-/Versionierungsrichtung; OQ-011, WF-01/02 und WF-03 fuer Expansion |
| `AUSTRIA_CASE_WORKFLOW_COUNTRY_PACK_DRAFT.md` | `draft` | Austria-first Workflow-/Provider-Mapping, aber keine einzelne Workflow-Freigabe und kein Produktkatalog |
| `AUSTRIA_TAX_CASE_CATALOG_DRAFT.md` | `draft` | oesterreichischer Steuer-Discovery-Input; OQ-010 |
| `MEDICAL_CASE_MODEL_DISCOVERY.md` | `resolved-reference` | nicht normative Szenario-/Entscheidungsrationale; die vollstaendige Medical-SSOT einschliesslich Ankerdokument-Regel, Case-Gueltigkeit, getrennten Zahlungs-/Claim-Zustaenden, Wiederkehr und Payer-Praeferenzen steht in `../technical/DECISION_MEDICAL_CARE_COST_SETTLEMENT_MODEL.md`; OQ-012 ist geschlossen |

## Regeln

- Der Status einer offenen Frage wird nur in
  `OPEN_QUESTIONS_REGISTER.md` geaendert.
- Ein Workshop-Entwurf wird erst nach User-/Domain-Review ueber eine Decision,
  Roadmap-Aenderung und betroffene Konzepte normativ.
- Laender-, Steuer- und medizinische Country-/Provider-Erweiterungen brauchen
  weiterhin WF-01/WF-02 sowie benannte fachkundige Owner vor Produktclaims
  oder spezifischer Workflow-Implementierung. Der generische akzeptierte
  Medical-Kern folgt seiner technischen Decision und OQ-011.
- Post-oesterreichische Markt-/Pack-Planung bleibt bis WF-03 eine
  Expansionsrichtung, kein gemeinsamer DACH-Rechtsraum oder Marktclaim.
- Workflow-Muster, Fachvorlagen-IDs, deutsche Titel, Status und Disposition
  werden ausschliesslich in
  `docs/technical/DECISION_INITIAL_CASE_WORKFLOW_CATALOG.md` gepflegt. Discovery
  darf diese Eintraege nur referenzieren und vertiefen.

## Stop Rules

- Stop, wenn ein Draft-Key direkt als hartcodierter Produkt-Case-Typ verwendet
  wird.
- Stop, wenn historische oder verworfene Kandidaten als zweite parallele
  Taxonomie erhalten bleiben.
- Stop, wenn ein Discovery-Dokument eine Case-/Workflow-ID oder deren Status
  ausserhalb der Katalog-SSOT definiert oder umbenennt.
- Stop, wenn eine offene Frage ausserhalb des zentralen Registers geschlossen
  oder verschoben wird.
