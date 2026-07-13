---
title: "Produkt-Säule - Capture and Inbox"
description: "Produktbereich fuer Desktop-Import, Mobile Document Scan, Draft-Inbox, Zuordnung, Korrektur und Eingangsbearbeitung"
tags: [pillar, capture, inbox, mobile, desktop, drafts, scanning]
lastUpdated: "2026-07-14"
version: "0.3"
status: "accepted-direction"
---

# Produkt-Säule - Capture and Inbox

## Zweck

Diese Säule beschreibt, wie Dokumente in DocMan hineinkommen und zuerst geprüft werden.

Der wichtigste M2-Use-Case bleibt:

- unterwegs mit Mobile ein Dokument scannen
- zuhause am Desktop in der Draft-Inbox prüfen
- verwaltetes Profil, Vorgang/Beziehung, Unterlage, Dokumenttyp und erste
  Metadaten korrigieren
- danach als erledigten Eingang auffindbar halten

## Zielbild

```text
Capture Source
  -> Draft-Inbox
      -> Core Assist processing / manual fallback
      -> Review
          -> Document / Record / Case Assignment
              -> Done-Inbox History
```

Die Inbox ist eine Arbeitsfläche, nicht der eigentliche Speicherort. Ein
erledigter Eingang verweist auf ein Dokument im DMS-Kern. Korrekturen ändern
die Beziehungen, Metadaten oder Facts des Dokuments; sie erzeugen keine
Dokumentkopien.

## In Scope

- Desktop-Dateiimport.
- Mobile Document Scan.
- Draft-Inbox mit unbearbeiteten Eingängen.
- Done-/Erledigt-Bereich fuer zuletzt abgearbeitete Eingänge.
- Korrektur von Profil/Organisation, Vorgang/Beziehung, Unterlage,
  Dokumenttyp und Metadaten.
- Vorschau oder klarer Preview-Platzhalter im Draft Review.
- aus markierten Dokumenten einen normalen verbundenen Vorgang bilden.
- aus markierten Dokumenten/Vorgängen einen übergeordneten Case bilden.
- leeren manuellen/geführten Vorgang und typisierte Beziehung anlegen.
- kontextuelle Aktionen wie Vertrag/Abo, Claim, Steuerprüfung, Zahlung,
  Business-Kontext, Aufgabe oder Schnellzugriff anbieten.
- spätere Vorbereitung fuer Share Sheet, Mail-Import und Watch Folder.
- Core-Assist-OCR-/Klassifikationsjobs, Akteur-/Feld-/Vorgangsvorschläge und
  Review mit Offline Queue, Quota, Opt-out und manuellem Fallback.

## Mobile Scan Qualitätsziel

Mobile Capture soll sich am Document-Scan-Erlebnis von Google Drive orientieren:

- automatische Dokumenterkennung.
- Auto-Capture, wenn das Dokument stabil erkannt wird.
- Perspektivkorrektur.
- sauberer Dokument-Look mit hellem/weissem Hintergrund und dunklem Text.
- mehrseitige Dokumente vorbereiten.
- Rohbild und finales Dokument getrennt planbar halten.

Das ist ein Zielbild. Die konkrete Scan-Technologie wird separat entschieden.

## M2-Scope

Schlanker M2-Slice:

- Desktop-Import mit Dateiauswahl und Drag & Drop fuer PDF/JPG/PNG.
- Mobile Scan als Upload in Draft-Inbox.
- lokale mobile Upload-Queue.
- optionale mobile Vorgangszuordnung über gecachte offene Vorgänge.
- Drafts bleiben korrigierbar.
- die letzten 10 erledigten Eingänge bleiben im Bereich "Zuletzt verarbeitet"
  sichtbar, damit Fehlzuordnungen schnell korrigiert werden können.

Späterer Milestone:

- automatische OCR-Klassifikation.
- Mail-Import.
- Watch Folder.
- Batch-Regeln.
- vollständige mobile Verwaltung.
- vollständige Processing-Pipeline.

## Abgrenzung

- Vorgangsstruktur liegt in `PILLAR_CASES_RECORDS.md`.
- Aufgaben und Reminder liegen in `PILLAR_TASKS_REMINDERS_QUICK_ACCESS.md`.
- Externe Links oder Portale zum Einreichen liegen in `PILLAR_EXPORT_SHARING_EXTERNAL_ACTIONS.md`.
- Local Storage, Mocks, Tests und Runtime-Regeln bleiben querschnittliche `F`-Konzepte.

## Offene Folgefragen

- Welche Scan-Technologie ist fuer Mobile die beste erste Umsetzung?
- Wird PDF oder Bild das primäre Speicherformat fuer mehrseitige Scans?

## Draft Review M2

Die verbindliche Review-Entscheidung steht in
`docs/technical/DECISION_DRAFT_INBOX_REVIEW_WORKFLOW.md`.

M2-Regeln:

- Inbox hat die Bereiche Entwürfe und Zuletzt verarbeitet.
- Die letzten 10 zuletzt verarbeiteten Eingänge bleiben sichtbar.
- Schnelle Korrektur von Titel, verwaltetem Profil, Vorgang/Beziehung,
  Unterlage, Dokumenttyp, Notiz
  und einfachen Metadaten ist erlaubt.
- Falsch zugeordnete Dokumente werden korrigiert, nicht dupliziert.
- Ein erledigter Eingang darf zurück in Entwürfe/Review gesetzt werden.
- Export, Mail, Druck und Outbox bleiben eigene Dokument-/Vorgangsflows.

## Desktop Import M2

Die verbindliche Desktop-Import-Entscheidung steht in
`docs/technical/DECISION_DESKTOP_IMPORT_SCOPE.md`.

M2-Regeln:

- Dateiauswahl und Drag & Drop werden gemeinsam geplant.
- `file_picker` und `desktop_drop` sind Adapter, nicht Domain.
- PDF, JPG/JPEG und PNG sind erlaubt.
- Mehrere Dateien erzeugen mehrere Drafts.
- Ein mehrseitiges PDF bleibt ein Dokument-Draft.
- Hash-Treffer erzeugen eine Duplikatwarnung mit "Bestehendes öffnen",
  "Beide behalten" und "Abbrechen".
- Dokumenttyp stammt aus dem lockeren M2-Katalog; "Notiz / Sonstiges" bleibt
  erlaubt.
- Ordnerimport, Combine/Merge, OCR und Batch-Regeln bleiben spaetere Milestones.

## Enterprise Quality Contract

This pillar adopts `docs/execution/PILLAR_ENTERPRISE_QUALITY_CONTRACT.md`.
Its milestone slices and domain boundaries remain authoritative; the shared
contract supplies mandatory owner separation, phase slicing, security/privacy,
accessibility/localization, verification, stop-rule and handoff requirements.
The pillar itself is never sufficient authorization for implementation.
