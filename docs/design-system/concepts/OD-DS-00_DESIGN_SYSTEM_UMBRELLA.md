---
status: draft
provenance:
  language: de
  source_logo:
    - assets/images/logo.png
  reference_structure:
    - /Users/caroline/development/stonehall/matchmia/Documentation/DesignSystem
---

# OD-DS-00 Design System Umbrella

## Status

Draft, aktive Planungsgrundlage.

Dieses Umbrella-Konzept ist verbindlich fuer die Organisation der
Ordna-Design-System-Konzepte, die Source-of-Truth-Klassifikation und das
Verhalten zukuenftiger UI-Arbeit. Visuelle Details werden erst
implementierungsreif, wenn das zustaendige fokussierte `OD-DS-*`-Konzept sie
als verbindlich markiert und ein passender UI-Architektur- oder
Implementierungsplan existiert.

## Sprachregel

Konzeptprosa ist Deutsch. Englisch bleibt dort stehen, wo es sich um stabile
Artefaktnamen, Dateipfade, Token-Namen, Komponentennamen, Statuswerte,
Mock-Seitentitel oder Konzept-IDs handelt.

## Zweck

`OD-DS-00` definiert, wie Ordna Corporate Design, Foundations, statische
Review-Mocks und spaetere Flutter-Design-System-Arbeit organisiert.

Ordna muss ruhig, privat, verlaesslich, warm und professionell wirken. Die App
darf nicht wie ein generisches SaaS-Dashboard, eine medizinische Fachsoftware,
ein Steuerportal oder ein dekoratives Familienalbum wirken.

## Source-of-Truth-Hierarchie

| Quelle | Rolle | Verbindlichkeit |
|---|---|---|
| `docs/design-system/concepts/OD-DS-*.md` | Normative Design-System-Regeln fuer Agents, Architects, Builders und Auditors. | Verbindlich, wenn Status oder Text sie als verbindlich markieren. |
| `docs/design-system/Mock/` | Visuelle Stakeholder- und Review-Flaeche fuer Corporate Design, Foundations und Shell. | Evidenz und Kandidatenquelle, bis Regeln in ein `OD-DS-*`-Konzept promotet werden. |
| `docs/design-system/Decisions/ADR-*.md` | Entscheidungsprotokolle, die erklaeren, warum eine Richtung akzeptiert wurde. | Verbindlich fuer den Entscheidungsbereich, bis ein neuer ADR sie ersetzt. |
| `docs/design-system/Brand/BRAND_DIRECTION.md` | Brand Narrative und Richtungsmaterial. | Brand Input; muss vor Implementierung in Corporate-Design-Konzepten abgebildet sein. |
| `docs/concepts/CONCEPT_F*.md` | Cross-cutting Foundation-/Frontend-Regeln. | Verbindlich fuer technische Umsetzung, sobald sie zur UI-Arbeit passen. |

## Konzeptstruktur

| Konzept | Scope | Status |
|---|---|---|
| `OD-DS-00 Design System Umbrella` | Source-Hierarchie, Konzept-Slicing, Agent-Gates. | draft |
| `OD-DS-01 Foundations And Tokens` | Farbrollen, Icon-Set, Typografie, Spacing, Radius, Elevation, Statusfarben, Token-Promotion. | draft |
| `OD-DS-02 Layout And Shell` | Desktop-/Mobile-Shell, Navigation, Arbeitsflaechen, responsive Verhalten. | draft |
| `OD-DS-03 Corporate Design` | Brand-Idee, Logo-System, Corporate Colors, Voice, Usage Standards. | draft |
| `OD-DS-04 Component System` | Buttons, Formulare, Selection, Navigation, Feedback, Status, Tags, Data Display. | planned |
| `OD-DS-05 Product Patterns` | Capture, Draft Inbox, Vorgang, Dokumentdetail, Export, Settings, Backup/Sync. | planned |
| `OD-DS-06 Accessibility And Quality Gates` | Contrast, Keyboard, Text Scale, Visual QA, responsive gates. | planned |
| `OD-DS-07 Platform Adaptation` | macOS, iOS, Android, spaeter Windows/Linux. | planned |

## Aktuelle Review-Flaeche

Die aktive visuelle Review-Flaeche ist:

```text
docs/design-system/Mock/index.html
```

## Agent-Regeln

- Keine Flutter-UI implementieren, bevor die relevante UI-Arbeit mindestens
  `OD-DS-01`, `OD-DS-02` und `OD-DS-03` geprueft hat.
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
- Logo und Farben duerfen aus `assets/images/logo.png` abgeleitet werden, aber
  das aktuelle Logo ist noch kein vollstaendiges Logo-System.
- Coral/Rose ist Brand-Akzent, nicht globale App-Flaeche.
