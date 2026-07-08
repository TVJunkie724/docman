---
status: draft
source_logo:
  - assets/images/logo.png
source_docs:
  - docs/design-system/Brand/BRAND_DIRECTION.md
  - docs/design-system/Decisions/ADR-0002-brand-identity-and-palette.md
---

# MP-DS-03 Corporate Design

## Status

Draft, verbindliche Planungsgrundlage fuer Corporate Design.

## Zweck

Corporate Design schuetzt die Identitaet von Mappm:

- warm genug fuer Haushalts- und Familiendokumente.
- serioes genug fuer Arztbriefe, Versicherungen, Ausweise und Verträge.
- ruhig genug fuer wiederholte Verwaltung.
- eigenstaendig genug, um nicht wie ein generisches Cloud-DMS zu wirken.

## Logo-System

Derzeit existiert:

```text
assets/images/logo.png
```

Rolle:

| Rolle | Status | Regel |
|---|---|---|
| App Icon / Symbol | vorhanden | Darf fuer App-Icon, Mock und fruehe Brand-Flaechen genutzt werden. |
| Wordmark | fehlt | Muss spaeter entworfen oder bewusst verworfen werden. |
| Monochrome Logo | fehlt | Noetig fuer Druck, Dark Mode, einfarbige UI-Kontexte und Store-Assets. |
| Favicon / Web Icons | vorhanden, aber nicht final geprueft | Spaeter aus finalem Logo-System ableiten. |

## Logo-Regeln

- Logo nie verzerren.
- Logo nicht nachzeichnen.
- Logo nicht als allgemeines UI-Icon fuer Dokumente oder Vorgänge verwenden.
- Keine Glow-, Glass-, 3D- oder AI-Demo-Effekte.
- In kleinen UI-Kontexten Symbol nutzen, nicht versuchen eine Wordmark zu
  simulieren.

## Corporate Colors

| Farbe | Wert | Rolle | Grenze |
|---|---:|---|---|
| Mappm Coral | `#EF6D5D` | Brand-Waerme, primaere Aktion, Capture. | Keine Fehler-/Warning-Farbe. |
| Archive Rose | `#CF3766` | Brand-Tiefe, aktive Markierung. | Nicht als breite Flaeche dominieren lassen. |
| Folder Apricot | `#FCBC9D` | Dokument-/Ordner-Waerme. | Nicht fuer dichte Texte. |
| Paper Warmth | `#FFF7F1` | Papier, ruhige Brand-Flaeche. | Nicht alleiniger App-Hintergrund fuer alle Screens. |
| Document Ink | `#28303A` | Struktur, Text, Vertrauen. | Nicht jede Flaeche dunkel machen. |

## Voice

Mappm spricht knapp, ruhig und hilfreich.

Bevorzugt:

- "Dokument wurde gesichert."
- "Dieser Entwurf braucht noch eine betroffene Person."
- "Backup fehlgeschlagen. Bitte Verbindung zum Home Hub pruefen."

Vermeiden:

- "KI hat das Dokument erkannt und automatisch erledigt."
- "Hoppla!"
- "Critical error in upload pipeline."

## Bildwelt

Mappm braucht wenig dekorative Bildwelt. Wenn Bilder spaeter genutzt werden:

- echte Dokument-/Scan-/Ablage-Situationen, aber synthetisch und privacy-safe.
- keine echten Arztbriefe, Ausweise, Rechnungen oder Schuldokumente.
- keine generischen Cloud-Stockbilder.
- keine uebertriebene Familienidylle.

## Product-Handoff

Corporate Design gibt Brand, Logo, Farben und Ton vor. Product Design uebersetzt
das in:

- Shell.
- Komponenten.
- Dokumentlisten.
- Draft Review.
- Status- und Fehlerzustaende.
- Export/Backup/Sync-Kontexte.
