---
title: "Konzept F26 - Button Family"
description: "Detaillierte Mappm Design-System-Spezifikation fuer Buttons, Commands, Button-Zustaende, Groessen, Icon-Nutzung, Dark/Inverse Varianten, Accessibility und Flutter-Handoff"
tags: [concept, frontend, design-system, buttons, commands, accessibility, flutter, production-readiness]
lastUpdated: "2026-07-15"
version: "1.1"
status: "accepted"
owner: "ui-concept"
---
# Konzept F26 - Button Family

## Status

Angenommen.

Dieses Konzept ist die build-relevante Source of Truth fuer Buttons und
Command-Hierarchien in Mappm. Der HTML-Mock bleibt visuelle Evidenz, aber ein
Flutter- oder UI-Agent muss die Button Family aus diesem Konzept verstehen und
umsetzen koennen, ohne die Mock-Seite zwingend zu oeffnen.

## Roadmap-Verankerung

| Ebene | Verankerung |
|---|---|
| Roadmap | R4 Capture and Review Core |
| Phase/Subphase | C2/C3 UX-/A11y-Gate, Desktop Import + Capture Inbox, Document/Record Metadata Core |
| Pillars | Design System/UX, Capture & Inbox, Cases/Documents/Records, Export/External Actions, Security/Privacy, QA |
| Uebergeordnete Konzepte | F19 Design System Governance, F21 Foundations and Tokens, F23 Component System, F25 Accessibility Patterns and Visual QA |
| Mock-Evidenz | `docs/design-system/Mock/pages/component-buttons.html` |

## Zweck

Mappm verarbeitet private Dokumente. Buttons sind deshalb keine Dekoration,
sondern sichere Handlungsoberflaeche:

- Sie zeigen, was die naechste Handlung ist.
- Sie verhindern konkurrierende Hauptaktionen.
- Sie machen riskante oder irreversible Aktionen explizit.
- Sie bleiben auf Desktop, Mobile, Dark Surfaces und warmen Papierflaechen
  konsistent.
- Sie sind tastaturbedienbar und screenreader-verstaendlich.

## Designprinzipien

1. Eine klare Hauptaktion pro Arbeitskontext.
2. Button-Bedeutung entsteht aus Rolle, Text, Position, Icon, Zustand und
   Kontext, nicht nur aus Farbe.
3. Buttons verwenden semantische Design-Tokens, keine freien Hexwerte.
4. Icon-only ist eine Ausnahme fuer bekannte Toolbar-Aktionen.
5. Destruktive Aktionen brauchen Text, Risiko-Kontext und Bestaetigung.
6. Loading, Disabled und Focus sind Pflichtzustaende, nicht spaetere Politur.
7. Mobile Buttons duerfen groesser und block-level sein, aber nicht neue
   semantische Rollen erfinden.

## Anatomie

Ein Mappm Button besteht aus:

| Teil | Pflicht | Regel |
|---|---|---|
| Rolle | ja | `primary`, `secondary`, `light`, `textOnly`, `iconOnly`, `danger`, `inverse` |
| Visuelle Variante | falls noetig | `strongBorder`, `dangerLight`, `inverseSecondary`, `inverseText` |
| Label | ja, ausser Icon-only | Verb + Objekt, z. B. "Dokument scannen" |
| Icon | optional | Lucide/Produkt-Icon, erbt Textfarbe |
| Barrierefreier Name | ja | Bei Icon-only immer explizit, sonst Label als Name |
| Zustand | ja | default, hover, focus, pressed, loading, disabled |
| Groesse | ja | small, default, large, block |
| Kontext | ja | Arbeitskontext bestimmt Rolle und Prioritaet |
| Risikogrenze | falls noetig | destruktiv, sensibler Export, privacy-relevant |

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

## Rollenkatalog

### Primary

Zweck:

Die eindeutige Hauptaktion im aktuellen Arbeitskontext.

Verwenden fuer:

- Dokument scannen.
- Pruefung abschliessen.
- Scan verwenden.
- Speichern.
- Anmeldung oder Gerätevertrauen bestaetigen.

Visuelle Regel:

- Coral / Capture-Familie.
- hoher Kontrast.
- nur eine sichtbare Primary-Aktion je Kontext.

Nicht verwenden fuer:

