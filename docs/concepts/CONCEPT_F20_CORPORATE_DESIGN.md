---
title: "Konzept F20 - Corporate Design and Brand Application"
description: "Mappm Corporate Design, Logo-System, Brand-Farben, Voice, Standards und produktnahe Brand-Anwendung"
tags: [concept, frontend, design-system, corporate-design, brand, colors, logo, voice]
lastUpdated: "2026-07-15"
version: "1.1"
status: "accepted"
owner: "ui-concept"
---
# Konzept F20 - Corporate Design and Brand Application

## Status

Accepted.

F20 ist die umsetzungsrelevante Brand-Schicht fuer Mappm. Das Konzept ersetzt
keine professionelle Logo-Ausarbeitung, definiert aber verbindlich, wie die
aktuelle Brand-Richtung in der App verwendet werden darf.

## Zweck

Mappm soll warm, privat, haushaltsnah und gleichzeitig professionell wirken.
Die App darf nicht nach generischem SaaS, Steuerportal, Kliniksoftware oder
Spielzeug-App aussehen.

F20 definiert:

- Brand-Idee.
- Logo- und Asset-Rollen.
- Brand-to-Product-Farbuebersetzung.
- Voice und privacy-sichere Texte.
- Corporate Usage Gates fuer spaetere App-, Store- und Dokumentationsarbeit.

Detailkonzept:

- `CONCEPT_F31_BRAND_SYSTEM_DETAIL.md` ist die build-relevante
  Detail-Spezifikation fuer Brand, Logo, Corporate Colors, Voice und
  Distribution Readiness.

## Subkonzept F20.1 - Corporate Design Overview

Quelle: `docs/design-system/Mock/pages/corporate-design.html`.

Regeln:

- Sichtbarer Produktname ist `Mappm`.
- Claim-Richtung: "Ordnung fuer Zuhause".
- Mappm nutzt warme Brand-Signale, aber die Arbeitsoberflaeche bleibt ruhig.
- Private Dokumentarbeit braucht Vertrauen, Dichte und Korrekturbarkeit vor
  Marketing-Gesten.

Flutter-Implikation:

- Keine Landingpage als App-Start.
- Brand darf in Navigation, App-Icon, Empty States und primaeren Aktionen
  erscheinen.
- Dokumentlisten, Review-Flows und Forms bleiben neutrale Workbench-Flaechen.

## Subkonzept F20.2 - Logo System

Quelle: `docs/design-system/Mock/pages/corporate-logo.html`.

Aktueller Stand:

- `assets/images/logo.png` ist ein App-Icon/Symbol-Kandidat.
- Es ist noch kein vollstaendiges Logo-System.

Asset-Rollen:

| Rolle | Status | Regel |
|---|---|---|
| App Icon / Symbol | vorhanden | Fuer App, Mock und fruehe Brand-Flaechen nutzbar. |
| Wordmark | offen | Vor Website, Store-Material und Decks entscheiden. |
| Monochrome | offen | Fuer Dark Mode, Druck, Dokumentation und Barrierefreiheit noetig. |
| Favicon/Web Icons | abgeleitet geplant | Aus finalem Logo-System ableiten. |

Nicht erlaubt:

- Das App-Icon als generisches Produkt-Icon in Buttons oder Listen verwenden.
- Logo-Farben als direkte Statusfarben missbrauchen.
- Ein neues Logo in Flutter nachbauen, bevor das Logo-System entschieden ist.

## Subkonzept F20.3 - Corporate Colors

Quelle: `docs/design-system/Mock/pages/corporate-colors.html`.

Brand-Farbrollen:

| Rolle | Token | Verwendung |
|---|---|---|
| Mappm Coral | `--mappm-coral` | Primaere Capture-/Create-Aktion, Brand-Akzent. |
| Archive Rose | `--mappm-rose` | Logo-Tiefe, seltene aktive Markierung, Fehlerakzent in Callouts. |
| Folder Apricot | `--mappm-apricot` | Warmer Dokument-/Ordner-Bezug, Illustration, dezente Akzente. |
| Paper Warmth | `--mappm-paper` | Warmes Paper-Panel, nicht dominante App-Flaeche. |
| Deep Petrol | `--mappm-petrol-deep` | Enterprise-Struktur, Vertrauen, Navigation. |
| Petrol | `--mappm-petrol` | Sync, Info, strukturierende Arbeitskontexte. |
| Petrol Soft/Mist | `--mappm-petrol-soft`, `--mappm-petrol-mist` | Sanfte kuehle Flaechen und Auswahlhintergruende. |

Regeln:

- Coral ist Brand und Aktion, nicht generisch Warning.
- Rose ist selten und darf keine pinke App erzeugen.
- Petrol ist die professionelle Gegenfarbe fuer Struktur, Sync und Info.
- Statusbedeutung entsteht nie nur durch Farbe.

## Subkonzept F20.4 - Voice

Quelle: `docs/design-system/Mock/pages/corporate-voice.html`.

Voice-Regeln:

- Deutsch als sichtbare UI-Sprache.
- Kurz, konkret, handlungsorientiert.
- Keine technischen Rohfehler im Nutzerpfad.
- Keine privaten Details in globalen Meldungen.
- Bei sensiblen Aktionen klar sagen, was passiert und was nicht passiert.

Beispiele:

| Situation | Gute Richtung |
|---|---|
| Draft gespeichert | "Dokument wurde gesichert." |
| Erforderliche Angabe fehlt | "Bitte ergänzen Sie die markierte Angabe." |
| Cloud upload offline | "Upload wartet auf Verbindung zur Mappm Cloud." |
| Exportfehler | "Export nicht erstellt. Keine Datei wurde geteilt oder versendet." |

## Subkonzept F20.5 - Corporate Standards

Quelle: `docs/design-system/Mock/pages/corporate-standards.html`.

Gates:

- Keine echten privaten Daten in Mock, Test, Screenshot, Demo oder Fixture.
- Store-/Distribution-Material braucht finalen Namen, Icon, Wordmark,
  Datenschutzhinweise und Third-Party Notices.
- Lucide ist als Icon-Richtung erlaubt; Lizenzhinweis muss spaeter in Notices.
- App- und Dokumentationssprache muessen `Mappm` verwenden, solange der
  technische Repo-Name `DocMan` noch nicht umbenannt ist.

## Definition of Done

F20 ist umgesetzt, wenn:

- Flutter Theme und App Shell Mappm-Farbrollen statt freier Hexwerte nutzen.
- App Icon und Produkticons getrennt bleiben.
- Voice-Regeln in Fehler-, Empty-, Review- und Exportpfaden angewendet werden.
- Brand-Farben nicht als unstrukturierte Statuspalette verwendet werden.
- Third-Party-/Icon-Lizenzhinweise fuer Distribution vorbereitet sind.

## Enterprise Quality Contract

Dieses Konzept uebernimmt
`docs/execution/CONCEPT_ENTERPRISE_QUALITY_CONTRACT.md`. Eigener Scope und
Status bleiben massgeblich. Der gemeinsame Vertrag liefert die verbindlichen
Defaults fuer Ownership, Security/Privacy, Accessibility/Lokalisierung,
Verifikation, Stop Rules und Handoff, soweit dieses Dokument keine strengere
Regel definiert. Ein Widerspruch stoppt die betroffene Phase und wird in diesem
Konzept aufgeloest.
