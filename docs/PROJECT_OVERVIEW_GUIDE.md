---
title: "Mappm - Project Overview & Product Guide"
description: "Strategischer Überblick über den verkaufbaren Commercial Core mit Local/Cloud Vaults"
tags: [overview, guide, product, strategy, planning]
lastUpdated: "2026-07-14"
version: "3.0"
status: "accepted-rebaseline"
---

# Mappm - Project Overview & Product Guide

## 0. Produkt-Rebaseline 2026-07-12

Mappm ist eine verkaufbare Dokumentenapplikation für sensible private und
familiäre Unterlagen. Der erste Release ist ein production-ready Commercial
Core mit wenigen vollständigen Kernflows, kein Prototyp-MVP.

Jeder Vault hat genau einen Storage-Modus:

| Modus | Wahrheit | Account | Gerätewechsel/Mehrgerät | Exit |
|---|---|---|---|---|
| Mappm Local | verschlüsselte lokale Metadaten und Dateien | im Normalbetrieb erforderlich | kein impliziter Sync; verschlüsselter Export/Restore | Detached Recovery bleibt lokal nutzbar |
| Mappm Cloud | verwaltete Mappm Cloud; Client hält Cache/Pending Work | erforderlich | Sync/managed Backup nach Plan | Export, Reaktivierung oder verifizierte Cloud-to-Local-Migration |

Ein Wechsel ist ein sichtbarer, überprüfter Migrationsworkflow und nie ein
Toggle. Bei Kündigung bleibt der bezahlte Zeitraum aktiv; danach folgt ein
zeitlich begrenzter Grace-/Read-only-Zustand. In diesem Zustand müssen Export,
Cloud-to-Local-Migration, Reaktivierung und getrennte Löschentscheidungen
erreichbar bleiben. Kündigung löscht weder Vault noch Account sofort.

Home Hub, Tailscale-Pairing und kundenseitiges Self-hosting sind nicht mehr
Produktziel. Der ASP.NET-/PostgreSQL-/S3-Stack wird als Managed Mappm Cloud
gebaut; lokal läuft er als Local Development Cloud ausschließlich mit
synthetischen Daten und denselben Contracts.

Normative Quellen:

- `docs/technical/DECISION_ACCOUNT_VAULT_ASSIST_PRODUCT_MODEL.md`;
- `docs/technical/DECISION_COMMERCIAL_CORE_SCOPE.md`;
- `docs/technical/DECISION_VAULT_STORAGE_AND_CLOUD_PRODUCT_MODEL.md`;
- `docs/technical/DECISION_CLOUD_IDENTITY_DEVICE_TRUST.md`;
- `docs/concepts/CONCEPT_F36_VAULT_MODES_CLOUD_LIFECYCLE.md`;
- `docs/technical/DECISION_CURATED_JURISDICTIONAL_WORKFLOW_CATALOG.md`;
- `docs/ROADMAP_REBUILD.md`.

Die nachfolgenden älteren Strategieabschnitte bleiben als Produktentstehung und
fachliche DMS-Referenz erhalten. Aussagen zu Home Hub, Self-hosting, Tailscale,
M2 oder universeller local-first Authority sind nicht normativ.

### Account, Vault und Assist

Mappm verlangt im normalen Free-, Local- und Cloud-Betrieb einen Account. Das
legt den Speicherort nicht fest: Ein Local Vault bleibt lokal autoritativ, auch
wenn Core Assist ausgewählte Inhalte vorübergehend verarbeitet. Ein Cloud Vault
bleibt cloudautoritativ mit lokalem Cache.

Core Assist gehört zum verkaufbaren Produktversprechen: Dokumenttyp, Akteure,
wichtige Felder, Vorgangs-/Workflow-Zuordnung und Suchindex werden als prüfbare
Vorschläge vorbereitet. Free Local erhält ein sinnvolles begrenztes Kontingent;
exakte Tarife und Quoten bleiben offen.

Accountpflicht darf keine Datenfessel sein. Offline-Kontinuität und Detached
Recovery erhalten vorhandene lokale Dokumente, Suche, Export und manuelle
Pflege ohne Cloud-Dienste. Detached Recovery ist kein anonymer Onboarding-Modus.

## 1. Zweck

