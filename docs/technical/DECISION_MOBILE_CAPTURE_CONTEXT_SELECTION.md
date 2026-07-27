---
title: "Decision - Mobile Capture Context Intent"
description: "Entscheidung fuer sofort nutzbares mobiles Capture mit immer aktivem Matching und wenigen optionalen bekannten Angaben ohne Pflichtformular"
tags: [decision, mobile-capture, context, cases, intelligence, review, progressive-disclosure]
lastUpdated: "2026-07-24"
status: "accepted-rebaseline"
owner: "product-concept"
---

# Decision - Mobile Capture Context Intent

## Status

Am 24. Juli 2026 auf den akzeptierten Capture-Vertrag rebaselined. Eine
verpflichtende Vorabsequenz fuer Case, Notiz oder Metadaten bleibt ersetzt.
Jede Erfassung besitzt jedoch einen sichtbaren, gegebenenfalls
vorausgewaehlten Managed-Subject-Kontext. Die Nutzerin darf ausserdem wenige
bereits bekannte Informationen optional mitgeben; diese Moeglichkeit ist
nicht auf neue-Case-Absicht begrenzt.

## Entscheidung

Automatische Dokumentanalyse und Case-/Record-Matching laufen fuer jede
unterstuetzte Erfassung. Sie sind kein waehbarer Modus und koennen durch
Userangaben nicht abgeschaltet werden.

Globales Mobile Capture bleibt ohne allgemeines Profilformular, Case-Suche,
Rolle, Notiz oder Metadatenformular sofort nutzbar. Der aktuelle Managed
Subject ist kompakt sichtbar:

- Bei nur einem relevanten Profil darf es sichtbar vorausgewaehlt sein.
- Bei mehreren verwalteten Personen oder Organisationen waehlt oder
  bestaetigt die Nutzerin den Kontext zu Beginn oder startet Capture aus dem
  betroffenen Profil.
- Case-/Record-scoped Capture erbt den bestaetigten Subject-Kontext und fragt
  ihn nicht erneut ab, bis die Nutzerin ihn bewusst aendert.

Waehrend der Erfassung und vor dem Verlassen darf die Nutzerin optional nur
weitere Informationen mitgeben, die sie bereits kennt:

- Dokumentgrundart und sinnvoller semantischer Subtyp;
- bestaetigte Facts wie `bezahlt` oder gewuenschte Steuerpruefung;
- Korrektur des sichtbaren Managed Subject beziehungsweise der verwalteten
  Organisation;
- grober fachlicher Kontext oder Routingvariante;
- Absicht, einen neuen Vorgang zu starten;
- bewusste Zuordnung zu einem bestehenden Vorgang.

Diese Achsen sind weder ein verpflichtender Ablauf noch die Vorgabe, alle
gleichzeitig als sichtbare Controls zu zeigen. Progressive Disclosure zeigt
nur kontextuell relevante Angaben. Exakte Bezeichnung, Anordnung und Controls
bleiben einer spaeteren UI-/Usability-Entscheidung vorbehalten.

Userangaben tragen User-Provenienz. Backend/Core Assist darf fehlende grobe
Werte vorschlagen, aber Userangaben nicht semantisch pruefen oder still
ueberschreiben. Es darf weiterhin:

- grobe zusaetzliche Case-/Record-Kandidaten ranken;
- technische Dubletten ueber Hash beziehungsweise andere freigegebene stabile
  Signale pruefen;
- einen langlebigen Record als bestaetigungspflichtigen Primaerkandidaten
  anbieten.

## Normaler Ablauf

```text
globales Capture oeffnen
  -> erfassen
  -> dauerhaft sichern und verarbeiten
  -> automatischen Vorschlag erhalten
  -> bestaetigen oder korrigieren
```

Kein allgemeines Kontextformular wird vor den Scan gesetzt. Der kompakte
Subject-Kontext ist dennoch vor beziehungsweise bei der Erfassung erkennbar
und korrigierbar. Nach dauerhafter Erfassung darf die Nutzerin die App sofort
verlassen; Verarbeitung und Vorschlaege laufen asynchron.

