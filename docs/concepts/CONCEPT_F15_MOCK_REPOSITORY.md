---
title: "Konzept F15 - Mock Repository Blueprint"
description: "Mappm Fakes for Local/Cloud Vaults, entitlements, migrations, capture, cache and contract consumers"
tags: [concept, foundation, mocks, fakes, testing, riverpod, mobile-capture]
lastUpdated: "2026-07-12"
version: "4.0"
status: "accepted-rebaseline"
---

# Konzept F15 - Mock Repository Blueprint

## Status

Accepted rebaseline. The legacy detail appendix is not implementation-authorizing.

## 2026 Vault/Cloud Fake Matrix

Required deterministic fakes cover Local Vault, Cloud Vault, local cache,
pending queue, account/device session, entitlement/grace/quota, migration,
Core-Assist jobs, offline entitlement and Detached Recovery,
export/delete and Cloud failures. A Fake Cloud client tests app behavior;
Microcks tests contracts; Local Development Cloud tests real integration. No
fake silently calls a managed environment and all data/assets are synthetic.

Dieses Konzept ersetzt den importierten F15-Inhalt aus dem alten Projekt.

## Legacy Detail Baseline (non-normative)

The remaining imported detail is retained only for migration context and useful
feature-specific examples. It must not authorize Home Hub, Tailscale, customer
self-hosting, universal local-first authority, old milestone scope or QR server
pairing. Where it differs, the rebaseline above,
`DECISION_VAULT_STORAGE_AND_CLOUD_PRODUCT_MODEL.md`,
`DECISION_COMMERCIAL_CORE_SCOPE.md` and F36 are authoritative. Before this
concept is used for implementation, its affected detail must be rewritten into
the phase's approved implementation contract.

## Zweck

F15 definiert, wie DocMan ohne fertigen Server, ohne echte private Dokumente und ohne instabile Testdaten entwickelt, getestet und visuell validiert werden kann.

Dieses Konzept ist die App-seitige Hälfte der R3-Teststrategie und der praktische Rahmen fuer UI-Konzeptmocks. Es beschreibt Fake-Repositories, Fake-Clients und isolierte Mock-UI. API-Verträge gegen einen mockbaren Server gehören ergänzend zu F4/F16 und ersetzen diese Fakes nicht.

## Ebenen

| Ebene | Zweck |
|---|---|
| Fake Repository | schnelle UI/Provider-Tests mit deterministischen Daten |
| UI-Konzeptmock | isolierte Screen-/Flow-Validierung mit synthetischen Daten |
| Fake Home Hub Client | Mobile Upload, Health, Pairing simulieren |
| In-Memory Storage | lokale Persistenz ohne echte DB-Dateien |
| Fixture Files | harmlose Test-PDFs/Bilder |
| Contract Mock Backend | API-Verträge über Microcks prüfen |
| Real Integration | später gegen echten Compose/Home-Hub-Stack |

## Regeln

- Fakes implementieren dieselben Repository-Verträge wie echte Data-Implementierungen.
- Fakes dürfen keine Produktlogik ersetzen.
- Testdaten sind synthetisch und nie privat.
- App-Testfixtures liegen unter `test/fixtures/`; API-/Microcks-Beispiele liegen unter `contracts/`.
- Anonymisierte private Dokumente sind nicht erlaubt; Fixtures muessen frei erfunden sein.
- Fake-Modus muss in UI/Dev klar erkennbar sein.
- Production darf nicht still auf Fake-Daten laufen.
- Fake-Repositories laufen im Prozess der Flutter-Tests und benötigen kein Netzwerk.
- Contract-Mocks laufen außerhalb der App und prüfen API-Verträge, nicht Domain-Logik.
- UI-Konzeptmocks sind kein Produktpfad und duerfen keine echte Datenbank, kein Dateisystem, keinen Home Hub und keine externen APIs ansprechen.
- Die Legacy-App bleibt nur Design- und Fachreferenz. Neue Mocks duerfen keine BLoC-, GetIt-, Isar- oder PocketBase-Flaeche erweitern.

## UI-Konzeptmocks

UI-Konzeptmocks dienen dazu, Form, Interaktion und fachliche Begriffe schnell zu pruefen, bevor ein Feature verbindlich geplant wird.

Geeignete Mock-Kandidaten:

- Vorgangsliste und Vorgangsdetail.
- Dokumentdetail mit Status, Datei, Ereignissen und Review-Hinweisen.
- Draft-Inbox fuer mobile Uploads.
- Mobile Capture Flow mit Upload-Queue.
- QR-Pairing Flow.
- OCR-/AI-Vorschlag fuer Formularfelder als spaeterer spaeterer-Spike.

