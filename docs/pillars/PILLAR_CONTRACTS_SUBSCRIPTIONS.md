---
title: "Produkt-Säule - Contracts and Subscriptions"
description: "Produktbereich fuer Vertraege, Abos, wiederkehrende Rechnungen, Laufzeiten, Kuendigungen, Reminder und schlanke Rechnungsverlaeufe"
tags: [pillar, contracts, subscriptions, records, invoices, reminders, insights]
lastUpdated: "2026-07-15"
version: "0.1"
status: "accepted-direction"
owner: "product-concept"
---

# Produkt-Säule - Contracts and Subscriptions

## Zweck

Mappm hält laufende Verträge und Abos als verständlichen Produktkontext fest,
ordnet wiederkehrende Rechnungen zu und macht nur den nächsten relevanten
Handlungszeitpunkt sichtbar.

## Kernmodell

- Vertrag/Abo ist eine langlebige Unterlage (`Record`).
- Ein ruhiger Vertragsbereich verbindet Versionen, Rechnungen, Facts, Timeline,
  Tasks, Reminder und Workflow-Phasen.
- Abschluss, Aktivierung, normale Änderung, Preisprüfung, Kündigung und
  Endabrechnung bleiben im selben Kontext.
- Ein eigenständiger Streit kann als normaler Case verknüpft werden.
- Monatliche, quartalsweise, jährliche und benutzerdefinierte Abrechnung werden
  gleichwertig unterstützt.

## Capture und Review

Bereits die erste aussagekräftige Rechnung darf einen bestehenden Vertrag
matchen oder die Anlage eines Vertrags/Abo-Kontexts vorschlagen. Wiederholung
ist ein zusätzliches Erkennungssignal, keine Voraussetzung. Der Review zeigt
nur relevante Aktionen und lässt Zuordnung, Profil, Rechnungsperiode und Rolle
korrigieren.

## UX

Die Vertragsansicht bleibt schlank:

- aktuelle Kerndaten;
- relevante Dokumente und Timeline;
- nächster Termin/Task;
- bei mehreren bestätigten Rechnungen optional ein kleiner Rechnungsverlauf;
- Hover, Tap und Tastaturfokus für Punktwerte;
- kein Accounting-Dashboard.

Normative Details:
`docs/technical/DECISION_RECURRING_CONTRACT_SUBSCRIPTION_MODEL.md`.

## Abgrenzung

- Tasks/Reminder liegen in `PILLAR_TASKS_REMINDERS_QUICK_ACCESS.md`.
- bestätigte Financial Entries und deduplizierte Roll-ups liegen in
  `PILLAR_SEARCH_FACTS_INSIGHTS.md`.
- Länder-/Institutionsregeln liegen in `PILLAR_TEMPLATES_WORKFLOWS.md`.
- Mappm-Billing/Entitlements sind ein anderes Produktproblem und liegen in COM
  sowie Account/Cloud/Identity.

## Release-Slices

| Slice | Scope | Exit Evidence |
|---|---|---|
| C3 / R8.9 Foundation | langlebiger Contract/Subscription-Record, beliebige Cadence, erste Invoice-Zuordnung, bestätigte Kernfacts, relevante Task-/Reminder-Links | Domain-/Fake-Tests für monatlich, quartalsweise, jährlich und custom; erste Rechnung kann Kontext anlegen; kein Invoice-per-Case |
| R8.10 Contextual Insight | ein Wert als Zeile, mehrere bestätigte vergleichbare Perioden als optionaler barrierearmer Mini-Chart | Desktop/Mobile/Keyboard/Semantics-Evidence; variable Rechnung heißt nicht Preisänderung |
| R9 Assist Routing | reviewbare Erkennung und provisorische Folgerouting-Regel mit Undo, Duplicate-/Post-Termination-/Material-Change-Rückfall in Review | Provider-/Widget-/Privacy-Tests mit synthetischen Rechnungen und Fehlklassifikation |
| R13 Notifications | ruhige und benachrichtigende Fristerinnerungen mit Offset, Kanal und Quiet Hours | Permission-, denied-, offline-, privacy-safe copy- und no-noise Tests |
| C5 Release Gate | aktivierte Kategorien und Länderregeln sind versioniert, source-backed, supportbar und in Store/Legal/Privacy-Scope enthalten | datierter Product/Legal/Compliance/QA Review |

## Dependencies und offene Entscheidungen

- Die ersten aktivierten Vertragskategorien sind Phase-/Commercial-Scope.
- Kündigungsfrist, Verlängerung und Verbraucherrechte kommen ausschließlich aus
  freigegebenen Länder-/Providerdefinitionen oder bestätigten Dokumentfacts.
- Record/Document/CaseLink/Task/FinancialEntry-Persistenz gehört zum Data Owner.
- Cloud-/Assist-Verarbeitung braucht die akzeptierten VC-/AI-/Privacy-Gates.
- Mappm-Entitlement/Billing darf nicht mit dem verwalteten Nutzervertrag
  vermischt werden.

## Security, Accessibility und Verification

- Vertragsnummern, Kontaktdaten, Preise, Rechnungen und Kündigungsinformationen
  sind sensible Daten und bleiben aus Logs, unredigierten Notifications und
  Produktionsfixtures.
- Beträge, Termine, Status und Chartpunkte besitzen Text-/Semantik-Alternativen;
  Hover hat Tap-/Focus-Parität und Farbe ist nie alleiniger Informationsträger.
- Tests decken erste/mehrere Rechnung, wechselnde Cadence, Duplikat,
  Preis-/Gesamtrechnungs-Unterscheidung, Kündigung, Endabrechnung, fehlende
  Notification-Berechtigung, Undo und Offline-/Assist-Fallback ab.
- Kein Slice gilt als verifiziert, wenn nur ein Happy-Path-Chart oder eine
  statische Mock-Karte gezeigt wird.

## Stop Rules und Handoff

Stop, wenn:

- jede Rechnung einen eigenen Case erzeugt;
- Abschluss, Änderung oder Kündigung ohne eigenständiges Ziel fragmentiert wird;
- monatliche Abrechnung als Default-Wahrheit angenommen wird;
- unbestätigte Beträge/Fristen/Preisänderungen automatisiert final werden;
- ein einzelner Wert ein Diagramm erzeugt oder Accounting-/Forecast-Scope
  eingeschlichen wird;
- Länder-/Kündigungsrecht, Backend-Contract oder Persistence im Frontend
  erfunden wird.

Product-/UX-Slices gehen über `ui-concept-review` und eine freigegebene Phase an
`ui-architect`. Persistenz geht an `data-architect`, Cloud-/Assist-Contracts an
`contract-api`, Tests/Gates an `frontend-test-coverage` und
`quality-readiness`.

## Enterprise Quality Contract

Diese Saeule uebernimmt
`docs/execution/PILLAR_ENTERPRISE_QUALITY_CONTRACT.md`. Ihre Milestone-Slices
und Domaenengrenzen bleiben massgeblich. Der gemeinsame Vertrag liefert
verbindliche Anforderungen fuer getrennte Ownership, Phase Slicing,
Security/Privacy, Accessibility/Lokalisierung, Verifikation, Stop Rules und
Handoff. Die Saeule allein autorisiert niemals eine Implementierung.
