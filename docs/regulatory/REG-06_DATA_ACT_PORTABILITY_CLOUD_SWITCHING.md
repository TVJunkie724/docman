---
title: "REG-06 Data Act, Portabilitaet und Cloud Switching"
description: "Datenexport-, Cloud-to-Local-, Providerwechsel- und Offboarding-Vertrag"
tags: [regulatory, data-act, portability, cloud, export]
status: "accepted-governance-needs-legal-review"
owner: "data-architect/privacy/legal"
lastUpdated: "2026-07-15"
jurisdiction: "EU/EEA, Oesterreich"
regulatoryAsOf: "2026-07-15"
sourcesCheckedAt: "2026-07-15"
nextReviewDue: "2026-08-15"
primarySources: ["docs/regulatory/REGULATORY_SOURCE_REGISTER.md"]
legalReviewer: "Legal/Data-Act-Pruefung erforderlich"
---

# REG-06 Data Act, Portabilitaet und Cloud Switching

## Scope

Der Data Act gilt seit 12.09.2025. Ob Mappm Cloud als erfasster
Datenverarbeitungsdienst einzuordnen ist und welche Switching-Pflichten im
Detail gelten, wird rechtlich entschieden. Ab 12.01.2027 entfallen nach dem
Data Act bestimmte Switching Charges. Unabhaengig von dieser Klassifikation
bleiben Portabilitaet und Cloud-to-Local verbindliche Produktanforderungen.

## Produktvertrag

- Local Vault ist lokal autoritativ; Cloud Vault ist cloud-autoritativ mit
  lokalem Cache/Pending State.
- Kuendigung darf den Nutzer nicht in einer Cloud-Sackgasse einschliessen.
- Vor oder nach Entitlement-Ende sind Export, Cloud-to-Local und Loeschung
  gemaess akzeptierter Policy erreichbar; ein begrenzter Cloud-Read-only-
  Zustand darf nur als Uebergang dienen.
- Detached Recovery bleibt accountunabhaengiger Notausgang fuer lokale Daten,
  nicht normaler Betriebsmodus.

## Required Decisions

- Data-Act-Rolle, Scope und betroffene Vertragsparteien.
- exportierbare Daten und Metadaten, offene Formate, Manifest und
  Maschinenlesbarkeit.
- Switching-Prozess, Uebergangszeit, Business Continuity und Support.
- Provider-zu-Provider- und Cloud-to-Local-Mapping mit Provenance.
- Loeschung von Primaerdaten, Cache, Uploads, Backups und abgeleiteten Daten.
- zulaessige Kosten, Vertragskuendigung und Nachweis der vollstaendigen
  Uebergabe.

## Tests und Evidence

- Export/Import auf frischer Installation und unterschiedlichen App-Versionen.
- Cloud-to-Local trotz gekuendigtem/abgelaufenem Entitlement.
- Unterbrechung, Wiederaufnahme, Deduplizierung und Integritaetspruefung.
- nachweisbare Loeschung samt Backup-/Retention-Wirkung.
- Providerwechsel ohne Verlust von Case-, Record-, Link-, Task-, Provenance-
  und Originaldokumentdaten.

## Stop Rules

- Stop, wenn Cloud-, Vertrags- oder Datenmodell Portabilitaet nur als PDF-/ZIP-
  Ablage ohne strukturierte Metadaten vorsieht.
- Stop, wenn Kuendigung Export, Cloud-to-Local oder Loeschung unzulaessig
  blockiert.
- Stop, wenn ein Providerwechsel IDs, Beziehungen, Originale oder Provenance
  still verliert.
