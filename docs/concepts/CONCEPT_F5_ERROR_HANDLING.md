---
title: "Konzept F5 - Error Handling"
description: "Typed-Failure- und Recovery-Konzept fuer Vaults, Capture, Assist, Migration, Entitlements und sensible Dokumentdaten"
tags: [concept, foundation, error-handling, failure, vault, capture, assist, recovery]
lastUpdated: "2026-07-15"
version: "5.0"
status: "accepted"
owner: "foundation/quality"
---

# Konzept F5 - Error Handling

## Status und Abgrenzung

Akzeptiert. F5 definiert Failure-Kategorien und fachliches Recovery-Verhalten.
F18 definiert deren sichere Nutzerkommunikation, Telemetry, Audit und
Correlation. Dieses Konzept ersetzt Home-Hub-, Pairing- und stille
Draft-Inbox-Fallback-Regeln.

## Grundsaetze

- Erwartbare Fehler werden typisiert, nicht als freie Strings oder rohe
  Exceptions transportiert.
- Fehler duerfen nie Originale verlieren, Autoritaet wechseln, Backup
  behaupten oder Quellendaten vor verifizierter Migration loeschen.
- Offline ist ein Betriebszustand. Ob eine Aktion moeglich ist, haengt von Vault,
  lokalem Datenstand, Berechtigung und Pending Operations ab.
- Presentation zeigt sichere, lokalisierbare Texte und niemals Stacktraces,
  Providerantworten oder private Daten.
- Retry ist nur bei idempotenter oder eindeutig geschuetzter Operation erlaubt.

## Failure-Modell

Ein `Failure` traegt mindestens:

- stabile Kategorie und sicheren Referenzcode.
- Retryability: automatisch, manuell oder nicht retrybar.
- erforderliche Recovery-Art: keine, Nutzeraktion, Review oder Support.
- optionale harmlose Operation-/Correlation-ID.
- redaktionierte technische Metadaten.

Planbare Ergebnisse verwenden eine `Result<T>`-/`Failure`-Grenze. Technische
Exceptions werden im Data Layer gefangen und gemappt. Unerwartete Exceptions
werden redaktioniert als `UnexpectedFailure` weitergegeben.

## Kategorien

| Kategorie | Bedeutung | Typische Recovery |
|---|---|---|
| `ValidationFailure` | Eingabe oder Transition ist fachlich ungueltig | inline korrigieren |
| `LocalStorageFailure` | Drift, Datei oder lokaler Index ist nicht nutzbar | Retry, Reparatur oder Recovery |
| `SecureStorageFailure` | Schluessel oder Session-Geheimnis fehlt | Reauth/Recovery, nie still neu erzeugen |
| `NetworkFailure` | Dienst derzeit nicht erreichbar | Queue oder manueller Retry |
| `AuthenticationFailure` | Session oder Device Trust ungueltig | Reauth |
| `AuthorizationFailure` | Aktion fuer diesen Kontext nicht erlaubt | erklaeren, keine Wiederholung |
| `EntitlementFailure` | Plan, Quota, Grace oder Zahlung begrenzt Aktion | erlaubte Alternative/Exit zeigen |
| `UploadFailure` | Artefakttransfer nicht bestaetigt | checkpoint-basierter Retry |
| `ProcessingFailure` | OCR, Extraktion, Index oder Matching scheitert | Stufe wiederholen oder manuell reviewen |
| `ConflictFailure` | konkurrierende Revision oder Entscheidung | sichtbare Review |
| `MigrationFailure` | Preflight, Transfer oder Verifikation scheitert | Quelle autoritativ halten, fortsetzen |
| `IntegrityFailure` | Hash, Datei, Inventar oder Revision stimmt nicht | blockieren und untersuchen |
| `CacheMissOfflineFailure` | Cloud-Daten lokal nicht verfuegbar | online laden; keinen Inhalt erfinden |
| `DetachedRecoveryFailure` | eingeschraenkter lokaler Recovery-Pfad scheitert | Export/Reparatur/Support |
| `UnexpectedFailure` | nicht klassifizierter technischer Fehler | sicher abbrechen und Referenz anbieten |

## Vault- und Account-Regeln

- Local Vault: lokale Schreibfehler blockieren nur die betroffene Operation;
  Cloud- oder Assist-Fehler aendern die lokale Autoritaet nicht.
- Cloud Vault: lokale Pending Operations bleiben erhalten, bis die Cloud eine
  Revision bestaetigt oder ein Konflikt sichtbar aufgeloest wurde.
