---
title: "REG-02 EU AI Act Governance"
description: "AI-Act-, Datenschutz- und Produkt-Governance fuer OCR/LLM/ML-Assist"
tags: [regulatory, ai-act, ai, ocr, llm, eu]
status: "accepted-governance-needs-legal-review"
owner: "ai/compliance"
lastUpdated: "2026-07-15"
jurisdiction: "EU/EEA, Oesterreich"
regulatoryAsOf: "2026-07-15"
sourcesCheckedAt: "2026-07-15"
nextReviewDue: "2026-08-01"
primarySources: ["docs/regulatory/REGULATORY_SOURCE_REGISTER.md"]
legalReviewer: "Legal/AI-Compliance-Pruefung erforderlich"
---

# REG-02 EU AI Act Governance

## Scope und aktueller Rechtsstand

Core Assist ist fuer das verkaufbare Produkt erforderlich und umfasst OCR,
Extraktion, Dokument-/Case-Matching, Titel-, Aufgaben- und Workflowvorschlaege.
Jeder Use Case wird einzeln klassifiziert; eine gemeinsame technische Pipeline
beweist keine gemeinsame Risikoklasse.

Der AI Digital Omnibus wurde am 29.06.2026 final angenommen. Am 15.07.2026 ist
im Source Register noch kein gepruefter Amtsblatt-/ELI-Wirksamkeitsnachweis
hinterlegt. Bis dahin bleibt die operative Planung am geltenden AI-Act-Text
verankert und fuehrt die beschlossenen neuen Daten nur als Watch Item.

## Required Decisions

- Rolle von Mappm und jedem beteiligten Modell-/Serviceanbieter.
- Zweck, betroffene Personengruppen und Risikoklasse pro Use Case.
- Ausschluss verbotener Praktiken und Entscheidung zu High-Risk-Scope.
- GPAI-/Modellproviderbeziehung, Terms, Region, Retention und Trainingsnutzung.
- AI Literacy, Nutzerinformation, Human Oversight und Contestability.
- Daten-/Outputqualitaet, Abstention, Monitoring, Logging und Incidentpfad.
- Auswirkungen von Country Packs, medizinischen, steuerlichen oder rechtlichen
  Vorschlaegen auf Risiko und Claims.

## Produktanforderungen

- Ergebnisse sind Vorschlaege mit Provenance und korrigierbarem Ziel.
- Aktuell entscheidet der Nutzer jede Case-/Record-Zuordnung. Spaetere
  automatische Zuordnung ist nur klassenweise, reversibel und nach
  nachgewiesenem Quality Gate zulaessig.
- Confidence wird nicht als Scheingenauigkeit ueberall angezeigt, muss aber
  Routing, Abstention, Reviewtiefe und Evidence steuern.
- Niedrige Scan-/Dokumentqualitaet fuehrt zu sicherer Korrektur oder
  Rueckfrage, nicht zu erfundenen Fakten.
- Kein LLM behauptet verbindliche medizinische, rechtliche, steuerliche oder
  behoerdliche Richtigkeit ohne freigegebene Fachquelle und Policy.
- Modell-/Prompt-/Provider-/Workflow-Versionen sind fuer reproduzierbare
  Evaluation nachvollziehbar.

## Quality und Evidence

- versionierte, vollsynthetische Eval-Sets je Dokumentklasse, Sprache, Land,
  Scanqualitaet und Failure Mode.
- getrennte Kennzahlen fuer Extraktion, Matching, Titel, Aufgaben, Fristen und
  Automation; keine irrefuehrende Gesamtscore-Aggregation.
- False-positive-/False-negative- und Harm-Review nach Klasse.
- Nutzerkorrektur, Undo, Providerausfall, Timeout und Fallback getestet.
- AI Inventory, Datenfluss, Modellkarte/Providerdokumentation und
  Change-/Incident-Log.

## Stop Rules

- Stop ohne Rollen-, Risiko-, Provider-, Datenschutz- und Human-Oversight-
  Entscheid.
- Stop, wenn die noch nicht verkuendete Omnibus-Aenderung als bereits geltende
  Freistellung verwendet wird.
- Stop, wenn echte Dokumente fuer Training/Fine-Tuning genutzt oder
  Zuordnungen irreversibel automatisiert werden, bevor separate Freigaben und
  Quality Gates vorliegen.
