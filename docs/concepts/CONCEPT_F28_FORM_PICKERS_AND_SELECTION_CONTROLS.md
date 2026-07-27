---
title: "Konzept F28 - Form Pickers and Selection Controls"
description: "Mappm Detailkonzept fuer Dropdowns, Comboboxes, Multi-Select, Person-/Relation-Picker, Radio-/Checkbox-Buttons, Switches, Segments, Command Rows und Disclosure"
tags: [concept, frontend, design-system, forms, picker, selection, controls, flutter]
lastUpdated: "2026-07-24"
version: "1.1"
status: "accepted"
owner: "ui-concept"
---

# Konzept F28 - Form Pickers and Selection Controls

## Status

Accepted.

F28 ist ein Detailkonzept unter F24. Es macht Auswahl- und Boolean-Controls so
konkret, dass ein Flutter-Agent sie ohne neue Designentscheidung bauen kann.

## Quellen

| Quelle | Rolle |
|---|---|
| `docs/design-system/Mock/pages/component-forms.html` | Statischer Control-Katalog. |
| `docs/design-system/Mock/pages/component-form-interactions.html` | Interaktive Popover-/Sheet-Regeln. |
| F19 | SSOT- und Mock-Promotion-Regeln. |
| F21 | Tokens, Icons, Typografie, Radius. |
| F24 | Form-Family-Umbrella. |
| F27 | Field Anatomy, Required Policy, Validation. |

## Zweck

Mappm-Formulare muessen Review, Korrektur und sichere Entscheidungen fuehren.
Auswahlfelder sind besonders kritisch, weil sie Dokumentgrundart, betroffene Person,
Vorgang, Relation, Kategorie und sensible Folgeprozesse bestimmen.

F28 definiert:

- wann Dropdown, Combobox, Multi-Select oder Picker verwendet wird.
- wie Popover und mobile Sheets aussehen und sich verhalten.
- wie Auswahloptionen strukturiert werden.
- wie Boolean- und Aktionscontrols in Forms eingesetzt werden.

## Control Matrix

| Control | Zweck | Standard-Darstellung |
|---|---|---|
| Dropdown | kleine bis mittlere feste Optionsliste | Button/Field mit Value, Popover oder Sheet |
| Combobox | Suche plus Auswahl plus optionales Erstellen | Eingabe mit Vorschlagsliste |
| Multi Select | wenige sichtbare Optionen | Chips oder Checkbox-Button-Gruppe |
| Multi Select Dropdown | viele Optionen oder wenig Platz | Field mit zusammengefassten Chips, Popover/Sheet |
| Person Picker | betroffene Person, Profil oder Haushalt | eigenstaendiger Picker, nie Freitext |
| Relation Picker | Link zu Vorgang, Dokument, Polizze, Profil | Suchbarer Picker mit Typ/Relation |
| Radio Buttons | genau eine fachliche Option | Option Rows oder kompakte Gruppe |
| Checkbox Buttons | mehrere explizite Ja/Nein-Auswahlen | Buttonartige Checkbox-Liste |
| Switch | dauerhafte Einstellung, sofort verstaendlich | Label plus Switch, kein Workflow-Commit |
| Segmented Control | Moduswechsel im selben Kontext | kleine stabile Segmentleiste |
| Command Row | kontextnahe Mini-Aktionen | Text/Chip-artige Commands, nicht Haupt-CTA |
| Disclosure | optionale Details | aufklappbarer Block mit klarer Ueberschrift |

## Picker Anatomy

Ein Picker besteht immer aus:

1. Field Label nach F27.
2. Control Surface mit aktuellem Wert oder Placeholder.
3. Optionalem Helper/Error/Review Text.
4. Optionsliste mit klarer Option Row.
5. Empty/Loading/Stale/Permission State, wenn Daten extern oder asynchron sind.

Option Row:

- links ein Icon oder semantischer Typ-Token, wenn er fachlich hilft.
- Mitte: Hauptlabel, zweite Zeile fuer Kontext.
- rechts: Status wie `aktiv`, `gesetzt`, `Link` oder leer.
- Auswahlzustand mit Check-Icon, Outline und/oder Token, nie nur Farbe.

Die fruehen Buchstaben-Tokens aus dem Mock sind nur Platzhalter fuer Typ- oder
Icon-Signale. In der Flutter-Umsetzung bevorzugen wir Lucide-Icons oder
initialenfreie Typmarken, wenn Buchstaben keinen echten Mehrwert liefern.

## Dropdown

Verwendung:

- wenige fuer die aktuelle Korrektur relevante Dokumentgrundarten/Varianten.
- Quelle.
- Scan-Modus, wenn keine direkte Kamera-UI aktiv ist.
- kleine taxonomische Felder.

Regeln:

- Dropdown ist keine Suche.
- Optionen sind nicht frei editierbar.
- Eine Option darf Untertitel haben, wenn Konsequenz oder Typ erklaert werden.
- Bei mehr als circa zehn Optionen in Combobox wechseln.
- Der vollstaendige Taxonomiekatalog ist keine normale Dropdown-Liste. Assisted
  Review zeigt die beste Zuordnung und nur wenige relevante Alternativen; eine
  suchbare Gesamtauswahl liegt hinter bewusster Korrektur/Disclosure.
