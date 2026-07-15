---
title: "Konzept F37 - Case, Record and Contextual Experience"
description: "Mappm UX-Vertrag fuer Vorgaenge, Unterlagen, Custom Cases, Case-Komposition, kontextuelle Review-Aktionen, Abos, Agenda und schlanke Finanzdarstellung"
tags: [concept, frontend, cases, records, custom-cases, review, subscriptions, agenda, insights, accessibility]
lastUpdated: "2026-07-15"
version: "1.1"
status: "accepted-direction"
owner: "ui-concept"
---

# Konzept F37 - Case, Record and Contextual Experience

## Zweck

F37 übersetzt die akzeptierten Produktentscheidungen zu Vorgängen, Unterlagen,
Abos, Profilen und Financial Facts in verbindliche UX-Leitplanken. Es ist kein
Screen- oder Widget-Implementierungsplan.

## Scope, Non-Goals und Deferred Work

In Scope sind die nutzerseitige Semantik, Informationsarchitektur,
Interaktionsregeln, Zustände und Quality Gates für Cases, Records,
Case-Komposition, Verträge/Abos, Managed Subjects, Agenda, Suche,
kontextuelle Aktionen und schlanke Financial Summaries.

F37 definiert nicht:

- konkrete Flutter-Widgets, Provider, Repository-Signaturen oder Datenbanktabellen;
- OpenAPI/DTO-/Backend-Contracts;
- den ersten Länder-/Workflow-/Steuerkatalog oder rechtliche Fristwerte;
- Pricing, Entitlements oder Mappm-Abonnement-Billing;
- allgemeine Kalender-, Chat-/Messenger-, Buchhaltungs-, Banking-, Steuerberatungs-
  oder Dashboard-Funktionen;
- Sharing-/Delegations-UX jenseits der bereits akzeptierten Profilgrenzen.

Diese Punkte bleiben bei ihren Fachowners und werden nur in einer freigegebenen
Phase aktiviert. F37 darf nicht als implizite Freigabe dafür gelesen werden.

## Normative Quellen

- `docs/technical/DECISION_CASE_DOCUMENT_RECORD_MODEL.md`
- `docs/technical/DECISION_CASE_RELATIONSHIP_WORKFLOW_COMPOSITION.md`
- `docs/technical/DECISION_INITIAL_CASE_WORKFLOW_CATALOG.md`
- `docs/technical/DECISION_RECURRING_CONTRACT_SUBSCRIPTION_MODEL.md`
- `docs/technical/DECISION_MANAGED_SUBJECTS_BUSINESS_CONTEXTS.md`
- `docs/technical/DECISION_JURISDICTIONAL_TAX_DOCUMENT_COLLECTION.md`
- `docs/technical/DECISION_CONTEXTUAL_REVIEW_ACTIONS_FINANCIAL_ROLLUPS.md`
- `docs/technical/DECISION_CAPTURE_FIRST_ASSISTED_ROUTING.md`

Medical Case composition is explicitly excluded from F37's accepted sources.
`docs/discovery/MEDICAL_CASE_MODEL_DISCOVERY.md` is discussion input only.

## Informationsarchitektur

Vorgänge und Unterlagen sind gleichwertige Hauptbereiche:

```text
Eingang
Vorgaenge
Unterlagen
Aufgaben / Agenda
Schnellzugriff
Suche
Einstellungen
```

- **Vorgänge** zeigen Ziele, Status, Timeline, Aufgaben, Workflow-Zweige und
  typisierte Beziehungen.
- **Unterlagen** zeigen langlebige Records wie Reisepass, Geburtsurkunde,
  Vertrag, Polizze oder Garantie mit aktueller/historischer Version.
- Dokumentdateien sind Evidenz und Versionen in beiden Bereichen, kein dritter
  gleichwertiger Navigationszwang.
- Die Suche umfasst Vorgänge, Unterlagen, Dokumente, Profile, externe Akteure,
  Claims, Tasks und bestätigte Facts in einer gemeinsamen Suche.

Mobile darf Hauptbereiche verdichten, aber nicht Vorgang und Unterlage
semantisch zusammenwerfen.

## Capture-first Context Creation

