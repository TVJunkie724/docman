---
title: "Decision - Intelligence Scope und Vertrauensmodell"
description: "Verbindliche Baseline fuer OCR, grobe Dokumentklassifikation, typabhaengige Metadatenvorschlaege, Nutzerreview und bewusst nicht autonom finalisierte fachliche Interpretation"
tags: [decision, intelligence, assist, ocr, llm, classification, trust, commercial-core]
lastUpdated: "2026-07-25"
status: "accepted-rebaseline"
owner: "product-concept/ai"
---

# Decision - Intelligence Scope und Vertrauensmodell

## Status

Am 25. Juli 2026 nach dem konservativen Rebaseline praezisiert. Kleine bis
mittlere General-Purpose-Modelle bleiben die realistische Zielklasse. Qwen
oder Gemma sind moegliche Beispiele, aber keine Produkt- oder
Providerentscheidung.

Core Assist bleibt Bestandteil des Commercial Core. Er wird jedoch nicht als
autonome fachliche Wahrheitsquelle geplant. Mappm erwartet trotzdem einen
produktiven Assistenzumfang: Dokumente grob unterscheiden, Text und
Wertkandidaten lesen, die fuer den erkannten beziehungsweise nutzergewaehlten
Dokumenttyp relevanten Felder semantisch vorausfuellen und das Ergebnis
kompakt zur Bestaetigung vorlegen. Dass Vorschlaege falsch oder unvollstaendig
sein koennen, ist normales Produktverhalten und kein Ausnahmezustand.

Diese Baseline gilt fuer jede kuenftige Produkt-, Case-, Document-, Country-
Pack-, UI-, Backend-, Roadmap- und Implementation-Planung. Eine staerkere
Modellfaehigkeit darf nie still vorausgesetzt werden. Sie wird erst nach einem
eigenen, dokumentierten Feasibility-Nachweis fuer eine eng benannte Klasse und
einen benannten Zielrelease aktiviert.

## Produktziel

Core Assist soll Arbeit reduzieren, ohne Verstaendnis vorzutäuschen:

- Original dauerhaft und sicher verarbeiten;
- OCR beziehungsweise Textextraktion bereitstellen;
- eine grobe Dokumentgrundart erkennen;
- einen groben Themen-/Nutzungsbereich vorschlagen;
- typabhaengig relevante Metadatenfelder mit dem jeweils besten Kandidaten
  vorausfuellen und erkannte Alternativen bereitstellen;
- einen konservativen editierbaren Titel vorschlagen;
- bestehende Cases/Records mit einfachen, erklaerbaren Signalen ranken;
- Suche und spaetere manuelle Korrektur unterstuetzen.

Beispiel fuer das geplante Niveau:

```text
Rechnung
  -> wahrscheinlich Gesundheit/Apotheke

Rechnung
  -> wahrscheinlich Kauf/Computer oder Elektronik
```

Mappm muss nicht allein aus einem Dokument erkennen, welcher Lebensvorgang,
welche Person, welche Beziehung, welcher Workflowzustand oder welche
rechtliche Folge gemeint ist.

## Vier Vertrauensstufen

| Stufe | Quelle | Bedeutung | Aktuelle Verwendung |
|---|---|---|---|
| T1 - Userkontext | ausdrueckliche Auswahl/Eingabe der Nutzerin | organisatorische Absicht und bestaetigte Aussage | massgeblich, bis die Nutzerin sie aendert |
| T2 - deterministisch | Datei-/Systemmetadaten, gepruefte Parser/Regeln, bestaetigte Referenz | technisch oder fachlich eng begrenzter Wert | direkt nutzbar innerhalb seiner belegten Bedeutung |
| T3 - Vorschlag | OCR, Klassifikator, LLM, Embedding oder Heuristik | moeglicher Text, Typ, Bereich, semantisch vorausgefuelltes Feld oder Kandidat | korrigierbarer Vorschlag; keine stille materielle Folge vor dem vorgesehenen Review |
| T4 - Kontextinterpretation | vermutete betroffene Person, Absicht, Kausalitaet, Beziehung, Workflow-/Rechtsbedeutung | ohne User- oder Regelbeleg nicht verlaesslich | im aktuellen Zielrelease nicht automatisch behaupten |