Dieses Dokument ist die gemeinsame Orientierung für DocMan. Es beschreibt nicht nur, was bereits geplant oder gebaut wurde, sondern auch, welche Richtung das Projekt aus heutiger Sicht nehmen sollte.

Es ist bewusst kritisch. DocMan hat eine starke Produktidee, aber der aktuelle Stand vermischt Produktvision, technische Experimente, Mock-UI, importierte Foundation-Konzepte und teilweise widersprüchliche Architekturentscheidungen. Bevor neue Features gebaut werden, braucht das Projekt eine klare Mitte.

## 2. Produktthese

DocMan ist derzeit der technische Repo-/Workspace-Name. Der Produktname ist
entschieden: Die App heißt langfristig `Mappm`.

Das Produkt sollte eine ruhige, robuste Dokumenten-App für Familien und Haushalte werden.

Der Kern ist nicht "Dateien verwalten". Der Kern ist: Alltagsvorgänge nachvollziehbar machen.

Beispiele:

- Ein Arzttermin mit Rechnung, Überweisung, Zahlung und Versicherungs-Einreichung.
- Eine Bestellung mit Rechnung, Lieferung, Garantie und Reklamation.
- Ein Schulzettel mit Unterschrift, Abgabefrist und Rückgabe.
- Eine Reise mit Buchungen, Tickets, Versicherungen und Belegen.

Diese Dinge passen schlecht in reine Ordnerstrukturen. Sie brauchen Kontext, Status, zuständige Person, Dokumente und nächste Schritte.

## 3. Zentrales Produktmodell

Das bisherige Modell `Incident` beschreibt technisch den richtigen Container, aber der Begriff passt nicht gut zur Produktidee. Für eine Familien-App klingt "Incident" nach Unfall, Störung oder Ticket-System.

**Entscheidung:** Der zentrale Domain-Begriff wird `Case`. In der deutschsprachigen UI heißt er "Vorgang".

`Event` / "Ereignis" wird nicht zum Hauptmodell. Ein Ereignis beschreibt etwas, das innerhalb eines Vorgangs passiert, etwa "Termin besucht", "Rechnung erhalten", "Dokument eingereicht" oder "Status geändert". Dadurch bleibt die Sprache klar:

- `Case` / Vorgang: Der langlebige Container.
- `Event` / Ereignis: Ein Zeitpunkt oder Eintrag in der Vorgangs-Historie.
- `Document` / Dokument: Eine Unterlage, Datei, Scan, Beleg oder Nachweis.
- `Task` / Aufgabe: Ein nächster Schritt.

Die technische Struktur bleibt sinnvoll:

```text
Household
  -> Profiles
      -> Cases / Vorgänge
          -> Suggested workflow state
          -> Events / Ereignisse
          -> Documents
          -> Tasks
          -> Related cases
```

Entscheidung dokumentiert in: `docs/technical/DECISION_PRODUCT_LANGUAGE.md`.

### 3.1 DMS-Zielarchitektur

DocMan beziehungsweise Mappm wird nicht nur als App mit Dokumentanhängen geplant.
Das langfristige Ziel ist ein vollwertiges privates Dokumentenmanagementsystem
für Haushalt, Personen, Vorgänge, Fristen, Wissen, Auswertungen und Aktionen.

Die fachliche Zielstruktur ist:

```text
Capture / Import
  -> Inbox / Review
      -> DocumentRecord
          -> FileRecord / DocumentVersion
          -> Record / Nachweis
          -> Case / Vorgang
          -> Profile / Person
          -> DocumentFact
          -> Task / Reminder
          -> Search / Insights
          -> Export / External Action
```

Ein Dokument gehört langfristig nicht genau einem Vorgang. Es kann in mehreren
Kontexten sichtbar sein: in mehreren typisiert verbundenen Vorgängen, im Profil
einer verwalteten Person/Organisation, als Version eines Records, in einer Versicherungs-/Claim-Auswertung,
im Schnellzugriff oder in einem Exportpaket. Dateien werden dabei nicht
dupliziert; Beziehungen tragen die fachliche Bedeutung.

Die M2-Implementierung darf vereinfachen, aber sie darf diese Zielarchitektur
nicht verbauen. Insbesondere werden Inbox und Outbox als Arbeitsflächen geplant,
nicht als eigentliche Besitzstruktur der Dokumente.

Entscheidung dokumentiert in: `docs/technical/DECISION_DMS_TARGET_ARCHITECTURE.md`.

