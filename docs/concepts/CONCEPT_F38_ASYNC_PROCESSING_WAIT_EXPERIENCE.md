---
title: "Konzept F38 - Asynchrone Verarbeitung und Warteerfahrung"
description: "Produkt- und UX-Vertrag fuer progressive Dokumentanalyse, reale Processing-Zustaende, dezente Animation, Hintergrundfortsetzung und spaetere Review-Bereitschaft"
tags: [concept, frontend, capture, processing, animation, background, intelligence, accessibility, privacy]
lastUpdated: "2026-07-24"
version: "1.0"
status: "accepted-direction"
owner: "ui-concept/product-concept"
---

# Konzept F38 - Asynchrone Verarbeitung und Warteerfahrung

## Status und Quellen

Akzeptierte Produktrichtung. F38 besitzt die sichtbare Erfahrung nach
dauerhafter Annahme eines Dokuments, waehrend fruehe Extraktion und vertieftes
Matching Sekunden oder Minuten dauern.

Normative Quellen:

- `docs/technical/DECISION_CAPTURE_FIRST_ASSISTED_ROUTING.md`;
- `docs/technical/DECISION_CASE_FAMILY_DEFINITION_CONTRACT.md`;
- `docs/concepts/CONCEPT_F17_MOBILE_CAPTURE_PLAN.md`;
- `docs/concepts/CONCEPT_F18_NOTIFICATIONS_FAILURES_OBSERVABILITY.md`;
- F25/F35 fuer Accessibility, Reduced Motion und visuelle Qualitaet;
- `docs/execution/handoffs/DOMAIN_BACKEND_FEASIBILITY_REGISTER.md` fuer offene
  Stage-/Latency-/Contract-Pruefungen.

F38 legt keine Widgets, Animationstechnik, Provider oder Backend-Jobstruktur
fest. Die konkrete Komposition benoetigt einen UI-Implementation-Contract nach
Backend-Feasibility BF-001/BF-013.

## Produktziel

Nach einem Scan oder Import darf die Nutzerin:

- erste verwertbare Vorschlaege sehen, sobald sie belastbar vorliegen;
- weiterarbeiten, ein weiteres Dokument erfassen oder die App verlassen;
- die Analyse bewusst im Hintergrund fortsetzen;
- spaeter in eine haltbare Review Queue zurueckkehren;
- jederzeit verstehen, ob das Original gesichert, Verarbeitung aktiv,
  Review bereit oder eine Korrektur notwendig ist.

Die Warteerfahrung soll ruhig, hochwertig und lebendig wirken, ohne
Fortschritt, Dauer oder AI-Sicherheit vorzutäuschen.

## Progressive sichtbare Stufen

F38 unterscheidet mindestens:

```text
Original wird gesichert
  -> dauerhaft angenommen
  -> erste Angaben werden vorbereitet
  -> vertiefte Analyse und Matching
  -> Ergebnis bereit
  -> Review oder Konflikt
```

Die UI darf nur Stufen benennen, die der freigegebene Contract verlaesslich
liefert. Gibt es keinen belastbaren Prozentwert, verwendet sie keinen
Prozentbalken. Eine indeterminierte Animation darf Aktivitaet zeigen, aber
keine falsche Restzeit vermitteln.

Fruehe Ergebnisse koennen fuer geeignete Dokumentklassen beispielsweise
breite Dokumentart, Aussteller, Betrag, Waehrung, zentrale Zeitwerte,
Zahlstatus und einen ersten Titel enthalten. Ob und in welcher Latenz diese
Stufe im aktuellen Zielrelease moeglich ist, entscheiden BF-001/BF-002.

Vertiefte Ergebnisse koennen primaere/zusaetzliche Case-/Record-Kandidaten,
Relationen, Workflow, Tasks, erwartete Antworten, Country-/Provider-Regeln und
einen verbesserten Titel enthalten.

Spaetere Proposal-Versionen ueberschreiben keine bestaetigten Userwerte.

## Nicht blockierender Ablauf

Nach dauerhafter Annahme stehen mindestens direkte Aktionen bereit:

- `Weiteres Dokument erfassen`;
- `Im Hintergrund fortsetzen`;
- `Spaeter pruefen`;
- bei Bedarf `Abbrechen` oder `Entfernen` gemaess Lifecycle-Policy.

