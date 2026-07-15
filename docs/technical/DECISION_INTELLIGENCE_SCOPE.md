---
title: "Decision - Intelligence Scope"
description: "Entscheidung zum verpflichtenden Core Assist und zu späteren kontrollierten Intelligence-Erweiterungen"
tags: [decision, intelligence, assist, ocr, llm, commercial-core, managed-service]
lastUpdated: "2026-07-15"
status: "accepted"
owner: "product-concept/ai"
---
# Decision - Intelligence Scope

## Status

Angenommen. Dieses Dokument ersetzt frühere Annahmen, nach denen OCR,
Klassifikation oder Cloud-Assistenz erst nach dem ersten verkaufbaren Produkt
relevant wären.

## Entscheidung

**Core Assist ist ein verpflichtender Bestandteil des Commercial Core.** Die
App bleibt ohne Chat- oder Messenger-Oberfläche bedienbar; ihre zentrale
Intelligenz zeigt sich in einem möglichst arbeitsarmen Capture-, Such- und
Review-Erlebnis.

Core Assist umfasst mindestens:

- Qualitäts- und Dokumentgrenzenprüfung je logischem Dokument;
- OCR beziehungsweise Textextraktion;
- Erkennung von Dokumenttyp, Absender, betroffener Person oder Organisation
  und relevanten Schlüsselfakten;
- einen editierbaren, lokalisierten Titelvorschlag für jedes Dokument sowie
  für vorgeschlagene Cases und Records;
- Vorschläge für primären Case oder Record, zusätzliche Beziehungen,
  Workflow-Muster, Aufgaben und Fristen;
- Suchindex-Eingaben und nachvollziehbare Match-Gründe;
- eine schnelle, progressive und fehlertolerante Bestätigung oder Korrektur.

## Verarbeitung

```text
Original dauerhaft sichern
  -> Qualität und logische Dokumentgrenze prüfen
  -> Text und Fakten extrahieren
  -> Typ, Akteure und Kontextkandidaten bestimmen
  -> Titel, Case/Record, Beziehungen und Workflow-Schritte vorschlagen
  -> nur relevante Folgen zur Bestätigung oder Korrektur zeigen
  -> akzeptierte Ergebnisse versioniert übernehmen
```

Die Verarbeitung ist asynchron. Je nach Scanqualität, Dokumentkomplexität,
Gerät und Provider darf sie länger dauern; die UI zeigt einen ehrlichen Zustand
und blockiert die weitere Nutzung nicht.

## Entscheidungsgrenze

In der aktuellen Reifestufe finalisiert Core Assist keine Case-, Record- oder
Workflow-Zuordnung ohne Nutzerbestätigung. Auch bei niedriger Konfidenz werden
die besten Kandidaten gezeigt; bei sehr niedriger Konfidenz steht „Neuen Case
anlegen“ zuerst. „Bestehenden Case auswählen“ bleibt immer erreichbar.

Spätere automatische Zuordnung ist ein ausdrückliches Produktziel, aber nur je
Dokument-/Entscheidungsklasse nach belegter Qualität, typischerweise höchstens
1–5 Prozent Fehlentscheidungen, und mit Abstention, Undo, Auditierbarkeit sowie
Rollback. Eine globale Automatikfreigabe ist unzulässig.

## Provider- und Trust-Grenzen

- Zugelassene On-Device-Verarbeitung darf verwendet werden, wenn Qualität,
  Ressourcen und Plattformabdeckung genügen.
- Managed Assist ist der geplante Qualitätspfad für Fähigkeiten, die auf den
  unterstützten Endgeräten nicht zuverlässig erbracht werden können.
- Reale Dokumente dürfen erst nach den einschlägigen Security-, Privacy-,
  Provider-, Retention-, Training-, Lösch- und AI-Regulatory-Gates verarbeitet
  werden.
- Assist-Artefakte sind sensible Nutzdaten, zweckgebunden, minimiert,
  löschbar und kein Inhalt für normales Logging oder Training.
- Local Vault und Cloud Vault behalten ihre jeweilige Authority; Assist ist
  eine eigene Processing-Grenze und macht einen Local Vault nicht zum Cloud
  Vault.

## Core und Advanced Assist

Core Assist steht in einer sinnvoll begrenzten Free-Ausprägung zur Verfügung
und wird in C2/C3 als verkaufbarer End-to-End-Pfad umgesetzt. Quoten und
Fallbacks dürfen die Produktgrenzen ehrlich erklären, aber keine nicht
vorhandene Gleichwertigkeit behaupten.

Advanced Assist darf später höhere Quoten, umfassendere Extraktion,
semantische Antworten, spezialisierte Modelle und mehr Automatisierung bieten.
Er darf Evidenz, Review, Datenschutz, Länderpakete oder kuratierte
Workflow-Regeln nicht umgehen.

## Konsequenzen

- C1 schafft Account-, Device-, Entitlement-, Contract- und Trust-Grenzen.
- C2 liefert Capture, Core Assist und Review als vollständigen vertikalen Pfad.
- C3 integriert akzeptierte Vorschläge in Cases, Records, Suche, Aufgaben und
  verwaltete Profile.
- Workflow-Vorschläge referenzieren ausschließlich gültige, versionierte
  Definitionen gemäß `DECISION_CURATED_JURISDICTIONAL_WORKFLOW_CATALOG.md`.
- Die maßgeblichen UI-, Daten-, API-, Security-, Test- und Rechtskonzepte
  müssen in jedem Implementation Contract verlinkt werden.
