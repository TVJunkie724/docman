---
title: "DocMan - Rebuild Roadmap"
description: "Vorgeschlagene Roadmap, um DocMan vom aktuellen Spike zu einer stabilen, lokalen, erweiterbaren Dokumenten-App zu entwickeln"
tags: [roadmap, rebuild, product, planning, foundation]
lastUpdated: "2026-04-27"
version: "1.1"
---

# DocMan - Rebuild Roadmap

## 1. Zweck

Diese Roadmap ist der aktive Neustart der Projektplanung. Sie ersetzt die alten Säulen-Roadmaps als Steuerungsdokument: Entscheidungen treffen, Foundation stabilisieren, MVP verkleinern und erst danach neue Produktphasen ausarbeiten.

## 2. Leitidee

DocMan sollte zuerst als Desktop-App mit Mobile Capture funktionieren: unterwegs Dokumente erfassen, zuhause am Desktop prüfen und Vorgängen zuordnen. Vollständiger Sync, mobile Verwaltung und KI werden danach auf eine stabile Basis gesetzt.

```text
Foundation
  -> Desktop Core + Mobile Capture
      -> Family + Sync
          -> Extended Mobile
              -> Intelligence
```

## 3. Status-Legende

| Status | Bedeutung |
|---|---|
| Proposed | Vorschlag, noch nicht final entschieden |
| Decision Needed | Blockiert durch offene Entscheidung |
| Planned | Akzeptiert, aber noch nicht begonnen |
| In Progress | In Arbeit |
| Done | Abgeschlossen |
| Deferred | Bewusst zurückgestellt |

## 4. Phase R0 - Produkt- und Architekturentscheidungen

**Status:** Done for product baseline

Hinweis: Die Produkt-Baseline ist entschieden. Die konkrete Backend-Technologie und der Home-Hub-Schnitt bleiben als technische Draft-Entscheidungen in R2/R3 offen.

**Ziel:** Die wichtigsten Grundsatzfragen werden entschieden, bevor Code weiter wächst.

### Deliverables

- `docs/technical/DECISION_PRODUCT_LANGUAGE.md`
- `docs/technical/DECISION_STATE_MANAGEMENT.md`
- `docs/technical/DECISION_DATA_FLOW.md`
- `docs/technical/DECISION_BACKEND_ROLE.md`
- `docs/technical/DECISION_MVP_SCOPE.md`
- `docs/technical/DECISION_WORKFLOW_RULES.md`
- `docs/technical/DECISION_INTELLIGENCE_SCOPE.md`
- `docs/technical/DECISION_PRIVACY_SYNC_SCOPE.md`

### Offene Entscheidungen

| ID | Entscheidung | Empfohlene Richtung |
|---|---|---|
| R0-D1 | Heißt das zentrale Modell weiterhin `Incident`? | Entschieden: `Case` im Code, "Vorgang" im UI, `Event`/"Ereignis" für Timeline-Einträge |
| R0-D2 | BLoC/GetIt oder Riverpod? | Entschieden: Riverpod als State Management und DI; BLoC/GetIt wird nicht weiter ausgebaut |
| R0-D3 | Local-first oder Backend-first? | Entschieden: local-first mit generischem DocMan Sync Backend; Home Hub/Tailscale nur erste Self-Hosted-Betriebsform |
| R0-D4 | Rolle von PocketBase und Backend? | Entwurf: eigener self-hosted DocMan Server Stack per Docker/Compose; PocketBase nicht als Zielarchitektur |
| R0-D5 | Was ist der erste MVP? | Entschieden: Desktop-Verwaltung plus Mobile Capture mit minimalem Home-Hub-Eingangskorb |
| R0-D6 | Wie streng sind Workflows? | Entschieden: Empfehlungen/Review; harte Regeln nur für Integrität/Sicherheit |
| R0-D7 | Gehört KI/OCR in den MVP? | Entschieden: Nein; lokale/self-hosted Pipeline vorbereiten |
| R0-D8 | Welche Sync-Grenzen gelten für sensible Daten? | Entschieden: MVP nur private Home-Hub-Umgebung; Secrets getrennt |

### Akzeptanzkriterien

