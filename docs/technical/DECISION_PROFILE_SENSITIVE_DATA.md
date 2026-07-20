---
title: "Decision - Profile Sensitive Data"
description: "Schutzklassen und Datenmodell für verwaltete Personen, Organisationen, Versicherungen, Adressen und Identity-Anbindung"
tags: [decision, profiles, managed-subjects, sensitive-data, insurance, identity, privacy, id-austria]
lastUpdated: "2026-07-20"
status: "accepted"
owner: "security/product-concept"
---
# Decision - Profile Sensitive Data

## Status

Angenommen. Dieses Dokument klassifiziert Produktdaten nach Schutzbedarf; es
ersetzt keine datierte Rechtsprüfung und legt keine konkrete Kryptografie fest.

## Entscheidung

Managed Subjects beantworten fachlich, wen Dokument, Case, Record, Aufgabe,
Fact oder Claim betrifft. Ein Subject kann eine Person oder eigene Organisation
sein, ohne zwingend einen Login zu besitzen.

Mappm trennt mindestens:

- **Core Profile Data** für Zuordnung und alltägliche UI;
- **Sensitive Profile Data** für konkrete fachliche Kontexte;
- **Highly Sensitive Profile Data** mit restriktiver Anzeige, Suche, Export,
  Logging und Verarbeitung;
- **External Identity Data** für Account/eID-Verknüpfung.

Diese Klassen sind technische Risikokategorien. Rechtliche Kategorien und
Pflichten werden im Regulatory Source Register und im betroffenen
Implementation Contract aktuell geprüft.

## Datenklassen

| Klasse | Beispiele | Mindestregel |
|---|---|---|
| Core | interner Identifier, Anzeigename, Subject-Art, Verwaltungs-/Identity-Status | nur soweit für Zuordnung, Filter und UI nötig |
| Personal | rechtlicher Name, Geburtsdatum, Staatsangehörigkeit | kontextbezogen anzeigen, minimieren und berechtigen |
| Adresse | aktuelle/frühere Adresse, Meldeinformation | nicht in normalen Logs, Push-Texten oder unbewusstem Export |
| Government Identity | Pass-/Ausweisreferenz, amtliche Nachweise, eID-Verknüpfung | hochsensibel; maskierte, zweckgebundene UI und gesonderte Zugriffstests |
| Versicherung/Gesundheit | Träger, Status, Mitglieds-/Polizzennummer, Beziehungen | hochsensibel; strukturierte Beziehungen/Records, keine freie Profilliste |
| Business | Firmenidentifikatoren, Steuer-/Vertragskontext | strikt von Privatkontext getrennt und länderabhängig |
| Account/Identity | Login-Identifier, Provider-Referenz, verifizierte Attribute | Auth-/Identity-Schicht, nicht allgemeines Kontaktfeld |

Telefonnummer und E-Mail externer Ärzte, Anbieter oder Stellen gehören zu
`ExternalParty`. E-Mail eines Managed Subject wird nur dann Profilbestandteil,
wenn sie für Account/Identity oder einen ausdrücklich aktivierten Kontakt-Scope
benötigt wird. Telefonnummer ist kein verpflichtendes Core-Profilfeld.

## Feste Felder und Profil-Facts

Nur häufig benötigte, stabile Felder werden fest modelliert. Weitere Werte
verwenden typisierte `ProfileFact`s mit Sensitivität, Gültigkeit, Provenienz,
Bestätigungsstatus und optionaler Evidenz durch Dokument/Record. Ein freies
`metadata`-Objekt ist nicht die primäre Ablage für kritische Identifikatoren.

Ein Fakt darf ohne Nachweis manuell bestehen; eine Dokumentverknüpfung erhöht
die Nachvollziehbarkeit, ist aber kein eigener Werttyp. Extrahierte Werte
bleiben Vorschläge, bis die aktuelle Automatisierungsreife sie akzeptieren darf.

