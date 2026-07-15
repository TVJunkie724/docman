---
title: "MP-DS-04 Component System"
description: "Normative Governance fuer Mappm Komponenten- und Formularfamilien"
tags: [design-system, components, forms, actions, feedback, data-display]
lastUpdated: "2026-07-15"
status: "active-draft"
owner: "ui-concept"
---

# MP-DS-04 Component System

## Status

Aktiver Entwurf und normatives Umbrella fuer Komponentenfamilien. Ein Slice
ist erst implementationsbereit, wenn akzeptiertes F-Konzept, Mock-Evidenz und
Phase Contract exakt benannt und geprueft sind.

## Scope

Buttons, Felder, Auswahl, Picker, Dateien/Scans, Status, Navigation Controls,
Overlays, Feedback, Data Display sowie Formular-Lifecycle-/Review-Muster.

Nichtziele sind Flutter-Widget-APIs, Provider Wiring, Backend Contracts und
produktspezifische Screen-Komposition. Diese gehoeren zu `ui-architect`, den
Contract-Ownern und MP-DS-05.

## Familien-Ownership

| DS-Familie | Normative Mappm-Quelle | Mock-Evidenz |
|---|---|---|
| DS-04-01 Form Family Overview | F24 | forms, form interactions, form governance |
| DS-04-02 Form Fundamentals | F27 | forms, form governance |
| DS-04-03 Text Input Family | F27 | forms |
| DS-04-04 Selection/Toggle Family | F28 | forms, form interactions |
| DS-04-05 Pickers/Viewers | F28/F29 | form interactions, product shell |
| DS-04-06 Numeric/Range Controls | F30 | forms |
| DS-04-07 File/Upload Visuals | F29 | forms, form governance |
| DS-04-08 Tags/Readonly/Status | F34 | tags, status, forms |
| DS-04-09 Compound Field Atoms | F27/F30 | forms |
| DS-04-10 Layout Primitives | F24/F30 | forms, patterns |
| DS-04-11 Form/List Entry | F30/F34 | forms, data display |
| DS-04-12 Dependent Field Groups | F27/F30 | forms, form governance |
| DS-04-13 Button/Action Visuals | F26 | buttons |
| DS-04-14 Navigation Controls | F22/F33 | navigation, product shell |
| DS-04-15 Overlays/Dialogs | F28/F33/F35 | form interactions, patterns |
| DS-04-16 Icons | F32 | icon set |
| DS-04-17 Feedback/Progress | F18/F34 | feedback, status |
| DS-04-18 Data Display | F34 | data display |
| DS-04-19 Inline Edit/Dirty States | F27/F30 | form governance |
| DS-04-20 Form Lifecycle | F27/F30 | form governance |
| DS-04-21 Form Layout Patterns | F24/F30 | forms, form governance |
| DS-04-22 Date/Time/Locale | F29 | forms, form interactions, form governance |
| DS-04-23 Money/Units/Locale | F30 | forms, form governance |
| DS-04-24 Contact/Identity/Address | F27/F28/F30 | forms, form governance |
| DS-04-25 Sensitive/Secret Fields | F12/F27 | forms, form interactions, form governance |
| DS-04-26 Async Remote Validation | F11/F18/F27 | form governance |
| DS-04-27 Permissioned Fields | F12/F27/F30 | form governance |
| DS-04-28 Review Summary/Diff | F30/F34 | form governance |
| DS-04-29 Bulk Edit/Import Validation | F24/F29/F30 | form governance |

## Pflichtzustaende

Jedes anwendbare Control definiert Default, Hover, Focus, Disabled, Readonly,
Loading/Validating, Error, Warning, Success und Permission Denied. Editierbare
Flows definieren zusaetzlich Pristine, Touched, Dirty, Submitting, Saved, Stale
und Conflict. Destruktive Aktionen brauchen Bestaetigung und eine Aussage zur
Wiederherstellbarkeit. Remote Validation ignoriert veraltete Responses.

## Security, Accessibility und Lokalisierung

- Sensible Werte sind standardmaessig maskiert und erscheinen weder in
  globalem Feedback/Logs noch als realistisch wirkende Mock-Identifiers.
- Permissioned Fields unterscheiden Readonly, Hidden, Denied und Request
  Access; UI-State ersetzt nie Domain-/Backend-Autorisierung.
- Controls besitzen programmatische Labels, Tastaturbedienung, sichtbaren
  Fokus und definiertes Textscale-Verhalten. Farbe traegt Status nie allein.
- Nutzertexte sind Deutsch und halten langen Labels/Fehlertexten stand.

## Verifikation

Jeder Implementation Plan nennt exakte Widget-, Semantics-, Golden-/Responsive-
und Interaction-Tests. Async-, Permission- und Sensitive Controls brauchen
Negativpfade. Mock-Evidenz wird vor Architektur auf Desktop- und Mobile-Breite
geprueft.

## Stop Rules und Handoff

Stop, wenn eine Familie keine exakte Zeile, keinen Pflichtzustand, keine
akzeptierte Quelle oder keine Mock-Evidenz besitzt. Handoff an `ui-architect`
nur ueber eine genehmigte Phase; danach prueft `ui-plan-review` den Plan.
