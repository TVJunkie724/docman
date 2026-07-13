---
title: "Decision - Local Export Instead of External Sharing"
description: "Entscheidung gegen externes App-Sharing und fuer bewussten lokalen Export einzelner Dokumente oder ganzer Vorgaenge"
tags: [decision, export, sharing, privacy, zip, external-access]
lastUpdated: "2026-07-12"
status: "accepted"
---

# Decision - Local Export Instead of External Sharing

## 2026 Portability Rebaseline

Local export remains accepted, but is now also a required Cloud exit path.
Cloud-to-Local migration is separate and must be verified. Historical
private/self-hosted positioning below does not limit managed Cloud portability.

## Status

Accepted.

R14-D1 ist entschieden. Mappm bietet keine externen Zugriffe auf die App und
kein Cloud-Sharing fuer Personen ausserhalb des Haushalts. Die sichere
Uebergabeform ist bewusster lokaler Export.

## Entscheidung

Mappm soll Dokumente herausgeben koennen, aber nicht selbst zum externen
Sharing-Portal werden.

Erlaubte erste Exportformen:

- einzelnes Dokument als Originaldatei lokal speichern, ohne ZIP.
- mehrere ausgewaehlte Dokumente als ZIP exportieren.
- ganzen Vorgang als ZIP exportieren.
- optional spaeter Exportmanifest/Deckblatt mitgeben.
- optional spaeter redigierte Varianten erzeugen.

Nicht geplant:

- externe Nutzerkonten fuer Anwalt, Arzt, Schule, Versicherung oder Behoerde.
- externe App-Zugriffe auf Mappm.
- oeffentliche oder zeitlich begrenzte Cloud-Share-Links.
- Linkfreigaben auf einzelne Dokumente oder Vorgaenge.
- externes Rollenmodell fuer Personen ausserhalb des Haushalts.

Nach dem Export entscheidet die Nutzerin selbst, wie sie die Dateien
verschickt: Mail, Portal-Upload, Messenger, USB-Stick, Druck oder ein anderer
Kanal. Dieser Versand liegt ausserhalb der Mappm-Vertrauensgrenze.

## Warum

Mappm verwaltet hochsensible Haushaltsdokumente. Externes Sharing wuerde sofort
zusatzliche Risiken erzeugen:

- Auth und Identitaet fremder Personen.
- Widerruf und Ablauf von Freigaben.
- Zugriffshistorie und Audit.
- Hosting und Verfuegbarkeit.
- versehentliche Ueberfreigabe.
- rechtliche und Store-/Privacy-Fragen.

Lokaler Export ist verstaendlicher, sicherer und passt besser zur
private/self-hosted Produktlinie.

## Produktverhalten

Die UI soll Export als bewusste Aktion darstellen:

- `Dokument exportieren`.
- `Ausgewaehlte Dokumente als ZIP exportieren`.
- `Vorgang als ZIP exportieren`.

Vor dem Export soll sichtbar sein:

- welche Dokumente enthalten sind.
- welche Profile/Personen betroffen sind.
- ob optionale Metadaten oder ein Manifest enthalten sind.
- wohin exportiert wird.

## Konsequenzen

- R14-D1 ist entschieden.
- Export ersetzt externes Sharing.
- Einzeldokumente werden als Originaldatei exportiert, nicht als ZIP.
- Outbox/Ausgang kann spaeter eine lokale Exporthistorie sein, kein
  Freigabeportal.
- R14 fokussiert lokale Exportpakete, Redaction und sichere Nutzerentscheidung.
- Externe Freigaben bleiben explizit ausserhalb des Produktplans, bis die
  Nutzerin diese Grenze neu entscheidet.

## Nicht entschieden

- konkreter UI-Name fuer Exportpakete.
- ob ein Exportmanifest im ersten Export-Slice enthalten ist.
- ob Redaction schon beim ersten ZIP-Export verfuegbar ist.
- ob Exporte optional verschluesselt werden koennen.
