---
name: case-concept-review
description: Verwende diesen Skill fuer einen strengen Review einer Mappm-Case-Family-Decision, ihres Katalogeintrags oder eines Country-/Document-Handoffs vor Freigabe, Roadmap-Aufnahme oder Implementation. Er findet Widersprueche, fehlende Case-Grenzen, Uebermodellierung, Taxonomie-Leaks, ungeklaerte Matching-/Backend-Feasibility, Lifecycle-, Zeit-, Privacy-, Test- und SSOT-Luecken.
---

# Case Concept Review

## Review-Ziel

Pruefe eine Case-Familie wie einen production-ready fachlichen
Implementation-Contract, ohne technische Architektur oder UI zu erfinden.

## Quellen

Lies:

1. die zu reviewende Family-Decision;
2. `docs/technical/DECISION_CASE_FAMILY_DEFINITION_CONTRACT.md`;
3. `docs/technical/DECISION_INITIAL_CASE_WORKFLOW_CATALOG.md`;
4. `docs/technical/DECISION_DOCUMENT_TYPE_CATALOG.md`;
5. `docs/technical/DECISION_CASE_DOCUMENT_RECORD_MODEL.md`;
6. `docs/technical/DECISION_CAPTURE_FIRST_ASSISTED_ROUTING.md`;
7. `docs/technical/DECISION_TEMPORAL_FACT_EVENT_AGENDA_MODEL.md`;
8. relevante Country-/Provider-Decisions;
9. Open Questions, Traceability, Roadmap und Backend-Feasibility-Register;
10. `references/REVIEW_CHECKLIST.md`.

## Vorgehen

### 1. Findings zuerst

Berichte Findings nach Schweregrad mit Datei-/Zeilenreferenz:

- `P0`: widerspruechliches/falsches Zielmodell oder Sicherheits-/Rechtsrisiko;
- `P1`: nicht implementation-ready, fehlende Case-Grenze, Lifecycle- oder
  Handoff-Regel;
- `P2`: unvollstaendige Verifikation, Auffindbarkeit oder Traceability;
- `P3`: redaktionelle Klarheit ohne Verhaltensrisiko.

Ein `P0`/`P1`-Finding ist insbesondere jede still vorausgesetzte
Small-Model-Ueberschreitung: automatische Personen-/Empfaengerdeutung,
semantische Wrong-Case-/Wrong-Document-Erkennung, Dokumentkohaerenz oder
Invalidierung, freie Workflow-/Frist-/Beziehungsentscheidung oder feine
Dokumentklassifikation ohne benannten Feasibility-Nachweis. Fachliche
Matching-Signale duerfen geplant werden, muessen aber als best-effort,
nutzbestaetigt und mit Suche/manuellem Fallback beschrieben sein.
Ebenso ist ein fehlender Reviewvertrag ein Finding: Relevante Felder werden
durch Produkt/Document Concept bestimmt; semantische Top-Kandidaten brauchen
erkannte Alternativen, `Kein Wert` beziehungsweise `Kein Datum`, manuelle
Eingabe und keine aktive Wirkung vor der gebuendelten Nutzerbestaetigung.

Wenn keine Findings verbleiben, sage das ausdruecklich und nenne nur echte
Restblocker beziehungsweise spaetere Implementation-Risiken.

### 2. Family-Contract vollstaendig pruefen

Pruefe alle 14 Definitionsbereiche des globalen Vertrags. Ein Bereich darf nur
mit Begruendung `nicht anwendbar` sein.

Pruefe besonders:

- klare Kontinuitaets-, Trennungs-, Beziehungs- und Anti-Signale;
- dokumentlose Anlage und immer gueltiger Case;
- keine Pflicht-/Vollstaendigkeitslisten;
- typische Inhalte getrennt von Dokumenttypen;
- unabhaengige Parent-/Child-Lifecycles;
- bestaetigten Abschluss, Inaktivitaet und spaete Evidenz;
- harmlose reversible Ableitungen ohne doppelte Bestaetigung;
- externe Aktionen, Notifications und Abschluss mit korrektem Gate;
- globale Semantik getrennt von Country-/Provider-Regeln.

### 3. Matching und Backend-Grenze pruefen

Jedes Signal braucht Quelle, Provenienz, Fallback und Feasibility-Status.
Geschlossene Cases bleiben Kandidaten; Suche bleibt erreichbar; `neuer Case`
ist ein normaler Kandidat. Exakte Features, Gewichte und Schwellen duerfen
nicht als Product-Entscheidung erscheinen.

Pruefe die vier verpflichtenden Vorschlagsstufen:

1. bestaetigter Nutzerkontext;
2. starke Kontinuitaet;
3. kombinierte mittlere Signale;
4. schwache/keine Signale mit neuem Case zuerst.

Die Family-Decision muss festlegen, welche konkreten Signale beziehungsweise
Kombinationen jede Stufe tragen. Ein schwaches Einzelsignal, reine
Modell-Confidence oder zeitliche Naehe darf keine starke Kontinuitaet
begruenden. Matching muss als Extraktion, berechtigungsgefiltertes Retrieval,
Ranking und Review geplant sein; ein LLM allein ist weder
Kandidatengenerator noch fachliche Entscheidungsinstanz.

Jeder technische offene Punkt muss im zentralen Feasibility-Register stehen
oder als eigenes Backend-/API-/Data-Issue geplant sein.

### 4. Taxonomie pruefen

Pruefe jeden Dokumentbegriff gegen `document-concept`:

- vorhandener Typ/Variante;
- generisches/breites Dokument mit Titel;
- Fact/Party;
- Rolle/Slot;
- Record;
- Source/Format;
- Country-/Provider-Alias.

`Schlank` ist kein Subtyp-Verbot. Ein Szenario begruendet keinen Typ ohne
Produktwerttest.

### 5. SSOT und Auffindbarkeit pruefen

Pruefe:

- genau eine Family-Decision;
- Katalog als alleinige ID-/Titel-/Status-SSOT;
- Open Questions nur fuer echte offene Punkte;
- Traceability-/Roadmap-/Phase-Verweise;
- Discovery als nicht normative Referenz markiert;
- Skills/Pillars ohne veraltete Blocker;
- relative Links und Frontmatter;
- keine parallelen Listen mit abweichender Bedeutung.

### 6. Evidence und Freigabe pruefen

Verlange synthetische positive, negative, `unknown`-, Konflikt-, Offline-,
Korrektur-, spaete-Evidenz-, Country-Fallback- und Berechtigungsszenarien.
Akzeptiere keine realen privaten Dokumente als Fixture.

Die Familie ist nur freigabefaehig, wenn Findings behoben oder als
blockierende Open Question/Feasibility mit Owner, Zielrelease und Fallback
registriert sind.

## Review-Ausgabe

Nutze:

1. Findings;
2. offene Fragen/Annahmen;
3. kurzer Freigabestatus;
4. gepruefte Artefakte;
5. erforderliche Folgeissues/Handoffs.

Implementiere Fixes nur, wenn die Nutzerin dies verlangt oder der Auftrag
bereits `review und fix` lautet. Aendere dabei keine noch nicht freigegebene
fachliche Workshop-Entscheidung.
