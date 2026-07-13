---
title: "Konzept F34 - Status, Tags, Feedback and Data Display"
description: "Mappm Detailkonzept fuer Statussignale, Tags, Callouts, Empty/Error Feedback, Dokumentzeilen, Typfarben, Fact-Gruppen und Timelines"
tags: [concept, frontend, design-system, components, status, tags, feedback, data-display, flutter]
lastUpdated: "2026-07-14"
version: "1.0"
status: "accepted"
---

# Konzept F34 - Status, Tags, Feedback and Data Display

## Status

Accepted.

F34 ist das Detailkonzept unter F23. Es deckt die komponentennahen Seiten ab,
die nicht Button- oder Form-spezifisch sind.

## Quellen

| Quelle | Rolle |
|---|---|
| `docs/design-system/Mock/pages/components.html` | Komponenten-Uebersicht und Kompositionsbeispiel. |
| `docs/design-system/Mock/pages/component-status.html` | Statussignale und Workflow Badges. |
| `docs/design-system/Mock/pages/component-tags.html` | Tags und Filterchips. |
| `docs/design-system/Mock/pages/component-feedback.html` | Feedback, Callouts, Empty/Error. |
| `docs/design-system/Mock/pages/data-display.html` | Dokumentzeilen, Facts, Timelines. |
| F21/F32 | Tokens, Icons, Typografie. |
| F23 | Component System Umbrella. |
| F26 | Buttons. |
| F27-F30 | Forms. |

## Component Principle

Mappm-Komponenten sind fuer Dokumentarbeit, nicht fuer Marketing.

Sie muessen:

- schnell scanbar sein.
- wenig Farbe verschwenden.
- Bedeutung textlich tragen.
- sensible Details kontrollieren.
- wiederverwendbar und testbar sein.

## Status Signals

Status hilft beim Entscheiden, ohne private Details preiszugeben.

Statusfamilien:

| Status | Token | Verwendung |
|---|---|---|
| Entwurf/Review | Warning Amber | Review noetig, einzureichen, Frist |
| Erledigt/Aktuell | Success Sage | abgelegt, aktuell, gesichert |
| Sync/Queue | Info Petrol | Upload wartet, Sync aktiv |
| Sensibel/Privacy | Privacy Plum | sensible Daten, Exportwarnung |
| Konflikt/Fehler | Danger Brick | Konflikt, fehlgeschlagen, blockierend |
| Neutral | Neutral Surface | ruhige Labels wie Entwurf/Aktuell in Listen |

Regeln:

- Status ist kein Tag.
- Status duerfen nicht nur ueber Farbe verstanden werden.
- In dichten Listen sind Status-Badges farblich sparsam.
- Farbe wird staerker nur bei blockierender Handlung oder Systemmeldung.

## Workflow Labels

Verwendung:

- Dokument-/Vorgangsstatus.
- Claim-/Einreichungsstatus.
- Queue-/Sync-Zustand.

Regeln:

- Label sagt aktuellen Zustand, nicht Kategorie.
- Workflow-Labels duerfen in Headern, Rows und Detailseiten erscheinen.
- Status-Historie gehoert in Timeline oder Verlauf, nicht in eine Chip-Wolke.

## Tags

Tags helfen beim Wiederfinden, ersetzen aber keinen Status.

Verwendung:

- Gesundheit.
- Zusatzversicherung.
- Steuer.
- Fristnah.
- frei/halb-frei definierte Ordnung.

Regeln:

- Tags sind filterbar und editierbar.
- Tags haben keine Workflow-Bedeutung.
- Tags nutzen dezente Petrol/Neutral-Tokens, nicht beliebige Farben.
- Aktiver Filter darf staerker markiert sein als normaler Tag.
- Personenbezug ist kein Tag-Ersatz; Person/Profil bleibt eigenes Feld.
- Organisationsprofil, externe Partei und Person verwenden unterscheidbare,
  semantische Typkennzeichnung; Farbe allein reicht nicht.

Schlanke Finanzdarstellung folgt F37: keine leere Sektion, kein Chart für einen
Wert, kleine Linienverläufe nur für bestätigte vergleichbare Perioden und immer
mit Hover-/Tap-/Focus- sowie Screenreader-Alternative.

## Callouts

Callouts sind fuer laengere, seitenspezifische Systemmeldungen reserviert.

Anatomy:

- ruhige Card mit Border.
- kleiner semantischer Icon-Token links.
- dezenter Farbakzent ueber oberes/linkes Eck.
- Titel plus erklaerende naechste Aktion.
- keine flaechenfuellenden Alarmfarben.

Verwendung:

- Upload wartet.
- Review unvollstaendig.
- Sensibler Export.
- Export nicht erstellt.
- Component/Privacy Gate.

