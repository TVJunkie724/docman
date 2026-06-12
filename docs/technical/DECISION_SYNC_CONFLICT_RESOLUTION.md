---
title: "Decision - Sync Conflict Resolution"
description: "Entscheidung zu Sync-Konflikten, Merge-Regeln, Tombstones und UI-Aufloesung ueber Dashboard und Konfliktansicht"
tags: [decision, sync, conflicts, dashboard, ui, local-first, home-hub]
lastUpdated: "2026-06-06"
status: "accepted"
---

# Decision - Sync Conflict Resolution

## Status

Accepted.

R6-D3 ist entschieden. Sync-Konflikte werden sichtbar gemacht und bewusst
aufgeloest. Ordna ueberschreibt fachlich relevante Daten nicht still.

## Entscheidung

Ordna bleibt local-first. Wenn mehrere Geraete dieselben Daten offline oder
parallel aendern, darf Sync keine fachlich relevanten Aenderungen unsichtbar
verlieren.

Grundregel:

- technische/idempotente Duplikate werden automatisch bereinigt.
- verschiedene Felder derselben Entity duerfen automatisch gemerged werden, wenn
  kein fachlicher Widerspruch entsteht.
- gleiche Feldkonflikte werden sichtbar gemacht.
- Loeschung vs. Bearbeitung wird nie still zugunsten der Loeschung entschieden.
- hochsensible Daten und Profil-/Haushaltsrechte werden besonders vorsichtig
  behandelt.
- Nutzerinnen brauchen eine klare UI zur Aufloesung.

## Konfliktarten

| Konflikt | Regel |
|---|---|
| unterschiedliches Feld geaendert | auto-merge erlaubt, mit Sync-Historie |
| dasselbe Feld unterschiedlich geaendert | Konflikt erzeugen |
| Loeschung vs. Bearbeitung | Konflikt erzeugen, keine stille Loeschung |
| Upload-Retry / doppelte Confirm-Anfrage | idempotent behandeln, kein Nutzerkonflikt |
| Dateiinhalt unterschiedlich bei gleichem Dokument | Konflikt erzeugen oder neue Version vorschlagen |
| Profil-/Rechteaenderung parallel | Konflikt erzeugen, nicht still mergen |
| hochsensibler Fact parallel geaendert | Konflikt erzeugen, explizite Review |
| Aufgabenstatus parallel geaendert | einfache Auswahl: lokale Version, remote Version oder zusammenfuehren, falls sinnvoll |

## Sync-Metadaten

Sync-relevante Entities brauchen spaeter mindestens:

```text
entityId
entityType
localRevision
remoteRevision optional
updatedAt
updatedByDeviceId optional
deletedAt optional
syncState: clean | dirty | syncing | conflict | deleted
```

Der konkrete Algorithmus bleibt R6-Implementationsarbeit, aber die Produktregel
steht: Konflikte sind eigene Zustände, keine stillen Fehler.

## UI-Regeln

Konflikte muessen in der UI sichtbar und aufloesbar sein.

### Dashboard

Das Dashboard zeigt Konflikte nur, wenn es welche gibt.

Beispiele:

```text
3 Sync-Konflikte brauchen Aufmerksamkeit
```

Dashboard-Regeln:

- kein permanenter leerer Konfliktbereich, wenn alles sauber ist.
- Konflikt-Hinweis ist sichtbar genug, aber nicht panisch.
- Klick fuehrt zur Konfliktansicht.
- Anzeige unterscheidet nach Schwere, wenn sinnvoll:
  - normale Metadaten.
  - Loeschung/Bearbeitung.
  - hochsensible Daten.
  - Profil-/Rechtekonflikt.

### Eigene Konfliktansicht

Es gibt eine eigene Seite/Ansicht fuer Konflikte.

Die Konfliktansicht zeigt:

- betroffene Entity: Dokument, Vorgang, Aufgabe, Profil, Fact, Datei.
- was lokal geaendert wurde.
- was remote geaendert wurde.
- Zeitpunkt/Geraet, soweit datenschutzfreundlich moeglich.
- betroffene Felder.
- empfohlene Aktion, wenn eindeutig.
- Schaltflaechen zur Aufloesung.

Fruehe Aktionen:

- lokale Version behalten.
- remote Version uebernehmen.
- Felder manuell zusammenfuehren.
- als neue Version behalten, falls Datei-/Dokumentinhalt betroffen ist.
- Loeschung bestaetigen oder Objekt wiederherstellen.
- spaeter erledigen.

### Detailkontext

Konflikte sollen aus der Konfliktansicht in den betroffenen Kontext fuehren:

- Dokumentdetail.
- Vorgang.
- Aufgabe.
- Profil.
- Fact/Claim.

Die normale Detailansicht darf einen Konfliktstatus zeigen, aber die
Konfliktliste bleibt der zentrale Arbeitsort.

## Nicht still aufloesen

Nicht still aufloesen:

- Profilzuordnung.
- Haushalts-/Management-/Zugriffsrechte.
- Loeschung vs. Bearbeitung.
- hochsensible Profil-Fakten.
- Dokumentdatei-Inhalt.
- Claims/Erstattungsstatus.
- Zahlungs-/Kostenfacts, wenn derselbe Wert abweicht.

## Automatisch aufloesbar

Automatisch aufloesbar:

- idempotente Upload-Bestaetigungen.
- identische Aenderung auf mehreren Geraeten.
- technische Sync-/Retry-Metadaten.
- unterschiedliche Felder ohne fachliche Abhaengigkeit, z. B. Titel auf Geraet
  A und Tag auf Geraet B, sofern keine Validierungsregel widerspricht.

## Konsequenzen

- R6-D3 ist entschieden: Konflikte sichtbar machen, nicht still ueberschreiben.
- Dashboard zeigt Konflikte nur bei Bedarf.
- Eigene Konfliktansicht ist Produktanforderung fuer R6/R7.
- Konflikte werden als Sync-State modelliert.
- Tombstones/Deletes brauchen Recovery- und Konfliktfaehigkeit.
- Hochsensible Daten und Rechte brauchen explizite Konfliktauflösung.

## Nicht entschieden

- konkrete Sync-Algorithmus-Implementierung.
- genaue UI-Komponenten und Layout.
- ob Konfliktloesungen auditpflichtig sind und in welcher Tiefe.
- ob spaeter automatische Nutzerregeln fuer niedrigkritische Konflikte erlaubt
  werden.
