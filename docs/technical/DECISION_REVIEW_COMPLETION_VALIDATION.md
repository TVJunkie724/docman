---
title: "Decision - Review Completion Validation"
description: "Entscheidung, welche Felder den Abschluss eines Draft-Reviews blockieren und welche nur Hinweise bleiben"
tags: [decision, draft-inbox, review, validation, metadata, profiles, milestones]
lastUpdated: "2026-05-29"
status: "accepted"
---

# Decision - Review Completion Validation

## Status

Accepted.

## Entscheidung

Ein Dokument-Draft darf erst als erledigt/abgelegt gelten, wenn die
fachlichen Mindestfragen beantwortet sind. Die wichtigste Pflichtfrage ist:
**Welche betroffene Person / welches Haushaltsprofil betrifft dieses
Dokument?**

Es gibt keine Default-Annahme, dass ein Dokument meistens der aktuell
nutzenden Person gehoert. Es kann die Nutzerin, der Partner, ein Kind oder
eine andere verwaltete Person im Haushalt betreffen. Diese Zuordnung ist
fachlich explizit und muss im Review gesetzt oder bestaetigt werden.

## Blockierende Pflichtfelder

Review abschliessen blockiert, wenn eines davon fehlt:

- Datei/FileRecord ist nicht vorhanden oder nicht lesbar.
- betroffene Person / Haushaltsprofil fehlt.
- Titel fehlt.
- Dokumenttyp fehlt.
- ein harter Review-Konflikt ist offen, z. B. Importfehler,
  nicht entschiedene Duplikatwarnung oder ungueltiger Upload-Kontext.

`Sonstiges` ist ein gueltiger Dokumenttyp, wenn der konkrete Typ noch nicht
klar ist. Das ist besser als ein leerer Typ, weil Suche, Filter und spaetere
Vorschlaege trotzdem eine stabile Ausgangslage haben.

## Hinweise statt Blocker

Diese Felder duerfen leer bleiben und erscheinen hoechstens als Hinweis:

- Vorgang/Subvorgang.
- Absender/Aussteller.
- Dokumentdatum.
- Betrag.
- Fälligkeitsdatum.
- Tags.
- Notiz.
- verknuepfte Records, Claims oder externe Aktionen.
- Preview-Fehler, solange die Originaldatei vorhanden und oeffenbar ist.

Das ist Absicht: Diese Metadaten werden auf Dauer realistisch nicht sauber
manuell gepflegt. Sie sollen in M3 Assisted Review durch OCR/Extraktion
vorgeschlagen und dann korrigierbar bestaetigt werden.

## Review-Verhalten

```text
Draft
  -> Datei pruefen
  -> betroffene Person setzen
  -> Titel setzen
  -> Dokumenttyp setzen
  -> harte Review-Konflikte loesen
  -> optional Vorgang und Metadaten ergaenzen
  -> Review abschliessen
```

Mobile Capture darf betroffene Person, Vorgang und Notiz optional mitsenden.
Wenn Mobile keinen sicheren Kontext setzt, landet der Draft in der Inbox und
Desktop Review muss die betroffene Person vor Abschluss setzen.

## Konsequenzen

- R4-D23 ist entschieden.
- R4.9 muss Review-Validation zusammen mit Dokument-Metadaten und Preview
  planen.
- `DocumentMetadata`/Draft-State braucht ein klares Feld fuer betroffene
  Person / Haushaltsprofil.
- Mobile Capture darf keine stillen Default-Zuordnungen erfinden.
- Assisted Review wird in M3 priorisiert, weil optionale Metadaten sonst
  dauerhaft Handarbeit bleiben.

## Nicht entschieden

- ob ein Dokument mehrere betroffene Personen direkt in M2 bekommt oder ob M2
  mit einer primaeren betroffenen Person startet.
- ob bestimmte Dokumenttypen spaeter eigene zusaetzliche Pflichtfelder
  bekommen.
- wie Vorschlaege fuer betroffene Person technisch bewertet werden.
