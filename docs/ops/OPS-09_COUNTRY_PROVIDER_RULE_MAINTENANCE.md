---
title: "Mappm OPS-09 - Pflege von Country- und Provider-Regeln"
description: "Operations-Vertrag fuer Quellenmonitoring, fachliche Reviews, Developer-Reminder, Versionierung, Withdrawal und Release-Gates regelbasierter Produktinhalte"
tags: [ops, rules, country-packs, provider-packs, monitoring, review, reminders, release, compliance]
lastUpdated: "2026-07-23"
status: "accepted-direction"
owner: "domain-content/compliance/operations"
---

# Mappm OPS-09 - Pflege von Country- und Provider-Regeln

## Zweck

Country-, Rechtsraum-, Provider- und Tarifregeln koennen Aufgaben, Fristen,
Reminder, erwartete Unterlagen und Nutzerentscheidungen beeinflussen. Sie sind
deshalb produktiver Code-Evidenz gleichzustellen: versioniert, reviewbar,
testbar, zurueckziehbar und mit einem verantwortlichen Owner.

Dieses Dokument besitzt den operativen Pflegevertrag. Es entscheidet keine
fachliche Regel. Die Produktsemantik steht in
`docs/technical/DECISION_RULE_DERIVED_DEADLINES_REMINDERS.md`; konkrete
Regelquellen stehen im jeweiligen Pack, fuer den ersten medizinischen
Oesterreich-Scope in
`docs/technical/DECISION_AUSTRIA_MEDICAL_PAYER_RULE_PACK.md`.

## Rollen

Jede aktive Regelfamilie benennt mindestens:

| Rolle | Verantwortung |
|---|---|
| Domain Content Owner | fachliche Bedeutung, Scope und Nutzerwirkung |
| Legal/Compliance Reviewer | Rechts-/Regulierungspruefung, soweit relevant |
| Technical Pack Owner | Schema, Version, Fixtures, Distribution und Rollback |
| Release Owner | Aktivierung, Staged Rollout, Withdrawal und Release Evidence |

Eine Person darf mehrere Rollen wahrnehmen, die jeweilige Freigabe und
Verantwortung bleiben aber einzeln nachvollziehbar.

## Pflichtmetadaten je Regel

Eine Regel darf nur in einem aktivierbaren Pack liegen, wenn mindestens
folgende Metadaten vorhanden sind:

- stabile Rule-ID und unveraenderliche Version;
- Pack-ID/-Version und fachlicher Scope;
- Rechtsraum, Provider, Tarif/Regime und betroffene Zeitraeume;
- Primaer-/Providerquelle und konkrete Fundstelle;
- `effectiveFrom` und optional `effectiveTo`;
- `sourceCheckedAt`, `lastReviewedAt` und `nextReviewAt`;
- Domain Owner, Reviewer und Freigabeevidenz;
- Status `draft`, `active`, `review_due`, `change_detected`, `superseded` oder
  `withdrawn`;
- positive, negative, `unknown`- und Widerspruchsfixtures;
- Auswirkungs-/Migrationsklasse und Withdrawal-Pfad.

Fehlende Pflichtmetadaten sind ein Releasefehler, kein tolerierter Warnhinweis.

## Developer-Reminder und Reviewtakt

Der akzeptierte Mindesttakt ist:

| Kontrolle | Mindestfrequenz | Wirkung |
|---|---|---|
| automatischer Quellen-/Link-/Content-Check | monatlich | erkennt Nichterreichbarkeit, Redirect, Hash-/Inhaltsaenderung und erzeugt Reviewbedarf; aendert keine Regel |
| fachlicher menschlicher Review | mindestens alle sechs Monate | bestaetigt Quelle, Anwendbarkeit, Berechnung, Nutzertext und Fixtures |
| Pre-Publish-/Pre-Release-Review | vor jeder neuen oder geaenderten Pack-Veroeffentlichung | blockiert Aktivierung ohne aktuelle Freigabe |
| Event-getriebener Review | sofort bei erkannter Quellen-, Rechts-, Provider-, Tarif- oder Prozessaenderung | klassifiziert Auswirkung, korrigiert oder zieht Regel zurueck |

Fuer die am 23. Juli 2026 geprueften oesterreichischen medizinischen
Payer-Regeln ist der naechste fachliche Review **spaetestens am 23. Januar
2027** faellig.

Vor Aktivierung des ersten Country-/Provider-Packs muss das Repository einen
konkreten Developer-Reminder umsetzen:

- geplanter CI-/Automation-Job fuer monatliche Quellenpruefung;
- wiederkehrendes oder automatisch erneuertes GitHub-Issue fuer den
  halbjaehrlichen fachlichen Review;
- benannter Owner und Eskalation bei Ueberfaelligkeit;
- Release-Gate gegen ueberfaellige aktive Regeln.

Dieses Dokument ist der Contract fuer diese spaetere Umsetzung. Es ist selbst
keine laufende Automation und kein Kalendertermin.

## Automatischer Quellencheck

Ein automatischer Check darf nur technische Signale ermitteln, etwa:

- HTTP-Erreichbarkeit, Redirect und Zertifikatsfehler;
- erwarteter Seitentitel beziehungsweise Dokumentidentitaet;
- ETag, Last-Modified, Dokumentversion oder normalisierter Content-Hash;
- bekannte Fundstelle noch vorhanden;
- Packquelle vor `nextReviewAt` beziehungsweise vor Release geprueft.