## Neue-Case-Absicht

```text
Neuen Vorgang starten waehlen
  -> ein oder mehrere logische Dokumente erfassen
  -> Case-Absicht dauerhaft vormerken
  -> Backend/Core Assist schlaegt konservativen Titel ohne Standarddatum,
     grobe Metadaten und Case-/Record-Kandidaten vor
  -> optionale zusaetzliche Treffer vorbereiten
  -> sichtbares Ergebnis bestaetigen oder korrigieren
```

Ein generierter editierbarer Titel ist verpflichtender Assist-Output. Intern
darf waehrend der Verarbeitung ein Platzhalter existieren; die Nutzerin muss
vor dem Dokumentverstaendnis keinen Titel erfinden. Die neue-Case-Absicht ist
ein starkes User-Signal, verhindert aber weder Dubletten- noch zusaetzliches
bestehendes Case-/Record-Matching.

## Bestehender Case

Ein bestehender Case darf vor Abschluss der globalen Erfassung bewusst
mitgegeben werden, ist aber niemals erforderlich. Automatische Analyse prueft
trotzdem grobe Dokumentart/Domain, einfache Kandidaten, Dubletten und
zusaetzliche Case-/Record-Kandidaten. Eine bewusste Zuordnung wird nicht als
Wrong-Case oder Outlier markiert.
Die spaetere UI entscheidet anhand von Platz und Usability-Evidenz, wann diese
Option direkt oder erst ueber progressive Disclosure sichtbar ist.

Capture aus einem bereits geoeffneten Case ist ein eigener bewusster Pfad und
darf diesen expliziten Case-Kontext ohne weiteren Selector uebernehmen.

## Managed Subject und Notizen

Das sichtbare Managed Subject ist der von der Nutzerin gewaehlte
Verwaltungs-/Relevanzkontext und wird nicht aus Empfaenger- oder Namensdaten
semantisch geprueft. Extrahierte Empfaenger duerfen leer bleiben oder als
optionale Metadaten erscheinen, ersetzen das Subject aber nie. Besitzt der
bestaetigte Case bereits ein eindeutiges Managed Subject, wiederholt der Review
diese implizite Information nicht.

Eine freie Notiz darf nach Capture oder in Details verfuegbar sein, ist aber
kein verpflichtender Teil vor dem Scan.

## Offline-Verhalten

Globales Capture und alle mitgegebenen bekannten Angaben funktionieren offline.
Original und Userangaben werden dauerhaft mit Provenienz gespeichert. Assist-
Verarbeitung und Ergebnisreview warten auf den freigegebenen Verarbeitungspfad.
Fehlende gecachte Cases oder Profile blockieren die Erfassung nie; eine
gewuenschte Zuordnung kann bis zur Synchronisierung pending bleiben.

## UI-Grenze

Diese Decision waehlt weder genaue Control-Platzierung und Texte noch Tap-/
Swipe-Bestaetigung oder Ergebnislayout. Sie definiert nur die erlaubten
optionalen Datenachsen, Progressive Disclosure und die Pflicht, Capture ohne
Vorabformular sofort nutzbar zu halten.

## Stop Rules

Stop, wenn:

- `Automatisch vorschlagen` als abschaltbarer Modus erscheint;
- globales Capture ein allgemeines Profilformular, bestehenden/neuen Case,
  Typ, Subtyp, Fact, Notiz oder anderen Metadatenkontext vor dem Scan verlangt;
- der aktuelle Managed-Subject-Kontext vor beziehungsweise bei der Erfassung
  unsichtbar oder bei mehreren moeglichen Subjects nicht korrigierbar ist;
- optionale Angaben zu einem grossen Taxonomie-/Metadatenformular werden;
- Userangaben Analyse oder Matching abschalten oder still ueberschrieben werden;
- `Neuen Vorgang starten` ein verpflichtendes leeres Titelformular oeffnet;
- bestehende-Case-Auswahl die primaere Capture-Aktion verdraengt;
- eine neue-Case-Absicht Analyse, Titelgenerierung oder zusaetzliches Matching
  unterdrueckt.
