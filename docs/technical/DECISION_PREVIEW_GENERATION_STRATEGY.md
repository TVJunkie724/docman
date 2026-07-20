---
title: "Decision - Preview Generation Strategy"
description: "Austauschbare, sichere Preview-Generierung für Bilder und PDFs"
tags: [decision, preview, pdf, thumbnails, processing-review, flutter]
lastUpdated: "2026-07-20"
status: "accepted"
owner: "product-concept/data-architect"
---
# Decision - Preview Generation Strategy

## Status

Angenommen. `pdfrx` bleibt ein zu prüfender PDF-Adapter, keine bereits
unumkehrbar festgelegte Produktabhängigkeit.

## Entscheidung

Preview-Generierung läuft asynchron hinter einem
`PreviewGenerationPort`. Bild- und PDF-Adapter sowie Fakes implementieren
denselben Contract; SDK-/Package-Typen erreichen weder Domain noch UI-State.

```text
DocumentPreviewProvider
  -> PreviewGenerationPort
    -> ImagePreviewAdapter
    -> PdfPreviewAdapter
    -> FakePreviewAdapter
```

Preview und Thumbnail sind abgeleitete, lösch- und rebuildbare Artefakte. Sie
besitzen keine eigene Dokumentidentität und ersetzen nie das Original.

## Verhalten

- Import/Capture wartet nicht auf die Preview.
- Pending, Ready, Failed und Unsupported sind unterscheidbare Zustände.
- Ein Preview-Fehler macht das Original nicht unbrauchbar und löscht nichts.
- Mehrseitige Navigation, Thumbnail-Leiste, Rotation, OCR-Overlay, Annotation
  und PDF-Bearbeitung werden nur in ausdrücklich freigegebenen Slices gebaut.
- ZIP-Medienpakete, DICOM-Dateibaeume und darin enthaltene Programme besitzen
  in M1 den Preview-Zustand `Unsupported`. Das Original kann nur ueber die
  akzeptierte case-lokale medizinische Desktop-Aktion importiert werden und
  bleibt exportierbar; es wird fuer eine Vorschau nicht automatisch extrahiert
  oder ausgefuehrt.
- Local Vault erzeugt/cacht lokal; Cloud Vault darf serverseitige Ableitungen
  verwenden, wenn Trust-, Authorization-, Retention- und Offline-Contracts
  dies erlauben.

## Adapter-Gate

Vor Festlegung eines PDF-Adapters werden aktuelle Plattformabdeckung,
Renderingqualität, Speicher/CPU, Paketgröße, Lizenz, Wartungszustand,
Sandboxing, beschädigte/verschlüsselte PDFs, Accessibility und Testbarkeit
geprüft. Ein Scheitern des Favoriten erfordert nur einen neuen Adapter, keine
Domainänderung.

Tests verwenden synthetische ein- und mehrseitige PDFs/Bilder sowie große,
beschädigte, verschlüsselte und nicht unterstützte Dateien. Private
Echtdokumente sind unzulässig.
