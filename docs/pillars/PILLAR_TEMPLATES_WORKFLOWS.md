---
title: "Produkt-Säule - Templates and Workflows"
description: "Produktbereich fuer Vorgangsvorlagen, Checklisten, empfohlene nächste Schritte und workflowbasierte Assistenz"
tags: [pillar, templates, workflows, checklists, tasks]
lastUpdated: "2026-07-15"
version: "0.4"
status: "accepted-direction"
owner: "product-concept"
---

# Produkt-Säule - Templates and Workflows

## Zweck

Mappm soll wiederkehrende Lebenssituationen nicht jedes Mal bei null starten
lassen.

Universelle Workflow-Muster:

- einreichen, warten, entscheiden und abrechnen;
- Schadenereignis dokumentieren und regulieren;
- Vertrag/Abo aktivieren, ändern und beenden;
- Kauf, Lieferung, Rückgabe, Garantie und Reklamation;
- Lebensereignis über mehrere Stellen koordinieren;
- Nachweis beantragen, erneuern oder ersetzen;
- Unterlagen für einen Zeitraum sammeln, prüfen und übergeben;
- Einspruch, Streit oder Rückforderung verfolgen.

Konkrete Domänenfamilien umfassen Gesundheit/Erstattung, Unfall/Versicherung,
Verträge/Abos, Kauf/Garantie, Behörden, Wohnen/Umzug, persönliche/familiäre
Ereignisse, Identität/Nachweise, Steuer-Unterlagensammlung, Bildung/Betreuung,
Arbeit/Einkommen, Fahrzeug/Mobilität und konkrete Reise-/Auslandsabläufe.

Fuer Gesundheit ist als Discovery-Richtung ein ortsunabhaengiger Verlauf fuer
Abklaerung, Behandlung und Nachsorge vorgesehen, ergaenzt um Erstattung und
eigenstaendige Versicherungsleistungen. Die genaue Grenze zwischen Etappe,
Claim, Workflow-Zweig und verbundenem Folge-Case ist noch nicht akzeptiert und
bleibt in `docs/discovery/MEDICAL_CASE_MODEL_DISCOVERY.md` offen.

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
automatisch vorgeschlagenem Titel, Managed Subject und einem Dokument nahezu
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

## Enterprise Quality Contract

Diese Saeule uebernimmt
`docs/execution/PILLAR_ENTERPRISE_QUALITY_CONTRACT.md`. Ihre Milestone-Slices
und Domaenengrenzen bleiben massgeblich. Der gemeinsame Vertrag liefert
verbindliche Anforderungen fuer getrennte Ownership, Phase Slicing,
Security/Privacy, Accessibility/Lokalisierung, Verifikation, Stop Rules und
Handoff. Die Saeule allein autorisiert niemals eine Implementierung.
