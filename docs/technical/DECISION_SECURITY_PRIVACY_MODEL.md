---
title: "Decision - Security and Privacy Model"
description: "Security- und Privacy-Grundmodell für sensible Dokumente, Vaults, Core Assist, Backup, Export und Recovery"
tags: [decision, security, privacy, encryption, backup, e2ee, zero-knowledge]
lastUpdated: "2026-07-15"
status: "accepted"
owner: "security/product-concept"
---
# Decision - Security and Privacy Model

## Status

Angenommen als verbindliche Baseline. Die konkrete Kryptografie für Cloud
Vault, lokale Daten und Core Assist bleibt ein blockierendes Folge-Gate; dieses
Dokument behauptet keine bereits entschiedene E2EE- oder Zero-Knowledge-Lösung.

## Grundentscheidung

Mappm behandelt Dokumente, Metadaten, OCR-/LLM-Ausgaben, Profile, Credentials,
Suchindizes und Diagnoseinformationen nach ihrem tatsächlichen Schutzbedarf.

- Local Vault ist lokal autoritativ.
- Cloud Vault ist in Mappm Cloud autoritativ; Clients halten nur
  policy-begrenzten Cache und Pending State.
- Core Assist ist eine eigene Processing- und Trust-Grenze. Er ändert den
  Vault-Modus nicht.
- Normale Nutzung verwendet Account-, Session-, Device- und Entitlement-Trust.
- Detached Recovery ist der accountunabhängige Exit für lokale Daten, kein
  versteckter normaler Betriebsmodus.
- Secrets liegen ausschließlich in Secure Storage.
- Keine Implementierung startet, solange ihre Key-, Recovery-, Provider-,
  Retention-, Training-, Lösch- oder AI-Trust-Gates offen sind.

## Datenklassen

| Datenklasse | Beispiele | Mindestregel |
|---|---|---|
| Secrets | Session-/Device-Token, Recovery Keys | nur Secure Storage; nie SQLite, Logs oder Telemetrie |
| Dokumentdateien | Scans, PDFs, Fotos, Ausweise, Arztbriefe | kontrollierter Local- oder Cloud-Storage nach akzeptiertem Key-/Trust-Modell |
| Assist-Daten | Upload-Payload, OCR-Text, Prompts, Modelloutput, Vorschläge | sensible Nutzdaten; minimiert, zweckgebunden, löschbar, nicht für normales Training oder Logging |
| Strukturierte Metadaten | Titel, Datum, Betrag, Status, Zuordnungen | Schutz und Sichtbarkeit nach fachlichem Inhalt, Vault und Berechtigung |
| Hochsensible Daten | Gesundheits-, Ausweis-, Sozialversicherungs-, Steuer- und Versicherungsdaten | minimieren, klassifizieren, maskieren und nur zweckgebunden anzeigen |
| Sync-/Queue-State | Revision, Remote-ID, Tombstone, Pending Operation | robust und auditierbar, aber ohne Secrets oder Dokumentinhalte |
| Diagnose | Fehlerklasse, Komponente, technische Korrelation | inhaltsfrei, redigiert und zeitlich begrenzt |

## Trust Boundaries

**Local Vault:** Dateien und Metadaten sind lokal autoritativ. Temporäre
Managed-Assist-Verarbeitung erzeugt weder stille Cloud-Ablage noch ein
Backup-Versprechen.

**Cloud Vault:** Mappm Cloud ist Authority für Dateien und Metadaten. Managed
Backup, Multi-Device, Offline-Cache, Retention und Recovery sind explizite,
getestete Produktverträge.

**Local Development Cloud:** verwendet dieselben Contract-Familien nur mit
synthetischen Daten, eigenen Secrets und strikt getrennten Umgebungen.

**Core Assist:** Klartextzugriff ist nur innerhalb eines akzeptierten Zwecks,
Providers und Datenpfads zulässig. Retention, Löschung, Redaction,
Observability, Training, Unterauftragsverarbeiter und Nutzerverhalten müssen
vor realen Dokumenten feststehen.

## Commercial-Core-Minimum

- Account-, Session-, Device- und Recovery-Secrets nur in Secure Storage.
- Originale werden vor asynchronem Processing dauerhaft gesichert und gehen
  bei Queue-, Restart- oder Partial-Batch-Fehlern nicht still verloren.
- Logs, Telemetrie und Benachrichtigungen enthalten keine Dokumentinhalte,
  OCR-Texte, privaten Titel, lokalen Dateipfade, Prompts, Tokens oder
  hochsensiblen Identifikatoren.
- Abgelaufene Session, fehlendes Entitlement, Quota, Retention, Netzwerk,
  Storage und Provider-Ausfall sind getrennte, verständliche Zustände.
- Local Export/Restore und Cloud Export/Cloud-to-Local Exit werden getestet.
  Sync allein ist kein Backup-Nachweis.
- Tenant-, Household-, Managed-Subject- und Objektberechtigungen gelten auch
  für Suche, Assist, Export, Support und Diagnose.

## Verschlüsselungs-Gate

Vor der jeweiligen Implementierung werden mindestens entschieden und getestet:

- Verschlüsselung lokaler Dateien und strukturierter Daten;
- Cloud Managed Trust gegenüber Zero Knowledge/E2EE;
- Content Keys, Key Wrapping, Rotation und Gerätewechsel;
- Recovery ohne unkontrollierten Betreiberzugriff;
- Suchbarkeit und Assist-Zugriff unter dem gewählten Kryptomodell;
- Mandantenisolation, Backup-Schlüssel und Löschbarkeit.

Repository-, Storage- und API-Grenzen dürfen keine unnötige
Server-Klartextpflicht festschreiben. Gleichzeitig darf keine E2EE-Zusage
gemacht werden, solange Assist, Suche, Sharing, Recovery und Support damit nicht
nachweislich funktionieren.

## Backup, Export, Kündigung und Löschung

- Local Vault hat keine stille Fremd-Cloud-Sicherung.
- Cloud Backup zeigt Scope, Status, Retention, letzte erfolgreiche Sicherung
  und getesteten Restore wahrheitsgemäß.
- Export bleibt im definierten Kündigungs-, Grace-, Read-only- und Exit-Pfad
  erreichbar.
- Der Nutzer kann von Cloud zu Local wechseln; die Quelle wird erst nach
  verifizierter Zielaktivierung und ausdrücklicher Löschentscheidung entfernt.
- Löschung berücksichtigt Authority, Caches, Queues, Processing-Artefakte,
  Suchindizes, Backups, Tombstones und gesetzliche Aufbewahrung, ohne falsche
  Sofort-Vollständigkeit zu behaupten.

## Verifikation und Stop Rules

Jeder betroffene Implementation Contract enthält Threat Model, Datenfluss,
Missbrauchsfälle, Berechtigungs- und Tenant-Tests, Secret-/Log-Scanning,
Recovery-/Deletion-Nachweise sowie verantwortliche Freigaben.

Stop Rules:

- keine realen Dokumente vor akzeptiertem Trust-/Provider-Gate;
- keine Cloud-Produktionsfreigabe ohne beschlossenes Key- und Recovery-Modell;
- kein Sharing ohne vollständige Authorization- und Revocation-Verträge;
- keine Datenschutz-, E2EE-, Backup- oder Löschzusage ohne prüfbare Evidenz;
- keine Rechtsbehauptung allein aus diesem technischen Dokument.

Maßgeblich ergänzend sind die Vault-, Secure-Storage-, Legal-, AI-,
Observability-, Backup- und Exportkonzepte sowie das aktuelle Regulatory Source
Register.
