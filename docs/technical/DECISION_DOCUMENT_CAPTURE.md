---
title: "Decision - Document Capture"
description: "Verbindliche Erfassung für Mobile Scan und Desktop Import mit dauerhaftem Eingang, asynchronem Assist und bestätigtem Routing"
tags: [decision, document-capture, mobile-capture, desktop, intelligence, review, batch, commercial-core]
lastUpdated: "2026-07-25"
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

Der Commercial Core besitzt eine gemeinsame Capture-Pipeline mit
plattformgerechten Eingangsarten:

1. Mobile:
   - Dokumentenscan ueber eine gepruefte native Scanner-Komponente;
   - Fotoaufnahme als Bildnachweis;
   - Bildauswahl aus der Galerie;
   - PDF-/Dateiimport ueber Systempicker beziehungsweise Share-Sheet.
2. Desktop:
   - einzelne oder mehrere Dateien ueber Systempicker;
   - Drag-and-drop;
   - PDF- und Bilddateien, auch wenn sie zuvor durch einen externen Scanner
     oder ein Smartphone erzeugt wurden.

Beide sichern zuerst Original und Manifest dauerhaft und verwenden danach
denselben asynchronen Verarbeitungs- und Review-Pfad:

```text
Scan oder Import
  -> Original und Artefaktmanifest dauerhaft sichern
  -> Qualität, Sicherheit und Dublette prüfen
  -> je Vault lokal bereitstellen oder bestätigt hochladen
  -> Preview, OCR, grobe Klassifikation, einfache Kandidaten und Indexierung
  -> Titel- und grobe Case-/Record-Vorschläge erzeugen
  -> relevante Folgen bestätigen oder korrigieren
  -> akzeptiertes Dokument mit primärem Case oder Record
```

Die Nutzerin darf die App nach der dauerhaften Sicherung verlassen. Status,
Ergebnis und Fehler überstehen Neustarts.
Die sichtbare Warte-, Animation-, Background- und Review-Erfahrung besitzt
`../concepts/CONCEPT_F38_ASYNC_PROCESSING_WAIT_EXPERIENCE.md`.

## Capture-first

Globales Capture ist der alltägliche Hauptweg. Es beginnt in einem sichtbaren,
gegebenenfalls vorausgewaehlten Managed-Subject-Kontext. Vor dem Scan sind
weder ein allgemeines Profilformular noch Case, Dokumentrolle oder
Metadatenformular erforderlich. Matching und Vorschläge laufen immer, sobald
die notwendige Verarbeitung verfügbar ist.

Waehrend der Erfassung darf die Nutzerin optional bereits bekannte Angaben
mitgeben: Dokumentgrundart und sinnvoller Subtyp, bestaetigte Facts wie
`bezahlt` oder gewuenschte Steuerpruefung, Korrektur des Managed Subject,
grober fachlicher Kontext, neuer Case oder bestehender Case. Keine dieser
Angaben ausser dem sichtbaren Subject-Kontext ist Pflicht,
ersetzt Analyse oder Matching oder wird zu einem grossen Taxonomie- und
Metadatenformular. Userwerte behalten Provenienz und werden von Core Assist
nicht still ueberschrieben.

Eine ausdrueckliche neue-Case-Absicht erspart kein Matching: Core Assist
schlaegt weiterhin einen konservativen Titel, grobe Metadaten und
Case-/Record-Kandidaten vor. Optionale zusaetzliche Beziehungen bleiben
best-effort, backend-geprueft und nutzerbestaetigt. Ein leerer Titel- oder
Konfigurationsdialog ist unzulaessig.

Capture innerhalb eines bestehenden Case oder Record bleibt als sekundärer,
bewusster Weg verfügbar. Es ist kein Standardverhalten für den zufälligen
Dokumenteingang. Konkrete Controls, Gesten und Layouts werden erst im
UI-Implementation-Contract festgelegt.

Ein Case-scoped Upload wird sofort mit bestaetigter Nutzerprovenienz im
gewaehlten Case als `processing` sichtbar. Die Analyse laeuft dennoch weiter,
darf zusaetzliche Beziehungen vorschlagen und ordnet das Dokument nie still um.
Eine bewusste Case-Zuordnung wird nicht semantisch als falsch markiert.

## Dokumentgrenzen und Batch

- Eine abgeschlossene mobile Scan-Einheit ist genau ein logisches Dokument.
- Ein Dokument darf mehrere Seiten besitzen; danach wird ausdrücklich das
  nächste Dokument begonnen.
- Mehrere Dokumente dürfen in einer Sitzung nacheinander erfasst oder am
  Desktop gemeinsam ausgewählt werden.
- Sitzungsnähe beweist keine fachliche Zusammengehörigkeit.
- Ein PDF mit Rechnung und Zahlungsnachweis desselben Sachverhalts darf nur
  nach Backend-/Data-Freigabe fuer den Zielrelease als ein Dokument mit
  mehreren Rollen/Facts angenommen werden.
- Eine Datei mit unabhaengigen Dokumenten wird im aktuellen Zielrelease nicht
  automatisch gesplittet. Sie bleibt ein logisches, gegebenenfalls generisch
  behandeltes Dokument und wird deswegen weder abgelehnt noch `invalid`.
- Originale bleiben erhalten; Sortierung und Neuzuordnung sind reversibel und
  idempotent.
- Ein Teilfehler verwirft keine erfolgreichen Dokumente.

## Mobile Qualität

