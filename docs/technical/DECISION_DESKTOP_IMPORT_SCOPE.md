---
title: "Decision - Desktop Import Scope"
description: "Scope für Dateiauswahl, Drag-and-drop, sichere Importkandidaten und Adaptergrenzen"
tags: [decision, desktop-import, drag-drop, file-picker, capture, flutter]
lastUpdated: "2026-07-20"
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
Formate wie HEIC/TIFF, Office, Mail, Watch Folder oder Scanner-Hardware werden
nur nach Format-, Security-, Preview- und Testentscheidung aktiviert.

Mehrere gemeinsam gewählte Dateien bilden eine technische Sitzung, keinen
fachlichen Case. Jedes logische Dokument wird separat verarbeitet. Compound-
Dateien dürfen reversible Split-/Merge-Vorschläge erhalten; Originale bleiben
erhalten und Outlier sichtbar.

## Desktop-Scannergrenze

Ein durch externe Scanner-Hardware oder eine andere Anwendung erzeugtes PDF
oder Bild ist ein normaler Importkandidat. Mappm muss dafuer keine
herstellerspezifische Scannersteuerung besitzen.

Ein Dokumentenscan ueber eine Desktop-Webcam ist verboten. Er wird weder als
Core-Funktion noch als Fallback oder experimentelle Plattformoption
implementiert. Foto-/Bilddateiimport bleibt davon unberuehrt.

macOS Continuity Camera und eine Mappm-Mobile-App-zu-Desktop-Erfassung sind
moegliche spaetere Komfortpfade. Sie sind im Draft
`DECISION_CROSS_DEVICE_CAPTURE_HANDOFF.md` beschrieben und werden erst nach
eigener Plattform-, Trust-, Security-, Contract- und Quality-Freigabe Teil
eines Implementation Contracts. Der normale Desktop-Import setzt kein
Smartphone voraus.

## Kontextueller medizinischer M1-Archivimport

Der Speichermedium-Archivimport ist kein globaler Capture-Kanal und keine
allgemeine Desktop-Importoption. M1 zeigt ihn ausschliesslich auf
unterstuetzten Desktop-Plattformen als seltene Kontextaktion innerhalb eines
bereits bestehenden, bestaetigten und geoeffneten `medical_care`-Case. Ohne
diesen Care-Kontext muss der Nutzer zuerst ueber den normalen Capture- oder
Case-Flow einen medizinischen Vorgang anlegen beziehungsweise bestaetigen.

Der Archivimport ist keine normale Mehrfachdateiauswahl:

```text
medizinischen Care-Case oeffnen
  -> kontextuellen Medienpaket-Import starten
  -> Speichermedium oder Ordner waehlen
  -> lesbaren Dateibaum und Grenzen vorpruefen
  -> Dateianzahl und Gesamtgroesse bestaetigen
  -> Titel manuell vergeben; Untersuchungsdatum optional eintragen
  -> regulaere Dateien streaming-faehig als ZIP archivieren
  -> ZIP, Manifest und Integritaet dauerhaft sichern
  -> Medienpaket direkt mit dem geoeffneten Care-Case verknuepfen
```

Da der medizinische Primaerkontext bereits feststeht, durchlaeuft das Paket
kein globales Case-/Record-Matching. In M1 vergibt der Nutzer den erforderlichen
Titel manuell. Als einziges fachliches Zusatzfeld ist ein relevantes Datum
optional. M1 zeigt dafuer genau das Feld `Untersuchungsdatum (optional)` und
speichert es als nutzereingegebenes Leistungs-/Ereignisdatum nach
`DECISION_TEMPORAL_FACT_EVENT_AGENDA_MODEL.md`; ist diese Bedeutung nicht
passend oder nicht bekannt, bleibt das Feld leer. Quelle, Importzeit, Groesse,
Dateianzahl, Hash, Manifest und technische Provenienz werden automatisch
erfasst und nicht als manuelles Formular verlangt.

Automatische Titel- oder Datumserkennung ist fuer diesen Randfall kein
M1-Versprechen. Das Paket wird dafuer weder entpackt noch an OCR/Assist
uebergeben. Eine spaetere optionale Erkennung braucht einen eigenen
Privacy-, Security-, Format-, Evidence- und UX-Scope und darf eine Diagnose,
Untersuchung oder andere fachliche Bedeutung nicht erfinden.

Der Archivimport erhaelt relative Pfade, Dateinamen und Dateiinhalt der
zugaenglichen regulaeren Dateien. Er folgt keinen symbolischen Links aus der
gewaehlten Wurzel, importiert keine Spezialdateien oder Geraeteknoten und
protokolliert ausgelassene, unlesbare oder zwischenzeitlich veraenderte
Eintraege vor der finalen Bestaetigung. Ein teilweise gelesenes Medium darf
nicht als vollstaendiges Archiv bestaetigt werden.

