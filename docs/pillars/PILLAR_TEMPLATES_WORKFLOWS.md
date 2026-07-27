---
title: "Produkt-Säule - Templates and Workflows"
description: "Produktbereich fuer Vorgangsvorlagen, Checklisten, empfohlene nächste Schritte und workflowbasierte Assistenz"
tags: [pillar, templates, workflows, checklists, tasks]
lastUpdated: "2026-07-24"
version: "0.5"
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

Jede Case-Familie wird zuerst ohne neue Decision-Datei vollstaendig mit dem
User besprochen. Nach Chat-Abgleich und ausdruecklicher
Dokumentationsfreigabe erhaelt sie genau ein in der Katalog-SSOT registriertes
Owning Subkonzept; Katalogzeilen und laufende Workshops erzeugen keine Draft-
oder Platzhalterdateien. Das Subkonzept besitzt das freigegebene fachliche
Verhalten. Diese Saeule, Country Packs und Workflowdefinitionen duerfen ein
fehlendes Subkonzept nicht ersetzen. Ein Template darf erst daraus abgeleitet
werden, wenn Ziel, Grenze, Komposition, Lifecycle, Matching,
Dokumentdisposition, Laendergrenze, Fixtures und Stop Rules reviewed sind.

Fuer Gesundheit sind ein ortsunabhaengiger `medical_care`-Anker, ein
`part_of`-`medical_cost_settlement` je eigenstaendig ausgestellter
Rechnung/Honorarnote und Payer-Einreichungen als wiederholbare
Events/Branches mit null, einem oder mehreren Dokumentlinks dokumentiert.
Korrektur/Gutschrift/Beleg bleiben im selben Cost-Case; eine weitere Rechnung
erzeugt einen weiteren. Der erneute Familienreview ist auf Care-Grenze,
Parent-Abschluss und wenige M1-Erwartungen verengt.
Behandlungsbewilligungen sind generische Dokumente/Facts/Schritte im Care-Case
und keine eigene Vorlage. Reha, Nachsorge und spaetere Evidenz werden
dokumentweise gematcht; ein neuer verknuepfter Medical Case beginnt in M1 aus
einem Ankerdokument oder ausdruecklicher Absicht, nicht aus freier
Mehrfachabspaltung. Wiederkehr ist optionale Planung, kein Template/Case-Typ.
Besondere vertragliche Leistungen werden im Medical Core fuer M1 nicht
spezialisiert oder berechnet. OQ-012 ist geschlossen; konkrete optionale
AT-Provider-Regeln folgen
`DECISION_AUSTRIA_MEDICAL_PAYER_RULE_PACK.md` und bleiben
WF-01/WF-02/OPS-09-gegatet.

Fuer Unfall/Schaden sind ein gemeinsamer Anlass-/Regulierungs-Case, wenige
grobe optionale Varianten, `part_of`-Schadenkosten je eigenstaendiger
wirtschaftlicher Verpflichtung sowie normale Versicherungsabwicklungs-Cases
mit mehreren Rechnungen und wiederholbaren Einreichungen dokumentiert.
`Medizinischer Unfall` routet direkt zu `medical_care` und erzeugt ohne
eigenstaendige nichtmedizinische Regulierung keinen Unfall-Wrapper. Medical und
Damage Cost Settlement bleiben getrennte Fachmodelle; Polizzenvorschlaege
behaupten keine Deckung. Details besitzt
`DECISION_ACCIDENT_DAMAGE_SETTLEMENT_MODEL.md`.

## Zielbild

Mappm besitzt eine generische Vorgangs-Engine und einen kuratierten,
versionierten Workflow-Katalog. Templates liefern nachvollziehbare Vorschläge,
keine starre Statusmaschine. Fachliche Varianten werden pro Rechtsraum,
Gültigkeitszeitraum und gegebenenfalls Institution veröffentlicht.

Ein Template kann vorschlagen:

- typische Dokumentgrundarten, semantische Varianten und Rollen.
- Schritte, Ablaufzweige, Einreichungsereignisse und bei eigenständigem Ziel typisierte
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
automatisch vorgeschlagenem Titel, nutzergewaehltem beziehungsweise geerbtem
Managed Subject und optional einem Dokument nahezu leer beginnen, frei angelegt,
aus ausgewaehlten Dokumenten gebildet oder aus bestehenden Cases/Dokumenten
nachtraeglich uebergeordnet werden. Ein kompatibles Template kann spaeter bewusst
uebernommen werden. Backend/Core Assist darf dabei konservative Kandidaten
liefern. Slots und reversible Tasks entstehen erst aus bestaetigten Facts,
Nutzeraktionen oder festen Produktregeln; Beziehungen bleiben ein optionaler,
separat qualitaetsgegateter und immer zu bestaetigender Vorschlag.

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
- Jede aktive regelbasierte Frist behaelt Startanker, Rule-/Pack-Version,
  Fundstelle, Bestaetigung und Reviewstatus. Mehrere Providerfristen bleiben
  getrennt; die frueheste offene Frist ist nur ein abgeleiteter Attention-Wert.
- Country-/Provider-Regeln benoetigen den Betrieb aus
  `docs/ops/OPS-09_COUNTRY_PROVIDER_RULE_MAINTENANCE.md`: monatlichen
  Source-Check, mindestens halbjaehrlichen Fachreview, Developer-Reminder,
  immutable Versionen, Withdrawal und Release-Gate.

## Release Slices

Foundation/Commercial Core modelliert Case, CaseLink, Workflow-Schritt/-Zweig,
Submission Event, Versicherungsabwicklung und Custom-Case-Ursprung ohne harte
UI-Logik. Aktivierte Release-Slices
liefern danach:

- Definition und technische Validierung des Katalogformats.
- fachlich geprüfte Golden Workflows für die ausgewählten Startmärkte.
- aus Templates erzeugte Aufgaben, Submission Events, Ablaufzweige, Case-Beziehungen und
  erwartete Dokumente.
- signierte Katalog-Updates und auditable Migrationen.

## Grenzen

- Templates dürfen keine rechtlich oder medizinisch verbindlichen Entscheidungen treffen.
- Statusaenderungen entstehen im aktuellen Zielrelease nur aus konkreter
  Nutzeraktion, eindeutig benannter kontextueller Aktion, autorisierter
  Integration oder gepruefter Regel. Eine spaetere Automatisierung bleibt
  klassenbezogen qualitaetsgegatet.
- Backend/Core-Assist-Vorschlaege gehoeren zum Commercial Core; spaetere
  Finalisierung bleibt qualitaetsgegatet.
- LLMs wählen nur aus veröffentlichten Definitionen; sie publizieren oder
  erfinden keine fachlich verbindlichen Abläufe.
- Laufende Vorgänge pinnen ihre Workflow-Version und wechseln nur über eine
  nachvollziehbare Migration.
- Länder-Support darf erst nach datierter fachlicher, rechtlicher und
  produktbezogener Prüfung beworben werden.
- eine Familie ohne eindeutiges reviewed Owning Subkonzept darf weder als
  Golden Workflow noch als Contract-/Schema-/Implementation-Scope dienen.

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
