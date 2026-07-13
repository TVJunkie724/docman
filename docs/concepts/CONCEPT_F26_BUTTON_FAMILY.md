---
title: "Konzept F26 - Button Family"
description: "Detaillierte Mappm Design-System-Spezifikation fuer Buttons, Commands, Button-Zustaende, Groessen, Icon-Nutzung, Dark/Inverse Varianten, Accessibility und Flutter-Handoff"
tags: [concept, frontend, design-system, buttons, commands, accessibility, flutter, production-readiness]
lastUpdated: "2026-07-12"
version: "1.0"
status: "accepted"
---

# Konzept F26 - Button Family

## Status

Accepted.

Dieses Konzept ist die build-relevante Source of Truth fuer Buttons und
Command-Hierarchien in Mappm. Der HTML-Mock bleibt visuelle Evidenz, aber ein
Flutter- oder UI-Agent muss die Button Family aus diesem Konzept verstehen und
umsetzen koennen, ohne die Mock-Seite zwingend zu oeffnen.

## Roadmap Anchor

| Ebene | Anchor |
|---|---|
| Roadmap | R4 Capture and Review Core |
| Phase/Subphase | R4.15 UX/A11y M2 Gate, R4.2 Desktop Import + Draft Inbox, R4.9 Document/Record Metadata Core |
| Pillars | Design System/UX, Capture & Inbox, Cases/Documents/Records, Export/External Actions, Security/Privacy, QA |
| Parent Concepts | F19 Design System Governance, F21 Foundations and Tokens, F23 Component System, F25 Accessibility Patterns and Visual QA |
| Mock Evidence | `docs/design-system/Mock/pages/component-buttons.html` |

## Purpose

Mappm verarbeitet private Dokumente. Buttons sind deshalb keine Dekoration,
sondern sichere Handlungsoberflaeche:

- Sie zeigen, was die naechste Handlung ist.
- Sie verhindern konkurrierende Hauptaktionen.
- Sie machen riskante oder irreversible Aktionen explizit.
- Sie bleiben auf Desktop, Mobile, Dark Surfaces und warmen Papierflaechen
  konsistent.
- Sie sind tastaturbedienbar und screenreader-verstaendlich.

## Design Principles

1. Eine klare Hauptaktion pro Arbeitskontext.
2. Button-Bedeutung entsteht aus Rolle, Text, Position, Icon, Zustand und
   Kontext, nicht nur aus Farbe.
3. Buttons verwenden semantische Design-Tokens, keine freien Hexwerte.
4. Icon-only ist eine Ausnahme fuer bekannte Toolbar-Aktionen.
5. Destruktive Aktionen brauchen Text, Risiko-Kontext und Bestaetigung.
6. Loading, Disabled und Focus sind Pflichtzustaende, nicht spaetere Politur.
7. Mobile Buttons duerfen groesser und block-level sein, aber nicht neue
   semantische Rollen erfinden.

## Anatomy

Ein Mappm Button besteht aus:

| Teil | Pflicht | Regel |
|---|---|---|
| Role | ja | `primary`, `secondary`, `light`, `textOnly`, `iconOnly`, `danger`, `inverse` |
| Visual Variant | falls noetig | `strongBorder`, `dangerLight`, `inverseSecondary`, `inverseText` |
| Label | ja, ausser Icon-only | Verb + Objekt, z. B. "Dokument scannen" |
| Icon | optional | Lucide/Produkt-Icon, erbt Textfarbe |
| Accessible Label | ja | Bei Icon-only immer explizit, sonst Label als Name |
| State | ja | default, hover, focus, pressed, loading, disabled |
| Size | ja | small, default, large, block |
| Context | ja | Arbeitskontext bestimmt Rolle und Prioritaet |
| Risk Boundary | falls noetig | destructive, sensitive export, privacy-relevant |

ASCII-Anatomie:

```text
[ leading icon ]  Label text
|---------------------------|
 role + size + state + context
```