Archivpfade werden kanonisch als relative, traversal-freie Eintraege
geschrieben. Absolute Pfade, `..`-Ausbruch, Kollisionen nach
Plattformnormalisierung und unzulaessige Pfadlaengen erzeugen einen sichtbaren
Fehler statt eines still veraenderten Archivs. Manifest und darin enthaltene
Dateinamen gelten als sensible Daten.

ZIP ist der bewusst einfache M1-Container. Es ist kein forensisches
Datentraegerabbild und bewahrt keine Bootsektoren, Partitionsdaten oder andere
ISO-Eigenschaften. Das nach Import gespeicherte ZIP wird als Originalartefakt
behandelt und bei spaeterem Originalexport bytegleich ausgegeben.

Der Dateibaum darf aus medizinischer Bildgebung stammen und DICOM-Dateien,
`DICOMDIR`, Hilfsdateien sowie mitgelieferte Viewer-Software enthalten.
Ausfuehrbare Inhalte bleiben als inerte Bytes im Archiv. Mappm startet sie
nicht, extrahiert sie nicht automatisch und verspricht nicht, dass ein
mitgelieferter Viewer auf dem Zielsystem funktioniert.

Normale Multi-File-Importe bleiben per Dokument getrennt. Nur diese
kontextgebundene medizinische Desktop-Aktion erzeugt aus einem Dateibaum
bewusst ein einziges Medienpaket.

## Mobile Grenze

Mobile M1 bietet keinen medizinischen Medienpaket-Import, auch nicht als bereits
vorhandenes ZIP ueber den normalen Dateipicker. Ein bereits in Mappm
gespeichertes Medienpaket darf mobil nur angezeigt beziehungsweise
heruntergeladen/exportiert werden, wenn eine spaetere konkrete
Plattform-, Format-, Groessen-, Berechtigungs- und Security-Policy dies
freigibt. Diese Ausgabeoption ist kein Importversprechen.

## Abhängigkeiten und Tests

`file_picker` und `desktop_drop` sind derzeit mögliche Adapter, keine
Domainentscheidung. Vor Pinning werden aktuelle Plattformabdeckung,
Maintainer-Status, Lizenz, native Berechtigungen, Dateipfad-/Byte-Verhalten,
Accessibility und Testbarkeit geprüft.

Fakes und Tests decken Picker, Drop, Mehrfachauswahl, ungültige/zu große oder
beschädigte Datei, Dublette, Partial Failure, Neustart, Split/Merge und
plattformabhängige Abbrüche ab. Eine Negativpruefung stellt sicher, dass keine
Desktop-Webcam als Dokumentenscanner oder Capture-Fallback angeboten wird.

Der Archivimport testet zusaetzlich:

- CD-/USB-/Ordnerquelle mit verschachtelter Struktur und DICOMDIR;
- enthaltene ausfuehrbare Viewer-Dateien ohne Ausfuehrung;
- leeres Medium, unlesbare Datei, Symlink, Spezialdatei und Quellenaenderung
  waehrend des Imports;
- sehr grosse Pakete, ZIP64-/Policygrenze, Speicherknappheit, Abbruch und
  Neustart;
- Manifest-/Hashfehler sowie bytegleichen Re-Export des gespeicherten ZIP;
- sichtbare Archivaktion im geoeffneten bestaetigten `medical_care`-Case auf
  Desktop;
- manuell vergebener erforderlicher Titel, optionales Untersuchungsdatum und
  automatisch erfasste technische Metadaten;
- keine Archivaktion im globalen Desktop-Capture, in nichtmedizinischen Cases
  oder ohne bestaetigten Care-Kontext;
- kein Medienpaket-Import auf Mobile, auch nicht ueber ein vorhandenes ZIP.

Stop, wenn ein normaler Batch still zu einem Archiv wird, ein Archiv
automatisch ausgefuehrt/extrahiert wird, ausgelassene Dateien verborgen bleiben
oder der Medienpaket-Import global, mobil, ohne bestaetigten `medical_care`-Case
oder in einem nichtmedizinischen Case angeboten wird. Stop auch, wenn M1 fuer
diesen Randfall OCR/Assist, automatische Titel-/Datumserkennung oder ein
umfangreiches Metadatenformular voraussetzt. Stop ebenfalls, wenn eine
Desktop-Webcam fuer Dokumentenscans verdrahtet oder ein Draft-Cross-Device-Pfad
ohne eigene Freigabe vorausgesetzt wird.
