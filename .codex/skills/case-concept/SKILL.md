---
name: case-concept
description: Verwende diesen Skill, wenn eine Mappm-Case-Familie neu definiert, gemeinsam diskutiert, abgegrenzt, internationalisierbar geplant oder nach neuen Produktentscheidungen ueberarbeitet werden soll. Er gilt fuer Case-Grenzen, Matching-Signale, Beziehungen, typische Inhalte, Workflow-Spuren, Aufgaben, Zeit, Finanzen, Lifecycle, Country-Pack-Grenzen und fachliche Backend-/Data-Handoffs; nicht fuer konkrete UI-Layouts, DTOs, Endpunkte oder Persistenz.
---

# Case Concept

## Ziel

Definiere jede Case-Familie als schlanken, umsetzbaren Produktvertrag auf Basis
einer einzigen generischen `Case`-Entitaet. Halte globale Semantik stabil,
Country-/Provider-Regeln austauschbar und Nutzerinteraktion minimal.

## Normative Quellen

Lies vor der Arbeit:

1. `docs/technical/DECISION_CASE_FAMILY_DEFINITION_CONTRACT.md`
2. `docs/technical/DECISION_INITIAL_CASE_WORKFLOW_CATALOG.md`
3. `docs/technical/DECISION_CASE_DOCUMENT_RECORD_MODEL.md`
4. `docs/technical/DECISION_CASE_RELATIONSHIP_WORKFLOW_COMPOSITION.md`
5. `docs/technical/DECISION_CAPTURE_FIRST_ASSISTED_ROUTING.md`
6. `docs/technical/DECISION_INTELLIGENCE_SCOPE.md`
7. `docs/technical/DECISION_DOCUMENT_TYPE_CATALOG.md`
8. `docs/technical/DECISION_TEMPORAL_FACT_EVENT_AGENDA_MODEL.md`
9. `docs/discovery/OPEN_QUESTIONS_REGISTER.md`
10. `docs/execution/handoffs/DOMAIN_BACKEND_FEASIBILITY_REGISTER.md`
11. die vorhandene Owning Decision der betroffenen Familie, falls vorhanden.

Lies `references/CASE_FAMILY_TEMPLATE.md` und
`references/MATCHING_BOUNDARY_MATRIX.md`, bevor du eine Familie strukturierst.

## Arbeitsmodus

### 1. Bestehenden Stand ermitteln

- Finde Katalog-ID, deutschen Titel, Status, Owner und vorhandene Family-
  Decision.
- Trenne akzeptierte Entscheidungen, offene Fragen, verworfene Optionen und
  historische Discovery.
- Erzeuge niemals eine zweite Katalog- oder Family-SSOT.

### 2. Im Dialog definieren

Fuehre den fachlichen Workshop in der Unterhaltung. Erstelle vor der
ausdruecklichen Freigabe der Nutzerin **keine** Draft-/Workshop-Datei und
aendere die Family-Decision nicht.

Gehe mindestens durch:

- Zweck, Nutzerziel, Einstieg und dokumentlose Anlage;
- genaue Case-Grenze und Trennungssignale;
- erlaubte Beziehungen;
- Workflow-Spuren und wiederholbare Ereignisse;
- typische optionale Inhalte;
- Aufgaben, Termine, Fristen, erwartete Antworten und Wiederholung;
- Parteien, Managed Subjects, Records und Assets;
- finanzielle Verpflichtungen, Zahlungen, Eingänge und Deduplizierung;
- Matching-Matrix und Korrekturpfade;
- Abschluss, Inaktivitaet, spaete Evidenz und Wiedereroeffnung;
- globale Semantik versus Country-/Provider-Pack;
- benannter Zielrelease, Spaeter-Scope und Ausschluesse;
- synthetische positive, negative, `unknown`- und Konfliktszenarien.

Die Case-Grenze ist der kritischste Abschnitt. Frage nicht nur, welche
Dokumente vorkommen, sondern welches eigenstaendige Nutzerziel und welcher
zusammenhaengende Verlauf einen neuen Case rechtfertigen.

Definiere fuer jede Familie zusaetzlich die **tatsaechliche
Vorschlagsgrenze**. Nutze nicht nur abstrakte Signalstaerken, sondern ordne
Signal-Kombinationen einer dieser sichtbaren Ergebnisstufen zu:

1. bestaetigter Nutzerkontext: gewaehlter Case beziehungsweise `neuer Case`
   bleibt autoritativ;
2. starke Kontinuitaet: bestehender Case zuerst, neuer Case und Suche bleiben
   erreichbar;
3. kombinierte mittlere Signale: bestehender Case vorsichtig vorschlagen,
   neuer Case gleichwertig erreichbar;
4. nur schwache oder keine Signale: neuer Case zuerst, danach beste bestehende
   Kandidaten und immer die vollstaendige Suche.

Jede Family-Decision muss benennen, welche familiespezifischen Signale diese
Stufen tragen. Ein einzelnes schwaches Signal darf nie Stufe 2 erzeugen.

### 3. Fachlichkeit und Feasibility trennen

Plane fachliche Signale, ohne deren technische Erkennbarkeit zu behaupten.
Markiere fuer jedes relevante Signal Quelle, Provenienz, Wirkung, Fallback und
Backend-/Data-Pruefbedarf.

