---
title: "Decision - Desktop Import Scope"
description: "Scope für Dateiauswahl, Drag-and-drop, sichere Importkandidaten und Adaptergrenzen"
tags: [decision, desktop-import, drag-drop, file-picker, capture, flutter]
lastUpdated: "2026-07-15"
status: "accepted"
owner: "product-concept/ui-concept"
---
# Decision - Desktop Import Scope

## Status

Angenommen. Konkrete Flutter-Packages bleiben vor Implementierung durch einen
Wartungs-, Plattform-, Lizenz- und Security-Spike zu bestätigen.

## Entscheidung

Desktop unterstützt Dateiauswahl und Drag-and-drop über denselben
Import-Contract:

```text
Picker oder Drop
  -> DesktopImportPort
  -> neutrale Importkandidaten
  -> Validierung und dauerhafte kontrollierte Kopie
  -> Capture Session
  -> asynchrone Preview-, OCR-, Index- und Routing-Vorschläge
```

Picker-, Drop-, Plattform- und SDK-Typen bleiben Infrastructure-Details. Domain
und Presentation arbeiten mit Mappm-eigenen Modellen. Riverpod verdrahtet
Produkt-, Plattform- und Fake-Strategien.

## Kandidat und Validierung

Ein neutraler Kandidat enthält stabile Session-/Item-ID, Quellart, Dateiname,
temporäre Quelle, Größe, erkannten MIME-Typ, Erweiterung und Erfassungszeit.
Vor Abschluss werden mindestens Lesbarkeit, reguläre Datei, Format/MIME,
Größenlimit, Malware-/Security-Policy, Hash und erfolgreiche kontrollierte
Kopie geprüft.

Der ursprüngliche Pfad ist keine dauerhafte Abhängigkeit und darf nur redigiert
als technische Provenienz verwendet werden. Fehler sind pro Datei sichtbar;
ein Teilfehler blockiert nicht den restlichen Batch.

## Formate und Batch

Der erste freigegebene Slice unterstützt mindestens PDF, JPEG und PNG. Weitere
Formate wie HEIC/TIFF, Office, Mail, ZIP, Ordner, Watch Folder oder Scanner-
Hardware werden nur nach Format-, Security-, Preview- und Testentscheidung
aktiviert.

Mehrere gemeinsam gewählte Dateien bilden eine technische Sitzung, keinen
fachlichen Case. Jedes logische Dokument wird separat verarbeitet. Compound-
Dateien dürfen reversible Split-/Merge-Vorschläge erhalten; Originale bleiben
erhalten und Outlier sichtbar.

## Abhängigkeiten und Tests

`file_picker` und `desktop_drop` sind derzeit mögliche Adapter, keine
Domainentscheidung. Vor Pinning werden aktuelle Plattformabdeckung,
Maintainer-Status, Lizenz, native Berechtigungen, Dateipfad-/Byte-Verhalten,
Accessibility und Testbarkeit geprüft.

Fakes und Tests decken Picker, Drop, Mehrfachauswahl, ungültige/zu große oder
beschädigte Datei, Dublette, Partial Failure, Neustart, Split/Merge und
plattformabhängige Abbrüche ab.
