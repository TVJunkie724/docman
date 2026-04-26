---
title: "Decision - MVP Scope"
description: "Entscheidung zum ersten DocMan MVP: Desktop-Verwaltung, Mobile Capture und minimaler Home-Hub-Eingangskorb"
tags: [decision, product, mvp, mobile-capture, desktop, home-hub]
lastUpdated: "2026-04-26"
status: "accepted"
---

# Decision - MVP Scope

## Status

Accepted.

## Entscheidung

Der erste DocMan MVP besteht aus Desktop-Verwaltung plus Mobile Capture.

Mobile Capture ist Teil des MVP, weil das Erfassen von Dokumenten unterwegs ein zentraler Alltags-Use-Case ist. Mobile bleibt im MVP aber capture-only. Es wird keine vollständige mobile Verwaltungs-App und kein vollständiger Multi-Geräte-Sync gebaut.

Der MVP enthält einen minimalen Home-Hub-Anteil als Eingangskorb für mobile Uploads.

## MVP-Zielbild

```text
Mobile Capture
  -> Foto/Scan aufnehmen
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
  -> Metadaten ergänzen
  -> Vorgänge verwalten
```

## In Scope

- Ein Haushalt.
- Ein aktives Profil.
- Desktop: Vorgänge erstellen, bearbeiten und schließen.
- Desktop: Dokumente als Drafts erfassen.
- Desktop: Dokumente Vorgängen zuordnen.
- Desktop: lokale Suche und Filter.
- Desktop: lokale Persistenz.
- Mobile: Foto/Scan aufnehmen.
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
- Vollständige Workflow-Automation.
- Cloud-SaaS-Betrieb.

## Begründung

Ein rein lokaler Desktop-MVP wäre technisch einfacher, würde aber den wichtigsten Alltagsmoment verfehlen: unterwegs ein Dokument, einen Brief, eine Rechnung oder ein Formular schnell erfassen und sicher in DocMan bekommen.

Ein vollständiges Mobile- und Sync-System wäre dagegen zu groß für den MVP. Der sinnvolle Schnitt ist deshalb Mobile Capture mit minimalem Home-Hub-Eingangskorb.

Die direkte Zuordnung zu einem Vorgang ist im MVP als Komfortpfad erlaubt, aber nicht als harte Voraussetzung. Draft-Inbox bleibt der sichere Standard, wenn keine Vorgangsliste verfügbar ist, die Verbindung fehlt oder die gewählte Zuordnung später nicht mehr passt.

## Zielregeln

- Mobile darf Dokumente offline erfassen und später hochladen.
- Mobile muss auch ohne aktuelle Vorgangsliste funktionieren.
- Direkter Upload zu einem Vorgang darf nur eine einfache Zuordnung sein, keine vollständige mobile Bearbeitung.
- Desktop bleibt der Ort für Prüfung, Korrektur, Metadaten und Vorgangsverwaltung.
- Der Home Hub im MVP ist ein Capture-Gateway, noch kein vollständiges Sync Backend.
- Das Datenmodell muss den späteren Ausbau zu vollständigem Sync und lokaler Intelligence vorbereiten.

## Offene Folgefragen

- Wie wird Mobile mit dem Home Hub gekoppelt: Login, Pairing-Code oder Gerätefreigabe?
- Welche Scanformate sind im MVP erlaubt: Bild, PDF oder beides?
- Welche minimale Vorgangsliste braucht Mobile: Titel, Profil, Status, Tags, Datum?
- Wie lange darf die mobile Queue Dokumente lokal halten?
- Wie erkennt Desktop, ob ein Upload direkt zugeordnet oder noch zu prüfen ist?
- Welche Backend-Sprache und welcher Storage werden für den minimalen Home Hub verwendet?
