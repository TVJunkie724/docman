---
title: "Konzept F2 - State Management"
description: "Verbindliches Riverpod-State-Modell fuer Vault-Autoritaet, Capture, Assist, Migration und testbare Abhaengigkeiten"
tags: [concept, foundation, riverpod, state-management, dependency-injection, vault, capture, assist]
lastUpdated: "2026-07-22"
version: "5.1"
status: "accepted"
owner: "foundation/product"
---

# Konzept F2 - State Management

## Status und Source of Truth

Akzeptiert. Dieses Konzept ersetzt alle frueheren BLoC-, GetIt-, Home-Hub- und
universellen Local-first-Annahmen. Das Produktmodell wird in
`docs/technical/DECISION_ACCOUNT_VAULT_ASSIST_PRODUCT_MODEL.md`,
`docs/technical/DECISION_VAULT_STORAGE_AND_CLOUD_PRODUCT_MODEL.md` und
`docs/concepts/CONCEPT_F36_VAULT_MODES_CLOUD_LIFECYCLE.md` festgelegt.

## Zweck

F2 definiert Riverpod als State-Management- und Dependency-Injection-Grenze der
Mappm-App. Der State muss fachliche Dimensionen explizit halten, anstatt sie in
einem allgemeinen `connected`, `loading` oder `syncStatus` zu vermischen.

## Verbindliche Architektur

```text
Widget
  -> Riverpod Provider / Notifier
      -> Use Case oder Domain-Repository-Vertrag
          -> Data-Implementierung
              -> Drift / File Store / Secure Storage / Mappm Cloud API
```

- Neue Produktpfade verwenden Riverpod; BLoC und GetIt werden nicht erweitert.
- Presentation importiert weder Drift noch HTTP-, Storage- oder Backend-SDKs.
- Provider verdrahten Implementierungen, schaffen aber nicht selbst die
  Austauschbarkeit. Diese entsteht durch Domain-Ports.
- Remote DTOs, Persistenzmodelle und API-Clients bleiben im Data Layer.
- Riverpod selbst wird in Tests nicht gemockt; Abhaengigkeiten werden per
  Provider Override ersetzt.

Provider liegen gemaess F1 unter `lib/app/providers` fuer appweite Composition
und unter `lib/presentation/providers` fuer Screen- und Flow-State. Eine Phase
darf die genaue Unterstruktur festlegen, aber keine konkurrierende
Feature-first-Rootarchitektur einfuehren.

## State-Dimensionen

### Vault und Konto

Mindestens getrennt zu modellieren sind:

- Vault-Autoritaet: `local` oder `cloud`.
- lokale Verfuegbarkeit: vollstaendig, teilweise, nur Metadaten oder nicht
  verfuegbar.
- Account-/Device-Session einschliesslich begrenzter Offline-Berechtigung.
- Cloud-Schreibfaehigkeit und bestaetigte Cloud-Revision.
- ausstehende lokale Operationen und Konflikt-/Review-Bedarf.
- Entitlement, Assist-Kontingent, Quota, Grace und Read-only.
- Migration und Quellstatus nach einer Migration.
- Detached Recovery als eigener eingeschraenkter Betriebszustand.

Ein Local Vault bleibt lokal autoritativ. Ein Cloud Vault bleibt
serverautoritativ; lokale Aenderungen sind bis zur Cloud-Bestaetigung durable
Pending Operations. Assist-Verarbeitung ist weder Sync noch Backup.

### Capture und Verarbeitung

Capture-State ist orthogonal zum Vault-State und umfasst:

- technische Capture Session und einzelne logische Dokumente.
- lokale Haltbarkeit des Originals.
- Upload-, OCR-, Extraktions-, Indexierungs- und Matching-Fortschritt.
- pro Dokument einen Processing Job mit Wiederanlauf und Idempotenz.
- vorgeschlagenen Titel, Dokumenttyp, Fakten und Case-/Record-Kontext samt
  Confidence und Provenance.
- verpflichtende User-Bestaetigung der sichtbaren Konsequenzen, solange keine
  spaetere Automationsklasse ausdruecklich freigegeben ist.
- Teilfehler bei mehreren Dokumenten ohne Verlust erfolgreicher Ergebnisse.