Der normale Dokumenteingang beginnt global beim Scan/Import, nicht beim
manuellen Suchen eines Vorgangs. Backend/Core Assist schlaegt immer Titel,
primaeren Case/Record, zusaetzliche Beziehungen, Workflow und relevante
Folgeaktionen vor. **Neuen Vorgang starten** ist die einzige primaere optionale
Vorab-Absicht; automatisches Matching bleibt immer aktiv.

Nach Review besitzt jedes akzeptierte Dokument einen primaeren Case- oder
Record-Kontext. Wenn nichts passt, kann ein leichter Custom Case nur aus
vorgeschlagenem Titel, Managed Subject und einem Dokument bestehen. Weitere
Dokumente koennen spaeter matchen; Aufgaben, Termine, Workflow und Outcome sind
Faehigkeiten, keine Pflichtfelder.

Die UX darf dafuer weder einen losen Dokument-Endzustand noch ein grosses
Metadatenformular als Standardweg einfuehren.

## Search-first, nicht Chat-first

Ein jederzeit erreichbares globales Suchfeld ist der niederschwellige Einstieg
in den Bestand. Ergebnisse bleiben objekt- und aktionsorientiert: Nutzer sehen
Treffertyp, Kontext, Match-Grund und können direkt öffnen, filtern, verbinden
oder eine passende Aufgabe ausführen.

Mappm führt keinen Chat, Messenger und keine KI-Chat-Historie als primäre
Dokumentoberfläche ein. Natürliche oder semantische Suche darf später dieselbe
Suchleiste verbessern, muss aber reproduzierbare Treffer und klare Quellen
anzeigen. Die UI darf keinen gesprächsartigen Assistenten voraussetzen.

## Vorgangsdetail

Das Vorgangsdetail zeigt nur vorhandene/relevante Sektionen:

- Ziel, Status und aktuelle Workflow-Phase;
- nächster relevanter Schritt;
- Aufgaben, Fristen und erwartete Antworten;
- Timeline/Ereignisse;
- Dokumente und Unterlagen;
- Claims/submissions;
- verbundene Cases mit Relation;
- kontextuelle bestätigte Finanzzusammenfassung.

Custom und Guided Cases verwenden dieselbe Grundstruktur. Guided Cases dürfen
Quelle, Gültigkeit und Workflow-Version dezent ergänzen. Ein leichter Custom
Case darf nahezu leer beginnen und trotzdem spaeter alle normalen Funktionen
nutzen. Custom Cases dürfen nicht visuell oder funktional als minderwertig
erscheinen.

## Unterlagendetail

Das Unterlagendetail zeigt:

- Art, betroffene Person/Organisation und aktuelle Version;
- Gültigkeit/Laufzeit und relevante Reminder;
- Dokumentversionen und Quelle;
- verbundene Vorgänge und Claims;
- bei Vertrag/Abo den ruhigen Vertragskontext.

Reisepass, Geburtsurkunde oder Vertrag werden nicht als bloße PDF-Karte
dargestellt. Der Nutzer sieht das langlebige Objekt; die Datei ist dessen
aktuelle Evidenz/Version.

## Kontextuelle Review-Aktionen

Review zeigt nur die wenigen im konkreten Dokument relevanten Zuordnungen und
Folgeaktionen. Weitere Aktionen bleiben progressiv erreichbar. Jede Assist-Aktion zeigt
Vorschlagsstatus/Evidenz passend zur Sensitivität und kann bestätigt,
korrigiert, abgelehnt oder rückgängig gemacht werden. Keine fachlich relevante
Zuordnung wird durch visuelle Vorbelegung als bereits final dargestellt.
Konkrete Controls, Gesten und Layouts bleiben einer spaeteren UI-Phase vorbehalten.

## Case-Komposition

Mehrfachauswahl unterstützt:

- aus Dokumenten/Unterlagen einen verbundenen Vorgang erstellen;
- aus Dokumenten und Cases einen neuen übergeordneten Case erstellen;
- einen Ablaufzweig zu einem Case hochstufen;
- eine Beziehung ändern oder lösen.

Vor Abschluss zeigt eine ruhige Zusammenfassung:

- neuer Titel und Managed Subject;
- ausgewählte Objekte;
- vorgeschlagene Relation;
- Hinweis, dass nichts kopiert oder gelöscht wird.

Die UI verwendet nutzerverständliche Formulierungen wie `Teil von`,
`Ausgeloest durch`, `Folgt auf` oder `Verwandt mit`. Interne Relation-Keys
werden nicht als Primärsprache gezeigt.

`Folgt auf` bildet eine Kette oder Verzweigung eigenstaendiger Cases, keine
Parent-Struktur. Welche medizinischen Situationen als Etappe, Claim, eigener
Case oder Folge-Case modelliert werden, bleibt im Medical-Case-Discovery offen.

## Contract/Subscription Detail

Ein Abo-/Vertragsdetail bleibt bewusst klein:

- aktuelle Vertrags-/Tarifidentität;
- nächster relevanter Termin oder Task;
- Dokumente/Timeline;
- bei mindestens zwei bestätigten Perioden ein kleiner Rechnungsverlauf.

Der Chart zeigt keine konfigurierbaren Dashboards, Prognosen oder
Aufschlüsselungszwänge. Desktop-Hover, Mobile-Tap und Tastaturfokus geben
Periode/Betrag aus. Für variable Rechnungen heißt er `Rechnungsverlauf`, nicht
automatisch `Preisentwicklung`.

## Finanzzusammenfassung

- Kein bestätigter FinancialEntry: keine Finanzsektion.
- Ein Wert: eine Summenzeile.
- Mehrere vergleichbare Werte: optionaler Mini-Chart.
- `part_of`-Roll-up zeigt deduplizierte Werte und deren Ursprung bei Bedarf.
- Erstattungsfälle zeigen Rechnung, Erstattung und Eigenanteil.
- Tax Collection zeigt `vorgemerkt/bestaetigt`, nie `absetzbar` ohne
  freigegebene fachliche Entscheidung.

## Managed-Subject-Auswahl

Personen und eigene Organisationen verwenden denselben Auswahlmechanismus mit
klarer Typkennzeichnung. Externe Akteure erscheinen nicht in derselben Liste
als verwaltete Profile, besitzen aber eigene auffindbare Kontaktprofile fuer
Absender/Herkunft, etwa Arztname, Adresse, E-Mail und Telefonnummer.
Privat-/Business-Wechsel darf Suchergebnisse, Exporte oder Notifications nicht
still vermischen.

## Aufgaben und Agenda

Die Agenda ist eine fokussierte Sicht auf Tasks, Deadlines, Termine, erwartete
Antworten, Ablaufdaten und Reminder. Sie ist kein allgemeiner Kalender.

Reminder können ruhig in der App oder benachrichtigend ausgegeben werden.
Sensible Titel werden außerhalb des aktiven Kontexts redigiert. Externe
Kalendersynchronisierung ist optional, später und consent-pflichtig.

## Responsive und Accessibility

- Multi-select und Komposition müssen mit Tastatur, Touch und Screenreader
  vollständig möglich sein.
- Hover-Informationen besitzen Tap-/Focus- und semantische Alternativen.
- Charts sind nie die einzige Informationsquelle.
- Relation, Status und vorgeschlagene/ bestätigte Werte werden nicht nur über
  Farbe kommuniziert.
- Lange deutsche Titel, Text Scaling und kleine Mobile-Viewports dürfen keine
  Aktionen oder Beträge verdecken.
- Focus kehrt nach Dialog/Komposition sinnvoll zur Auswahl oder zum Ergebnis
  zurück.

## Zustände

Jedes betroffene Pattern plant mindestens:

- leer, geladen, teilweise geladen und offline;
- Assist wartet/Quota/Fehler/manueller Fallback;
- Vorschlag, bestätigt, korrigiert und verworfen;
- Link-Konflikt, nicht mehr verfügbares Ziel und Berechtigungsfehler;
- Chart nicht verfügbar wegen fehlender/ungeprüfter Werte;
- Reminder blockiert oder Notification-Berechtigung fehlt;
- Relation erstellt, geändert, gelöst und Undo nicht mehr möglich.

## Security, Privacy, Support und Diagnostics

