---
title: "Produkt-Säule - Templates and Workflows"
description: "Produktbereich fuer Vorgangsvorlagen, Checklisten, empfohlene nächste Schritte und workflowbasierte Assistenz"
tags: [pillar, templates, workflows, checklists, tasks]
lastUpdated: "2026-07-20"
version: "0.4"
status: "accepted-direction"
owner: "product-concept"
---

# Produkt-Säule - Templates and Workflows

## Zweck

Mappm soll wiederkehrende Lebenssituationen nicht jedes Mal bei null starten
lassen.

Die vollstaendige und einzige Liste der Workflow-Muster, Fachvorlagen-IDs,
deutschen Titel, Reifegrade und Dispositionen steht in
`docs/technical/DECISION_INITIAL_CASE_WORKFLOW_CATALOG.md`. Diese Saeule
definiert bewusst keine zweite Kurz- oder Bereichsliste. Sie beschreibt
Ownership, Qualitaet und Auslieferung der dort registrierten Eintraege.

Fuer Gesundheit sind ein ortsunabhaengiger `medical_care`-Anker, ein
`part_of`-`medical_cost_settlement` je eigenstaendiger wirtschaftlicher
Verpflichtung und Payer-Einreichungen als Claims akzeptiert.
Behandlungsbewilligungen sind generische Dokumente/Facts/Schritte im Care-Case
und keine eigene Vorlage. Reha, Nachsorge und spaetere Evidenz werden
dokumentweise gematcht; ein neuer verknuepfter Medical Case beginnt in M1 aus
einem Ankerdokument oder ausdruecklicher Absicht, nicht aus freier
Mehrfachabspaltung. Wiederkehr ist optionale Planung, kein Template/Case-Typ.
Besondere vertragliche Leistungen werden im Medical Core fuer M1 nicht
spezialisiert oder berechnet. OQ-012 ist geschlossen; konkrete optionale
AT-Provider-Hinweise bleiben WF-01/WF-02.

## Zielbild

Mappm besitzt eine generische Vorgangs-Engine und einen kuratierten,
versionierten Workflow-Katalog. Templates liefern nachvollziehbare Vorschläge,
keine starre Statusmaschine. Fachliche Varianten werden pro Rechtsraum,
Gültigkeitszeitraum und gegebenenfalls Institution veröffentlicht.

Ein Template kann vorschlagen:

- typische Dokumentgrundarten, semantische Varianten und Rollen.
- Schritte, Ablaufzweige, Claims und bei eigenständigem Ziel typisierte
  Case-Beziehungen.
- Tasks und Fristen.
- Records, die verknüpft werden sollten.
- externe Aktionslinks.
- Facts, die später ausgewertet werden können.
- erwartete Antworten und Dokumente.
- typisierte Dokumentrollen wie Auslöser, Einreichung, Antwort, Entscheidung
  und Zahlungsbeleg.

Templates erzeugen nicht für jeden Akteur oder Dokumentstapel einen Vorgang.
Ein neuer Case entsteht erst bei eigenständig verständlichem Ziel und
Lebenszyklus. `Subvorgang` ist nur die UI-Rolle eines `part_of`-Links.
Dokumente können mehreren Vorgängen zugeordnet sein, ohne Dateien zu duplizieren.

Manuelle/Custom Cases sind ein gleichwertiger Produktpfad. Sie duerfen mit
automatisch vorgeschlagenem Titel, Managed Subject und optional einem Dokument nahezu
leer beginnen, frei angelegt, aus ausgewaehlten Dokumenten gebildet oder aus
bestehenden Cases/Dokumenten nachtraeglich uebergeordnet werden. Ein kompatibles
Template kann spaeter bewusst uebernommen werden; Backend/Core Assist schlaegt
dabei Titel, Slots, Tasks und Beziehungen vor, ohne bestaetigte Historie zu
ersetzen.

## Internationalisierung

- Optionale Workflow-Muster definieren wiederverwendbare universelle
  Prozessbausteine; sie sind keine sichtbaren Case-Typen und muessen nicht als
  exklusive Case-Klassifikation persistiert werden.
- Länder-/Regionspakete konkretisieren Rechtsraum, Institutionen, Nachweise,
  Fristen, Terminologie und Einreichungswege.
- Sprache ist nicht gleich Rechtsraum.
- Nicht unterstützte Kombinationen verwenden einen klar gekennzeichneten
  manuellen Vorgang.
- Jeder veröffentlichte Workflow braucht Version, Gültigkeit, Quellen,
  Reviewdatum, Owner, Risikoklasse und getestete Fallbacks.

## Release Slices

Foundation/Commercial Core modelliert Case, CaseLink, Workflow-Schritt/-Zweig,
Claim und Custom-Case-Ursprung ohne harte UI-Logik. Aktivierte Release-Slices
liefern danach:

- Definition und technische Validierung des Katalogformats.
- fachlich geprüfte Golden Workflows für die ausgewählten Startmärkte.
- aus Templates erzeugte Aufgaben, Claims, Ablaufzweige, Case-Beziehungen und
  erwartete Dokumente.
- signierte Katalog-Updates und auditable Migrationen.

## Grenzen

- Templates dürfen keine rechtlich oder medizinisch verbindlichen Entscheidungen treffen.
- Automatische Statusänderungen folgen der aktiven Review-/Automatisierungsreife.
- Backend/Core-Assist-Vorschlaege gehoeren zum Commercial Core; spaetere
  Finalisierung bleibt qualitaetsgegatet.
- LLMs wählen nur aus veröffentlichten Definitionen; sie publizieren oder
  erfinden keine fachlich verbindlichen Abläufe.
- Laufende Vorgänge pinnen ihre Workflow-Version und wechseln nur über eine
  nachvollziehbare Migration.
- Länder-Support darf erst nach datierter fachlicher, rechtlicher und
  produktbezogener Prüfung beworben werden.

Normative Entscheidung:
`docs/technical/DECISION_CURATED_JURISDICTIONAL_WORKFLOW_CATALOG.md`.

Der vollständige Stand der konkret definierten Cases, Record-Kontexte,
Custom-Beispiele und nur benannten Kandidatenfamilien steht in
`docs/technical/DECISION_INITIAL_CASE_WORKFLOW_CATALOG.md`.

Neue oder umbenannte Muster/Fachvorlagen werden zuerst oder im selben Change in
dieser SSOT dispositioniert. Pillar-, Phase-, UI-, Medical- und Country-Dokumente
duerfen nur registrierte IDs referenzieren.

## Enterprise Quality Contract

Diese Saeule uebernimmt
`docs/execution/PILLAR_ENTERPRISE_QUALITY_CONTRACT.md`. Ihre Milestone-Slices
und Domaenengrenzen bleiben massgeblich. Der gemeinsame Vertrag liefert
verbindliche Anforderungen fuer getrennte Ownership, Phase Slicing,
Security/Privacy, Accessibility/Lokalisierung, Verifikation, Stop Rules und
Handoff. Die Saeule allein autorisiert niemals eine Implementierung.
