---
status: draft
source_logo:
  - assets/images/logo.png
source_theme:
  - lib/presentation/theme/app_theme.dart
source_mock:
  - docs/design-system/Mock/index.html
---

# MP-DS-01 Foundations And Tokens

## Status

Draft, verbindliche Planungsgrundlage fuer Foundations.

Dieses Konzept definiert noch keine produktiven Flutter-Tokens. Ein spaeterer
UI-Architekturplan muss konkrete Dart-APIs, Theme-Struktur, Widget-Tokens und
Visual-Tests festlegen.

## Zweck

Foundations definieren die visuelle Grammatik fuer Mappm:

- Farbrollen.
- Typografie.
- Spacing.
- Radius.
- Elevation.
- Icon-Set.
- Dichte.
- Statusbedeutung.
- Privacy- und Safety-Grenzen.

## Gepruefte Quellen

| Quelle | Rolle |
|---|---|
| `assets/images/logo.png` | Bestehendes App-Icon; Quelle fuer Brand-Farben und Symbolik. |
| `lib/presentation/theme/app_theme.dart` | Legacy-/Spike-Theme; zeigt aktuelle Coral-Richtung, ist aber nicht final. |
| `docs/design-system/Mock/` | Neue reviewbare Design-System-Flaeche. |

## Kernfarben

| Rolle | Wert | Verwendung |
|---|---:|---|
| Mappm Coral | `#EF6D5D` | Brand-Akzent, primaere Capture-/Create-Aktion, aktiver Fokus in kleinen Flaechen. |
| Archive Rose | `#CF3766` | Logo-Tiefe, selektive Hervorhebung, aktive Markierung, seltene Akzentkante. |
| Folder Apricot | `#FCBC9D` | Dokument-/Ordner-Highlight, Illustration, Empty States, warme Hinweise. |
| Paper Warmth | `#FFF7F1` | Brandnahe Papierflaeche, ruhige Panels, leichte Hintergrundflaechen. |
| Deep Petrol | `#075D63` | Komplementaerer Enterprise-Akzent, Vertrauen, Struktur, ruhige Navigation. |
| Petrol | `#0E7478` | Sync, Info, aktive Struktur, neutraler aktueller Workflow-Schritt. |
| Petrol Soft | `#DDEEEF` | Sanfte Petrol-Flaechen, sekundaere Auswahl, nicht-dringliche technische Hinweise. |
| Petrol Mist | `#F0F8F8` | Hintergrundnaehe, ruhige kuehle Balance zu Paper Warmth. |
| Document Ink | `#28303A` | Primaerer Text, Navigation, professionelle Struktur. |
| Slate Text | `#56616F` | Sekundaertext, Metadaten, Hilfstext. |
| Line Warm | `#E8D6CF` | Borders, Dividers, Card-Kanten. |
| Surface White | `#FFFFFF` | Dichte Dokumentdetails, Formulare, Tabellen und Review-Oberflaechen. |
| App Background | `#F7F8FA` | Neutrale App-Umgebung ausserhalb brandnaher Flaechen. |

## Statusfarben

Statusfarben sind Produktrollen, keine Brandfarben.

| Rolle | Wert | Verwendung |
|---|---:|---|
| Success Sage | `#4F8F74` | erledigt, gesichert, wiederhergestellt, bestaetigt. |
| Warning Amber | `#C8872D` | Review-Hinweis, unvollstaendig, bald faellig, Zahlung faellig. |
| Danger Brick | `#B84A3F` | Fehler, destruktiv, Verlust-/Sicherheitsrisiko. |
| Info Petrol | `#0E7478` | Sync, Verbindung, neutraler technischer Hinweis, aktive Struktur. |
| Privacy Plum | `#704B7D` | sensible Daten, Schutzklasse, Redaction-Hinweis. |

## Farbregeln

- Coral ist die warme Brand-Aktion, nicht Warnung und nicht Fehler.
- Rose bleibt selten. Es darf keine komplett pinke App entstehen.
- Petrol ist die kuehle Enterprise-Gegenfarbe: Struktur, Sync, Verbindung,
  aktive Arbeitskontexte und ruhige technische Zustaende.
- Statusfarben muessen Bedeutung auch ueber Text, Icon, Border oder Message
  tragen.
- Statusfarben erscheinen in der Produkt-UI bevorzugt als Soft-Badge,
  Icon-Flaeche oder Akzentkante auf neutraler Card, nicht als grosse
  vollflaechige Farbbloecke.
