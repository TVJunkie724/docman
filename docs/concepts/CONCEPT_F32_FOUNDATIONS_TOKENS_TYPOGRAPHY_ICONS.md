---
title: "Konzept F32 - Foundations, Tokens, Typography and Icons"
description: "Ordna Detailkonzept fuer Palette, semantische Tokens, Typografie, Icon-System, Spacing, Radius, Density und Elevation"
tags: [concept, frontend, design-system, tokens, colors, typography, icons, spacing, flutter]
lastUpdated: "2026-06-22"
version: "1.0"
status: "accepted"
---

# Konzept F32 - Foundations, Tokens, Typography and Icons

## Status

Accepted.

F32 ist das Detailkonzept unter F21. Es fasst die Foundation-Seiten des
Design-System-Mocks zu einer implementierbaren Token- und Primitive-Sprache
zusammen.

## Quellen

| Quelle | Rolle |
|---|---|
| `docs/design-system/Mock/pages/foundations.html` | Foundation-Ueberblick. |
| `docs/design-system/Mock/pages/color-palette.html` | vollstaendige Farbpalette. |
| `docs/design-system/Mock/pages/icon-set.html` | Lucide Icon Map und Regeln. |
| `docs/design-system/Mock/pages/fonts.html` | Typografie und Type Scale. |
| `docs/design-system/Mock/pages/spacing.html` | Spacing, Radius, Density, Elevation. |
| F21 | Foundations Umbrella. |
| F31 | Brand Tokens. |

## Color Palette

Alle Produktfarben muessen aus dieser Palette oder daraus abgeleiteten
semantischen Tokens kommen.

### Marke und Waerme

| Token | Hex | Rolle |
|---|---|---|
| `ordnaCoral` | `#EF6D5D` | Capture/Create, Brand-Aktion |
| `archiveRose` | `#CF3766` | aktive Brand-Tiefe |
| `folderApricot` | `#FCBC9D` | Dokumentwaerme |
| `paperWarmth` | `#FFF7F1` | warme Flaeche |

### Struktur und Vertrauen

| Token | Hex | Rolle |
|---|---|---|
| `deepPetrol` | `#075D63` | Struktur, Vertrauen |
| `petrol` | `#0E7478` | Info, Sync, aktive Struktur |
| `petrolInk` | `#123B40` | dunkle kuehle Struktur |
| `petrolSoft` | `#DDEEEF` | kuehle Auswahlflaeche |
| `petrolMist` | `#F0F8F8` | leichte kuehle Flaeche |

### Text und Flaechen

| Token | Hex | Rolle |
|---|---|---|
| `documentInk` | `#28303A` | primaerer Text |
| `slateText` | `#56616F` | Meta-/Helper-Text |
| `warmLine` | `#E8D6CF` | Border/Divider |
| `surfaceWhite` | `#FFFFFF` | Hauptflaeche |
| `appBackground` | `#F7F8FA` | App-Hintergrund |

### Status im Produkt

| Token | Hex | Rolle |
|---|---|---|
| `successSage` | `#4F8F74` | gesichert, erledigt, aktuell |
| `warningAmber` | `#C8872D` | Review, Frist, Aufmerksamkeit |
| `dangerBrick` | `#B84A3F` | Fehler, Konflikt, destruktiv |
| `infoPetrol` | `#0E7478` | Sync, Queue, neutraler Hinweis |
| `privacyPlum` | `#704B7D` | sensibel, Datenschutz |
| `neutralSurface` | aus Neutralpalette | ruhiger Status ohne Alarm |

Statussignale sind Komponentenmuster nach F34. Die Palette allein ist keine
Statuskomponente.

## Typography

Entscheidung:

- Primaere Schrift: Manrope.
- Fallback: System Sans, bis Font-Bundling final implementiert ist.
- Keine Serifenschrift fuer Highlights in der Produkt-UI.

Type Scale:

| Token | Groesse | Verwendung |
|---|---|---|
| `font-xs` | 11px | Helper, Captions, Sidebar Labels |
| `font-sm` | 12px | Metadaten, Tabellen, kompakte Controls |
| `font-md` | 14px | Body, Forms |
| `font-lg` | 16px | wichtige Labels, Dialog Body |
| `font-section` | 18px | Panel-Titel |
| `font-page` | 26px | Page-Titel |

Regeln:

- Keine negative Letter-Spacing.
- Lange deutsche Labels sind Normalfall.
- Display-Typografie nur fuer Page-/Hero-aehnliche Kontexte im Produkt, nicht
  in Cards und kompakten Panels.
- Tabellen, Forms und Listen nutzen dichte Hierarchie.

## Icon System

Entscheidung:

- Lucide ist das primaere Produkt-Icon-Set.
- Lucide ist Open Source und MIT-lizenziert; Lizenzhinweis gehoert spaeter in
  Third-Party Notices.

Regeln:

- Icons sind Funktionssprache, nicht Dekoration.
- Keine Mischung mit Emojis, gefuellten Fremdsets oder App-Icon-Symbolik.
- Stroke bleibt einheitlich ruhig.
- Icon-only nur fuer bekannte Toolbar-Aktionen mit Tooltip und Semantics.
- Kritische Aktionen nutzen Icon plus Text.

Core Icon Map:

| Rolle | Verwendung |
|---|---|
| Scan | Capture, mobile upload |
| Inbox | Entwuerfe, Queue |
| Document | Datei, PDF, Nachweis |
| Folder | Vorgang, Sammlung, Ablage |
| User | Person, Profil, Haushalt |
| Search | Suche, Filter |
| Calendar | Frist, Termin, Gueltigkeit |
| Bell | Erinnerung, Aufgabe |
| Download | Export |
| Link | externe Anwendung/Website |
| Shield | Datenschutz, Schutzklasse |
| Alert | Konflikt, Risiko, Fehler |
| Check | erledigt, bestaetigt |
| Edit | bearbeiten, korrigieren |
| Tag | Schlagwort, Filter |

## Spacing

Scale:

| Token | Verwendung |
|---|---|
| `space-4` | feine innere Abstaende |
| `space-8` | kompakte Gruppen |
| `space-12` | Cards/Rows innen |
| `space-16` | Sektionen in Panels |
| `space-24` | grosse Gruppen |
| `space-32` | Page-Abstand |

Regeln:

- Arbeitsdichte entsteht durch klare Gruppen, nicht durch dekorative Flaechen.
- Repeated Items brauchen stabile Hoehen.
- Mobile nutzt groessere Touch Targets, nicht mehr dekorative Luft.

## Radius

| Token | Wert | Verwendung |
|---|---|---|
| `radius-sm` | 6px | Inputs, kleine Controls |
| `radius-md` | 8px | Cards, Buttons, repeated items |
| `radius-lg` | 12px | Panels, Dialoge, Upload-Zonen |

Regeln:

- App-Icon-Radius ist kein UI-Radius.
- Karten in Karten vermeiden.
- Rundung darf Arbeitsdichte nicht weichspuelen.

## Elevation and Borders

Regeln:

- Border und Flaechenhierarchie vor starkem Shadow.
- Shadows nur fuer Popover, Dialoge, aktive Floating-Elemente.
- Systemmeldungen nutzen Callout-Pattern nach F34.
- Dark Mode darf nicht durch harte helle Shadows blockiert werden.

## Token Promotion

Ein Token ist implementierungsreif, wenn:

- Name semantisch ist.
- Rolle und Nicht-Rolle beschrieben sind.
- Kontrast geprueft wurde.
- Flutter-Ort klar ist.
- mindestens ein Mock-Beispiel existiert.

## Acceptance Criteria

- [ ] Alle im Mock verwendeten Farben sind in Brand, Structure, Text/Surface
      oder Status einsortiert.
- [ ] Manrope ist als primaere Schrift, System Sans als Fallback definiert.
- [ ] Lucide ist als Produkt-Icon-Set mit Lizenzhinweis geplant.
- [ ] Spacing, Radius, Density und Elevation sind implementierbar beschrieben.
- [ ] Keine Komponente braucht freie Hexwerte oder freie Icon-Wahl.
