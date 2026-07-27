---
title: "Mappm - Project Overview and Product Guide"
description: "Aktueller Einstieg in Produktmodell, Commercial Core, Architektur, Governance und Source of Truth"
tags: [overview, guide, product, strategy, planning]
lastUpdated: "2026-07-25"
version: "4.2"
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

## Schnellnavigation zu den neuen SSOTs

| Frage | Massgebliche Quelle |
|---|---|
| Wo finde ich alle querschnittlichen F-Konzepte? | `docs/concepts/README.md`, `docs/execution/CONCEPT_FILE_QUALITY_MATRIX.md` |
| Wie wird jede Case-Familie definiert und reviewed? | `docs/technical/DECISION_CASE_FAMILY_DEFINITION_CONTRACT.md`, Skills `case-concept` und `case-concept-review` |
| Welche Case-/Workflow-IDs und deutschen Titel gelten? | `docs/technical/DECISION_INITIAL_CASE_WORKFLOW_CATALOG.md` |
| Wann ist ein Dokumenttyp/Subtyp sinnvoll? | `docs/technical/DECISION_DOCUMENT_TYPE_CATALOG.md`, Skill `document-concept` |
| Wie werden Laender-/Provider-Regeln erstellt und gepflegt? | `docs/technical/DECISION_CURATED_JURISDICTIONAL_WORKFLOW_CATALOG.md`, `docs/ops/OPS-09_COUNTRY_PROVIDER_RULE_MAINTENANCE.md`, Skill `country-pack-concept` |
| Was muss Backend/Data/Intelligence noch pruefen? | `docs/execution/handoffs/DOMAIN_BACKEND_FEASIBILITY_REGISTER.md` |
| Wie sieht die Warteerfahrung nach Upload aus? | `docs/concepts/CONCEPT_F38_ASYNC_PROCESSING_WAIT_EXPERIENCE.md` |

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

1. **Arbeit abnehmen:** Capture beginnt in einem sichtbaren, gegebenenfalls
   vorausgewaehlten Managed-Subject-Kontext; vor dem Scan sind keine
   allgemeinen Profil-, Case- oder Metadatenformulare nötig.
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
9. **Konservative Intelligence:** Produkt und Roadmap setzen kleine bis
   mittlere General-Purpose-Modelle voraus. Core Assist erkennt grobe
   Dokumentart/Domain, Text und einfache Kandidaten. Fuer wenige
   produktdefinierte, typabhaengige Reviewfelder darf Assist einen
   semantischen Top-Kandidaten und Alternativen vorausfuellen. Datumsfelder
   bieten zusaetzlich `Kein Datum` und manuelle Eingabe; erst die gebuendelte
   Nutzerbestaetigung aktiviert Bedeutung oder reversible Folgen. Person,
   Lebenssachverhalt, Dokumentkohaerenz, Workflow, aktive Frist, Kausalitaet
   und Beziehungen bleiben User-/Regel- beziehungsweise eigens nachgewiesene
   Semantik. Normale M1-Korrekturen sind weder Trainingsfreigabe noch
   Dokumentspende oder Human Review.

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
Commercial Core. Er umfasst OCR/Textextraktion, grobe Dokumentart/Domain,
einfache Metadatenkandidaten, verpflichtende konservative editierbare
Titelvorschläge sowie grobes Case-/Record-Ranking und Suchindexdaten.
Userdefinierte Mobile-Dokumentgrenzen und je eine Desktop-Datei sind
autoritativ. Freie Personen-/Workflow-/Frist-/Beziehungsdeutung ist kein
Core-Versprechen. Assist macht Local Vault nicht zum Cloud Vault und stellt
kein stilles Backup dar.

Mappm Cloud ist die verwaltete Lösung für Account, Entitlements, Assist und
beim Cloud Vault auch Storage, Sync, Backup und später Secure Sharing. Local
Development Cloud verwendet dieselben Contracts ausschließlich mit
synthetischen Daten. Customer Home Hub, Tailscale und Self-hosting sind kein
aktiver Produktmodus.

## Domainmodell

Mappm verwendet einen generischen `Case` statt vieler sichtbarer Case-Typen.
In der deutschen UI heißt er „Vorgang“.

Commercial 1.0 ist Oesterreich-first. Danach ist der deutschsprachige Raum als
Expansionsrichtung geplant, wobei Deutschland, Schweiz, Liechtenstein und
weitere Regionen nicht als gemeinsamer Rechtsraum behandelt werden. Die exakte
AT-Workflow-Liste bleibt WF-01; die post-oesterreichische Reihenfolge bleibt
WF-03.

