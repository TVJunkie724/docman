---
title: "Decision - Document Capture"
description: "Entscheidung zur minimalen Dokument-Erfassung: Desktop-Dateiimport und Mobile Scan landen zuerst in der Draft-Inbox"
tags: [decision, document-capture, draft-inbox, mobile-capture, desktop, milestones]
lastUpdated: "2026-07-14"
status: "accepted"
---

# Decision - Document Capture

## 2026 Vault Rebaseline

Capture behavior remains accepted, but destination semantics follow the active
Vault: Local capture stays authoritative on-device; Cloud capture uses the
Mappm Cloud contract and remains pending until Cloud confirmation. Historical
Home-Hub wording means Cloud provider handoff only.

## Status

Accepted.

## Entscheidung

M2 hat zwei Dokument-Eingänge:

1. Desktop-Dateiimport.
2. Mobile Document Scan.

Beide Eingänge führen zuerst in die Draft-Inbox. Direkte Vorgangszuordnung ist
in M2 ein Komfortpfad, aber nie die einzige sichere Ablage.

## M2-Flow

```text
Desktop Dateiimport oder Mobile Scan
  -> Draft-Inbox
  -> pruefen
  -> Managed Subject setzen oder korrigieren
  -> Metadaten ergaenzen
  -> Vorgang zuordnen oder Zuordnung korrigieren
  -> erledigt / abgelegt
  -> unter den letzten 10 zuletzt verarbeitet sichtbar
```

## Desktop-Dateiimport

Desktop muss mindestens eine lokale Datei als Dokument-Draft aufnehmen können.

Zielbild:

- Datei auswählen.
- Drag & Drop.
- PDF, JPG/JPEG und PNG vorbereiten.
- Quelle als `desktop_import` oder vergleichbar speichern.
- Managed Subject setzen oder später im Draft Review korrigieren.
- Datei sicher im lokalen File Store ablegen.
- Draft-Inbox-Eintrag anlegen.

Der konkrete Desktop-Import-Scope steht in `DECISION_DESKTOP_IMPORT_SCOPE.md`.

Desktop-Import ist keine vollständige Import-Automation. Er ist der zuverlässige manuelle Eingang.

## Mobile Document Scan

Mobile Capture muss echte Dokumentenscan-Qualität vorbereiten, nicht nur normalen Foto-Upload.

Zielbild:

- Auto-Capture.
- Rand-/Perspektivkorrektur.
- Dokumentoptimierung mit hellem Hintergrund und gut lesbarem dunklem Text.
- lokale Upload Queue.
- Upload an Home Hub.
- Draft-Inbox-Eintrag am Desktop.
- Personenkontext, wenn Mobile ihn kennt oder der Desktop ihn beim Review setzt.
- optionale `caseId`, wenn eine gecachte Vorgangsliste verfügbar ist.

Vorlaeufiger Technologiepfad: native Plattform-Scanner, also Google ML Kit
Document Scanner auf Android und Apple VisionKit Document Camera auf iOS. Die
konkrete Flutter-Bridge wird erst nach einem Qualitaets-Spike final entschieden.
Details stehen in `docs/technical/DECISION_MOBILE_SCANNER_TECHNOLOGY.md`.

Wenn die direkte `caseId` ungueltig, unsicher oder nicht mehr verfügbar ist, bleibt der Upload als Draft zur Prüfung sichtbar.

## Capture Intent

Mobile und Desktop unterscheiden zwischen Dokumentenscan und Bildnachweis:

- `DocumentScan`: fuer papierartige Dokumente; primaeres Nutzerartefakt ist
  PDF, technische Seitenbilder bleiben fuer Upload, Preview, OCR oder
  Reprocessing moeglich.
- `PhotoOrImageEvidence`: fuer Passfoto, Unfallfoto, Schadenfoto, Produktfoto
  oder andere Bildnachweise; primaeres Nutzerartefakt bleibt Bild.

