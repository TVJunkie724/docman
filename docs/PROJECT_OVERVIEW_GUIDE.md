---
title: "DocMan - Project Overview & Product Guide"
description: "Strategischer Überblick über Produktziel, Grundannahmen, kritische Entscheidungen, aktuellen Zustand und empfohlene Richtung für DocMan"
tags: [overview, guide, product, strategy, planning]
lastUpdated: "2026-04-27"
version: "2.1"
---

# DocMan - Project Overview & Product Guide

## 1. Zweck

Dieses Dokument ist die gemeinsame Orientierung für DocMan. Es beschreibt nicht nur, was bereits geplant oder gebaut wurde, sondern auch, welche Richtung das Projekt aus heutiger Sicht nehmen sollte.

Es ist bewusst kritisch. DocMan hat eine starke Produktidee, aber der aktuelle Stand vermischt Produktvision, technische Experimente, Mock-UI, importierte Foundation-Konzepte und teilweise widersprüchliche Architekturentscheidungen. Bevor neue Features gebaut werden, braucht das Projekt eine klare Mitte.

## 2. Produktthese

DocMan sollte eine ruhige, robuste Dokumenten-App für Familien und Haushalte werden.

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
- `Document` / Dokument: Ein Anhang oder Nachweis.
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

## 4. Empfohlene Produktprinzipien

### 4.1 Local-first mit backend-agnostischem Sync

DocMan verwaltet private, langfristig wichtige Dokumente. Deshalb sollte die lokale App auch ohne Server sinnvoll funktionieren.

**Entscheidung:** DocMan wird local-first. Die lokale Datenbank ist die Quelle der Wahrheit für die App-Nutzung. Sync ist Replikation, Backup und Multi-Geräte-Funktion, nicht die Voraussetzung dafür, dass die App nutzbar ist.

Die stabile Produktgrenze ist nicht Tailscale und nicht der Home Hub, sondern ein generisches DocMan Sync Backend. Der Home Hub ist die erste empfohlene Self-Hosted-Betriebsform. Tailscale ist die empfohlene private Netzwerkvariante für frühe Setups ohne offene Firewall-Ports, aber kein Produktbestandteil und keine Architekturabhängigkeit.

```text
Local database = source of truth
DocMan Sync Backend = replication / backup / multi-device

Backend variants:
  - Home Hub on NAS / home server
  - VPS / hosted private server
  - Single-device mode without sync backend
```

Entscheidung dokumentiert in: `docs/technical/DECISION_DATA_FLOW.md`.

### 4.2 Desktop-Verwaltung plus Mobile Capture

Desktop ist der Ort für Sortieren, Prüfen, Suchen, Zuweisen und Verwalten. Mobile ist der schnelle Eingang für Scans unterwegs.

**Entscheidung:** Mobile Capture gehört in den MVP, aber nicht als vollständige mobile Verwaltungs-App. Der MVP enthält eine capture-only Mobile-App mit lokaler Upload-Queue, minimalem Home-Hub-Upload und optionaler Vorgangszuordnung.

Draft-Inbox bleibt der sichere Standard. Wenn eine einfache, gecachte Liste offener Vorgänge verfügbar ist, darf Mobile einen Scan direkt einem Vorgang zuordnen. Vollständige mobile Vorgangsverwaltung und echter Multi-Geräte-Sync bleiben post-MVP.

Entscheidung dokumentiert in: `docs/technical/DECISION_MVP_SCOPE.md`.

### 4.3 Self-hosted Server statt Cloud-Produkt

DocMan soll nicht als Cloud-SaaS geplant werden. Die Zielrichtung ist ein selbst betriebener Server-Stack auf vorhandener Infrastruktur: NAS, Mini-Server oder größerer Heimserver, vorzugsweise als Docker-/Compose-Setup.

**Entwurf:** Der erste MVP braucht wegen Mobile Capture einen minimalen Home-Hub-Anteil als Eingangskorb. Das ist noch kein vollständiges Sync Backend. Der spätere Server wird trotzdem früh grob mitgeplant, damit lokale IDs, Dokumentablage, Sync-Journal, Upload-Queue und Review-Flows nicht später gegen die Produktlogik arbeiten.

Der langfristige Server-Stack ist nicht PocketBase als Produktkern, sondern ein eigener DocMan Server Stack:

```text
DocMan Server Stack
  -> API / Sync Backend
  -> PostgreSQL metadata store
  -> S3-compatible file storage
  -> Job queue
  -> OCR / document parsing workers
  -> local LLM gateway
  -> optional search index
```

PocketBase kann als frühe Referenz oder Spike gelten, ist aber nach aktuellem Entwurf nicht Zielarchitektur.

Entwurf dokumentiert in: `docs/technical/DECISION_BACKEND_ROLE.md`.

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

### 4.5 KI später, aber als Pipeline mitdenken