Icon-only-Anatomie:

```text
[ icon ]
 aria-label / tooltip required
 not allowed for destructive or critical actions
```

## Role Catalogue

### Primary

Purpose:

Die eindeutige Hauptaktion im aktuellen Arbeitskontext.

Use for:

- Dokument scannen.
- Pruefung abschliessen.
- Scan verwenden.
- Speichern.
- Pairing bestaetigen.

Visual rule:

- Coral / Capture-Familie.
- hoher Kontrast.
- nur eine sichtbare Primary-Aktion je Kontext.

Do not use for:

- mehrere gleichwertige Alternativen.
- Loeschen.
- stille Navigation.
- Status-Badges.

Acceptance:

- Ein Dialog, Screen, Sheet oder Card-Flow darf maximal eine Primary-Aktion
  sichtbar zeigen.
- Wenn die Primary-Aktion blockiert ist, wird sie disabled und der Grund muss
  in direktem Kontext sichtbar sein.

### Secondary

Purpose:

Wichtige Alternative ohne Hauptfluss-Dominanz.

Use for:

- Datei importieren.
- Zurueck in Entwuerfe.
- Einzeldokument laden.
- Vorgang als ZIP.
- Neu scannen.

Visual rule:

- neutrale Outline.
- weisse oder helle Surface.
- keine starke Flaeche.

Do not use for:

- Loeschen.
- primaere Capture-/Review-Aktionen.
- Status oder Auswahlzustaende.

### Light State

Purpose:

Aktive, empfohlene, kontextuell wichtige oder ausgewaehlte Handlung, die
weniger dominant ist als Primary.

Use for:

- In Eingang behalten.
- Als erledigt markieren.
- Vorgang oeffnen / Vorgang-Link in Dokumentzeile.
- Tag setzen in Toolbar.
- empfohlene aber nicht finale Aktion.

Visual rule:

- Petrol Mist Background.
- Petrol Border.
- Petrol Deep Text.

Do not use for:

- Status-Badges.
- Validierungserfolg.
- mehrere dekorative Highlight-Buttons.

### Text Only

Purpose:

Leise Navigation oder Dismiss-Aktion.

Use for:

- Abbrechen.
- Spaeter.
- Zurueck.
- Als Foto behalten, wenn es bewusst untergeordnet ist.

Visual rule:

- transparente Flaeche.
- keine Border.
- Ink Text.
- `ghost` ist ein kompatibler Alias fuer dieselbe visuelle Rolle und darf nicht
  als neue semantische Rolle eingefuehrt werden.

Do not use for:

- Hauptaktionen.
- Gefahrenaktionen.
- Aktionen, die Nutzer leicht uebersehen duerfen.

### Icon Only

Purpose:

Kompakte, bekannte Toolbar-Aktion, wenn Platz knapp ist und Wiedererkennung
hoch ist.

Allowed examples:

- Bearbeiten.
- Suchen.
- Tag setzen.
- Weitere Aktionen.

Hard rules:

- Immer mit Accessibility Label.
- Immer mit Tooltip oder gleichwertigem Hover-/Long-press-Hint im spaeteren
  Produkt.
- Nicht fuer Loeschen, Export, Pairing, Backup, Sync-Retry mit Risiko oder
  sicherheitsrelevante Aktionen.
- Nicht fuer Aktionen, deren Bedeutung ohne Text zweifelhaft ist.

### Danger

Purpose:

Destruktive oder irreversible Aktionen.

Use for:

- Entwurf loeschen.
- Datei entfernen.
- Token widerrufen.
- Upload abbrechen, wenn Daten verloren gehen koennen.

Visual rule:

- Danger Brick fuer volle Danger-Aktion.
- Danger Light fuer mildere oder bestaetigte Entfernen-Aktion auf warmer
  Surface.

Hard rules:

- Nie icon-only.
- Nie nur durch Farbe erklaeren.
- Braucht klaren Text.
- Braucht Bestaetigung, wenn Datenverlust, Rechtegrenze oder nicht-triviale
  Wiederherstellung betroffen ist.

### Inverse / Dark

Purpose:

Buttons auf dunklen Shell-, Diagnose- oder technischen Flaechen.

Use for:

- Sync pruefen.
- Details in dunkler Diagnoseflaeche.
- Schliessen in dunklem Panel.

Visual rule:

- Inverse Primary: helle Flaeche auf dunkler Surface.
- Inverse Secondary: transparente/dunkle Flaeche mit heller Border.
- Inverse Text: heller Text ohne Flaeche.

Do not use:

- Normale Primary-Buttons blind auf dunkle Flaechen kopieren.
- Coral auf dunklen Flaechen ohne Kontrastpruefung verwenden.

## Visual Variant and Alias Map

Diese Varianten duerfen in Implementierungen als eigene visuelle Parameter
existieren, aber sie sind keine neuen fachlichen Rollen.

| Variant / Alias | Base Role | Meaning | Rule |
|---|---|---|---|
| `ghost` | Text Only | Legacy/Mock-Alias fuer leise transparente Aktion | nicht als separate Rolle modellieren |
| `strongBorder` | Secondary | Secondary auf warmer oder heller Flaeche mit staerkerer Petrol-Border | nur zur Kontrast-/Surface-Anpassung |
| `dangerLight` | Danger | milde Danger-Variante auf warmer Surface | weiterhin destructive semantics und ggf. Bestaetigung |
| `inverseSecondary` | Inverse | Secondary auf dunkler Surface | helle Border, transparente Flaeche |
| `inverseText` | Text Only / Inverse | leise Aktion auf dunkler Surface | heller Text, keine Flaeche |
| `dark` | Primary-like dark | seltene dunkle Button-Flaeche auf heller UI | nur verwenden, wenn Coral nicht passt und Kontrast geprueft ist |

Agents duerfen diese Varianten nicht frei erfinden. Neue Varianten brauchen eine
Ergaenzung in diesem Konzept oder einem spaeter akzeptierten Design-System-
Konzept.

## Size and Density Catalogue

| Size | Target Min Height | Use |
|---|---:|---|
| small | 32 px | Tabellenzeilen, kompakte Toolbars, Inline-Aktionen |
| default | 40 px | normale Dialoge, Karten, Detailseiten, Formulare |
| large | 52 px | Capture, mobile Hauptaktion, Wizard-Abschluss |
| block | container width | mobile Sheets, Bottom Areas, fokussierte One-Step-Flows |

Rules:

- Small darf nur fuer sekundaere oder Toolbar-nahe Aktionen verwendet werden.
- Primary darf default oder large sein; auf Mobile bevorzugt large/block.
- Block ist eine Layout-Variante, keine eigene Rolle.
- Text muss in Button-Bounds bleiben; bei block darf Text umbrechen, bei
  kompakten Buttons muss der Labeltext kurz genug sein.

## State Catalogue

| State | Meaning | Visual/Behavior Rule |
|---|---|---|
| default | normale Aktionsbereitschaft | stabile Flaeche, kein Layoutshift |
| hover | Pointer ueber Aktion | leichte Elevation oder Kontrast, keine Groessenaenderung |
| focus | Tastaturfokus | sichtbarer Fokus-Ring, ausreichend Kontrast |
| pressed | Aktion wird gedrueckt | kleine Rueckmeldung, kein dauerhafter Zustand |
| loading | Aktion laeuft | Busy-Indikator, Wiederholung blockiert |
| disabled | Aktion aktuell nicht moeglich | sichtbar inaktiv, Grund im Kontext erklaert |

Loading rules:

- Loading blockiert erneutes Ausloesen.
- Loading darf nicht sensible Daten im Buttontext anzeigen.
- Loading-Label sagt technische Handlung, z. B. "Wird gespeichert", nicht
  private Dokumentdetails.