Regeln:

- Callout ersetzt keine Inline-Fehler in Forms.
- Callout ersetzt keine Queue-Zeile.
- Callout zeigt keine privaten Dokumentdetails.
- Icon kommt aus F32, keine Buchstaben-Codes.

## Feedback Boundaries

| Feedback | Verwendung |
|---|---|
| Snackbar/Toast | kurze bestaetigte Aktion, z. B. Draft saved |
| Inline Error | Feldfehler direkt am Control |
| Queue Row | Upload/Sync eines konkreten lokalen Items |
| Empty State | leerer Bereich mit naechster Aktion |
| Callout | laengere seitenspezifische Systemmeldung |
| Dialog | irreversible, kritische oder blockierende Entscheidung |

Regeln:

- Snackbar nie fuer Pflichtfeldfehler.
- Empty State soll Handlung anbieten.
- Queue Row zeigt Datei/Status nur im passenden lokalen Kontext.

## Data Display

### Dokumentzeile

Anatomy:

1. Typmarke/Icon links.
2. Titel.
3. Fachliche Meta-Zeile: Dokumentfamilie/Kategorie/Vorgang.
4. Personen-/Profil-Chip als eigene Zeile oder klar getrennte Meta.
5. ruhiger Status rechts.
6. optional Chevron/Action.

Regeln:

- Person nicht gleichgewichten wie Dokumenttyp/Kategorie.
- Status rechts bleibt farbsparsam, ausser bei Konflikt/blockierend.
- Typmarken nutzen CD-konforme Palette, nicht zufaellige Farben.
- Bedeutung bleibt ueber Titel und Typtext, nicht nur ueber Farbe/Buchstabe.

### Typmarken

Zweck:

- schnelle visuelle Gruppierung von Dokumentfamilien.

Regeln:

- Farbsets muessen aus F32 abgeleitet sein.
- Typmarke darf nicht wie ein defekter Buchstabenblock wirken.
- Wenn ein Lucide-Icon mehr Aussagekraft hat, Icon bevorzugen.
- Typfarben sind dezente Hintergruende mit klarem Kontrast.

### Fact Gruppe

Verwendung:

- Betrag.
- Status.
- Erstattung.
- verknuepfte Dokumente.
- Gueltigkeit.
- laufende Kosten.

Regeln:

- Facts sind kompakte Kacheln oder Rows.
- sensible Werte im falschen Kontext maskieren.
- berechnete Werte als readonly kennzeichnen.
- Fact-Gruppen duerfen Auswertungen vorbereiten.

### Timeline

Verwendung:

- Scan empfangen.
- Review abgeschlossen.
- Eingereicht.
- Erstattung erhalten.
- Als ZIP exportiert.

Regeln:

- Timeline ist Verlauf, nicht aktuelle Statusanzeige.
- Timeline-Eintraege brauchen Datum/Zeit, wenn produktiv.
- technische Eintraege in Diagnosekontext trennen.

## Composition Rules

- Keine Cards in Cards, ausser bewusst gerahmtes Tool/Dialog/Komposition.
- Buttons nach F26, Forms nach F27-F30.
- Tags, Status und Callouts nicht mischen.
- Datenschutzrelevante Bedeutung textlich sichtbar machen.

## Flutter Handoff

Implementation soll:

- Status, Tag, Callout, Document Row, Fact Group und Timeline als zentrale
  Presentation-Komponenten bereitstellen.
- Status-/Tag-Modelle fachlich typisieren.
- keine freien Farben pro Screen erlauben.
- Rows responsiv und text-scale-stabil machen.

## Tests

Mindestens:

- Status Badge Varianten.
- Tag active/normal/disabled.
- Callout Varianten mit Icon und ohne private Details.
- Document Row mit langen deutschen Titeln, Person-Chip und Status.
- Fact Group responsive.
- Timeline leer/mehrere Eintraege.

## Acceptance Criteria

- [ ] Status und Tags sind fachlich getrennt.
- [ ] Callouts nutzen moderne, farbsparsame Akzentmarkierung mit Icon.
- [ ] Dokumentzeilen trennen Typ/Kategorie von Person/Profil.
- [ ] Typfarben passen zur Corporate Palette.
- [ ] Fact-Gruppen und Timelines sind fuer Auswertungen/Verlauf vorbereitet.

## Enterprise Quality Contract

This concept adopts `docs/execution/CONCEPT_ENTERPRISE_QUALITY_CONTRACT.md`.
Its own scope and status remain authoritative; the shared contract supplies the
mandatory ownership, security/privacy, accessibility/localization, verification,
stop-rule and handoff defaults wherever this file does not define a stricter
rule. Any conflict must stop the affected phase and be resolved in this concept.
