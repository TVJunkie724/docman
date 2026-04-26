---
title: "Konzept F17 - Mobile Capture Plan"
description: "DocMan-spezifisches Mobile-Capture-Konzept für MVP-Scan, lokale Queue, optionale Vorgangszuordnung, Home-Hub-Upload und späteren Mobile-Ausbau"
tags: [concept, mobile, capture, mvp, upload-queue, home-hub, draft-inbox]
lastUpdated: "2026-04-26"
version: "1.0"
status: "accepted"
---

# Konzept F17 - Mobile Capture Plan

## Status

Accepted.

## Zweck

F17 definiert den MVP-Scope für Mobile Capture und grenzt ihn von vollständiger mobiler Vorgangsverwaltung ab.

## Grundsatz

Mobile ist im MVP ein schneller Eingang, nicht die vollständige DocMan-Verwaltung.

## MVP-Flow

```text
Mobile
  -> Foto/Scan aufnehmen
  -> lokal speichern
  -> optional Vorgang aus gecachter Liste wählen
  -> Upload an Home Hub
  -> Fallback Draft-Inbox

Desktop
  -> Draft prüfen
  -> Metadaten ergänzen
  -> Vorgang zuordnen oder korrigieren
```

## In Scope

- Foto/Scan aufnehmen.
- lokale Upload Queue.
- Queue über App-Neustart erhalten.
- Home-Hub-Upload.
- Retry bei Verbindungsfehlern.
- optionale Vorgangszuordnung über einfache gecachte Liste.
- Notiz oder kurzer Kontext beim Upload.
- Status: wartet, lädt hoch, fehlgeschlagen, hochgeladen, Review nötig.

## Out of Scope

- vollständige mobile Vorgangsverwaltung.
- vollständiger Multi-Geräte-Sync.
- OCR/LLM-Verarbeitung.
- komplexe mobile Suche.
- Rechte-/Familienverwaltung.

## Vorgangszuordnung

Direkte Zuordnung ist Komfortpfad.

Regeln:

- Draft-Inbox bleibt Fallback.
- Mobile darf nur offene/aktive Vorgänge aus einer einfachen Liste zeigen.
- Wenn Liste fehlt, kann trotzdem gescannt werden.
- Wenn `caseId` ungültig wird, landet Upload in Review.

## Home-Hub-Abhängigkeit

Mobile Capture braucht für geräteübergreifenden Nutzen einen minimalen Home-Hub-Eingangskorb.

Kein vollständiger Sync nötig.

## Definition of Done

F17 gilt als umgesetzt, wenn:

- Mobile offline scannen kann.
- Upload Queue sicher persistiert.
- Home-Hub-Upload möglich ist.
- Desktop mobile Uploads in Draft-Inbox sieht.
- optionale Vorgangszuordnung nicht zum Sync-Monster wird.

## Offene Folgefragen

- Bild, PDF oder beides im MVP?
- Wie funktioniert Pairing praktisch?
- Welche Kamera-/Scan-Library wird genutzt?
- Wie groß dürfen Uploads sein?

