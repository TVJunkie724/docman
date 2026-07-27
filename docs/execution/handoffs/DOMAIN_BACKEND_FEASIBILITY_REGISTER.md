---
title: "Handoff-Register - Domain-, Backend- und Intelligence-Feasibility"
description: "Zentrale, nicht implementierende Pruefliste fuer technisch zu validierende Mappm-Produktannahmen aus Case-, Document-, Capture-, Matching- und Temporal-Konzepten"
tags: [handoff, backend, data, intelligence, feasibility, matching, capture, documents]
lastUpdated: "2026-07-25"
status: "active-register"
owner: "product-concept/contract-api/data-architect"
---

# Handoff-Register - Domain-, Backend- und Intelligence-Feasibility

## Zweck und Grenze

Dieses Register sammelt Produktannahmen, deren fachliche Richtung akzeptiert
ist, deren technische Machbarkeit, Qualitaet, Latenz, Kosten oder
Contract-Grenze aber durch Backend-, Data- und Intelligence-Owner geprueft
werden muss.

Es ist keine Backend-Spezifikation und ersetzt keine GitHub Issues. Vor
Implementation werden aktive Eintraege in getrennte Backend-/API-/Data-Issues
mit dem projektlokalen `github-issue`-Skill ueberfuehrt. Frontend darf Bedarf,
sichtbares Verhalten und benoetigte Erklaerdaten beschreiben; Backend-/API-
Owner entscheiden Contracts, DTOs, Endpunkte, Mapping, Persistenz und
Policy-Architektur.

Statuswerte:

- `open`: fachliche Annahme dokumentiert, technische Pruefung ausstehend;
- `spike-required`: reproduzierbarer Spike/Evaluation erforderlich;
- `accepted-current-scope`: fuer den benannten Zielrelease belegt;
- `accepted-later`: machbar, aber bewusst spaeter;
- `not-feasible-current-scope`: aktueller Scope verwendet den dokumentierten
  Fallback;
- `superseded`: durch andere Entscheidung ersetzt.

## Aktive Pruefpunkte

