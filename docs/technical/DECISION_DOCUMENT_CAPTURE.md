---
title: "Decision - Document Capture"
description: "Entscheidung zur minimalen Dokument-Erfassung: Desktop-Dateiimport und Mobile Scan landen zuerst in der Draft-Inbox"
tags: [decision, document-capture, draft-inbox, mobile-capture, desktop, milestones]
lastUpdated: "2026-05-29"
status: "accepted"
---

# Decision - Document Capture

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
  -> betroffene Person setzen oder korrigieren
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
- betroffene Person setzen oder später im Draft Review korrigieren.
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
- `profileId` / Profilbezug fuer Haushalts- und Kinderkontext.
- Originaldatei und normalisierte/optimierte Dokumentversion trennen.
- Draft-Status und Review-Zustand eindeutig modellieren.
- spaetere OCR-/LLM-Vorschlaege als Vorschlaege, nicht als still fertige Zuordnung.
- Export/Outbox bleibt ein separater Vorgangs- oder Dokument-Flow, nicht Teil der Draft-Inbox.

## Haushalts- und Personenkontext

Draft Review muss langfristig Haushaltsprofile unterstützen.

M2:

- betroffene Person ist fuer den Review-Abschluss verpflichtend.
- Personenzuordnung kann beim Review gesetzt oder korrigiert werden.
- optionaler Vorgang/Subvorgang gehoert typischerweise zu dieser Person oder kann bewusst davon abweichen.

Spaeter:

- mehrere Haushaltsprofile.
- Kinderprofile gemeinsam verwalten.
- Partner-/Erwachsenenrechte.
- Dokumente und Records mit mehreren betroffenen Profilen verknuepfen.

## Subvorgänge aus Dokumenten

In M2 darf ein Vorgang aus markierten Dokumenten einen neuen Subvorgang bilden.

Regeln:

- Die Datei wird nicht dupliziert.
- Das Dokument bleibt ein einzelnes Dokumentobjekt.
- Der neue Subvorgang wird mit dem Hauptvorgang über `parentCaseId` verbunden.
- Die ausgewählten Dokumente bekommen den Subvorgang als primäre Vorgangszuordnung.
- Der Hauptvorgang zeigt den Subvorgang mit Dokumentanzahl, statt die Dokumente zwingend zusätzlich in der Hauptliste zu spiegeln.

Flexible Dokument-Mehrfachlinks mit Rollen wie `primary` und `context` bleiben ein geplanter Ausbau.

## Konsequenzen

- R4-D2 ist entschieden.
- Draft-Inbox ist der zentrale Sicherheitsanker fuer neue Dokumente.
- Hash-basierte Duplikatwarnung ist M2-Teil; Details stehen in `DECISION_IMPORT_DUPLICATE_DETECTION.md`.
- Der konkrete Desktop-Review-Workflow steht in `DECISION_DRAFT_INBOX_REVIEW_WORKFLOW.md`.
- Subvorgänge sind in M2 vorgesehen, aber ohne Dokumentduplikation.
- F10, F17 und First Utility Scope bestaetigen diese Richtung bereits.
- R4-Implementation muss Desktop-Dateiimport und Mobile-Scan-Handoff getrennt planen, aber beide in denselben Draft-Review-Flow führen.

## Nicht entschieden

- welche Bildformate in M2 exakt unterstützt werden.
- welche native Scanner-Bridge final genutzt wird.
- ob PDF-Erzeugung auf Mobile in M2 Pflicht ist oder ob Bild-plus-Metadaten zuerst reicht.
