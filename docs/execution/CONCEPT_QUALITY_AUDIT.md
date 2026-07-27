---
title: "Mappm - Concept Quality Audit"
description: "Strenger Playbook-Review von Produkt-, Frontend-, Design-System-, Roadmap- und Readiness-Dokumentation"
tags: [execution, concept-review, quality, playbook]
lastUpdated: "2026-07-22"
status: "reviewed-no-open-documentation-findings"
owner: "ui-concept-review"
---

# Mappm - Concept Quality Audit

## Pruefstandard

Der Review prueft die Dokumentation gegen das eingebettete Playbook, die
projektlokalen Skills und die akzeptierten Mappm-Produktentscheidungen. Geprueft
werden insbesondere:

- Status, Scope, Non-goals, Ownership, Handoff und Stop Rules;
- ein generischer Case statt einer grossen sichtbaren Case-Typauswahl;
- Case-, Record-, Submission-Event-, Dokument- und Beziehungsgrenzen;
- Capture-first, asynchrone Verarbeitung und bestaetigungspflichtiges Routing;
- Account-, Local-/Cloud-Vault-, Core-Assist- und Recovery-Grenzen;
- Security, Privacy, Data Lifecycle, AI Governance und Diagnostik;
- Accessibility, Lokalisierung und Design-System-Coverage;
- Tests, Verifikation, CI/CD, Release, Store und Operations;
- Trennung von Frontend-, Backend- und API/Contract-Ownership;
- C0-C7-Roadmap, R0-R15-Traceability und Phase-as-Implementation-Contract;
- datierte offizielle Quellen und Re-Check-Gates fuer regulatorische Aussagen.

## Befunde Und Behebung