| ID | Produktannahme | Backend-/Data-Pruefung | Akzeptanznachweis | Aktueller Fallback | Status/Owner |
|---|---|---|---|---|---|
| BF-001 | Progressive Verarbeitung darf fruehe grobe Kandidaten vor abgeschlossenem Case-/Record-Ranking liefern | Job-/Proposal-Stufen, Abhaengigkeiten, Versionierung, Restart, Kosten und Median-/Tail-Latenz pruefen | produktionsnahe synthetische Benchmarks und versionierter Proposal-Contract | gesamtes Ergebnis spaeter asynchron in Review Queue | `open` / backend-intelligence-contract |
| BF-002 | Breite Dokumentart/Domain, Aussteller, ein wahrscheinlicher Rechnungs-Gesamtbetrag und Datumsstring-Kandidaten koennen fuer geeignete Klassen frueh vorgeschlagen werden | je Dokumentklasse Extrahierbarkeit, Candidate Recall, Confidence, Abstention und Sprach-/Country-Abdeckung auf kleinen/mittleren Zielmodellen messen; Zahlstatus bleibt Userangabe | klassenbezogene Precision-/Recall-/Abstention-Matrix; keine sichtbaren Netto-/USt-/Positionskandidaten | fehlende Werte bleiben leer; Nutzer bestaetigt/korrigiert Gesamtbetrag und Offen/Bezahlt; Datum bleibt manuell erfassbar | `open` / backend-intelligence |
| BF-003 | Der sichtbare Capture-/Managed-Subject-Kontext bleibt autoritativ und wird nicht aus Empfaenger-/Namensdaten semantisch geprueft | Access-Filter vor Candidate Generation sowie getrennte optionale Party-Metadaten pruefen; kein Wrong-Profile-Contract | synthetische Mehrprofil-Fixtures mit Brief an A im bewusst gewaehlten Kontext B und ohne Cross-Subject-Leak | Userkontext beibehalten; Empfaenger darf leer bleiben | `open` / backend-intelligence-security |
| BF-004 | Case-Matching liefert bestehende, neue, geschlossene und archivierte Kandidaten mit ueberstimmbarem Lifecycle-Malus | Candidate Retrieval, Ranking, Top-K, Lazy Loading, Search-Fallback und Confidence-Kalibrierung pruefen | Recall@K, Korrektur-, Abstention- und Cross-Subject-Metriken | manuelle Suche und neuer leichter Case | `open` / backend-search-intelligence |
| BF-005 | Matching darf optionale zusaetzliche Document-Case-Links und Case-Beziehungen best-effort vorschlagen | Candidate-Graph, Relationsevidenz, Duplikat-/Zykluspruefung und Erklaerbarkeit auf der Zielmodellklasse evaluieren; keine garantierte Core-Ausgabe | positive/negative/unknown Relation-Fixtures je freigegebener Familie und ausschliesslich Nutzerbestaetigung | nur primaeren Case bestaetigen; Beziehungen ueber Suche/manuell verknuepfen | `open` / backend-domain-intelligence |
| BF-006 | Ein importiertes PDF mit Rechnung und Zahlungsnachweis fuer denselben Kontext kann als ein Dokument mehrere Evidence-Rollen/Facts tragen | Multi-Role-/Page-Provenienz, Titel, OCR und Review ohne automatische Dokumentaufspaltung pruefen | synthetische Compound-PDF-Fixtures und Data-/Contract-Review | als generisches Einzeldokument erfassen; Facts manuell korrigierbar | `spike-required` / backend-data-contract |
| BF-007 | Eine explizit abgeschlossene Mobile-Scan-Einheit beziehungsweise eine Desktop-Datei bleibt im aktuellen Zielrelease ein logisches Dokument, auch wenn ihr Inhalt semantisch gemischt ist | Contract/Data pruefen auf Originalerhalt, generischen Fallback und Abwesenheit von `invalid`, `separate_documents_required`, Ablehnung oder Auto-Split | Fixture Rechnung plus Bericht in einer Datei wird als ein generisches Dokument akzeptiert; kein semantischer Fehlerstatus | ein logisches Dokument; Nutzer darf spaeter manuell neu erfassen/ordnen | `accepted-current-scope` / product-backend-data |
| BF-008 | Kontextueller Case-Upload erscheint sofort im Case, waehrend grobes zusaetzliches Ranking weiterlaeuft | durable User-Provenienz, Processing-Link, optionale weitere Kandidaten, Reassignment und Restart pruefen | Offline-/Restart-Tests ohne semantische Wrong-Case-Warnung oder stilles Verschieben | Dokument bleibt im gewaehlten Case und wird nur auf Useraktion korrigiert | `open` / backend-contract-data |
| BF-009 | Dokumentgrundarten/Varianten werden nur bei belegtem Produktwert und ausreichender Erkennung promoted | je Kandidat Erkennungsqualitaet, Fallback, Trainings-/Betriebskosten und Country-Abdeckung liefern | dokumentierter Product-Value-Gate plus Backend-Evidence | generischer/breiter Typ, Titel, Facts, Rollen und Suche | `open` / product-backend-intelligence |
| BF-010 | Country-/Provider-Packs koennen Extraktionsaliases, Feldmuster und Formularversionen liefern, ohne globale Typen zu vervielfachen | Pack-Schema, Versionierung, Distribution, Modell-/Regelkopplung und Fallback pruefen | mindestens ein synthetischer Austria-Pack-Durchstich und unbekanntes-Land-Fallback | globale Semantik plus generische Extraktion | `open` / backend-contract-domain |
| BF-011 | Bestaetigte Facts duerfen harmlose reversible Tasks/Expected Responses ohne zweite Bestaetigung erzeugen | idempotente Rule-/Event-Ableitung, Undo, Reprocessing und Sync-Konflikte pruefen | Duplicate-/Retry-/Correction-Fixtures | Vorschlag in Review, keine externe Aktion | `open` / domain-data-contract |
| BF-012 | Jeder Verarbeitungsstand darf einen spaeter verbesserten Titelvorschlag liefern, ohne bestaetigte Titel zu ueberschreiben | Proposal-Versionierung, Lokalisierung und Conflict Contract pruefen | Early-/Deep-Proposal-Fixture mit bestaetigtem Usertitel | stabiler generischer Titel bis Review | `open` / backend-intelligence-contract |
| BF-013 | Processing-Warteerfahrung kann reale Stufen anzeigen, ohne Fake-Fortschritt oder sensible Daten offenzulegen | welche Job-Stufen, Dauerbaender, Cancel-/Background-/Ready-Signale vertraglich stabil sind | Contract-Beispiel, Restart-/Offline-/Partial-Failure-Fixtures | neutraler `wird verarbeitet`-Status und spaetere Review Queue | `open` / backend-contract-frontend |
| BF-014 | Der aktuelle Zielrelease kann Capture-Subject vor Beginn oder durch sichtbaren geerbten Kontext effizient festlegen | Single-/Multi-Profile Defaults, Case-Vererbung, Batch-Wechsel und Korrektur pruefen | Usability- und Contract-Fixtures ohne Cross-Subject-Leak | sichtbarer aktueller Subject-Chip mit sofortiger Aenderung | `open` / product-backend-frontend |
| BF-015 | Technische Scanqualitaet kann ohne semantische Dokumentinterpretation frueh genug fuer einen optionalen Rescan-Hinweis bewertet werden | native Scanner-/CV-Signale sowie OCR/Layout-Qualitaetswerte fuer Unschaerfe, Zuschnitt, Orientierung, Aufloesung, Kontrast, Schatten/Reflexion evaluieren | synthetische gute/schlechte Scan-Fixtures, False-Positive-Rate, Offline-/Plattformmatrix und stets erlaubtes Fortfahren | kein Qualitaetsurteil; Capture bleibt moeglich und OCR darf generisch/leer enden | `spike-required` / platform-backend-intelligence |
| BF-016 | Eine spaetere unverbindliche Seiten-/Dokumentkohaerenzwarnung koennte grobe Seitenklassen und Strukturhinweise nutzen | nur fuer einen spaeter benannten Release mit realistischen synthetischen Compound-/Anlagen-Fixtures, False-Positive-Messung und nicht blockierendem UX-Contract pruefen | nachweislich nuetzlicher Hinweis bei Rechnung plus fremdem Bericht ohne Fehlwarnungsflut bei Anlagen | keine Warnung, keine Ablehnung, kein Split; User-/Dateigrenze bleibt autoritativ | `accepted-later` / product-backend-intelligence |
| BF-017 | Fuer jede unterstuetzte Dokumentgrundart/Variante koennen die wenigen produktseitig definierten Datums-/Zeitfelder mit einem semantischen Top-Kandidaten vorausgefuellt werden | hybride Docling/OCR-, deterministische Parser- und Small-/Medium-Model-Pipeline je Klasse/Locale pruefen; Candidate Recall und Top-Role-Accuracy getrennt messen; keine freie Feldgenerierung | synthetische Klassen-Fixtures mit mehreren Datumswerten, relativen/mehrdeutigen Angaben und schlechter OCR; Contract liefert Top-Kandidat, Alternativen, Fundstelle und Abstention | Feld leer oder nur Kandidatenliste; Auswahl bietet andere erkannte Werte, `Kein Datum` und manuelle Eingabe | `spike-required` / backend-intelligence-contract |

