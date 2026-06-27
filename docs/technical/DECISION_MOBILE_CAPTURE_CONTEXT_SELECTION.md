---
title: "Decision - Mobile Capture Context Selection"
description: "Entscheidung zur optionalen Personen-, Vorgangs- und Notizzuordnung beim mobilen Scannen"
tags: [decision, mobile-capture, context, profiles, cases, draft-inbox, milestones]
lastUpdated: "2026-05-29"
status: "accepted"
---

# Decision - Mobile Capture Context Selection

## Status

Accepted.

## Entscheidung

Mobile Capture darf in M2 Kontext mitschicken, muss ihn beim Scannen aber nie
erzwingen. Die betroffene Person ist erst fuer den Abschluss des Draft Reviews
pflichtig.

Der Primaerflow bleibt:

```text
Scan
  -> optional betroffene Person waehlen
  -> optional Vorgang waehlen
  -> optionale Notiz
  -> Upload
  -> Draft-Inbox oder direkt zugeordneter Draft
```

Wenn kein Kontext gewaehlt wird, die Vorgangsliste nicht verfuegbar ist oder
ein Kontext spaeter ungueltig wird, landet das Dokument sicher in der
Draft-Inbox.

## M2-Verhalten

Mobile Capture darf:

- eine betroffene Person anbieten, wenn Mobile sie sicher kennt oder der User sie auswaehlt.
- eine einfache Liste offener/aktiver Vorgänge anzeigen, wenn verfuegbar.
- optional einen Vorgang mitsenden.
- optional eine kurze Notiz mitsenden.
- einen Upload ohne Vorgang starten.

Mobile Capture muss:

- auch ohne Vorgangsliste scannen koennen.
- den Draft-Inbox-Fallback immer erhalten.
- ungueltige `caseId`/`personId`/`profileId` als Review-Fall behandeln.
- Kontextauswahl als Komfortpfad behandeln, nicht als Voraussetzung.

Mobile Capture darf keine stillen Default-Zuordnungen erfinden. Ein fehlender
Personenkontext ist kein Upload-Fehler, aber ein blockierender Review-Punkt am
Desktop.

## Nicht in M2

Mobile Capture baut noch nicht:

- vollstaendige mobile Vorgangsverwaltung.
- komplexe mobile Suche ueber alle Vorgänge.
- Subvorgang-Erstellung.
- Dokumente mehreren Vorgängen direkt am Handy zuordnen.
- Rollen-/Rechteverwaltung.
- Konfliktaufloesung fuer Profil- oder Vorgangskontext.

Diese Themen gehoeren in R5, R6, R7 oder spaetere Mobile-Review-Phasen.

## Fallback-Regeln

| Situation | Verhalten |
|---|---|
| Keine betroffene Person gewaehlt | Draft-Inbox Review; Abschluss erst nach expliziter Personenzuordnung |
| Keine Vorgangsliste verfuegbar | Upload ohne `caseId` |
| `caseId` inzwischen ungueltig | Draft-Inbox Review |
| `personId`/`profileId` nicht mehr erlaubt | Draft-Inbox Review oder Re-Pairing/Auth-Fehler je nach Ursache |
| Nutzer ist in Eile | Scan ohne Kontext bleibt erlaubt |

## Begruendung

Der wichtigste Mobile-Use-Case ist schnelles Erfassen unterwegs. Eine zu starke
Kontextpflicht wuerde den Scanfluss verlangsamen und bei schlechter Verbindung
blockieren.

Gleichzeitig ist eine optionale Vorzuordnung wertvoll, weil sie Desktop-Review
reduziert. Deshalb wird Kontext als hilfreiche Metadaten geplant, aber nicht
als harte Voraussetzung fuer Datenannahme.

## Auswirkungen auf R4

- R4.4 Mobile Scan Client muss Kontextauswahl als optionalen Schritt planen.
- R4.6 Home Hub Capture Contract muss `personId?`/`profileId?`, `caseId?` und `note?`
  akzeptieren koennen.
- R4.7 API-proxied Upload muss invalid-context fallback unterstuetzen.
- R4.8 Cases/Subcases Core bleibt Desktop-first fuer Erstellung und Struktur.

## Konsequenzen

- Mobile bleibt fuer M2 schlank.
- Draft-Inbox bleibt die zentrale Sicherheitslinie.
- Spaetere mobile Review kann auf denselben Kontextfeldern aufbauen.
- Mehrfachzuordnung und Subvorgang-Erstellung werden nicht versehentlich in den
  Mobile-Capture-Kern gezogen.

## Nicht entschieden

- genaue UI-Darstellung der Kontextauswahl.
- ob Mobile in M2 eine minimale Vorgangssuche bekommt oder nur eine kurze Liste.
- wie viele zuletzt verwendete Vorgänge Mobile lokal cached.
- ob Subvorgang-Auswahl vor R7 angeboten wird.
