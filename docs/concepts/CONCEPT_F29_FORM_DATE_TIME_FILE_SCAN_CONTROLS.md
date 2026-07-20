---
title: "Konzept F29 - Form Date, Time, File and Scan Controls"
description: "Mappm Detailkonzept fuer Date Picker, Date Range, Time, Recurrence, Reminder, File Picker, Capture Source, Upload Queue und Permissions"
tags: [concept, frontend, design-system, forms, date-picker, file-picker, scan, mobile-capture, flutter]
lastUpdated: "2026-07-20"
version: "1.2"
status: "accepted"
owner: "ui-concept"
---

# Konzept F29 - Form Date, Time, File and Scan Controls

## Status

Accepted.

F29 ist ein Detailkonzept unter F24. Es deckt alle zeit-, datei- und
scanbezogenen Formelemente aus dem Design-System-Mock ab.

## Quellen

| Quelle | Rolle |
|---|---|
| `docs/design-system/Mock/pages/component-forms.html` | Date/Time-, File/Scan- und Mobile-Capture-Katalog. |
| `docs/design-system/Mock/pages/component-form-interactions.html` | Popover-, Inline- und Bottom-Sheet-Verhalten. |
| F17 | Mobile Capture Plan. |
| F18 | Notifications, Failures, Observability. |
| F24 | Form Family Umbrella. |
| F27 | Field Anatomy and Validation. |
| F28 | Picker/Selection-Regeln. |
| `DECISION_TEMPORAL_FACT_EVENT_AGENDA_MODEL.md` | Fachliche Zeitsemantik, Genauigkeit, Provenienz und Agenda-/Kalendergrenzen. |
| `DECISION_DOCUMENT_CAPTURE.md` | Akzeptierte Mobile-/Desktop-Eingangsarten und Webcam-Verbot. |
| `DECISION_CROSS_DEVICE_CAPTURE_HANDOFF.md` | Nicht implementierungsautorisierender Cross-Device-Draft; OQ-013. |

## Zweck

Mappm arbeitet mit Fristen, Gueltigkeiten, Rechnungsdaten, Scan-Dateien und
Upload-Queues. Diese Controls muessen schnell bedienbar sein und Vault-,
Notification- sowie Core-Assist-Grenzen korrekt abbilden.

## Date Picker

Verwendung:

- Ausstellungs-, Empfangs-, Leistungs- oder Ereignisdatum mit explizitem
  Feldlabel.
- Ausstellungsdatum einer Rechnung.
- Faelligkeit.
- Gueltig-ab/gueltig-bis als Einzeldatum.
- Termin-/Aufgabendatum.

Standard:

- Desktop: Popover mit Kalender.
- Mobile: Bottom Sheet.
- Inline nur fuer eigene Planungsflaechen, nicht fuer kompakte Dokumentreview-
  Forms.

Regeln:

- Eingabeformat fuer deutschsprachige UI: `DD.MM.YYYY`.
- Intern nie stringbasiert speichern; Domain nutzt typisierte Datumwerte.
- Die UI erfindet kein universelles `documentDate`. Feldlabel und Binding
  benennen die konkrete Bedeutung, etwa Ausgestellt, Leistung, Faelligkeit,
  Gueltig bis oder Termin.
- Reine Datumswerte, zonierte Zeitpunkte, Intervalle und Teilgenauigkeit folgen
  `DECISION_TEMPORAL_FACT_EVENT_AGENDA_MODEL.md`.
- "Heute" ist Mini-Command.
- Faelligkeit darf Review-Hinweis erzeugen, aber nicht automatisch Alarm, wenn
  keine Reminder-Entscheidung getroffen wurde.

## Date Range Picker

Verwendung:

- Versicherungs-/Vertragslaufzeit.
- Auswertungszeitraum.
- Geltungsbereich einer Unterlage.
- Suchfilter von/bis.

Regeln:

- Start und Ende sind als zwei Felder sichtbar.
- Range ist im Kalender markiert.
- Offene Enden sind nur erlaubt, wenn der Feldtyp das fachlich erlaubt.
- Ungueltige Range erzeugt Inline-Fehler nach F27.

## Time Picker

Verwendung:

- Erinnerungszeit.
- Terminzeit.
- optionaler Uhrzeit-Anteil fuer Aufgaben.

Regeln:

- 24-Stunden-Format.
- Uhrzeit ist optional, wenn das fachliche Objekt nur ein Datum braucht.
- Keine Uhrzeit erzwingen fuer reine Ausstellungs-, Leistungs- oder
  Rechnungsdaten.

## Time Range Picker

Verwendung:

- Terminfenster.
- Erreichbarkeitsfenster.
- geplante Bearbeitungszeit, falls spaeter gebraucht.

Regeln:

- Start/Ende nebeneinander auf Desktop, gestapelt auf Mobile.
- Range darf nicht negativ sein.
- Bei Ganztag-Objekten lieber Date/All-day-Pattern statt Time Range.