- Workflow-Labels verwenden keine freie Material-Rainbow-Palette. Future bleibt
  neutral, Past ist gedaempft, Current ist Petrol oder bei Handlung/Zahlung
  Amber; echte Fehler verwenden Danger Brick.
- Dokumentinhalte, Metadaten und Tabellen brauchen neutrale Flaechen.
- Dark Mode bleibt geplant, aber nicht vorrangig fuer die erste
  Design-System-Freigabe.

## Typografie

Empfohlene Richtung:

| Typeface | Rolle |
|---|---|
| Manrope | Primaere Produkt- und Corporate-Schrift fuer UI, Tabellen, Formulare, Navigation und lange deutsche Texte. |
| System Sans | Technischer Runtime-Fallback, solange Font-Bundling in Flutter noch nicht umgesetzt ist. |
| Monospace | Technische IDs, Hashes, Debug-/Diagnosefragmente; nie fuer normale Dokumentdaten. |

Entscheidung: Mappm plant mit Manrope. Die Flutter-Umsetzung muss spaeter
klaeren, ob Manrope als App-Asset gebundelt oder ueber ein geeignetes Font-
Package eingebunden wird. Bis dahin darf die technische Oberflaeche auf System
Sans zurueckfallen, ohne die Design-System-Entscheidung zu aendern.

## Schriftskala

| Token | Groesse | Verwendung |
|---|---:|---|
| `font-2xs` | `10px` | kompakte Badges, kleine technische Marker. |
| `font-xs` | `11px` | Helper, Captions, Sidebar-Section-Labels. |
| `font-sm` | `12px` | Metadaten, Tabellen, kompakte Controls. |
| `font-md` | `14px` | Standard Body und Formulare. |
| `font-lg` | `16px` | wichtige Labels, Dialogbody, Listen. |
| `font-section` | `18px` | Panel-/Card-Titel. |
| `font-page` | `26px` | Page-Titel. |
| `font-display` | `32px` | seltene Dashboard-/Empty-State-Titel. |

## Spacing

| Token | px | Verwendung |
|---|---:|---|
| `space-4` | 4 | Micro-gap. |
| `space-8` | 8 | Icon/Text, kleine Control-Gaps. |
| `space-12` | 12 | Field rhythm, row internals. |
| `space-16` | 16 | Card internals, compact groups. |
| `space-20` | 20 | Standard panel padding. |
| `space-24` | 24 | Section rhythm. |
| `space-32` | 32 | Page rhythm, shell gutters. |

## Radius

Mappm nutzt ruhige, nicht uebermaessig runde Formen.

| Token | Wert | Verwendung |
|---|---:|---|
| `radius-sm` | `6px` | Inputs, small controls. |
| `radius-md` | `8px` | Cards, repeated items, buttons. |
| `radius-lg` | `12px` | Panels, dialogs, upload zones. |
| `radius-icon` | `24px` | App icon only; not a general UI radius. |

## Elevation

Elevation bleibt sparsam:

- Borders und leichte Flaechenhierarchie vor starken Shadows.
- Dialoge und Popovers duerfen Schatten nutzen.
- Karten in dichten Arbeitsflaechen bleiben flach.

## Icon Set

Mappm nutzt Lucide als primaeres Produkt-Icon-Set.

Regeln:

- Produkticons sind Funktionssprache, nicht Brand-Illustration.
- Das App-Symbol und ein spaeteres Logo-System bleiben getrennt von
  Produkticons.
- Standardgroessen sind `20px` und `24px`.
- Icons erben in der Regel die Textfarbe.
- Status- oder Warnfarbe darf ein Icon nur tragen, wenn Bedeutung auch ueber
  Text, Label oder Statusobjekt sichtbar ist.
- Icon-only Buttons sind nur fuer sehr bekannte Toolbar-Aktionen erlaubt und
  brauchen Tooltip sowie Accessibility Label.
- Capture, Export, Delete, Pairing, Backup und sicherheitsrelevante Aktionen
  nutzen Icon plus Text.
- Keine Emojis, keine gefuellten Fremdsets und keine dekorativen Einzelicons in
  der Produktoberflaeche.

## Promotion Gates

Ein Foundation-Token ist erst implementierungsreif, wenn:

- Rolle und Nicht-Rolle beschrieben sind.
- Kontrast fuer relevante Textgroessen geprueft ist.
- Light/Dark-Verhalten entweder definiert oder bewusst deferred ist.
- Flutter-Name und semantische Verwendung in einem UI-Architekturplan stehen.