KI kann DocMan später deutlich besser machen: OCR, Auto-Tagging, Status-Vorschläge, Dokumenterkennung und Vorschläge beim Ausfüllen von Formularen. Aber ohne stabile Dokumentstruktur erzeugt KI vor allem zusätzliche Unklarheit.

**Empfehlung:** P7 bleibt aus dem MVP heraus, wird aber architektonisch als asynchrone, lokale Dokument-Pipeline vorgedacht. Die App übernimmt KI-Ergebnisse nicht still, sondern zeigt Vorschläge mit Review-Zustand.

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

Entscheidung dokumentiert in: `docs/technical/DECISION_PRIVACY_SYNC_SCOPE.md`.

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

### Stufe 1 - MVP: Desktop-Kern plus Mobile Capture

Ziel: Eine Person kann Dokumente unterwegs mobil erfassen und am Desktop zuverlässig verwalten.

Enthält:

- Ein Haushalt.
- Ein aktives Profil.
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
- Erste empfohlene Backend-Variante: Self-Hosted Home Hub.
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

Aktuell gibt es vier aktive Ebenen:

- Rebuild-Roadmap unter `docs/ROADMAP_REBUILD.md`.
- Foundation-Konzepte unter `docs/concepts/CONCEPT_F*.md`.
- Technische Decisions und Foundation-Plan unter `docs/technical/`.
- Projektlokale Codex-Skills unter `.codex/skills/`.

Die alten Produkt-Roadmaps und der alte Refactoring-Plan wurden entfernt, weil sie noch `Incident`, PocketBase/OAuth, BLoC/GetIt oder andere überholte Annahmen enthielten. `ROADMAP_REBUILD.md` ist die aktive Roadmap.

**Entscheidung:** Die vorhandenen `docs/concepts/CONCEPT_F*.md` bleiben als benötigte Konzept-Slots erhalten und wurden DocMan-spezifisch neu geschrieben: local-first, self-hosted, Riverpod, Desktop-Verwaltung plus Mobile Capture, minimaler Home-Hub-Eingangskorb und spätere OCR-/LLM-Pipeline.

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
3. MVP eng schneiden, aber Mobile Capture als Haupt-Use-Case aufnehmen.
4. Local-first als Architekturzentrum setzen.
5. Sync backend-agnostisch halten; Home Hub ist erste Betriebsform, nicht Produktgrenze.
6. KI konsequent verschieben.
7. Workflows als Empfehlungen gestalten.
8. Erst Foundation stabilisieren, dann Features bauen.
9. Dokumentation zur Quelle der Wahrheit machen, aber alte importierte Konzepte nicht blind übernehmen.

## 10. Offene Entscheidungen

| ID | Entscheidung | Empfehlung | Priorität |
|---|---|---|---|
| D1 | Zentraler Begriff | Entschieden: `Case` im Code, "Vorgang" im UI, `Event`/"Ereignis" für Timeline-Einträge | Erledigt |
| D2 | State Management und DI | Entschieden: Riverpod ersetzt BLoC/GetIt als Zielarchitektur | Erledigt |
| D3 | Datenfluss | Entschieden: local-first mit generischem DocMan Sync Backend; Home Hub/Tailscale nur erste Self-Hosted-Betriebsform | Erledigt |
| D4 | Backend-Rolle | Entwurf: eigener self-hosted DocMan Server Stack per Docker/Compose; PocketBase nicht als Zielarchitektur | Hoch |
| D5 | MVP-Scope | Entschieden: Desktop-Verwaltung plus Mobile Capture, minimaler Home-Hub-Eingangskorb, optionale Vorgangszuordnung | Erledigt |
| D6 | Erweiterte Mobile-Verwaltung | Nach MVP und stabilem Sync planen | Mittel |
| D7 | Workflow-Regeln | Entschieden: Empfehlungen und Review statt harte Status-Käfige; harte Regeln nur für Integrität/Sicherheit | Erledigt |
| D8 | KI-Scope | Entschieden: nicht MVP, aber lokale/self-hosted Pipeline vorbereiten | Erledigt |
| D9 | Alte Foundation-Konzepte | Entschieden: Konzept-Slots behalten, Inhalte DocMan-spezifisch neu schreiben; alte Inhalte sind nicht Source of Truth | Erledigt |
| D10 | Remote-Sync sensibler Daten | Entschieden: MVP-Sync nur private Home-Hub-Umgebung; Datenklassen und Secrets getrennt | Erledigt |

## 11. Aktive Dokumente und nächste Drafts

Diese Dokumente bilden die aktive Orientierung. Die Drafts am Ende müssen vor R2-Implementation noch entschieden oder weiter ausgearbeitet werden:

```text
docs/ROADMAP_REBUILD.md
docs/technical/TECHNICAL_FOUNDATION_PLAN.md
docs/technical/DECISION_STATE_MANAGEMENT.md
docs/technical/DECISION_DATA_FLOW.md
docs/technical/DECISION_BACKEND_ROLE.md
docs/technical/DECISION_MVP_SCOPE.md
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