## 4. Empfohlene Produktprinzipien

### 4.1 Explizite Local-/Cloud-Vaults

Mappm verwaltet private, langfristig wichtige Dokumente. Speicherautorität ist
deshalb ein expliziter Vault-Modus und kein verstecktes Environment-Flag.

```text
Local Vault = lokale Wahrheit + verschluesselter Export/Restore
Cloud Vault = Mappm-Cloud-Wahrheit + lokaler Cache/Pending Queue
Core Assist = separater Managed Service mit reviewbaren Ergebnissen
Local Development Cloud = synthetische Entwicklungsumgebung
```

Entscheidung dokumentiert in:
`docs/technical/DECISION_VAULT_STORAGE_AND_CLOUD_PRODUCT_MODEL.md`.

### 4.2 Desktop-Verwaltung plus Mobile Capture

Desktop ist der Ort für Sortieren, Prüfen, Suchen, Zuweisen und Verwalten. Mobile ist der schnelle Eingang für Scans unterwegs.

**Entscheidung:** Mobile Capture gehört in den Commercial Core. Mobile erfasst
offline in eine persistente Queue. Ein Local Vault verarbeitet auf demselben
Gerät oder über einen expliziten Export/Transfer; ein Cloud Vault lädt über den
Mappm-Cloud-Capture-Contract. Es gibt keinen impliziten Local-Desktop-Sync.

Draft-Inbox bleibt der sichere Standard. Wenn eine einfache, gecachte Liste offener Vorgänge verfügbar ist, darf Mobile einen Scan direkt einem Vorgang zuordnen. Vollständige mobile Vorgangsverwaltung und echter Multi-Geräte-Sync bleiben spaetere Milestones.

Entscheidung dokumentiert in: `docs/technical/DECISION_FIRST_UTILITY_SCOPE.md`.

### 4.3 Managed Cloud und Local Development Cloud

Mappm Cloud ist die verwaltete Serverlösung für Cloud Vault, Multi-Device,
Backup, Sharing und Managed Assist. Kundenseitiges Self-hosting ist nicht Teil
des aktiven Produktumfangs. Local Vault bleibt trotzdem ein vollwertiger
Speichermodus mit eigener Autorität.

Der langfristige Server-Stack ist nicht PocketBase als Produktkern, sondern
die verwaltete Mappm Cloud:

```text
Mappm Cloud
  -> API / Sync Backend
  -> PostgreSQL metadata store
  -> S3-compatible file storage
  -> Job queue
  -> OCR / document parsing workers
  -> managed OCR / document intelligence gateway
  -> optional search index
```

PocketBase kann als frühe Referenz oder Spike gelten, ist aber nach aktuellem Entwurf nicht Zielarchitektur.

Die Backend-Zieltechnologie ist ASP.NET Core fuer die API, PostgreSQL fuer
Server-Metadaten und Sync-Journal, S3-kompatibler Storage fuer Dateien und
Microcks fuer OpenAPI-Mocks und Contract Verification.
Worker starten bevorzugt als .NET Hosted Services / Worker Services; OCR- und
AI-Komponenten duerfen spaeter als getrennte Sidecars hinzukommen.

Entwurf zur Backend-Rolle dokumentiert in: `docs/technical/DECISION_BACKEND_ROLE.md`.
Technologieentscheidung dokumentiert in: `docs/technical/DECISION_HOME_HUB_BACKEND_TECHNOLOGY.md`.
Trust-/Verschluesselungsmodell dokumentiert in:
`docs/technical/DECISION_TRUST_ENCRYPTION_DEPLOYMENT_MODEL.md`.

### 4.4 Workflows als Führung, nicht als Käfig

Typisierte Workflows sind gut. Sie können helfen, Vorgänge verständlich zu machen. Aber Familienalltag ist unordentlich. Starre Statusmaschinen können schnell nerven.

**Empfehlung:** Workflows sollten empfohlene nächste Schritte liefern, aber Korrekturen erlauben. Harte Verbote nur dort, wo echte Datenregeln verletzt würden.

```text
Good:
  "Wahrscheinlich nächster Schritt: Rechnung bezahlen"

Risky:
  "Du darfst diesen Status nicht setzen, weil der Automat es verbietet"
```

Entscheidung dokumentiert in: `docs/technical/DECISION_WORKFLOW_RULES.md`.

