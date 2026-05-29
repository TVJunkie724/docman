---
title: "Decision - Mobile Scanner Technology"
description: "Vorlaeufig akzeptierte Entscheidung fuer native Plattform-Scanner mit Qualitaets-Spike vor finaler Flutter-Bridge-Auswahl"
tags: [decision, mobile, capture, scanner, android, ios, ml-kit, visionkit, spike]
lastUpdated: "2026-05-11"
status: "provisional-accepted"
---

# Decision - Mobile Scanner Technology

## Status

Provisional accepted.

Native Plattform-Scanner sind der vorlaeufige Favorit. Die konkrete
Flutter-Bridge wird erst nach einem Qualitaets-Spike final entschieden.

## Entscheidung

Ordna plant Mobile Capture nicht als selbstgebauten Kamera-/OpenCV-Scanner.

Der bevorzugte Zielpfad ist:

```text
Android
  -> Google ML Kit Document Scanner

iOS
  -> Apple VisionKit Document Camera

Flutter
  -> kapselt die native Scanner-Session
  -> orchestriert Queue, Upload, Draft-Kontext und Fehlerzustand
```

Normale Kamera- oder Dateiimporte duerfen als Fallback existieren, sind aber
nicht das Qualitaetsziel fuer Mobile Document Scan.

## Warum Native Scanner

Das Produktziel ist Google-Drive-aehnliche Scanqualitaet:

- Auto-Capture.
- Dokument-/Rand-Erkennung.
- manuelle Crop-Korrektur.
- Perspektivkorrektur.
- automatische Rotation.
- Dokumentoptimierung mit hellem Hintergrund und gut lesbarem dunklem Text.
- Mehrseiten-Dokumente.
- Ausgabe als PDF und/oder Seitenbilder.

Diese Qualitaet ist schwer sinnvoll selbst zu bauen. Ein eigener
Flutter-Kamera-/OpenCV-Pfad wuerde viel Produktzeit binden und trotzdem
wahrscheinlich schlechtere Ergebnisse liefern als die nativen Plattform-Flows.

## Spike-Gate

Die Entscheidung fuer native Plattform-Scanner ist akzeptiert. Nicht akzeptiert
ist eine konkrete Flutter-Package-Abhaengigkeit.

Vor finaler Implementierung braucht R4 einen kurzen Spike:

- Android mit Google ML Kit Document Scanner auf realem Android-Geraet testen.
- iOS mit VisionKit Document Camera auf realem iPhone testen.
- mehrere echte Dokumenttypen pruefen:
  - Arztbrief / normaler A4-Brief.
  - Rechnung oder Kassenzettel.
  - Ausweis-/Nachweis-artiges Dokument.
  - glaenzendes oder schlecht beleuchtetes Papier.
  - mehrseitiges Dokument.
- Ausgabequalitaet pruefen:
  - Rand-Erkennung.
  - Lesbarkeit.
  - Weiss-/Schwarz-Dokumentoptimierung.
  - PDF-Ausgabe.
  - Seitenbild-Ausgabe.
  - Dateigroesse.
  - Verhalten ohne perfekte Beleuchtung.
- UX pruefen:
  - Auto-Capture-Verhalten.
  - manuelle Korrektur.
  - Abbruch / Retry.
  - Mehrseiten-Flow.
  - Fehlermeldungen bei nicht unterstuetztem Geraet.

## Flutter-Bridge-Auswahl

Nach dem Spike wird entschieden:

1. bestehendes Flutter-Plugin verwenden.
2. kleines eigenes Platform-Channel-Plugin bauen.
3. kommerzielles Scanner-SDK pruefen, falls native Scanner die Qualitaet oder
   Wartbarkeit nicht liefern.

Auswahlkriterien:

- Scanqualitaet.
- Android- und iOS-Paritaet.
- Wartungszustand und Release-Geschwindigkeit.
- minimale Rechte und Privacy-Verhalten.
- Zugriff auf PDF und Seitenbilder.
- Fehler-/Abbruchmodell.
- Testbarkeit.
- keine SDK-Typen in Domain, Application oder UI-Feature-State.

## Domain-Grenze

Native SDK-Typen duerfen nicht in die Ordna-Domain leaken.

Die App arbeitet gegen eigene Begriffe, zum Beispiel:

```text
ScanSession
ScannedPage
ScanArtifact
PdfRendition
ImageRendition
ScanQuality
ScanFailure
```

Die konkrete Bridge mappt ML-Kit-/VisionKit-Ergebnisse in diese Ordna-Typen.

## Artefakt-Richtung

Der M2 soll als Zielartefakt ein nutzbares Dokument erzeugen, nicht nur eine
Galerie von Fotos.

Vorlaeufige Richtung:

- Nutzerartefakt: mehrseitiges PDF.
- technische Artefakte: Seitenbilder, Preview/Thumbnail, Metadaten.
- Mobile haelt Rohseiten mindestens bis zum erfolgreichen Upload lokal.
- spaetere Milestones kann der Home Hub Rohseiten dauerhaft uebernehmen, damit spaetere
  Reprocessing-, OCR- oder Verbesserungslaeufe moeglich bleiben.

Die konkrete Pflicht, ob PDF bereits im M2 auf Mobile erzeugt werden muss oder
ob Bild-plus-Metadaten fuer den ersten Slice reicht, bleibt Teil des
Scanner-/Upload-Spikes.

## Fallback-Regeln

Wenn native Scanner auf einer Plattform oder einem Geraet nicht verfuegbar sind:

- Ordna darf einen normalen Kamera- oder Dateiimport anbieten.
- Der Fallback muss sichtbar als niedrigere Qualitaetsstufe behandelt werden.
- Der Fallback darf nicht als erfolgreicher Document-Scan versteckt werden.
- Draft-Inbox bleibt der sichere Zielort.

## Konsequenzen

- R4-D12 ist vorlaeufig entschieden: native Plattform-Scanner sind der Favorit.
- R4 braucht einen Scanner-Qualitaets-Spike vor finaler Package-/Bridge-Auswahl.
- F17 Mobile Capture beschreibt native Scanner als Zielrichtung.
- R3/R4 Tests muessen Scanner-Ergebnisse ueber Ordna-Fakes simulieren, nicht
  ueber echte ML-Kit-/VisionKit-SDKs.
- API-/Upload-Vertraege muessen PDF, Seitenbilder und spaetere Source Artifacts
  modellierbar halten.
- Die konkrete Upload-Strategie steht in
  `DECISION_MOBILE_CAPTURE_UPLOAD_STRATEGY.md`: API-proxied im M2 erlaubt,
  presigned/resumable als Enterprise-Ziel hinter demselben Upload-Port.

## Nicht entschieden

- konkretes Flutter-Plugin.
- ob ein eigenes Platform-Channel-Plugin noetig ist.
- ob ein kommerzielles SDK spaeter sinnvoll wird.
- ob PDF-Erzeugung im ersten M2 zwingend auf Mobile passiert.
- genaue Dateiformate und Kompressionsparameter.
- genaue Regeln, wann Mobile lokale Rohseiten nach Upload loescht.