Der mobile Dokumentenscan bereitet Auto-Capture, Rand-/Perspektivkorrektur,
Rotation, lesbare Optimierung, Mehrseitigkeit, Vorschau, Wiederholung,
Entfernen und Sortieren vor. Ein normaler Kamera-/Datei-Fallback bleibt
sichtbar als niedrigere Qualitätsstufe und wird nicht als gleichwertiger Scan
bezeichnet.

Diese Seitenbearbeitung erfolgt lokal innerhalb der Scan-Einheit vor
`Dokument abschliessen` und vor der Queue-/Upload-Uebergabe. Erst der
ausdrueckliche Abschluss autorisiert die weitere dauerhafte Verarbeitung. Nach
dieser Grenze bleiben Metadaten korrigierbar; eine Aenderung der eigentlichen
Seiten ist in M1 kein normaler Review-Schritt, sondern waere ein eigener
Revisions-/Neuimportvertrag mit Originalerhalt.

Mappm baut keine eigene Kamera-/OpenCV-Scan-Engine. Die Mappm-App besitzt
Capture-Sitzung, Dokumentgrenzen, Vault-/Queue-Übergabe und Review, ruft fuer
die eigentliche Dokumentaufnahme aber eine gepruefte native Scanner-Komponente
hinter einem austauschbaren Port auf. Die vorlaeufige Technologierichtung steht
in `DECISION_MOBILE_SCANNER_TECHNOLOGY.md`.

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

Ein Foto wird am Desktop als Bilddatei importiert. Eine vorhandene externe
Scanner-Anwendung darf PDF-/Bilddateien erzeugen, die Mappm anschliessend
importiert. **Mappm bietet keinen Dokumentenscan ueber eine Desktop-Webcam an.**
Dieser Weg ist wegen ungeeigneter Ergonomie und unzuverlaessiger
Dokumentqualitaet ausdruecklich ausgeschlossen und darf weder als Fallback noch
als versteckte Plattformoption implementiert werden.

Eine optionale Verbindung zur Mappm-Mobile-App sowie Apples Continuity Camera
sind noch keine akzeptierten Core-Pfade. Ihr konzeptioneller Stand und ihre
unterschiedlichen Local-/Cloud-Vault-Grenzen stehen als Draft in
`DECISION_CROSS_DEVICE_CAPTURE_HANDOFF.md`. Der normale Desktop-Import bleibt
davon unabhaengig und setzt kein Smartphone voraus.

## Vault und Offline

- Local-Vault-Capture bleibt lokal autoritativ.
- Cloud-Vault-Capture bleibt pending, bis Mappm Cloud die Speicherung
  bestätigt.
- Core Assist erzeugt für Local Vault weder stille Cloud-Ablage noch Backup.
- Offline-Capture bleibt möglich; Transfer und Assist warten in einer
  persistenten Queue.
- Netzwerk-, Preview-, Modell- oder Providerfehler löschen nie das Original.

## Kontext und Review

Core Assist schlägt einen primären Case oder Record, grobe Dokumentart/Domain,
einfache Metadatenkandidaten und einen lokalisierten konservativen Titel vor.
Optionale zusätzliche Beziehungen duerfen nach Feasibility-Nachweis
vorgeschlagen werden. Managed Subject bleibt Nutzerkontext; Empfaenger,
Workflow-Slot, fachliche Datumsrolle und nächste Schritte sind keine
verlaesslichen freien Modelloutputs. Der Titelvorschlag ist verpflichtend,
editierbar und enthaelt standardmaessig kein Datum.

Die aktuelle Reifestufe verlangt Nutzerbestätigung, bevor primäre Zuordnung
oder materielle Ausgangs-Facts endgültig werden. Harmlose, interne und
reversible Aufgaben/Erwartungen aus bereits bestaetigten Facts benoetigen
keine zweite Bestaetigung. Nach abgeschlossenem Review besitzt jedes Dokument
einen bestätigten primären Case oder Record. Passt kein
bestehender oder geführter Kontext, wird ein leichter Custom Case mit
automatisch vorgeschlagenem Titel angelegt; ein dauerhafter loser
Dokumentzustand ist kein Abschlussweg.

## Pflichtfehler und Stop Rules

Pläne und Tests decken mindestens lokale Speicherfehler, Offline/Pending,
Upload-Retry, Session/Entitlement/Quota, beschädigte oder nicht unterstützte
Datei, unlesbaren Scan, Dublette, Partial Batch, Processing-Fehler,
optional freigegebenes Same-Context-Mehrrollen-PDF, gemischte Ein-Datei-Inhalte
ohne Invalidierung/Ablehnung sowie erneutes Öffnen und Korrigieren ab.

Stop, wenn Originale verloren gehen, Capture eine Vorabklassifikation
erzwingt, optionale bekannte Angaben die automatische Analyse abschalten oder
Userwerte still ueberschrieben werden, Batch-Nähe als Beziehung gilt, Local
Assist als Cloud Backup erscheint, versteckte Vorschläge bestätigt werden oder Echtdokumente ohne
akzeptierte Security-/Privacy-/Provider-Gates verarbeitet werden. Stop auch,
wenn ein Dokumentenscan ueber eine Desktop-Webcam angeboten oder eine
Draft-Cross-Device-Variante ohne eigene Freigabe als Core-Pfad implementiert
wird. Stop ebenfalls, wenn unabhaengige Dokumente im aktuellen Zielrelease
automatisch auf Dokumente oder Cases aufgeteilt werden.
