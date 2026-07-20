---
title: "Decision - Import Duplicate Detection"
description: "Vault-konforme Dublettenerkennung für Mobile Capture und Desktop Import"
tags: [decision, import, duplicate-detection, hash, processing, desktop, mobile-capture]
lastUpdated: "2026-07-20"
status: "accepted"
owner: "data-architect/product-concept"
---
# Decision - Import Duplicate Detection

## Status

Angenommen. Hash-Gleichheit ist ein technisches Signal, kein fachliches Urteil.

## Entscheidung

Für dauerhaft gesicherte Capture-/Importartefakte wird ein kryptografisch
geeigneter Inhalts-Hash berechnet. Ein identischer Treffer erzeugt keinen
stillen Abbruch, kein automatisches Merge und keine automatische Löschung.

Die Nutzerin kann mindestens:

- das bestehende Dokument öffnen;
- beide Dokumente bewusst behalten;
- den neuen Eingang sicher verwerfen.

Die konkrete Darstellung wird im UI-Contract entschieden. Die Sprache macht
deutlich, dass es sich um ein mögliches bereits vorhandenes Dokument handelt.

## Vault- und Queue-Regeln

- Local Vault vergleicht gegen seine autoritativen lokalen Artefakte.
- Cloud Vault vergleicht serverseitig gegen autoritative Cloud-Artefakte; ein
  Offline-Cache darf keine vollständige Dublettenfreiheit behaupten.
- Ein mobiler Queue-Eintrag bleibt erhalten, bis Behalten, verifizierte
  bestehende Ablage oder sichere Verwerfung bestätigt ist.
- Mehrere Dokumente mit gleichem Hash bleiben erlaubt, etwa bei bewusst
  getrennter Evidenz oder Kontextzuordnung.
- Idempotency Keys und Upload-Hash verhindern technische Mehrfachanlage durch
  Retry, ersetzen aber nicht die fachliche Dublettenentscheidung.

## Medienarchive

Ein durch die case-lokale medizinische Desktop-Aktion aus einem
Speichermedium/Ordner erzeugtes ZIP besitzt:

- einen Hash des dauerhaft gespeicherten ZIP fuer Byte-Integritaet und
  bytegleichen Re-Export;
- eine normalisierte Manifest-Identitaet aus relativen Pfaden, Dateigroessen
  und Dateiinhalt-Hashes fuer Dublettensignale.

Die Manifest-Identitaet ist erforderlich, weil ZIP-Container-Metadaten bei zwei
Importen desselben Dateibaums unterschiedlich sein koennen. Auch ein identischer
Manifesttreffer erzeugt nur einen pruefbaren Dublettenvorschlag, niemals
automatisches Merge oder Loeschen. Dateinamen und Manifestwerte sind sensibel
und duerfen nicht in Logs oder Telemetry erscheinen.

## Spätere Erweiterungen

Ähnlichkeits-, OCR-, Versions- und Merge-Vorschläge benötigen eigene
Qualitäts-, Privacy- und Undo-Gates. Sie dürfen nie allein aufgrund eines
Modells Originale löschen oder Dokumentidentitäten verschmelzen.

## Verifikation

Tests decken identischen Inhalt mit gleichem und anderem Dateinamen, bewusste
Doppelablage, Retry/Idempotenz, mehrere Treffer, unvollständigen Cloud-
Offline-Cache, Partial Batch, Verwerfen und Öffnen des bestehenden Kontexts ab.
Fuer Medienarchive kommen gleicher Dateibaum mit abweichenden ZIP-Metadaten,
veraenderter Einzeldatei, Pfadkollision und Manifestfehler hinzu.
