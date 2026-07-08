---
title: "Decision - Product Name"
description: "Entscheidung zum Produktnamen Mappm und zur Abgrenzung vom technischen Arbeitsnamen DocMan"
tags: [decision, accepted, product, naming, branding, mappm]
lastUpdated: "2026-07-08"
status: "accepted"
---

# Decision - Product Name

## Status

Accepted.

Der langfristige Produktname ist **Mappm**.

## Kontext

Der Name `DocMan` ist praktisch als Repository- und Arbeitsname, wirkt aber nicht zwingend wie der langfristig richtige Produktname.

Das Projekt soll eine ruhige, vertrauenswuerdige Dokumenten-App fuer Familien und Haushalte werden. Der Name sollte deshalb nicht nur technisch oder generisch klingen, sondern zur Produktidee passen:

- private Dokumente sicher verwalten.
- Alltagsthemen als Vorgaenge zusammenhalten.
- unterwegs schnell erfassen.
- zuhause ruhig pruefen, sortieren und abschliessen.
- self-hosted/local-first statt Cloud-SaaS.

## Entscheidung

Das Produkt heisst künftig **Mappm**.

Begründung:

- `Mappm` ist kurz, ruhig und gut merkbar.
- Der Name erinnert an Mapping, Zusammenhaenge und das Zuordnen von
  Dokumenten zu Personen, Vorgaengen, Nachweisen und Aufgaben.
- Die doppelte `p`-Form wirkt eigenstaendig und produktfaehig, ohne technisch
  oder behördlich zu klingen.
- Er passt zu Dokumenten, Vorgängen, Haushalt, Aufgaben, Nachweisen und
  verknuepften Alltagskontexten.
- Er wirkt moderner und wärmer als `DocMan`.
- Er ist nicht so behördlich wie `Dossier` und nicht so technisch wie klassische DMS-Namen.

## Arbeitsname und Migration

`DocMan` bleibt vorerst technischer Projekt- und Repo-Arbeitsname.

Das bedeutet:

- GitHub-Repository, bestehende Milestones, Issues und viele interne Dokumente dürfen vorerst `DocMan` behalten.
- Neue produktnahe UI-/Branding-Texte sollen `Mappm` verwenden.
- Architekturbegriffe bleiben neutral, z.B. `Home Hub`, `Sync Backend`, `Capture`, `Search`.
- Eine vollständige technische Umbenennung wird separat geplant und nicht nebenbei durchgeführt.

## Anforderungen an den Namen

Der Name erfüllt die Anforderungen:

- vertrauenswuerdig und ruhig wirken.
- zu Familie, Haushalt und privaten Dokumenten passen.
- nicht zu sehr nach Enterprise-DMS, Ticket-System oder Admin-Tool klingen.
- international oder zumindest deutsch/englisch gut funktionieren.
- kurz genug fuer App-Name, Fenster-Titel, Mobile Icon und Backend-Komponenten sein.
- als technischer Namespace brauchbar sein.
- nicht zu nah an bestehenden bekannten Dokumenten-Apps liegen.

## Konsequenzen

Produktnahe Namen:

| Bereich | Name |
|---|---|
| App/Product | `Mappm` |
| Mobile App | `Mappm` oder `Mappm Mobile`, falls Plattformtexte unterscheiden müssen |
| Home Hub | `Mappm Home Hub` als Produkttext möglich; technisch weiter `Home Hub` |
| Backend/Sync | `Mappm Sync` als Produkttext möglich; technisch weiter `Sync Backend` |
| Repo/Arbeitsdoku | vorerst `docman` / `DocMan` |

Vor öffentlicher Distribution müssen geprüft werden:

- App-Store-Verfügbarkeit.
- Domain-/Projektname-Verfügbarkeit.
- Marken-/Trademark-Risiko auf angemessenem Niveau.
- Package-/Bundle-Identifier.
- sichtbare App-Namen auf Desktop und Mobile.

## Nicht jetzt

- Logo.
- Farb-/Brand-System.
- App-Store-Texte.
- Domain-Kauf.
- vollstaendige Umbenennung aller Dateien und Klassen.
- sofortige Repo-Umbenennung.

## Follow-up

Es braucht ein separates Rename-/Branding-Issue.

Dieses Issue soll planen:

- welche User-facing Texte zuerst auf `Mappm` wechseln.
- ob und wann das Repo umbenannt wird.
- ob Dart package, Bundle Identifier oder App Display Name geändert werden.
- welche Dokumente weiterhin `DocMan` als technischen Projektnamen verwenden dürfen.
- welche GitHub Milestones/Labels vorerst stabil bleiben.

## Akzeptanz

Die Entscheidung ist akzeptiert, wenn:

- `Mappm` als finaler Produktname gewählt ist.
- die Konsequenzen fuer App-Name, Repo, Package-/Bundle-Identifier, Backend-Namen, Dokumentation und GitHub Issues beschrieben sind.
- ein separates Umbenennungs-Issue existiert.