#### Kuratierter internationaler Workflow-Katalog

Fachlich relevante Abläufe werden vorgegeben, aber nicht als unveränderliche
Flutter-/Backend-Logik fest verdrahtet. Mappm trennt eine generische
Vorgangs-Engine von kuratierten, versionierten Länder-, Regions- und
Institutionsvarianten.

```text
universelle Workflow-Familie
  -> geprüfte Rechtsraum-Variante
      -> versionierte Definition
          -> an Vorgang gebundene Instanz
```

Intelligence darf passende veröffentlichte Definitionen, Workflow-Zweige,
Case-/Dokumentbeziehungen und nächste Schritte vorschlagen. Sie darf keine Fristen,
Ansprüche oder fachlich verbindlichen Abläufe frei erfinden. Nicht unterstützte
Fälle bleiben als klar gekennzeichnete manuelle Vorgänge nutzbar.

Ein Dokument kann in mehreren über `part_of`, `caused_by`, `follow_up_to` oder
`related_to` verbundenen Vorgängen eine
jeweils eigene Rolle tragen, ohne dupliziert zu werden. Laufende Vorgänge pinnen
ihre Workflow-Version; Änderungen erfolgen nur nachvollziehbar.

Entscheidung dokumentiert in:
`docs/technical/DECISION_CURATED_JURISDICTIONAL_WORKFLOW_CATALOG.md`.

#### Custom Cases, Unterlagen, Abos und verwaltete Organisationen

- Jeder Vorgang ist ein eigenständiger `Case`; `Subvorgang` ist nur die
  UI-Rolle eines `part_of`-Links.
- Nutzer können freie Custom Cases anlegen oder aus ausgewählten Dokumenten und
  Vorgängen einen neuen verbundenen/übergeordneten Case bilden.
- Unterlagen wie Reisepass, Geburtsurkunde, Vertrag oder Polizze sind
  gleichwertige langlebige Records mit Dokumentversionen, keine künstlichen
  Vorgänge.
- Verträge/Abos ordnen beliebig periodische Rechnungen, Tasks, Fristen und einen
  schlanken Rechnungsverlauf in einem ruhigen Kontext.
- Eigene Organisationen können wie Kinderprofile ohne eigenen Login verwaltet
  werden, bleiben aber von externen Firmen und vom Privatkontext getrennt.
- Steuer-Unterlagensammlung ist länder-, subject- und periodengebunden und
  behauptet weder Absetzbarkeit noch Buchhaltungs-/Steuerberatungsleistung.

Normative Details stehen in den Entscheidungen zu Case Relationships,
Initial Case Catalog, Subscriptions, Managed Subjects, Tax Collection und
Contextual Review/Roll-ups.

### 4.5 KI später, aber als Pipeline mitdenken

KI kann DocMan später deutlich besser machen: OCR, Auto-Tagging, Status-Vorschläge, Dokumenterkennung und Vorschläge beim Ausfüllen von Formularen. Aber ohne stabile Dokumentstruktur erzeugt KI vor allem zusätzliche Unklarheit.

**Entscheidung:** Core Assist gehört in C2/C3 und wird als asynchrone Managed-
Processing-Pipeline geplant. On-device-Ausbau bleibt eine spätere Option. Die App
übernimmt KI-Ergebnisse nicht still, sondern zeigt Vorschläge mit
Review-Zustand.

```text
Document upload
  -> store original file
  -> extract text / OCR
  -> classify document type
  -> suggest fields and related case
  -> user review
  -> apply accepted suggestions
```

Entscheidung dokumentiert in: `docs/technical/DECISION_INTELLIGENCE_SCOPE.md`.

### 4.6 Privacy und Vertrauen vor Funktionsfülle

DocMan wird potenziell sensible Daten enthalten: medizinische Dokumente, Ausweise, Rechnungen, Versicherungen, Schulunterlagen.

**Empfehlung:** Jede Architekturentscheidung sollte Privacy, lokale Kontrolle, Exportierbarkeit und langfristige Lesbarkeit priorisieren.

Mappm behandelt Dokumente, OCR-/LLM-Ergebnisse und viele Metadaten als sensible
Daten. Das konkrete Managed-Trust- oder Zero-Knowledge-/E2EE-Modell muss vor
Cloud-Dateien und echter Assist-Verarbeitung entschieden werden; kein UI- oder
Backend-Slice darf es still vorwegnehmen.

