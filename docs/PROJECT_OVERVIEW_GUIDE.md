---
title: "Mappm - Project Overview and Product Guide"
description: "Aktueller Einstieg in Produktmodell, Commercial Core, Architektur, Governance und Source of Truth"
tags: [overview, guide, product, strategy, planning]
lastUpdated: "2026-07-15"
version: "4.0"
status: "accepted"
owner: "product-concept/ui-onboarding"
---
# Mappm - Project Overview and Product Guide

## Zweck

Dieses Dokument ist der Einstiegspunkt für Produkt-, Konzept- und
Implementierungsarbeit. Es fasst die aktuelle Richtung zusammen, ersetzt aber
keine verlinkte Decision oder einen freigegebenen Implementation Contract.

`Mappm` ist der Produktname. `docman`/`DocMan` darf bis zur geplanten
technischen Migration als Repository-/Legacy-Name vorkommen, nicht als neue
sichtbare Marke.

## Produktthese

Mappm ist eine ruhige Dokumentenapplikation für private Haushalte, Familien und
kleine verwaltete Organisationskontexte. Sie nimmt Arbeit ab, indem sie
willkürlich eintreffende Dokumente erfasst, versteht, passenden Vorgängen oder
Unterlagen zuordnet und daraus nur die relevanten nächsten Schritte sichtbar
macht.

> Dokumente erfassen, sicher ablegen, automatisch verstehen, in Vorgänge oder
> Unterlagen einordnen, prüfen, finden, erledigen, exportieren und
> wiederherstellen.

Der erste Markt-Release ist ein production-ready **Commercial Core** mit
wenigen vollständigen Flows, kein Wegwerf-MVP. Die App ist search-first und
capture-first; ein KI-Chat oder Messenger ist keine primäre Oberfläche.

## Produktprinzipien

1. **Arbeit abnehmen:** Vor dem Scan sind keine Case-, Profil- oder
   Metadatenformulare nötig.
2. **Ein logisches Dokument:** Eine abgeschlossene Scan-Einheit enthält eine
   oder mehrere Seiten und wird danach separat verarbeitet.
3. **Asynchron und dauerhaft:** Original zuerst sichern; OCR, Extraktion,
   Matching und Indexierung dürfen Sekunden oder Minuten dauern und überstehen
   Neustarts.
4. **Minimaler Review:** Nur Titel, primärer Kontext, materielle Folge und
   echte Unsicherheit zeigen; Details progressiv offenlegen.
5. **Aktuell bestätigt, später reversibel automatisiert:** Core Assist schlägt
   vor. Automatische Zuordnung wird nur je Klasse nach Qualitätsnachweis,
   Abstention, Undo und Rollback aktiviert.
6. **Kein Datengefängnis:** Export, Restore, Cloud-to-Local-Exit und getrennte
   Löschentscheidungen bleiben Teil des Produktvertrags.
7. **Länderlogik als Inhalt:** Kuratierte, versionierte Country-/Provider-Packs
   ergänzen eine generische Engine; LLMs erfinden keine Fristen oder Ansprüche.
8. **Schlanke UI:** Fachliche Komplexität wird modelliert, aber nicht als große
   Typauswahl, Megaformular oder Dashboard-Flut an Nutzerinnen weitergereicht.

## Account, Vault und Assist

Normale Free-, Local- und Cloud-Nutzung benötigt einen Account für Identity,
Device Trust, Entitlements und Core Assist. Der Account bestimmt nicht die
Speicherautorität.

| Modus | Authority | Offline/Mehrgerät | Exit |
|---|---|---|---|
| Local Vault | lokale Metadaten und Dateien | lokal vollständig; kein impliziter Gerätesync | verschlüsselter Export/Restore und Detached Recovery |
| Cloud Vault | Mappm Cloud | policy-begrenzter Cache/Pending State; Multi-Device und Managed Backup nach Vertrag | Export, Reaktivierung oder verifizierte Cloud-to-Local-Migration |

Ein Vault-Wechsel ist ein überprüfter Migrationsworkflow, kein Toggle.
Kündigung führt nicht zur sofortigen Löschung: bezahlter Zeitraum, Grace/
Read-only, Reaktivierung, Export, Cloud-to-Local und Löschung sind getrennte
Zustände.

Core Assist ist eine eigene Processing-/Trust-Grenze und gehört zum
Commercial Core. Er umfasst OCR/Textextraktion, Dokumentgrenzen, Typ/Akteure/
Fakten, verpflichtende editierbare Titelvorschläge, Case-/Record-/Workflow-
Matching und Suchindexdaten. Assist macht Local Vault nicht zum Cloud Vault und
stellt kein stilles Backup dar.