Die alleinige Liste fuer Workflow-Muster, Fachvorlagen-IDs, deutsche Titel,
Katalogstatus und Disposition ist
`docs/technical/DECISION_INITIAL_CASE_WORKFLOW_CATALOG.md`. Vertiefende
Dokumente referenzieren diese SSOT und fuehren keine zweite Case-Liste.

Jede Case-Familie besitzt nach abgeschlossenem fachlichen User-Workshop,
vollstaendigem Chat-Abgleich und ausdruecklicher Dokumentationsfreigabe genau
ein dort registriertes Owning Subkonzept. Vor dieser Freigabe wird keine Draft-
oder Workshop-Decision angelegt. Neue Familien-Decisions folgen
`DECISION_<CASE_FAMILY>_MODEL.md`; eine eindeutige bestehende Decision darf als
Owner fortgeschrieben werden. Der Katalog besitzt ID, Titel, Status,
Disposition und Coverage; das
Subkonzept besitzt Ziel, Case-Grenze, Komposition, Lifecycle, Matching,
Dokumentdisposition, Laendergrenze, Beispiele und Verifikation. Ohne reviewed
Subkonzept darf eine Familie weder fachlich akzeptiert noch fuer Contract,
Schema, Phase oder Implementierung freigegeben werden. Der vollstaendige
Definitions- und Reviewvertrag steht in
`docs/technical/DECISION_CASE_FAMILY_DEFINITION_CONTRACT.md`. Medical ist
akzeptiert; Unfall/Schaden besitzt ein Owning Subkonzept, bleibt aber bis zum
ausdruecklich gewuenschten Re-Review unter OQ-014 blockiert. Weitere Familien
folgen demselben Freigabevertrag.

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
- **Fact, Task, Event:** strukturierte Aussage, nächster Schritt und
  Historieneintrag. Einreichungen/Nachreichungen sind wiederholbare Events;
  Mappm besitzt keine eigene Claim-Entitaet.

Zeitangaben sind typisierte Facts mit Bedeutung, Genauigkeit, Quelle und
Bestaetigungsstatus. Ein Dokument besitzt kein universelles Hauptdatum:
Ausstellung, Empfang, Leistung/Ereignis, Termin, Frist, Gueltigkeit und
Zeitraum bleiben unterscheidbar. Ereignisse, Aufgaben, Termine, Fristen,
erwartete Antworten und Reminder besitzen eigene Semantik. Eine spaetere
Kalenderintegration baut nur auf bestaetigten, gezielt freigegebenen
Agenda-Objekten auf.

Regelbasierte Fristen bleiben je Payer/Provider getrennt und pinnen
Startanker, Rule-/Pack-Version, Fundstelle, Bestaetigung und Reviewstatus. Die
frueheste bestaetigte offene Frist ist nur ein kompakter Attention-Wert und
ersetzt keine weitere Frist. Providername, Default oder roher LLM-Vorschlag
aktivieren keine materielle Frist. Aktive Regeln brauchen OPS-09-
Quellenmonitoring, mindestens halbjaehrlichen Fachreview und Release-Gates.

Jedes akzeptierte Dokument besitzt einen primären Case oder Record und darf
zusätzliche Beziehungen tragen. Passt kein bestehender/geführter Kontext,
entsteht ein leichter Custom Case mit automatisch vorgeschlagenem Titel. Ein
Custom Case darf fast leer beginnen; dieselbe Engine kann später Workflow,
Aufgaben, Termine und Links ergänzen.

Persistierte Cases sind stets gueltig. Kein Dokumenttyp und keine
Dokumentmenge ist verpflichtend; Dokumente liefern Evidenz fuer Facts und
Zustaende. Assist-Vorschlaege werden erst nach Bestaetigung zu Cases.

Die Dokumenttaxonomie folgt minimal ausreichender Klassifikation. Mappm soll
Haushaltsdokumente auffindbar und nutzbar machen sowie daraus Kontext,
Aufgaben, Fristen und naechste Schritte ableiten, nicht jede fachliche Nuance
als Subtyp persistieren. Nur spaeter gezielt benoetigte Unterlagen oder
Unterscheidungen mit materiell anderem Produktverhalten rechtfertigen eigene
Typen/Varianten. Alles Weitere bleibt allgemeines beziehungsweise breites
Dokument mit gutem Titel, Facts, Rolle und Suchvokabular. Diese Regel gilt bei
jeder kuenftigen Case-/Workflow-Konzeption.

Minimal ausreichend ist kein Subtyp-Verbot und keine Zielvorgabe, die Anzahl
moeglichst klein zu halten. Sinnvolle Subtypen beziehungsweise semantische
Varianten bleiben erhalten, sobald sie dauerhaften Nutzen oder materiell
anderes Produktverhalten tragen. `medical_invoice` ist das wichtigste aktuelle
akzeptierte Beispiel:
Die Variante steuert den medizinischen Kostenabrechnungs- und
Payer-Einreichungsverlauf, waehrend Provider, Land, Jahr und bezahlt/offen getrennte
Datenachsen bleiben.

