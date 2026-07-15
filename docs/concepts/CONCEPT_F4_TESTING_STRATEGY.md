---
title: "Konzept F4 - Testing Strategy"
description: "Production-ready Teststrategie fuer Domain, Riverpod, Vaults, Capture, Assist, Contracts und Release Gates"
tags: [concept, foundation, testing, flutter, riverpod, vault, capture, contracts]
lastUpdated: "2026-07-15"
version: "5.0"
status: "accepted"
owner: "quality-readiness"
---

# Konzept F4 - Testing Strategy

## Status und Source of Truth

Akzeptiert. F4 operationalisiert die Produktqualitaet gemeinsam mit
`docs/technical/DECISION_MILESTONE_QUALITY_GATES.md`, F15 und F16. Es ersetzt
fruehere Home-Hub-, Pairing- und M2-Testplaene.

## Ziel

Tests muessen die zentralen Versprechen von Mappm beweisen:

- kein Verlust oder stilles Ueberschreiben sensibler Dokumente.
- exakt eine schreibende Vault-Autoritaet.
- belastbare Offline-, Queue-, Restart-, Retry- und Migrationspfade.
- nachvollziehbare, korrigierbare Assist-Vorschlaege.
- stabile Domain-, Repository- und API-Grenzen.
- zugaengliche, lokalisierte und responsive Kernflows.

Testabdeckung richtet sich nach Risiko und Blast Radius. Eine hohe Prozentzahl
ohne Schutz kritischer Transitionen ist kein Qualitaetsnachweis.

## Testebenen

| Ebene | Verbindlicher Fokus |
|---|---|
| Domain Unit Tests | Invarianten, Value Objects, Case-/Record-Links, Workflow- und Vault-Transitionen |
| Use-Case-/Notifier-Tests | Riverpod-State, Berechtigungen, Retry, Review und Orchestrierung |
| Repository-Tests | Mapper, Drift, File Store, Cache, Pending Operations und Migrationen |
| Widget-/Semantics-Tests | sichtbare Zustaende, Aktionen, Fokus, Textskalierung und Fehler |
| Golden-/Responsive-Tests | stabile Kernkomponenten und definierte Viewports nach Designfreigabe |
| Contract Tests | OpenAPI-Verbraucherverhalten und Microcks-Szenarien |
| Integration Tests | echte Adapter gegen Local Development Cloud und lokale Persistenz |
| Staging Smoke/E2E | freigegebene managed Flows mit ausschliesslich erlaubten Testdaten |

Fake-Repositories pruefen App- und Domain-Verhalten. Microcks prueft den
akzeptierten API-Vertrag. Local Development Cloud prueft reale Integration.
Keine Ebene ersetzt eine andere.

## Verbindliche Testmatrix

### Local und Cloud Vault

Jeder speicherrelevante Slice prueft mindestens:

- Local Vault als lokale Autoritaet.
- Cloud Vault als Cloud-Autoritaet mit lokalem Cache und Pending Operations.
- Account-/Device-Session, begrenzte Offline-Berechtigung und Reauth.
- Entitlement, Quota, Grace, Read-only, Export und Detached Recovery.
- Neustart, Idempotenz, Konflikt, Tombstone und Quellenerhalt.
- Local-to-Cloud und Cloud-to-Local inklusive Checkpoint, Verifikation und
  genau einer schreibenden Autoritaet.
- Kuendigung, Reaktivierung und Loeschung ohne Verlust des Exit-Pfads.

### Capture und Assist

Der globale Intake prueft:

- ein logisches Dokument pro abgeschlossener Scan-Einheit mit mehreren Seiten.
- mehrere zusammenhaengende oder nicht zusammenhaengende Dokumente in einer
  technischen Session.
- haltbares Original vor asynchroner Verarbeitung.
- 1-2 Minuten Verarbeitung, App-Schliessen und Fortsetzung nach Neustart.
- Upload, OCR, Extraktion, Indexierung und Matching als getrennte Fehlerstufen.
- Titelvorschlag fuer jeden neuen Case sowie Typ-, Fakten- und
  Case-/Record-Vorschlaege.
- beste Kandidaten auch bei niedriger Confidence; bei sehr niedriger Confidence
  steht der neue leichte Custom Case zuerst.
