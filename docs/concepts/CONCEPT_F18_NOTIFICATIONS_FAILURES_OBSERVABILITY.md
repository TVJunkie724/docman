---
title: "Konzept F18 - Notifications, Failures and Observability"
description: "Sichere Nutzerbenachrichtigungen, Telemetry, Audit, Correlation und Observability fuer Mappm"
tags: [concept, foundation, failures, notifications, observability, audit, telemetry, privacy]
lastUpdated: "2026-07-15"
version: "3.0"
status: "accepted"
owner: "quality-readiness/product"
---

# Konzept F18 - Notifications, Failures and Observability

## Status und Abgrenzung

Akzeptiert. F5 besitzt Failure-Kategorien und Recovery-Semantik. F7 besitzt
Logging-Konventionen. F18 verbindet diese mit sicherer Nutzerkommunikation,
Telemetry, Audit, Correlation und managed Observability. Es ersetzt Home-Hub-,
Pairing- und Self-Hosted-Observability-Annahmen.

## Grundmodell

Mappm trennt fuenf Ebenen:

| Ebene | Zweck | Beispiel |
|---|---|---|
| `Failure` | typisiertes fachlich-technisches Ergebnis | `ProcessingFailure` |
| UI State | sichtbarer Zustand eines Flows | Verarbeitung laeuft |
| `UserNotification` | sichere, handlungsorientierte Kommunikation | Erneut versuchen |
| `TelemetryEvent` | redigierte Betriebs- und Qualitaetsdiagnose | Job-Stufe fehlgeschlagen |
| `AuditEvent` | sicherheits-/integritaetsrelevante Nachvollziehbarkeit | Device widerrufen |

Nicht jedes Failure erzeugt eine Notification. Nicht jedes Log ist Telemetry.
Telemetry ist kein Audit. Keine dieser Ebenen darf Dokumentinhalte replizieren.

## Laufzeitdimensionen

Diagnose und UI unterscheiden mindestens:

- Vault-Provider und Autoritaet.
- lokale Verfuegbarkeit, Cache und Pending Operations.
- Cloud-Bestaetigung, Konflikt und Migration.
- Account-, Device- und Offline-Session.
- Entitlement, Quota, Grace, Read-only, Retention und Delete.
- Core-Assist-Job, Stufe, Review und Korrektur.
- Detached Recovery.

Assist-Status wird nie als Sync-, Backup- oder Cloud-Speicherstatus angezeigt.

## UserNotification

`UserNotification` wird in App/Presentation aus Failure, Workflow-State,
Sichtbarkeit und Nutzerkontext abgeleitet. Repositories und Domain waehlen keine
UI-Komponente und erzeugen keine fertigen Nutzertexte.

| Kanal | Einsatz |
|---|---|
| Inline | konkrete Feld-/Validierungskorrektur |
| kurzlebige Rueckmeldung | bestaetigte, nicht kritische Aktion |
| Banner/Statuszeile | uebergreifender, nicht blockierender Betriebszustand |
| Dialog/Fehlerseite | Sicherheits-, Integritaets- oder irreversible Entscheidung |
| Activity/Review Queue | persistenter Handlungsbedarf oder laengerer Hintergrundjob |
| System Notification | zeitkritische, ausdruecklich erlaubte Erinnerung/Statusaenderung |

Regeln:

- Meldungen sind kurz, deutsch, lokalisierbar und nennen die naechste sinnvolle
  Aktion.
- Technische Details erscheinen nur in einer bewussten Diagnoseansicht.
- Wiederholte Hintergrundereignisse werden gebuendelt und nicht als
  Notification-Flut ausgegeben.
- System-/Lock-Screen-Notifications zeigen standardmaessig keine Titel,
  Absender, Diagnosen, Betraege oder Dokumentdetails.
- Fachliche Tasks und Erinnerungen gehoeren zum Produktmodell; F18 definiert
  nur sichere Zustellung und Redaction.

## Capture- und Assist-Kommunikation

Ein global erfasstes Dokument kann 1-2 Minuten verarbeitet werden. Die App
zeigt haltbare Annahme, laufende Verarbeitung, Review-Bereitschaft, Teilfehler
und Retry getrennt. Sie blockiert den Nutzer nicht unnoetig im Capture-Screen.

Bei Review werden nur entscheidungsrelevante Vorschlaege hervorgehoben. Bereits
implizit klare Fakten werden nicht wiederholt; Details bleiben optional
einsehbar. Eine Korrektur ist schnell, reversibel und wird als Qualitaetssignal
mit redigierter Provenance erfasst. Bis zur spaeteren Automationsfreigabe wird
keine folgenreiche Zuordnung allein durch die AI finalisiert.

## Correlation und Referenzen

Harmlose zufaellige IDs verbinden:

- Capture Session, Artifact und logisches Dokument.
- Upload und Processing Job.
- Pending Operation und Cloud-Bestaetigung.
- Migration, Export, Restore und Delete.
- Failure, Telemetry und Audit, sofern zulaessig.

IDs werden nie aus PII, Dateinamen, Dokumentinhalt oder Secrets abgeleitet.
Nutzer sehen einen kurzen Referenzcode nur im Fehler-/Supportkontext.

## Telemetry

Telemetry darf enthalten:

- Event-Typ, Zeitstempel, Environment und App-/Contract-Version.
- synthetische Correlation-/Operation-ID.
- redigierten Fehler-/Stufencode, Retry-Zahl und grobe Dauer.
- Vault-Modus ohne Titel/Inhalt.
- Confidence-Band, Abstention, Korrektur und Teilfehler als aggregierbare Werte.

Telemetry darf nicht enthalten:

- Dokumenttitel, Dateiname, OCR-Text oder extrahierte Fakten.
- Case-/Record-Titel, Kandidatenlabels oder Suchbegriffe.
- Personen-, Organisations-, Versicherungs- oder Gesundheitsdaten.
- Tokens, Schluessel, Presigned URLs oder private Pfade.
- rohe Prompts oder Modellantworten.

Akzeptanz eines Vorschlags ist allein kein Beweis fuer inhaltliche Qualitaet.
Qualitaetsmetriken muessen Korrektur, spaetere Ruecknahme, Confidence und
verifizierte Stichproben differenziert betrachten.

## Audit

Audit-relevant sind insbesondere:

- Login-/Device-Trust-/Widerrufs- und Berechtigungsereignisse.
- Vault-Erstellung, Autoritaetswechsel und Migration.
- Export, Sharing, Loeschung, Restore und Detached Recovery.
- relevante Profil-/Zugriffs- und Policy-Aenderungen.
- Integritaetskonflikte und deren bewusste Aufloesung.
- bestaetigte/korrigierte folgenreiche Zuordnungen, soweit Policy dies verlangt.

Audit speichert Referenzen und Aktion, nicht Dokumentinhalt. Retention,
Zugriffsschutz, Manipulationsschutz und Betroffenenrechte werden vor Umsetzung
mit Security/Legal und Backend-Owner festgelegt.

## Umgebungen und Betrieb

- Local Development Cloud und Microcks enthalten ausschliesslich synthetische
  Events und bleiben von managed Umgebungen getrennt.
- Shared Development, Staging und Production besitzen getrennte Zugriffe,
  Retention und Alarmierung.
- Managed Cloud verwendet redigierte strukturierte Logs, Metrics, Traces und
  Audit mit Incident-Correlation.
- OpenTelemetry kann als Exportgrenze dienen; konkreter Collector/Vendor ist
  eine spaetere Betriebsentscheidung.
- Clientdiagnose funktioniert auch ohne Cloud-Telemetry und respektiert
  Consent-/Opt-out- und Rechtsgrundlagen.

## Lokale Diagnose und Support

Eine bewusste Diagnoseansicht oder ein Support-Paket darf zeigen:

- App-, Schema- und Contract-Version.
- Vault-Modus, lokale Verfuegbarkeit und redigierte Queue-Zustaende.
- letzte Failure-Kategorien und Referenzcodes.
- Status von Migration, Export oder Processing ohne private Labels.

Das Paket benoetigt Preview des Umfangs, explizite Freigabe, Redaction und eine
definierte Loesch-/Retention-Regel. Dokumente oder OCR-Inhalte werden nie
automatisch beigelegt.

## Accessibility und Localization

- Statusaenderungen werden semantisch angemessen, aber nicht repetitiv
  angekuendigt.
- Fokus springt bei Fehlern nur dann, wenn direkte Nutzeraktion erforderlich ist.
- Farbe ist nie alleiniger Fehler-/Statusindikator.
- Texte funktionieren bei Textscale `2.0` und mit langen Uebersetzungen.
- System-Notification-Einstellungen und Datenschutzfolgen sind verstaendlich
  erreichbar.

## Tests und Verifikation

- Unit Tests fuer Failure-to-State-/Notification-Mapping.
- Redaction-Tests mit absichtlich sensitiven synthetischen Markern.
- Tests fuer Aggregation, Rate Limit und keine Notification-Flut.
- Audit-/Telemetry-Schema- und Retention-Contract-Tests.
- Correlation ueber Retry/Restart ohne PII-basierte IDs.
- Semantics-, Fokus-, Textscale- und Lock-Screen-Privacy-Tests.
- Environment-Isolation und Production-Fail-closed bei falscher Telemetry-
  Konfiguration.
- Qualitaetsmetriken unterscheiden Annahme, Korrektur, Ruecknahme und Abstention.

## Stop Rules

Stop, wenn:

- Assist als Backup/Sync dargestellt wird.
- Inhalte, Titel, OCR, Suchbegriffe, Kandidatenlabels oder Secrets Telemetry,
  Logs, Audit oder Notifications erreichen.
- Domain oder Repository konkrete UI-Meldungen erzeugt.
- Audit-Retention oder Zugriffsmodell fuer sensible Events ungeklaert ist.
- Production-Telemetry in Development/Microcks oder umgekehrt fliessen kann.
- ein Produktflow ohne sichere Recovery- oder Supportreferenz endet.

## Handoff

Frontend-Mapping geht an `frontend-error-handling`; Instrumentierung und Gates
an `quality-readiness`; Backend-Schemas und Korrelation an `contract-api`;
Security-/Retention-Fragen an die zustaendigen Security-/Legal-Owner.

## Enterprise Quality Contract

Dieses Konzept uebernimmt
`docs/execution/CONCEPT_ENTERPRISE_QUALITY_CONTRACT.md`. Bei Widerspruechen gilt
die strengere Regel und die betroffene Phase stoppt.
