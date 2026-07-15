---
title: "Plattform-Säule - Intelligence and Automation"
description: "Plattformbereich fuer Core Assist, OCR, Dokumentklassifikation, Fact-/Workflow-Vorschläge und spätere Advanced-Assist-Automation"
tags: [pillar, platform, intelligence, ocr, llm, automation]
lastUpdated: "2026-07-15"
version: "0.3"
status: "accepted-direction"
owner: "product-concept"
---

# Plattform-Säule - Intelligence and Automation

## Zweck

Mappm muss im Commercial Core beim Verstehen und Vorbereiten von
Dokumentarbeit helfen:

- OCR.
- logische Dokumentgrenzen, Scanqualitaet und Batch-Outlier erkennen.
- Dokumenttyp erkennen.
- editierbare Titel fuer Dokumente, neue Cases und neue Records vorschlagen.
- Sender, Datum, Betrag und Fristen vorschlagen.
- Claims und nächste Schritte vorschlagen.
- passende veröffentlichte Workflow-Definitionen und bestehende Vorgänge
  vorschlagen.
- Formulare vorbefüllen.
- Dokumente semantisch auffindbar machen.

## Grundsatz

Intelligence ist Assistenz, nicht Autorität. Backend/Core Assist bereitet die
Arbeit automatisch vor; der Nutzer pflegt nicht standardmaessig Metadatenfelder.

KI/OCR darf Vorschläge machen. Fachlich relevante Fakten, Statusänderungen, Einreichungen oder Löschungen brauchen Review.
KI darf keine fachlich verbindlichen Workflows, Fristen oder Ansprüche erfinden.
Für Workflow-Führung ist der kuratierte, versionierte Katalog die Autorität.

## Commercial-Core-Scope

Core Assist ist Teil von C2/C3:

- OCR/Text Extraction.
- Validation expliziter Mobile-Dokumentgrenzen sowie Quality-/Outlier- und
  Compound-Import-Korrekturvorschlaege.
- verpflichtende lokale editierbare Titelvorschlaege mit Provenance.
- Dokumenttyp, Akteure und Schlüsselfelder vorschlagen.
- bestehende Vorgänge/Profile und veröffentlichte Workflows vorschlagen.
- Confidence, Evidence und Human Review.
- Input für die einheitliche Suche.
- Free/Paid-Quota, Offline Queue, Opt-out und manueller Fallback.
- aktuelle Nutzerbestaetigung fuer Case-/Record-Routing und sichtbare materielle
  Folgen.

On-device und Managed Assist bleiben hinter einem ausdrücklichen
Trust-/Provider-Contract. Echte Dokumente sind blockiert, bis VC-02/OQ-003 und
die anwendbaren AI-/REG-/SEC-/DATA-Gates akzeptiert sind.

## Spätere Advanced-Assist-Bausteine

- breitere/spezialisierte Fact-Extraction.
- semantische Antworten mit Quellenbelegen, aber kein verpflichtender Chat.
- höhere Kontingente und spezialisierte Modelle.
- kontrollierte Reprocessing-/Automation-Pipelines.
- selektive reversible Auto-Zuordnung nur nach Precision-/Abstention-/Undo-/
  Rollback-Gates pro Klasse.
- weitere Formular- und Einreichvorbereitung.

## Enterprise-Grenzen

- keine stillen Routing-Entscheidungen im aktuellen Reifegrad.
- keine ungeprüfte Weitergabe an Cloud-KI.
- medizinische, finanzielle und Identitätsdaten besonders schützen.
- Trainingsdaten werden nie aus echten Dokumenten abgeleitet. Eine spaetere
  Aenderung dieser Grenze benoetigte eine neue ausdrueckliche Produkt-, Legal-,
  Security- und Einwilligungsentscheidung; ein allgemeiner AGB-Hinweis reicht
  nicht.
- Telemetry aus Produktnutzung bleibt strikt redigiert und folgt F18.

## Enterprise Quality Contract

Diese Saeule uebernimmt
`docs/execution/PILLAR_ENTERPRISE_QUALITY_CONTRACT.md`. Ihre Milestone-Slices
und Domaenengrenzen bleiben massgeblich. Der gemeinsame Vertrag liefert
verbindliche Anforderungen fuer getrennte Ownership, Phase Slicing,
Security/Privacy, Accessibility/Lokalisierung, Verifikation, Stop Rules und
Handoff. Die Saeule allein autorisiert niemals eine Implementierung.