Fuer Medizin ist der bisherige Kern dokumentiert: ein neutraler
Behandlungsfall als Care-Anker, je eigenstaendig ausgestellter
Rechnung/Honorarnote genau ein `part_of`-Kostenabrechnungsvorgang und
Payer-Einreichungen als wiederholbare Events/Workflow-Schritte mit null, einem
oder mehreren Dokumentlinks. Korrektur, Gutschrift, Zahlungsbeleg und
Payer-Antwort derselben Rechnung bleiben im Cost-Case; eine weitere Rechnung
erzeugt einen weiteren Cost-Case. Kein Dokument ist Pflicht.
Bewilligungsanfrage, Bewilligung und Ablehnung fuer die Behandlung bleiben
Dokumente/Facts/Schritte im Care-Case. Medizinische Dokumenttypen bleiben
schlank. Reha, Nachsorge und spaetere Evidenz werden dokumentweise gegen
bestehenden und moeglichen neuen Care-Kontext gerankt. Bei belegter
Kontinuitaet bleibt der Care-Case gleich; ein neuer verknuepfter Case entsteht
bestaetigt aus einem Ankerdokument oder ausdruecklicher Absicht. Eine freie
Medical-Mehrfachabspaltung ist nicht M1. Wiederkehr ist optionale Planung auf
endlichen Care-Cases, kein Case-Typ. Managed Subjects
duerfen mehrere Payer-Beziehungen und einfache Defaults fuer
Sozial/Krankenfuersorge, ambulante und stationaere Zusatzversicherung besitzen;
ein Default sortiert nur und behauptet keine Deckung. Private Beziehungen
besitzen einen stabilen Policy Record plus ruhigen Vertragskontext; ein
Polizzendokument ist optional und ein importierter Altvertrag erhaelt keinen
erfundenen Abschluss-Case. Besondere vertragliche
Leistungen werden im Medical Core fuer M1 nicht spezialisiert. Mappm berechnet
keine Versicherungsdeckung oder erwartete Leistung. Zahlung, SV-Einreichung,
jede Zusatzversicherungs-Einreichung, jede Payer-Frist, Finanz-Facts und
Case-Lifecycle bleiben getrennte Zustaende. Eine unbezahlte Rechnung ist eine
offene Verpflichtung, aber die tatsaechliche Auszahlung bleibt `0`; im
Normalablauf schlaegt erst ein bestaetigtes SV-Ergebnis die Zusatzversicherung
als naechsten Schritt vor.

Care wird bewusst von der Nutzerin abgeschlossen und darf `done` sein,
waehrend ein Cost-Case aktiv bleibt. Ein Cost-Abschluss wird nach terminalen
Ergebnissen aller tatsaechlich begonnenen Payer-Spuren vorgeschlagen, bleibt
aber immer bestaetigungsgebunden. Typische Medical-Inhalte werden
kontextuell vorgeschlagen, nie verlangt. Spaete Evidenz kann ohne
Wiedereroeffnung verknuepft werden; neue Arbeit erzeugt einen bestaetigbaren
Reopen-/neuer-Case-Vorschlag.

Nur in einem bereits bestehenden bestaetigten und geoeffneten Care-Case kann
Desktop M1 als seltene Kontextaktion ein Speichermedium oder einen Ordner als
unveraendertes ZIP-Medienpaket sichern und bytegleich exportieren. Der Nutzer
vergibt dafuer den Titel manuell; ein Untersuchungsdatum ist optional.
Globaler Capture, nichtmedizinische Cases und Mobile bieten diesen Import nicht
an.

## Capture und Review

```text
global scannen oder importieren
  -> Original und Manifest dauerhaft sichern
  -> Qualität, Dublette und Security prüfen
  -> OCR, Klassifikation, Extraktion und Indexierung
  -> usergewaehlten Managed Subject beibehalten
  -> konservativen Titel und grobe Case-/Record-Kandidaten vorschlagen
  -> nach bestaetigtem Kontext reversible naechste Schritte ableiten
  -> nur relevante Folgen bestätigen oder korrigieren
  -> Dokument im DMS-Kern akzeptieren
```

Waehrend der globalen Erfassung darf die Nutzerin optional bereits bekannte
Angaben wie Grundart/sinnvollen Subtyp, bestaetigte Facts, Managed Subject,
groben Kontext sowie neuen oder bestehenden Case mitgeben. Keine Angabe ist
Pflicht oder ersetzt Analyse und Matching. Core Assist fuellt weiterhin Titel,
grobe Metadaten und Case-/Record-Kandidaten vor und darf Userwerte weder still
ueberschreiben noch semantisch als falsch markieren. Moegliche weitere
Beziehungen sind optionale best-effort Vorschlaege mit Nutzerbestaetigung.
Exakte Controls bleiben UI-Scope.

