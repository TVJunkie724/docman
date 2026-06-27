---
title: "Decision - Record UI Language"
description: "Entscheidung zur deutschen UI-Sprache fuer Record: Unterlagen, Persoenliche Unterlagen und Nachweisart"
tags: [decision, product-language, records, ui-language, documents]
lastUpdated: "2026-06-10"
status: "accepted"
---

# Decision - Record UI Language

## Status

Accepted.

R8-D2 ist entschieden. `Record` bleibt der interne Code-/Domain-Arbeitsbegriff.
Die deutsche UI verwendet "Unterlagen" als Hauptbegriff.

## Entscheidung

Ordna verwendet:

| Kontext | UI-Begriff | Bedeutung |
|---|---|---|
| Hauptbereich / Navigation | Unterlagen | langlebige, wiederfindbare Unterlagen und Records |
| Profilkontext | Persoenliche Unterlagen | Unterlagen, die zu einem Haushaltsprofil gehoeren |
| spezifische Art | Nachweis / Nachweisart | Unterart fuer Geburtsurkunde, Meldezettel, Staatsbuergerschaft, Reisepass usw. |
| Code / Domain | `Record` | langlebiger fachlicher Gegenstand mit Versionen |

## Warum nicht andere Begriffe?

- `personenbezogene Dokumente`: zu technisch und DSGVO-nah.
- `persoenliche Dokumente`: freundlich, aber als Hauptnavigation etwas zu
  unscharf.
- `Personen-Dokumente`: sprachlich holprig.
- `Akte`: zu behoerdlich und zu nah an `Vorgang`.
- `offizielle Dokumente`: zu eng, weil Polizzen, Garantien, Zeugnisse oder
  andere Unterlagen nicht immer offiziell sind.
- `Nachweise`: gut als Unterart, aber zu eng fuer alle Records.

## UI-Richtung

Beispiel Profil:

```text
Profil: Kind A

Persoenliche Unterlagen
- Geburtsurkunde
- Meldezettel
- Reisepass
- Staatsbuergerschaftsnachweis
- Versicherungspolizze
- Zeugnisse
```

Allgemeiner Bereich:

```text
Unterlagen
Filter: Person, Nachweisart, Gueltigkeit, Kategorie
```

## Konsequenzen

- R8-D2 ist entschieden: "Unterlagen" ist der Haupt-UI-Begriff fuer Records.
- "Persoenliche Unterlagen" ist der Profilkontext.
- "Nachweis" / "Nachweisart" bleibt eine spezifische Kategorie.
- Code und Architektur duerfen weiter `Record` verwenden.
- `Akte` wird nicht als Record-Begriff verwendet, damit es nicht mit
  `Vorgang` kollidiert.

## Nicht entschieden

- konkrete Icons und Gruppierung in der UI.
- ob "Unterlagen" ein eigener Hauptnavigationseintrag oder eine Ansicht im
  Dokumentbereich wird.
