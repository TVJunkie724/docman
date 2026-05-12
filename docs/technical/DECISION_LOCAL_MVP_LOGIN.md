---
title: "Decision - Local MVP Login"
description: "Entscheidung, dass der lokale DocMan-MVP kein Desktop-Login erzwingt, aber Identity-Grenzen fuer spaeter vorbereitet"
tags: [decision, mvp, auth, identity, local-first, mobile-capture]
lastUpdated: "2026-05-06"
status: "accepted"
---

# Decision - Local MVP Login

## Status

Accepted.

## Entscheidung

Der lokale MVP erzwingt kein klassisches Desktop-Login.

DocMan startet im MVP als lokale Einzelhaushalt-App mit einem aktiven lokalen Profil. Mobile Capture wird ueber Device Pairing mit dem Home Hub gekoppelt. Spaetere Identity Provider, Haushaltsmitglieder und Rollen werden architektonisch vorbereitet, aber nicht als MVP-Voraussetzung gebaut.

## MVP

Im MVP gilt:

- ein Haushalt.
- ein aktives lokales Profil.
- Desktop kann ohne Login lokal arbeiten.
- lokale Dokumentenverwaltung ist nicht von Internet, OAuth oder Home Hub abhaengig.
- Mobile Capture nutzt QR Pairing als Primaerflow und manuellen Pairing-Code als Fallback.
- gekoppelte Mobile-Geraete erhalten geraetegebundene Upload-/Session-Tokens.
- Tokens und Pairing-Secrets liegen ausschliesslich in Secure Storage.
- Home Hub kann gekoppelte Geraete widerrufen.

## Nicht MVP

Nicht Teil des MVP:

- Google Login.
- Microsoft Login.
- Passkeys.
- Passwort-/Account-System im Desktop-Core.
- Rollen- und Berechtigungsmodell.
- Familien-/Mehrpersonenverwaltung.
- Cloud-OAuth als Voraussetzung fuer Mobile Capture.

## Vorausplanung

Die Architektur bleibt identity-faehig.

Erlaubte neutrale Begriffe:

- `IdentityProvider`
- `LocalProfile`
- `HouseholdMember`
- `DeviceSession`
- `PairedDevice`
- `AuthSession`

Diese Begriffe duerfen aber nicht bedeuten, dass der MVP bereits ein vollstaendiges Account-System braucht.

Spaeter kann DocMan ergaenzen:

- lokale App-Sperre oder OS-gestuetzte Entsperrung.
- Passkeys.
- Google/Microsoft Identity Provider.
- Haushaltsmitglieder und Rollen.
- Einladungen.
- Account-Linking zwischen Person, Haushalt und Geraeten.

## Produktgrenze

DocMan trennt drei Dinge:

```text
Local Profile
  Zweck: lokale Arbeitsidentitaet und Einstellungen im Einzelhaushalt.

Device Pairing
  Zweck: dieses konkrete Geraet darf zu diesem konkreten Home Hub hochladen.

User Identity
  Zweck: diese Person hat bestimmte Rechte in einem Haushalt.
```

Der MVP braucht Local Profile und Device Pairing. User Identity bleibt spaeter.

## Security-Regeln

- Kein stiller unsicherer Token-Fallback.
- Kein Token in SQLite oder normalen App-Preferences.
- Keine Secrets, Pairing-Codes oder Tokens in Logs.
- Verlust von Secure Storage loescht keine lokalen Dokumente, erzwingt aber Re-Pairing.
- Lokale App-Sperre darf spaeter ergaenzt werden, ist aber nicht dasselbe wie Cloud-Login.

## Konsequenzen

- R4-D1 ist entschieden.
- `DECISION_AUTH_PAIRING.md` bleibt die Detailentscheidung fuer Mobile-/Home-Hub-Pairing.
- F12 Secure Storage muss Pairing-/Session-Secrets abdecken.
- F2/F11/F15/F17 duerfen Auth-Grenzen vorbereiten, aber keinen OAuth-Pflichtpfad einfuehren.

## Nicht entschieden

- ob der MVP eine optionale lokale App-Sperre bekommt.
- ob spaeter zuerst Passkeys, Google oder Microsoft Identity umgesetzt werden.
- wie ein spaeteres Rollenmodell fuer mehrere Haushaltsmitglieder genau aussieht.
