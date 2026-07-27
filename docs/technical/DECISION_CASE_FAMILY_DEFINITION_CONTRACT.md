---
title: "Entscheidung - Definition und Review von Case-Familien"
description: "Verbindlicher Mappm-Vertrag fuer universelle Case-Familien, Grenzen, Matching, Beziehungen, typische Inhalte, Aufgaben, Lifecycle, Internationalisierung und Feasibility-Handoffs"
tags: [decision, product, cases, workflows, matching, documents, tasks, lifecycle, internationalization, governance]
lastUpdated: "2026-07-25"
status: "accepted"
owner: "product-concept/domain"
---

# Entscheidung - Definition und Review von Case-Familien

## Status und Verantwortung

Diese Entscheidung wurde am 24. Juli 2026 als verbindliches
Definitionsmuster fuer alle Mappm-Case-Familien akzeptiert.

Sie besitzt:

- die globalen Invarianten jeder Case-Familie;
- den verpflichtenden Workshop-, Freigabe- und Review-Ablauf;
- die fachliche Struktur fuer Case-Grenze, Matching, Beziehungen,
  typische Inhalte, Aufgaben, Zeit, Finanzen und Lifecycle;
- die Trennung zwischen universeller Familie, Country-/Provider-Pack und
  technischer Backend-/Data-Umsetzung.

Die alleinige Katalog-SSOT fuer IDs, deutsche Titel, Status und Owner bleibt
`DECISION_INITIAL_CASE_WORKFLOW_CATALOG.md`. Jede fachlich akzeptierte Familie
besitzt genau eine dort registrierte Family-Decision.

Dieses Dokument definiert keine Suchalgorithmen, Confidence-Schwellen, DTOs,
Persistenz oder UI-Layouts. Diese gehoeren nach fachlicher Freigabe in
Backend-/Data-/Contract- beziehungsweise UI-Implementation-Contracts.

## Globale Case-Invarianten

Fuer jede Case-Familie gilt:

- Mappm besitzt genau eine generische `Case`-Entitaet.
- Ein Subvorgang ist die UI-Rolle eines normalen
  `CaseLink(relationType=part_of)`, keine eigene Entitaet.
- Ein Case darf ohne Dokument manuell oder aus bestaetigter Nutzerabsicht
  angelegt werden.
- Ein Case darf null, ein oder mehrere Dokumente enthalten und bleibt immer
  gueltig.
- Kein Dokumenttyp und keine Dokumentmenge ist global oder familienlokal
  verpflichtend.
- Typische Inhalte duerfen vorgeschlagen werden, erzeugen aber weder
  Vollstaendigkeitszaehler noch einen Zustand `invalid` oder `incomplete`.
- Guided, Custom und Assist-suggested Cases besitzen dieselben Faehigkeiten.
- Globale Erfassung bleibt der normale Alltagseingang; kontextuelle Erfassung
  in einem Case bleibt vollwertig und darf familiespezifische Aktionen
  anbieten.
- Backend/Core Assist schlaegt fuer neue Dokumente und Cases editierbare Titel,
  Facts, Kontexte und naechste Schritte vor.
- Nutzerwerte und bewusste Case-/Profilzuordnungen tragen hoehere Provenienz
  als spaetere Modellvorschlaege und werden nie still ueberschrieben.
- Abschluss, Archivierung und Wiedereroeffnung sind nachvollziehbar und
  reversibel.
- Geschlossene und archivierte Cases bleiben Such- und Matching-Kandidaten.
- Case-Beziehungen verwenden ausschliesslich die akzeptierten generischen
  Typen `part_of`, `caused_by`, `follow_up_to` und `related_to`.
- Sprache bestimmt weder Land noch Rechtsraum.
- Jede Familie funktioniert mit generischen Dokument-Fallbacks und ohne
  aktives Country-/Provider-Pack.