- Desktop: Popover neben/unter dem Feld.
- Mobile: Bottom Sheet mit gleichem Optionsmodell.

## Combobox

Verwendung:

- Anbieter/Aussteller.
- externe Organisationen.
- Orte oder Websites, die aus vorhandenen Daten vorgeschlagen werden.
- Tag-Ergaenzung, wenn Tags frei oder halb-frei sind.

Regeln:

- Eingabe filtert Vorschlaege.
- Freitext darf nur gespeichert werden, wenn das Feld fachlich neue Werte
  erlaubt.
- "Neu anlegen" ist eine eigene Option, keine implizite Enter-Magie.
- Bei sensiblen Feldern keine OCR-Rohdaten als globale Suggestion anzeigen.

## Multi Select

Verwendung:

- Kategorien.
- Tags.
- optionale Eigenschaften, die mehrere Werte haben koennen.

Regeln:

- Chips sind gut fuer bereits gesetzte Werte.
- Checkbox-Button-Liste ist besser fuer aktive Auswahl.
- Multiselect darf Pflichtfeld sein, muss dann aber klar sagen, wie viele
  Werte benoetigt werden.
- Reihenfolge bleibt stabil; ausgewaehlte Werte springen nicht unkontrolliert
  nach oben, solange der Nutzer aktiv waehlt.

## Multi Select Dropdown

Verwendung:

- viele Kategorien/Tags.
- kompakte Desktop-Forms.
- mobile Sheets mit Suchfilter.

Regeln:

- Field zeigt maximal zwei bis drei Chips plus Count.
- Popover/Sheet zeigt alle Optionen mit Checkbox-Icon.
- Auswahl wird live sichtbar, aber Commit bleibt ueber Field/Form gesteuert.
- Kein farbiges Patchwork: Tags nutzen dezente Token aus F21/F34.

## Person Picker

Der Person-/Profil-Picker dient zur Korrektur oder bewussten Auswahl eines
Managed Subject. Er ist nicht pauschal bei jedem Dokument als eigenes
Pflichtfeld sichtbar.

Regeln:

- Es gibt kein stilles "meistens aktives Profil" als fachliche Annahme.
- Globales Capture startet in einem von der Nutzerin sicht- und aenderbar
  gewaehlten Managed-Subject-/Verwaltungskontext; Case-lokales Capture erbt
  diesen bestaetigten Kontext.
- Backend/Core Assist bestimmt keinen Managed Subject und erzeugt aus
  extrahiertem Empfaenger oder Namen keinen Profilkonflikt. Ein optional
  erkannter Empfaenger bleibt getrennte Party-/Suchmetadaten und darf leer
  bleiben.
- Die UI fragt nach dem Managed Subject, wenn noch kein Userkontext gesetzt ist
  oder die Nutzerin ihn bewusst aendert, nicht aufgrund einer semantischen
  Modell-Widerspruchsbehauptung.
- Mehrfach-Personen sind erlaubt, wenn ein Dokument mehrere Personen betrifft.
- Personenauswahl wird in Listen als eigene zweite Meta-Zeile/Chip gezeigt,
  nicht gleichgewichtet mit Dokumentgrundart/Kategorie.
- Sensitive Details aus Profilen erscheinen nicht in globalen Listen.

## Relation Picker

Verwendung:

- Dokument mit einem oder mehreren Vorgängen und typisierten Beziehungen verbinden.
- aus Auswahl einen verbundenen oder übergeordneten Custom Case erstellen.
- verwaltete Person oder Organisation klar von externer Partei unterscheiden.
- Rechnung mit Polizze oder Versicherung verknuepfen.
- Nachweis mit Profilfact verbinden.
- externen Link/App-Kontext hinterlegen.

Regeln:

- Relation Row zeigt Zieltyp, Titel und kurzen Kontext.
- Relation kann optional, empfohlen oder required sein; die Pflicht kommt aus
  dem konkreten Review-Gate.
- Stale/Deleted Targets werden sichtbar gemacht und korrigierbar.
- Ein Dokument darf mehreren Vorgaengen/Relationen zugeordnet werden, ohne
  die Datei zu duplizieren.

## Radio Buttons

Verwendung:

- genau eine Option mit fachlicher Konsequenz.
- Export-Option: Einzeldokument, Vorgang als ZIP, manuelle Auswahl.

Regeln:

- Radio-Optionen brauchen sichtbares Label und optionalen Untertitel.
- Auswahlsymbol muss mittig, klar und tastaturbedienbar sein.
- Bei zwei bis vier gleichgewichtigen Optionen kann Segmented Control besser
  sein, wenn es wirklich ein Moduswechsel ist.

## Checkbox Buttons

Verwendung:

- mehrere unabhaengige Eigenschaften.
- optionale Export-Inhalte.
- lokale Einstellungen, die bewusst gesetzt werden.

Regeln:

