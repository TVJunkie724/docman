---
title: "Konzept F35 - Product Patterns, Accessibility and Visual QA Detail"
description: "Mappm Detailkonzept fuer zentrale Produktmuster, Accessibility-Gates, Privacy UI Gates und visuelle QA"
tags: [concept, frontend, design-system, patterns, accessibility, privacy, visual-qa, production-readiness]
lastUpdated: "2026-07-15"
version: "1.1"
status: "accepted"
owner: "ui-concept"
---

# Konzept F35 - Product Patterns, Accessibility and Visual QA Detail

## Status

Accepted.

F35 ist das Detailkonzept unter F25. Es macht die Pattern- und QA-Seiten aus
dem Mock zu verbindlichen Gates fuer Flutter-Planung, Umsetzung und Audit.

## Quellen

| Quelle | Rolle |
|---|---|
| `docs/design-system/Mock/pages/patterns.html` | zentrale Product Patterns. |
| `docs/design-system/Mock/pages/component-accessibility.html` | A11y- und QA-Gates. |
| F25 | Accessibility/Patterns Umbrella. |
| F31-F34 | Brand, Foundations, Shell und Komponenten. |
| F37 | Vorgang/Unterlage, Custom Case, Review-Aktionen, Abo, Agenda und schlanke Insights. |

## Product Patterns

Patterns sind keine finalen Screens, sondern wiederkehrende Arbeitsablaeufe.
Jeder spaetere Screen muss das passende Pattern lesen.

### Capture

Zweck:

- Mobile Scan.
- Foto.
- Dateiimport.
- Desktop Drag and Drop.

Pflicht:

- Quelle und Dateityp sichtbar.
- Managed Subject wird vorgeschlagen und nur bei Relevanz kompakt korrigiert.
- Upload/Queue-Zustand privacy-sicher.
- schlechte Scans korrigierbar.

### Processing and Proposal Review

Zweck:

- neue Dokumentgrenzen, Titel und Zuordnungen kompakt pruefen.
- nur sichtbare relevante Konsequenzen bestaetigen oder korrigieren.
- zuletzt verarbeitete Dokumente schnell korrigieren.

Pflicht:

- verarbeitende und pruefbereite Capture-Einheiten.
- zuletzt verarbeitet.
- Konflikte/Fehler, wenn vorhanden.
- bester Case-/Record-Vorschlag plus neuer leichter Custom Case bei Bedarf.
- generierter editierbarer Titel; kein leeres Titel-/Metadatenformular.
- Mixed-Batch-Outlier und Partial Failure ohne Verlust der restlichen Session.

### Document Detail

Zweck:

- Preview.
- Metadaten.
- Facts.
- Beziehungen.
- Aktionen.

Pflicht:

- Dokumentinhalt und Facts getrennt.
- Export/Download klar.
- sensible Werte kontrolliert.
- Beziehungen zu Vorgang, Profil, Polizze sichtbar.

### Case, Record and Contextual Experience

F37 owns:

- gleichwertige Bereiche `Vorgaenge` und `Unterlagen`;
- Custom/Guided Case parity und reversible Multi-select-Komposition;
- kontextuelle Review-Aktionen statt universeller Optionswand;
- Vertrags-/Abo-Kontext mit minimalem Rechnungsverlauf;
- fokussierte Agenda und dynamische Finanzsektionen;
- Managed-Person-/Organization-Kontext ohne Privat-/Business-Vermischung.

### Export

Zweck:

- Einzeldokument herunterladen.
- mehrere Dokumente/Vorgang als ZIP herunterladen.
- manuelle Weitergabe ausserhalb der App.

Nicht-Ziel:

- kein Account-zu-Account-Sharing als Nebenwirkung des Exports.
- kein externer Zugriff ohne eigenen Security-/Contract-Flow.
- keine automatische Einreichung ohne spaetere explizite Produkt-, Legal- und
  Integrationsfreigabe.

### Settings

Zweck:

- Mappm Account/Gerät, Vault-Autorität, Assist-Entitlement, Migration und
  Detached Recovery.
- autorisierte Geraete und Sessions.
- lokale Verfuegbarkeit, Cache und Speicherbedarf.
- Diagnose.
- sichere lokale Konfiguration.

Pflicht:

- technische Details nur im passenden Kontext.
- keine Dokumentdetails in Logs/Diagnose.

### Conflict Resolution

Zweck:

- Sync-/Review-Konflikte sichtbar und loesbar machen.

Pflicht:

- Dashboard zeigt Konflikte nur bei Bedarf.
- eigene Konfliktseite zeigt Details.
- Optionen sind lokal behalten, andere Version, manuell loesen.

## Accessibility Gates

Jede UI-Umsetzung muss pruefen:

- Textkontrast.
- Focus sichtbar.
- Tastaturbedienung.
- Touch Targets.
- Text Scale/lange deutsche Labels.
- Screenreader Labels.
- Reduced Motion.
- Fehler nicht nur ueber Farbe.

## Privacy UI Gates

Nicht erlaubt in globalen Meldungen:

- OCR-Text.
- Arzt-/Gesundheitsdetails.
- Versicherungsnummern.
- Ausweisnummern.
- private Dokumenttitel, wenn nicht im aktiven Detailkontext.
- Rohfehler mit sensiblen Payloads.

Erlaubt:

- `Upload wartet.`
- `Review unvollstaendig.`
- `Export nicht erstellt.`
- technische Ursache ohne private Details.

## Visual QA Gates

Vor Merge:

- Desktop Screenshot.
- Mobile Screenshot.
- relevante leere/geladene/fehlerhafte Zustaende.
- Text Scale/long labels.
- kein Overlap.
- keine blanken Hauptbereiche.
- kein Menu ueber Content.
- Tokens gegen F31/F32 geprueft.

## Agent Handoff

Jeder UI-Agent nennt im Handoff:

- gelesene Konzepte.
- relevante Mock-Seiten.
- umgesetzte Pattern.
- responsive Breakpoints.
- Accessibility Checks.
- Privacy Checks.
- Abweichungen und warum.

## Audit Checklist

Auditor prueft:

- F19 Ownership eingehalten.
- keine freien Hexwerte.
- keine freien Komponentenvarianten.
- Button/Form/Status/Tag/Callout-Regeln gelesen.
- sensible Daten nicht in falschen Flaechen.
- Tests und Screenshots vorhanden.

## Acceptance Criteria

- [ ] Zentrale Produktmuster sind fuer Capture, Inbox, Detail, Export,
      Settings und Konflikte definiert.
- [ ] Accessibility Gates sind konkret und pruefbar.
- [ ] Privacy UI Gates verhindern Datenlecks in Shell, Feedback und QA.
- [ ] Visual QA ist verpflichtender Teil spaeterer UI-Umsetzung.
- [ ] Handoff/Audit koennen ohne Mock-Raten arbeiten.

## Enterprise Quality Contract

Dieses Konzept uebernimmt
`docs/execution/CONCEPT_ENTERPRISE_QUALITY_CONTRACT.md`. Eigener Scope und
Status bleiben massgeblich. Der gemeinsame Vertrag liefert die verbindlichen
Defaults fuer Ownership, Security/Privacy, Accessibility/Lokalisierung,
Verifikation, Stop Rules und Handoff, soweit dieses Dokument keine strengere
Regel definiert. Ein Widerspruch stoppt die betroffene Phase und wird in diesem
Konzept aufgeloest.
