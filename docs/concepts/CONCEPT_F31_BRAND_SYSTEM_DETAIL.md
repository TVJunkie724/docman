---
title: "Konzept F31 - Brand System Detail"
description: "Ordna Detailkonzept fuer Brand-Idee, Logo-Rollen, Corporate Colors, Voice, Standards und Distribution Readiness"
tags: [concept, frontend, design-system, brand, corporate-design, logo, voice, distribution]
lastUpdated: "2026-06-22"
version: "1.0"
status: "accepted"
---

# Konzept F31 - Brand System Detail

## Status

Accepted.

F31 ist das Detailkonzept unter F20. F20 bleibt die kurze Brand-SSOT; F31 macht
die Corporate-Design-Seiten aus dem Mock umsetzungs- und reviewfaehig.

## Quellen

| Quelle | Rolle |
|---|---|
| `docs/design-system/Mock/pages/corporate-design.html` | Brand-Idee und Gesamtwirkung. |
| `docs/design-system/Mock/pages/corporate-logo.html` | Logo-/Asset-Rollen. |
| `docs/design-system/Mock/pages/corporate-colors.html` | Brand-to-Product-Farbuebersetzung. |
| `docs/design-system/Mock/pages/corporate-voice.html` | UI-Voice und Privacy Copy. |
| `docs/design-system/Mock/pages/corporate-standards.html` | Readiness- und Usage-Gates. |
| F20 | Corporate Design Umbrella. |
| F21 | Foundation Tokens. |

## Brand Position

Ordna ist eine Haushalts-Dokumentenapp fuer sensible private Unterlagen.

Design-Ziel:

- warm genug fuer Familie.
- serioes genug fuer Arztbrief, Vertrag und Versicherung.
- ruhig genug fuer dichte Dokumentarbeit.
- nicht verspielt, nicht generisches SaaS, nicht Behoerdenportal.

Claim-Richtung:

- `Ordna`
- `Ordnung fuer Zuhause`

## Logo System

Aktueller Stand:

- `assets/images/logo.png` ist ein vorhandenes App Icon/Symbol.
- Es zeigt Ordner, Haus, Dokument und Herz.
- Es ist eine starke Richtung, aber kein vollstaendiges Logo-System.

Asset-Rollen:

| Asset | Status | Verwendung |
|---|---|---|
| App Icon / Symbol | vorhanden | App, Mock, fruehe Brand-Flaechen |
| Wordmark | offen | Website, Store, Decks, Dokumentation |
| Monochrome | offen | Dark Mode, Druck, A11y, technische Flaechen |
| Favicon/Web Icons | vorhanden, nicht final | spaeter aus finalem Logo ableiten |

Regeln:

- App Icon ist nicht gleich Produkt-Icon-Set.
- Produkt-Icons kommen aus Lucide nach F32.
- Logo nicht in Buttons, Listenzeilen oder Statuschips wiederverwenden.
- Logo nicht nachbauen, verzerren oder mit beliebigen Schatten/Gradienten
  erweitern.

## Brand Color Roles

Warme Brand-Familie:

| Rolle | Hex | Produktrolle |
|---|---|---|
| Ordna Coral | `#EF6D5D` | Capture/Create, Brand-Aktion |
| Archive Rose | `#CF3766` | aktive Brand-Tiefe, selten |
| Folder Apricot | `#FCBC9D` | Dokumentwaerme, Illustration, leichte Akzente |
| Paper Warmth | `#FFF7F1` | warme Paper-/Review-Flaechen |

Kuehle Struktur-Familie:

| Rolle | Hex | Produktrolle |
|---|---|---|
| Deep Petrol | `#075D63` | Enterprise-Struktur, Vertrauen |
| Petrol | `#0E7478` | Sync, Info, aktive Arbeitskontexte |
| Petrol Soft | `#DDEEEF` | sanfte Auswahl-/Infoflaeche |
| Petrol Mist | `#F0F8F8` | sehr leichte kuehle Flaeche |
| Petrol Ink | `#123B40` | dunkle kuehle Text-/Iconstruktur |

Neutrale Familie:

| Rolle | Hex | Produktrolle |
|---|---|---|
| Document Ink | `#28303A` | Primaertext |
| Slate Text | `#56616F` | Metadaten und Hilfetext |
| Warm Line | `#E8D6CF` | Border/Divider |
| App Ground | `#F7F8FA` | App-Hintergrund |
| Surface White | `#FFFFFF` | Hauptflaechen |

## Brand-To-Product Translation

Regeln:

- Coral ist Hauptaktion, nicht universelle Farbe.
- Petrol ergaenzt Coral als professionelle Strukturfarbe.
- Dokumentarbeit lebt auf neutralen Flaechen.
- Farbe zeigt Rolle, aber Bedeutung bleibt immer textlich erkennbar.
- Statusfarben folgen F34, nicht rohen Logo-Farben.

## Voice

Ordna spricht:

- deutsch.
- ruhig.
- konkret.
- handlungsorientiert.
- privacy-sicher.

Copy-Regeln:

- Fehler erklaeren Ursache und naechste Aktion.
- Globale Meldungen nennen keine privaten Dokumenttitel, OCR-Texte,
  Versicherungsnummern oder Gesundheitsdetails.
- Aktionen sagen klar, was passiert und was nicht passiert.
- Technische Begriffe nur im Diagnose-/Settings-Kontext.

Beispiele:

| Situation | Copy |
|---|---|
| Draft gespeichert | `Dokument wurde gesichert.` |
| Pflichtfeld fehlt | `Betroffene Person fehlt.` |
| Upload offline | `Upload wartet. Der Home Hub ist gerade nicht erreichbar.` |
| Exportfehler | `Export nicht erstellt. Keine Datei wurde geteilt oder versendet.` |

## Corporate Standards

Readiness Gates:

- Name `Ordna` konsistent verwenden.
- Repo-/Legacy-Name `DocMan` nicht in sichtbarer UI.
- finale Wordmark vor Website/Store/Decks entscheiden.
- Third-Party Notices fuer Lucide und weitere Assets vorbereiten.
- keine echten privaten Daten in Mock, Screenshots, Fixtures oder Demos.
- Store-Texte und Datenschutzhinweise spaeter gegen DSGVO/Apple/Microsoft-
  Anforderungen pruefen.

## Flutter Handoff

Implementation soll:

- Brand Tokens ueber Theme/Design Tokens beziehen.
- App Icon nur an Shell-/Brand-Stellen nutzen.
- Produkt-Icons aus F32 nutzen.
- Copy zentral reviewbar halten, insbesondere Fehler/Export/Privacy.

## Acceptance Criteria

- [ ] Brand-Wirkung ist warm, serioes und arbeitsfaehig.
- [ ] Logo-Rollen sind getrennt von Produkt-Icons.
- [ ] Brand- und Strukturfarben haben eindeutige Produktrollen.
- [ ] Voice-Regeln verhindern sensible globale Meldungen.
- [ ] Distribution-/Store-Readiness ist als Gate vorbereitet.
