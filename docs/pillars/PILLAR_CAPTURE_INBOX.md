---
title: "Produkt-Saeule - Capture and Inbox"
description: "Produktbereich fuer globales Mobile/Desktop Capture, Scannerqualitaet, Offline-/Upload-Queue, asynchrone Assist-Verarbeitung, Batch-Trennung, Review und Korrektur"
tags: [pillar, capture, inbox, mobile, desktop, processing, intelligence, batch, review]
lastUpdated: "2026-07-15"
version: "0.4"
status: "accepted-direction"
owner: "product-concept/ui-concept"
---

# Produkt-Saeule - Capture and Inbox

## Zweck

Diese Saeule verantwortet den Weg vom willkuerlich eintreffenden Dokument bis
zum bestaetigten fachlichen Ergebnis. Der Nutzer soll nicht vorsortieren oder
vor dem Scan Profile, Cases, Rollen und Metadaten konfigurieren muessen.

Normative Entscheidungen:

- `DECISION_DOCUMENT_CAPTURE.md`;
- `DECISION_CAPTURE_FIRST_ASSISTED_ROUTING.md`;
- `DECISION_MOBILE_CAPTURE_CONTEXT_SELECTION.md`;
- `DECISION_DRAFT_INBOX_REVIEW_WORKFLOW.md`;
- `DECISION_ASSISTED_REVIEW_SUGGESTIONS.md`.

## Zielbild

```text
mobile scan / desktop import
  -> durable capture and artifact manifest
  -> quality/security/duplicate checks
  -> Local/Cloud queue and upload confirmation
  -> async Backend/Core Assist processing
  -> document-boundary validation/import correction, OCR, facts, index and
     candidate matching
  -> automatic title/context/workflow proposals
  -> concise user confirmation/correction
  -> accepted Document with primary Case or Record
```

Inbox ist Processing-, Review- und Ausnahmeflaeche, nicht Archiv oder
Dokumentbesitzstruktur.

## In Scope

- globaler Mobile Document Scan und Photo/Image Evidence;
- Desktop-Dateiauswahl, Drag & Drop und Multi-File-Import;
- scannernahe Qualitaet, Multi-Page, Retake, Reorder und Rescan;
- persistente Offline-/Upload-/Processing-Zustaende;
- Local-/Cloud-Vault-konforme Capture-Semantik;
- asynchrone Preview/OCR/Extraktion/Klassifikation/Indexierung;
- verpflichtende Backend-/Core-Assist-Titelvorschlaege;
- Case-/Record-/Claim-/Workflow-Matching und Alternativen;
- gemischte Batches, Dokumentgrenzen, Split/Merge und Outlier;
- aktuelle menschliche Bestaetigung und schnelle Korrektur;
- spaetere qualitaetsgegatete reversible Auto-Zuordnung;
- Reopen/Undo ohne Datei-/Dokumentduplikation;
- manuelle Fallbacks bei nicht verfuegbarem Assist.

## Capture Interaction Boundary

Automatische Analyse/Matching laufen immer und sind kein Modus. Globales
Capture darf **Neuen Vorgang starten** als einzige primaere optionale
Vorab-Absicht anbieten. Bestehenden Case vorab auswaehlen ist hoechstens ein
sekundaerer Shortcut und nicht Voraussetzung.

Der Nutzer erhaelt keinen leeren Titel-/Metadatenflow. Titel,
Dokumentgrundart/semantische Variante, Managed Subject, primaerer Case/Record,
weitere Beziehungen, optionaler Workflow und relevante Folgeaktionen werden
vorbereitet.

Konkrete Controls, Gesten und Screenlayouts sind nicht Teil der Saeule.

## Quality and Batch Contract

Mobile orientiert sich an hochwertiger Dokumentenscan-Qualitaet. Desktop und
Mobile duerfen mehrere Dateien/Dokumente in einer Session annehmen.

Eine Session ist kein Case. Die Saeule garantiert:

- getrennte Erkennung von Seiten, logischen Dokumenten und fachlichen Gruppen;
- Originalerhalt und reversible Grenzen;
- per-Dokument-Matching;
- Sessionnaehe nur als schwaches Signal;
- Outlier statt Zwangszuordnung;
- Partial Success;
- Idempotency/Retry ohne Duplikate.

## Review Maturity

Commercial Core startet mit vorbereitetem Ein-Aktions-Review:

- bestes Ergebnis zuerst;
- Case-/Record-Zuordnung durch Nutzer bestaetigt;
- nur relevante sichtbare Folgen;
- Details optional;
- geringe Confidence zeigt weiterhin beste Kandidaten sowie neuen/bestehenden
  Case und passenden Record-Fallback;
- Bestaetigung akzeptiert keine versteckten Facts.

Spaetere Auto-Zuordnung ist nur pro Dokument-/Workflow-/Risiko-Klasse nach
Messung, Abstention, Undo, Rollback und nahezu fehlerfreien Profilgrenzen
zulassig.

## Primary Context Handoff

Nach Review geht jedes akzeptierte Dokument an:

- einen bestehenden/neuen Case; oder
- einen bestehenden/neuen Record.

Wenn nichts passt, wird ein leichter Custom Case mit automatisch
vorgeschlagenem Titel erzeugt. Dokumente bleiben technisch eigenstaendige,
mehrfach verlinkbare Objekte.

## Cross-Pillar Boundaries

- Case/Record-Semantik: `PILLAR_CASES_RECORDS.md`.
- Workflow-/Laenderkatalog: `PILLAR_TEMPLATES_WORKFLOWS.md`.
- Search/Facts: `PILLAR_SEARCH_FACTS_INSIGHTS.md`.
- Tasks/Agenda: `PILLAR_TASKS_REMINDERS_QUICK_ACCESS.md`.
- Vault/Sync/Identity: `PILLAR_CLOUD_IDENTITY_SYNC.md`.
- Assist provider/governance/automation: `PILLAR_INTELLIGENCE_AUTOMATION.md`.
- Externe Aktionen: `PILLAR_EXPORT_SHARING_EXTERNAL_ACTIONS.md`.

Capture darf diese Saeulen nur ueber bestaetigte Vorschlaege/Contracts
aktivieren, nicht ihre fachliche Logik duplizieren.

## Security, Accessibility and Quality

- Dokumente, OCR, Titel, Fakten und Kandidaten sind sensibel.
- Keine Inhalte/sensiblen Titel in Logs, Telemetry oder Default-Notifications.
- App-Neustart/Offline/Providerfehler verlieren keine Originale.
- Status und Unsicherheit sind screenreader-tauglich und nicht farbabhaengig.
- Gesten haben sichtbare/keyboard-/screenreader-faehige Alternativen.
- Synthetic Fixtures decken schlechte Scans, mixed batches, Profilgrenzen,
  Titelvorschlag, Korrektur, Retry und Partial Success ab.

## Stop Rules

Stop, wenn:

- Capture vor dem Scan Formulare verlangt;
- automatisches Matching optional/abschaltbar als Normalmodus wird;
- Core-Assist-Titelvorschlag oder Batch aus Commercial Core verschoben wird;
- eine Session als eine fachliche Gruppe behandelt wird;
- Review alle extrahierten Fakten standardmaessig zeigt;
- aktuelles Routing ohne Nutzerbestaetigung finalisiert;
- spaetere Automation ohne Quality Gate aktiviert wird;
- Inbox zum Archiv wird.

## Enterprise Quality Contract

Diese Saeule uebernimmt
`docs/execution/PILLAR_ENTERPRISE_QUALITY_CONTRACT.md`. Ihre Milestone-Slices
und Domaenengrenzen bleiben massgeblich. Der gemeinsame Vertrag liefert
verbindliche Anforderungen fuer getrennte Ownership, Phase Slicing,
Security/Privacy, Accessibility/Lokalisierung, Verifikation, Stop Rules und
Handoff. Die Saeule allein autorisiert niemals eine Implementierung.
