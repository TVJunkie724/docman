# Template - Case Boundary und Matching

## Signal-Matrix

| Signal | Quelle/Provenienz | Kontinuitaet | Neuer Case | Beziehung | Darf allein entscheiden? | Fallback | Backend-Feasibility |
|---|---|---|---|---|---|---|---|
| | User/Dokument/Record/Event/Pack | stark/mittel/schwach/gegen | stark/mittel/schwach/gegen | keine/Relation | ja/nein + Review | | ungeprueft/Scope/spaeter/nicht verlaesslich |

## Vorschlagsgrenze

| Stufe | Fachliche Evidenz | Primaere Ausgabe | Immer erreichbar |
|---|---|---|---|
| 1 Bestaetigter Nutzerkontext | Case oder neuer Case bewusst gewaehlt | Nutzerkontext sofort uebernehmen; zusaetzliches Ranking nur ergaenzend | Korrektur, Suche, zusaetzliche Cases/Relationen nach Review |
| 2 Starke Kontinuitaet | mindestens ein dafuer zugelassenes starkes Signal oder family-spezifisch freigegebene Kombination | bestehender Case zuerst | neuer Case, weitere Kandidaten, Suche |
| 3 Kombinierte mittlere Signale | mehrere kompatible mittlere Signale, kein starkes Anti-Signal | bestehender Case vorsichtig vorschlagen | neuer Case gleichwertig, weitere Kandidaten, Suche |
| 4 Schwach oder unbekannt | nur schwache/neutrale oder keine verwertbaren Signale | neuer Case zuerst | beste bestehende Kandidaten, Suche |

Pro Familie ausfuellen:

- Welche Signale duerfen Stufe 2 tragen?
- Welche Kombination ist mindestens fuer Stufe 3 erforderlich?
- Welche Signale bleiben immer schwach?
- Welche Anti-Signale senken nur das Ranking, ohne `Wrong Case` zu behaupten?
- Wann ueberstimmt eine stabile Referenz den Lifecycle-Malus?
- Wie verhalten sich `done`/`archived`?

## Pflichtfragen je Signal

- Was bedeutet das Signal fachlich, wenn es bestaetigt ist?
- Ist es eine Userangabe, ein deterministischer Wert oder nur ein
  Small-/Medium-Model-Kandidat?
- Kann es Sender/Provider/Empfaenger und den gewaehlten Managed Context
  verwechseln? Der Dokumentinhalt darf den Userkontext nicht ueberschreiben.
- Ist es stabil oder nur zeitliche/sessionbezogene Naehe?
- Welche Gegen-Evidenz schwächt es?
- Was geschieht, wenn es nicht extrahierbar ist?
- Welche Korrektur verliert weder Original noch Historie?

## Candidate-Vertrag

- Pipeline: Extraktion -> berechtigungsgefilterte Retrieval-Kandidaten ->
  regel-/modellgestuetztes Ranking -> Nutzerreview;
- primaerer Case/Record;
- weitere Case-/Record-Links;
- Case-Beziehungen nur optional nach Feasibility und immer
  nutzerbestaetigt;
- neuer Case als normaler Kandidat;
- kompakte Top-K plus zugaengliche Suche;
- `done`/`archived` mit ueberstimmbarem Malus, nie Hard-Exclude;
- keine finale Zuordnung ohne aktives Review-/Automation-Gate.
- keine semantische Wrong-Case-/Wrong-Document- oder
  Dokumentkohaerenz-Behauptung in der aktuellen Baseline.
- keine alleinige LLM-Entscheidung ueber alle Cases; bestaetigte Facts,
  stabile Referenzen, Volltext, Embeddings und Regeln bleiben explizite
  Signalquellen.