- mehrere gleichwertige Alternativen.
- Loeschen.
- stille Navigation.
- Status-Badges.

Abnahmeregel:

- Ein Dialog, Screen, Sheet oder Card-Flow darf maximal eine Primary-Aktion
  sichtbar zeigen.
- Wenn die Primary-Aktion blockiert ist, wird sie disabled und der Grund muss
  in direktem Kontext sichtbar sein.

### Secondary

Zweck:

Wichtige Alternative ohne Hauptfluss-Dominanz.

Verwenden fuer:

- Datei importieren.
- Zurueck in Entwuerfe.
- Einzeldokument laden.
- Vorgang als ZIP.
- Neu scannen.

Visuelle Regel:

- neutrale Outline.
- weisse oder helle Surface.
- keine starke Flaeche.

Nicht verwenden fuer:

- Loeschen.
- primaere Capture-/Review-Aktionen.
- Status oder Auswahlzustaende.

### Light State

Zweck:

Aktive, empfohlene, kontextuell wichtige oder ausgewaehlte Handlung, die
weniger dominant ist als Primary.

Verwenden fuer:

- In Eingang behalten.
- Als erledigt markieren.
- Vorgang oeffnen / Vorgang-Link in Dokumentzeile.
- Tag setzen in Toolbar.
- empfohlene aber nicht finale Aktion.

Visuelle Regel:

- Petrol Mist Background.
- Petrol Border.
- Petrol Deep Text.

Nicht verwenden fuer:

- Status-Badges.
- Validierungserfolg.
- mehrere dekorative Highlight-Buttons.

### Text Only

Zweck:

Leise Navigation oder Dismiss-Aktion.

Verwenden fuer:

- Abbrechen.
- Spaeter.
- Zurueck.
- Als Foto behalten, wenn es bewusst untergeordnet ist.

Visuelle Regel:

- transparente Flaeche.
- keine Border.
- Ink Text.
- `ghost` ist ein kompatibler Alias fuer dieselbe visuelle Rolle und darf nicht
  als neue semantische Rolle eingefuehrt werden.

Nicht verwenden fuer:

- Hauptaktionen.
- Gefahrenaktionen.
- Aktionen, die Nutzer leicht uebersehen duerfen.

### Icon Only

Zweck:

Kompakte, bekannte Toolbar-Aktion, wenn Platz knapp ist und Wiedererkennung
hoch ist.

Erlaubte Beispiele:

- Bearbeiten.
- Suchen.
- Tag setzen.
- Weitere Aktionen.

Verbindliche Regeln:

- Immer mit Accessibility Label.
- Immer mit Tooltip oder gleichwertigem Hover-/Long-press-Hint im spaeteren
  Produkt.
- Nicht fuer Loeschen, Export, Recovery, Backup, Sync-Retry mit Risiko oder
  sicherheitsrelevante Aktionen.
- Nicht fuer Aktionen, deren Bedeutung ohne Text zweifelhaft ist.

### Danger

Zweck:

Destruktive oder irreversible Aktionen.

Verwenden fuer:

- Entwurf loeschen.
- Datei entfernen.
- Token widerrufen.
- Upload abbrechen, wenn Daten verloren gehen koennen.

Visuelle Regel:

- Danger Brick fuer volle Danger-Aktion.
- Danger Light fuer mildere oder bestaetigte Entfernen-Aktion auf warmer
  Surface.

Verbindliche Regeln:

- Nie icon-only.
- Nie nur durch Farbe erklaeren.
- Braucht klaren Text.
- Braucht Bestaetigung, wenn Datenverlust, Rechtegrenze oder nicht-triviale
  Wiederherstellung betroffen ist.

### Inverse / Dark

Zweck:

Buttons auf dunklen Shell-, Diagnose- oder technischen Flaechen.

Verwenden fuer:

- Sync pruefen.
- Details in dunkler Diagnoseflaeche.
- Schliessen in dunklem Panel.

Visuelle Regel:

- Inverse Primary: helle Flaeche auf dunkler Surface.
- Inverse Secondary: transparente/dunkle Flaeche mit heller Border.
- Inverse Text: heller Text ohne Flaeche.

Nicht verwenden:

- Normale Primary-Buttons blind auf dunkle Flaechen kopieren.
- Coral auf dunklen Flaechen ohne Kontrastpruefung verwenden.

