---
title: "Decision - Preview Generation Strategy"
description: "Entscheidung zur austauschbaren Preview-Generierung fuer Bilder und PDFs im R4-M2 mit pdfrx als bevorzugtem PDF-Adapter"
tags: [decision, preview, pdf, pdfrx, thumbnails, draft-inbox, flutter, mvp]
lastUpdated: "2026-05-21"
status: "accepted"
---

# Decision - Preview Generation Strategy

## Status

Accepted.

## Entscheidung

Preview-Generierung laeuft im R4-M2 ueber einen austauschbaren
`PreviewGenerationPort`.

Fuer PDF-Preview ist **`pdfrx`** der vorlaeufig bevorzugte Adapter. Fuer
JPG/JPEG/PNG nutzt Ordna eine einfache Image-Preview-Strategy.

```text
Draft Review UI
  -> DocumentPreviewProvider
      -> PreviewGenerationPort
          -> ImagePreviewStrategy
          -> PdfFirstPagePreviewStrategy
          -> FakePreviewStrategy

Infrastructure
  -> pdfrx adapter for PDF
  -> Flutter/image codec adapter for images
```

`pdfrx` bleibt Infrastructure. Domain, Draft-Inbox, Document-Modell und
Review-Workflow kennen keine `pdfrx`-Typen.

## Warum pdfrx

`pdfrx` passt als aktueller Favorit, weil es:

- Android, iOS, Linux, macOS, Web und Windows unterstuetzt.
- auf PDFium basiert.
- PDF-Anzeige und einzelne Seiten unterstuetzt.
- mehrseitige PDFs fuer spaetere Milestones-Preview-Navigation vorbereiten kann.
- ueber denselben Adapter spaeter ersetzt werden kann, falls Packaging,
  App-Groesse oder Plattformdetails stoeren.

## M2-Verhalten

Preview-Generierung ist **asynchron nach Import/Upload**.

Regeln:

- Import/Draft-Erstellung blockiert nicht auf Preview.
- neuer Draft startet mit `previewPending`.
- Bilddateien erzeugen Bildvorschau oder Thumbnail.
- PDF erzeugt erste Seite als Preview/Thumbnail.
- Fehler erzeugen `previewFailed`, aber Dokument bleibt nutzbar.
- nicht unterstuetzte Formate erzeugen `previewUnsupported`.

Statuswerte:

```text
previewPending
previewReady
previewFailed
previewUnsupported
```

## spaetere Milestones-Pfad

`pdfrx` kann mehrseitige PDFs grundsaetzlich anzeigen und einzelne Seiten
rendern. Deshalb verbaut der M2 nicht:

- mehrseitige Preview-Navigation.
- Seitenuebersicht/Thumbnail-Leiste.
- einzelne PDF-Seitenansicht.
- spaetere Seitenrotation oder Reorder.
- spaeteres Combine/Merge, falls separat entschieden.

Diese Faehigkeiten werden nicht automatisch M2-Scope. Sie bleiben spaetere Milestones und
muessen separat entschieden werden.

## Storage-Regel

Preview/Thumbnail ist ein abgeleitetes Artefakt:

- darf geloescht werden.
- darf neu erzeugt werden.
- ist nicht das Original.
- bekommt keine fachliche Dokumentidentitaet.
- wird im lokalen File Store oder Preview-Cache referenziert.

## Nicht im M2

- mehrseitige Preview-Navigation.
- OCR-Overlay.
- Annotationen.
- Preview-Rebuild-UI.
- mehrere Thumbnail-Groessen.
- PDF-Bearbeitung.
- Combine/Merge ueber die PDF-Library.
- Sync von Preview-Artefakten als Pflicht.

## Konsequenzen

- R4.9 kann PDF-Preview mit `pdfrx` planen, ohne Domain zu koppeln.
- `DECISION_DOCUMENT_METADATA_PREVIEW.md` ist technisch konkretisiert.
- F10 Local Storage behandelt Preview weiterhin als abgeleitetes Artefakt.
- Falls `pdfrx` im Spike scheitert, kann ein anderer PDF-Adapter hinter dem
  Preview-Port eingesetzt werden.

## Nicht entschieden

- konkrete Thumbnail-Groesse.
- konkrete Cache-Struktur.
- ob Preview-Jobs sofort nach Import oder lazy beim ersten Anzeigen starten.
- ob `pdfrx` auch fuer spaetere Vollansicht genutzt wird oder nur fuer
  Thumbnail-Rendering.
