---
title: "Konzept F17 - Mobile Capture Client Standards"
description: "Querschnittliche Frontend-/Client-Regeln fuer Mobile-Capture-Qualitaet, Queue-Zustaende, Upload-Feedback und sichere MVP-Grenzen"
tags: [concept, mobile, capture, mvp, upload-queue, home-hub, draft-inbox]
lastUpdated: "2026-05-10"
version: "1.3"
status: "accepted"
---

# Konzept F17 - Mobile Capture Client Standards

## Status

Accepted.

## Zweck

F17 ist kein Produkt-Säulen-Dokument. Der fachliche Capture-/Inbox-Scope liegt in `docs/pillars/PILLAR_CAPTURE_INBOX.md`.

F17 definiert die querschnittlichen Frontend-/Client-Regeln fuer Mobile Capture: Scan-Qualitaet, lokale Queue-Zustaende, Upload-Feedback, Fehlergrenzen und die Abgrenzung zur vollständigen mobilen Verwaltung.

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

Diese Richtung ist in `docs/technical/DECISION_MOBILE_SCANNER_TECHNOLOGY.md`
vorlaeufig akzeptiert. Die konkrete Flutter-Bridge wird erst nach einem
Qualitaets-Spike final gewaehlt.

Wenn eine Plattform die gewuenschte Qualitaet nicht liefern kann, darf der MVP nicht still auf normalen Foto-Upload zurueckfallen. Dann braucht es einen sichtbaren Fallback mit Hinweis, dass der Scan nur Fotoqualitaet hat.

## MVP-Flow

```text
Mobile
  -> Foto/Scan aufnehmen
  -> lokal speichern
  -> optional Profilkontext setzen, wenn verfügbar
  -> optional Vorgang aus gecachter Liste wählen
  -> Upload an Home Hub
  -> Draft-Inbox als sichere Ablage

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
- Profilkontext fuer Haushalts-/Kinderzuordnung vorbereiten.
- Notiz oder kurzer Kontext beim Upload.
- Status: wartet, lädt hoch, fehlgeschlagen, hochgeladen, Review nötig.

## Out of Scope

- vollständige mobile Vorgangsverwaltung.
- vollständiger Multi-Geräte-Sync.
- OCR/LLM-Verarbeitung.
- komplexe mobile Suche.
- vollständige Rechte-/Familienverwaltung.

## Vorgangszuordnung

Direkte Zuordnung ist Komfortpfad. Die verbindliche MVP-Erfassungsentscheidung steht in `docs/technical/DECISION_MVP_DOCUMENT_CAPTURE.md`.

Regeln:

- Draft-Inbox bleibt Fallback.
- Mobile darf nur offene/aktive Vorgänge aus einer einfachen Liste zeigen.
- Mobile darf nur Vorgänge anzeigen, die zum aktiven Profil oder zur erlaubten Haushaltsansicht passen.
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
- Welche Flutter-/Native-Bridge kapselt Google ML Kit Document Scanner und VisionKit sauber? Vorentscheidung: native Plattform-Scanner, finale Bridge nach Spike.
- Wie groß dürfen Uploads sein?
- Wie sichtbar wird Profilwahl auf Mobile im MVP?