- Jede Entscheidung hat ein kurzes Decision-Dokument.
- Alte widersprüchliche Foundation-Dokumente sind markiert oder aus der aktiven Planung genommen.
- Es gibt eine akzeptierte Definition des ersten MVP.

## 5. Phase R1 - Documentation Source of Truth

**Status:** Done for active planning baseline

Hinweis: Die aktiven Planungsdokumente sind bereinigt. README/Projektbeschreibung bleiben als separates Follow-up offen, weil sie erst nach dem R2-Foundation-Plan sinnvoll finalisiert werden können.

**Ziel:** Die Dokumentation wird verlässlich, widerspruchsfrei und projektbezogen.

### In Scope

- Bestehende Produkt-Roadmaps prüfen und auf den neuen MVP-Scope abgleichen.
- `docs/concepts/CONCEPT_F*.md` als Legacy-Input behandeln und DocMan-spezifisch neu schreiben.
- Rewrite-Reihenfolge für Foundation-Konzepte festlegen.
- Zusätzliches F17-Konzept für Mobile Capture planen.
- F1 Project Structure neu schreiben.
- F10 Local Storage neu schreiben.
- F2 State Management neu schreiben.
- F3 Coding Conventions neu schreiben.
- F5 Error Handling neu schreiben.
- F11 API Integration neu schreiben.
- F12 Secure Storage neu schreiben.
- F4 Testing Strategy neu schreiben.
- F6 Environment Configuration neu schreiben.
- F7 Logging neu schreiben.
- F15 Mock Repository Blueprint neu schreiben.
- F13 Configuration Pages neu schreiben.
- F14 Form Field Catalog neu schreiben.
- F9 Legal / Privacy neu schreiben.
- F16 CI/CD Pipeline neu schreiben.
- F8 Distribution Readiness neu schreiben.
- F8b Review Access Strategy neu schreiben.
- F17 Mobile Capture Plan neu erstellen.
- Alte Produkt-Roadmaps und alten Refactoring-Plan löschen.
- Eine technische Foundation-Roadmap erstellen.
- README-/Projektbeschreibungs-Update als Follow-up erfassen.

### Out of Scope

- Feature-Implementation.
- UI-Redesign.
- Backend-Migration.

### Offene Entscheidungen

| ID | Entscheidung | Empfohlene Richtung |
|---|---|---|
| R1-D1 | Was passiert mit alten Foundation-Konzepten? | Entschieden: Konzept-Slots behalten, Inhalte DocMan-spezifisch neu schreiben; alte Inhalte sind nicht Source of Truth |
| R1-D2 | Bleiben alte P1 bis P7 Roadmaps aktiv? | Entschieden: Nein, alte Roadmaps gelöscht; Rebuild-Roadmap ist Source of Truth |

## 6. Phase R2 - Technical Foundation

**Status:** Proposed

**Ziel:** Der aktuelle Spike wird in eine saubere App-Basis überführt.

### In Scope

- App-Konfiguration statt harter URLs.
- Domain-Typen statt SDK-Typen in Interfaces.
- Eindeutige Dependency-Injection-Strategie.
- Lokale Persistenzstrategie.
- Sync-fähige IDs und Modellgrenzen für späteres Backend.
- Fehler- und Result-Modell.
- Minimal sinnvolle Testbasis.
- Trennung von Mock-Screens und Produkt-Screens.

### Out of Scope

- Neue Produktfeatures.
- KI-Implementation.
- Mobile-Capture-Feature-Implementation.
- Vollständiger Sync.

### Offene Entscheidungen

| ID | Entscheidung | Empfohlene Richtung |
|---|---|---|
| R2-D1 | Wie wird die neue F1-Zielstruktur migriert? | Zielstruktur akzeptiert; Migrationsstrategie noch planen |
| R2-D2 | Wie werden Fehler in Domain und UI modelliert? | Einheitliches Result-/Failure-Konzept |
| R2-D3 | Wie wird Mock-UI behandelt? | Als `mocks/` isolieren oder entfernen |
| R2-D4 | Welche lokale Datenbank ist Zieltechnologie? | Entschieden: SQLite + Drift fuer strukturierte lokale Daten; Dateien und Secrets bleiben separat |
| R2-D5 | Wie funktionieren Auth/Pairing für Home Hub? | Draft-Entscheidung in `DECISION_AUTH_PAIRING.md` |
| R2-D6 | Was ist das Security-/Privacy-Minimum? | Draft-Entscheidung in `DECISION_SECURITY_PRIVACY_MODEL.md` |

