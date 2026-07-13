---
title: "Decision - Profile Sensitive Data"
description: "Entscheidung zu notwendigen, sensiblen und hochsensiblen Profildaten fuer Haushaltsprofile, Versicherungen, Ausweise, Adresse und spaetere Identity-Anbindung"
tags: [decision, profiles, household, sensitive-data, insurance, identity, privacy, id-austria]
lastUpdated: "2026-07-12"
status: "accepted"
---

# Decision - Profile Sensitive Data

## Status

Accepted.

R5-D1 ist als Grundsatzentscheidung akzeptiert. R5-D2 klaert Login/Identity und
Verwaltung separat in `DECISION_PROFILE_IDENTITY_AND_MANAGEMENT.md`. Details fuer Sync,
Feldverschluesselung, Identity-Provider und Haushaltszugriffsregeln werden in R6/M6
ausgearbeitet.

## Entscheidung

Mappm braucht fuer Haushaltsprofile mehr als nur einen Anzeigenamen.

Profile bleiben die fachliche Antwort auf "wen betrifft dieses Dokument, dieser
Vorgang oder diese Aufgabe?". Darueber hinaus darf Mappm aber notwendige
Identitaets-, Adress- und Versicherungsdaten verwalten, weil diese Daten fuer
Arzt-, Versicherungs-, Behoerden-, Schul-, Vertrags- und Familienworkflows
regelmaessig gebraucht werden.

Diese Daten werden nicht als flache, ueberall sichtbare Profilattribute
behandelt. Sie werden in Schutzklassen getrennt:

- Core Profile Data: fuer normale UI, Zuordnung, Filter und Aufgaben noetig.
- Sensitive Profile Data: nur bei konkretem fachlichem Bedarf sichtbar.
- Highly Sensitive Profile Data: besonders geschuetzt, nicht in Logs, nicht in
  einfachen Listen, nicht automatisch in Sync-/Export-Kontexte gemischt.
- External Identity Data: spaetere Login-/Identity-Anbindung.

Profile werden nicht nach Alter modelliert. Login/Identity und Verwaltung sind
zwei getrennte Achsen:

- ein Profil kann eine eigene Identity/Login-Anbindung haben.
- ein Profil kann durch ein oder mehrere andere Profile verwaltet werden.

Ein verwaltetes Profil kann spaeter eine eigene Identity bekommen, ohne dass
bestehende Verwaltungsbeziehungen automatisch entfernt werden.

## Datenklassen

| Klasse | Beispiele | Regel |
|---|---|---|
| Core Profile Data | Anzeigename, Rolle/Beziehung im Haushalt, Identity-Status, Verwaltungsstatus, internes Profil-ID | normal fuer Zuordnung, Suche, Filter und UI verwendbar |
| Basic Personal Data | Geburtsdatum, Staatsbuergerschaft, rechtlicher Name falls abweichend vom Anzeigenamen | sensitiv; sichtbar, wenn der Workflow es braucht |
| Address / Meldeinformation | aktuelle Adresse, Meldeadresse, fruehere Adresse optional spaeter | innerhalb des Haushalts normal bearbeitbar; nicht in Logs, Benachrichtigungen oder externem Export ohne bewusste Auswahl |
| Government Identity Data | Passnummer, Ausweisnummer, Geburtsurkunden-/Nachweisreferenzen, ID-Austria-Verknuepfung spaeter | hochsensibel; eigene Anzeige-/Editier- und Logging-Regeln |
| Public Insurance Data | gesetzliche/staatliche Versicherung, Sozialversicherungstraeger, Versicherungsstatus, Versichertennummer falls noetig | hochsensibel, weil Versicherungs-/Gesundheitskontext ableitbar ist |
| Private Insurance Data | private Zusatzversicherung, Polizzen, mehrere Versicherungen pro Person, Gueltigkeit, Vertrags-/Polizzennummer | hochsensibel; als Record/Versicherungsbeziehung modellieren, nicht nur als Profiltext |
| Contact / Account Data | E-Mail als spaeterer Account-Identifier | nicht als Telefonnummer-/Kontaktbuch-Ersatz; E-Mail gehoert zur spaeteren Auth-/Identity-Schicht |