Ein hoher Modellscore macht T3 nicht zu T1 oder T2. Confidence steuert
Reihenfolge, Fallback und Abstention, nicht Wahrheit.

## Managed Context, Empfaenger und Parteien

Der beim Capture gewaehlte Kontext beschreibt, **wo und fuer wen die Nutzerin
das Dokument in Mappm verwalten will**. Er ist nicht zwingend identisch mit:

- dem gedruckten Empfaenger;
- der im Text genannten Person;
- der versicherten oder behandelten Person;
- dem Zahler;
- dem Account-Inhaber;
- dem fachlich oder rechtlich Betroffenen.

Ein Brief an den Ehepartner darf bewusst im eigenen oder gemeinsamen
Haushaltskontext abgelegt werden, wenn er dort fuer die Nutzerin relevant ist.
Das ist kein Fehler.

Core Assist:

- schlaegt keinen anderen Managed Subject allein aus Empfaenger- oder
  Namensdaten vor;
- erzeugt keinen Profilkonflikt und keine Wrong-Profile-Warnung;
- ordnet niemals automatisch zwischen Profilen um;
- darf Namen, Empfaenger oder andere Parteien als unbestaetigte Metadaten
  extrahieren, ohne daraus Ownership oder Routing abzuleiten;
- verwendet ausschliesslich den sichtbaren Userkontext fuer Berechtigungs- und
  Standardfilter.

Zusaetzliche Subject-/Party-Beziehungen koennen spaeter bewusst angegeben oder
in einem eigenen geprueften Review bestaetigt werden. Sie sind keine
Voraussetzung fuer Capture, Suche oder Case-Zuordnung.

## Zeit, Betraege und andere Facts

OCR kann einen String erkennen, ohne seine fachliche Rolle zu verstehen.
Beispiele:

- `24.07.2026` kann Ausstellungs-, Leistungs-, Termin-, Faelligkeits- oder
  Fliesstextdatum sein;
- `180,00 EUR` kann Gesamtbetrag, Teilbetrag, Rabatt, offener Betrag oder
  Erstattung sein;
- `bezahlt` kann Status, Stempel, Zahlungsaufforderung oder zitierter Text
  sein.

Fuer den aktuellen Zielrelease gilt:

- erkannte Werte bleiben T3-Kandidaten;
- Assist darf aus Dokumenttyp, Feldlabel, Text- und Layoutkontext eine
  wahrscheinliche semantische Rolle vorschlagen;
- der Top-Kandidat darf im passenden Feld vorausgefuellt sein, bleibt aber bis
  zur kompakten Nutzerbestaetigung ein Vorschlag;
- ein unbestaetigter Datumswert erzeugt weder Termin, aktive Frist, Aufgabe
  noch Reminder;
- ein Betrag erzeugt weder Verpflichtung, Zahlung noch Erstattung;
- ein Rechnungstyp beweist keinen Zahlstatus;
- ein Modell leitet keine gesetzliche oder vertragliche Frist ab;
- eine bestaetigte Regel darf erst aus einem bestaetigten Ankerdatum eine
  Fristinstanz erzeugen.

### Interne Kandidaten und zweckgebundene Darstellung

Wenn mehrere Werte erkannt werden, darf das Backend intern eine
Kandidatenmenge mit Fundstellen bilden, normalisieren und ranken. Welche
Kandidaten sichtbar werden, richtet sich nach dem Produktzweck und nicht nach
der Rohmenge des Modells.

Fuer eine Haushaltsrechnung ist das ausschliesslich der wahrscheinliche
**Gesamtbetrag**:

```text
Rechnungsbetrag: 180,00 EUR
```

