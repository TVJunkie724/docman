---
title: "Decision - Mobile Scanner Technology and Capture Artifacts"
description: "Entscheidung fuer native Plattform-Scanner, Capture-Intent, Scanqualitaet und primaere Artefakte fuer Dokumentenscan vs. Foto/Bild"
tags: [decision, mobile, capture, scanner, android, ios, ml-kit, visionkit, spike]
lastUpdated: "2026-06-06"
status: "provisional-accepted"
---

# Decision - Mobile Scanner Technology

## Status

Provisional accepted.

Native Plattform-Scanner sind der vorlaeufige Favorit. Die konkrete
Flutter-Bridge wird erst nach einem Qualitaets-Spike final entschieden.
R7-D1 ist als Produktentscheidung akzeptiert: Das primaere Artefakt richtet
sich nach dem Capture-Intent.

## Entscheidung

Mappm plant Mobile Capture nicht als selbstgebauten Kamera-/OpenCV-Scanner.

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

Native SDK-Typen duerfen nicht in die Mappm-Domain leaken.

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

Die konkrete Bridge mappt ML-Kit-/VisionKit-Ergebnisse in diese Mappm-Typen.

## Artefakt-Richtung

Der M2 soll als Zielartefakt ein nutzbares Dokument erzeugen, nicht nur eine
Galerie von Fotos.

R7-D1 entscheidet nicht "immer PDF" oder "immer Bild", sondern unterscheidet
nach Capture-Intent:

```text
DocumentScan
  -> primaeres Nutzerartefakt: PDF
  -> technische Artefakte: Seitenbilder, Rohseiten, Preview, Metadaten

PhotoOrImageEvidence
  -> primaeres Nutzerartefakt: Bild
  -> technische Artefakte: Preview, Metadaten
```

### DocumentScan

DocumentScan ist der Standard fuer:

- Rechnungen.
- Arztbriefe.
- Vertraege.
- Bescheide.
- Polizzen.
- Geburtsurkunde.
- Staatsbuergerschaftsnachweis.
- Meldezettel.
- sonstige papierartige Dokumente.

Qualitaetsziel:

- Auto-Capture oder stabile manuelle Aufnahme.
- Dokument-/Rand-Erkennung.
- Perspektivkorrektur.
- automatische Rotation.
- Hintergrund bereinigt oder deutlich aufgehellt.
- Text bleibt dunkel, kontrastreich und ohne Nachbearbeitung lesbar.
- mehrseitige Dokumente sind moeglich.
- PDF-Ausgabe ist verfuegbar.
- Seitenbilder/Rohseiten bleiben mindestens bis Upload/Review erhalten.

Wenn diese Qualitaet nicht erreicht wird, muss die App Retake, manuelle
Crop-Korrektur oder einen sichtbar niedrigeren Fallback anbieten.

### PhotoOrImageEvidence

PhotoOrImageEvidence ist der Standard fuer:

- Passfoto.
- Unfallfoto.
- Schadenfoto.
- Produktfoto.
- Beweisfoto.
- andere Bildnachweise, die nicht wie ein papierartiges Dokument behandelt
  werden sollen.

Regeln:

- Bild bleibt primaer Bild.
- Kein Zwang zu PDF.
- Originalqualitaet und Bildcharakter bleiben wichtiger als
  Dokumentoptimierung.
- Mehrere Bilder koennen trotzdem einem Vorgang, Dokumentkontext oder Record
  zugeordnet werden.

## UI-Regel

Mobile Capture soll einen einfachen Modus anbieten:

```text
Dokument scannen | Foto aufnehmen
```

Default ist `Dokument scannen`, weil die haeufigsten Mobile-Capture-Faelle
Rechnungen, Briefe, Bescheide und sonstige Dokumente sind.

Der Dokumenttyp darf einen Modus vorschlagen, aber nicht hart erzwingen. Die
Nutzerin kann beim Capture oder im Review korrigieren, ob etwas ein
Dokumentenscan oder ein Bildnachweis ist.

Desktop-Import:

- PDF bleibt PDF.
- JPG/PNG kann als Bildnachweis importiert werden.
- JPG/PNG kann als Dokumentseite/Dokumentenscan eingeordnet und spaeter zu PDF
  normalisiert werden.

## Artefakt-Regeln

Fuer DocumentScan gilt:

- Nutzerartefakt: mehrseitiges PDF.
- technische Artefakte: Seitenbilder, Preview/Thumbnail, Metadaten.
- Mobile haelt Rohseiten mindestens bis zum erfolgreichen Upload lokal.
- spaetere Milestones kann der Home Hub Rohseiten dauerhaft uebernehmen, damit spaetere
  Reprocessing-, OCR- oder Verbesserungslaeufe moeglich bleiben.

Die konkrete Pflicht, ob PDF bereits im M2 auf Mobile erzeugt werden muss oder
ob Bild-plus-Metadaten fuer den ersten Slice reicht, bleibt Teil des
Scanner-/Upload-Spikes.

Fuer PhotoOrImageEvidence gilt:

- Nutzerartefakt: Bilddatei.
- technische Artefakte: Preview/Thumbnail, Metadaten.
- Bild darf einem Vorgang oder Record zugeordnet werden, ohne in ein PDF
  verwandelt zu werden.

## Fallback-Regeln

Wenn native Scanner auf einer Plattform oder einem Geraet nicht verfuegbar sind:

- Mappm darf einen normalen Kamera- oder Dateiimport anbieten.
- Der Fallback muss sichtbar als niedrigere Qualitaetsstufe behandelt werden.
- Der Fallback darf nicht als erfolgreicher Document-Scan versteckt werden.
- Draft-Inbox bleibt der sichere Zielort.

## Konsequenzen

- R4-D12 ist vorlaeufig entschieden: native Plattform-Scanner sind der Favorit.
- R7-D1 ist entschieden: Primaeres Artefakt folgt Capture-Intent.
- Dokumentenscans werden fuer Nutzerinnen primaer als PDF geplant.
- Foto-/Bildnachweise bleiben primaer Bilder.
- R4 braucht einen Scanner-Qualitaets-Spike vor finaler Package-/Bridge-Auswahl.
- F17 Mobile Capture beschreibt native Scanner als Zielrichtung.
- R3/R4 Tests muessen Scanner-Ergebnisse ueber Mappm-Fakes simulieren, nicht
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
- ob PDF-Erzeugung im ersten M2 zwingend auf Mobile passiert oder durch Home Hub
  bzw. Desktop normalisiert werden darf.
- genaue Dateiformate und Kompressionsparameter.
- genaue Regeln, wann Mobile lokale Rohseiten nach Upload loescht.
