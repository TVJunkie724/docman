---
title: "Plattform-Säule - Intelligence and Automation"
description: "Plattformbereich fuer OCR, Dokumentklassifikation, Fact-Vorschläge, Formularvorbefüllung und lokale/private LLM-Pipelines"
tags: [pillar, platform, intelligence, ocr, llm, automation]
lastUpdated: "2026-05-06"
version: "0.1"
status: "proposed"
---

# Plattform-Säule - Intelligence and Automation

## Zweck

DocMan soll später beim Verstehen und Vorbereiten von Dokumentarbeit helfen:

- OCR.
- Dokumenttyp erkennen.
- Sender, Datum, Betrag und Fristen vorschlagen.
- Claims und nächste Schritte vorschlagen.
- Formulare vorbefüllen.
- Dokumente semantisch auffindbar machen.

## Grundsatz

Intelligence ist Assistenz, nicht Autorität.

KI/OCR darf Vorschläge machen. Fachlich relevante Fakten, Statusänderungen, Einreichungen oder Löschungen brauchen Review.

## MVP-Scope

Nicht MVP.

R2/R4 müssen nur vorbereiten:

- Dokumente und Metadaten nicht so modellieren, dass OCR/Facts später unmöglich werden.
- Review-Status und Vorschlagsquellen mitdenken.
- private/self-hosted Verarbeitung offenhalten.

## Spätere Bausteine

- OCR-Service.
- Dokumentklassifikator.
- Fact-Extraction-Pipeline.
- lokale oder private LLM-Inference.
- Formularfeld-Vorschläge.
- Confidence und Review-Queue.

## Enterprise-Grenzen

- keine stillen Entscheidungen.
- keine ungeprüfte Weitergabe an Cloud-KI.
- medizinische, finanzielle und Identitätsdaten besonders schützen.
- Trainings-/Telemetry-Daten nie aus echten Dokumenten ableiten, wenn nicht explizit entschieden.