Telefonnummer ist vorerst kein geplanter Profilbestandteil.

## Feste Felder und Profil-Fakten

Mappm unterscheidet zwischen festen Profilfeldern und freien Profil-Fakten.

Feste Profilfelder sind die Daten, die fuer haeufige Workflows erwartet werden:

- Anzeigename.
- rechtlicher Name optional.
- Geburtsdatum.
- Adresse/Meldeadresse.
- Staatsbuergerschaft.
- Identity/Login vorhanden oder nicht.
- verwaltet durch ein oder mehrere Account Profiles.
- E-Mail spaeter fuer Account-/Identity.

Flexible Profil-Fakten decken Daten ab, die nicht als festes Feld in jedes
Profil gehoeren oder die mit Dokumenten belegt werden sollen.

```text
ProfileFact
  label
  valueType: text | number | date | amount | url | identifier | boolean
  value
  sensitivity: normal | sensitive | highlySensitive
  hasEvidence: boolean
  sourceRecordId optional
  sourceDocumentId optional
  verifiedState: unverified | userConfirmed | extracted | stale
  validFrom optional
  validTo optional
```

`hasEvidence` ist vor allem ein UI-Konzept:

- einfacher Fakt: Wert eingeben, keine Quelle notwendig.
- Fakt mit Nachweis: Wert plus verknuepftes Dokument/Record.

Im Datenmodell bleibt der Werttyp trotzdem fachlich, z. B. `date`,
`identifier` oder `text`. Die Verknuepfung zum Dokument ist Evidenz, kein
eigener Werttyp.

## Versicherungen

Eine Person kann mehrere staatliche/gesetzliche und mehrere private
Versicherungen haben.

Versicherungen werden als eigene strukturierte Beziehungen geplant, nicht nur als
Textfeld am Profil:

```text
Profile
  InsuranceMembership[]
    kind: statutory | private
    provider
    policyOrMemberNumber optional
    validFrom optional
    validTo optional
    relatedRecordId optional
```

Wichtig:

- Die Versicherungspolizze selbst bleibt ein Dokument/Record.
- Das Profil kann auf die aktive Versicherungsbeziehung zeigen.
- Arzt-/Claim-Workflows koennen die relevante Versicherung vorschlagen oder
  verknuepfen, ohne die Polizze in jeden Vorgang zu kopieren.
- Mehrere Versicherungen muessen moeglich bleiben, z. B. staatliche
  Sozialversicherung plus private Zusatzversicherung.

## E-Mail, Login und eID

E-Mail wird nicht als allgemeines Kontaktfeld geplant, sondern als spaeterer
Account-/Identity-Identifier fuer:

- Login.
- Haushalts-/Partnerfreigaben.
- Einladungen oder Geraete-/Account-Zuordnung.

ID Austria wird als spaetere Identity-Option fuer Oesterreich vorgemerkt. Sie
wird aber nicht direkt in den Domain-Kern eingebrannt, sondern ueber eine
generische eIDAS-/EUDI-faehige Identity-Provider-Grenze vorbereitet. R5/R6
muessen dafuer keine vollstaendige Integration bauen, duerfen die Architektur
aber nicht blockieren.

eID-/ID-Austria-Planung bedeutet:

- Identity Provider bleibt austauschbar.
- ID Austria ist ein erster oesterreichischer Provider, nicht die einzige
  Identitaetsarchitektur.
- eIDAS-notifizierte nationale eIDs und die EU Digital Identity Wallet / EUDI
  bleiben anschlussfaehig.
- lokale Profile sind nicht identisch mit Login-Accounts.
- ein Account kann ein oder mehrere Profile verwalten, sofern Rechte das
  erlauben.
- amtliche Identity-Daten duerfen nicht unkontrolliert als normale Profilfelder
  oder Suchdaten behandelt werden.

## Sichtbarkeit und Zugriff

Mappm zeigt im normalen Alltag nur Core Profile Data.