Fuer Unfall/Schaden gilt die dokumentierte Baseline: grobe Varianten statt
Kleinsttypen, optionaler `part_of`-Schadenkosten-Case nur bei eigenstaendig
verfolgter Verpflichtung sowie normale Versicherungsabwicklungs-Cases mit
mehreren Rechnungen und wiederholbaren Einreichungen.
`Medizinischer Unfall` routet direkt zu Medical Care; erst ein eigenstaendiger
nichtmedizinischer Regulierungsverlauf ergaenzt einen verknuepften Unfall-Case.

Mobile Capture umfasst nativen Dokumentenscan, Foto-/Bildnachweis,
Galerieauswahl und PDF-/Dateiimport. Desktop umfasst Datei-/Bildauswahl,
Multi-File und Drag-and-drop; durch externe Scanner erzeugte Dateien werden
normal importiert. Dokumentenscans ueber Desktop-Webcams sind verboten.
Smartphone-zu-Desktop-Capture, Local-to-Local-Transfer und macOS Continuity
Camera bleiben bis OQ-013 ein gesonderter Draft; normaler Desktop-Capture setzt
kein Smartphone voraus.

Eine Importsitzung darf zusammengehörige und fremde Dokumente enthalten.
Session-Nähe ist kein Beweis. Dokumente mehrerer Dateien werden separat
gematched; Reorder und Neuzuordnung bleiben reversibel. Ein einzelnes
importiertes Misch-PDF wird im aktuellen Zielrelease nicht automatisch auf
Dokumente oder Cases gesplittet. Es bleibt ein logisches, gegebenenfalls
generisch behandeltes Dokument und wird wegen semantisch unabhaengiger Inhalte
weder abgelehnt noch `invalid`. Partial Failure verliert keine erfolgreichen
Ergebnisse.

## Workflows und Länderpakete

Workflows sind kompositorische Führung, keine starre Case-Taxonomie. Ein Case
bleibt derselbe Domain-Typ, erhält aber optional Muster, Module,
Länder-/Institutionsvarianten und eine gepinnte Definitionversion.

Ein eigener verbundener Case entsteht nur bei eigenständigem Ziel und
Lebenszyklus. Schritte verschiedener Beteiligter können im selben Case
bleiben, wenn sie dasselbe Ergebnis verfolgen. Der medizinische
Care-/Cost-Kern ist nach Entfernung der Claim-Entitaet fachlich akzeptiert.
Weitere Dokumentkatalog-, Provider- und oesterreichische Country-Pack-Details
bleiben bis zu ihren offenen fachlichen, technischen und rechtlichen Gates
begrenzt. Unfall/Schaden bleibt die naechste ausdruecklich gewuenschte
Familien-Re-Review.

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
  `DECISION_INTELLIGENCE_SCOPE.md`; typabhaengige kompakte Review-Feldprofile
  liegen in `DECISION_DOCUMENT_TYPE_CATALOG.md`, ihr gemeinsamer
  Interaktionsvertrag in `DECISION_ASSISTED_REVIEW_SUGGESTIONS.md`. Der nicht
  implementierungsautorisierende Cross-Device-Entwurf steht in
  `DECISION_CROSS_DEVICE_CAPTURE_HANDOFF.md`.
- Zeitangaben, Ereignisse, Fristen, Agenda und Kalenderfaehigkeit:
  `DECISION_TEMPORAL_FACT_EVENT_AGENDA_MODEL.md`.
- Regelbasierte Fristen, Quellenstand und Reminder:
  `DECISION_RULE_DERIVED_DEADLINES_REMINDERS.md`.
- Medizinischer Care-/Kostenabrechnungs-/Einreichungs-Kern:
  `DECISION_MEDICAL_CARE_COST_SETTLEMENT_MODEL.md`.
- Oesterreichischer Medical-Payer-/Friststand:
  `DECISION_AUSTRIA_MEDICAL_PAYER_RULE_PACK.md`.
- Pflege und Developer-Reminder fuer Country-/Provider-Regeln:
  `docs/ops/OPS-09_COUNTRY_PROVIDER_RULE_MAINTENANCE.md`.
- Unfall-/Schaden-, optionale Schadenkosten-, Versicherungsabwicklungs-/Polizzen-
  und Medical-Routing-Kern:
  `DECISION_ACCIDENT_DAMAGE_SETTLEMENT_MODEL.md`.
- Versicherungsabwicklung ohne Claim-Entitaet:
  `DECISION_INSURANCE_SETTLEMENT_MODEL.md`.
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
