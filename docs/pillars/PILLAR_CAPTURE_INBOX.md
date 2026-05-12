---
title: "Produkt-Säule - Capture and Inbox"
description: "Produktbereich fuer Desktop-Import, Mobile Document Scan, Draft-Inbox, Zuordnung, Korrektur und Eingangsbearbeitung"
tags: [pillar, capture, inbox, mobile, desktop, drafts, scanning]
lastUpdated: "2026-05-08"
version: "0.2"
status: "proposed"
---

# Produkt-Säule - Capture and Inbox

## Zweck

Diese Säule beschreibt, wie Dokumente in DocMan hineinkommen und zuerst geprüft werden.

Der wichtigste MVP-Use-Case bleibt:

- unterwegs mit Mobile ein Dokument scannen
- zuhause am Desktop in der Draft-Inbox prüfen
- Profil, Vorgang, Subvorgang, Dokumenttyp und erste Metadaten korrigieren
- danach als erledigten Eingang auffindbar halten

## Zielbild

```text
Capture Source
  -> Draft-Inbox
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
- Korrektur von Profil, Vorgang, Subvorgang, Dokumenttyp und Metadaten.
- aus markierten Dokumenten einen Subvorgang bilden.
- leeren Subvorgang aus einem Vorgang heraus anlegen.
- spätere Vorbereitung fuer Share Sheet, Mail-Import und Watch Folder.
- spätere Vorbereitung fuer OCR-/Klassifikationsjobs und automatische
  Zuordnungsvorschläge mit Review.

## Mobile Scan Qualitätsziel

Mobile Capture soll sich am Document-Scan-Erlebnis von Google Drive orientieren:

- automatische Dokumenterkennung.
- Auto-Capture, wenn das Dokument stabil erkannt wird.
- Perspektivkorrektur.
- sauberer Dokument-Look mit hellem/weissem Hintergrund und dunklem Text.
- mehrseitige Dokumente vorbereiten.
- Rohbild und finales Dokument getrennt planbar halten.

Das ist ein Zielbild. Die konkrete Scan-Technologie wird separat entschieden.

## MVP-Scope

MVP-light:

- Desktop-Import.
- Mobile Scan als Upload in Draft-Inbox.
- lokale mobile Upload-Queue.
- optionale mobile Vorgangszuordnung über gecachte offene Vorgänge.
- Drafts bleiben korrigierbar.
- erledigte Eingänge bleiben kurzfristig sichtbar, damit Fehlzuordnungen schnell korrigiert werden können.

Nicht MVP:

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
- Wie lange bleiben erledigte Eingänge prominent sichtbar?