Mappm Cloud ist die verwaltete Lösung für Account, Entitlements, Assist und
beim Cloud Vault auch Storage, Sync, Backup und später Secure Sharing. Local
Development Cloud verwendet dieselben Contracts ausschließlich mit
synthetischen Daten. Customer Home Hub, Tailscale und Self-hosting sind kein
aktiver Produktmodus.

## Domainmodell

Mappm verwendet einen generischen `Case` statt vieler sichtbarer Case-Typen.
In der deutschen UI heißt er „Vorgang“.

- **Case/Vorgang:** leichtgewichtiger Kontext für Ziel, Verlauf oder bewusste
  Sammlung; geführt oder Custom ist Konfiguration, kein eigener Domain-Typ.
- **CaseLink:** `part_of`, `caused_by`, `follow_up_to` oder `related_to`;
  „Subvorgang“ ist nur eine verständliche UI-Rolle für `part_of`.
- **Document/Dokument:** ein logisches Dokument mit einem oder mehreren
  Quell-/Dateiartefakten.
- **Record/Unterlage:** langlebiger Gegenstand mit Versionen, etwa Vertrag,
  Polizze, Pass oder Geburtsurkunde.
- **ManagedSubject:** verwaltete Person oder eigene Organisation, optional
  ohne Login.
- **ExternalParty:** Arzt, Behörde, Versicherer, Anbieter oder andere externe
  Person/Organisation mit Rollen und Kontaktdaten.
- **Fact, Claim, Task, Event:** strukturierte Aussage, Anspruch/Erstattung,
  nächster Schritt und Historieneintrag.

Jedes akzeptierte Dokument besitzt einen primären Case oder Record und darf
zusätzliche Beziehungen tragen. Passt kein bestehender/geführter Kontext,
entsteht ein leichter Custom Case mit automatisch vorgeschlagenem Titel. Ein
Custom Case darf fast leer beginnen; dieselbe Engine kann später Workflow,
Aufgaben, Termine und Links ergänzen.

## Capture und Review

```text
global scannen oder importieren
  -> Original und Manifest dauerhaft sichern
  -> Qualität, Dublette und Security prüfen
  -> OCR, Klassifikation, Extraktion und Indexierung
  -> Titel, Managed Subject, Case/Record und nächste Schritte vorschlagen
  -> nur relevante Folgen bestätigen oder korrigieren
  -> Dokument im DMS-Kern akzeptieren
```

„Neuen Case starten“ darf als einzige frühe optionale Absicht bereits beim
globalen Capture angeboten werden. Core Assist füllt trotzdem Titel,
Metadaten, mögliche weitere Beziehungen und Workflow-Muster vor. Capture in
einem bestehenden Case bleibt als sekundärer bewusster Weg verfügbar.

Eine Importsitzung darf zusammengehörige und fremde Dokumente enthalten.
Session-Nähe ist kein Beweis. Split/Merge/Reorder und Neuzuordnung bleiben
reversibel; Partial Failure verliert keine erfolgreichen Ergebnisse.

## Workflows und Länderpakete

Workflows sind kompositorische Führung, keine starre Case-Taxonomie. Ein Case
bleibt derselbe Domain-Typ, erhält aber optional Muster, Module,
Länder-/Institutionsvarianten und eine gepinnte Definitionversion.

Ein eigener verbundener Case entsteht nur bei eigenständigem Ziel und
Lebenszyklus. Schritte verschiedener Beteiligter können im selben Case
bleiben, wenn sie dasselbe Ergebnis verfolgen. Medizinische, Steuer- und
österreichische Kataloge bleiben Discovery, bis ihre offenen Fragen und
fachlich/rechtlichen Gates geschlossen sind.

Nicht unterstützte Kombinationen bleiben als klar manuelle Custom Cases
nutzbar. Länderpakete werden datiert, versioniert, migrierbar und mit
synthetischen Ambiguitäts-/Grenztests ausgeliefert.

## Commercial-Core-Gates

Die verbindliche Reihenfolge steht in `docs/ROADMAP_REBUILD.md`:

| Gate | Ergebnis |
|---|---|
| C0 | Produkt-, Trust-, Taxonomie- und Pack-Verträge entschieden |
| C1 | Vault-, Account-, Provider-, Contract- und Quality-Foundation |
| C2 | Capture, Core Assist und Review als vollständiger vertikaler Pfad |
| C3 | Dokumentkern, Cases, Records, Suche und Aufgaben |
| C4 | Migration, Kündigung, Backup/Restore, Retention und Lifecycle |
| C5 | Security, Legal, Store, CI/CD, Operations, Support und Release |
| C6 | Closed Beta mit Evidenz, Rollback und Supportfähigkeit |
| C7 | Commercial 1.0 nach dokumentiertem Go/No-Go |

