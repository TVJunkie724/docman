---
title: "MP-DS-00 Design System Umbrella"
description: "Governance- und Source-of-Truth-Vertrag fuer das Mappm Design System"
tags: [design-system, governance, umbrella, ui]
lastUpdated: "2026-07-15"
status: draft
owner: "ui-concept"
provenance:
  language: de
  source_logo:
    - assets/images/logo.png
  reference_structure:
    - /Users/caroline/development/stonehall/matchmia/Documentation/DesignSystem
---

# MP-DS-00 Design System Umbrella

## Status

Draft, aktive Planungsgrundlage.

Dieses Umbrella-Konzept ist verbindlich fuer die Organisation der
Mappm-Design-System-Konzepte, die Source-of-Truth-Klassifikation und das
Verhalten zukuenftiger UI-Arbeit. Visuelle Details werden erst
implementierungsreif, wenn das zustaendige fokussierte `MP-DS-*`-Konzept sie
als verbindlich markiert und ein passender UI-Architektur- oder
Implementierungsplan existiert.

## Sprachregel

Konzeptprosa ist Deutsch. Englisch bleibt dort stehen, wo es sich um stabile
Artefaktnamen, Dateipfade, Token-Namen, Komponentennamen, Statuswerte,
Mock-Seitentitel oder Konzept-IDs handelt.

## Zweck

`MP-DS-00` definiert, wie Mappm Corporate Design, Foundations, statische
Review-Mocks und spaetere Flutter-Design-System-Arbeit organisiert.

Mappm muss ruhig, privat, verlaesslich, warm und professionell wirken. Die App
darf nicht wie ein generisches SaaS-Dashboard, eine medizinische Fachsoftware,
ein Steuerportal oder ein dekoratives Familienalbum wirken.

## Source-of-Truth-Hierarchie

| Quelle | Rolle | Verbindlichkeit |
|---|---|---|
| `docs/design-system/concepts/MP-DS-*.md` | Normative Design-System-Regeln fuer Agents, Architects, Builders und Auditors. | Verbindlich, wenn Status oder Text sie als verbindlich markieren. |
| `docs/design-system/Mock/` | Visuelle Stakeholder- und Review-Flaeche fuer Corporate Design, Foundations und Shell. | Evidenz und Kandidatenquelle, bis Regeln in ein `MP-DS-*`-Konzept promotet werden. |
| `docs/design-system/Decisions/ADR-*.md` | Entscheidungsprotokolle, die erklaeren, warum eine Richtung akzeptiert wurde. | Verbindlich fuer den Entscheidungsbereich, bis ein neuer ADR sie ersetzt. |
| `docs/design-system/Brand/BRAND_DIRECTION.md` | Brand Narrative und Richtungsmaterial. | Brand Input; muss vor Implementierung in Corporate-Design-Konzepten abgebildet sein. |
| `docs/concepts/CONCEPT_F*.md` | Cross-cutting Foundation-/Frontend-Regeln. | Verbindlich fuer technische Umsetzung, sobald sie zur UI-Arbeit passen. |

## Konzeptstruktur

| Konzept | Scope | Status |
|---|---|---|
| `MP-DS-00 Design System Umbrella` | Source-Hierarchie, Konzept-Slicing, Agent-Gates. | draft |
| `MP-DS-01 Foundations And Tokens` | Farbrollen, Icon-Set, Typografie, Spacing, Radius, Elevation, Statusfarben, Token-Promotion. | draft |
| `MP-DS-02 Layout And Shell` | Desktop-/Mobile-Shell, Navigation, Arbeitsflaechen, responsive Verhalten. | draft |
| `MP-DS-03 Corporate Design` | Brand-Idee, Logo-System, Corporate Colors, Voice, Usage Standards. | draft |
| `MP-DS-04 Component System` | Buttons, Formulare, Selection, Navigation, Feedback, Status, Tags, Data Display. | active-draft |
| `MP-DS-05 Product Patterns` | Capture, Processing/Review, Vorgang, Unterlage/Record, Case-Komposition, Vertrag/Abo, Agenda, kontextuelle Aktionen, Export, Settings, Backup/Sync. | active-draft |
| `MP-DS-06 Accessibility And Quality Gates` | Contrast, Keyboard, Text Scale, Visual QA, responsive gates. | active-baseline |
| `MP-DS-07 Platform Adaptation` | macOS, iOS, Android, spaeter Windows/Linux. | active-draft |

## Aktuelle Review-Flaeche

Die aktive visuelle Review-Flaeche ist:

```text
docs/design-system/Mock/index.html
```

## Agent-Regeln

- Keine Flutter-UI implementieren, bevor die relevante UI-Arbeit mindestens
  `MP-DS-01`, `MP-DS-02` und `MP-DS-03` geprueft hat.
- Keine echten privaten Daten in Mock, Screenshots, Fixtures oder Demos.
- Jede sichtbare Design-System-Seite braucht ein konkretes visuelles Beispiel,
  nicht nur Tabellen, Regeltexte oder abstrakte Karten.
- Tag-/Filterchip-Entwuerfe duerfen die bestehende Flutter-`FilterTab`-Sprache
  weiterfuehren: runde Pill-Form, Count-Badge, Coral-Aktivzustand und dezenter
  Shadow.
- Workflow-Label-Entwuerfe duerfen die bestehende Flutter-Workflow-Badge-
  Sprache weiterfuehren: Uppercase, 20px Radius, Pfeile zwischen Schritten,
  farbige Past-/Current-Zustaende, graue Future-Zustaende und Shadow fuer den
  aktuellen Schritt.
- F37-Produktmuster brauchen vor Implementierung phasenbezogene visuelle
  Evidenz fuer Desktop und Mobile. Ein struktureller Umbrella-Mock ersetzt
  keine Auswahl-, Kompositions-, Chart-, Empty-, Error- oder A11y-Zustaende.
- Logo und Farben duerfen aus `assets/images/logo.png` abgeleitet werden, aber
  das aktuelle Logo ist noch kein vollstaendiges Logo-System.
- Coral/Rose ist Brand-Akzent, nicht globale App-Flaeche.

## Stop Rules And Handoff

- Stop, wenn eine UI-Phase ihre exakten `MP-DS-*`- und F-Konzept-Owner nicht
  benennen kann.
- Stop, wenn Mock-Evidenz als Flutter-Implementierungsplan behandelt wird.
- Stop, wenn ein sichtbares Mock-Pattern keinen normativen Konzept-Owner hat.
- Der Handoff an `ui-architect` erfolgt nur aus einer freigegebenen Phase; der
  daraus entstehende Plan wird mit `ui-plan-review` geprueft.