Netto, USt, Rabatte und Einzelpositionen werden weder als sichtbare
Alternativen noch als eigene Finanzwerte modelliert. Die Nutzerin bestaetigt
oder korrigiert den vorgeschlagenen Gesamtbetrag. Kann kein Gesamtbetrag
ausreichend plausibel vorgeschlagen werden, bleibt das Feld leer und kann
manuell erfasst werden.

Datumswerte bilden eine bewusste Ausnahme von der Ein-Vorschlag-Regel.
OCR/Parser duerfen alle erkannten Datumsstrings mit Fundstelle als
Kandidatenmenge bereitstellen. Assist soll fuer die beim Dokumenttyp
relevanten Felder je einen semantischen Top-Kandidaten vorschlagen, zum
Beispiel `Rechnungsdatum`, `Faellig am` oder `Leistungszeitraum`.
`Alle erkannten` ist dabei keine Zusicherung, dass jedes im Quelldokument
enthaltene Datum gefunden wurde: Scanqualitaet, Handschrift, relative Angaben,
Layout und OCR-Fehler koennen Kandidaten fehlen oder mehrdeutig werden lassen.

Die kompakte Standardoberflaeche zeigt nur diese relevanten vorausgefuellten
Felder. Das Feld selbst bietet in einer kleinen Auswahl die anderen erkannten
Datumswerte, `Kein Datum` und `Manuell eingeben` an. Weitere nicht verwendete
Zeitkandidaten bleiben unter einer optionalen Detailaktion erreichbar. Die
Nutzerin kann den Vorschlag uebernehmen, ersetzen, entfernen oder manuell
ergaenzen. Die sichtbare Gesamtbestaetigung bestaetigt die dargestellte
Feldbedeutung; eine daraus deterministisch entstehende harmlose, interne und
reversible Aufgabe oder Erinnerung benoetigt keine zweite Bestaetigung.

Das technische Erfassungsdatum bleibt ein separates Systemdatum und wird nicht
als fachliches Eingangsdatum ausgegeben. Ein nicht verwendeter oder nicht
bestaetigter Datumsstring bleibt folgenlos. Referenznummern und andere
mehrdeutige Metadaten werden nur gezeigt, wenn ein konkreter Produktzweck sie
benoetigt. Das exakte Contract-/Datenschema entscheidet das
Backend-/Data-Team.

## Grobe Dokumentklassifikation

Die erste belastbare Produktbaseline ist absichtlich grob:

- allgemeines Dokument/Brief;
- Rechnung oder Belastung;
- Zahlungsnachweis;
- Vertrag oder Polizze;
- Finanzuebersicht, darunter Gehaltsabrechnung oder Kontoauszug als
  produktwertgepruefte Kandidaten;
- Befund/Bericht;
- Ueberweisung;
- Nachweis/Zertifikat;
- Identitaetsnachweis beziehungsweise Record-Version;
- Arbeitsunfaehigkeitsbescheinigung als produktwertgepruefter Kandidat;
- Bild-/Medienevidenz;
- unbekannt/generisch.

Produktrelevante Varianten wie `medical_invoice` bleiben erlaubt, wenn
Backend-Evidence zeigt, dass sie auf dem Zielmodellniveau ausreichend robust
erkennbar sind und ein anderes Produktverhalten ausloesen. Anbieter, Land,
Jahr, Empfaenger, Status und Workflowrolle bleiben getrennte Achsen.

Eine grobe Domain-Klassifikation wie Gesundheit/Apotheke,
Kauf/Elektronik, Vertrag/Telekommunikation oder Behoerde darf als T3-Vorschlag
dienen. Sie ist kein vollstaendiger Case-Typ und keine rechtliche
Klassifikation.

## Case-/Record-Matching

Matching bleibt ein Best-Effort-Ranking, kein Verstaendnisversprechen. Der
aktuelle Zielrelease priorisiert:

1. ausdruecklich gewaehlten Case/Record oder neue-Case-Absicht;
2. den sichtbaren Capture-/Haushalts-/Managed-Subject-Kontext;
3. bestaetigte stabile Referenzen und bereits verknuepfte Records;
4. grobe Dokumentart und groben Themenbereich;
5. einfach erkannte Aussteller, Betraege und Zeitkandidaten;
6. Volltext-/semantische Aehnlichkeit als schwaches Ranking-Signal;
7. manuelle Suche und neuen leichten Custom Case als gleichwertige Fallbacks.