- Checkbox Button ist groesser und besser touchbar als klassische Checkbox.
- Checked State nutzt Icon plus Border/Token, nicht nur Flaechenfarbe.
- Jede Option bleibt einzeln fokussierbar.

## Switches

Verwendung:

- Einstellungen mit sofort verstehbarem On/Off.
- Erinnerungen aktivieren.
- optionale, klar erklaerte Datenschutz- oder Anzeigeeinstellungen.

Nicht verwenden fuer:

- irreversible Aktionen.
- komplexe Berechtigungen.
- Review-Abschluss.
- Vault-Autoritaet, Sync, Backup oder Migration.

## Segmented Control

Verwendung:

- Entwurf/Zuletzt/Konflikte nur, wenn es ein Listenmodus ist; sonst FilterTabs
  aus F22 verwenden.
- Zeitbezogene Ansichten wie Monat/Jahr.

Regeln:

- Segments haben stabile Breiten.
- Aktives Segment ist textlich und visuell markiert.
- Keine verschachtelten Segments in Cards.

## Command Row

Verwendung:

- kleine kontextnahe Aktionen: Ersetzen, Entfernen, Retry, Oeffnen, Pruefen.
- Suggestion Actions: Uebernehmen, Bearbeiten/Korrigieren, Ablehnen.

Regeln:

- Hauptaktionen bleiben Buttons nach F26.
- Destruktive Mini-Commands muessen Danger-Stil und Bestaetigungspfad haben,
  wenn Daten verloren gehen.
- Command Rows duerfen nicht die einzige Stelle fuer kritische Aktionen sein.

## Disclosure

Verwendung:

- optionale technische Details.
- seltene Zusatzfelder.
- Diagnose, Rohdaten, OCR-Kontext.

Regeln:

- Standard bleibt geschlossen, wenn Details selten gebraucht werden.
- Inhalt bleibt fokussierbar und screenreader-verstaendlich.
- Keine Pflichtfelder hinter einem geschlossenen Disclosure verstecken.

## Desktop vs Mobile

Desktop:

- Popover fuer Dropdown, Combobox, Multi-Select, Date Picker.
- Inline nur fuer grosse Fokusflaechen oder Settings.
- Tastaturbedienung und Fokusreihenfolge sind Pflicht.

Mobile:

- Bottom Sheet fuer Picker und laengere Optionslisten.
- Grosse Touch Targets.
- Capture-Flow zeigt nur minimale Pflichtauswahl.
- Vollstaendige Korrektur kann spaeter am Desktop erfolgen, aber Pflichtfelder
  oder Gates des konkreten Reviews bleiben sichtbar.

## Flutter Handoff

Implementation soll:

- Controls als Presentation-Komponenten kapseln.
- Daten ueber Domain-Interfaces/Provider laden, nicht direkt aus Data-Layern.
- Optionsmodelle typisiert uebergeben: id, label, subtitle, icon/type, status,
  selected, disabled.
- Popover/Sheet-Verhalten pro Plattform abstrahieren.
- visuelle Tokens aus F21/F34 verwenden.

Keine freie Widget-Erfindung pro Screen.

## Accessibility

- Jede Option hat Semantics-Label mit Auswahlstatus.
- Combobox braucht Tastatursteuerung und Screenreader-Hinweis.
- Multi-Select meldet Anzahl ausgewaehlter Werte.
- Picker sind per Escape/Back dismissbar, ohne ungewollten Commit.
- Fokus bleibt nach Auswahl nachvollziehbar.

## Tests

Mindestens:

- Widget-Test fuer Auswahl, Deselect, Disabled, Empty.
- Keyboard-Test fuer Dropdown/Combobox auf Desktop.
- Mobile-Sheet-Screenshot fuer Person Picker und eine tatsaechlich relevante
  Quellenauswahl.
- Text-Scale-Test mit langen deutschen Labels.
- Privacy-Test: keine sensiblen Rohdaten in globalen Picker-Meldungen.

## Acceptance Criteria

- [ ] Dropdown, Combobox, Multi-Select und Multi-Select Dropdown sind eindeutig
      voneinander abgegrenzt.
- [ ] Person Picker kann notwendige Managed-Subject-Korrekturen abbilden und ist
      nicht als Freitext gebaut.
- [ ] Relation Picker kann Dokumente, Vorgaenge, Profile und Polizzen verlinken.
- [ ] Radio-/Checkbox-/Switch-/Segment-Regeln sind dokumentiert.
- [ ] Desktop Popover und Mobile Sheet folgen demselben Optionsmodell.
- [ ] Accessibility- und Privacy-Regeln sind pruefbar.

## Enterprise Quality Contract

Dieses Konzept uebernimmt
`docs/execution/CONCEPT_ENTERPRISE_QUALITY_CONTRACT.md`. Eigener Scope und
Status bleiben massgeblich. Der gemeinsame Vertrag liefert die verbindlichen
Defaults fuer Ownership, Security/Privacy, Accessibility/Lokalisierung,
Verifikation, Stop Rules und Handoff, soweit dieses Dokument keine strengere
Regel definiert. Ein Widerspruch stoppt die betroffene Phase und wird in diesem
Konzept aufgeloest.
