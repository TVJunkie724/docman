---
title: "Plattform-Säule - Intelligence and Automation"
description: "Plattformbereich fuer Core Assist, OCR, grobe Dokumentklassifikation, begrenzte Kandidaten und spaetere qualitaetsgegatete Automation"
tags: [pillar, platform, intelligence, ocr, llm, automation]
lastUpdated: "2026-07-25"
version: "0.3"
status: "accepted-direction"
owner: "product-concept"
---

# Plattform-Säule - Intelligence and Automation

## Zweck

Mappm muss im Commercial Core beim Verstehen und Vorbereiten von
Dokumentarbeit helfen:

- OCR.
- technische Scan-/Dateiqualitaet pruefen; logische Dokumentgrenzen aus
  Mobile-Nutzerabschluss beziehungsweise Desktop-Datei uebernehmen.
- grobe Dokumentgrundart und Domain erkennen.
- editierbare Titel fuer Dokumente, neue Cases und neue Records vorschlagen.
- Aussteller, einen wahrscheinlichen Rechnungs-Gesamtbetrag und fuer die
  Dokumentart relevanten Datums-/Zeitfelder mit Top-Kandidat, Alternativen und
  manuellem Fallback vorschlagen.
- bestehende Cases/Records grob ranken und optionale weitere Beziehungen nur
  best-effort und bestaetigungspflichtig vorschlagen.
- Formulare vorbefüllen.
- Dokumente semantisch auffindbar machen.

## Grundsatz

Intelligence ist Assistenz, nicht Autorität. Backend/Core Assist bereitet die
Arbeit automatisch vor; der Nutzer pflegt nicht standardmaessig Metadatenfelder.
Die sichtbare kompakte Bestaetigung macht semantische Feldvorschlaege aktiv.
Normale Korrekturen sind in M1 kein Training oder
Analyseverbesserungsprogramm.

KI/OCR darf grobe Vorschlaege machen. Fachlich relevante Fakten,
Statusaenderungen, Einreichungen oder Loeschungen brauchen eine ausdrueckliche
Nutzeraktion beziehungsweise Bestaetigung; eine eindeutig benannte
kontextuelle Aktion ist bereits diese Bestaetigung.
KI darf keine fachlich verbindlichen Workflows, Fristen oder Ansprüche erfinden.
Für Workflow-Führung ist der kuratierte, versionierte Katalog die Autorität.

Alle Planungen setzen kleine bis mittlere General-Purpose-Modelle voraus.
Person/Empfaenger, Lebenssachverhalt, Dokumentkohaerenz, Workflowrolle,
aktive Frist, Kausalitaet und Beziehung sind keine verlaesslich finalisierten
freien Modelloutputs. Typabhaengige Datumsbedeutungen duerfen als
korrigierbare Formularvorbelegung vorgeschlagen werden. Staerkere
klassenbezogene Faehigkeiten benoetigen einen benannten Feasibility-Nachweis
und Produktfreigabe.

## Commercial-Core-Scope

Core Assist ist Teil von C2/C3:

- OCR/Text Extraction.
- technische Scan-/Dateiqualitaet; keine semantische Validierung expliziter
  Mobile- oder dateibasierter Desktop-Dokumentgrenzen.
- verpflichtende lokale editierbare Titelvorschlaege mit Provenance.
- grobe Dokumentgrundart/Domain, Aussteller und einfache Schluesselwert-
  Kandidaten vorschlagen.
- bestehende Cases/Records grob ranken; Managed Subject bleibt Userkontext.
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
- keine Wrong-Profile-/Wrong-Case-/Wrong-Document-Erkennung, semantische
  Dokumentinvalidierung oder M1-Ablehnung gemischter Inhalte.
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
