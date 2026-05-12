---
title: "Decision - MVP Scope"
description: "Entscheidung zum ersten DocMan MVP: Desktop-Verwaltung, Mobile Capture und minimaler Home-Hub-Eingangskorb"
tags: [decision, product, mvp, mobile-capture, desktop, home-hub]
lastUpdated: "2026-05-08"
status: "accepted"
---

# Decision - MVP Scope

## Status

Accepted.

## Entscheidung

Der erste DocMan MVP besteht aus Desktop-Verwaltung plus Mobile Capture.

Mobile Capture ist Teil des MVP, weil das Erfassen von Dokumenten unterwegs ein zentraler Alltags-Use-Case ist. Mobile bleibt im MVP aber capture-only. Es wird keine vollständige mobile Verwaltungs-App und kein vollständiger Multi-Geräte-Sync gebaut.

Mobile Capture meint Dokumentenscan-Qualitaet, nicht bloss Kamera-Foto-Upload. Das Zielbild ist ein Google-Drive-aehnlicher Dokumentenscan: Auto-Capture, Rand-/Perspektivkorrektur, automatische Verbesserung und gut lesbarer dunkler Text auf hellem/weissem Dokumenthintergrund.

Der MVP enthält einen minimalen Home-Hub-Anteil als Eingangskorb für mobile Uploads.

Die minimale Dokument-Erfassung ist in `docs/technical/DECISION_MVP_DOCUMENT_CAPTURE.md` festgelegt: Desktop-Dateiimport und Mobile Document Scan landen zuerst in der Draft-Inbox; direkte Vorgangszuordnung ist nur Komfortpfad.

Das Kernmodell aus `docs/technical/DECISION_CASE_DOCUMENT_RECORD_MODEL.md` gilt als Zielbild: Dokumente können auch ohne Vorgang existieren, Records/Nachweise bilden langlebige Unterlagen mit Versionen, und strukturierte Fakten werden für spätere Insights vorbereitet.

## MVP-Zielbild

```text
Mobile Capture
  -> Dokument scannen
  -> Scan bereinigen und als Dokumentdatei vorbereiten
  -> lokal in Upload-Queue speichern
  -> optional Vorgang wählen, wenn gecachte Liste verfügbar ist
  -> an Home Hub hochladen

Minimaler Home Hub
  -> Upload entgegennehmen
  -> Originaldatei speichern
  -> Draft-Inbox-Eintrag anlegen
  -> optional gewählte caseId mitführen

Desktop
  -> Draft-Inbox prüfen
  -> Dokumente Vorgängen zuordnen
  -> Subvorgänge anlegen oder Dokumente als Subvorgang gruppieren
  -> Aufgaben und Fälligkeiten prüfen
  -> wichtige Dokumente im Schnellzugriff markieren
  -> Metadaten ergänzen
  -> Vorgänge verwalten
```

## In Scope

- Ein Haushalt.
- Ein aktives Profil.
- Profilzuordnung fuer Dokumente, Drafts und Vorgänge wird vorbereitet.
- Desktop: Vorgänge erstellen, bearbeiten und schließen.
- Desktop: Subvorgänge als MVP-light erstellen.
- Desktop: markierte Dokumente eines Vorgangs in einen neuen Subvorgang gruppieren.
- Desktop: Dokumente als Drafts erfassen.
- Desktop: Dokumente Vorgängen zuordnen.
- Desktop: einfache Aufgaben mit Fälligkeit verwalten.
- Desktop: wichtige Dokumente/Records im Schnellzugriff markieren.
- Desktop: Profilzuordnung für Drafts und Dokumente setzen oder korrigieren.
- Desktop: lokale Suche und Filter.
- Desktop: lokale Persistenz.
- Mobile: Dokumentenscan mit Auto-Capture, Zuschnitt, Perspektivkorrektur und Dokumentoptimierung.
- Mobile: lokale Upload-Queue.
- Mobile: Upload an den self-hosted Home Hub.
- Mobile: sichere Fallback-Ablage in Draft-Inbox.
- Mobile: optionale Vorgangszuordnung über eine einfache, gecachte Liste offener Vorgänge.
- Minimaler Home Hub: Capture-Upload, Dateiablage, Draft-Inbox, Upload-Status.

