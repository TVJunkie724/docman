---
title: "MP-DS-06 Accessibility und Quality Gates"
description: "Accessibility-, Responsive- und visuelle Verifikationsregeln fuer Mappm"
tags: [design-system, accessibility, quality, visual-qa]
lastUpdated: "2026-07-15"
status: "active-baseline"
owner: "ui-concept/quality-readiness"
---

# MP-DS-06 Accessibility und Quality Gates

## Baseline

Accessibility ist ab dem ersten UI-Slice Produktanforderung, unabhaengig von
der finalen rechtlichen Applicability. Betroffene Phasen pruefen zusaetzlich
European Accessibility Act sowie Store-/Plattformregeln gegen das datierte
Regulatory Source Register.

## Pflicht-Gates

- Semantics und barrierefreie Namen fuer Controls, Felder, Status und
  Dokumentvorschau-Aktionen.
- deterministische Tastaturreihenfolge, sichtbarer Fokus sowie
  Escape-/Cancel-Verhalten.
- keine Bedeutung nur durch Farbe, Position, Animation oder Icon.
- Text Scaling und lange deutsche Texte ohne Clipping oder Overlap.
- Reduced Motion und unterbrechungssicherer Fortschritt.
- Kontrast-Evidenz fuer Text, Controls, Fokus und Statusrollen.
- Desktop-/Mobile-Screenshots oder Goldens fuer akzeptierte Referenzgroessen.
- ausschliesslich synthetische Inhalte in Screenshots und Diagnostik.

## Evidenz

Jeder UI-Plan nennt exakte Semantics-/Widget-/Golden-/manuelle Checks mit
Pass-/Fail-Kriterien. Visuelle Evidenz verwendet stabile Fonts/Assets und
dokumentiert Viewport, Plattform und Zustand. Eine Review-Notiz ohne
reproduzierbare Evidenz ist kein Gate.

## Stop Rules und Handoff

Stop, wenn Tastatur, Semantics, Textscale, Kontrast, Responsive Layout oder
Reduced Motion unspezifiziert sind. `ui-plan-review` prueft den Plan,
`ui-auditor` die Implementierungsevidenz und `quality-readiness` gemeinsames
Testtooling.