### Akzeptanzkriterien

- Projekt startet ohne Platzhalter-Konfiguration im Produktpfad.
- Domain importiert keine PocketBase-Typen.
- Tests referenzieren die echte App-Struktur.
- Dokumentierte Architektur entspricht dem Code.

## 7. Phase R3 - Desktop Core and Mobile Capture MVP

**Status:** Proposed

**Ziel:** Eine Person kann Dokumente unterwegs mobil erfassen und am Desktop zuverlässig verwalten.

### In Scope

- Ein Haushalt.
- Ein aktives Profil.
- Vorgänge anlegen, bearbeiten, schließen.
- Dokumente als Drafts erfassen.
- Drafts einem Vorgang zuordnen.
- Mobile Foto-/Scan-Erfassung.
- Mobile lokale Upload-Queue.
- Minimaler Home-Hub-Upload in die Draft-Inbox.
- Optionale mobile Vorgangszuordnung über gecachte Liste offener Vorgänge.
- Lokale Suche.
- Lokale Persistenz.
- Klare leere, ladende und fehlerhafte Zustände.

### Out of Scope

- OAuth als Pflichtpfad.
- Multi-Tenant.
- Familienberechtigungen.
- Vollständige mobile Vorgangsverwaltung.
- Vollständiger Multi-Geräte-Sync.
- KI-Implementation.
- App-Store-Distribution.

### Offene Entscheidungen

| ID | Entscheidung | Empfohlene Richtung |
|---|---|---|
| R3-D1 | Braucht der lokale MVP Login? | Nein, optionaler Dev-/Local-Mode reicht |
| R3-D2 | Was ist die minimale Dokument-Erfassung? | Desktop-Dateiauswahl plus Mobile Capture in Draft-Inbox |
| R3-D3 | Welche Suchfelder sind MVP-relevant? | Titel, Tags, Sender, Datum, Profil |
| R3-D4 | Wie wird Mobile mit dem Home Hub gekoppelt? | Pairing/Login als eigene Detailentscheidung |

### Akzeptanzkriterien

- Nutzer kann einen Vorgang mit Dokumenten am Desktop vollständig verwalten.
- Mobile kann Dokumente offline erfassen und später hochladen.
- Desktop sieht mobile Uploads in einer Draft-Inbox.
- Direkte mobile Vorgangszuordnung funktioniert als optionaler Komfortpfad.
- Desktop-App bleibt ohne Netzwerk nutzbar.
- Keine sichtbaren Mock-Daten im Produktpfad.
- Persistenz über App-Neustart funktioniert.

## 8. Phase R4 - Family Profiles

**Status:** Proposed

**Ziel:** DocMan wird von einer Einzelperson-App zu einer Haushalts-App.

### In Scope

- Mehrere Profile in einem Haushalt.
- Aktives Profil wechseln.
- Vorgänge und Dokumente einem Profil zuordnen.
- Einfache Manager-/Kind-Beziehung.

### Out of Scope

- Vollständige Multi-Tenancy über mehrere Haushalte.
- Komplexe Rollenmatrix.
- Remote Sharing.

### Offene Entscheidungen

| ID | Entscheidung | Empfohlene Richtung |
|---|---|---|
| R4-D1 | Welche Profildaten sind sensibel? | Ausweis-/SV-Daten besonders behandeln oder verschieben |
| R4-D2 | Brauchen Kinder eigene Accounts? | Nein für frühe Phasen |

## 9. Phase R5 - Sync and Auth

**Status:** Proposed

**Ziel:** Daten können zwischen Geräten über ein generisches DocMan Sync Backend synchronisiert und Sessions sicher verwaltet werden.

### In Scope

- Auth-Flow.
- Session-Persistenz.
- Backend-agnostischer Sync-Status.
- Konfliktstrategie.
- Remote-Dateispeicher oder Sync-Dateipfad.
- Erste Betriebsform: Self-Hosted Home Hub.

### Out of Scope

