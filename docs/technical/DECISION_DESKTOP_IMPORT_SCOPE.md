---
title: "Decision - Desktop Import Scope"
description: "Entscheidung zum R4-M2-Umfang fuer Desktop-Dateiimport, Drag & Drop, Dateitypen, Import-Port und Package-Abstraktion"
tags: [decision, desktop-import, drag-drop, file-picker, draft-inbox, flutter, mvp]
lastUpdated: "2026-05-19"
status: "accepted"
---

# Decision - Desktop Import Scope

## Status

Accepted.

## Entscheidung

Der R4-M2 plant Desktop Import mit **Dateiauswahl und Drag & Drop**.

Beide Eingangswege laufen ueber denselben Import-Port und erzeugen dieselben
fachlichen Import-Kandidaten:

```text
File Picker
Drag & Drop
  -> DesktopImportController / Notifier
  -> DesktopImportSourcePort
      -> FilePickerImportSource
      -> DragDropImportSource
  -> ImportCandidate[]
  -> ImportValidation
  -> Local File Store copy
  -> Draft-Inbox Item
```

Der M2 verwendet als Zielrichtung:

- `file_picker` fuer native Dateiauswahl.
- `desktop_drop` fuer Desktop Drag & Drop.

Beide Packages bleiben Infrastructure-/Adapterdetails. Domain, Draft-Inbox und
Review-Workflow duerfen keine `file_picker`, `desktop_drop`, `XFile`,
`PlatformFile` oder Plattform-SDK-Typen kennen.

## Strategy / Provider Boundary

Die austauschbare Implementierung ist eine Strategy hinter einem Port.
Riverpod verdrahtet die aktive Implementierung.

```text
Application / Presentation
  -> DesktopImportPort

Infrastructure Strategies
  -> FilePickerDesktopImportStrategy
  -> DragDropDesktopImportStrategy
  -> FakeDesktopImportStrategy

Riverpod
  -> desktopImportStrategyProvider
```

Damit kann spaeter ein anderes Drag-&-Drop-Package, ein anderer File Picker,
eine platform-spezifische Implementierung oder ein Watch-Folder-Adapter
eingefuehrt werden, ohne Domain- oder Draft-Inbox-Modelle umzubauen.

## Neutraler Import-Kandidat

App-intern wird ein eigener neutraler Typ geplant:

```text
DesktopImportCandidate
  id
  sourceKind: picker | dragDrop
  originalName
  localPathOrTempPath
  sizeBytes
  mimeType?
  extension
  capturedAt
```

Dieser Typ ist ein Application-/Data-Transfer-Objekt fuer Importverarbeitung,
nicht das finale Dokumentmodell.

## M2-Dateitypen

Der M2 akzeptiert:

- PDF.
- JPG/JPEG.
- PNG.

Nicht im M2:

- Ordnerimport.
- ZIP.
- E-Mail-Dateien.
- Office-Dokumente.
- HEIC/TIFF.
- Scanner-Hardware-Import.
- automatische OCR/Klassifikation.
- Batch-Regeln.

## Mehrfachauswahl und Drag mehrerer Dateien

Wenn mehrere Dateien ausgewählt oder gedroppt werden, entstehen mehrere
Draft-Inbox-Einträge.

Ausnahme:

- Ein mehrseitiges PDF bleibt ein einzelner Dokument-Draft.

Mehrere Bilder werden im M2 nicht automatisch zu einem mehrseitigen Dokument
zusammengefuegt. Combine/Merge bleibt ein spaeteres Import-Feature.

## Validierung

Vor dem Kopieren in den lokalen File Store prueft der Import:

- Datei existiert und ist lesbar.
- Eingabe ist eine Datei, kein Ordner.
- Dateityp ist erlaubt.
- Groesse ist lesbar.
- Hash kann berechnet werden.
- Kopie in lokalen File Store gelingt.

Fehler werden als sichtbare Import-/Draft-Fehler behandelt und nicht still
verschluckt.

Wenn der Hash bereits existiert, gilt `DECISION_IMPORT_DUPLICATE_DETECTION.md`:
Die App zeigt eine Warnung mit den Optionen "Bestehendes öffnen",
"Beide behalten" und "Abbrechen".

## Speicherregel

Nach erfolgreichem Import arbeitet Ordna mit einer Kopie im lokalen File Store.

Der Originalpfad ist keine dauerhafte Abhaengigkeit. Er darf hoechstens als
redigierbare technische Herkunfts-/Diagnoseinformation gespeichert werden.

## Konsequenzen

- R4.2 Desktop Import + Draft Inbox muss Drag & Drop und Dateiauswahl
  gemeinsam planen.
- `file_picker` und `desktop_drop` duerfen als Dependencies vorbereitet werden,
  aber nicht in Domain leaken.
- F10 Local Storage muss Desktop-Import als File-Store-Kopie behandeln.
- D37 Import Duplicate Detection muss Hash-Treffer als Review-/Warnzustand
  behandeln, nicht als harten Fehler.
- F15/F4 Tests brauchen Fake-Import-Kandidaten fuer Picker und Drag & Drop.
- Spaetere Importquellen wie Watch Folder, Mail Import oder Share Sheet koennen
  als weitere Strategies geplant werden.

## Nicht entschieden

- exakte UI-Gestaltung der Drop-Zone.
- ob Drag & Drop direkt im Inbox-Screen oder in einem Import-Dialog liegt.
- konkrete maximale Desktop-Import-Dateigroesse.
