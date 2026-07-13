---
title: "Konzept F14 - Form Field Catalog"
description: "DocMan-spezifischer Formularfeld-Katalog für Vorgänge, Dokumente, Profile, Draft Review, Upload Queue und spätere KI-Vorschläge"
tags: [concept, forms, ui, fields, review, documents, cases]
lastUpdated: "2026-07-12"
version: "3.1"
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
| Prozent | Erstattungsquote, Selbstbehalt, Deckung |
| Auswahl | Dokumenttyp, Vorgangstyp, Status |
| Nachweis-/Record-Auswahl | aktuelle Version, alte Version, ersetzt durch |
| Profilauswahl | Zuordnung zu Person/Haushalt |
| Tags | Suche, freie Struktur |
| Datei-Auswahl | Desktop-Import |
| Scan-Quelle | Mobile Capture |
| Review-Feld | KI/OCR-Vorschlag akzeptieren/korrigieren |
| Claim-Feld | eingereicht, bewilligt, teilweise bewilligt, abgelehnt, bezahlt |

## M2-Formulare

- Vorgang erstellen/bearbeiten.
- Dokument-Draft prüfen.
- Dokument einem Vorgang zuordnen.
- Dokument optional einem Record/Nachweis zuordnen.
- Dokumenttyp aus dem M2-Katalog wählen.
- Profil wählen.
- Mappm Account/Gerät/Entitlement verwalten, Assist-Policy anzeigen oder
  Vault-Migration/Detached Recovery starten; keine Serveradresse im Produkt.
- Mobile Upload optional kommentieren.

Der M2-Dokumenttyp-Katalog ist in
`docs/technical/DECISION_DOCUMENT_TYPE_CATALOG.md` entschieden. Typen
steuern im M2 Auswahl, Filter und optionale Vorschlaege, aber keine
dokumenttypspezifischen Pflichtfelder.

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

- M2-Formulare abgedeckt sind.
- Dokument-/Vorgangszuordnung klar ist.
- Review-Felder für spätere Intelligence vorbereitet sind.
- Feldfehler zu F5 passen.

## Offene Folgefragen

- Welche Vorgangstypen brauchen eigene Formularfelder?
- Wann wird ein visuelles Form-Design-System konkretisiert?

## Enterprise Quality Contract

This concept adopts `docs/execution/CONCEPT_ENTERPRISE_QUALITY_CONTRACT.md`.
Its own scope and status remain authoritative; the shared contract supplies the
mandatory ownership, security/privacy, accessibility/localization, verification,
stop-rule and handoff defaults wherever this file does not define a stricter
rule. Any conflict must stop the affected phase and be resolved in this concept.
