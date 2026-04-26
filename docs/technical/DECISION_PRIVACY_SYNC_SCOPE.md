---
title: "Decision - Privacy and Sync Scope"
description: "Entscheidung zu Privacy-Klassen und Sync-Grenzen für DocMan MVP und spätere Self-hosted-Synchronisation"
tags: [decision, privacy, sync, data-classification, self-hosted]
lastUpdated: "2026-04-27"
status: "accepted"
---

# Decision - Privacy and Sync Scope

## Status

Accepted.

## Entscheidung

DocMan synchronisiert im MVP nur in eine private, selbst kontrollierte Home-Hub-Umgebung. Eine Managed-Cloud- oder externe SaaS-Synchronisation ist nicht Teil der Produktplanung.

## Datenklassen

| Klasse | Beispiele | MVP-Regel |
|---|---|---|
| Secrets | Pairing Secret, Session Token, Schlüssel | Nur F12 Secure Storage |
| Originaldateien | Scans, PDFs, Bilder | Lokal und Home Hub erlaubt |
| Dokument-Metadaten | Titel, Sender, Datum, Tags | Lokal und Home Hub erlaubt |
| Case-Daten | Vorgänge, Aufgaben, Ereignisse | Lokal; spätere Sync-Fähigkeit vorbereiten |
| Queue-/Sync-Status | Upload-Status, Retry, Fehlerklasse | Lokal und Home Hub erlaubt |
| OCR-/LLM-Ergebnisse | extrahierter Text, Vorschläge | Nicht MVP |
| Logs | Diagnose | Keine Inhalte, keine Secrets |

## Regeln

- Keine externen Dienste ohne neue Entscheidung.
- Keine Secrets in normaler lokaler DB.
- Keine Dokumentinhalte in Logs.
- Mobile Uploads dürfen an den Home Hub gehen, weil Mobile Capture MVP-Scope ist.
- Vollständiger Multi-Geräte-Sync wird später separat entschieden.
- Löschung, Export und Geräte-Entkopplung bleiben Produktanforderungen.

## Konsequenzen

- F10/F12/F7/F11 sind verbindlich auf Privacy-Grenzen auszurichten.
- Sync-Modelle müssen Datenklassen berücksichtigen.
- Sensitive abgeleitete Daten wie OCR-Text werden später bewusst eingeführt, nicht nebenbei.

