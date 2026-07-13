---
title: "Plattform-Säule - Intelligence and Automation"
description: "Plattformbereich fuer Core Assist, OCR, Dokumentklassifikation, Fact-/Workflow-Vorschläge und spätere Advanced-Assist-Automation"
tags: [pillar, platform, intelligence, ocr, llm, automation]
lastUpdated: "2026-07-12"
version: "0.2"
status: "accepted-direction"
---

# Plattform-Säule - Intelligence and Automation

## Zweck

Mappm muss im Commercial Core beim Verstehen und Vorbereiten von
Dokumentarbeit helfen:

- OCR.
- Dokumenttyp erkennen.
- Sender, Datum, Betrag und Fristen vorschlagen.
- Claims und nächste Schritte vorschlagen.
- passende veröffentlichte Workflow-Definitionen und bestehende Vorgänge
  vorschlagen.
- Formulare vorbefüllen.
- Dokumente semantisch auffindbar machen.

## Grundsatz

Intelligence ist Assistenz, nicht Autorität.

KI/OCR darf Vorschläge machen. Fachlich relevante Fakten, Statusänderungen, Einreichungen oder Löschungen brauchen Review.
KI darf keine fachlich verbindlichen Workflows, Fristen oder Ansprüche erfinden.
Für Workflow-Führung ist der kuratierte, versionierte Katalog die Autorität.

## Commercial-Core-Scope

Core Assist ist Teil von C2/C3:

- OCR/Text Extraction.
- Dokumenttyp, Akteure und Schlüsselfelder vorschlagen.
- bestehende Vorgänge/Profile und veröffentlichte Workflows vorschlagen.
- Confidence, Evidence und Human Review.
- Input für die einheitliche Suche.
- Free/Paid-Quota, Offline Queue, Opt-out und manueller Fallback.

On-device und Managed Assist bleiben hinter einem ausdrücklichen
Trust-/Provider-Contract. Real documents are blocked until VC-02/OQ-003 and
applicable AI/REG/SEC/DATA gates are accepted.

## Spätere Advanced-Assist-Bausteine

- breitere/spezialisierte Fact-Extraction.
- semantische Antworten mit Quellenbelegen, aber kein verpflichtender Chat.
- höhere Kontingente und spezialisierte Modelle.
- kontrollierte Reprocessing-/Automation-Pipelines.
- weitere Formular- und Einreichvorbereitung.

## Enterprise-Grenzen

- keine stillen Entscheidungen.
- keine ungeprüfte Weitergabe an Cloud-KI.
- medizinische, finanzielle und Identitätsdaten besonders schützen.
- Trainings-/Telemetry-Daten nie aus echten Dokumenten ableiten, wenn nicht explizit entschieden.

## Enterprise Quality Contract

This pillar adopts `docs/execution/PILLAR_ENTERPRISE_QUALITY_CONTRACT.md`.
Its milestone slices and domain boundaries remain authoritative; the shared
contract supplies mandatory owner separation, phase slicing, security/privacy,
accessibility/localization, verification, stop-rule and handoff requirements.
The pillar itself is never sufficient authorization for implementation.