## Versicherungsbeziehungen

Eine Person kann mehrere gesetzliche/staatliche und private Versicherungen
gleichzeitig oder historisch besitzen. Daher werden Mitgliedschaften
strukturiert mit Art, Provider, optionalem Identifikator, Gültigkeit und
verknüpftem Record modelliert.

Die Polizze bleibt ein Record. Pro Managed Subject darf hoechstens eine
ausdruecklich gewaehlte Praeferenz fuer Sozialversicherung/Krankenfuersorge,
ambulante Zusatzversicherung und stationaere Zusatzversicherung bestehen.
Weitere Versicherungen bleiben sichtbar und auswaehlbar; historische
Beziehungen bleiben nachvollziehbar.

Eine solche Praeferenz sortiert Vorschlaege, beweist aber weder Deckung,
Zustaendigkeit noch Anspruch. Medizinische oder Erstattungs-Workflows duerfen
den bestaetigten Default zuerst anbieten, ohne Polizzen in Cases zu kopieren,
vorab einen festen Erstattungsweg abzufragen, automatisch einen Claim
anzulegen oder eine Einreichung auszufuehren.

Mappm loest keine Versicherungsbedingungen oder Polizzenformeln auf und
berechnet keine erwartete Erstattung, Deckung oder sonstige
Versicherungsleistung. Nur bestaetigte Werte aus Dokumenten duerfen gespeichert
und kontextuell zusammengefasst werden. Besondere vertragliche Leistungen
werden fuer M1 nicht als Medical-Sonderfaelle ausmodelliert.

## Identity und eID

Fachliches Profil, Account/Login, Management Grant und Schlüsselzugriff sind
getrennte Achsen. Ein verwaltetes Profil kann später eine Identity erhalten,
ohne Datenkopie oder automatischen Entzug bestehender Verwaltung.

ID Austria ist ein zu prüfender österreichischer Provider hinter einer
austauschbaren `TrustedIdentityProvider`-Grenze. eIDAS-/EUDI-Anschlussfähigkeit
und der aktuelle rechtliche/technische Status werden vor jeder Umsetzung aus
offiziellen Quellen neu geprüft. eID beweist nicht automatisch Datenzugriff;
Authorization und Key Management bleiben separat.

## UX und Processing

- Capture verlangt keine Profilwahl vor dem Scan.
- Core Assist schlägt das Managed Subject vor.
- Klare, folgenarme Zuordnung wird nicht unnötig erneut angezeigt; Unsicherheit
  oder materielle Folgen erhalten schnelle Bestätigung/Korrektur.
- Im Alltag ist nur das notwendige Core-Profil sichtbar.
- Hochsensible Werte erscheinen nicht in globalen Listen, normalen
  Benachrichtigungen, Telemetrie oder Fehlertexten.
- Vorschläge dürfen Kandidaten nur nach Berechtigungsfilterung erzeugen.

## Sync, Export und Tests

Local/Cloud Authority, Caches, Sharing, Export, Löschung und Backup behandeln
die Schutzklassen ausdrücklich. Kinder-, Gesundheits-, Ausweis-, Steuer- und
Geschäftsdaten benötigen besonders zurückhaltende Defaults.

Tests decken Maskierung, Berechtigungswechsel, falsches Managed Subject,
mehrere Versicherungen, je Kategorie keinen/einen Default, historische
Gültigkeit, Default-Aenderung ohne automatische Claim-/Einreichungsfolge,
Export-/Löschumfang, Suchindex-/Log-Redaction und Tenant-Isolation
ausschließlich mit synthetischen Daten ab.

## Offene Implementierungsentscheidungen

Feldumfang je Slice, Verschlüsselung, konkrete eID-/OAuth-Provider,
Versicherungs-Extraktion, Minderjährigen-Consent sowie profilbezogener Export
und Löschung werden vor Aktivierung als eigene Contracts entschieden.
