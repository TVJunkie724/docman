---
title: "MP-DS-02 Layout And Shell"
description: "Responsive layout, navigation and workspace-shell contract"
tags: [design-system, layout, shell, navigation, responsive]
lastUpdated: "2026-07-12"
status: draft
owner: "ui-concept"
source_mock:
  - docs/design-system/Mock/index.html
---

# MP-DS-02 Layout And Shell

## Status

Draft, Planungsgrundlage.

## Zweck

Mappm braucht eine Shell fuer wiederholte Dokumentarbeit, nicht fuer
Marketing. Der erste Blick soll direkt nutzbar sein: Eingang, Vorgänge,
Dokumente, Aufgaben, Suche, Profile, Backup/Sync-Status.

## Shell-Prinzipien

- Desktop-first, aber mobile capture kompatibel.
- Navigation ist ruhig und vorhersehbar.
- Dokumentarbeit steht im Zentrum, nicht grosse Hero-Flächen.
- Status wird sichtbar, aber nicht alarmistisch.
- Sensitive Daten werden nicht in Shell-Chrome oder Push-artigen Bannern
  ausgebreitet.

## Desktop Shell

| Bereich | Regel |
|---|---|
| App Header | Produktname, Suche, Backup/Sync-Status, Profil/Haushalt, Settings. |
| Sidebar | Hauptbereiche: Eingang, Vorgänge, Dokumente, Aufgaben, Suche, Profile, Einstellungen. |
| Content | Dichte, aber luftige Arbeitsflaeche mit klaren Listen und Detailpanels. |
| Right Panel | Optional fuer Preview, Metadaten, Tasks oder Konflikte. |

## Mobile Richtung

Mobile ist zuerst Capture- und Review-Companion:

- Scan / Foto aufnehmen.
- betroffene Person optional waehlen, wenn sicher.
- Vorgang optional waehlen, wenn Liste verfuegbar.
- Upload-Queue und Offline-Status sehen.
- Vollverwaltung kommt spaeter.

## Layout-Regeln

- Keine Cards in Cards fuer ganze Seitenbereiche.
- Repeated Items duerfen Cards sein.
- Tabellen, Listen und Detailpanels nutzen stabile Hoehen und klare Gaps.
- Vorschau braucht feste Abmessungen, damit Text und Toolbar nicht springen.
- Lange deutsche Labels duerfen nicht abgeschnitten werden, wenn eine zweite
  Zeile professioneller ist.
