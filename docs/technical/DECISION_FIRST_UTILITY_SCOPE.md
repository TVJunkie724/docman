---
title: "Decision - First Utility Scope"
description: "Entscheidung zum ersten nutzbaren Produkt-Slice: Desktop-Verwaltung, Mobile Capture und minimaler Home-Hub-Eingangskorb"
tags: [decision, product, milestones, mobile-capture, desktop, home-hub]
lastUpdated: "2026-07-14"
status: "superseded"
---

# Decision - First Utility Scope

## Status

Superseded on 2026-07-12 by the Commercial Core rebaseline in
`DECISION_VAULT_STORAGE_AND_CLOUD_PRODUCT_MODEL.md` and the active roadmap.
Capture/Review remains core product value; a customer Home Hub and QR pairing
do not.

## Entscheidung

Der erste nutzbare DocMan/Mappm Produkt-Slice besteht aus Desktop-Verwaltung
plus Mobile Capture.

Mobile Capture ist Teil von M2, weil das Erfassen von Dokumenten unterwegs ein
zentraler Alltags-Use-Case ist. Mobile bleibt in M2 aber capture-only. Es wird
keine vollständige mobile Verwaltungs-App und kein vollständiger
Multi-Geräte-Sync gebaut.

Mobile Capture meint Dokumentenscan-Qualitaet, nicht bloss Kamera-Foto-Upload. Das Zielbild ist ein Google-Drive-aehnlicher Dokumentenscan: Auto-Capture, Rand-/Perspektivkorrektur, automatische Verbesserung und gut lesbarer dunkler Text auf hellem/weissem Dokumenthintergrund.

M2 enthält einen minimalen Home-Hub-Anteil als Eingangskorb für mobile Uploads.

Die minimale Dokument-Erfassung ist in `docs/technical/DECISION_DOCUMENT_CAPTURE.md` festgelegt: Desktop-Dateiimport und Mobile Document Scan landen zuerst in der Draft-Inbox; direkte Vorgangszuordnung ist nur Komfortpfad.

Das Kernmodell aus `docs/technical/DECISION_CASE_DOCUMENT_RECORD_MODEL.md` gilt als Zielbild: Dokumente können auch ohne Vorgang existieren, Records/Nachweise bilden langlebige Unterlagen mit Versionen, und strukturierte Fakten werden für spätere Insights vorbereitet.

## M2-Zielbild

```text
Mobile Capture
  -> Dokument scannen
  -> Scan bereinigen und als Dokumentdatei vorbereiten
  -> lokal in Upload-Queue speichern
  -> optional betroffene Person waehlen, wenn sicher bekannt
  -> optional Vorgang wählen, wenn gecachte Liste verfügbar ist
  -> an Home Hub hochladen

Minimaler Home Hub
  -> Upload entgegennehmen
  -> Originaldatei speichern
  -> Draft-Inbox-Eintrag anlegen
  -> optional gewählte caseId mitführen

Desktop
  -> Draft-Inbox prüfen
  -> betroffene Person setzen oder korrigieren
  -> Dokumente Vorgängen zuordnen
  -> verbundene oder uebergeordnete Vorgaenge aus Auswahl bilden
  -> Aufgaben und Fälligkeiten prüfen
  -> wichtige Dokumente im Schnellzugriff markieren
  -> Metadaten ergänzen
  -> Vorgänge verwalten
```

## In Scope

- Ein Haushalt.
- betroffene Person / Haushaltsprofil fuer Dokumente und Drafts ist beim Review-Abschluss Pflicht.
- Personen-/Profilzuordnung fuer Dokumente, Drafts und Vorgänge wird vorbereitet.
- Desktop: Vorgänge erstellen, bearbeiten und schließen.
- Desktop: normale verbundene Vorgänge schlank erstellen.
- Desktop: aus markierten Dokumenten einen verbundenen Vorgang bilden.
- Desktop: aus Dokumenten und vorhandenen Vorgängen einen übergeordneten
  Vorgang bilden.
- Desktop: Dokumente als Drafts erfassen.
- Desktop: Dokumente Vorgängen zuordnen.
- Desktop: einfache Aufgaben mit Fälligkeit verwalten.
- Desktop: wichtige Dokumente/Records im Schnellzugriff markieren.
- Desktop: betroffene Person für Drafts und Dokumente setzen oder korrigieren.
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

Ein rein lokaler Desktop-Start wäre technisch einfacher, würde aber den
wichtigsten Alltagsmoment verfehlen: unterwegs ein Dokument, einen Brief, eine
Rechnung oder ein Formular schnell erfassen und sicher in DocMan bekommen.

Ein vollständiges Mobile- und Sync-System wäre dagegen zu groß für M2. Der
sinnvolle Schnitt ist deshalb Mobile Capture mit minimalem
Home-Hub-Eingangskorb.

Die direkte Zuordnung zu einem Vorgang ist in M2 als Komfortpfad erlaubt, aber
nicht als harte Voraussetzung. Draft-Inbox bleibt der sichere Standard, wenn
keine Vorgangsliste verfügbar ist, die Verbindung fehlt oder die gewählte
Zuordnung später nicht mehr passt.

## Zielregeln

- Mobile darf Dokumente offline erfassen und später hochladen.
- Mobile Capture muss einen echten Scanner-Flow vorbereiten; normaler Foto-Upload ist nur bewusster Fallback, nicht das Ziel.
- Mobile muss auch ohne aktuelle Vorgangsliste funktionieren.
- Direkter Upload zu einem Vorgang darf nur eine einfache Zuordnung sein, keine vollständige mobile Bearbeitung.
- Desktop bleibt der Ort für Prüfung, Korrektur, Metadaten und Vorgangsverwaltung.
- M2 verlangt eine explizite betroffene Person, darf aber spätere Haushalts-/Kinderprofile nicht verbauen.
- `CaseLink` strukturiert große Vorgänge ohne separate Subcase-Entität oder
  Dokumentduplikation.
- Ein bevorzugter Link darf anfangs Navigation vereinfachen; das Zielmodell
  bleibt mehrfach verknüpft und nicht exklusiv.
- Aufgaben und Reminder sind fachliche Objekte; Notifications sind nur ein Anzeigeweg.
- Schnellzugriff meint wichtige Dokumente schnell finden, nicht externe Notfallfreigabe.
- Der Home Hub in M2 ist ein Capture-Gateway, noch kein vollständiges Sync Backend.
- Das Datenmodell muss den späteren Ausbau zu vollständigem Sync und lokaler Intelligence vorbereiten.

## Offene Folgefragen

- Mobile/Home-Hub-Kopplung ist entschieden: QR Pairing primaer, manueller Pairing-Code als Fallback. M2 erzwingt kein Login; Identity bleibt vorbereitet.
- Welche Scanformate sind in M2 erlaubt: PDF, Bild oder beides?
- Welche native Scanner-Bridge nutzt DocMan: Google ML Kit Document Scanner auf Android und VisionKit auf iOS oder eine belastbare Flutter-Kapselung davon?
- Welche minimale Vorgangsliste braucht Mobile: Titel, Profil, Status, Tags, Datum?
- Wie lange darf die mobile Queue Dokumente lokal halten?
- Wie erkennt Desktop, ob ein Upload direkt zugeordnet oder noch zu prüfen ist?
- Welche Upload-Groessenlimits und Retry-/Cleanup-Regeln gelten fuer den ersten
  Mobile-Capture-Slice?
- Wie viel Profil-/Personenverwaltung muss R4 sichtbar machen, bevor R5 ausgebaut wird?