- Suchqueries, Treffertitel, ExternalParty-Kontakte, Beträge, medizinische oder
  rechtliche Case-Titel und Dokumentinhalte sind sensible Daten.
- Notifications, OS-Suche, Recent Items, Screenshots und Supportpakete zeigen
  außerhalb eines entsperrten Kontexts nur privacy-safe Ersatztexte.
- Logs enthalten stabile technische Operation-/Reference-Codes, aber keine
  Query, OCR-Texte, Kontaktdaten, Beträge oder fachliche Case-Titel.
- Support darf Link-/Roll-up-/Matching-Fehler anhand synthetischer IDs,
  Statusklassen und redigierter Diagnostik untersuchen; ein Dokumentinhalt wird
  nie automatisch angehängt.
- Admin-/Developer-Verhalten ist auf dieser UX-Ebene nicht direkt anwendbar;
  Phasen müssen Fake-/Fixture-, Feature-Flag-, Migration- und Contract-
  Diagnostik beim jeweiligen technischen Owner verankern.

## Dependencies und offene Gates

- OQ-009 entscheidet, ob OrganizationProfile-/Business-Kontexte Commercial 1.0
  aktiv erreichen.
- OQ-010 sowie WF-01/WF-02 blockieren konkrete Steuer- und Länder-Claims.
- Vertragskategorien und länderspezifische Kündigungsregeln werden je Phase
  freigegeben; F37 erfindet keine Werte.
- CaseLink-Persistenz, Claims, FinancialEntry-Deduplizierung, Search-Adapter und
  Managed-Subject-Repositories gehören vor Implementierung in Data-/Contract-
  Handoffs und Fakes.
- Die erste betroffene Phase braucht einen fokussierten Desktop-/Mobile-Mock
  nach MP-DS-05/06/07; `patterns.html` allein ist keine visuelle Freigabe.

## Tests und Evidence

Spätere Phasen benötigen:

- Fake-Repository-Szenarien für Custom/Guided Case, Unterlage, Abo, Tax Case,
  Person/Organisation und CaseLink-Typen;
- Widget-/Semantiktests für dynamisch ein-/ausgeblendete Sektionen;
- Tests gegen Doppelzählung und falsche Roll-ups;
- Tastatur/Touch/Screenreader-Evidence für Multi-select und Mini-Chart;
- Desktop/Mobile-Goldens für leere, einzelne und mehrere Finanzwerte;
- Privacy-Tests für Notifications, Suchvorschau und Profilwechsel.

## Stop Rules

UI-Planung oder Implementierung wird gestoppt, wenn:

- `Subcase` als separater Screen-/Domain-Typ vorausgesetzt wird;
- Unterlagen hinter einer generischen Dateiliste verschwinden;
- jeder mögliche Review-Action gleichzeitig sichtbar ist;
- Charts ohne mehrere bestätigte Werte oder ohne A11y-Alternative erscheinen;
- Custom Cases weniger Fähigkeiten als Guided Cases besitzen;
- Privat-/Business-Kontext oder Person/Organisation visuell unklar bleibt;
- mobile oder keyboard/focus behavior nicht spezifiziert ist;
- UI fachliche Länder-, Steuer-, Kündigungs- oder Roll-up-Policy erfindet.
- OQ-009/OQ-010/WF-01/WF-02 oder eine Daten-/Contract-Grenze für den konkreten
  Phase-Scope offen ist.

## Handoff

F37 autorisiert keine Implementierung. Eine betroffene Phase muss F37, die
konkreten Decisions, MP-DS-05/06/07 und ihre Daten-/Contract-Grenzen in einem
geprüften Phase-as-Implementation-Contract konkretisieren.

## Enterprise Quality Contract

Dieses Konzept uebernimmt
`docs/execution/CONCEPT_ENTERPRISE_QUALITY_CONTRACT.md`. Seine Produkt- und
UX-Entscheidungen bleiben massgeblich. Der gemeinsame Vertrag liefert die
verbindlichen Defaults fuer Production Readiness, Security/Privacy,
Accessibility/Lokalisierung, Tests, Verifikation, Stop Rules und Handoff,
soweit F37 dazu keine strengere Regel definiert.
