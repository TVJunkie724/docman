---
title: "Konzept F17 - Mobile Capture Client Standards"
description: "Querschnittliche Frontend-/Client-Regeln fuer Mobile-Capture-Qualitaet, Queue-Zustaende, Upload-Feedback und sichere M2-Grenzen"
tags: [concept, mobile, capture, mvp, upload-queue, home-hub, draft-inbox]
lastUpdated: "2026-06-06"
version: "1.4"
status: "accepted"
---

# Konzept F17 - Mobile Capture Client Standards

## Status

Accepted.

## Zweck

F17 ist kein Produkt-Säulen-Dokument. Der fachliche Capture-/Inbox-Scope liegt in `docs/pillars/PILLAR_CAPTURE_INBOX.md`.

F17 definiert die querschnittlichen Frontend-/Client-Regeln fuer Mobile Capture: Scan-Qualitaet, lokale Queue-Zustaende, Upload-Feedback, Fehlergrenzen und die Abgrenzung zur vollständigen mobilen Verwaltung.

## Grundsatz

Mobile ist im M2 ein schneller Eingang, nicht die vollständige DocMan-Verwaltung.

R7-D2 ergaenzt: Capture darf nie am Netzwerk scheitern. Mobile muss offline
scannen, lokal speichern und spaeter an den Home Hub hochladen koennen.

Mobile Capture soll sich wie ein hochwertiger Dokumentenscanner anfuehlen, nicht wie ein normaler Foto-Upload. Das Zielbild ist die Scan-Qualitaet moderner Mobile-Scanner wie Google Drive Document Scan: Dokument automatisch erkennen, automatisch erfassen, zuschneiden, perspektivisch korrigieren und als saubere Dokumentansicht mit hellem/weissem Hintergrund und gut lesbarem dunklem Text ausgeben.

Das ist eine Produktqualitaetsanforderung. Sie bedeutet nicht, dass DocMan Google Drive integriert oder Cloud-Dienste nutzt.

## Scan-Qualitaetsziel

Der M2-Scanner soll mindestens vorbereiten:

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

Wenn eine Plattform die gewuenschte Qualitaet nicht liefern kann, darf der M2 nicht still auf normalen Foto-Upload zurueckfallen. Dann braucht es einen sichtbaren Fallback mit Hinweis, dass der Scan nur Fotoqualitaet hat.

## M2-Flow

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

Direkte Zuordnung ist Komfortpfad. Die verbindliche M2-Erfassungsentscheidung steht in `docs/technical/DECISION_DOCUMENT_CAPTURE.md`. Die optionale Mobile-Kontextauswahl steht in `docs/technical/DECISION_MOBILE_CAPTURE_CONTEXT_SELECTION.md`.

Regeln:

- Draft-Inbox bleibt Fallback.
- Profil, Vorgang und Notiz sind optionale Kontextfelder.
- Mobile darf nur offene/aktive Vorgänge aus einer einfachen Liste zeigen.
- Mobile darf nur Vorgänge anzeigen, die zum aktiven Profil oder zur erlaubten Haushaltsansicht passen.
- Wenn Liste fehlt, kann trotzdem gescannt werden.
- Wenn `caseId` ungültig wird, landet Upload in Review.

## Home-Hub-Abhängigkeit

Mobile Capture braucht für geräteübergreifenden Nutzen einen minimalen Home-Hub-Eingangskorb.

Kein vollständiger Sync nötig.

Home Hub ist aber keine Voraussetzung fuer das Scannen. Wenn Home Hub oder
Netzwerk nicht erreichbar sind, bleibt Capture moeglich und die Upload Queue
wartet lokal.

## Definition of Done

F17 gilt als umgesetzt, wenn:

- Mobile offline in Dokumentenscanner-Qualitaet scannen kann.
- Upload Queue sicher persistiert.
- Home-Hub-Upload möglich ist.
- Home-Hub-Ausfall Capture nicht blockiert.
- Desktop mobile Uploads in Draft-Inbox sieht.
- optionale Vorgangszuordnung nicht zum Sync-Monster wird.

## Offene Folgefragen

- Bild, PDF oder beides im M2?
- Wie funktioniert Pairing praktisch?
- Welche Flutter-/Native-Bridge kapselt Google ML Kit Document Scanner und VisionKit sauber? Vorentscheidung: native Plattform-Scanner, finale Bridge nach Spike.
- Ob Mobile im M2 nur zuletzt verwendete Vorgänge oder eine einfache Vorgangsliste zeigt.

## Upload-Limits und Retry

R4-D14 ist entschieden in
`docs/technical/DECISION_UPLOAD_LIMITS_RETRY_RESUME_CLEANUP.md`.

Für den M2 gilt:

- Uploads werden als ganze Uploads wiederholt, nicht resumable/chunked.
- Startlimit: 25 Seiten und 50 MB pro Upload-Paket.
- Soft-Warnung ab 15 Seiten oder 30 MB.
- SHA-256 prueft die Integritaet vor dem finalen Confirm.
- Idempotency verhindert doppelte Draft-Inbox-Eintraege.
- erfolgreiche Rohartefakte duerfen lokal nach 7 Tagen aufgeraeumt werden.