Die UI darf den Modus vorschlagen, muss ihn aber korrigierbar halten.

## Nicht in M2

Nicht Teil dieser M2-Entscheidung:

- E-Mail-Import.
- Watch Folder.
- automatische OCR-/LLM-Klassifikation.
- automatisches Formularausfüllen.
- komplexe Duplikaterkennung.
- Scanner-Hardware-Integration am Desktop.
- Batch-Import-Regeln.
- vollständige mobile Vorgangsverwaltung.

## Vorausplanung

Der Import muss spätere Erweiterungen vorbereiten:

- `source` / `origin` fuer Desktop, Mobile, spaeter Mail, Watch Folder, API oder OCR.
- `managedSubjectId` fuer Personen-/Organisationskontext; Legacy-`profileId`
  wird nur an Adaptergrenzen gemappt.
- Originaldatei und normalisierte/optimierte Dokumentversion trennen.
- Draft-Status und Review-Zustand eindeutig modellieren.
- spaetere OCR-/LLM-Vorschlaege als Vorschlaege, nicht als still fertige Zuordnung.
- Export/Outbox bleibt ein separater Vorgangs- oder Dokument-Flow, nicht Teil der Draft-Inbox.

## Managed-Subject-Kontext

Draft Review muss langfristig Haushaltsprofile unterstützen.

M2:

- Managed Subject ist fuer den Review-Abschluss verpflichtend.
- Personen-/Organisationszuordnung kann beim Review gesetzt oder korrigiert werden.
- optionaler Vorgang/Record-/Claim-Kontext gehoert typischerweise zu diesem
  verwalteten Profil oder kann bewusst davon abweichen.

Spaeter:

- mehrere Haushaltsprofile.
- Kinderprofile gemeinsam verwalten.
- Partner-/Erwachsenenrechte.
- Dokumente und Records mit mehreren betroffenen Profilen verknuepfen.

## Vorgaenge aus Dokumenten und Auswahl

Aus markierten Dokumenten darf ein normaler verbundener Vorgang entstehen.
Aus Dokumenten und bestehenden Vorgängen darf ebenfalls ein neuer
übergeordneter Vorgang gebildet werden.

Regeln:

- Die Datei wird nicht dupliziert.
- Das Dokument bleibt ein einzelnes Dokumentobjekt.
- Der neue Vorgang wird über einen typisierten `CaseLink` wie `part_of` oder
  `caused_by` verbunden.
- Dokumente behalten bestehende Links und erhalten zusätzliche
  `DocumentCaseLink`-Rollen.
- Ein bevorzugter Link darf die Navigation vereinfachen, ist aber nicht exklusiv.
- Die Operation und ihre Beziehung sind ohne Datenverlust reversibel.

Normative Details stehen in
`DECISION_CASE_RELATIONSHIP_WORKFLOW_COMPOSITION.md`.

## Konsequenzen

- R4-D2 ist entschieden.
- Draft-Inbox ist der zentrale Sicherheitsanker fuer neue Dokumente.
- Hash-basierte Duplikatwarnung ist M2-Teil; Details stehen in `DECISION_IMPORT_DUPLICATE_DETECTION.md`.
- Der konkrete Desktop-Review-Workflow steht in `DECISION_DRAFT_INBOX_REVIEW_WORKFLOW.md`.
- Case-Komposition ist vorgesehen, aber ohne separate Subcase-Entität oder
  Dokumentduplikation.
- F10, F17 und First Utility Scope bestaetigen diese Richtung bereits.
- R4-Implementation muss Desktop-Dateiimport und Mobile-Scan-Handoff getrennt planen, aber beide in denselben Draft-Review-Flow führen.

## Nicht entschieden

- welche Bildformate in M2 exakt unterstützt werden.
- welche native Scanner-Bridge final genutzt wird.
- ob PDF-Erzeugung auf Mobile in M2 Pflicht ist oder ob Bild-plus-Metadaten
  zuerst reicht und Home Hub/Desktop normalisiert.