Die genaue Aktionenauswahl haengt vom Zustand ab. Der Nutzer muss keinen
Fullscreen-Spinner beobachten. Navigation, App-Schliessen, Offline-/Online-
Wechsel und Neustart verlieren weder Original, Capture-Subject, Case-Intent,
Processing-Stand noch bestaetigte fruehe Werte.

Wenn die Nutzerin im Wartezustand bleibt, aktualisiert sich die Darstellung
stabil und ohne Layoutspruenge. Ein schnelles Ergebnis ueberspringt
unnoetige Zwischenstufen.

## Animation und ruhige Aktivitaet

Animation darf:

- reale Aktivitaet und Stufenwechsel ruhig visualisieren;
- den Blick auf die naechste direkte Aktion lenken;
- bei laengerer Dauer eine wiederholbare, nicht hektische Bewegung zeigen;
- bei Abschluss eindeutig, kurz und nicht triumphal in den Review-Zustand
  uebergehen.

Animation darf nicht:

- einen erfundenen Prozentwert, Countdown oder Fortschritt darstellen;
- sensible Dokumentvorschauen, Titel, Namen, Betraege oder Diagnosen
  dekorativ bewegen;
- die einzige Statusinformation sein;
- Controls verschieben oder den Nutzer am Verlassen hindern;
- eine Verarbeitung als erfolgreich darstellen, bevor ein belastbarer
  Ergebniszustand vorliegt;
- durch endlose schnelle Bewegung, Flackern oder unruhige Skeletons belasten.

Reduced Motion ersetzt Bewegung durch eine statische Statusillustration,
textlichen Stufenstatus und dieselben Aktionen. Screenreader erhalten
Statusaenderungen semantisch und nicht bei jedem Animationsframe.

## Kontextuelle Hinweise statt Feature-Werbung

Der Wunsch nach kurzen `Wusstest du schon`-Hinweisen wird als
Nutzungshypothese festgehalten. Die Standardoberflaeche zeigt jedoch keine
rotierende Feature-Werbung oder allgemeine Bedienungsanleitung. Sie bietet
stattdessen direkte, im aktuellen Zustand relevante Aktionen und knappe
kontextuelle Hinweise, beispielsweise:

```text
Analyse laeuft im Hintergrund.

[Weiteres Dokument erfassen] [Spaeter pruefen]
```

Ein spaeterer Usability-Test darf kurze kontextuelle Hilfen pruefen, wenn sie:

- eine unmittelbar verfuegbare Aktion erklaeren;
- nicht wiederholt oder marketingartig wirken;
- deaktivierbar beziehungsweise nach Kenntnisnahme nicht erneut stoeren;
- keine sensiblen Daten oder unbestaetigten Ergebnisse verwenden;
- keine eigene Tour, Card-Karussell- oder Pflicht-Onboarding-Flaeche erzeugen.

Die App erklaert Nutzung bevorzugt durch klare Controls, Status und
progressive Offenlegung, nicht durch Featuretexte.

## Review-Bereitschaft

Nach Abschluss der vertieften Verarbeitung:

- erscheint das Dokument in der Review Queue;
- kehrt eine noch geoeffnete Warteflaeche ohne Sprung in den stabilen
  Ergebniszustand;
- darf eine privacy-sichere In-App- oder freigegebene Systembenachrichtigung
  auf Review-Bereitschaft hinweisen;
- werden Teilfehler, starke Widersprueche oder separate-Dokumente-required
  gezielt statt als generischer AI-Fehler dargestellt;
- bleiben fruehe bestaetigte Angaben und Nutzerzuordnungen erhalten.

Eine Notification zeigt standardmaessig weder Dokumenttitel, Person, Betrag,
Absender noch Case-Namen.

## Fehler und Unterbrechungen

F38 deckt mindestens ab:

| Zustand | Sichtbares Verhalten |
|---|---|
| Offline/Pending | Original ist gesichert; Verarbeitung wird spaeter fortgesetzt |
| langsame Verarbeitung | neutrale reale Stufe, Background-Aktion und kein Fake-Countdown |
| Teilresultat | bestaetigbare fruehe grobe Werte bleiben, Case-/Record-Ranking laeuft weiter |
| Retryable Failure | letzte vertrauenswuerdige Stufe, Retry und spaetere Pruefung |
| abweichender Empfaenger/Name | kein Profilkonflikt; sichtbarer Userkontext bleibt massgeblich |
| semantisch gemischter Inhalt in einer Datei | bleibt ein generisches logisches Dokument; keine M1-Ablehnung, Invalidierung oder Aufspaltung |
| Quota/Entitlement | Original erhalten; erlaubter manueller/Retry-/Upgrade-Pfad |
| stale Proposal | neue Proposal-Version wird geladen, bestaetigte Werte bleiben |

## Privacy, Accessibility und Localization

- Keine sensiblen Inhalte in Animation, Telemetrie, Notifications oder
  generischen Statusmeldungen.
- Status ist textlich und semantisch, nicht nur ueber Farbe oder Bewegung
  erkennbar.
- Fokus bleibt stabil; Abschluss oder Fehler entreisst der Nutzerin nicht die
  aktuelle Arbeit.
- Textscale, lange deutsche/andere Lokalisierungen und kleine Mobile-
  Viewports duerfen Aktionen nicht verdecken.
- Jede Animation ist pausierbar beziehungsweise durch Reduced Motion
  ersetzbar.
- `Im Hintergrund fortsetzen` und spaetere Review funktionieren mit Tastatur,
  Screenreader und sichtbarer Aktion.

## Beobachtbarkeit

Datensparsame Qualitaetsmetriken duerfen erfassen:

- grobe Dauer je freigegebener Processing-Stufe;
- Anteil Background-Fortsetzung, spaeterer Review und Retry;
- Abbruch nach dauerhafter Sicherung;
- Teilfehler- und stale-Proposal-Rate;
- Nutzung von Reduced Motion;
- Korrektur-/Abstention-Klassen ohne Dokumentinhalt.

Sie duerfen keine Titel, Namen, Betraege, OCR-Texte, Case-Kandidaten oder
Dokumentinhalte enthalten.

## Verifikation

Eine spaetere Phase deckt mindestens ab:

- Ergebnis in unter einer Sekunde ohne unnötigen Wartezustand;
- fruehes Teilresultat, danach Deep-Matching-Ergebnis;
- ein bis zwei Minuten Verarbeitung mit Navigation und App-Neustart;
- weiteres Dokument waehrend laufender Analyse;
- Background-Fortsetzung und spaetere Review Queue;
- Offline/Pending, Retry, Teilfehler und stale Proposal;
- bestaetigter Usertitel/-Fact wird von spaeterer Stufe nicht ueberschrieben;
- privacy-sichere Notification;
- Reduced Motion, Screenreader, Fokus, Textscale und kleine Viewports;
- keine Fake-Prozentwerte und keine sensible Telemetrie.

## Stop Rules

Stop, wenn:

- eine Animation technische Progress-Signale erfindet;
- die Nutzerin auf abgeschlossenes Case-/Record-Ranking warten muss;
- Background/Restart bestaetigte Werte oder Kontext verliert;
- fruehe und vertiefte Vorschlaege ohne Version/Provenienz ueberschreiben;
- generische Feature-Werbung die Warteflaeche fuellt;
- Bewegung die einzige Statusinformation ist oder Reduced Motion fehlt;
- ein Ergebnis als bestaetigt erscheint, bevor der erforderliche Review
  erfolgt ist;
- sensible Dokument-, Personen-, Finanz- oder Case-Daten in Animation,
  Notification oder Telemetrie erscheinen;
- semantisch gemischte Inhalte fuer den aktuellen Zielrelease abgelehnt,
  invalidiert oder automatisch ueber Dokumente/Cases aufgespalten werden;
- F38 ohne BF-001/BF-013 und Phase-as-Implementation-Contract an
  `ui-architect` oder `ui-builder` uebergeben wird.

## Handoff

UI-Phase und Motion-/State-Plan gehen an `ui-architect`; Processing-/Proposal-
Contract an `contract-api`; Queue/Persistenz an `data-architect`; Failure-/
Notification-Verhalten an `frontend-error-handling`; Evidence an
`quality-readiness`.

## Enterprise Quality Contract

Dieses Konzept uebernimmt
`docs/execution/CONCEPT_ENTERPRISE_QUALITY_CONTRACT.md`. Bei Widerspruechen
gilt die strengere Regel und die betroffene Phase stoppt.
