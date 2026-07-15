---
title: "Decision - Capture Inbox and Assisted Review Workflow"
description: "Arbeitskorb für Verarbeitung, bestätigungsbereite Assist-Ergebnisse, Unsicherheiten, Fehler und spätere Automatisierung"
tags: [decision, inbox, capture, review, intelligence, processing, correction, progressive-disclosure]
lastUpdated: "2026-07-15"
status: "accepted"
owner: "product-concept"
---

# Decision - Capture Inbox and Assisted Review Workflow

## Status

Angenommen. Eine feste manuelle Draft Inbox oder eine normative Anzahl zuletzt
verarbeiteter Elemente ist ersetzt. Layout und Aufbewahrungsdauer gehören in
den jeweiligen UI-/Phase-Contract.

## Entscheidung

Der Eingang ist Arbeitsfläche für Verarbeitung, Review und Ausnahmen. Er ist
weder zweites Archiv noch Pflichtformular für jede Datei. Er kann darstellen:

- lokal gesicherte, noch nicht übertragene Eingänge;
- laufende asynchrone Verarbeitung;
- bestätigungsbereite Core-Assist-Ergebnisse;
- Qualitäts-, Grenz-, Dubletten- oder Routingunsicherheit;
- wiederholbare und blockierte Fehler;
- kürzlich bestätigte Ergebnisse mit schneller Korrektur oder Undo;
- später automatisch verarbeitete Ergebnisse und Ausnahmen.

Cases, Records und Dokumente gehören dem DMS-Kern, nicht dem Inbox-Eintrag.

## Aktuelle Reifestufe

```text
erfasst
  -> Verarbeitung
  -> Vorschlag bereit
  -> relevante Folgen prüfen
  -> bestätigen oder korrigieren
  -> akzeptiert
```

Review ist nicht feldweise. Standardmäßig sichtbar sind nur vorgeschlagener
Titel, primärer Case oder Record, abweichendes/unsicheres Managed Subject,
materielle Aufgabe/Frist/Termin/Folge sowie relevante Zusatzbeziehungen oder
Warnungen. Bekannte unveränderte Informationen, interne Schlüssel,
Konfidenzmechanik und unkritische Metadaten bleiben in progressiver
Offenlegung erreichbar.

Eine Bestätigung gilt nur für sichtbare Zuordnungen und Folgen. Versteckter
Modelloutput bleibt unbestätigt.

## Kandidaten und Korrektur

- Der bestbelegte Vorschlag erscheint zuerst.
- Bei mittlerer/niedriger Konfidenz bleibt eine kleine Rangliste erreichbar.
- Bei sehr niedriger Case-Konfidenz steht „Neuen Case anlegen“ zuerst;
  „Bestehenden Case auswählen“ bleibt immer verfügbar.
- Titel, primärer Kontext, Managed Subject und sichtbare materielle Folgen sind
  ohne Megaformular korrigierbar.
- Eine Korrektur ändert Links und Facts, nicht das Original und nicht die
  Dokumentidentität.

## Batch und Wiederaufnahme

Gemischte Batches dürfen nach vorgeschlagenem Kontext gruppiert werden. Jede
gemeinsame Bestätigung muss alle betroffenen Dokumente sichtbar oder
inspizierbar machen; Outlier, Unsicherheit und Teilfehler bleiben separat.

Wiederaufnahme behält Dokument, Original, Historie und erfolgreiche
Batch-Ergebnisse. Nur die betroffene Zuordnung oder Folge kehrt ins Review
zurück. Es entsteht kein neuer Upload.

## Spätere Automatisierung

Nach klassenspezifischen Quality Gates darf reversibles internes Routing
automatisch abgeschlossen werden. Der Eingang zeigt dann automatische
Ergebnisse, Ausnahmen, Fehler und Undo. Diese Entscheidung aktiviert keine
Automatik; maßgeblich ist
`DECISION_CAPTURE_FIRST_ASSISTED_ROUTING.md`.

## Privacy, Accessibility und Stop Rules

Zusammenfassungen und Benachrichtigungen vermeiden sensible Details;
Kandidaten sind vor Anzeige berechtigungsgefiltert. Zustände sind für
Screenreader verständlich, Bewegung folgt Reduced Motion und jede Geste besitzt
eine sichtbare sowie tastatur-/screenreaderfähige Alternative.

Stop, wenn Review zum langen Pflichtformular wird, Nutzerinnen während der
Verarbeitung warten müssen, unsichtbare Daten bestätigt werden, ein
Fehler/Reopen Duplikate erzeugt, der Eingang zum Archiv wird oder ein
akzeptiertes Dokument ohne primären Case/Record verbleibt.
