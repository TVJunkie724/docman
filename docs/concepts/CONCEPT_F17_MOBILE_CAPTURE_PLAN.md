---
title: "Konzept F17 - Mobile Capture Client Standards"
description: "Querschnittliche Regeln fuer globales Mobile Capture, Scannerqualitaet, Offline-Queue, asynchrone Verarbeitung und optionale bekannte Angaben ohne Pflichtformular"
tags: [concept, mobile, capture, commercial-core, offline, processing, intelligence, accessibility]
lastUpdated: "2026-07-25"
version: "4.3"
status: "accepted"
owner: "ui-concept"
---

# Konzept F17 - Mobile Capture Client Standards

## Status und Quellen

Akzeptiert. F17 definiert das mobile Clientverhalten, nicht konkrete Screens,
Widgets oder Provider. Produkt- und Domainquellen sind:

- `docs/pillars/PILLAR_CAPTURE_INBOX.md`;
- `docs/technical/DECISION_DOCUMENT_CAPTURE.md`;
- `docs/technical/DECISION_CAPTURE_FIRST_ASSISTED_ROUTING.md`;
- `docs/technical/DECISION_MOBILE_CAPTURE_CONTEXT_SELECTION.md`;
- `docs/technical/DECISION_MOBILE_OFFLINE_CAPTURE.md`.

## Produktprinzip

Mobile ist der schnellste Alltagseingang fuer willkuerlich ankommende
Haushaltsdokumente. Der Nutzer muss vor dem Scan weder Case, Record,
Dokumenttyp, Rolle noch Workflow kennen. Der betroffene Managed Subject bleibt
jedoch sichtbar: bei einem eindeutigen Profil vorausgewaehlt, bei mehreren
Profilen kompakt gewaehlt/bestaetigt oder aus Profil/Case geerbt.

```text
global erfassen
  -> Dokument scannen, Foto aufnehmen, Galerie/Bild oder Datei importieren
  -> Seiten lokal pruefen, zuschneiden, drehen, sortieren, entfernen/ergaenzen
  -> ein logisches Dokument mit einer oder mehreren Seiten abschliessen
  -> erst danach Queue/Upload fuer Analyse starten
  -> Original dauerhaft sichern
  -> App darf verlassen werden
  -> OCR, Extraktion, Indexierung und Matching
  -> AI-Matching kompakt pruefen
  -> bestaetigen oder schnell korrigieren
```

Automatische Analyse und Matching laufen immer. Sie sind kein Modus-Schalter.
Optional bekannte Typ-/Subtyp-/Fact-/Subject-/Case-Angaben duerfen waehrend der
Erfassung mitgegeben werden, bleiben aber progressiv offengelegt und niemals
Pflicht. Capture aus einem bereits geoeffneten Case bleibt als bewusster
seltener Pfad moeglich.

Mobile Capture umfasst konzeptionell:

- nativen Dokumentenscan innerhalb der Mappm-Capture-Sitzung;
- normale Fotoaufnahme fuer Bildnachweise;
- Bildimport aus der Galerie;
- PDF-/Dateiimport ueber Systempicker beziehungsweise Share-Sheet.

Diese Eingaenge verwenden dieselbe Durability-, Queue-, Assist- und
Review-Pipeline. Foto-/Dateiimport darf nicht als gleichwertige
Scannerqualitaet bezeichnet werden.

## Scannerqualitaet

Der Releasepfad bietet Dokument- statt normaler Kameraqualitaet:

- Seiten-/Dokumenterkennung und verlaessliches Auto-Capture, wo unterstuetzt.
- Kanten- und Perspektivkorrektur mit manueller Korrektur.
- Rotation und lesbare Dokumentoptimierung.
- mehrere Seiten je Dokument.
- Preview, Wiederholen, Entfernen und Umordnen.
- fruehe Hinweise bei Unschaerfe, Reflexion, abgeschnittenen Seiten und
  wahrscheinlichen Duplikaten.
- Jeder Qualitaetshinweis bietet Neuaufnahme/Korrektur und bewusstes
  Fortfahren; er ist keine semantische Dokumentpruefung.
- sichtbarer Fallback, falls native Scannerfaehigkeit fehlt.

Die normale Seitenbearbeitung gehoert in die lokale Scan-Session vor den
Upload. Erst `Dokument abschliessen` autorisiert die dauerhafte
Queue-/Upload-Uebergabe. Nach dieser Grenze bleibt das archivierte
Dokumentartefakt in M1 inhaltlich stabil; Metadaten bleiben korrigierbar. Eine
spaetere Seitenmutation waere ein ausdruecklicher Revisions-/Neuimportvorgang
mit Originalerhalt und ist kein normaler M1-Review-Schritt.

Die konkrete Scannertechnologie benoetigt den freigegebenen Qualitaets-Spike.
Ein schwacher Fallback darf keine gleichwertige Qualitaet behaupten.

## Dokumentgrenzen und Sessions

- Eine abgeschlossene Scan-Einheit ist genau ein logisches Dokument.
- Dieses Dokument darf mehrere Seiten besitzen.
- Danach kann der Nutzer ein naechstes Dokument in derselben technischen
  Session erfassen.