Mock-UI soll nah genug an der spaeteren Architektur liegen, damit die Erkenntnisse wiederverwendbar sind, aber nicht so tun, als waere sie bereits produktiv. Wenn ein Mock weitergebaut wird, braucht er einen Feature-Plan mit Domain-Vertrag, Riverpod-Provider, Teststrategie und klarer Definition of Done.

Mock-UI wird ueber einen eigenen Entry Point gestartet:

```bash
flutter run -d macos -t lib/main_mock_catalog.dart
```

Ein Script wie `scripts/run_mocks.sh` darf diesen Befehl kapseln. Die normale Produktnavigation darf Mock-Screens nicht kennen.

Der erste Mock-Flow ist Mobile Capture zu Draft-Inbox zu optionaler Vorgangszuordnung. Er soll als interaktiver Flutter-only Mock starten, also ohne Repositories, Drift, Home Hub, Microcks oder echte Dateien.

Mock-Daten muessen realistisch genug fuer Produktentscheidungen, aber vollstaendig synthetisch sein. Erlaubt sind frei erfundene Haushalts-, Vorgangs-, Upload- und Dokumentbeispiele. Nicht erlaubt sind echte Namen, echte Adressen, echte Dokumentinhalte, Screenshots privater Dokumente oder echte Secrets.

## M2-Fakes

Benötigt:

- Cases Fake.
- Documents Fake.
- Draft-Inbox Fake.
- Upload-Queue Fake.
- Home-Hub Fake mit reachable/unreachable/error.
- Secure-Storage Fake.
- Clock/ID Generator Fake.

## Mobile Capture Szenarien

Fakes müssen abbilden:

- Upload erfolgreich.
- Home Hub offline.
- Auth/Pairing ungültig.
- Datei fehlt.
- `caseId` ungültig, Fallback Draft-Inbox.
- Retry erzeugt kein Duplikat.

## Abgrenzung zu Microcks

Fake-Repositories sind für schnelle App-Tests gedacht:

- Domain- und Use-Case-Tests.
- Riverpod Provider/Notifier mit Overrides.
- Widget Tests mit stabilen Zuständen.
- Offline-Verhalten und lokale Queue-Logik.

Microcks ist für Schnittstellen gedacht:

- Home-Hub Health.
- Pairing und Token-Fehler.
- Capture Upload.
- Draft-Inbox Übergabe.
- spätere Sync- und Konfliktantworten.

Beide Ebenen verwenden synthetische Daten. Keine Ebene darf private Dokumente oder echte Secrets benötigen.

## Test-Helper Zielbild

R3 sollte zentrale Test-Helper definieren:

- Fake Clock.
- Fake ID Generator.
- Fake Secure Storage.
- Fake Case Repository.
- Fake Document Repository.
- Fake Draft Inbox Repository.
- Fake Upload Queue Repository.
- Fake Home Hub Client.
- synthetische Fixture-Dateien.

Diese Helper sollen Provider Overrides einfach machen, ohne dass Tests konkrete Data-Implementierungen kennen.

## Definition of Done

F15 gilt als umgesetzt, wenn:

- jedes M2-Repository eine Fake-Strategie hat.
- Riverpod Tests Provider Overrides nutzen.
- UI-Mocks ohne echten Home Hub laufen.
- UI-Mocks getrennt vom Produktpfad liegen und keine Legacy-Architektur erweitern.
- der Mock-Katalog ueber einen eigenen Entry Point startbar ist.
- der erste Mobile-Capture/Draft-Inbox-Mock als interaktiver Stufe-2-Mock pruefbar ist.
- API-nahe Flows klar zwischen Fake-Client und Contract-Mock unterscheiden.
- Fake-Daten keine privaten Dokumente enthalten.
- Real-Integration später ergänzbar bleibt.

## Offene Folgefragen

- Gibt es einen globalen Dev-Fake-Modus?
- Welche Fake-Szenarien werden im UI auswählbar?

## Enterprise Quality Contract

This concept adopts `docs/execution/CONCEPT_ENTERPRISE_QUALITY_CONTRACT.md`.
Its own scope and status remain authoritative; the shared contract supplies the
mandatory ownership, security/privacy, accessibility/localization, verification,
stop-rule and handoff defaults wherever this file does not define a stricter
rule. Any conflict must stop the affected phase and be resolved in this concept.