Eine Family-Decision wiederholt diese Regeln nicht als neue lokale
Varianten. Sie beschreibt nur fachliche Besonderheiten und explizite
Praezisierungen.

## Verpflichtende Definitionsbereiche

Jede Family-Decision muss die folgenden Bereiche beantworten oder
nachvollziehbar als nicht anwendbar markieren:

| Bereich | Verpflichtende Entscheidung |
|---|---|
| Zweck und Nutzerziel | Welches reale Ziel, welcher Kontext oder Verlauf wird organisiert und welches verstaendliche Ergebnis kann entstehen? |
| Einstieg und Anker | Welche Dokumente, Medien, Records, Ereignisse oder Nutzerabsichten koennen einen Vorschlag ausloesen? Wie wird ein dokumentloser Case initialisiert? |
| Case-Grenze | Was gehoert zum selben Case, was trennt ihn ausdruecklich nicht und wann ist ein neuer eigenstaendiger Case fachlich gerechtfertigt? |
| Beziehungen | Welche `part_of`-, `caused_by`-, `follow_up_to`- oder `related_to`-Beziehungen sind typisch, erlaubt oder ausgeschlossen? |
| Workflow und Spuren | Welche Schritte, wiederholbaren Ereignisse und voneinander unabhaengigen Status-/Ablaufspuren existieren? |
| Typische Inhalte | Welche Dokumente, Medien, Records, Facts oder Rollen sind haeufig und duerfen kontextuell vorgeschlagen werden? |
| Aufgaben und Zeit | Welche Aufgaben, Termine, Fristen, erwarteten Antworten, Reminder und Wiederholungen koennen aus welchem bestaetigten Signal entstehen? |
| Personen und Parteien | Welches Managed Subject, welche External Parties, Vertrage, Polizzen, Assets oder anderen Records koennen beteiligt sein? |
| Finanzen | Welche Verpflichtungen, Zahlungen, Erstattungen oder Roll-ups sind relevant und wie wird Doppelzaehlung verhindert? |
| Matching und Assist | Welche bestaetigten Signale sprechen fuer Kontinuitaet, Trennung, neuen Case oder eine Beziehung? Welche Signale duerfen allein nie entscheiden? |
| Lifecycle | Wie werden manueller Abschluss, Abschlussvorschlag, Inaktivitaetsreview, spaete Dokumente und Wiedereroeffnung behandelt? |
| Country-/Provider-Grenze | Was ist universell und welche Begriffe, Regeln, Formulare, Institutionen oder Fristen gehoeren ausschliesslich in Packs? |
| Zielrelease | Welche Faehigkeiten gehoeren in den aktuell benannten Release-Scope, welche sind spaeter und welche ausgeschlossen? |
| Verifikation | Welche positiven, negativen, `unknown`-, Konflikt-, Korrektur- und Fallback-Fixtures beweisen die Familie? |

Der Skill und das Template verwenden einen variablen Zielrelease. `M1`,
`Commercial 1.0` oder ein spaeterer Meilenstein wird nicht fest in das
Definitionsmuster eingebaut.

## Case-Grenze und Matching-Matrix

Die Case-Grenze ist der kritischste Abschnitt. Jede Familie pflegt deshalb
eine fachliche Signal-Matrix:

| Signal | Moegliche Quelle | Kontinuitaet | Neuer Case | Beziehung | Darf allein entscheiden? | Backend-Feasibility |
|---|---|---|---|---|---|---|
| familiespezifisches Signal | Nutzer, Dokument, Record, Case, Event oder Pack | stark/mittel/schwach/gegen | stark/mittel/schwach/gegen | Relation oder keine | ja/nein + Bestaetigung | ungeprueft/aktueller Scope/spaeter/nicht verlaesslich |

Die Matrix trennt:

- **Kontinuitaetssignale**, die fuer einen bestehenden Case sprechen;
- **Trennungssignale**, die fuer einen neuen eigenstaendigen Case sprechen;
- **Beziehungssignale**, die einen bestaetigten Case-Link begruenden koennen;
- **schwache oder neutrale Signale**, die allein keine materielle Zuordnung
  tragen;