- Mehrere Dateien/Scans werden pro Dokument verarbeitet und duerfen zu
  verschiedenen Cases/Records gehoeren.
- Ein importiertes PDF mit Rechnung und Zahlungsnachweis desselben
  Sachverhalts darf nur nach Backend-/Data-Freigabe fuer den Zielrelease als
  ein Dokument mit mehreren Rollen/Facts gelten.
- Ein Import mit mehreren unabhaengigen Dokumenten wird im aktuellen
  Zielrelease nicht automatisch gesplittet. Er bleibt ein logisches,
  gegebenenfalls generisch behandeltes Dokument und wird deswegen weder
  abgelehnt noch `invalid`.

Die Dokumentgrenze ist beim Kamera-Scan explizit und nutzerautorisiert. Mappm
darf auf technische Scanqualitaet hinweisen. Eine spaetere unverbindliche
inhaltliche Kohaerenzwarnung braucht einen eigenen Feasibility-Nachweis.

Die Session ist weder Dokument noch Case. Pro Dokument werden Original,
Seitenreihenfolge, Fortschritt, Ergebnis, Fehler und Retry separat erhalten.
Ein Teilfehler verliert keine erfolgreichen Dokumente. Retry erzeugt keine
Duplikate.

## Optionale bekannte Angaben

Erlaubte Datenachsen sind Dokumentgrundart und sinnvoller Subtyp, bestaetigte
Facts wie `bezahlt` oder Steuerpruefung, Korrektur des sichtbaren Managed
Subject, grober fachlicher Kontext, neuer Case und bestehender Case. Sie werden
nur angeboten, wenn sie im aktuellen Kontext nuetzlich sind; exakte Controls
und Sichtbarkeit gehoeren in den spaeteren UI-Contract.

`Neuen Vorgang starten`:

- speichert die bewusste Absicht durable.
- oeffnet vor dem Scan kein leeres Titel-/Metadatenformular.
- deaktiviert weder Duplicate-, Record- noch bestehendes Case-Matching.
- zwingt weitere Dokumente derselben Session nicht in diesen Case.
- verlangt von Backend/Core Assist einen editierbaren Case-Titel sowie
  Vorschlaege fuer Managed Subject, Workflow und relevante Aktionen.

Bei verzoegerter Verarbeitung darf intern ein Placeholder existieren. Der
Nutzer muss ihn vor der Analyse nicht benennen.

Ein bestehender Case oder andere Userangaben sind ebenfalls starke
provenienztragende Signale. Sie deaktivieren keine grobe Klassifikation,
Dubletten- oder zusaetzliche best-effort Beziehungspruefung und werden von
Assist weder still ueberschrieben noch als Wrong-Case markiert.

Case-scoped Capture verknuepft Dokument, Subject und gegebenenfalls erwartete
Rolle sofort mit Nutzerprovenienz. Das Dokument erscheint dort als
`processing`; spaeteres grobes Matching darf weitere Kontexte vorschlagen,
haelt die Nutzerin aber nicht auf, meldet keinen semantischen Widerspruch und
verschiebt das Dokument nie still.

## Offline- und Vault-Verhalten

Capture bleibt bei fehlendem Netzwerk oder Assist moeglich. Persistiert werden:

- Originalseiten/-artefakte und Dokumentgrenzen.
- optionale Userangaben und Capture-/Case-Intent mit Provenienz.
- Queue-, Checkpoint-, Retry- und letzter vertrauenswuerdiger Status.
- User-Loesch-/Abbruchabsicht gemaess Lifecycle-Policy.

Ein Local Vault bleibt lokal autoritativ. Cloud-Vault-Arbeit bleibt pending,
bis Mappm Cloud sie bestaetigt. Core Assist ist von Vault-Autoritaet getrennt
und aktiviert fuer Local Vault weder Backup noch dauerhafte Cloud-Speicherung.

## Asynchrone Verarbeitung

OCR, Extraktion, Indexierung und Matching koennen Sekunden bis Minuten dauern.
Der Client:

- bestaetigt die dauerhafte Annahme schnell.
- erlaubt Navigation und App-Schliessen.
- stellt Status nach Neustart wieder her.
- benoetigt keinen blockierenden Fullscreen-Spinner.
- unterscheidet Verbindung, Transfer, Verarbeitung, Review und Fehler.
- bietet Retry, Rescan oder manuellen Fallback ohne Verlust des Originals.

Ein bis zwei Minuten muessen in der UX selbstverstaendlich funktionieren;
konkrete SLOs folgen produktionsnahen Benchmarks.
Die sichtbare Warte-, Animation-, Background- und Review-Queue-Erfahrung folgt
`CONCEPT_F38_ASYNC_PROCESSING_WAIT_EXPERIENCE.md`.

## Assist-Ausgabe und Review

Backend/Core Assist liefert pro Dokument:

- Dokumenttitel und bei neuem Case einen Case-Titel.
- Grundart, semantische Variante und relevante Fakten.
- Managed Subject und External Party.
- primaeren und weitere Case-/Record-Kandidaten; kein Claim-Matching.
- aus Useraktionen/bestaetigten Facts/Regeln abgeleitete Workflow-, Aufgaben-
  und Fristfolgen; keine freie Modellentscheidung.
