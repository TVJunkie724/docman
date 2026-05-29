---
title: "Produkt-Säule - Export, Sharing and External Actions"
description: "Produktbereich fuer Export, lokale Übergabe, externe App-/Website-Links, Einreichportale, Share-Ziele und spätere sichere Freigaben"
tags: [pillar, export, sharing, external-links, integrations, privacy]
lastUpdated: "2026-05-08"
version: "0.2"
status: "proposed"
---

# Produkt-Säule - Export, Sharing and External Actions

## Zweck

DocMan muss Dokumente nicht nur aufnehmen, sondern auch wieder nutzbar machen:

- Dokument herunterladen.
- PDF öffnen oder drucken.
- per Mail weitergeben.
- Rechnung bei der Sozialversicherung einreichen.
- Zusatzversicherung öffnen.
- Schul-App oder Schulportal öffnen.
- Behördenportal, Versicherungsportal oder Anbieterportal aufrufen.

Diese Säule beschreibt Export, Übergabe und externe Aktionslinks.

## Grundsatz

Externe Apps und Websites sind Aktionsziele, keine vertrauenswürdige DocMan-Datenhaltung.

DocMan speichert im M2 keine externen Zugangsdaten, Tokens oder Session-Cookies fuer solche Dienste.

Export, Sharing und externe Aktionen sind Teil des DMS-Zielbildes, aber nicht
Teil der Dokument-Besitzstruktur. Ein Outbox-/Export-Eintrag verweist auf
Dokumente, Vorgänge, Records oder Facts. Er erzeugt kein zweites Archiv.

## ExternalActionLink

Ein externer Link kann an fachlichen Objekten hängen:

| Ort | Beispiel |
|---|---|
| Task | `Rechnung bei SV einreichen` mit Link zum SV-Portal |
| Claim | Erstattungsclaim mit Link zu SV oder Zusatzversicherung |
| Vorgang | Unfallvorgang mit Link zum Versicherungsportal |
| Record | Versicherungspolizze mit Link zum Kundenportal |
| Profil | Schul-App oder Gesundheitsportal fuer ein Kind |
| Dokument | Originalquelle oder Portal, aus dem das Dokument stammt |

Empfohlene Felder:

- Label.
- Web-URL.
- optionaler App-/Deep-Link.
- Plattformhinweise: Desktop, Mobile, beide.
- Zieltyp und Ziel-ID.
- Profilbezug.
- Kategorie: Portal, App, Mail, Druck, Download, Share.
- Sicherheitsklassifikation.
- optionaler Hinweistext.

## Desktop und Mobile

Desktop:

- öffnet Web-URLs.
- exportiert lokale Dateien.
- druckt oder übergibt an Mail-Client.

Mobile:

- öffnet Universal Links oder App-Links, wenn verfügbar.
- fällt auf Web-URL zurück.
- kann später Share Sheet verwenden.

## ExportPackage

spaetere Milestones sollte DocMan Exportpakete modellieren:

- ausgewählte Dokumente.
- optionales Deckblatt/Manifest.
- optionale Metadaten.
- optionale Redaction.
- lokale ZIP/PDF-Ausgabe.
- Audit-Eintrag.

Das hilft bei Anwalt, Versicherung, Schule, Behörde, Arzt oder Familienorganisation.

Langfristig kann daraus eine echte Outbox entstehen:

- vorbereitet.
- exportiert.
- gedruckt.
- geteilt.
- per Mail übergeben.
- bei externem Portal eingereicht.
- fehlgeschlagen oder abgebrochen.

Diese Zustände gehören zur Aktion, nicht zum Dokument selbst.

## M2-Scope

Schlanker M2-Slice:

- manuellen externen Link an Task oder Vorgang speichern.
- Link sicher öffnen.
- keine Credentials speichern.
- keine automatische Portal-Aktion.
- einfacher lokaler Dokumentexport oder Öffnen der Datei vorbereiten.

Späterer Milestone:

- API-Integrationen zu SV, Versicherungen, Schulen oder Behörden.
- Web-Scraping.
- Passwortmanager.
- automatische Formularübermittlung.
- externe Benutzerfreigabe.
- zeitlich begrenzte Cloud-Share-Links.

## UI-Empfehlung

Externe Links gehören nicht in die Inbox als eigener Outbox-Bereich.

Empfohlen:

- Inbox bleibt Eingang und Korrektur.
- Vorgang zeigt verknüpfte Aktionen und relevante externe Links.
- Task zeigt den konkreten nächsten Link, z. B. `SV-Portal öffnen`.
- Dokumentdetail bietet Export, Öffnen, Drucken, Teilen.
- später kann eine Aktivitäts-/Ausgangshistorie zeigen, was exportiert oder eingereicht wurde.

## Datenschutz

- Links können sensible Kontexte verraten.
- Notifications dürfen Linktitel und Dokumentdetails redigieren.
- Audit darf Aktion und Zieltyp speichern, aber keine Secrets.
- externe Dienste liegen außerhalb der DocMan-Vertrauensgrenze.

## Offene Folgefragen

- Welche Linktypen sind im R4-M2 sichtbar?
- Brauchen Profile eigene externe Links schon in R5?
- Wie wird `ExportPackage` in der UI genannt?
