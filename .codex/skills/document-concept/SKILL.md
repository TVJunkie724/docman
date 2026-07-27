---
name: document-concept
description: Verwende diesen Skill, wenn Mappm-Dokumentgrundarten, semantische Varianten/Subtypen, Rollen, Workflow-Slots, Record-Arten, Fallbacks, Country-/Provider-Aliase oder die Promotion eines erkannten Dokumentbegriffs geplant oder geprueft werden. Er verhindert Massentaxonomien, ohne sinnvolle Subtypen auszuschliessen, und trennt Produktsemantik von Backend-Erkennung und rechtlicher Dokumentpruefung.
---

# Document Concept

## Ziel

Waehle die am wenigsten granulare stabile Klassifikation, die den benoetigten
Produktwert vollstaendig traegt. `Schlank` bedeutet nicht `ohne Subtypen`.

## Normative Quellen

Lies:

1. `docs/technical/DECISION_DOCUMENT_TYPE_CATALOG.md`
2. `docs/discovery/CASE_DOCUMENT_TAXONOMY_CANDIDATES.md`
3. `docs/technical/DECISION_CASE_FAMILY_DEFINITION_CONTRACT.md`
4. `docs/technical/DECISION_CAPTURE_FIRST_ASSISTED_ROUTING.md`
5. `docs/technical/DECISION_INTELLIGENCE_SCOPE.md`
6. die betroffene Case-Family-Decision;
7. `docs/execution/handoffs/DOMAIN_BACKEND_FEASIBILITY_REGISTER.md`.

Nutze `references/DOCUMENT_DECISION_TEMPLATE.md` und
`references/PROMOTION_COUNTRY_MATRIX.md`.

## Vorgehen

### 1. Begriff inventarisieren

Ermittle, ob der Begriff eine globale Dokumentgrundart, produktrelevante
Variante, Domain, beziehungsbezogene Rolle, Workflow-Slot, langlebigen Record,
Fact/Party, technischen Source-/Formattyp, Titel/Alias oder nur
Erkennungs-/Fixture-Vokabular beschreibt.

Eine Liste typischer Dokumente in einem Case ist nie automatisch eine
Dokumenttypenliste.

### 2. Produktwerttest anwenden

Ein persistierter Typ oder Subtyp ist nur gerechtfertigt, wenn:

- er langlebige gezielte Wiederverwendung ermoeglicht oder
  Matching/Workflow/Task/Frist/Zustand/Export/Handoff materiell veraendert;
- Titel, Volltext, Facts, Parties, Domain, Record, Rolle oder Country-Alias
  diesen Wert nicht ausreichend tragen;
- die Semantik stabil und fuer normale Nutzer verstaendlich ist;
- Erkennung einen sicheren Fallback/Abstention-Pfad besitzt;
- Nutzen Migration, Lokalisierung, Korrektur und UI-Komplexitaet rechtfertigt.

Wende den Gate auf jede neue Grundart, Variante und jeden breiten Domain-Typ
an. Nur der universelle generische/`unknown`-Fallback braucht keinen eigenen
Produktwertnachweis.

Behalte Kandidaten, die den Gate bestehen. Reduziere nicht nur um eine kleine
Zahl zu erreichen. `medical_invoice` ist das Referenzbeispiel fuer eine
sinnvolle Variante.

Die produktive Liste bleibt trotzdem klein und konservativ. Plane fuer kleine
bis mittlere General-Purpose-Modelle, die grobe Klassen wie
Apothekenrechnung versus Elektronikrechnung unterscheiden koennen, aber keine
feine Formular-, Rollen-, Rechts- oder Lebenskontextsemantik verlaesslich
beherrschen. Ein Typ oder Subtyp benoetigt deshalb neben Produktwert entweder
einen belegten Erkennungspfad auf der Zielmodellklasse oder eine einfache
bewusste Nutzereingabe. Ohne diesen Pfad bleibt der breite/generische Typ das
vollwertige Endergebnis.

### 3. Laenderlayer trennen

Modelliere drei Ebenen:

1. globale fachliche Semantik;
2. Country-/Jurisdiction-Aliase und versionierte Feld-/Referenzmuster;
3. Provider-/Formular-/Tarif-Overlay, falls belegt.

Erzeuge keine kombinierten Land-Provider-Jahr-Status-Typen. Sprache bestimmt
keinen Rechtsraum.

Bei Rechnungen und anderen regulierten Dokumenten duerfen Packs
Pflicht-/Optionalfelder als Analysehinweis kennen. Mappm beurteilt aber keine
rechtliche Gueltigkeit, Compliance, Steuerwirkung oder formale Korrektheit.