- technische Qualitaets- und Grenzhinweise; keine M1-
  Dokumentkohaerenz-/Outlier-Erkennung.
- Confidence und Provenance in einer fuer Korrektur nutzbaren Form.

Aktuell bestaetigt der Nutzer Case-/Record-Zuordnung und andere sichtbare
materielle Folgen. Die Standardreview zeigt nur entscheidungsrelevante Punkte;
implizite unveraenderte Fakten bleiben im Detail. Bei geringer Confidence
werden weiterhin die besten Ergebnisse gezeigt; bei sehr geringer Evidenz steht
der neue leichte Custom Case zuerst und eine manuelle Case-Auswahl bleibt
erreichbar.

Eine spaetere Automation wird nur pro nachweislich reifer Klasse freigegeben,
bleibt nachvollziehbar und reversibel. Exakte Geste und Komposition bleiben der
UI-Konzeption vorbehalten; jede Geste braucht eine sichtbare und zugaengliche
Alternative.

## Zustands- und Fehlerabdeckung

Mindestens erforderlich sind:

```text
lokal erfasst
wartet auf Verbindung
wird uebertragen
wird verarbeitet
Vorschlag bereit
Pruefung erforderlich
Qualitaets-/Grenzpruefung
wiederholbarer Fehler
manueller Fallback erforderlich
bestaetigt
```

Fehler umfassen lokalen Speicher, Berechtigung, Scanner-Fallback, ungueltige
Seite/Datei, Session/Auth, Quota, Upload-Ablauf, Checksum, Provider-Timeout,
Teilfehler, stale Proposal und ungueltigen Intent.

## Privacy, Accessibility und Localization

- Keine Dokumenttexte, sensiblen Titel, OCR-/Modellinhalte, Tokens oder
  Kandidatenlabels in Logs/Telemetry.
- Notifications bleiben generisch, sofern keine ausdrueckliche Freigabe gilt.
- Status, Confidence und Fehler werden nicht nur farblich kommuniziert.
- Semantics unterscheiden Seite, Dokument, Session und Processing Job.
- Lange lokalisierte Titel und Textscale verdecken keine Capture-/Review-Aktion.
- Reduced Motion besitzt statische gleichwertige Rueckmeldung.
- Fokus kehrt nach Korrektur zum betroffenen Dokument zurueck.

## Tests und Verifikation

- Scannererfolg, Fallback und Permission Denial.
- schlechter Scan, Korrektur und Rescan.
- Mehrseitenreihenfolge und expliziter Dokumentabschluss.
- mehrere zusammenhaengende und nicht zusammenhaengende Dokumente.
- gemischte Ein-Datei-Inhalte ohne Ablehnung/Invalidierung/Auto-Split,
  technische Teilfehler und Idempotenz.
- optional freigegebener Same-Context-Import mit Rechnung und Zahlungsnachweis.
- New-Case-Intent mit automatischem Titelvorschlag und weiterem Matching.
- optionale Typ-/Subtyp-/Fact-/Subject-/Case-Angaben sowie Konflikt mit Assist.
- App-Neustart, Offline und Retry in jeder Stufe.
- niedrige Confidence, manuelle Auswahl und schnelle Korrektur.
- aktuelle Bestaetigung versus spaetere Automation mit Provenance.
- Semantics, Textscale und privacy-sichere Notifications.

## Stop Rules

Stop, wenn:

- globaler Scan vorab ein allgemeines Profil-/Kontext-/Metadatenformular
  verlangt statt eines kompakten sichtbaren Managed-Subject-Kontexts.
- Matching als normale Option deaktivierbar ist.
- optionale Angaben zum Pflichtablauf, grossen Taxonomie-/Metadatenformular
  oder Ersatz fuer Assist werden.
- bestaetigte Userangaben still ueberschrieben werden.
- New-Case-Intent manuelle Titeleingabe verlangt.
- Verarbeitung die geoeffnete App voraussetzt.
- eine Session als ein Dokument oder Case behandelt wird.
- der aktuelle Zielrelease unabhaengige Dokumente in einer Importdatei
  automatisch auf Dokumente oder Cases aufteilt.
- Userzuordnungen semantisch als Outlier oder Wrong-Case markiert werden.
- Offline/Restart Original, Intent oder bestaetigte Werte verliert.
- konkrete Layouts/Gesten ohne UI-Phase festgelegt werden.
- ein Cross-Device-Capture-Draft ohne seine eigene Trust-/Contract-Freigabe
  als Mobile-Core vorausgesetzt wird.

## Handoff

Mobile UI geht an `ui-architect`; Jobs/Vertraege an `contract-api`;
Persistenz/Queue an `data-architect`; Nachweise an `quality-readiness`.

## Enterprise Quality Contract

Dieses Konzept uebernimmt
`docs/execution/CONCEPT_ENTERPRISE_QUALITY_CONTRACT.md`. Bei Widerspruechen gilt
die strengere Regel und die betroffene Phase stoppt.