## Varianten- und Alias-Zuordnung

Diese Varianten duerfen in Implementierungen als eigene visuelle Parameter
existieren, aber sie sind keine neuen fachlichen Rollen.

| Variante / Alias | Basisrolle | Bedeutung | Regel |
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

## Groessen- und Dichtekatalog

| Groesse | Mindesthoehe | Verwendung |
|---|---:|---|
| small | 32 px | Tabellenzeilen, kompakte Toolbars, Inline-Aktionen |
| default | 40 px | normale Dialoge, Karten, Detailseiten, Formulare |
| large | 52 px | Capture, mobile Hauptaktion, Wizard-Abschluss |
| block | container width | mobile Sheets, Bottom Areas, fokussierte One-Step-Flows |

Regeln:

- Small darf nur fuer sekundaere oder Toolbar-nahe Aktionen verwendet werden.
- Primary darf default oder large sein; auf Mobile bevorzugt large/block.
- Block ist eine Layout-Variante, keine eigene Rolle.
- Text muss in Button-Bounds bleiben; bei block darf Text umbrechen, bei
  kompakten Buttons muss der Labeltext kurz genug sein.

## Zustandskatalog

| Zustand | Bedeutung | Visuelle-/Verhaltensregel |
|---|---|---|
| default | normale Aktionsbereitschaft | stabile Flaeche, kein Layoutshift |
| hover | Pointer ueber Aktion | leichte Elevation oder Kontrast, keine Groessenaenderung |
| focus | Tastaturfokus | sichtbarer Fokus-Ring, ausreichend Kontrast |
| pressed | Aktion wird gedrueckt | kleine Rueckmeldung, kein dauerhafter Zustand |
| loading | Aktion laeuft | Busy-Indikator, Wiederholung blockiert |
| disabled | Aktion aktuell nicht moeglich | sichtbar inaktiv, Grund im Kontext erklaert |

Loading-Regeln:

- Loading blockiert erneutes Ausloesen.
- Loading darf nicht sensible Daten im Buttontext anzeigen.
- Loading-Label sagt technische Handlung, z. B. "Wird gespeichert", nicht
  private Dokumentdetails.

Disabled-Regeln:

- Disabled ist erlaubt, wenn eine Aktion objektiv nicht ausfuehrbar ist.
- Der Grund muss in der Naehe sichtbar sein, z. B. "1 Pflichtfeld fehlt".
- Disabled darf nicht als Ersatz fuer Validierungsfeedback missbraucht werden.

Fokusregeln:

- Focus muss per Tastatur sichtbar sein.
- Focus darf nicht nur Farbe sein, sondern braucht Ring/Outline.
- Focus darf keine Layoutverschiebung erzeugen.

## Icon-Regeln

Icon-Quelle:

- Produkt-Icons folgen F21 Icon System.
- Standard ist ein ruhiges Outline-Icon mit einheitlicher Stroke-Staerke.
- Icons erben die Button-Textfarbe.

Icon und Text sind erforderlich fuer:

- Capture.
- Export.
- Delete.
- Anmeldung, Recovery oder Gerätevertrauen.
- Backup.
- sicherheits- oder privacy-relevante Aktionen.

Icon ist optional fuer:

- Secondary Navigation.
- Retry.
- View/Open.
- Tags.

Icon-only ist nur erlaubt, wenn:

- Aktion wiederholt in einer Toolbar erscheint.
- Bedeutung durch Umgebung klar ist.
- Accessibility Label vorhanden ist.
- Tooltip/Hint vorgesehen ist.

## Kontextmuster

### Review eines Entwurfs

Ziel:

Nutzer prueft einen Entwurf und schliesst Review erst ab, wenn harte Gates
erfuellt sind.

Empfohlene Aktionshierarchie:

```text
Primary:    Pruefung abschliessen
Secondary:  Zurueck in Entwuerfe
Text only:  Spaeter / Abbrechen
Danger:     Entwurf loeschen, getrennt und bestaetigt
```

Wenn Pflichtangaben fehlen:

- Primary ist disabled.
- Inline-/Formularfeedback erklaert die fehlende Anforderung.
- Es gibt keinen scheinbar erfolgreichen Abschlussbutton.

### Document Row Toolbar

Ziel:

Dichte Dokumentlisten bleiben scanbar.

Empfohlene Hierarchie:

```text
Secondary small: Oeffnen
Light small:     Vorgang
Icon-only small: Bearbeiten, Weitere Aktionen
```

Regeln:

- Keine vollbreite Primary-Aktion in dichten Zeilen.
- Keine destruktive Aktion direkt sichtbar, ausser im expliziten
  Bearbeitungskontext.
- Sensible Details bleiben aus Toolbar-Labels entfernt.

### Export

Ziel:

Nutzer entscheidet lokal, was heruntergeladen wird.

Empfohlene Hierarchie:

```text
Secondary: Einzeldokument laden
Secondary: Vorgang als ZIP
Text only: Abbrechen
```

Regeln:

- Kein Button fuer einen externen Sharing-Link.
- Der Exportkontext darf einen Privacy-Hinweis zeigen; der Aktionstext bleibt
  neutral.
- Mehrere Dokumente werden als Paket/ZIP exportiert, ein einzelnes Dokument
  ohne unnoetige Verpackung.

### Mobile Capture

Ziel:

Capture-first UI mit einer eindeutigen Hauptaktion.

Empfohlene Hierarchie:

```text
Primary block large: Scan verwenden
Secondary block:     Neu scannen
Text only block:     Als Foto behalten
```

Regeln:

- Die Hauptaktion ist large/block.
- Eine sekundaere Korrekturaktion bleibt erreichbar.
- Bei unzureichender Scanqualitaet bleibt der Bild-/Fotopfad erhalten.

### Dark Diagnostics / Shell Surface

Ziel:

Aktionen auf dunklen Flaechen bleiben lesbar, ohne die normale Coral-Primary-
Darstellung ungeprueft zu uebernehmen.

Empfohlene Hierarchie:

```text
Inverse:           Sync pruefen
Inverse secondary: Details
Inverse text:      Schliessen
```

Regeln:

- Varianten fuer dunkle Flaechen sind vollwertige Zustaende.
- Kontrast wird gegen den konkreten dunklen Hintergrund geprueft.

## Textregeln

Button-Labels sollen:

- Verben verwenden.
- das Aktionsobjekt nennen.
- fuer deutsche Labels kurz genug bleiben.
- technische Implementierungsbegriffe vermeiden.
- sensible Dokumentdetails vermeiden.

Gut:

- Dokument scannen
- Datei importieren
- Pruefung abschliessen
- Vorgang als ZIP
- Neu scannen
- Entwurf loeschen

Vermeiden:

- OK
- Submit
- Start process
- Delete
- Upload private invoice 2026
- Share access

## Privacy- und Security-Regeln

Buttons duerfen nicht:

- private Dokumenttitel in globalen/geteilten Button-Labels enthalten.
- OCR-Text, Versicherungsnummern, Gesundheitsdetails oder Kindernamen in
  generischen Command-Labels enthalten.
- externen Zugriff suggerieren, wenn keiner besteht.
- Export/Sharing ohne lokale Bestaetigung ausloesen, wenn sensible Dokumente
  die App-Grenze verlassen koennen.

Danger- und Exportaktionen muessen:

- die Aktion klar benennen.
- die Folge im umgebenden Text/Dialog zeigen.
- bei destruktiver oder privacy-relevanter Wirkung eine Bestaetigung nutzen.

## Accessibility-Regeln

Jeder Button braucht:

- barrierefreien Namen.
- sichtbaren Fokuszustand.
- ausreichenden Kontrast.
- semantischen Enabled-/Disabled-Zustand.
- Tastaturaktivierung.
- stabile Touch-/Klickflaeche.

Icon-only-Buttons brauchen zusaetzlich:

- explizites Accessibility Label.
- Tooltip oder gleichwertigen Hinweis.
- keine nur versteckt erschliessbare Bedeutung.

Loading-Buttons brauchen:

- Busy-Semantik.
- blockierte Wiederholung.
- ein weiterhin verstaendliches Label.

Disabled-Buttons brauchen:

- Disabled-Semantik.
- sichtbaren Grund in der Naehe.

## Responsive-Regeln

Desktop:

- Button-Gruppen duerfen umbrechen.
- Dichte Toolbars verwenden small/default.
- Karten und Dialoge behalten eine vorhersehbare
  Primary-/Secondary-/Text-Reihenfolge.