Nicht Teil der aktuellen Baseline sind:

- semantische Wrong-Case-, Wrong-Profile- oder Wrong-Document-Erkennung;
- automatische Outlier-Erkennung aufgrund vermuteter Lebensbedeutung;
- automatisches Erkennen desselben medizinischen Verlaufs;
- automatisches Erkennen eines erwarteten Antwortdokuments;
- automatische Workflow-Slots, Lifecycle-Wechsel oder Case-Abschluesse;
- automatische Aufteilung eines Misch-PDF nach Inhalt.

Die App zeigt stets einige grobe Kandidaten, `Neuen Vorgang anlegen` und eine
Suche nach bestehenden Cases. Die Nutzerin bestaetigt das Routing. Ein
bewusst gewaehlter Case wird nicht nachtraeglich als semantischer Fehler
markiert.

Case-Beziehungen duerfen als best-effort Ranking-Vorschlaege erscheinen, wenn
ein Backend-Spike fuer den konkreten Kontext ausreichende Signale belegt. Sie
sind keine garantierte Core-Ausgabe und werden niemals automatisch gesetzt.
Jede vorgeschlagene `part_of`, `caused_by`, `follow_up_to`- oder `related_to`-
Beziehung benoetigt eine bewusste Nutzerbestaetigung; Suche und manuelle
Verknuepfung bleiben der vollwertige Fallback.

## Aufgaben, Workflows und Fristen

Tasks oder Workflowfortschritt entstehen aus:

- ausdruecklicher Useraktion;
- bestaetigtem einfachen Fact;
- deterministischer, versionierter Produktregel;
- bestaetigtem Workflowereignis.

Beispiel:

```text
User bestaetigt: Rechnung ist offen
  -> reversible Aufgabe "Rechnung bezahlen"
```

Eine kontextuelle Aktion ist bereits eine solche Bestaetigung. Laedt die
Nutzerin beispielsweise ueber `SV-Einreichung dokumentieren` ein Dokument
hoch oder setzt den entsprechenden Zustand im Case, darf der bestaetigte
Workflow-Schritt ohne zweite Reviewfrage gespeichert werden. Ein globaler
Upload darf denselben Schritt nur vorschlagen; erst die Nutzerbestaetigung
macht ihn wirksam.

Nicht ausreichend ist:

```text
LLM vermutet: wahrscheinlich offen
  -> keine automatische Aufgabe
```

Externe Einreichung, Zahlung, Sharing, laute Notification, rechtliche Frist
und Case-Abschluss bleiben ausdrueckliche beziehungsweise regel- und
bestaetigungsgebundene Aktionen.

## Dokumentgrenzen und technische Fehler

Die Entfernung semantischer Fehlererkennung entfernt nicht technische
Sicherheit:

- Dateiformat, Groesse, Checksum und Lesbarkeit duerfen validiert werden;
- Scanner darf Unschaerfe, abgeschnittene Kanten oder fehlgeschlagenen Import
  melden;
- explizite Mobile-Seiten- und Dokumentgrenzen bleiben Userautoritaet;
- Duplikate duerfen ueber Byte-/Hash-/stabile Referenzsignale erkannt werden;
- Upload-, Speicher-, Netzwerk-, Quota- und Providerfehler bleiben normale
  Fehlerzustaende.

Mappm verspricht im aktuellen Zielrelease nicht, eine fachlich falsche Seite,
ein unabhaengiges Schreiben in einem PDF oder eine unpassende Case-Zuordnung
semantisch zu erkennen. Der User schliesst beim Scan ein Dokument bewusst ab;
Desktop-Dateien werden als je ein logisches Dokument angenommen. Gemischter
oder fachlich inkohaerenter Inhalt macht dieses Dokument nicht `invalid` und
fuehrt in M1 weder zu Ablehnung noch zu einem erzwungenen getrennten Upload.
Eine spaetere unverbindliche Kohaerenzwarnung oder Segmentierung braucht einen
eigenen belegten Contract, realistische Fixtures und einen klaren
False-Positive-Fallback.

