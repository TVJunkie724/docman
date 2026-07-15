---
title: "Decision - Product Language"
description: "Verbindliche Fachbegriffe für Cases, Records, Dokumente, Beziehungen, Aufgaben und Ereignisse"
tags: [decision, product-language, domain-model]
lastUpdated: "2026-07-15"
status: "accepted"
owner: "product-concept"
---
# Decision - Product Language

## Status

Angenommen für neue Konzepte, Contracts, Code und sichtbare Produkttexte.
Legacy-Begriffe bleiben nur in klar markiertem Migrationskontext.

## Begriffe

| Ebene | Begriff | Deutsche UI | Bedeutung |
|---|---|---|---|
| Domain | `Case` | Vorgang | Generischer, leichter Kontext für ein Nutzerziel, einen Verlauf oder eine bewusste Sammlung |
| Domain | `CustomCase` als Konfiguration, nicht Typ | Vorgang | Derselbe `Case` ohne verpflichtendes Workflow-Muster; darf fast leer beginnen |
| Domain | `CaseLink` | Verknüpfung / kontextuelle Bezeichnung | Typisierte Beziehung `part_of`, `caused_by`, `follow_up_to` oder `related_to` |
| Domain | `Record` | Unterlage | Langlebiger fachlicher Gegenstand mit möglichen Versionen, etwa Vertrag, Polizze oder Ausweis |
| Domain | `Document` | Dokument | Eigenständiges logisches Dokument mit einem oder mehreren Datei-/Seitenartefakten |
| Domain | `Event` | Ereignis | Zeitpunkt oder Historieneintrag, kein Hauptcontainer |
| Domain | `Task` | Aufgabe | Nächster Schritt, Fälligkeit oder Erinnerung |
| Domain | `ManagedSubject` | Person / Organisation | Vom Account verwalteter fachlicher Kontext ohne zwingenden eigenen Login |
| Domain | `ExternalParty` | Absender / Anbieter / Stelle | Externe Person oder Organisation mit Kontaktdaten und Rollen |

## Regeln

- `Incident` ist zu eng und wird in neuen Zielpfaden nicht verwendet.
- `Event` bezeichnet keinen langlebigen Vorgang.
- `Subcase` ist kein eigener Domain-Typ. „Subvorgang“ darf in der UI eine
  verständliche Rolle eines `part_of`-Links beschreiben.
- Custom und geführt verwenden denselben `Case`-Typ. Workflow-Muster, Titel,
  Aufgaben, Termine und Beziehungen sind optionale Komposition.
- Ein Dokument kann mehrere Cases/Records referenzieren, besitzt nach Review
  aber einen primären Navigationskontext.
- „Unterlage“ ist der allgemeine UI-Begriff für `Record`; „Nachweis“,
  „Vertrag“ oder „Polizze“ können kontextspezifische Bezeichnungen sein.
- Die Marke heißt in sichtbarer Produktkommunikation `Mappm`; `DocMan` ist nur
  technischer Repository-/Legacy-Name bis zur geplanten Migration.

## Migration

Bestehende `Incident*`-, alte Parent- oder Draft-Inbox-Typen werden nicht
spontan umbenannt. Ein freigegebener Foundation-/Data-Slice definiert
Schema-/Code-Migration, Kompatibilität, Tests und Entfernungskriterien.