Entscheidung dokumentiert in: `docs/technical/DECISION_PRIVACY_SYNC_SCOPE.md`.

Security-/Privacy-Baseline dokumentiert in: `docs/technical/DECISION_SECURITY_PRIVACY_MODEL.md`.

## 5. Produkt-Scope nach Stufen

### Stufe 0 - Foundation

Ziel: Aus dem aktuellen Spike eine belastbare Ausgangsbasis machen.

Enthält:

- Eindeutige Architekturentscheidungen.
- Bereinigte Dokumentation.
- Keine widersprüchlichen State-Management-Vorgaben.
- Klare lokale Persistenzstrategie.
- Trennung von Mock-UI und Produkt-UI.
- Minimale Tests, die zum aktuellen Projekt passen.

### Stufe 1 - M2: Desktop-Kern plus Mobile Capture

Ziel: Dokumente koennen unterwegs mobil erfasst und am Desktop zuverlässig
geprüft, einer betroffenen Person zugeordnet und verwaltet werden.

Enthält:

- Ein Haushalt.
- Betroffene Person / Haushaltsprofil als Pflichtzuordnung je Dokument.
- Vorgänge erstellen, bearbeiten, schließen.
- Dokumente als Draft erfassen.
- Dokumente einem Vorgang zuordnen.
- Mobile Scan/Capture.
- Lokale mobile Upload-Queue.
- Minimaler Home-Hub-Upload in die Draft-Inbox.
- Optionale mobile Vorgangszuordnung über eine einfache, gecachte Liste offener Vorgänge.
- Lokale Persistenz.
- Suche über Titel, Tags, Sender und Dokument-Metadaten.

Nicht enthalten:

- Vollständige Multi-Tenancy.
- KI.
- Vollständige mobile Vorgangsverwaltung.
- Vollständiger Multi-Geräte-Sync.
- Komplexe Dokumentversionierung.
- App-Store-Distribution.

### Stufe 2 - Familie und Sync

Ziel: Mehrere Profile und mehrere Geräte werden sinnvoll.

Enthält:

- Familienprofile.
- Berechtigungsmodell.
- Generisches DocMan Sync Backend.
- Verwaltetes Mappm-Cloud-Backend hinter versionierten Contracts.
- Session-Persistenz.
- Konflikt- und Sync-Status.
- Dokumentdateien mit lokalem Cache.

### Stufe 3 - Erweiterte Mobile- und Automatisierungsfunktionen

Ziel: Mobile wird zum schnellen Eingang.

Enthält:

- Batch-Scan.
- Ausgereiftere mobile Dokumenterfassung.
- Vollständigere mobile Vorgangsansicht.
- Erste automatische Metadatenvorschläge ohne volle KI-Komplexität.

### Stufe 4 - Intelligence

Ziel: DocMan wird assistiv.

Enthält:

- OCR.
- Auto-Tagging.
- Status-Vorschläge.
- Suche über extrahierten Text.
- Vorschläge, keine stillen automatischen Entscheidungen.

## 6. Dokumentationslage

Aktuell gibt es mehrere aktive Ebenen:

- Rebuild-Roadmap unter `docs/ROADMAP_REBUILD.md`.
- Phasen-/Subphasen-Index unter `docs/roadmap/PHASE_INDEX.md`.
- Säulen-Roadmap unter `docs/roadmap/PILLAR_ROADMAP_INDEX.md`.
- Wettbewerbs- und Positionierungsnotizen unter
  `docs/COMPETITIVE_POSITIONING.md`.
- Prozess-/Skill-/Konzeptmigration unter
  `docs/PROCESS_AND_CONCEPT_MIGRATION_PLAN.md`.
- Foundation-Konzepte unter `docs/concepts/CONCEPT_F*.md`.
- Technische Decisions und Foundation-Plan unter `docs/technical/`.
- Projektlokale Codex-Skills unter `.codex/skills/`.

Die alten Produkt-Roadmaps und der alte Refactoring-Plan wurden entfernt, weil sie noch `Incident`, PocketBase/OAuth, BLoC/GetIt oder andere überholte Annahmen enthielten. `ROADMAP_REBUILD.md` ist die aktive Roadmap.