### 4. Backend-Feasibility registrieren

Backend/Intelligence prueft Erkennbarkeit, Confidence/Abstention, Fixtures,
Kosten, Latenz und Country-Unterschiede. Es darf eine Promotion mit Evidenz
vorschlagen, aber keinen Produkt-Typ eigenmaechtig einfuehren.

Definiere fuer jede unterstuetzte Grundart beziehungsweise produktrelevante
Variante auch ihr **kompaktes Review-Feldprofil**:

- welche wenigen Felder im normalen Review relevant sind;
- welche Felder vorausgefuellt werden duerfen;
- welche semantische Bedeutung der Top-Kandidat traegt;
- welche erkannten Alternativen direkt am Feld angeboten werden;
- ob `Kein Wert` und manuelle Eingabe erforderlich sind;
- welche uebrigen Kandidaten nur unter Details erscheinen;
- welche bestaetigten Facts harmlose reversible Aufgaben/Reminder ableiten.

Die Feldmenge und Prioritaet ist eine Product-/Document-Entscheidung, keine
freie LLM-Ausgabe. Fuer Datumsfelder gilt standardmaessig: Top-Kandidat im
semantisch benannten Feld, andere erkannte Datumswerte plus `Kein Datum` und
`Manuell eingeben` in der kompakten Auswahl, weitere Kandidaten unter Details.

Fuehre offene Punkte im zentralen Feasibility-Register und benoetige vor
Promotion Product-/Domain-Freigabe, Fallback, Migration und versionierte
Fixtures.

### 5. SSOT aktualisieren

Dokumentiere Taxonomieentscheidungen in
`DECISION_DOCUMENT_TYPE_CATALOG.md` beziehungsweise dem alleinigen
Katalogartefakt. Eine Case-Family-Decision beschreibt nur ihre typischen
Inhalte und verweist auf die Taxonomie.

Aktualisiere Kandidatenmatrix, Open Questions, Traceability, Country-Pack und
Tests, wenn betroffen. Erzeuge keine parallele Typenliste.

## Capture- und Review-Regeln

- Nutzerangaben behalten Provenienz.
- Assist ergaenzt fehlende grobe Werte, prueft Userkontext aber nicht
  semantisch auf vermeintliche Fehler.
- Breite/generische Klassifikation ist ein valides Endergebnis.
- Konservative editierbare Titelvorschlaege ohne standardmaessiges Datum,
  Suche und bestaetigte Facts tragen Details, die keinen eigenen Typ
  rechtfertigen.
- Die UI zeigt keinen grossen Taxonomie-Picker.
- Fehlende Feinheit macht weder Dokument noch Case ungueltig.
- Vorschlaege duerfen umfangreich sein, werden aber als schlankes
  typabhaengiges Formular statt als Rohmetadatenmenge reviewt.
- Normale Korrekturen sind in M1 weder Trainingsfreigabe noch
  Analyseverbesserungsprogramm.

## Stop Rules

Stoppe, wenn:

- `schlank` als Subtyp-Verbot verstanden wird;
- kleine Modelle durch nicht belegte feine Klassifikation, Rollen- oder
  Kontextinterpretation ueberfordert werden;
- jeder fachlich erkennbare Begriff einen Typ erzeugt;
- Provider, Land, Jahr, Format, Status und Case-Rolle in einen Enum-Key
  verschmelzen;
- eine globale Rolle auf `Document` gespeichert wird;
- AI/OCR ohne Product-/Domain-Gate Taxonomie veraendert;
- fehlende Felder als rechtliche Ungueltigkeit dargestellt werden;
- semantisch verschiedene Seiten oder Inhalte ein Dokument ungueltig machen,
  eine Ablehnung erzwingen oder ohne belegten spaeteren Feasibility-Gate
  automatisch getrennt werden;
- Empfaenger, Managed Subject, Case-Zugehoerigkeit, Workflow-State,
  Datumsbedeutung oder Beziehung durch ein kleines/mittleres Modell als
  fachliche Wahrheit gesetzt werden; sichtbar korrigierbare semantische
  Vorschlaege bleiben erlaubt und erwartet;
- das Modell die sichtbare Review-Feldmenge frei erfindet oder alle erkannten
  Werte standardmaessig offenlegt;
- normale M1-Korrektur als Dokumentspende, Human Review, Online-Lernen oder
  Fine-Tuning behandelt wird;
- Implementierung vor finalem Katalogreview und Feasibility-Handoff beginnt.
