---
title: "Konzept F14 - Form Field Catalog"
description: "DocMan-spezifischer Formularfeld-Katalog für Vorgänge, Dokumente, Profile, Draft Review, Upload Queue und spätere KI-Vorschläge"
tags: [concept, forms, ui, fields, review, documents, cases]
lastUpdated: "2026-04-26"
version: "3.0"
status: "accepted"
---

# Konzept F14 - Form Field Catalog

## Status

Accepted.

Dieses Konzept ersetzt den importierten F14-Inhalt aus dem alten Projekt.

## Zweck

F14 definiert die fachlichen Formulartypen, die DocMan braucht. Exakte visuelle Spezifikation folgt später im Design-System.

## Feldfamilien

| Feld | Verwendung |
|---|---|
| Text | Titel, Sender, Notiz |
| Mehrzeilig | Beschreibung, Review-Kommentar |
| Datum | Dokumentdatum, Frist, Ereignisdatum |
| Betrag | Rechnungen, Erstattungen |
| Auswahl | Dokumenttyp, Vorgangstyp, Status |
| Profilauswahl | Zuordnung zu Person/Haushalt |
| Tags | Suche, freie Struktur |
| Datei-Auswahl | Desktop-Import |
| Scan-Quelle | Mobile Capture |
| Review-Feld | KI/OCR-Vorschlag akzeptieren/korrigieren |

## MVP-Formulare

- Vorgang erstellen/bearbeiten.
- Dokument-Draft prüfen.
- Dokument einem Vorgang zuordnen.
- Profil wählen.
- Home-Hub-Adresse setzen.
- Mobile Upload optional kommentieren.

## Review-Felder

Spätere OCR-/LLM-Vorschläge brauchen besondere Felder:

- vorgeschlagener Wert.
- Quelle/Hinweis.
- Confidence, falls verfügbar.
- akzeptieren.
- korrigieren.
- ablehnen.

Keine automatische Übernahme ohne Review, wenn es fachlich relevant ist.

## Validierung

Validierung unterscheidet:

- Pflichtfeld.
- Format.
- Plausibilität.
- Konflikt.
- Review erforderlich.

F5 definiert Fehlerklassen, F14 beschreibt Feldverhalten.

## Definition of Done

F14 gilt als umgesetzt, wenn:

- MVP-Formulare abgedeckt sind.
- Dokument-/Vorgangszuordnung klar ist.
- Review-Felder für spätere Intelligence vorbereitet sind.
- Feldfehler zu F5 passen.

## Offene Folgefragen

- Welche Vorgangstypen brauchen eigene Formularfelder?
- Welche Dokumenttypen sind MVP-relevant?
- Wann wird ein visuelles Form-Design-System konkretisiert?

