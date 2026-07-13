---
title: "Decision - Mobile Capture Context Selection"
description: "Entscheidung zur optionalen Managed-Subject-, Vorgangs- und Notizzuordnung beim mobilen Scannen"
tags: [decision, mobile-capture, context, profiles, cases, draft-inbox, milestones]
lastUpdated: "2026-07-14"
status: "accepted"
---

# Decision - Mobile Capture Context Selection

## 2026 Cloud Rebaseline

Optional context and Draft-Inbox fallback remain accepted. Cross-device mobile
handoff is a Cloud Vault capability; historical Home-Hub contract references
map to the C2 Mappm Cloud Capture contract.

## Status

Accepted.

## Entscheidung

Mobile Capture darf in M2 Kontext mitschicken, muss ihn beim Scannen aber nie
erzwingen. Der Managed Subject ist erst fuer den Abschluss des Draft Reviews
pflichtig.

Der Primaerflow bleibt:

```text
Scan
  -> optional Managed Subject waehlen
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

- einen erlaubten Managed Subject anbieten, wenn Mobile ihn sicher kennt oder der User ihn auswaehlt.
- eine einfache Liste offener/aktiver Vorgänge anzeigen, wenn verfuegbar.
- optional einen Vorgang mitsenden.
- optional eine kurze Notiz mitsenden.
- einen Upload ohne Vorgang starten.

Mobile Capture muss:

- auch ohne Vorgangsliste scannen koennen.
- den Draft-Inbox-Fallback immer erhalten.
- ungueltige `caseId`/`managedSubjectId` als Review-Fall behandeln.
- Kontextauswahl als Komfortpfad behandeln, nicht als Voraussetzung.

Mobile Capture darf keine stillen Default-Zuordnungen erfinden. Ein fehlender
fehlender Managed-Subject-Kontext ist kein Upload-Fehler, aber ein blockierender Review-Punkt am
Desktop.

## Nicht in M2

Mobile Capture baut noch nicht:

- vollstaendige mobile Vorgangsverwaltung.
- komplexe mobile Suche ueber alle Vorgänge.
- Case-Beziehungen oder Bottom-up-Komposition.
- Dokumente mehreren Vorgängen direkt am Handy zuordnen.
- Rollen-/Rechteverwaltung.
- Konfliktaufloesung fuer Profil- oder Vorgangskontext.

Diese Themen gehoeren in R5, R6, R7 oder spaetere Mobile-Review-Phasen.

## Fallback-Regeln

| Situation | Verhalten |
|---|---|
| Kein Managed Subject gewaehlt | Draft-Inbox Review; Abschluss erst nach expliziter Zuordnung |
| Keine Vorgangsliste verfuegbar | Upload ohne `caseId` |
| `caseId` inzwischen ungueltig | Draft-Inbox Review |
| `managedSubjectId` nicht mehr erlaubt | Draft-Inbox Review oder Re-Auth-/Berechtigungsfehler je nach Ursache |
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
- C2 Mappm Cloud Capture Contract muss `managedSubjectId?`, `caseId?` und `note?`
  akzeptieren koennen.
- R4.7 API-proxied Upload muss invalid-context fallback unterstuetzen.
- R4.8 Cases/Relations Core bleibt Desktop-first fuer Erstellung und Struktur.

## Konsequenzen

- Mobile bleibt fuer M2 schlank.
- Draft-Inbox bleibt die zentrale Sicherheitslinie.
- Spaetere mobile Review kann auf denselben Kontextfeldern aufbauen.
- Mehrfachzuordnung und Case-Komposition werden nicht versehentlich in den
  Mobile-Capture-Kern gezogen.

## Nicht entschieden

- genaue UI-Darstellung der Kontextauswahl.
- ob Mobile in M2 eine minimale Vorgangssuche bekommt oder nur eine kurze Liste.
- wie viele zuletzt verwendete Vorgänge Mobile lokal cached.
- ob Auswahl typisierter Case-Beziehungen vor R7 angeboten wird.