Ein Hash-Unterschied beweist keine fachliche Regelaenderung. Er setzt die
Regel auf `change_detected` beziehungsweise erzeugt ein Review-Issue. Die
produktive Regel, bestehende Fristen und Reminder werden nicht automatisch
geaendert.

## GitHub-Issue-Vertrag

Ein Quellen-/Review-Issue enthaelt mindestens:

- Rule-ID, Pack-ID und betroffene Version;
- Quelle, letzte Pruefung und naechstes Pflichtdatum;
- erkanntes Signal oder Anlass;
- betroffene Produktfunktionen, Maerkte und laufende Rule-Versionen;
- Domain-, Compliance- und Technical Owner;
- Severity und spaetesten Entscheidungszeitpunkt;
- erforderliche Quellenpruefung, Fixtures, Texte und Releaseentscheidung;
- Ergebnis `unchanged`, `new-version`, `superseded` oder `withdrawn`.

Frontend darf den sichtbaren Bedarf und die benoetigten Erklaerdaten
beschreiben. Backend-/Contract-Owner entscheiden Contract, DTOs, Endpunkte,
Mapping, Persistence und Policy-Architektur.

## Review- und Freigabeablauf

```text
source check or scheduled review
  -> evidence captured
  -> domain review
  -> legal/compliance review where applicable
  -> fixtures and schema verification
  -> impact classification
  -> approve immutable new version
  -> staged rollout
  -> monitor
```

Eine bestehende unveraenderliche Rule-Version wird nicht editiert. Eine
materielle Korrektur erzeugt eine neue Version. Laufende und historische
Fristinstanzen behalten ihre gepinnte Version, bis ein expliziter,
nachvollziehbarer Migrations-/Reviewpfad angewendet wird.

## Release-Gates

CI/CD und Release Evidence pruefen mindestens:

- Schema- und Referenzgueltigkeit aller aktivierten Packs;
- keine aktive Regel ohne Owner, Quelle, Reviewdatum und Fixtures;
- kein `nextReviewAt` in der Vergangenheit;
- keine offene `change_detected`- oder `withdrawn`-Regel im Release-Scope;
- Signatur-/Artefaktintegritaet und reproduzierbare Pack-Version;
- positive, negative, `unknown`- und Zeitzonen-/Fristfixtures;
- Offline-/Altversions- und Withdrawal-Verhalten;
- sichtbare Quellen-/Standdaten in den relevanten Produktresultaten;
- keine stille Aenderung bestehender Case-/Fristinstanzen.

Ein Quellencheck darf bei transientem Netzwerkfehler den gesamten
Development-Build nicht unkontrolliert blockieren. Der Release-Gate verwendet
gespeicherte Review-Evidence und einen separaten klaren
`source_check_unavailable`-Status.

## Withdrawal und Incident

Eine Regel wird mindestens dann `withdrawn`, wenn:

- ihre Quelle zurueckgezogen oder fachlich widerlegt wurde;
- Scope oder Berechnung nicht mehr sicher bestimmt werden koennen;
- ein Fehler materielle Nutzerfolgen verursachen kann;
- der Owner die erforderliche Aktualitaet nicht mehr gewaehrleisten kann.

Withdrawal:

- stoppt neue Frist-/Task-/Reminder-Ableitungen;
- loescht bestehende Instanzen und Provenienz nicht;
- markiert betroffene laufende Instanzen fuer Review;
- erzeugt keine stille Ersatzregel;
- folgt bei materiellem Risiko OPS-03 Incident Response und OPS-06
  Release/Rollback.

## Datenschutz und Telemetrie

Quellenmonitoring verarbeitet nur oeffentliche Packquellen und
Regelmetadaten. Nutzerpolizzen, Case-Titel, Fristen, Gesundheitsdaten und
Dokumentinhalte duerfen nicht an externe Linkchecker, Issue-Bodies oder
allgemeine Telemetrie gelangen.

Produktmetriken fuer Rule-Qualitaet verwenden nur freigegebene,
datensparsame Aggregate. Nutzerkorrekturen aendern keine produktive Regel
automatisch.

## Verifikation

Vor Aktivierung eines Packs werden mindestens geprueft:

- monatlicher Check erzeugt bei Content-Aenderung genau einen
  deduplizierten Reviewbedarf;
- transienter Netzwerkfehler ist von fachlicher Aenderung unterscheidbar;
- ueberfaelliges Review blockiert Release, aber veraendert keine Nutzerfrist;
- neue Rule-Version laesst historische Instanzen unveraendert;
- Withdrawal stoppt neue Ableitungen und markiert betroffene Instanzen;
- GitHub-Issue enthaelt Owner, Quelle, Wirkung und Entscheidung;
- keine privaten Daten in Checklogs, Issues oder Artefakten;
- Pack-Rollback und Offline-Anzeige einer gepinnten Altversion funktionieren.

## Stop Rules

Stop, wenn:

- eine aktive Regel keinen Owner, keine Quelle oder kein Reviewdatum besitzt;
- ein Link-/Hashcheck eine fachliche Regel automatisch aendert;
- ein ueberfaelliges Review nur als unverbindliche Warnung einen Release
  passiert;
- materielle Korrekturen in bestehende Rule-Versionen geschrieben werden;
- laufende oder historische Instanzen durch Pack-Update still veraendert
  werden;
- Withdrawal Evidenz oder historische Nachvollziehbarkeit loescht;
- GitHub-Issues private Nutzer-, Gesundheits-, Polizzen- oder Dokumentdaten
  enthalten;
- ein Country-/Provider-Pack ohne automatischen Quellencheck, halbjaehrlichen
  fachlichen Reminder und Pre-Release-Gate produktiv aktiviert wird.