## Review-Ablauf

Jeder Eintrag wird so bearbeitet:

```text
fachliche Annahme und Fallback bestaetigen
  -> separates Backend-/API-/Data-Issue
  -> synthetische Fixture- und Benchmark-Matrix
  -> Feasibility-/Contract-Review
  -> Produktwirkung gemeinsam pruefen
  -> Status und betroffene Decisions aktualisieren
  -> erst danach Implementation Contract
```

Ein Backend-Ergebnis darf sein:

- Annahme im aktuellen Zielrelease belegt;
- nur spaeter wirtschaftlich oder technisch sinnvoll;
- nur fuer bestimmte Dokument-/Country-/Qualitaetsklassen belegt;
- nicht verlaesslich, daher generischer Fallback;
- alternative technische Loesung bei unveraenderter Produktsemantik;
- notwendige Produktrevision mit expliziter erneuter Freigabe.

## Stop Rules

Stop, wenn:

- ein `open`- oder `spike-required`-Punkt als bereits implementierbare
  Backend-Faehigkeit beschrieben wird;
- Frontend oder Product konkrete DTOs, Endpunkte, Persistenz oder
  Modellprovider festlegt;
- Backend ein Produktmodell, eine Taxonomie oder Nutzerautoritaet still
  veraendert;
- ein kleineres Modell durch ungemessene Person-, Kohaerenz-, Workflow-,
  Frist-, Kausalitaets- oder Beziehungsannahmen als intelligente
  Wahrheitsquelle behandelt wird;
- ein Spike echte private Dokumente oder unredigierte Telemetrie verwendet;
- ein Feasibility-Ergebnis ohne aktualisierte Decision, Fixtures und
  Traceability in den Release-Scope gelangt;
- dieses Register anstelle von GitHub Issues fuer umsetzbare Arbeit verwendet
  wird.
