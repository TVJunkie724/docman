---
title: "Konzept F8 - Distribution and Store Readiness"
description: "Distribution, Signing, Store, Entitlement, Review Access und Update-Readiness fuer verkaufte Mappm-Modi"
tags: [concept, distribution, app-store, mobile, desktop, cloud, entitlements]
lastUpdated: "2026-07-15"
version: "5.0"
status: "accepted"
owner: "release/legal/product"
---

# Konzept F8 - Distribution and Store Readiness

## Zweck

F8 definiert Release- und Store-Gates fuer alle verkauften Local-/Cloud-Modi.
Direktdownload, private Beta oder Local Vault sind keine Ausnahme von
Security-, Privacy-, Consumer-, Lizenz-, Update- und Support-Readiness.

## Distributionskanaele

Jeder aktivierte Kanal besitzt einen eigenen, datierten Plan fuer:

- Apple App Store/TestFlight.
- Google Play/Internal Testing.
- Microsoft Store, falls aktiviert.
- signierte/notarisierte Desktop-Direktdownloads.
- interne Development-/Staging-Builds.

Der Kanalplan nennt Plattform, App-Instanz, Bundle/Package-ID, Signing,
Entitlements/Permissions, Updatepfad, Billing/Subscription, Review Access,
Support, Rollback und Owner.

## Verbindliche Gates

- reproduzierbarer Build aus versionierter Quelle.
- Signing, Notarization und sichere Secretverwaltung.
- korrekte App-ID, Icons, Privacy-/Permission-Texte und Store-Metadaten pro
  Instanz.
- aktueller Store-Policy- und regulatorischer Quellencheck.
- Lizenz-/Third-party-Notices und SBOM/Supply-Chain-Nachweis.
- Upgrade-/Migration-/Rollback-/Minimum-Version-Strategie.
- synthetischer Review-Account/Vault und reproduzierbares Review-Szenario.
- Entitlement, Trial, Kauf, Restore Purchase, Kuendigung, Grace, Export,
  Cloud-to-Local und Loeschung gemaess aktivem Geschaeftsmodell.
- Support-, Incident-, Datenschutz- und Deletion-Kontakt.

## Store und Subscription

Ob In-App Purchase, externer Kauf oder Direktlizenzierung zulaessig ist, wird
vor jedem Release anhand der **aktuellen** Regeln des konkreten Stores und
Markts geprueft. F8 legt keinen Zahlungsanbieter und keine Preisstruktur fest.

Ein abgelaufenes Entitlement darf Datenportabilitaet, erforderlichen Zugriff,
Export, Cloud-to-Local oder Loeschung nicht unzulaessig blockieren. Kaufstatus,
Mappm-Subscription und verwaltete Nutzervertraege bleiben getrennte Modelle.

## Review Access

- ausschliesslich synthetische Personen, Dokumente, Vaults und Cases.
- keine anonymisierten echten Haushaltsdokumente.
- aktivierte Features, Regionen und Entitlements sind reproduzierbar.
- Review kann kritische Offline-, Capture-, Assist-, Export- und
  Kuendigungsflows pruefen.
- Review-Credentials sind zeitlich/umgebungsbezogen, sicher verteilt und nach
  Abschluss widerrufbar.

## Datierte Compliance-Regel

Store-, Betriebssystem-, Signing-, Privacy- und Billing-Regeln sind volatil.
Jeder Release-Check dokumentiert Datum, Version/Region, Primaerquelle,
Applicability, Ergebnis, Owner und naechstes Reviewdatum. Die verbindliche
Regulatory-Struktur liegt unter `docs/regulatory/`, insbesondere REG-08 und dem
Source Register.

## Tests und Verifikation

- Clean Build/Install/Upgrade/Uninstall auf jeder aktivierten Plattform.
- Signing-/Notarization-/Store-Paketpruefung.
- Permission denied, offline, trial/paid/grace/cancel/reactivate und Restore
  Purchase.
- Review-Account und synthetischer Demo-Vault.
- Export/Migration/Delete nach Entitlement-Ende.
- Update/Rollback mit Datenmigration und Quellenerhalt.
- Store-/Privacy-Metadaten gegen tatsaechliches Verhalten.

## Stop Rules

Stop, wenn der Policy-Check nicht aktuell/datiert ist, eine Instanz falsche
IDs/Icons/Permissions nutzt, Review echte Daten benoetigt, Signing-/Update-
Secrets unsicher sind oder Kuendigung/Entitlement den Exit-Pfad blockiert.

## Handoff

Release-/CI-Evidence an `quality-readiness`; Store/Legal an die zustaendigen
Legal-/Release-Owner; UI-Flows an `ui-architect` nach akzeptiertem Phaseplan.

## Enterprise Quality Contract

Dieses Konzept uebernimmt
`docs/execution/CONCEPT_ENTERPRISE_QUALITY_CONTRACT.md`. Bei Widerspruechen gilt
die strengere Regel und die Phase stoppt.
