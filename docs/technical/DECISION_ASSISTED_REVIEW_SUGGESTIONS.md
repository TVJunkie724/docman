---
title: "Decision - Assisted Review Suggestions"
description: "Entscheidung zu ersten OCR-/AI-/Regelvorschlaegen im Draft Review und Human-in-the-loop-Regeln"
tags: [decision, assisted-review, ocr, ai, suggestions, draft-inbox, privacy]
lastUpdated: "2026-07-14"
status: "accepted-rebaseline"
---

# Decision - Assisted Review Suggestions

## Status

Accepted.

The former R5-only timing is superseded: this suggestion contract is part of
C2/C3 Core Assist. Assisted Review darf Arbeit reduzieren, aber keine
fachlich oder datenschutzrelevanten Entscheidungen still finalisieren.

## Entscheidung

Assisted Review arbeitet nach Human-in-the-loop-Regeln:

- Vorschlaege sind sichtbar, pruefbar und korrigierbar.
- Vorschlaege werden nicht still als finale Wahrheit uebernommen.
- Fachlich relevante Vorschlaege brauchen Annahme, Ablehnung oder Korrektur.
- Hochsensible Vorschlaege brauchen besonders klare Quelle und bewusste
  Bestaetigung.
- Die betroffene Person / das Haushaltsprofil darf vorgeschlagen, aber nicht
  still gesetzt werden.

Das Ziel ist nicht Automatisierung um jeden Preis, sondern schnellerer Review
ohne falsche Ablage sensibler Dokumente.

## Erste Ziel-Felder

Assisted Review darf zuerst diese Felder vorschlagen:

| Feld | Regel |
|---|---|
| Titel | darf vorgeschlagen und einfach uebernommen/korrigiert werden |
| Dokumenttyp | darf vorgeschlagen werden, nie hart erzwingen |
| Absender/Aussteller | darf vorgeschlagen werden |
| Dokumentdatum | darf vorgeschlagen werden |
| Betrag | darf vorgeschlagen werden, braucht Review |
| Fälligkeit | darf vorgeschlagen werden, braucht Review |
| Tags | darf vorgeschlagen werden, leicht verwerfbar |
| Vorgang/Case-Beziehung/Workflow-Zweig | nur als Hinweis/Vorschlag, keine stille Ablage |
| Versicherung/Polizze | nur als Hinweis/Vorschlag, keine stille Claim-Aktion |
| Claim-/Erstattungs-Kontext | nur als Hinweis/Vorschlag |
| Profil-Fakten | als Vorschlag mit Quelle, bewusst bestaetigen |
| betroffene Person | nur vorschlagen, nie still setzen |

## Schutzklassen fuer Vorschlaege

### Unkritische Vorschlaege

Beispiele:

- Titel.
- Dokumenttyp.
- Datum.
- Absender/Aussteller.
- Tags.

Diese Vorschlaege duerfen prominent angezeigt werden und schnell uebernehmbar
sein. Trotzdem bleibt Korrektur jederzeit moeglich.

### Fachlich wichtige Vorschlaege

Beispiele:

- Betrag.
- Fälligkeit.
- Versicherung.
- Vorgang, Case-Beziehung oder Workflow-Zweig.
- Claim-/Erstattungs-Kontext.

Diese Vorschlaege brauchen klare Review-Bestaetigung, weil sie Aufgaben,
Workflows, Fristen, Suche oder Auswertungen beeinflussen.

### Hochsensible Vorschlaege

Beispiele:

- betroffene Person / Haushaltsprofil.
- Passnummer.
- SV-Nummer.
- Versicherungsnummer.
- medizinische Details.
- sonstige hochsensible Profil-Fakten.

Diese Vorschlaege duerfen nur mit Quelle/Evidenz angezeigt werden und brauchen
bewusste Bestaetigung. Sie werden nicht in normalen Listen, Logs, Telemetry oder
Benachrichtigungstexten ausgegeben.

## Suggestion Model

```text
ReviewSuggestion
  draftId
  fieldKey
  proposedValue
  confidence optional
  source: ocr | rule | model | userPattern | linkedRecord
  sourceDocumentId optional
  sourceRecordId optional
  evidenceTextRange optional
  sensitivity: normal | sensitive | highlySensitive
  status: suggested | accepted | rejected | edited
  createdAt
  reviewedAt optional
```

Wichtig:

- `status=suggested` bedeutet noch keine finale Uebernahme.
- `accepted` bedeutet bewusst bestaetigt.
- `edited` bedeutet Nutzerin hat den Vorschlag korrigiert und uebernommen.
- `rejected` bedeutet bewusst verworfen.

## Betroffene Person

Die betroffene Person ist besonders kritisch.

Assisted Review darf sagen:

```text
Dieses Dokument betrifft vermutlich Kind A.
```

Assisted Review darf nicht still tun:

```text
Dokument automatisch Kind A zuordnen und Review abschliessen.
```

Grund:

- falsche Profilzuordnung kann sensible Dokumente falsch sichtbar machen.
- Haushaltsdokumente koennen mehrere Personen betreffen.
- aehnliche Namen, Versicherungsdaten oder Arztkontexte koennen irrefuehrend
  sein.
- die betroffene Person ist fuer Review Completion ein Pflichtfeld und muss
  bewusst bestaetigt werden.

## Nicht Erlaubt

Assisted Review darf frueh nicht:

- Draft Review still abschliessen.
- Dokumente still einem Profil, Vorgang oder Claim zuordnen.
- Aufgaben still als verbindlich erzeugen.
- Einreichungen oder externe Portalaktionen starten.
- Claims als abgeschlossen markieren.
- hochsensible Fakten ohne Review speichern.
- private Inhalte in Logs, Telemetry oder Benachrichtigungen ausgeben.

Kontextabhängig darf Review außerdem zwei oder drei relevante Aktionen aus
`DECISION_CONTEXTUAL_REVIEW_ACTIONS_FINANCIAL_ROLLUPS.md` vorschlagen, etwa
Vertrag/Abo, Claim, Zahlung, Steuerprüfung, Business-Kontext, Aufgabe oder
Quick Access. Eine universelle Checkbox-Wand ist kein Ziel.

## Milestone-Einordnung

- M2 bereitet Review-Zustaende und Pflichtfelder vor, aber ohne OCR/AI.
- M3/R5 fuehrt erste Assisted-Review-Vorschlaege im Draft Review ein.
- M5 kann Claims/Facts/Insights auf bestaetigten Vorschlaegen aufbauen.
- Ein später aktivierter Intelligence-Slice kann robuste on-device oder
  Managed-Cloud-OCR-/AI-Pipelines und Reprocessing ausbauen, nachdem VC-02 und
  die AI-/REG-Gates akzeptiert sind.

## Konsequenzen

- R5-D5 ist entschieden: Assisted Review macht Vorschlaege, keine stillen
  finalen Entscheidungen.
- Betroffene Person wird nur vorgeschlagen, nie still gesetzt.
- Vorschlaege brauchen Status, Quelle, Sensitivitaet und Review-Zustand.
- Hochsensible Vorschlaege brauchen explizite Bestaetigung.
- Workflow-, Claim- und externe Aktionsautomatisierung bleiben spaeter und
  reviewpflichtig.

## Nicht entschieden

- konkrete OCR-Engine.
- konkrete LLM-/AI-Modelle.
- UI-Details fuer Vorschlagskarten.
- Confidence-Schwellen.
- ob spaeter bestimmte niedrigkritische Felder mit Nutzerregel automatisch
  uebernommen werden duerfen.
