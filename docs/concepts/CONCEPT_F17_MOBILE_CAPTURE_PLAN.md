---
title: "Konzept F17 - Mobile Capture Plan"
description: "DocMan-spezifisches Mobile-Capture-Konzept für MVP-Scan, lokale Queue, optionale Vorgangszuordnung, Home-Hub-Upload und späteren Mobile-Ausbau"
tags: [concept, mobile, capture, mvp, upload-queue, home-hub, draft-inbox]
lastUpdated: "2026-05-05"
version: "1.1"
status: "accepted"
---

# Konzept F17 - Mobile Capture Plan

## Status

Accepted.

## Zweck

F17 definiert den MVP-Scope für Mobile Capture und grenzt ihn von vollständiger mobiler Vorgangsverwaltung ab.

## Grundsatz

Mobile ist im MVP ein schneller Eingang, nicht die vollständige DocMan-Verwaltung.

Mobile Capture soll sich wie ein hochwertiger Dokumentenscanner anfuehlen, nicht wie ein normaler Foto-Upload. Das Zielbild ist die Scan-Qualitaet moderner Mobile-Scanner wie Google Drive Document Scan: Dokument automatisch erkennen, automatisch erfassen, zuschneiden, perspektivisch korrigieren und als saubere Dokumentansicht mit hellem/weissem Hintergrund und gut lesbarem dunklem Text ausgeben.

Das ist eine Produktqualitaetsanforderung. Sie bedeutet nicht, dass DocMan Google Drive integriert oder Cloud-Dienste nutzt.

## Scan-Qualitaetsziel

Der MVP-Scanner soll mindestens vorbereiten:

- automatische Dokumenterkennung und Auto-Capture.
- Rand-/Eckenerkennung mit manueller Korrektur.
- Perspektivkorrektur.
- automatische Rotation.
- Scan-Optimierung fuer Dokumente, insbesondere heller Hintergrund und dunkler, gut lesbarer Text.
- Mehrseiten-Scan als PDF-Zielbild.
- optionaler Export einzelner Seiten als Bild, falls fuer Upload/Preview noetig.

Technische Zielrichtung:

- Android: bevorzugt Google ML Kit Document Scanner API, weil sie dem Google-Drive-Scan-Erlebnis am naechsten liegt.
- iOS: native VisionKit Document Camera als funktionales Pendant pruefen.
- Flutter soll diese nativen Scanner kapseln, aber nicht selbst mit einfachem Kamera-Foto plus eigener Bildbearbeitung starten.

Wenn eine Plattform die gewuenschte Qualitaet nicht liefern kann, darf der MVP nicht still auf normalen Foto-Upload zurueckfallen. Dann braucht es einen sichtbaren Fallback mit Hinweis, dass der Scan nur Fotoqualitaet hat.

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

- Dokumentenscan in Scanner-Qualitaet aufnehmen.
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

- Mobile offline in Dokumentenscanner-Qualitaet scannen kann.
- Upload Queue sicher persistiert.
- Home-Hub-Upload möglich ist.
- Desktop mobile Uploads in Draft-Inbox sieht.
- optionale Vorgangszuordnung nicht zum Sync-Monster wird.

## Offene Folgefragen

- Bild, PDF oder beides im MVP?
- Wie funktioniert Pairing praktisch?
- Welche Flutter-/Native-Bridge kapselt Google ML Kit Document Scanner und VisionKit sauber?
- Wie groß dürfen Uploads sein?