Tablet / narrow desktop:

- Die Sidebar darf neben dem Inhalt bleiben.
- Button-Gruppen umbrechen statt ueberzulaufen.
- Lange Labels bleiben innerhalb ihres Buttons.

Mobile:

- Primary-Aktionen werden haeufig large/block.
- Secondary und Text-only duerfen darunter gestapelt werden.
- Icon-only bleibt auf kompakte Toolbar-Zeilen begrenzt.
- Kein horizontaler Overflow.

## Implementierungs-Handoff

Dieses Konzept schreibt bewusst keinen konkreten Flutter-Widget-Klassennamen
vor. Der Implementation Plan definiert eine gemeinsame Design-System-Button-
Flaeche, die Folgendes ausdruecken kann:

- Rolle.
- Groesse.
- Zustand.
- optionales fuehrendes Icon.
- Icon-only-Modus.
- Block-/Full-width-Layout.
- Danger-/Sensitive-/Export-Kontext.
- Loading- und Disabled-Semantik.
- Tooltip/Accessibility Label fuer Icon-only.

Die Flutter-Implementierung erstellt keine eigenen Ad-hoc-Button-Widgets pro
Feature. Screens verwenden die gemeinsame Button-Family-API und entscheiden
nur Rolle, Label, Icon, Zustand und Callback aus ihrem Presentation State.

Clean-Architecture-Grenze:

- Button-Komponenten gehoeren zu Presentation/Design System.
- Buttons duerfen Labels, Rollen, Zustaende und Callbacks erhalten.
- Buttons importieren weder Data, Repositories, Drift, HTTP, File Storage noch
  Secure Storage.
- Screens, Controller oder Provider liefern Callbacks; nicht die
  Button-Komponente selbst.

## Test- und Verifikationsanforderungen

Jeder Implementation Plan und Flutter-Build muss abdecken:

- Golden-/visuelle Evidenz fuer alle Rollen.
- Verifikation von Focus, Disabled und Loading.
- Accessibility-Label-Test fuer Icon-only.
- Overflow-Test fuer Mobile/schmale Breiten.
- Kontrastpruefung fuer Dark/Inverse.
- keine destruktive Aktion als Icon-only.
- keine mehreren sichtbaren Primary-Aktionen in einem Kontext, ausser ein
  spaeter akzeptiertes Konzept begruendet dies explizit.

## Abnahmekriterien

Die Button Family ist implementationsbereit, wenn:

- alle Rollen dieses Konzepts im Design-System-Layer existieren.
- alle Zustaende visuell und semantisch abgebildet sind.
- alle Groessen unterstuetzt sind.
- Icon-only ein erzwungenes Accessibility Label besitzt.
- Gefahraktionen nicht als unbeschriftete Icon-only-Controls darstellbar sind.
- Review/Audit Primary auf eine sichtbare Hauptaktion pro Kontext begrenzt.
- Mobile-Block-Buttons und dichte Desktop-Toolbar-Buttons abgedeckt sind.
- Tests/Visual Review Overflow, fehlenden Fokus und fehlende Labels finden.

## Nichtziele

- Dieses Konzept definiert keine Status-Badges.
- Dieses Konzept definiert keine Tag-Chips.
- Dieses Konzept definiert keine Formular-Controls.
- Dieses Konzept definiert keine Navigation Tabs oder Segmented Controls.
- Dieses Konzept definiert keine Backend-Aktionen oder Repository-Logik.

## Verwandte Konzepte

- F19 Design System Governance and SSOT.
- F21 Foundations and Tokens.
- F22 Shell and Navigation.
- F23 Component System.
- F24 Form Family.
- F25 Accessibility Patterns and Visual QA.

## Enterprise Quality Contract

Dieses Konzept uebernimmt
`docs/execution/CONCEPT_ENTERPRISE_QUALITY_CONTRACT.md`. Sein eigener Scope und
Status bleiben massgeblich. Der gemeinsame Vertrag liefert verbindliche
Defaults fuer Ownership, Security/Privacy, Accessibility/Lokalisierung,
Verifikation, Stop Rules und Handoff, soweit dieses Dokument keine strengere
Regel definiert. Ein Widerspruch stoppt die betroffene Phase und wird in diesem
Konzept aufgeloest.