- **Anti-Signale**, die gegen einen Kandidaten sprechen.

Eine fachliche Aussage wie `bei bestaetigter Behandlungsreferenz stark` ist
keine Behauptung, dass das Backend diese Referenz im aktuellen Zielrelease
zuverlaessig extrahieren kann. Jedes Signal benennt deshalb:

- erwartete Quelle und Provenienz;
- benoetigte Bestaetigungsstufe;
- fachliche Wirkung, falls es verlaesslich vorliegt;
- bekannten Fallback;
- offene Backend-/Data-Feasibility.

Der Product-/Domain-Owner besitzt Bedeutung und Case-Grenze. Backend-/Data-/
Intelligence-Owner pruefen Extrahierbarkeit, Candidate Retrieval,
Confidence-Kalibrierung, Kosten, Latenz, Datenschutz und technische
Alternativen. Sie duerfen die fachliche Semantik oder Taxonomie nicht still
veraendern, koennen aber eine Revision mit Evidenz vorschlagen.

## Matching-Ausgabe und Korrektur

Matching darf getrennt vorschlagen:

```text
primaerer Kontext
  bestehende Cases oder Records, gerankt
  neuer Case, wenn plausibel

zusaetzliche Kontexte
  weitere Document-Case-/Record-Links

Case-Beziehungen
  part_of / caused_by / follow_up_to / related_to
```

Jede Familie belegt dieselbe sichtbare Vorschlagsgrenze mit ihren eigenen
fachlichen Signalen:

| Stufe | Evidenz | Primaere Ausgabe |
|---|---|---|
| 1 Bestaetigter Nutzerkontext | Case oder neuer Case bewusst gewaehlt | Nutzerkontext sofort uebernehmen; weiteres Ranking nur ergaenzend |
| 2 Starke Kontinuitaet | zugelassenes starkes Signal oder family-spezifisch belegte starke Kombination | bestehenden Case zuerst vorschlagen |
| 3 Kombinierte mittlere Signale | mehrere kompatible mittlere Signale ohne starkes Anti-Signal | bestehenden Case vorsichtig vorschlagen; neuer Case gleichwertig erreichbar |
| 4 Schwach oder unbekannt | nur schwache/neutrale oder keine verwertbaren Signale | neuen Case zuerst, danach beste bestehende Kandidaten |

In allen Stufen bleiben weitere berechtigte Kandidaten und die vollstaendige
Suche erreichbar. Ein einzelnes schwaches Signal, reine Modell-Confidence,
derselbe Absender oder zeitliche Naehe darf keine starke Kontinuitaet
behaupten.

Matching wird als Pipeline aus Extraktion, berechtigungsgefilterter
Kandidatensuche, regel-/modellgestuetztem Ranking und Nutzerreview geplant.
Kleine beziehungsweise mittlere Modelle duerfen eine begrenzte
Kandidatenmenge mitbewerten, sind aber weder alleiniger Kandidatengenerator
noch fachliche Entscheidungsinstanz. Strukturierte bestaetigte Facts, stabile
Referenzen, Volltext, Embeddings und Regeln bleiben explizite Signalquellen.

Produktregeln:

- Die besten Kandidaten erscheinen kompakt.
- Niedrig gewichtete Kandidaten duerfen hinter einer weiteren Ergebnisstufe
  liegen; exakte Top-K- und Lazy-Loading-Schwellen gehoeren zum Backend-/UI-
  Handoff.
- `Neuer Vorgang` ist ein normaler Kandidat und darf bei niedriger
  Kontinuitaetsevidenz zuerst gereiht werden.
- Eine Suche ueber alle berechtigten Cases bleibt immer erreichbar, auch wenn
  ein gewuenschter Case nicht in den sichtbaren Matching-Kandidaten liegt.