Optionale bekannte Typ-/Subtyp-/Fact-/Subject-/Case-Angaben sind
provenienztragende Signale. Die Verarbeitung bleibt aktiv, erzeugt weiterhin
Vorschlaege und ueberschreibt Userwerte nicht still. Ein Dokument darf erst
nach akzeptierter Review ohne Pending-State verlassen werden; dann besitzt es
einen primaeren Case- oder Record-Kontext.

## Provider-Kategorien

| Kategorie | Verantwortung | Beispiele |
|---|---|---|
| Composition Provider | konkrete Implementierung verdrahten | Repository, Clock, ID Generator |
| Query Provider | reaktive, abgeleitete Daten lesen | Cases, Records, Review Queue, Search |
| Flow Notifier | Aktion und Zustandsautomat koordinieren | Capture, Review, Migration, Export |
| Session Provider | Account, Device und Offline-Berechtigung | Session, Active Profile |
| Derived Provider | reine Sicht auf bestehenden State | Filter, Badges, erlaubte Aktionen |

Provider duerfen keine fachlichen Wahrheiten als lose UI-Booleans duplizieren.
Abgeleiteter State wird aus einer eindeutigen Quelle berechnet.

## UI-State

Jeder asynchrone Produktflow unterscheidet nur die fuer ihn relevanten, aber
fachlich eindeutigen Zustaende, zum Beispiel:

- initial, loading, data und empty.
- queued, processing und review ready.
- offline mit lokal verfuegbaren Daten.
- retryable failure, user action required und final failure.
- conflict oder confirmation required.
- read-only, quota limited oder reauthentication required.

Widgets duerfen rein visuellen State wie Fokus, Scrollposition und Animation
lokal halten. Persistente Auswahl, Workflow-Fortschritt, Routing, Retry und
fachliche Transitionen gehoeren in Provider/Use Cases.

## Sicherheit und Datenschutz

- Provider-State, Debug-Ausgaben und DevTools duerfen keine Dokumentinhalte,
  OCR-Texte, Tokens oder Schluessel offenlegen.
- Appweiter State speichert nur die fuer Navigation und Interaktion noetigen
  Referenzen; sensible Payloads bleiben hinter Repository-/File-Store-Grenzen.
- Profil- oder Vault-Kontext darf nicht still auf einen anderen Nutzerkontext
  zurueckfallen.
- Ein Fehler oder Logout darf weder Vault-Autoritaet aendern noch lokale Daten
  loeschen.

## Tests und Verifikation

Jede betroffene Phase prueft:

- Notifier-Zustandsautomaten und ungueltige Transitionen.
- Provider Overrides fuer Local- und Cloud-Repositories, Clock, IDs, Secure
  Storage und Assist.
- App-Neustart, Offline-Fortsetzung, Idempotenz und partielle Fehler.
- getrennte Assertions fuer Vault-Autoritaet, lokale Verfuegbarkeit, Pending
  Operations und Assist.
- Capture mit hoher, mittlerer und niedriger Confidence sowie Korrektur.
- Semantics und lokalisierte UI-Texte fuer relevante State-Wechsel.

## Migration des Legacy-Codes

1. `ProviderScope` und appweite Composition bereitstellen.
2. Domain-Ports und Fake-Implementierungen definieren.
3. Neue Zielpfade ausschliesslich ueber Riverpod anbinden.
4. BLoC/GetIt nur beim Migrieren des betroffenen Pfads entfernen.
5. Kein Legacy-State wird als zweite Source of Truth parallel weitergefuehrt.

## Stop Rules

Stop, wenn:

- ein generischer Connectivity-/Sync-Status mehrere Produktdimensionen ersetzt.
- Presentation konkrete Storage- oder API-Technologie kennt.
- Capture-Intent als endgueltige Zuordnung behandelt wird.
- ein Fehler Vault-Autoritaet, Backup-Status oder Datenbesitz implizit aendert.
- Provider-State sensible Inhalte oder Secrets unkontrolliert exponiert.
- ein Flow nicht mit Overrides und deterministischen Fakes testbar ist.

## Handoff

Foundation-Umsetzung geht an `foundation-builder`; Repository- und
Persistenzdetails an `data-architect`; API-Verhalten an `contract-api`.
UI-spezifische Flows benoetigen danach einen geprueften `ui-architect`-Plan.

## Enterprise Quality Contract

Dieses Konzept uebernimmt
`docs/execution/CONCEPT_ENTERPRISE_QUALITY_CONTRACT.md`. Bei Widerspruechen gilt
die strengere, produktspezifische Regel; die betroffene Phase muss stoppen.
