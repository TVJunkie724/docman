---
title: "Decision - Document Metadata and Preview"
description: "Entscheidung zu Pflichtmetadaten, optionalen Metadaten und Vorschau/Thumbnail im R4-Capture-and-Review-Core"
tags: [decision, documents, metadata, preview, thumbnails, draft-inbox, milestones]
lastUpdated: "2026-07-14"
status: "accepted"
---

# Decision - Document Metadata and Preview

## Status

Accepted.

## Entscheidung

R4/M2 verwendet ein leichtes generisches Dokument-Metadatenmodell und
macht **Vorschau** zu einer Pflichtanforderung fuer Draft Review.

M2 baut keine dokumenttypspezifischen Pflichtformulare und keine
automatische OCR-/KI-Klassifikation. Er erfasst genug Struktur, damit Dokumente
pruefbar, auffindbar und spaeter ausbaubar bleiben.

## Pflicht in M2

Ein Dokument-Draft muss mindestens tragen:

- Titel.
- Dokumenttyp aus `DECISION_DOCUMENT_TYPE_CATALOG.md`.
- verwaltete Person/Organisation (`managedSubjectId`).
- Datei/FileRecord.
- Vorschau/Preview-Status.
- Quelle: Desktop Import oder Mobile Capture.
- Erfassungsdatum.
- Ablagedatum.
- Review-Status.
- optionale Vorgangs-, Record-, Claim- und Case-Beziehungen.

Die genaue Abschlussvalidierung steht in
`DECISION_REVIEW_COMPLETION_VALIDATION.md`.

## Optionale M2-Metadaten

Optional in M2:

- Aussteller/Absender.
- Dokumentdatum.
- Notiz.
- Betrag.
- Fälligkeitsdatum.
- Tags.

Diese Felder duerfen leer bleiben. Sie sollen Draft Review, Suche, Aufgaben und
spaetere Facts vorbereiten, aber keine komplexen Workflows erzwingen. Sie
werden in M3 Assisted Review priorisiert, weil dauerhafte manuelle Pflege
dieser optionalen Felder nicht realistisch ist.

## Vorschau-Regeln

Vorschau ist Pflicht fuer die Review-Erfahrung, aber nicht als unfehlbare
Rendering-Pipeline.

M2-Regeln:

- PDF: erste Seite als Preview/Thumbnail, mindestens aber klarer PDF-Platzhalter
  mit Dateiname und Fehler-/Pending-Status, falls Rendering noch nicht geht.
- JPG/JPEG/PNG: Bildvorschau.
- Mobile Scan: Scan-Preview oder erstes Seitenbild.
- Fehlerfall: klarer Platzhalter mit Fehlerstatus, nicht leerer oder kaputter
  UI-Bereich.

Preview/Thumbnail ist ein abgeleitetes Artefakt. Originaldatei und normalisierte
Dokumentdatei bleiben im File Store. Vorschauen duerfen geloescht und neu
erzeugt werden.

Die technische Preview-Strategie ist in
`DECISION_PREVIEW_GENERATION_STRATEGY.md` entschieden: `pdfrx` ist der
vorlaeufig bevorzugte PDF-Adapter hinter einem austauschbaren
`PreviewGenerationPort`; Preview laeuft asynchron und blockiert den Import
nicht.

## Nicht in M2

Nicht Teil von R4-D20:

- dokumenttypspezifische Pflichtfelder.
- automatische OCR-Extraktion.
- KI-Klassifikation.
- komplexe Formularvalidierung je Workflow.
- feste Templates pro Dokumenttyp.
- mehrseitige Preview-Navigation.
- OCR-Overlay.
- Annotationen.
- Preview-Vergleich mehrerer Versionen.
- Preview-Cache-Rebuild-UI.

## Beziehung zu Facts

Felder wie Betrag, Fälligkeit, Aussteller oder Dokumentdatum sind in M2
einfache Metadaten.

Spaeter koennen daraus `DocumentFact`, Claims, Financial Entries oder
Workflow-Vorschlaege entstehen. M2 darf diese Daten nicht in einer
beliebigen unstrukturierten Map verstecken, wenn sie bereits fachlich bekannt
sind.

Der Dokumenttyp-Katalog ist bewusst locker. Dokumenttypen helfen bei
Anzeige, Filter und spaeteren Vorschlaegen, erzwingen aber keine
typspezifischen Pflichtfelder.

## Auswirkungen auf Draft Review

Draft Review muss zeigen koennen:

- Vorschau oder klaren Platzhalter.
- Titel.
- Dokumenttyp.
- verwaltete Person/Organisation.
- optionale Vorgangszuordnung.
- Quelle.
- relevante optionale Metadaten.
- Review-/Fehlerstatus.

Ohne Vorschau ist der Draft nicht kaputt, aber als `previewPending` oder
`previewFailed` sichtbar.

## Konsequenzen

- R4.9 wird als Document/Record Metadata, Review Validation and Preview Core verstanden.
- F10 Local Storage muss Preview/Thumbnail als abgeleitetes Artefakt behandeln.
- Capture & Inbox muss Draft Review mit Vorschau planen.
- Search Core kann gepflegte Textmetadaten nutzen, ohne OCR vorauszusetzen.
- Intelligence/OCR kann spaeter auf demselben Review-Modell aufsetzen.
- Reisepass, Geburtsurkunde, Vertrag oder Polizze werden als `Record`/Unterlage
  mit Dokumentversionen vorbereitet und nicht zu künstlichen Vorgängen gemacht.

## Nicht entschieden

- exakte Thumbnail-Groessen.
- wie viele Preview-Stufen spaeter gecached werden.