Beispiele:

- In Draft-Inbox, Vorgang, Task und Suche reicht meist der Anzeigename.
- Adresse ist innerhalb des Haushalts normal sichtbar/bearbeitbar, aber nicht
  fuer Logs, Push-Texte oder unbewussten externen Export gedacht.
- Versicherungsdaten erscheinen in Versicherungs-, Arzt- oder Claim-Kontexten.
- Passnummer/Ausweisnummer erscheinen nur in Identitaets-/Behoerden-/Record-
  Kontexten.
- Hochsensible Werte werden nicht in Listen, Logs, Telemetry, Fehlertexten oder
  Benachrichtigungstexten ausgegeben.

## Auswirkungen auf Sync, Haushaltszugriff und Export

Profile sind sync-, haushaltszugriffs- und exportrelevant, aber sensible
Profildaten brauchen eigene Regeln.

Folgen:

- Sync darf Profil-Core-Daten und hochsensible Profildaten nicht gleich
  behandeln.
- Haushaltszugriff muss unterscheiden zwischen "Dokument/Vorgang sehen" und
  "alle Identitaets-/Versicherungsdaten der Person sehen".
- Kinderprofile brauchen besonders vorsichtige Defaults.
- E-Mail/Account-Identity gehoert in die Auth-/Identity-Schicht, nicht in die
  einfache Profilanzeige.
- Ein Cloud Vault muss diese Datenklassen nach VC-02 verschlüsseln, minimieren
  und über tenant-/Vault-spezifische Autorisierung schützen.

## M2 / M3 / M4 / M5 / M6 Einordnung

- M2: Profilzuordnung ist Pflicht, aber nur Core Profile Data muss wirklich
  produktiv sichtbar sein.
- M3: Assisted Review darf betroffene Person vorschlagen, aber nicht still
  setzen. Sensible Werte werden nur als Review-Hinweis verwendet.
- M4: Household/Sync/Auth braucht die Trennung zwischen lokalen Profilen,
  Accounts, E-Mail und Rechten.
- M5: Versicherungs-, Claim- und Kostenworkflows nutzen strukturierte
  Versicherungsbeziehungen.
- M6: Compliance, Backup, Export, Loeschung und Distribution muessen diese
  Datenklassen beruecksichtigen.

## Konsequenzen

- R5-D1 ist entschieden: Die Daten werden benoetigt und werden klassifiziert.
- Profile werden nicht nach Kind vs. Erwachsen modelliert.
- Login/Identity und Verwaltung werden getrennt modelliert.
- Verwaltete Profile koennen spaeter eine Identity erhalten, ohne dass
  Verwaltung automatisch entfernt wird.
- Profildaten koennen manuell gepflegt werden.
- Profil-Fakten koennen optional mit Dokumenten/Records als Nachweis verknuepft
  werden.
- Passnummer, Ausweis-/SV-/Versicherungsnummern und Versicherungsbeziehungen
  sind hochsensibel.
- Adresse und Meldeinformation werden als ein verwandter Datenbereich geplant,
  sind innerhalb des Haushalts aber nicht hochsensibel.
- Telefonnummer bleibt ausserhalb des geplanten Profilumfangs.
- E-Mail wird fuer spaetere Account-/Login-Identitaet geplant.
- ID Austria wird als spaetere Identity-Option ueber eine generische
  eIDAS-/EUDI-faehige Provider-Grenze vorgemerkt.
- Versicherungen werden als eigene mehrfache Beziehungen/Records geplant.

## Nicht entschieden

- exakte UI fuer sensible Profilfelder.
- welche Daten in welchem Milestone tatsaechlich produktiv erfasst werden.
- ob hochsensible Profilwerte in M4 schon verschluesselt auf Feldebene liegen
  muessen oder erst in einem spaeteren M6-Sicherheitsausbau.
- konkrete ID-Austria-Integration.
- konkrete OAuth-/Identity-Provider-Reihenfolge.
- welche Versicherungsdaten automatisiert aus Dokumenten extrahiert werden.