**Entscheidung:** Die vorhandenen `docs/concepts/CONCEPT_F*.md` bleiben als
benötigte Konzept-Slots erhalten und werden Mappm-spezifisch fortgeschrieben:
explizite Local-/Cloud-Vault-Authority, Riverpod, Desktop-Verwaltung plus Mobile
Capture, Managed Mappm Cloud, Local Development Cloud, Core Assist und
reviewbare OCR-/LLM-Pipeline.

Entscheidung dokumentiert in: `docs/technical/DECISION_FOUNDATION_CONCEPT_REWRITE.md`.

## 7. Aktueller Implementationsstand

Der Code ist eine Flutter-App mit Layer-First-Struktur:

```text
lib/
├── data/
├── domain/
└── presentation/
```

Vorhanden sind:

- Domain-Entities für `Incident`, `Document`, `Profile` und `Task`.
- Repository-Interfaces.
- PocketBase-Repositories.
- Isar-Collections und lokaler Service.
- Cached-Repositories für Incidents und Documents.
- BLoCs für Auth, Incident-Liste und Incident-Details.
- Screens für Login, Dashboard, Drafts und Incident-Details.

Das ist wertvoll als Explorationsarbeit. Es sollte aber nicht als production-ready Fundament behandelt werden.

## 8. Kritische Befunde

### 8.1 Die App ist noch kein Produkt, sondern ein Spike

Viele Screens sind Mock-UI mit Beispieldaten. Das ist okay für Exploration, aber gefährlich, wenn es unmarkiert in Produktcode bleibt.

### 8.2 State Management und DI sind entschieden, aber noch nicht umgesetzt

Der aktuelle Code verwendet noch `flutter_bloc` + GetIt. Die Zielarchitektur ist nach R0-D2 aber Riverpod als gemeinsames State-Management- und Dependency-System.

**Entscheidung:** Nicht mischen. Riverpod wird Zielarchitektur; bestehender BLoC/GetIt-Code ist Spike-/Legacy-Code und wird in einer geplanten Foundation-Phase migriert.

Entscheidung dokumentiert in: `docs/technical/DECISION_STATE_MANAGEMENT.md`.

### 8.3 Domain ist nicht sauber isoliert

PocketBase-Typen erscheinen im Auth-Repository-Interface und dadurch in BLoC-State. Das koppelt die App fachlich an das Backend-SDK.

**Empfehlung:** Domain kennt nur DocMan-Typen, keine PocketBase-Modelle.

### 8.4 Offline-First ist nicht wirklich gelöst

Isar existiert, aber Sync, Konflikte, Delete-Spiegelung, Datei-Cache und lokale Einzelabfragen sind unvollständig.

**Empfehlung:** Offline-First als eigene Foundation-Phase planen, nicht nebenbei reparieren.

### 8.5 Tests bilden das Projekt nicht ab

Der vorhandene Widget-Test stammt noch aus dem Flutter-Template.

**Empfehlung:** Zuerst wenige echte Smoke- und Domain-Tests, dann pro Phase gezielte Tests.

## 9. Was ich anders machen würde

Meine vorgeschlagene Richtung:

1. Produktbegriff umstellen: `Case` im Code, "Vorgang" im UI, `Event`/"Ereignis" für Timeline-Einträge.
2. Riverpod als Zielarchitektur setzen und BLoC/GetIt nicht weiter ausbauen.
3. M2 eng schneiden, aber Mobile Capture als Haupt-Use-Case aufnehmen.
4. Local und Cloud als explizite Vault-Modi mit eigener Authority behandeln.
5. Sync, Backup, Sharing und Processing über stabile Contracts an Mappm Cloud anbinden.
6. Historische Annahme, superseded: Core Assist gehört heute in C2/C3;
   Advanced Assist bleibt später.
7. Workflows als Empfehlungen gestalten.
8. Erst Foundation stabilisieren, dann Features bauen.
9. Dokumentation zur Quelle der Wahrheit machen, aber alte importierte Konzepte nicht blind übernehmen.

## 10. Offene Entscheidungen