## Recurrence Picker

Verwendung:

- wiederkehrende Aufgaben.
- wiederkehrende Zahlungen/Laufende Kosten.
- wiederkehrende Erinnerungen.

Milestone-Regel:

- Recurrence ist nicht zwingend im ersten Build-Slice, muss aber strukturell
  eingeplant sein, weil Versicherungen, Abos, Zahlungen und Fristen davon
  profitieren.

Regeln:

- einfache Presets zuerst: einmalig, monatlich, jaehrlich.
- Custom Rules erst, wenn der Use Case konkret ist.
- Recurrence nie nur als Freitext speichern.

## Reminder Offset

Verwendung:

- "1 Monat vorher".
- "1 Woche vorher".
- "Am Faelligkeitstag".
- individuelle Aufgabe/Frist.

Regeln:

- Offset ist getrennt vom Datum.
- Reminder erzeugt spaeter Notification-Auftrag, kein UI-only Flag.
- Reminder Copy darf keine sensiblen Dokumentdetails in Push/OS-Meldung zeigen.

## File Picker

Verwendung:

- Desktop-Dateiimport.
- Mobile PDF-/Dateiimport ueber nativen Picker beziehungsweise Share-Sheet.
- Einzeldokument importieren.
- PDF/JPG/PNG/HEIC als Eingangsdateien.

Regeln:

- Dropzone ist nur Desktop-primaer; Mobile nutzt nativen Picker/Camera.
- Desktop unterstuetzt Picker, Multi-File und Drag-and-drop; normaler
  Desktop-Import setzt kein Smartphone voraus.
- Datei-Typ und Dateiname werden sichtbar.
- Entfernen/Ersetzen sind Mini-Commands.
- Mehrere Dateien werden nicht automatisch zu ZIP oder Vorgang; Zuordnung folgt
  dem Review.
- Nur eine ausdrueckliche Desktop-Kontextaktion in einem bestehenden,
  bestaetigten und geoeffneten `medical_care`-Case erzeugt bewusst ein
  ZIP-Medienpaket aus einem Dateibaum. Sie zeigt Dateianzahl, Gesamtgroesse,
  Ausschluesse/Lesefehler und Fortschritt. Der Nutzer vergibt den Titel
  manuell; `Untersuchungsdatum` ist optional und darf leer bleiben.
- Globaler Desktop-Capture, nichtmedizinische Cases und Mobile M1 zeigen
  diesen Medienpaket-Import nicht. Auch ein bereits vorhandenes ZIP ist auf
  Mobile kein Eingang in diesen Spezialflow.
- Ein Desktop-Webcam-Dokumentenscan ist verboten. Durch externe
  Scanner-Anwendungen erzeugte PDF-/Bilddateien bleiben normale Importe.
- Smartphone-zu-Desktop und macOS Continuity Camera bleiben Draft-Optionen und
  duerfen vor OQ-013 nicht als Form-Control vorausgesetzt werden.
- Dateityp ist fachlich relevant: PDF fuer Dokumente, Bild fuer Passfoto,
  Beweisfoto oder Objektfoto.

## Capture Source und Ausgabe

Der Standardflow verlangt keine abstrakte Scan-Modus-Auswahl. Der Nutzer
waehlt eine konkrete Quelle/Aktion, zum Beispiel Dokument scannen, vorhandene
Datei importieren, ein Beweis-/Objektfoto aufnehmen oder ein Bild aus der
Galerie waehlen. Mappm leitet das geeignete Ausgabeformat ab und zeigt eine
Korrektur nur, wenn die Wahl fachliche Folgen hat.

Regeln:

- Hochwertiger Dokument-Scan erzeugt ein geeignetes Dokumentartefakt mit
  mehreren Seiten.
- Foto bleibt fuer Passfoto, Gegenstand, Unfall- oder Beweisfoto legitim.
- Ein abgeschlossener Scan enthaelt genau ein logisches Dokument; fuer das
  naechste Dokument beginnt eine neue Scan-Einheit.
- Original und abgeleitete/optimierte Ausgabe bleiben unterscheidbar.
- Native Plattform-Scanner sind Favorit, bleiben aber hinter einem Port
  austauschbar.

## Image Quality

Ziel:

- Qualitaet soll sich an modernen Mobile-Document-Scans orientieren:
  Auto-Capture, Kantenkorrektur, heller/neutraler Hintergrund, gut lesbarer
  Text.

Regeln:

- Qualitaetsstufen duerfen spaeter ausprobiert werden.
- Rohbild und bereinigtes Ergebnis koennen getrennt behandelt werden, wenn es
  fuer Audit/Retry noetig ist.
- Schlechte Scans brauchen Korrektur-/Retry-Pfad, nicht stillen Import.

## Upload Queue

Verwendung:

- Mobile Capture offline.
- Mappm Cloud oder Core Assist temporaer nicht erreichbar.
- Cloud-Vault-Operationen, die noch nicht bestaetigt sind.

Regeln:

- Upload bleibt lokal, bis Transport erreichbar ist.
- Queue zeigt technischen Status ohne private Dokumentdetails.
- Retry ist moeglich.
- Fehler muessen erklaerbar und korrigierbar sein.
- Konflikte landen spaeter im Dashboard und auf eigener Konfliktseite.

## Permissions

Verwendung:

- Kamera.
- Dateien.
- Fotos/Galerie.
- lokale Benachrichtigungen.

Regeln:

- Permission-Text nennt Zweck, nicht Angst.
- Bei Ablehnung gibt es Fallback oder klare naechste Aktion.
- Keine Permission beim App-Start anfordern, bevor der Nutzer den Flow startet.

## Mobile Capture Minimal Input

Der globale Capture-Einstieg enthaelt nur:

- die wenigen konkreten Erfassungswege fuer Scan, Foto, Galerie und Datei,
  deren exakte Komposition erst die UI-Phase bestimmt.
- optional `Neuen Vorgang starten` als bewusste Vorab-Absicht.

Regeln:

- Automatische Backend/Core-Assist-Analyse und Matching laufen immer.
- Profil, Dokumentgrundart/Variante, Titel, Case/Record, Rolle und Metadaten werden nicht vor
  dem Scan abgefragt, sondern vorgeschlagen.
- Bestehender Case ist hoechstens ein sekundaerer Shortcut oder Teil des
  Korrekturpfads.
- Exakte Tap-/Swipe-/Control-Gestaltung bleibt dem Capture-UI-Konzept vorbehalten.

## Flutter Handoff

Implementation soll:

- Date/Time-Werte typisiert halten.
- Provenienz, Vorschlags-/Bestaetigungsstatus, Teilgenauigkeit und Zeitzone aus
  dem Domain-State erhalten statt im Control zu flatten.
- File/Scan-Controls hinter Interfaces kapseln.
- native Scanner/Picker hinter Strategy/Provider abstrahieren.
- Queue-Status aus Domain-State beziehen.
- Sensitive Details in OS-Notifications und globalem Feedback vermeiden.

## Accessibility

- Kalender ist tastaturbedienbar.
- Popover/Sheet hat Fokusfalle und klare Schliessen-Aktion.
- Dropzone hat Button-Fallback.
- Datei- und Scanstatus wird screenreader-verstaendlich angesagt.

## Tests

Mindestens:

- Date Picker Auswahl und Fehler fuer ungueltige Eingabe.
- Date Range Start/Ende Validierung.
- File Picker Selected/Replace/Remove.
- Capture-Quelle und abgeleitetes Ausgabeformat.
- Upload Queue Offline/Retry.
- Mobile Picker/Sheet fuer eine tatsaechlich relevante Datum- oder
  Quellenauswahl.

## Acceptance Criteria

- [ ] Date, Date Range, Time und Time Range haben klare Einsatzregeln.
- [ ] Recurrence und Reminder sind fuer spaetere Fristen/Aufgaben vorbereitet.
- [ ] File Picker unterscheidet PDF/Dokument und Bild/Foto.
- [ ] Capture-Quellen decken Dokument-Scan, Datei und Bild ab, ohne einen
      unnoetigen Modus-Picker zu erzwingen.
- [ ] Mobile deckt Scan, Foto, Galerie und Datei/Share ab; Desktop deckt
      Picker, Multi-File und Drag-and-drop ab.
- [ ] Desktop-Webcam-Scanning ist als verbotener Pfad negativ getestet.
- [ ] Upload Queue ist privacy-sicher und offline-faehig geplant.
- [ ] Native Scanner/Picker bleiben austauschbar.

## Stop Rules und Handoff

Stop, wenn Capture vor dem Scan Typ, Profil, Titel oder Case verlangt, wenn
mehrere Dokumente in eine logische Scan-Einheit gemischt werden oder wenn
Queue/Restart Originale verliert. Stop auch, wenn eine Desktop-Webcam als
Dokumentenscanner oder ein OQ-013-Draftpfad als akzeptierter Core-Control
geplant wird. Konkrete Controls gehen an `ui-architect`,
Scanner-/Queue-Adapter an `data-architect` und Nachweise an
`frontend-test-coverage`.

## Enterprise Quality Contract

Dieses Konzept uebernimmt
`docs/execution/CONCEPT_ENTERPRISE_QUALITY_CONTRACT.md`. Eigener Scope und
Status bleiben massgeblich. Der gemeinsame Vertrag liefert die verbindlichen
Defaults fuer Ownership, Security/Privacy, Accessibility/Lokalisierung,
Verifikation, Stop Rules und Handoff, soweit dieses Dokument keine strengere
Regel definiert. Ein Widerspruch stoppt die betroffene Phase und wird in diesem
Konzept aufgeloest.