- Reauth, Quota, Kuendigung und Grace blockieren niemals gesetzlich oder
  vertraglich erforderliche Export-, Loesch- oder Cloud-to-Local-Pfade.
- Cache-Bereinigung ist keine Cloud-Loeschung; Cloud-Loeschung ist keine lokale
  Cache-Bereinigung.
- Migration bleibt auf der Ausgangsautoritaet, bis Inventar, Anzahl und
  Checksums geprueft und der Zielwechsel atomar bestaetigt sind.

## Capture- und Assist-Regeln

Fehler werden pro logischem Dokument und Verarbeitungsstufe gefuehrt:

- Capture-/Seitenvalidierung.
- lokale Haltbarkeit des Originals.
- Upload und Bestaetigung.
- OCR und Dokumentgrenzen.
- Fakten-/Typ-Extraktion und Indexierung.
- Case-/Record-Matching und Vorschlagsbildung.
- Persistenz der User-Bestaetigung.

Bei Teilfehlern bleiben erfolgreiche Dokumente und Ergebnisse erhalten. Ein
veralteter Case-/Profil-Intent loest eine sichtbare neue Vorschlagspruefung aus;
er ordnet nicht still zu und verwirft das Original nicht. Niedrige Confidence
ist kein technischer Fehler: Mappm zeigt weiterhin die besten Vorschlaege und
stellt bei sehr schwacher Evidenz den neuen leichten Custom Case zuerst.

Ein Assist-Ausfall bietet, soweit fachlich moeglich, manuelle Benennung,
Zuordnung und spaetere Wiederverarbeitung. Bereits bestaetigte Titel oder Fakten
werden durch Retry nicht still ueberschrieben.

## UI- und Recovery-Mapping

| Situation | Verhalten |
|---|---|
| lokal nutzbar, Dienst offline | dezenter Status; Queue arbeitet spaeter weiter |
| retrybarer Einzeljob | Ergebnis erhalten; Retry fuer genau diesen Job |
| Nutzerentscheidung erforderlich | kompakte Review mit relevanter Konsequenz |
| Reauth erforderlich | Kontext erhalten; sichere Anmeldeaktion anbieten |
| Quota/Plan begrenzt | Ursache und erlaubte manuelle/Exit-Aktion zeigen |
| Integritaet gefaehrdet | blockierender Zustand; keine destruktive Fortsetzung |
| unerwarteter Fehler | sichere Standardmeldung plus Referenzcode |

Nicht jedes Failure erzeugt eine Notification. Dauer und Kanal bestimmt F18
anhand von Schwere, Sichtbarkeit und Handlungsbedarf.

## Sicherheit und Datenschutz

Failures enthalten keine Dokumentinhalte, OCR-Texte, vollstaendigen Dateinamen,
privaten Pfade, Tokens, Schluessel oder unredigierte Providerantworten.
Diagnoseexporte benoetigen expliziten Scope, Redaction und User-Freigabe.

## Tests und Verifikation

- Unit Tests fuer Mapping, Retryability und ungueltige Transitionen.
- Repository-/Notifier-Tests fuer Offline, Restart, Retry und Idempotenz.
- Local-/Cloud-/Migrationstests fuer Quellenerhalt und genau eine Autoritaet.
- Capture-Tests fuer jede Stufe, Teilfehler und bestaetigte Werte.
- Widget-/Semantics-Tests fuer Recovery-Aktionen und Fokus.
- Privacy-Tests, die sensible Daten in Failure, Log und Nutzertext ausschliessen.
- Contract Tests fuer stabile Fehlercodes und relevante HTTP-Mappings.

## Stop Rules

Stop, wenn:

- rohe Exceptions oder Servertexte die UI erreichen.
- ein Retry Duplikate oder verlorene Bestaetigungen erzeugen kann.
- ein Fehler Autoritaet, Backup oder Loeschstatus implizit aendert.
- ein veralteter Intent still auf einen anderen Case faellt.
- Export oder Cloud-to-Local wegen Plan-/Zahlungsstatus unzugaenglich wird.
- sensible Inhalte in Fehlerobjekten oder Diagnosemetadaten landen.

## Handoff

Konkrete Frontend-Mappings gehen an `frontend-error-handling`; State-Grenzen an
`foundation-builder`; Persistenz-Recovery an `data-architect`; API-Codes und
Vertragsszenarien an `contract-api`.

## Enterprise Quality Contract

Dieses Konzept uebernimmt
`docs/execution/CONCEPT_ENTERPRISE_QUALITY_CONTRACT.md`. Bei Widerspruechen gilt
die strengere Regel und die betroffene Phase stoppt.