## Verarbeitung

```text
Original dauerhaft sichern
  -> technische Datei-/Scanpruefung
  -> OCR/Text erzeugen
  -> grobe Dokumentart und Domain vorschlagen
  -> typrelevante Felder mit Top-Kandidaten vorausfuellen
  -> konservativen Titel vorschlagen
  -> grobe Case-/Record-Kandidaten ranken
  -> User prueft und bestaetigt
  -> bestaetigte Facts/Regeln duerfen reversible Folgen ableiten
```

Die Verarbeitung ist asynchron. Fruehe OCR-/Klassifikationswerte und spaetere
Matching-Kandidaten duerfen getrennte Proposal-Versionen sein. Die UI zeigt
nur reale Backend-Stufen und blockiert Capture nicht.

## Core und Advanced Assist

### Commercial Core

- OCR/Text;
- grobe Dokumentgrundart und Domain;
- konservativer Titel;
- typabhaengig relevante vorausgefuellte T3-Metadatenfelder mit
  Kandidatenalternativen und manuellem Fallback;
- grobes Case-/Record-Ranking;
- Volltext-/semantische Suche;
- Review, Korrektur, generischer Fallback und manuelle Suche;
- technische Fehlerbehandlung.

### Spaeter, nur nach eigener Evidenz

- feinere oder rechtlich/vertraglich anspruchsvolle Parser fuer konkrete
  Datums-/Betragsrollen;
- spezialisierte Dokumentvarianten;
- bessere Party-/Referenzerkennung;
- fachlich eng begrenzte Workflowvorschlaege;
- Relationserkennung;
- selektive reversible Auto-Zuordnung;
- unverbindliche semantische Dokumentkohaerenz-Hinweise;
- reversible semantische Dokumentsegmentierung;
- freiwillige Analyseverbesserung aus Produktivkorrekturen oder freigegebenen
  Dokumenten.

Keine dieser Erweiterungen wird durch das Wort `Advanced` automatisch
freigegeben. Jede Klasse braucht eigene Fixtures, Messwerte, Fallback,
Privacy-/Security-Pruefung und Product-/Domain-Freigabe.

## Provider- und Trust-Grenzen

- Eine Parsing-Schicht darf beispielsweise Docling fuer Formatkonvertierung,
  OCR-Anbindung, Layout, Lesereihenfolge, Tabellen und
  Seiten-/Bounding-Box-Provenienz einsetzen. Diese technische Struktur
  verbessert Kandidatenfindung und Nachvollziehbarkeit, ist aber keine
  fachliche Wahrheitsquelle.
- Docling, OCR-Engine, VLM und LLM bleiben austauschbare Backend-Komponenten;
  ihre konkrete Auswahl, Konfiguration und Betriebsform gehoert nicht in den
  Frontend-/Produktvertrag.
- On-device oder Managed Assist duerfen verwendet werden, wenn ihr konkreter
  Scope belegt ist.
- Reale Dokumente werden erst nach Security-, Privacy-, Provider-, Retention-,
  Training-, Loesch- und AI-Regulatory-Gates verarbeitet.
- Assist-Artefakte sind sensible Nutzdaten, zweckgebunden, minimiert und
  loeschbar.
- Local- und Cloud-Vault-Authority bleiben unveraendert.
- Modellwechsel und Modellupdates duerfen keine stillen Capability-
  Erweiterungen aktivieren.

## Korrekturen und Analyseverbesserung

Korrekturen sind im Commercial Core normales Produktverhalten. Sie aendern
das konkrete Dokument, den bestaetigten Fact oder die Zuordnung und behalten
ihre Provenienz. Sie sind in M1 ausdruecklich:

- keine Trainingsfreigabe;
- keine Dokumentspende;
- kein Online-Lernen;
- kein Fine-Tuning aus Produktivdaten;
- kein Auftrag fuer menschliche Inhaltspruefung.