- Aktive Cases duerfen einen Ranking-Vorteil erhalten. `done` und `archived`
  erhalten hoechstens einen ueberstimmbaren Malus und werden nie hart
  ausgeschlossen.
- Stabile bestaetigte Referenzen oder eindeutige Kontinuitaet duerfen den
  Lifecycle-Malus ueberstimmen.
- Matching muss nicht perfekt sein; es muss gute, korrigierbare Vorschlaege,
  Abstention/Fallback und ausreichenden Candidate Recall liefern.
- Aktuelle materielle Zuordnungen und Case-Beziehungen bleiben
  nutzerbestaetigt. Spaetere Automation benoetigt klassenbezogene
  Precision-, Abstention-, Undo- und Rollback-Gates.

Exakte Algorithmen, Features, Gewichte, Schwellen und Contract-Strukturen
liegen beim Backend-/Data-/Intelligence-Team.

## Kontextuelle Erfassung im Case

Case-scoped Capture ist nicht nur eine Abkuerzung des globalen Uploads. Eine
Family-Decision darf besondere kontextuelle Aktionen anbieten, beispielsweise:

- ein medizinisches Desktop-Medienpaket in einem offenen Care-Case;
- eine benannte Fotogalerie im Unfall-/Schaden-Case;
- einen erwarteten Bericht oder eine andere typische Unterlage;
- eine familiespezifische Export-/Importaktion nach eigener Freigabe.

Wenn die Nutzerin in einem Case bewusst einen erwarteten Inhalt hinzufuegt:

1. werden Case und Managed Subject als bestaetigte Nutzerprovenienz sofort
   uebernommen; eine Rolle oder ein Workflowereignis nur dann, wenn die
   gewaehlte kontextuelle Aktion genau diese Bedeutung ausdrueckt;
2. erscheint das Dokument ohne Warten auf das Case-/Record-Ranking im Case als
   `processing`;
3. laufen OCR, grobe Klassifikation, Duplicate- und zusaetzliches
   Case-/Record-Ranking weiterhin;
4. wird die bewusste Zuordnung nicht semantisch auf Wrong-Case oder
   Wrong-Document geprueft;
5. darf Assist weitere Cases, Records oder Beziehungen nur best-effort
   vorschlagen; jede zusaetzliche Beziehung bleibt nutzerbestaetigt.

## Typische Inhalte und Dokumenttaxonomie

Eine Case-Familie darf typische Dokumente und Medien kennen, zum Beispiel
Rechnung, Zahlungsnachweis, Bericht oder Fotogalerie. Diese Liste dient:

- Matching und Candidate Generation;
- kontextuellen Upload-Aktionen;
- naechsten Schritten und erwarteten Antworten;
- erklaerbaren Vorschlaegen.

Sie ist keine Dokumenttypenliste. Jeder Begriff wird mit
`DECISION_DOCUMENT_TYPE_CATALOG.md` darauf geprueft, ob er:

- globale Grundart oder semantische Variante;
- generisches Dokument mit passendem Titel;
- beziehungsbezogene Rolle;
- Fact;
- Record-Kind;
- Medien-/Source-/Formatart;
- Country-/Provideralias

ist. Backend-Erkennbarkeit allein erzeugt keinen Dokumenttyp; fehlende
Erkennbarkeit schliesst eine spaetere, belegte Promotion nicht aus.

## Aufgaben, Zeit und reversible Ableitungen

Die Familie definiert pro Ausloeser:

| Bestaetigter Ausloeser | Abgeleitete Aufgabe/Erwartung | Zeitquelle | Weitere Bestaetigung | Wirkung auf Lifecycle |
|---|---|---|---|---|
| Fact, Event, Nutzeraktion, Workflow- oder Pack-Regel | Task, erwartete Antwort, Termin, Frist, Reminder oder Wiederholung | Dokument, Nutzer, Record, Event oder versionierte Regel | noetig/nicht noetig | keine, Aufmerksamkeit oder Abschlussvorschlag |