Disabled rules:

- Disabled ist erlaubt, wenn eine Aktion objektiv nicht ausfuehrbar ist.
- Der Grund muss in der Naehe sichtbar sein, z. B. "1 Pflichtfeld fehlt".
- Disabled darf nicht als Ersatz fuer Validierungsfeedback missbraucht werden.

Focus rules:

- Focus muss per Tastatur sichtbar sein.
- Focus darf nicht nur Farbe sein, sondern braucht Ring/Outline.
- Focus darf keine Layoutverschiebung erzeugen.

## Icon Rules

Icon source:

- Produkt-Icons folgen F21 Icon System.
- Standard ist ein ruhiges Outline-Icon mit einheitlicher Stroke-Staerke.
- Icons erben die Button-Textfarbe.

Icon + text required for:

- Capture.
- Export.
- Delete.
- Pairing.
- Backup.
- sicherheits- oder privacy-relevante Aktionen.

Icon optional for:

- Secondary Navigation.
- Retry.
- View/Open.
- Tags.

Icon-only allowed only when:

- Aktion wiederholt in einer Toolbar erscheint.
- Bedeutung durch Umgebung klar ist.
- Accessibility Label vorhanden ist.
- Tooltip/Hint vorgesehen ist.

## Context Patterns

### Draft Review

Goal:

Nutzer prueft einen Entwurf und schliesst Review erst ab, wenn harte Gates
erfuellt sind.

Recommended action hierarchy:

```text
Primary:    Pruefung abschliessen
Secondary:  Zurueck in Entwuerfe
Text only:  Spaeter / Abbrechen
Danger:     Entwurf loeschen, getrennt und bestaetigt
```

If required fields are missing:

- Primary is disabled.
- Inline/Form feedback explains the missing requirement.
- No fake completion button.

### Document Row Toolbar

Goal:

Dichte Dokumentlisten bleiben scanbar.

Recommended hierarchy:

```text
Secondary small: Oeffnen
Light small:     Vorgang
Icon-only small: Bearbeiten, Weitere Aktionen
```

Rules:

- No full-size Primary in dense rows.
- No destructive action directly visible unless explicitly in edit context.
- Sensitive details stay out of toolbar labels.

### Export

Goal:

Nutzer entscheidet lokal, was heruntergeladen wird.

Recommended hierarchy:

```text
Secondary: Einzeldokument laden
Secondary: Vorgang als ZIP
Text only: Abbrechen
```

Rules:

- No external sharing-link button.
- Export context may show privacy badge, but action text remains neutral.
- Multi-document export as ZIP, single document without ZIP.

### Mobile Capture

Goal:

Capture-first UI mit einer eindeutigen Hauptaktion.

Recommended hierarchy:

```text
Primary block large: Scan verwenden
Secondary block:     Neu scannen
Text only block:     Als Foto behalten
```

Rules:

- Main action is large/block.
- Secondary correction remains available.
- If scanner quality is insufficient, user can keep image/photo path.

### Dark Diagnostics / Shell Surface

Goal:

Actions on dark surfaces remain readable without importing the normal Coral
primary blindly.

Recommended hierarchy:

```text
Inverse:           Sync pruefen
Inverse secondary: Details
Inverse text:      Schliessen
```

Rules:

- Dark surface variants are first-class.
- Contrast must be checked against the dark background.

## Copy Rules

Button labels should:

- use verbs.
- name the action object.
- be short enough for German labels.
- avoid technical implementation terms.
- avoid sensitive document details.

Good:

- Dokument scannen
- Datei importieren
- Pruefung abschliessen
- Vorgang als ZIP
- Neu scannen
- Entwurf loeschen

Avoid:

- OK
- Submit
- Start process
- Delete
- Upload private invoice 2026
- Share access

## Privacy and Security Rules

Buttons must not:

- include private document titles in global/shared button labels.
- include OCR text, insurance numbers, health details, or child names in generic
  command labels.
- imply external access where none exists.
- trigger export/share without local confirmation where sensitive documents may
  leave the app boundary.

Danger and export actions must:

- state the action plainly.
- show consequence in surrounding copy/dialog.
- use confirmation for destructive or privacy-relevant work.

## Accessibility Rules

Every button must have:

- accessible name.
- visible focus state.
- sufficient contrast.
- semantic enabled/disabled state.
- keyboard activation.
- stable hit target.

Icon-only buttons additionally need:

- explicit accessibility label.
- tooltip or equivalent hint.
- no hidden-only meaning.

Loading buttons need:

- busy state.
- blocked repeated activation.
- label that remains understandable.

Disabled buttons need:

- disabled semantics.
- visible reason nearby.

## Responsive Rules

Desktop:

- Button groups may wrap.
- Dense toolbars use small/default.
- Cards and dialogs keep Primary/Secondary/Text order predictable.

Tablet / narrow desktop:

- Sidebar may remain beside content.
- Button groups wrap instead of overflowing.
- Large labels must stay inside their button.

Mobile:

- Primary actions often become large/block.
- Secondary and text-only may stack below.
- Icon-only remains limited to compact toolbar rows.
- No horizontal overflow.

## Implementation Handoff Guidance

This concept intentionally does not prescribe a concrete Flutter widget class
name. The implementation plan should define one shared design-system button
surface that can express:

- role.
- size.
- state.
- optional leading icon.
- icon-only mode.
- block/full-width layout.
- danger/sensitive/export context.
- loading and disabled semantics.
- tooltip/accessibility label for icon-only.

The Flutter implementation must not create separate ad-hoc button widgets for
each feature. Feature screens should consume the shared Button Family API and
only decide role, label, icon, state and callback from their own presentation
state.

Clean Architecture boundary:

- Button components belong to Presentation / Design System.
- Buttons may receive labels, roles, states and callbacks.
- Buttons must not import Data, repositories, Drift, HTTP, file storage, or
  Secure Storage.
- Button callbacks are supplied by screens/controllers/providers, not by the
  button component.

## Test and Verification Requirements

Any implementation plan or Flutter build must include:

- golden or visual evidence for all roles.
- focus-state verification.
- disabled-state verification.
- loading-state verification.
- icon-only accessibility-label test.
- mobile/narrow-width overflow check.
- dark/inverse contrast check.
- destructive action not icon-only.
- no multiple visible Primary actions in one context unless explicitly justified
  by a future accepted concept.

## Acceptance Criteria

The Button Family is ready for implementation when:

- all roles from this concept exist in the design-system layer.
- all states are visually and semantically represented.
- all sizes are supported.
- icon-only has enforced accessibility labeling.
- dangerous actions cannot be represented as unlabeled icon-only controls.
- Primary is restricted by review/audit to one main visible action per context.
- mobile block buttons and dense desktop toolbar buttons are both covered.
- tests and visual review catch overflow, missing focus and missing labels.

## Non-Goals

- This concept does not define status badges.
- This concept does not define tag chips.
- This concept does not define form field controls.
- This concept does not define navigation tabs or segmented controls.
- This concept does not define backend actions or repository behavior.

## Related Concepts

- F19 Design System Governance and SSOT.
- F21 Foundations and Tokens.
- F22 Shell and Navigation.
- F23 Component System.
- F24 Form Family.
- F25 Accessibility Patterns and Visual QA.

## Enterprise Quality Contract

This concept adopts `docs/execution/CONCEPT_ENTERPRISE_QUALITY_CONTRACT.md`.
Its own scope and status remain authoritative; the shared contract supplies the
mandatory ownership, security/privacy, accessibility/localization, verification,
stop-rule and handoff defaults wherever this file does not define a stricter
rule. Any conflict must stop the affected phase and be resolved in this concept.