Cloud-Vault-Storage für Commercial 1.0 bleibt bis VC-01 eine bewusste
Scope-Entscheidung. Managed Account/Entitlement/Core Assist ist nicht optional.

## Architektur

Flutter verwendet Clean Architecture mit `lib/app`, `lib/core`, `lib/domain`,
`lib/data` und `lib/presentation`. Riverpod ist Zielsystem für State und DI.
SQLite/Drift ist lokale strukturierte Persistenz; Dateien und Secrets liegen
getrennt in File Store beziehungsweise Secure Storage.

Backend und UI arbeiten contract-first. Das Frontend darf Backend-Bedarf
beschreiben; Contract/API/Backend besitzt DTOs, Endpunkte, Mapping,
Persistence, Security- und Policy-Architektur. OpenAPI und Microcks ermöglichen
Cliententwicklung ohne laufendes echtes Backend. Fakes bleiben hinter Domain-
Repository-Interfaces und verwenden ausschließlich synthetische Daten.

## Trust und Compliance

Dokumente, Metadaten, OCR-/LLM-Output, Suchindex, Profile und Diagnose sind
sensibel. Cloud-Dateien oder reale Assist-Verarbeitung starten nicht vor
akzeptiertem Key-, Recovery-, Provider-, Retention-, Training-, Lösch- und
AI-/Privacy-Gate.

Recht, Store-Regeln, Plattformen und technische Standards sind zeitabhängig.
Jeder betroffene Slice nennt `asOf`, Jurisdiktion, offizielle Quelle, Reviewer,
Recheck-Trigger und Release-Gate. Das Regulatory Source Register ist keine
einmalige Freigabe.

## Implementationsstand

Stand 15. Juli 2026 ist der aktive Code weiterhin ein Spike mit ersten
`app/core/data/domain/presentation`-Pfaden, aber auch BLoC/GetIt, Isar,
PocketBase, `Incident`-Domain und Mock-/Legacy-Screens. Diese Teile sind
Referenz, nicht production-ready Zielarchitektur.

Neue Arbeit folgt dem freigegebenen Agent-/Phase-Track. Legacy wird nicht
nebenbei modernisiert, sondern kontrolliert isoliert, migriert oder entfernt.
Der erste Implementation Contract ist erst nach ausdrücklicher Freigabe
auszuführen.

## Source of Truth

- Produkt und Sequenz: `docs/ROADMAP_REBUILD.md` und
  `docs/roadmap/PHASE_INDEX.md`.
- Entscheidungen und offene Punkte:
  `docs/execution/DECISION_TRACEABILITY_MATRIX.md` und
  `docs/discovery/OPEN_QUESTIONS_REGISTER.md`.
- Discovery-Inventar und Draft-Grenzen:
  `docs/discovery/DISCOVERY_INDEX.md`.
- Vollstaendiges technisches Entscheidungsinventar:
  `docs/technical/TECHNICAL_DECISION_INDEX.md`.
- Produktmodell: `docs/technical/DECISION_COMMERCIAL_CORE_SCOPE.md`,
  `DECISION_ACCOUNT_VAULT_ASSIST_PRODUCT_MODEL.md`,
  `DECISION_VAULT_STORAGE_AND_CLOUD_PRODUCT_MODEL.md` und
  `DECISION_CASE_DOCUMENT_RECORD_MODEL.md`.
- Capture/Assist: `DECISION_DOCUMENT_CAPTURE.md`,
  `DECISION_CAPTURE_FIRST_ASSISTED_ROUTING.md` und
  `DECISION_INTELLIGENCE_SCOPE.md`.
- Security/Privacy: `DECISION_SECURITY_PRIVACY_MODEL.md`, SEC/REG/DATA-
  Konzepte und Regulatory Source Register.
- UI: F-Konzepte, MP-DS-Konzepte, Mock-Evidenz und freigegebene
  UI-Implementation-Pläne.

## Working Agreement

- Keine Implementierung ohne freigegebenen, ausführbaren Phase Contract.
- Keine stillen Architektur-, Trust-, Scope- oder Rechtsentscheidungen.
- Keine SDK-/DB-/Contract-Typen in Domain oder Presentation.
- Keine privaten Echtdaten in Tests, Mocks, Logs oder Evidenz.
- Keine automatische fachliche Entscheidung ohne ihr Quality Gate.
- Findings werden behoben oder mit Owner, Trigger und blockierendem Gate in
  das zentrale Register aufgenommen; sie verschwinden nicht in Freitext-TODOs.
