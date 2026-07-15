---
title: "Decision - Mobile Scanner Technology and Capture Artifacts"
description: "Vorläufige Entscheidung für native Plattformscanner, Capture-Intent, Qualitätsgate und primäre Artefakte"
tags: [decision, mobile, capture, scanner, android, ios, ml-kit, visionkit, spike]
lastUpdated: "2026-07-15"
status: "provisional-accepted"
owner: "product-concept/ui-architect"
---
# Decision - Mobile Scanner Technology and Capture Artifacts

## Status

Vorläufig angenommen. Native Plattformscanner sind der Favorit; Bridge,
Package und Fallback werden erst nach einem dokumentierten Qualitäts-,
Privacy-, Lizenz- und Plattformspike finalisiert.

## Richtung

Mappm baut im Commercial Core keinen eigenen Kamera-/OpenCV-Dokumentenscanner.
Zu prüfen sind insbesondere:

```text
Android -> Google ML Kit Document Scanner
iOS     -> Apple VisionKit Document Camera
Flutter -> eigener Port und austauschbare Bridge
```

Normale Kamera- oder Dateiimporte dürfen als sichtbarer Fallback existieren,
sind aber nicht automatisch gleichwertig mit dem Dokumentenscan.

## Qualitätsgate

Der Spike prüft auf repräsentativen unterstützten Geräten und mit ausschließlich
synthetischen Dokumenten:

- Rand-/Dokumenterkennung, Crop, Perspektive, Rotation und Kontrast;
- Auto-Capture und stabile manuelle Korrektur;
- A4, Kassenzettel, nachweisartiges, glänzendes/schlecht beleuchtetes und
  mehrseitiges Material;
- PDF- und Seitenbildausgabe, Dateigröße und Lesbarkeit für OCR;
- Abbruch, Retry, Mehrseitenfluss, Berechtigungen und nicht unterstützte Geräte;
- Android-/iOS-Parität, Accessibility, Offline-Verhalten und Testbarkeit;
- aktuelle API-/OS-Verfügbarkeit, Lizenz, Wartung und Datenschutz.

Erst danach wird bestehendes Flutter-Plugin, eigener Platform Channel oder
gegebenenfalls kommerzielles SDK gewählt.

## Domain-Grenze

Native SDK-Typen bleiben hinter einem Port. Die App verwendet eigene Modelle
für Scan-Session, Seite, Artefakt, Rendition, Qualität und Fehler. Fakes müssen
alle relevanten Ergebnisse ohne echte SDKs erzeugen können.

## Capture-Intent und Artefakte

- `DocumentScan`: papierartiger Inhalt; ein nutzbares mehrseitiges
  Dokument/PDF ist das primäre Nutzerartefakt. Quellseiten, Manifest und
  Preview bleiben nach Retention-Policy für Review/Reprocessing erhalten.
- `PhotoOrImageEvidence`: Bildnachweis; das Originalbild bleibt primäres
  Nutzerartefakt und wird nicht zwangsweise in PDF umgewandelt.

Der Intent darf vorgeschlagen und korrigiert werden. Ein Dokumentenscan ist
eine explizit abgeschlossene logische Dokumenteinheit; mehrere Seiten gehören
in diese Einheit, das nächste Papier beginnt eine neue Einheit.

## Vault und Fallback

Local Vault normalisiert auf dem Gerät. Cloud Vault darf zugelassene Managed-
Verarbeitung erst nach dauerhafter, bestätigter Speicherung und akzeptiertem
Trust-Contract nutzen. Kein Scannerpfad hängt von einem kundenseitigen Server
ab.

Bei fehlendem nativen Scanner bleiben Kamera-/Dateifallback, Qualitätswarnung,
Retake und Review möglich. Der Fallback darf weder Qualität vortäuschen noch
Originale verlieren.

## Offene Implementierungsfragen

Bridge/Package, genaue PDF-/Bildformate, Kompression, lokale Rohseiten-
Retention und gerätespezifische Mindestanforderungen werden im Spike und im
freigegebenen C2-Implementation-Contract entschieden.