| ID | Bereich | Befund | Prioritaet | Behebung / Status |
|---|---|---|---|---|
| CQA-001 | F-Konzepte | Mappm-F-Nummern sind nicht mit generischen Playbook-Nummern gleichzusetzen. | P1 | Behoben durch Coverage-/Quality-Matrix, explizite Owner und gemeinsame Quality-Contracts. |
| CQA-002 | Design System | MP-DS-04 bis MP-DS-07 und mehrere Form-/Produktmuster waren nur im HTML-Mock sichtbar. | P1 | Behoben durch normative MP-DS-Konzepte, Coverage-Matrix und Mock-Evidenzzuordnung. |
| CQA-003 | Regulatory | Detaillierte, datierte und primaere EU-/AT-/Store-Quellen fehlten beziehungsweise waren nicht aktuell. | P1 | Behoben durch REG-00 bis REG-08 und `REGULATORY_SOURCE_REGISTER.md`, Stand 2026-07-15. Betroffene Phasen muessen weiterhin zum Stichtag neu pruefen. |
| CQA-004 | Security/Data/AI/Ops/Commercial | Umbrellas hatten keine vollstaendige projektlokale Unterstruktur. | P1 | Behoben durch SEC-, DATA-, AI-, OPS- und COM-Familien. |
| CQA-005 | Roadmap | Setup-Gates, Product Gates und bestehende R-Slices waren nicht eindeutig verbunden. | P1 | Behoben durch C0-C7 als steuernde Gates, R0-R15 als Traceability-/Slice-IDs und die Standard-/Conditional-Matrizen. |
| CQA-006 | Phase Readiness | Ein vorhandener Roadmap-Eintrag konnte als Implementierungsfreigabe missverstanden werden. | P0 | Behoben: Jede Umsetzung benoetigt einen detaillierten, geprueften Implementation Contract und die dort genannten offenen Entscheidungen muessen geschlossen sein. R3.5 bleibt lediglich freigabefaehiger Foundation-Kandidat. |
| CQA-007 | CI/CD | CI/CD war geplant, aber noch nicht als umgesetzter Workflow vorhanden; Legacy-Analyzer-Schulden duerfen kein falsches Gruen erzeugen. | P1 | In F16, OPS-07, R3/R10 und R3.5 sauber geplant. Die Umsetzung bleibt eine spaetere freizugebende Phase, kein Dokumentationsbefund. |
| CQA-008 | Mock-Evidenz | Form-, Locale-, Permission-, Review-, Responsive- und A11y-Zustaende waren unvollstaendig zugeordnet. | P1 | Behoben in Mock, Mock-README, MP-DS-Coverage und Design-System-Coverage-Review. |
| CQA-009 | Skills | Mehrere referenzierte Execution-, Error- und Testrollen fehlten projektlokal oder enthielten alte Produktannahmen. | P1 | Behoben; Skills existieren, verwenden Mappm-Grenzen und stimmen mit den aktuellen Agent-/Handoff-Regeln ueberein. |
| CQA-010 | Tracker | Historische Ordna-/Milestone-Namen und Owner-Grenzen konnten aktuelle Planung vortaeuschen. | P1 | Aktuelle Roadmap kennzeichnet historische Tracker-Artefakte als Traceability; neue Issues muessen die projektlokale GitHub-Issue-Governance befolgen. |
| CQA-011 | Repository Layout | Die reale Root-Flutter-Struktur wich ohne dokumentierte Anpassung vom generischen Playbook ab. | P2 | Behoben durch `DECISION_REPOSITORY_LAYOUT.md`. |
| CQA-012 | Quality Contract | Konzepte und Saeulen hatten keine einheitliche Mindestqualitaet und Autorisierungsgrenze. | P1 | Behoben durch Enterprise-Quality-Contracts und explizite Adoption. |
| CQA-013 | Produktmodell | Local-first/Home-Hub/Draft-Inbox-Annahmen widersprachen dem aktuellen Account-, Vault-, Assist- und Capture-Modell. | P0 | Behoben: Normalbetrieb ist accountbasiert; Local Vault bleibt lokal autoritativ, Cloud Vault cloud-autoritativ; Core Assist ist Pflicht; Detached Recovery bleibt Exit; Home Hub ist nur historische/abgelehnte Spur. |
| CQA-014 | Case-/Dokumentmodell | Grosse Case-Typkataloge und historische Discovery-Keys konnten als Zielmodell gelesen werden. | P0 | Behoben und am 2026-07-24 konsolidiert: ein generischer stets gueltiger Case ohne Dokumentpflicht, optionale Muster/Vorlagen, getrennte Records, Events und normalisierte Dokumentachsen; keine Claim-Entitaet. OQ-011 bleibt fuer den finalen Katalog offen, OQ-014 nur fuer den erneuten Accident-/Damage-Familienreview. |
| CQA-015 | Capture/DMS | `InboxItem` und kombinierte Dokumente konnten als Ziel-Domainmodell gelesen werden. | P0 | Behoben: `CaptureSession`, `DocumentUnit`, `PageManifest` und `ReviewProposal`; ein logisches Dokument pro abgeschlossener Scan-Einheit, mehrere Seiten erlaubt. |
| CQA-016 | Sprache | Mehrere normative UI-/Design-System-/Pillar-Bloecke waren entgegen der Sprachregel englisch. | P2 | Behoben; stabile IDs, Artefaktnamen und technische Begriffe duerfen englisch bleiben. |
| CQA-017 | Backend/Contract | Der vorlaeufig akzeptierte Backend-Rahmen konnte als Freigabe konkreter DTOs/Endpoints gelesen werden. | P0 | Behoben: Architektur und Ownership sind `accepted-provisional`; jeder konkrete Contract benoetigt weiterhin eigene API-/Backend-Planung und Verifikation. |
| CQA-018 | Ownership | 49 bestehende Dokumente besassen keinen expliziten Frontmatter-Owner. | P1 | Behoben: Alle im Audit erfassten Mappm-Dokumente besitzen `title`, `description`, `status`, `lastUpdated` und `owner`; alle projektlokalen Skills besitzen eindeutiges `name`-/`description`-Frontmatter. |
| CQA-019 | Inventar/Navigation | Technische Decisions, Discovery-Artefakte und mehrere Governance-Unterfamilien waren nicht vollstaendig ueber einen Owner-Index auffindbar. | P1 | Behoben durch Technical Decision Index, Discovery Index, Pillar-Tombstone-Indexierung und explizite REG-/SEC-/DATA-/AI-/OPS-/COM-Artefaktindizes. |
| CQA-020 | Case-Familien-Ownership | Die Aussage „ein Subkonzept je Case-Familie“ war nicht als SSOT-, Coverage- und Promotion-Gate umgesetzt; dadurch haetten Katalogzeilen ohne vollstaendiges Fachmodell in Phasen oder Contracts gelangen koennen. | P0 | Behoben am 2026-07-21: Die zentrale Katalog-SSOT besitzt den verbindlichen Case-Familien-Subkonzeptvertrag, Pflichtinhalt, Reifegrad-Gate und aktuelle Coverage. Medical sowie Unfall/Schaden sind abgedeckt; weitere Familien bleiben bis zu ihrem eigenen reviewed Owning Subkonzept nicht fachlich akzeptiert oder implementierungsbereit. |
| CQA-021 | Workshop/User-Freigabe | Der Subkonzeptvertrag verlangte eine Decision-Datei bereits zu Beginn eines Case-Familienworkshops und konnte dadurch unbesprochene Agent-Vorschlaege vorschnell persistieren. | P0 | Behoben am 2026-07-21: Case-Familien bleiben bis zum vollstaendigen Chat-Abgleich und ausdruecklicher User-Freigabe diskussions-only; erst danach entsteht genau ein Owning Subkonzept samt Coverage. |
| CQA-022 | Dokument-Subtypen | „Minimal ausreichend“ wurde in Discovery und Medical-Beispielen teilweise als Vermutung gegen Subtypen formuliert. | P0 | Behoben und am 2026-07-24 bestaetigt: Subtypen sind normaler Modellbestandteil; Produktwert entscheidet ohne Anzahl-Minimierungsziel. Das Prinzip gilt dauerhaft, Typen wachsen case-family-weise; `repair_invoice` ist verworfen, `medical_invoice` als produktrelevante Variante akzeptiert. |
| CQA-023 | Unfall-/Schadenmodell und Capture-Baseline | Unfallkosten, medizinische Unfallfolgen, Versicherungsabwicklung/Polizzen und optionale bekannte Capture-Angaben waren noch nicht als ein Fachmodell verankert. | P0 | Baseline am 2026-07-21 dokumentiert und am 2026-07-22 vereinfacht: normale `insurance_settlement`-Cases, wiederholbare Submission Events, optionale Damage-Cost-Cases, benannte Bildsammlung, kein Claim-Modell. OQ-014 verlangt den erneuten Familienreview vor Implementation. |
| CQA-024 | Claim-Doppelmodell | Claim war neben Case, Branch, Event, Fact und Record ein zweites Matching-/Arbeitsobjekt und haette manuelle Pflege sowie parallele Repositories erzwungen. | P0 | Behoben am 2026-07-22: keine Claim-Entitaet und kein Claim-Matching. Versicherungsabwicklung ist ein normaler Case, Einreichung/Nachreichung ein Event, externe Nummer ein Fact und Polizze ein Record. Roadmap, Skills, Decisions, Pillars und Discovery wurden synchronisiert. |