Grundregel:

- Unsichere extrahierte Facts und materielle Zuordnungen werden gemaess
  aktiver Review-Reife bestaetigt.
- Eine harmlose, interne und reversible Folge aus bereits bestaetigten Facts
  benoetigt keine zweite Bestaetigung.
- Beispiel: Bestaetigte unbezahlte Rechnung und Faelligkeit erzeugen die
  editierbare Aufgabe `Rechnung bezahlen`.
- Beispiel: Bestaetigte Einreichung erzeugt eine editierbare erwartete Antwort.
- Externe Aktionen, laute Notifications, Sharing, Zahlung, Einreichung und
  Case-Abschluss benoetigen ihre jeweils ausdruecklich freigegebene
  Bestaetigung.

Zeitsemantik und Agenda-Eignung folgen
`DECISION_TEMPORAL_FACT_EVENT_AGENDA_MODEL.md`; regelbasierte Fristen folgen
`DECISION_RULE_DERIVED_DEADLINES_REMINDERS.md`.

## Lifecycle, Inaktivitaet und spaete Evidenz

Ein Case darf in der aktuellen Reifestufe immer bewusst abgeschlossen werden.
Ein Workflow- oder Assist-Signal darf den Abschluss vorschlagen, finalisiert
ihn aber nicht still. Familiespezifische terminale Spuren begruenden einen
kompakten Abschlussvorschlag, keine zweite Lifecycle-Autoritaet.

Als globale Default-Pruefung darf Mappm nach sechs Monaten ohne relevante
Aktivitaet fragen, ob ein Case noch aktiv ist. Das ist niemals ein
automatischer Abschluss. Die Pruefung wird unterdrueckt oder verschoben, wenn
eine plausible Zukunft bekannt ist, insbesondere:

- offener Termin oder bestaetigte Frist;
- erwartete Antwort oder bewusstes Reviewdatum;
- Wiederholungsregel oder naechstes Vorkommen;
- Abo-, Vertrags- oder Rechnungsrhythmus;
- periodische Kontrolle oder andere langfristige Planung;
- familiespezifisch belegte Wartephase.

`lastMeaningfulActivityAt` darf nicht durch technische Reindexierung,
Hintergrundsync oder andere bedeutungslose Systemarbeit aktualisiert werden.
Welche fachlichen Ereignisse Aktivitaet darstellen, gehoert in die
Family-Decision und spaeter in den Domain-Contract.

Geschlossene Cases bleiben Matching-Kandidaten. Spaete Evidenz darf:

- ohne Wiedereroeffnung als bestaetigende Evidenz verknuepft werden;
- bei neuer Arbeit eine nutzerbestaetigte Wiedereroeffnung vorschlagen;
- bei eigenstaendigem Ziel einen neuen verknuepften Case vorschlagen.

Verknuepfte Cases besitzen unabhaengige Lifecycles. Ein `part_of`-Child darf
aktiv bleiben, waehrend sein fachlicher Parent bereits `done` ist. Eine
aggregierte UI darf dies erklaeren, aber keinen gemeinsamen Domainstatus
erfinden.

## Country-/Provider-Packs

Eine universelle Family-Decision darf keine oesterreichischen oder anderen
nationalen Institutionen, Fristen, Formulare oder Rechtsbegriffe als globale
Case-Struktur hardcoden.

Ein Country-/Provider-Pack:

- referenziert registrierte universelle Case-/Workflow-IDs;
- lokalisiert Begriffe und erwartete Inhalte;
- definiert Institutionen, Provider, Formate und Regeln;
- traegt Country, Region, Provider/Tarif, Version, `validFrom`, optional
  `validTo`, Quellen- und Reviewdaten;
- besitzt einen generischen Fallback;
- darf keine neue globale Case- oder Dokument-ID allein wegen lokaler
  Darstellung erfinden;