Eine spaetere freiwillige Analyseverbesserung ist ein eigenstaendiges
Produkt-, Security-, Privacy-, Legal-, Operations- und AI-Governance-Thema.
Sie benoetigt eine ausdrueckliche, zweckgebundene Einwilligung, klaren
Datenscope, Retention/Loeschung, streng kontrollierten Zugriff, versionierte
Evaluations- und Modellupdates sowie Rollback. Sie darf niemals aus der
normalen Korrekturhandlung abgeleitet werden.

## Verifikation

Der Zielrelease prueft mindestens:

- Apothekenrechnung versus Computer-/Elektronikrechnung;
- breite Rechnung versus allgemeiner Brief;
- unbekanntes Dokument mit generischem Titel;
- mehrere Datumsstrings mit typabhaengigem Top-Vorschlag, alternativen
  Kandidaten, `Kein Datum`, manueller Eingabe und folgenlosen unbestaetigten
  Werten;
- mehrere Betraege ohne automatische Zahlungsbehauptung;
- Brief an Person A im bewusst gewaehlten Kontext von Person B;
- gemeinsamer Haushaltskontext mit abweichendem Empfaenger;
- manuell gewaehlter Case ohne semantische Wrong-Case-Warnung;
- grobe Kandidaten plus Suche und neuer Custom Case;
- technischer Datei-/Scanfehler getrennt von semantischer Unsicherheit;
- mobile nutzerdefinierte und Desktop-dateibasierte Dokumentgrenzen ohne
  semantische Invalidierung oder Ablehnung;
- gemischtes PDF als ein generisches logisches Dokument ohne Auto-Split;
- Modellwechsel ohne stillen neuen Produktscope.

Fixtures sind synthetisch und enthalten keine echten privaten Dokumente.

## Stop Rules

Stop, wenn:

- Empfaenger oder erkannter Name den Userkontext ueberschreibt;
- Assist eine Wrong-Profile-, Wrong-Case- oder semantische
  Wrong-Document-Warnung verspricht;
- ein OCR-Wert ohne bestaetigte Bedeutung einen Status, Task, Termin, eine
  Frist oder finanzielle Buchung erzeugt;
- eine grobe Domain als feiner Case-/Dokumenttyp ausgegeben wird;
- Relation, Kausalitaet, Workflowzustand oder Abschluss aus allgemeinem
  Modelltext finalisiert wird;
- semantische PDF-/Seitensegmentierung als Commercial-Core-Faehigkeit gilt;
- gemischter oder inkohaerenter Inhalt einen `invalid`-Status,
  `separate_documents_required` oder eine M1-Ablehnung erzeugt;
- ein konkretes Modell oder dessen Score als Wahrheitsquelle behandelt wird;
- eine normale Korrektur in M1 als Trainings-, Analyseverbesserungs- oder
  Human-Review-Einwilligung gilt;
- generischer Fallback, Suche oder manuelle Korrektur fehlen.

## Konsequenzen

- `DECISION_CAPTURE_FIRST_ASSISTED_ROUTING.md` besitzt den Capture- und
  Rankingvertrag, darf aber keine staerkere Intelligence-Baseline versprechen.
- `DECISION_TEMPORAL_FACT_EVENT_AGENDA_MODEL.md` behandelt erkannte Zeitwerte
  als typabhaengig semantisch vorausfuellbare Kandidaten, bis ihre Bedeutung
  sichtbar bestaetigt oder eng regelbelegt ist.
- `DECISION_DOCUMENT_TYPE_CATALOG.md` bindet jede Typ-/Variantenpromotion an
  diese realistische Modellbaseline.
- Fachliche Case-Family-Decisions definieren moegliche Signale und
  Nutzerregeln, nicht automatisch erkennbare Modellfaehigkeiten.
- Backend/Data/Intelligence validieren spaetere Erweiterungen im zentralen
  Feasibility-Register und in getrennten Implementation-Issues.