- immer verfuegbare manuelle Case-Auswahl in der Review.
- Teilfehler, Outlier, Retry, Reprocessing und erhaltene bestaetigte Werte.
- User-Bestaetigung aller sichtbaren Konsequenzen bis zur spaeteren,
  klassenweise freigegebenen Automation.

### Sicherheit und Datenschutz

- ausschliesslich vollsynthetische Fixtures, Screenshots und Contract Examples.
- keine echten oder nur anonymisierten privaten Dokumente.
- keine Inhalte, OCR-Texte, Dateinamen, Tokens oder PII in Logs und Telemetry.
- Redaction, Berechtigung, Export, Loeschung und Audit-Grenzen.
- Sperrbildschirm- und Notification-Datenschutz.

## Testdaten und Verzeichnisstruktur

```text
test/
  fixtures/
    domain/
    files/
    ui/
  helpers/
  unit/
  widget/
integration_test/
contracts/
  openapi/
  examples/
```

Fixtures sind frei erfunden, klein, deterministisch und versioniert. Eine
Fixture benennt Zweck, erwartete Fakten und erlaubte Verwendung. Secrets werden
nur durch offenkundig synthetische Testwerte ersetzt.

## Accessibility und visuelle Qualitaet

UI-Phasen testen die jeweils betroffenen Punkte:

- Semantics-Namen, Rollen, Status und Fokusreihenfolge.
- Tastaturbedienung und sichtbaren Fokus auf Desktop.
- Textskalierung bis mindestens `2.0` ohne Ueberlagerung oder Abschneiden.
- Kontrast und Nicht-Farb-Codierung von Status.
- reduzierte Bewegung.
- definierte Mobile-, Tablet- und Desktop-Viewports.

Goldens sind fuer stabile visuelle Verträge gedacht, nicht als Ersatz fuer
Verhaltens- oder Semantics-Tests.

## Quality Gates

Jeder Implementation Contract nennt exakte Commands und relevante Tests. Das
lokale Gate umfasst mindestens Formatierung, Analyzer und betroffene Tests.
Breitere Foundation-, Contract-, Integration- und Release-Gates folgen
`docs/technical/DECISION_MILESTONE_QUALITY_GATES.md`.

Ein frischer Checkout muss Dependencies, Codegen und Verify ueber die
projektlokalen Scripts reproduzierbar ausfuehren koennen. Generierte
Dart-Artefakte werden gemaess Projektkonvention erzeugt und nicht als
handgeschriebene Quelle behandelt.

Legacy-Warnungen duerfen klar als Baseline isoliert sein, aber nie neue
Regressionen, einen gebrochenen Produktpfad oder ein Release Gate verdecken.

## Definition of Done

Eine Phase ist nur abgeschlossen, wenn:

- jede Acceptance Condition mindestens einen falsifizierbaren Nachweis hat.
- Happy Path, relevante Fehler, Grenzen und Neustart abgedeckt sind.
- neue Provider und Repositories deterministisch testbar sind.
- API-Slices passende Microcks-/Contract-Nachweise besitzen.
- Accessibility-, Privacy- und Regression-Risiken geprueft sind.
- keine ausgelassenen Tests als stilles `TODO` verbleiben; Deferred Work besitzt
  Owner, Roadmap-Ziel und GitHub Issue.

## Stop Rules

Stop, wenn:

- Fakes gegen echte Cloud- oder private Daten sprechen.
- nur der Happy Path oder nur eine Vault-Variante getestet wird.
- Microcks als Ersatz fuer Domain-/Widget-Tests verwendet wird.
- Prozentabdeckung ohne kritische Assertions als Freigabe dient.
- instabile Sleeps, reale Zeit oder zufaellige IDs Tests nicht deterministisch
  machen.
- ein Release trotz fehlendem Restore-, Export-, Migrations- oder
  Datenschutz-Nachweis freigegeben werden soll.

## Handoff

Konkrete Testplanung und Gate-Nachweise gehen an `quality-readiness` und
`frontend-test-coverage`; Contract-Szenarien an `contract-api`; UI-Nachweise an
`ui-architect`, `ui-builder` und anschliessend `ui-auditor`.

## Enterprise Quality Contract

Dieses Konzept uebernimmt
`docs/execution/CONCEPT_ENTERPRISE_QUALITY_CONTRACT.md`. Bei Widerspruechen gilt
die strengere Regel und die betroffene Phase stoppt.
