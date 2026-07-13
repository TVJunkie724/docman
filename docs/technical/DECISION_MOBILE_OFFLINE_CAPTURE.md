---
title: "Decision - Mobile Offline Capture"
description: "Entscheidung zum Offline-Scope fuer Mobile Capture, lokale Queue, Kontext-Cache und Home-Hub-Unabhaengigkeit beim Scannen"
tags: [decision, mobile, capture, offline, queue, home-hub, draft-inbox]
lastUpdated: "2026-07-14"
status: "accepted"
---

# Decision - Mobile Offline Capture

## 2026 Vault Rebaseline

Offline durability remains accepted. Local mobile Vault captures remain on that
device. Cloud Vault captures queue as pending work until Mappm Cloud confirms;
they do not become completed merely because bytes exist locally.

## Status

Accepted.

R7-D2 ist entschieden. Mobile Capture muss offline funktionieren. Der Home Hub
ist Upload-/Sync-Ziel, aber keine Voraussetzung fuer das Scannen.

## Entscheidung

Capture darf nie am Netzwerk scheitern. Kontext darf fehlen.

Mobile muss Dokumente und Bildnachweise offline erfassen, lokal speichern und in
einer persistenten Upload Queue halten koennen. Wenn der Home Hub nicht
erreichbar ist, wird der Upload spaeter nachgeholt. Fehlender oder veralteter
Kontext wird im Desktop Draft Review korrigiert.

## Offline zwingend

Mobile muss offline koennen:

- Dokumentenscan aufnehmen.
- Foto/Bildnachweis aufnehmen.
- Capture Intent setzen: `DocumentScan` oder `PhotoOrImageEvidence`.
- lokale Artefakte sicher speichern.
- Upload Queue persistieren.
- Queue ueber App-Neustart behalten.
- Queue-Status anzeigen.
- Notiz hinzufuegen.
- Retake/Abbrechen/lokalen Entwurf loeschen.
- spaeter manuell oder automatisch hochladen, wenn Home Hub erreichbar ist.

## Offline optional, aber sinnvoll

Mobile darf offline anbieten:

- betroffene Person aus gecachtem Haushaltsprofil waehlen.
- Vorgang aus gecachter Liste waehlen.
- zuletzt verwendete Vorgänge anbieten.
- einfache Tags oder Kurznotiz setzen.
- Queue-Eintrag vor Upload korrigieren.
- Upload pausieren oder erneut versuchen.

Diese Felder duerfen Capture nicht blockieren. Wenn Cache fehlt, wird trotzdem
gescannt.

## Nicht noetig fuer R7

Nicht Teil dieser Entscheidung:

- vollstaendige mobile Vorgangsverwaltung.
- komplexe Case-Beziehungs- oder Kompositionsbearbeitung auf Mobile.
- vollstaendige mobile Dokumentbibliothek.
- vollstaendige mobile Suche.
- Sync-Konfliktaufloesung auf Mobile.
- OCR/AI auf Mobile.
- Rechteverwaltung.
- grosse Sync-Konfiguration.

## Queue-Zustaende

Die Mobile Queue braucht mindestens:

```text
localSaved
waitingForConnection
uploading
uploaded
uploadFailed
reviewNeeded
```

Zustaende muessen fuer Nutzerinnen ruhig und verstaendlich sein. Wenn Home Hub
nicht erreichbar ist, zeigt Mobile z. B. "Wird spaeter hochgeladen" statt
Capture zu blockieren.

## Draft-Inbox-Fallback

Wenn Kontext fehlt oder ungueltig wird:

- Upload bleibt erlaubt.
- Desktop Draft-Inbox ist der sichere Zielort.
- Review Completion verlangt spaeter die betroffene Person und Pflichtfelder.
- ungueltige `profileId` oder `caseId` fuehrt zu Review, nicht zu Datenverlust.

## Konsequenzen

- R7-D2 ist entschieden: Offline-Capture mit persistenter Queue ist Pflicht.
- Home-Hub-Erreichbarkeit ist keine Capture-Voraussetzung.
- Kontextauswahl ist Komfort, nicht Pflicht.
- Mobile bleibt Capture-first und wird nicht zur vollstaendigen Desktop-Verwaltung.
- F17 Mobile Capture muss diese Offline-Regel als DoD behalten.

## Nicht entschieden

- exakte lokale Mobile-Persistenz fuer Queue-Artefakte.
- wie lange fehlgeschlagene Uploads lokal behalten werden, ausser bestehende
  Cleanup-Regeln greifen.
- ob Upload automatisch oder manuell startet, sobald Verbindung zurueck ist.
- wie viel Mobile-Review spaeter in R7 ausgebaut wird.