## Out of Scope

- Vollständige mobile Vorgangsverwaltung.
- Vollständiger Multi-Geräte-Sync.
- Vollständige Familien-/Rechteverwaltung.
- KI/OCR/LLM-gestützte Verarbeitung.
- App-Store-Distribution.
- Komplexe Dokumentversionierung.
- flexible Dokument-Mehrfachverlinkung mit Rollen.
- komplexe wiederkehrende Reminder, Kalenderintegration und Multi-Geräte-Push.
- Vollständige Workflow-Automation.
- Cloud-SaaS-Betrieb.

## Begründung

Ein rein lokaler Desktop-MVP wäre technisch einfacher, würde aber den wichtigsten Alltagsmoment verfehlen: unterwegs ein Dokument, einen Brief, eine Rechnung oder ein Formular schnell erfassen und sicher in DocMan bekommen.

Ein vollständiges Mobile- und Sync-System wäre dagegen zu groß für den MVP. Der sinnvolle Schnitt ist deshalb Mobile Capture mit minimalem Home-Hub-Eingangskorb.

Die direkte Zuordnung zu einem Vorgang ist im MVP als Komfortpfad erlaubt, aber nicht als harte Voraussetzung. Draft-Inbox bleibt der sichere Standard, wenn keine Vorgangsliste verfügbar ist, die Verbindung fehlt oder die gewählte Zuordnung später nicht mehr passt.

## Zielregeln

- Mobile darf Dokumente offline erfassen und später hochladen.
- Mobile Capture muss einen echten Scanner-Flow vorbereiten; normaler Foto-Upload ist nur bewusster Fallback, nicht das Ziel.
- Mobile muss auch ohne aktuelle Vorgangsliste funktionieren.
- Direkter Upload zu einem Vorgang darf nur eine einfache Zuordnung sein, keine vollständige mobile Bearbeitung.
- Desktop bleibt der Ort für Prüfung, Korrektur, Metadaten und Vorgangsverwaltung.
- Der MVP arbeitet mit einem aktiven Profil, darf aber spätere Haushalts-/Kinderprofile nicht verbauen.
- Subvorgänge helfen großen Vorgängen, ohne Dokumentdateien zu duplizieren.
- Im MVP hat ein Dokument eine primäre Vorgangszuordnung; flexible Mehrfachlinks mit Rollen kommen später.
- Aufgaben und Reminder sind fachliche Objekte; Notifications sind nur ein Anzeigeweg.
- Schnellzugriff meint wichtige Dokumente schnell finden, nicht externe Notfallfreigabe.
- Der Home Hub im MVP ist ein Capture-Gateway, noch kein vollständiges Sync Backend.
- Das Datenmodell muss den späteren Ausbau zu vollständigem Sync und lokaler Intelligence vorbereiten.

## Offene Folgefragen

- Mobile/Home-Hub-Kopplung ist entschieden: QR Pairing primaer, manueller Pairing-Code als Fallback. Der Desktop-MVP erzwingt kein Login; Identity bleibt vorbereitet.
- Welche Scanformate sind im MVP erlaubt: PDF, Bild oder beides?
- Welche native Scanner-Bridge nutzt DocMan: Google ML Kit Document Scanner auf Android und VisionKit auf iOS oder eine belastbare Flutter-Kapselung davon?
- Welche minimale Vorgangsliste braucht Mobile: Titel, Profil, Status, Tags, Datum?
- Wie lange darf die mobile Queue Dokumente lokal halten?
- Wie erkennt Desktop, ob ein Upload direkt zugeordnet oder noch zu prüfen ist?
- Welche Upload-Groessenlimits und Retry-/Cleanup-Regeln gelten fuer den ersten
  Mobile-Capture-Slice?
- Wie viel Profil-/Personenverwaltung muss R4 sichtbar machen, bevor R5 ausgebaut wird?
