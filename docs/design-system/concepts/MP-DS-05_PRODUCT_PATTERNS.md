---
title: "MP-DS-05 Product Patterns"
description: "Normative Kompositionsmuster fuer Mappm-Produktworkflows"
tags: [design-system, product-patterns, workflows, responsive]
lastUpdated: "2026-07-24"
status: "active-draft"
owner: "ui-concept"
---

# MP-DS-05 Product Patterns

## Scope

MP-DS-05 definiert, wie freigegebene Komponenten Capture, Processing/Review,
Dokument, Vorgang, Unterlage, Profile, Suche, Einstellungen, Vault-Lifecycle,
Export und Support zusammensetzen. Domain-Policy, Repository-Vertraege und
Flutter-Widgetbaeume sind nicht Teil dieses Design-System-Konzepts.

## Pattern Contract

Jedes Product Pattern benennt:

- Einstieg, ersten sichtbaren Zustand und erfolgreiches Ergebnis.
- Empty, Loading, Partial, Offline, Error, Retry, Blocked und Permission State.
- Desktop-/Mobile-Struktur, Fokusfolge und Tastaturverhalten.
- Source of Truth, Fake-Szenarien und Contract-/Microcks-Grenze.
- sensible Daten, Logging-/Diagnosegrenzen und Screenshot-Policy.
- genaue F-, MP-DS- und Pillar-Owner.

## Pattern-Familien

| Pattern | Primaere Quellen | Status |
|---|---|---|
| Desktop Shell/Workbench | F22/F33, MP-DS-02 | active-draft |
| Globales Mobile Capture | F17/F29/F33, Capture-Saeule | planned |
| Processing, Warteerfahrung und Proposal Review | F17/F18/F24/F27-F30/F34/F38, Capture/Cases/Intelligence | accepted-direction; BF-001/BF-013 und phase detail planned |
| Vorgang/Unterlage und Case-Komposition | F33-F35/F37, Cases/Records | accepted-direction; phase detail planned |
| Vertrag/Abo und Mini-Chart | F34/F37, Contracts/Subscriptions | accepted-direction; phase detail planned |
| Kontextuelle Review-Aktionen | F30/F34/F37, Capture/Intelligence | accepted-direction; phase detail planned |
| Verwaltete Person/Organisation | F28/F33/F37, Profiles | accepted-direction; business activation conditional |
| Aufgaben/Agenda/Reminder | F18/F29/F34/F37, Tasks | accepted-direction; calendar adapter later |
| Suche/Liste/Filter | F33-F35, Search | planned |
| Einstellungen/Konfiguration | F13/F24/F35 | planned |
| Account/Vault/Assist/Migration/Recovery | F18/F34-F36, Cloud/Identity/Data | active baseline; phase detail planned |
| Export/Sharing/Support | F5/F18/F34/F35 | planned |

## Progressive Disclosure

Fachliche Vielfalt rechtfertigt keine Informationswand. Pattern zeigen nur
vorhandene und entscheidungsrelevante Inhalte. Verboten sind insbesondere:

- ein grosser Case-/Dokumenttyp-Picker im Standardflow.
- alle Review-Aktionen gleichzeitig.
- leere Finanzsektionen oder ein Chart mit nur einem Wert.
- buchhaltungsartige Abo-Dashboards.
- Assist-Details ohne aktuelle Entscheidungsrelevanz.

## Accessibility, Verifikation und Stop Rules

Patterns brauchen deutsche lokalisierbare Copy, Semantics, sichtbaren Fokus,
Textscale, Reduced Motion sowie Responsive Evidence. Stop, wenn ein Pattern nur
aus einem Mock abgeleitet wird, Mobile/Desktop fehlt, ein Mock konkrete
Produktpolitik autorisiert oder UI Backend-/Datenpolicy erfindet. Handoff an
`ui-architect` erfolgt nur aus einem geprueften Phase-as-Implementation-
Contract.