| ID | Entscheidung | Empfehlung | Priorität |
|---|---|---|---|
| D0 | Produktname | Entschieden: Produktname ist `Mappm`; `DocMan` bleibt vorerst technischer Repo-/Workspace-Name | Erledigt |
| D1 | Zentraler Begriff | Entschieden: `Case` im Code, "Vorgang" im UI, `Event`/"Ereignis" für Timeline-Einträge | Erledigt |
| D2 | State Management und DI | Entschieden: Riverpod ersetzt BLoC/GetIt als Zielarchitektur | Erledigt |
| D3 | Datenfluss | Rebaselined: Local Vault ist lokal autoritativ; Cloud Vault ist Mappm-Cloud-autoritativ; Migration ist explizit und verifiziert | Erledigt |
| D4 | Backend-Rolle | Rebaselined: Managed Mappm Cloud mit ASP.NET Core + PostgreSQL + S3 + Microcks; Local Development Cloud nur synthetisch | Erledigt |
| D5 | First Utility Scope | Rebaselined: Capture, Core Assist, Review, Vorgänge/Unterlagen, Search und Tasks als Commercial Core | Erledigt |
| D6 | Erweiterte Mobile-Verwaltung | Nach M2 und stabilem Sync planen | Mittel |
| D7 | Workflow-Regeln | Entschieden: Empfehlungen und Review statt harte Status-Käfige; harte Regeln nur für Integrität/Sicherheit | Erledigt |
| D8 | KI-Scope | Superseded: Core Assist ist C2/C3-Commercial-Core; Advanced Assist bleibt später und jede Realverarbeitung wartet auf Trust-/AI-Gates | Rebaselined |
| D9 | Alte Foundation-Konzepte | Entschieden: Konzept-Slots behalten, Inhalte DocMan-spezifisch neu schreiben; alte Inhalte sind nicht Source of Truth | Erledigt |
| D10 | Remote-Sync sensibler Daten | Rebaselined: Cloud-Sync nur im gewählten Cloud Vault und nach akzeptiertem Trust-/Key-/Privacy-Modell; Local Vault lädt nicht implizit hoch | Erledigt |
| D11 | Security-/Privacy-Baseline | Entschieden: Security-by-Design, sensible Datenklassen, Secure Storage, log-sparsam, E2EE-/Zero-Knowledge-faehig vorbereiten | Erledigt |
| D12 | Trust-/Verschluesselungs-/Deployment-Modell | Entschieden: austauschbare Data-/Processing-/Identity-Ports, Key-Management, E2EE-/Zero-Knowledge-faehiger Sync/Backup/Sharing, eIDAS/EUDI/ID-Austria-faehige Identity-Schicht | Erledigt |

## 11. Aktive Dokumente und nächste Drafts

Diese Dokumente bilden die aktive Orientierung. Die Drafts am Ende müssen vor R2-Implementation noch entschieden oder weiter ausgearbeitet werden:

```text
docs/ROADMAP_REBUILD.md
docs/roadmap/PHASE_INDEX.md
docs/roadmap/PILLAR_ROADMAP_INDEX.md
docs/technical/TECHNICAL_FOUNDATION_PLAN.md
docs/technical/R2_TECHNICAL_FOUNDATION_IMPLEMENTATION_PLAN.md
docs/technical/DECISION_PRODUCT_NAME.md
docs/technical/DECISION_HOME_HUB_BACKEND_TECHNOLOGY.md
docs/technical/DECISION_STATE_MANAGEMENT.md
docs/technical/DECISION_DATA_FLOW.md
docs/technical/DECISION_BACKEND_ROLE.md
docs/technical/DECISION_FIRST_UTILITY_SCOPE.md
docs/technical/DECISION_FOUNDATION_CONCEPT_REWRITE.md
docs/technical/DECISION_WORKFLOW_RULES.md
docs/technical/DECISION_INTELLIGENCE_SCOPE.md
docs/technical/DECISION_PRIVACY_SYNC_SCOPE.md
docs/technical/DECISION_LOCAL_DATABASE.md
docs/technical/DECISION_AUTH_PAIRING.md
docs/technical/DECISION_SECURITY_PRIVACY_MODEL.md
docs/technical/DECISION_PRODUCT_LANGUAGE.md
```

## 12. Working Agreement

- Keine neuen Features auf unklarer Foundation.
- Keine stillen Architekturwechsel.
- Keine SDK-Typen in Domain-Kontrakten.
- Mock-UI wird als Mock markiert oder entfernt.
- Konzeptarbeit bleibt dokumentarisch.
- Implementation startet erst nach genehmigtem Plan.
- Entscheidungen werden dokumentiert, nicht in Code-Kommentaren versteckt.