- eskaliert eine echte globale Modellluecke zurueck an `case-concept` oder
  `document-concept`.

Das erste Austria-Pack ist eine Anwendung dieses generischen Vertrags, keine
Sonderlogik des Skills.

## Freigabe- und Handoff-Ablauf

```text
Case-Familie im Workshop diskutieren
  -> akzeptierte Regeln, Vorschlaege, offene Fragen und verworfene Optionen trennen
  -> Backend-/Data-Feasibility markieren
  -> Nutzerin gibt Dokumentation ausdruecklich frei
  -> genau eine Family-Decision aktualisieren
  -> Katalog, Open Questions, Traceability und Roadmap synchronisieren
  -> case-concept-review
  -> erst danach Contract-/UI-Implementation-Plan
```

Vor ausdruecklicher Freigabe entsteht kein Workshop-Draft und keine zweite
Family-Decision. Technisch offene Punkte werden in
`docs/execution/handoffs/DOMAIN_BACKEND_FEASIBILITY_REGISTER.md` verfolgt und
vor Umsetzung in getrennte Backend-/API-/Data-Issues ueberfuehrt.

## Verifikation

Jede Familie besitzt mindestens synthetische Szenarien fuer:

- dokumentlose manuelle Anlage;
- ein typisches Dokument und einen generischen Fallback;
- mehrere zusammenhaengende Dokumente;
- schwaches Matching und manuellen Such-Fallback;
- bestehenden, abgeschlossenen und archivierten Kandidaten;
- neuen Case als besten Kandidaten;
- Case-Beziehung und falschen Relationstyp;
- kontextuellen Upload mit konsistentem und widerspruechlichem Dokument;
- spaete Evidenz ohne sowie mit Wiedereroeffnung;
- Inaktivitaetsreview mit und ohne bekannte Wiederholung/Zukunft;
- harmlose automatische Ableitung aus bestaetigtem Fact;
- nicht freigegebene externe Aktion;
- unbekanntes oder nicht aktives Country-/Provider-Pack;
- Korrektur ohne Datei-, Fact- oder Historienverlust.

## Stop Rules

Stop, wenn:

- eine Familie eine zweite Case-Entitaet, Claim-Entitaet oder einen echten
  Subcase-Typ einfuehrt;
- ein Case ohne Dokument ungueltig waere;
- typische Inhalte zu Pflicht- oder Vollstaendigkeitslisten werden;
- Szenariobegriffe ungeprueft Dokumenttypen erzeugen;
- Country-/Providerdetails in globale Case-IDs oder Lifecycle-Enums gelangen;
- Matching-Signalstaerke als bewiesene Backend-Extrahierbarkeit dargestellt
  wird;
- kleine/mittlere Modelle fuer Person, Dokumentkohaerenz, Workflow,
  Fristbedeutung, Kausalitaet oder Beziehung als verlaessliche Wahrheitsquelle
  vorausgesetzt werden;
- geschlossene Cases hart aus Matching oder Suche ausgeschlossen werden;
- eine fehlende sichtbare Kandidatenzeile den Suchzugang zum gewuenschten Case
  entfernt;
- AI eine bestaetigte Nutzerzuordnung still ersetzt;
- semantisch gemischter Inhalt ein Dokument oder einen Case invalidiert,
  ablehnt oder in M1 automatisch segmentiert;
- Kontext-Capture auf das Case-/Record-Ranking warten muss, bevor das Dokument im Case
  erscheint;
- harmlose reversible Folgen mehrfach bestaetigt werden muessen;
- Inaktivitaet einen Case automatisch schliesst oder bekannte Wiederkehr
  ignoriert;
- Parent-/Child-Lifecycle kaskadiert oder zu einem Status verschmolzen wird;
- ein Skill technische Backend-/Data-/Contract-Entscheidungen erfindet;
- eine Family-Decision ohne Review, Fixtures, Handoff und Katalogabgleich als
  implementierbar gilt.