## Review-Ergebnis

Im Dokumentationsbestand sind nach diesem Durchlauf keine offenen
Konsistenzbefunde bekannt. Das bedeutet ausdruecklich nicht, dass alle
Produktentscheidungen geschlossen oder Implementierungsphasen freigegeben sind.
Das `docs/discovery/OPEN_QUESTIONS_REGISTER.md` bleibt die einzige Statusquelle
fuer offene Fragen; insbesondere VC-01 bis VC-08, der verbleibende
Austria-first-Scope in WF-01/WF-02, die post-oesterreichische Expansion in
WF-03 sowie OQ-009 bis OQ-011 muessen vor ihren jeweiligen Gates beantwortet
werden. OQ-013 blockiert ausschliesslich noch nicht freigegebene
Cross-Device-Capture-Komfortpfade.

Jede spaetere Phase muss weiterhin konkret referenzieren:

- akzeptierte Produkt- und technische Decisions;
- betroffene F- und MP-DS-Konzepte samt Mock-Evidenz;
- anwendbare REG-/SEC-/DATA-/AI-/OPS-/COM-Dokumente;
- relevante offene Fragen und deren Stop-/Re-Check-Trigger;
- Fake-Repository- und Microcks-Grenzen, sofern betroffen;
- exakte Tests, Evidenz, Rollback, Handoff und Definition of Done.

## Stop Rules

- Stop, wenn eine Phase pauschal behauptet, die Konzepte seien fertig, ohne
  ihre exakten Owner-Artefakte zu nennen.
- Stop, wenn ein UI-Slice nur Form-Family oder Mock referenziert, aber die
  relevanten MP-DS-/F-Konzept- und Accessibility-Gates auslaesst.
- Stop, wenn deferred Store-, CI/CD-, Security-, Privacy-, Data-Lifecycle-,
  AI-, Sync-, Backup-, Support-, Commercial- oder Release-Arbeit aus der
  Roadmap entfernt wird.
- Stop, wenn offene Produkt- oder Rechtsfragen implizit in Code, Contract,
  Country Pack, UI-Text oder Marketingversprechen beantwortet werden.
- Stop, wenn dieser Audit als Implementierungsfreigabe verwendet wird.
