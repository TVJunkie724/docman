---
title: "Decision - Import Duplicate Detection"
description: "Entscheidung zur M2-Duplikaterkennung beim Desktop-Import und Mobile-Capture-Handoff mit klaren Nutzeroptionen"
tags: [decision, import, duplicate-detection, hash, draft-inbox, desktop, mobile-capture]
lastUpdated: "2026-07-12"
status: "accepted"
---

# Decision - Import Duplicate Detection

## 2026 Vault Rebaseline

Duplicate rules remain accepted per Vault. Local compares authoritative local
records; Cloud compares server-authoritative records and may expose incomplete
offline results. Home-Hub references below mean the Cloud provider.

## Status

Accepted.

## Entscheidung

Der R4-M2 berechnet fuer importierte oder hochgeladene Dateien einen Hash und
nutzt ihn fuer eine einfache Duplikatwarnung.

Wenn derselbe Datei-Hash bereits existiert, blockiert Mappm den Import nicht
still. Stattdessen zeigt die App einen klaren Hinweis:

> Dieses Dokument sieht aus wie ein bereits vorhandenes Dokument.

M2-Optionen:

1. **Bestehendes öffnen**
2. **Beide behalten**
3. **Abbrechen**

Automatisches Zusammenfuehren, Versionsvorschlaege, Aehnlichkeitserkennung und
Duplikat-Cleanup bleiben spaetere Milestones.

## Nutzeroptionen

### Bestehendes öffnen

Die neue Import-/Upload-Aktion wird nicht als neuer Draft angelegt.

Die App oeffnet oder verlinkt stattdessen zum bereits vorhandenen Dokument oder
zeigt dessen Kontext:

- Titel.
- Vorgang/Profil, soweit vorhanden.
- Import-/Ablagedatum.
- Dateityp und Groesse.

### Beide behalten

Die neue Datei wird trotzdem als eigener Draft angelegt.

Diese Formulierung ist bewusst besser als "trotzdem importieren", weil sie die
fachliche Entscheidung beschreibt: Es koennen zwei bewusst getrennte Dokumente
mit identischem Dateiinhalt existieren.

Beispiele:

- dieselbe Rechnung gehoert in zwei Kontexte.
- eine Datei wurde bewusst erneut abgelegt.
- ein Dokument soll spaeter als neue Version oder Kopie bewertet werden.

### Abbrechen

Die neue Import-/Upload-Aktion wird verworfen.

Bei Desktop-Import wird kein Draft angelegt. Bei Mobile Capture bleibt der
lokale Queue-/Upload-Kontext so lange erhalten, bis die sichere Verwerfungsregel
des jeweiligen Flows greift.

## Geltungsbereich

M2-Duplikaterkennung gilt fuer:

- Desktop-Dateiauswahl.
- Desktop Drag & Drop.
- Mobile Capture Upload, sobald der Home Hub oder Desktop den Hash kennt.

Der Hash ist ein technisches Signal, kein fachliches Urteil.

## Verhalten im M2

- Hash wird berechnet, bevor ein Import als abgeschlossen gilt.
- Treffer erzeugen eine Review-/Warnentscheidung.
- Treffer blockieren nicht hart.
- Mehrere identische Dateien duerfen bewusst behalten werden.
- Die Warnung soll "sieht aus wie" oder "moeglicherweise bereits vorhanden"
  ausdruecken, nicht "ist verboten".

## Nicht im M2

- fuzzy duplicate detection.
- OCR-/Text-Aehnlichkeit.
- Versionsvorschlag.
- automatisches Merge.
- automatische Loeschung.
- Duplikat-Dashboard.
- Regeln wie "nie doppelt importieren".

## Auswirkungen auf Import und Storage

- `DECISION_DESKTOP_IMPORT_SCOPE.md` muss Hash-basierte Warnung als M2-Teil
  fuehren.
- F10 Local Storage muss Hashes fuer Integritaet und Duplikatwarnung speichern.
- Draft-Inbox muss einen Warn-/Review-Zustand fuer moegliche Dubletten
  darstellen koennen.
- DMS-Modell muss identische File-Hashes erlauben, weil "Beide behalten" ein
  gueltiger Nutzerentscheid ist.

## Konsequenzen

- R4.2 Desktop Import kann Duplicate Warning als kleines, klares UX-Verhalten
  einplanen.
- R4.7 Mobile Capture kann denselben Hash-Hinweis spaeter nutzen.
- Die App verhindert versehentliche Dubletten, ohne echte Dokumentenarbeit zu
  blockieren.
- Spaetere Versionierung kann auf Hash und Importhistorie aufbauen.

## Nicht entschieden

- exakte UI-Darstellung des Dublettenhinweises.
- ob der Hinweis inline, als Dialog oder im Draft-Review erscheint.
- ob mehrere bestehende Treffer gruppiert angezeigt werden.
- wann aus "Beide behalten" ein Versionsvorschlag werden darf.
