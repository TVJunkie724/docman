---
title: "Konzept F35 - Product Patterns, Accessibility and Visual QA Detail"
description: "Mappm Detailkonzept fuer zentrale Produktmuster, Accessibility-Gates, Privacy UI Gates und visuelle QA"
tags: [concept, frontend, design-system, patterns, accessibility, privacy, visual-qa, production-readiness]
lastUpdated: "2026-07-12"
version: "1.0"
status: "accepted"
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
- Person/Profil fachlich planbar.
- Upload/Queue-Zustand privacy-sicher.
- schlechte Scans korrigierbar.

### Draft Inbox

Zweck:

- neue Dokumente pruefen.
- Pflichtfelder setzen.
- zuletzt verarbeitete Dokumente schnell korrigieren.

Pflicht:

- Entwuerfe.
- zuletzt verarbeitet.
- Konflikte/Fehler, wenn vorhanden.
- Link zum Vorgang/Detail.

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

### Export

Zweck:

- Einzeldokument herunterladen.
- mehrere Dokumente/Vorgang als ZIP herunterladen.
- manuelle Weitergabe ausserhalb der App.

Nicht-Ziel:

- kein externes Sharing.
- kein externer Zugriff auf die App.
- kein automatisches Einreichen im aktuellen Zielbild.

### Settings

Zweck:

- Mappm Account/Gerät, Vault-Autorität, Assist-Entitlement, Migration und
  Detached Recovery.
- Pairing.
- Storage.
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

This concept adopts `docs/execution/CONCEPT_ENTERPRISE_QUALITY_CONTRACT.md`.
Its own scope and status remain authoritative; the shared contract supplies the
mandatory ownership, security/privacy, accessibility/localization, verification,
stop-rule and handoff defaults wherever this file does not define a stricter
rule. Any conflict must stop the affected phase and be resolved in this concept.
