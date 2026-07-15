---
title: "REG-08 Store- und Plattform-Compliance"
description: "Releasevertrag fuer Stores, Direktdistribution, Signing, Privacy, Billing und Review"
tags: [regulatory, store, platform, distribution, signing, billing]
status: "accepted-governance-needs-release-review"
owner: "release/platform/legal"
lastUpdated: "2026-07-15"
jurisdiction: "EU/EEA, Oesterreich; je aktiviertem Store-Markt"
regulatoryAsOf: "2026-07-15"
sourcesCheckedAt: "2026-07-15"
nextReviewDue: "vor erstem Submission Build, spaetestens 2026-08-15"
primarySources: ["docs/regulatory/REGULATORY_SOURCE_REGISTER.md"]
legalReviewer: "Legal/Release-/Store-Pruefung erforderlich"
---

# REG-08 Store- und Plattform-Compliance

## Scope

Jeder aktivierte Kanal besitzt einen eigenen datierten Release-Check. Regeln
fuer Apple App Store, Google Play, Microsoft Store und signierte
Desktop-Direktdownloads werden nicht verallgemeinert. Regionale Billing- und
External-Purchase-Programme werden erst nach aktueller Enrollment-/Policy-
Pruefung genutzt.

## Kanalvertrag

Pro App-Instanz, Plattform und Kanal werden erfasst:

- Store-/Developer-Account, Rechtstraeger und Rollen.
- Bundle-/Package-ID, Signing, Certificates, Entitlements und Secrets.
- App-Name, Icons, Screenshots, Altersrating, Regionen und Lokalisierung.
- Permissions, Zwecktexte, Privacy Manifest/Labels oder Data Safety.
- Accountanlage/-loeschung, Web-Deletionspfad und Datenfolgen.
- Billingmodell, Store Purchase, Alternative Billing, Restore, Trial,
  Subscription Lifecycle, Refund und Entitlement-Quelle.
- Review Account, synthetischer Vault, Backend-Erreichbarkeit und Review Notes.
- staged rollout, minimum version, update, rollback, delisting und End-of-Life.

## Am 15.07.2026 bestaetigte Mindestregeln

- Apple: accountbasierte Funktionen benoetigen Review-Zugang; bei
  Accountanlage ist In-App-Accountloeschung erforderlich; Privacy-Angaben
  umfassen auch integrierte Drittanbieter-SDKs.
- Google Play: Data Safety und Privacy Policy muessen reale Datenverarbeitung
  inklusive SDKs abbilden; bei Accountanlage sind In-App-Loeschpfad und
  Webressource erforderlich; Cloud-/Digital-Service-Payments unterliegen den
  aktuellen regions-/programmabhaengigen Payments Rules.
- Microsoft Store: nur bei aktiviertem Kanal; gepruefte Policy-Version 7.19
  (wirksam 14.10.2025) wird vor Submission gegen die dann aktuelle Version
  ersetzt.
- Direktdownload: Signing, Notarisierung/Plattformreputation, sicherer
  Installer, Update, Rollback und Support bleiben vollstaendige Releasepflicht.

## Tests und Evidence

- Clean Install, Upgrade, Rollback und Uninstall auf jeder Zielplattform.
- Permission denied, offline, Providerausfall und Minimum-Version-Sperre.
- Accountloeschung, Store-/Backend-Entitlement-Abgleich und Restore Purchase.
- Trial/Paid/Grace/Cancelled/Refunded/Reactivated sowie Export/Cloud-to-Local.
- Store-Deklarationen automatisiert/manuell gegen Datenfluss und Build
  abgeglichen.
- Review-Szenario ausschliesslich mit synthetischen Daten.

## Stop Rules

- Stop ohne am Submission-Tag aktualisierte Storequelle, Region,
  Programmstatus und Reviewer.
- Stop bei falschen IDs, Icons, Permissions, Privacy-/Data-Safety-Angaben oder
  nicht reproduzierbarem Signing.
- Stop, wenn Review echte Kundendaten oder informell geteilte Secrets braucht.
- Stop, wenn Store- und Backend-Entitlement widersprechen oder Kuendigung den
  Exit-/Deletion-Pfad blockiert.
