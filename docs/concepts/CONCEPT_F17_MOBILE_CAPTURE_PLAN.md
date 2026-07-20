---
title: "Konzept F17 - Mobile Capture Client Standards"
description: "Querschnittliche Regeln fuer globales Mobile Capture, Scannerqualitaet, Offline-Queue, asynchrone Verarbeitung und minimale Vorabinteraktion"
tags: [concept, mobile, capture, commercial-core, offline, processing, intelligence, accessibility]
lastUpdated: "2026-07-20"
version: "4.0"
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
Haushaltsdokumente. Der Nutzer muss vor dem Scan weder Profil, Case, Record,
Dokumenttyp, Rolle noch Workflow kennen.

```text
global erfassen
  -> Dokument scannen, Foto aufnehmen, Galerie/Bild oder Datei importieren
  -> ein logisches Dokument mit einer oder mehreren Seiten abschliessen
  -> Original dauerhaft sichern
  -> App darf verlassen werden
  -> OCR, Extraktion, Indexierung und Matching
  -> AI-Matching kompakt pruefen
  -> bestaetigen oder schnell korrigieren
```

Automatische Analyse und Matching laufen immer. Sie sind kein Modus-Schalter.
`Neuen Vorgang starten` ist die einzige primaere optionale Vorab-Absicht. Eine
bestehende Case-Auswahl ist hoechstens ein sekundaerer Shortcut. Capture aus
einem bereits geoeffneten Case bleibt als bewusster seltener Pfad moeglich.

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
- sichtbarer Fallback, falls native Scannerfaehigkeit fehlt.

Die konkrete Scannertechnologie benoetigt den freigegebenen Qualitaets-Spike.
Ein schwacher Fallback darf keine gleichwertige Qualitaet behaupten.

## Dokumentgrenzen und Sessions

- Eine abgeschlossene Scan-Einheit ist genau ein logisches Dokument.
- Dieses Dokument darf mehrere Seiten besitzen.
- Danach kann der Nutzer ein naechstes Dokument in derselben technischen
  Session erfassen.
- Mehrere Dateien/Scans werden pro Dokument verarbeitet und duerfen zu
  verschiedenen Cases/Records gehoeren.
- Compound Imports koennen nach Review gesplittet oder zusammengefuehrt werden.

Die Dokumentgrenze ist beim Kamera-Scan explizit. Mappm darf auf eine
wahrscheinlich fremde Seite hinweisen und eine Korrektur anbieten, soll aber
nicht das absichtliche Vermischen eines Papierstapels zum Normalfall machen.

Die Session ist weder Dokument noch Case. Pro Dokument werden Original,
Seitenreihenfolge, Fortschritt, Ergebnis, Fehler und Retry separat erhalten.
Ein Teilfehler verliert keine erfolgreichen Dokumente. Retry erzeugt keine
Duplikate.

## New-Case-Intent

`Neuen Vorgang starten`:

- speichert die bewusste Absicht durable.
- oeffnet vor dem Scan kein leeres Titel-/Metadatenformular.
- deaktiviert weder Duplicate-, Record- noch bestehendes Case-Matching.
- zwingt weitere Dokumente derselben Session nicht in diesen Case.
- verlangt von Backend/Core Assist einen editierbaren Case-Titel sowie
  Vorschlaege fuer Managed Subject, Workflow und relevante Aktionen.

Bei verzoegerter Verarbeitung darf intern ein Placeholder existieren. Der
Nutzer muss ihn vor der Analyse nicht benennen.

## Offline- und Vault-Verhalten

Capture bleibt bei fehlendem Netzwerk oder Assist moeglich. Persistiert werden:

- Originalseiten/-artefakte und Dokumentgrenzen.
- Capture-/New-Case-Intent.
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

## Assist-Ausgabe und Review

Backend/Core Assist liefert pro Dokument:

- Dokumenttitel und bei neuem Case einen Case-Titel.
- Grundart, semantische Variante und relevante Fakten.
- Managed Subject und External Party.
- primaeren und weitere Case-/Record-/Claim-Kandidaten.
- Workflow-, Rollen-, Aufgaben- und Fristvorschlaege.
- Qualitaets-, Grenz- und Outlier-Hinweise.
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
- Outlier, Split/Merge, Teilfehler und Idempotenz.
- New-Case-Intent mit automatischem Titelvorschlag und weiterem Matching.
- App-Neustart, Offline und Retry in jeder Stufe.
- niedrige Confidence, manuelle Auswahl und schnelle Korrektur.
- aktuelle Bestaetigung versus spaetere Automation mit Provenance.
- Semantics, Textscale und privacy-sichere Notifications.

## Stop Rules

Stop, wenn:

- globaler Scan vorab Kontext-/Metadatenfelder verlangt.
- Matching als normale Option deaktivierbar ist.
- Voraboptionen ueber den minimalen akzeptierten Intent hinausgehen.
- New-Case-Intent manuelle Titeleingabe verlangt.
- Verarbeitung die geoeffnete App voraussetzt.
- eine Session als ein Dokument oder Case behandelt wird.
- Outlier still zugeordnet werden.
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