- KI-gestützte automatische Dokumentverarbeitung.
- Vollständige Mandantenverwaltung für externe Haushalte.
- Öffentliche Sharing-Funktionen.

### Offene Entscheidungen

| ID | Entscheidung | Empfohlene Richtung |
|---|---|---|
| R5-D1 | Welche konkrete Backend-Implementierung trägt den Sync? | Eigenständiger DocMan Server Stack; PocketBase höchstens historischer Spike/Adapter |
| R5-D2 | Welche Daten werden remote synchronisiert? | Privacy-Klassen definieren |
| R5-D3 | Wie werden Konflikte gelöst? | Zunächst sichtbar machen, nicht still überschreiben |

## 10. Phase R6 - Extended Mobile

**Status:** Proposed

**Ziel:** Mobile wächst vom Capture-Kanal zu einer stärkeren Begleit-App.

### In Scope

- Batch-Scan.
- Vollständigere mobile Vorgangsansicht.
- Bessere mobile Suche und Filter.
- Mobile Korrektur von Metadaten.
- Weitere Offline-Sync-Funktionen.

### Out of Scope

- Desktop-Parität.
- KI-basierte automatische Entscheidungen.

### Offene Entscheidungen

| ID | Entscheidung | Empfohlene Richtung |
|---|---|---|
| R6-D1 | Bild oder PDF als primäres Scanformat? | PDF für mehrseitige Dokumente, Bild als Rohquelle prüfen |
| R6-D2 | Muss Mobile offline scannen können? | Ja, zumindest lokal queued |

## 11. Phase R7 - Intelligence

**Status:** Deferred

**Ziel:** DocMan unterstützt beim Erkennen, Sortieren und Vorschlagen.

### In Scope

- OCR.
- Auto-Tagging.
- Vorschläge für Sender, Datum, Betrag und Dokumenttyp.
- Vorschläge für nächsten Workflow-Schritt.

### Out of Scope

- Stille automatische Statusänderungen.
- KI als Voraussetzung für Kernflows.

### Offene Entscheidungen

| ID | Entscheidung | Empfohlene Richtung |
|---|---|---|
| R7-D1 | Lokale KI auf welchem Server? | Erst nach stabiler Dokumentenbasis und realer OCR-/LLM-Hardware entscheiden |
| R7-D2 | Automatisch oder manuell gestartet? | Vorschläge manuell bestätigbar machen |

## 12. Empfohlene erste Arbeitssequenz

```text
1. R2 Draft-Entscheidungen schließen
2. R2 Implementation-Plan schreiben
3. R2 implementieren und auditieren
4. R3 Desktop Core + Mobile Capture MVP konzipieren
```

## 13. Nicht jetzt bauen

Diese Themen sind wertvoll, aber aktuell zu früh:

- KI/OCR.
- Mobile Batch Scan.
- Vollständige Multi-Tenancy.
- App-Store-Distribution.
- Komplexe Dokumentversionierung.
- Vollständiges Rollen- und Berechtigungsmodell.

## 14. Entscheidungsregister

| ID | Thema | Status |
|---|---|---|
| R0-D1 | Produktbegriff | Done |
| R0-D2 | State Management und DI | Done |
| R0-D3 | Local-first Datenfluss | Done |
| R0-D4 | Backend-Rolle / PocketBase | Draft, technische Konkretisierung in R2/R3 |
| R0-D5 | MVP-Scope | Done |
| R0-D6 | Workflow-Regeln | Done |
| R0-D7 | Intelligence Scope | Done |
| R0-D8 | Privacy-/Sync-Scope | Done |
| R1-D1 | Umgang mit alten Foundation-Konzepten | Done |
| R1-D2 | Alte Roadmaps | Done |
| R2-D1 | Projektstruktur-Migration | Decision Needed |
| R2-D2 | Fehler- und Result-Modell | Decision Needed |
| R2-D4 | Lokale Datenbank | Done |
| R2-D5 | Auth/Pairing | Draft |
| R2-D6 | Security/Privacy Modell | Draft |
| R3-D1 | Login im lokalen MVP | Decision Needed |
| R5-D2 | Remote-Sync sensibler Daten | Done for MVP scope; revisit before full sync |
