---
title: "Decision - Document Capture"
description: "Verbindliche Erfassung für Mobile Scan und Desktop Import mit dauerhaftem Eingang, asynchronem Assist und bestätigtem Routing"
tags: [decision, document-capture, mobile-capture, desktop, intelligence, review, batch, commercial-core]
lastUpdated: "2026-07-15"
status: "accepted"
owner: "product-concept"
---

# Decision - Document Capture

## Status

Angenommen. Frühere Annahmen eines primär manuellen Draft-Inbox-Flows und erst
späterer OCR-/KI-Verarbeitung sind ersetzt. Die normativen Routing- und
Automatisierungsregeln stehen in
`DECISION_CAPTURE_FIRST_ASSISTED_ROUTING.md`.

## Entscheidung

Der Commercial Core besitzt zwei nutzergesteuerte Eingänge:

1. mobilen Dokumentenscan beziehungsweise Foto-/Bildnachweis;
2. Desktop-Dateiauswahl und Drag-and-drop-Import.

Beide sichern zuerst Original und Manifest dauerhaft und verwenden danach
denselben asynchronen Verarbeitungs- und Review-Pfad:

```text
Scan oder Import
  -> Original und Artefaktmanifest dauerhaft sichern
  -> Qualität, Sicherheit und Dublette prüfen
  -> je Vault lokal bereitstellen oder bestätigt hochladen
  -> Preview, OCR, Klassifikation, Extraktion und Indexierung
  -> Titel-, Case-/Record- und Workflow-Vorschläge erzeugen
  -> relevante Folgen bestätigen oder korrigieren
  -> akzeptiertes Dokument mit primärem Case oder Record
```

Die Nutzerin darf die App nach der dauerhaften Sicherung verlassen. Status,
Ergebnis und Fehler überstehen Neustarts.

## Capture-first

Globales Capture ist der alltägliche Hauptweg. Vor dem Scan sind weder Profil,
Case, Dokumentrolle noch Metadatenformular erforderlich. Matching und
Vorschläge laufen immer, sobald die notwendige Verarbeitung verfügbar ist.

Als einzige frühe optionale Absicht darf globales Capture „Neuen Case starten“
anbieten. Dadurch entfällt die Wartezeit auf das primäre Matching, nicht aber
die Analyse: Core Assist schlägt weiterhin Titel, Metadaten, Workflow,
Aufgaben und zusätzliche Beziehungen vor. Ein leerer Titel- oder
Konfigurationsdialog ist unzulässig.

Capture innerhalb eines bestehenden Case oder Record bleibt als sekundärer,
bewusster Weg verfügbar. Es ist kein Standardverhalten für den zufälligen
Dokumenteingang. Konkrete Controls, Gesten und Layouts werden erst im
UI-Implementation-Contract festgelegt.

## Dokumentgrenzen und Batch

- Eine abgeschlossene mobile Scan-Einheit ist genau ein logisches Dokument.
- Ein Dokument darf mehrere Seiten besitzen; danach wird ausdrücklich das
  nächste Dokument begonnen.
- Mehrere Dokumente dürfen in einer Sitzung nacheinander erfasst oder am
  Desktop gemeinsam ausgewählt werden.
- Sitzungsnähe beweist keine fachliche Zusammengehörigkeit.
- Core Assist validiert Grenzen und schlägt Split/Merge nur bei wahrscheinlichem
  Fehler oder zusammengesetztem Import vor.
- Originale bleiben erhalten; Split, Merge, Sortierung und Neuzuordnung sind
  reversibel und idempotent.
- Ein Teilfehler verwirft keine erfolgreichen Dokumente.

## Mobile Qualität

Der mobile Dokumentenscan bereitet Auto-Capture, Rand-/Perspektivkorrektur,
Rotation, lesbare Optimierung, Mehrseitigkeit, Vorschau, Wiederholung,
Entfernen und Sortieren vor. Ein normaler Kamera-/Datei-Fallback bleibt
sichtbar als niedrigere Qualitätsstufe und wird nicht als gleichwertiger Scan
bezeichnet.

Mappm unterscheidet:

- `DocumentScan`: papierartiges Dokument; nutzbares Dokument/PDF ist das
  primäre Artefakt, Quellseiten bleiben für Nachweis und Reprocessing erhalten;
- `PhotoOrImageEvidence`: Unfall-, Schaden-, Produkt- oder anderer Bildnachweis;
  das Bild bleibt primäres Artefakt.

Die Zuordnung ist korrigierbar und verliert nie das Original.

## Desktop Import

Desktop unterstützt Dateiauswahl, Drag-and-drop und mehrere Dateien pro
Importsitzung. Unterstützte Formate folgen der Release- und Sicherheits-Policy.
Die App kopiert Eingaben vor weiterer Verarbeitung in kontrollierten Storage
und hängt nicht dauerhaft vom ursprünglichen Dateipfad ab.

## Vault und Offline

- Local-Vault-Capture bleibt lokal autoritativ.
- Cloud-Vault-Capture bleibt pending, bis Mappm Cloud die Speicherung
  bestätigt.
- Core Assist erzeugt für Local Vault weder stille Cloud-Ablage noch Backup.
- Offline-Capture bleibt möglich; Transfer und Assist warten in einer
  persistenten Queue.
- Netzwerk-, Preview-, Modell- oder Providerfehler löschen nie das Original.

## Kontext und Review

Core Assist schlägt Managed Subject, primären Case oder Record, zusätzliche
Beziehungen, Dokumenttyp/-variante, Rolle, Workflow-Slot, lokalisierten Titel
und relevante nächste Schritte vor. Der Titelvorschlag ist verpflichtend und
editierbar.

Die aktuelle Reifestufe verlangt Nutzerbestätigung, bevor primäre Zuordnung
oder materielle Folgen endgültig werden. Nach abgeschlossenem Review besitzt
jedes Dokument einen bestätigten primären Case oder Record. Passt kein
bestehender oder geführter Kontext, wird ein leichter Custom Case mit
automatisch vorgeschlagenem Titel angelegt; ein dauerhafter loser
Dokumentzustand ist kein Abschlussweg.

## Pflichtfehler und Stop Rules

Pläne und Tests decken mindestens lokale Speicherfehler, Offline/Pending,
Upload-Retry, Session/Entitlement/Quota, beschädigte oder nicht unterstützte
Datei, unlesbaren Scan, Dublette, Partial Batch, Processing-Fehler,
Split-/Merge-Unsicherheit sowie erneutes Öffnen und Korrigieren ab.

Stop, wenn Originale verloren gehen, Capture eine Vorabklassifikation
erzwingt, Batch-Nähe als Beziehung gilt, Local Assist als Cloud Backup
erscheint, versteckte Vorschläge bestätigt werden oder Echtdokumente ohne
akzeptierte Security-/Privacy-/Provider-Gates verarbeitet werden.