Plane Matching als Pipeline aus Extraktion, berechtigungsgefilterter
Kandidatensuche, regel-/modellgestuetztem Ranking und Nutzerreview. Ein kleines
Modell darf eine begrenzte Kandidatenmenge mitbewerten, muss aber weder alle
Cases im Prompt verstehen noch allein die Kandidaten erzeugen oder
finalisieren. Volltext, strukturierte bestaetigte Facts, stabile Referenzen,
Embeddings und Regeln bleiben gleichwertige beziehungsweise staerkere
Signalquellen.

Plane standardmaessig fuer kleine bis mittlere General-Purpose-Modelle. Sie
duerfen grobe Dokumentart/Domain, einfache Kandidaten und best-effort
Case-Rankings liefern, aber keine betroffene Person, Dokumentkohaerenz,
Kausalitaet, Beziehung, Workflowrolle, Fristbedeutung oder Lebenssachverhalt
verlaesslich verstehen. Produkt und Document Concept duerfen je
Dokumentart/-variante wenige fachlich relevante Reviewfelder festlegen. Das
Modell darf dafuer einen semantischen Top-Kandidaten und erkannte Alternativen
vorschlagen, auch fuer Datumsfelder. Vor sichtbarer Nutzerbestaetigung entsteht
daraus weder Workflowzustand noch Aufgabe, Frist oder Reminder. Beziehungen
duerfen nur als optionaler, backend-gepruefter Ranking-Vorschlag mit
Nutzerbestaetigung geplant werden.
Userkontext, bewusst gewaehlter Case und Workflowaktionen werden nicht
semantisch als falsch markiert.
Automatische Case-/Dokumenttitel bleiben konservativ, editierbar und enthalten
standardmaessig kein Datum.

Trage offene technische Fragen zentral in
`docs/execution/handoffs/DOMAIN_BACKEND_FEASIBILITY_REGISTER.md` ein. Backend,
Data und Intelligence entscheiden Extraktion, Retrieval, Gewichte,
Schwellen, Latenz, Kosten, Privacy, Contracts und Persistenz. Das Frontend darf
den Bedarf beschreiben, aber keine Backend-Loesung vorwegnehmen.

### 4. Ergebnis zusammenfassen und Freigabe abwarten

Fasse vor dem Schreiben zusammen:

- akzeptierte Regeln;
- noch offene Entscheidungen;
- bewusst verworfene Alternativen;
- Backend-/Data-/Country-Pack-Handoffs;
- Auswirkungen auf Dokumenttaxonomie, Roadmap und andere Familien.

Dokumentiere erst nach einer eindeutigen Freigabe wie `so festhalten`,
`dokumentieren` oder gleichwertiger Zustimmung.

### 5. Genau eine Family-Decision pflegen

- Verwende eine vorhandene eindeutige Owning Decision.
- Lege andernfalls genau
  `docs/technical/DECISION_<CASE_FAMILY>_MODEL.md` an.
- Nutze das Referenztemplate, aber wiederhole globale Invarianten nur per
  Verweis.
- Ein `Subvorgang` ist ein normaler Case mit `part_of`, nie eine zweite
  Entitaet.
- Kein Dokument ist erforderlich; es gibt keine ungueltigen oder
  unvollstaendigen Cases.
- Typische Inhalte sind Vorschlaege, keine Checkliste und keine automatische
  Dokumenttypenliste.
- Harmlose reversible Folgen aus bestaetigten Facts benoetigen keine zweite
  Bestaetigung; externe Aktionen, laute Notifications und Case-Abschluss
  bleiben bestaetigungsgebunden.

### 6. SSOTs synchronisieren

Aktualisiere nur soweit betroffen:

- Katalog-SSOT;
- Open Questions;
- Decision Traceability Matrix;
- Roadmap/Phase Index;
- Discovery Index/Interview Summary;
- Pillar- und Skill-Hinweise;
- Backend-Feasibility-Register.

Erstelle fuer umsetzbare Backend-/API-/Data-/Frontend-Arbeit getrennte GitHub
Issues mit dem `github-issue`-Skill. Keine gemischten
Frontend-/Backend-Implementation-Issues.

### 7. Review

Uebergib die Family-Decision an `case-concept-review`. Eine Familie ist erst
implementation-ready, wenn alle Findings behoben oder als benannte Blocker
mit Owner und Zielphase registriert sind.

## Globale Stop Rules

Stoppe und korrigiere, wenn:

- Szenariobegriffe zu vielen sichtbaren Case-Typen werden;
- ein Dokument oder eine Dokumentmenge Case-Gueltigkeit bestimmt;
- Country-/Providerdetails in globale Case-IDs oder Lifecycle-Enums gelangen;
- Matching-Feasibility als bewiesen dargestellt wird;
- die vier Ergebnisstufen fehlen, nur Modell-Confidence statt fachlicher
  Signale verwendet wird oder ein schwaches Einzelsignal starke Kontinuitaet
  behauptet;
- ein Case-Vertrag negative semantische Erkennung, automatische
  Dokumentinvalidierung oder ein intelligentes Modell ohne Feasibility-Nachweis
  voraussetzt;
- geschlossene Cases aus Matching/Suche verschwinden;
- AI eine Nutzerzuordnung still ersetzt;
- Inaktivitaet einen Case automatisch schliesst;
- Parent-/Child-Lifecycles kaskadieren;
- konkrete UI-, API-, DTO-, Mapping- oder Persistenzdetails erfunden werden;
- ohne Nutzerfreigabe ein Family-Dokument entsteht.
