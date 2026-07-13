---
title: "Mappm - Competitive Positioning"
description: "Wettbewerbsanalyse und Positionierungsnotizen fuer Mappm als Local/Cloud-Dokumentenprodukt fuer Haushalte"
tags: [product, strategy, competition, positioning, privacy, documents, intelligence]
lastUpdated: "2026-07-14"
status: "working-note"
---

# Mappm - Competitive Positioning

## Status

Working note.

2026-07-12 product rebaseline: customer self-hosting/Home Hub is not a Mappm
product mode. Competitive references to self-hosted products remain category
analysis only. Mappm differentiates through user-selected Local or Cloud data
authority, account-backed Core Assist and a trustworthy account-independent
exit/recovery path.

Diese Analyse haelt die ersten Wettbewerbsbeobachtungen aus der
Produktstrategie fest. Sie ist keine finale Marktstudie und keine technische
Decision. Sie dient als Orientierung fuer Produktpositionierung, Roadmap,
Messaging und spaetere Go-to-Market-Entscheidungen.

## Kurzfazit

Mappm sitzt zwischen mehreren etablierten Produktkategorien:

```text
Family / Life Vaults
  -> starke emotionale Positionierung, Sharing, Trusted Contacts

Self-hosted Document Management
  -> starke private Kontrolle, OCR, Automatisierung fuer technische Nutzer

Enterprise DMS / ECM
  -> starke Workflows, Compliance, OCR, AI, Business-Prozesse

E2EE Cloud Storage
  -> starke Verschluesselungs- und Sharing-Story, aber wenig Dokumentlogik

Scanner / Capture Apps
  -> starke mobile Erfassung, aber kaum Haushalts-/Vorgangsmodell
```

Die Chance fuer Mappm liegt nicht darin, eine dieser Kategorien direkt zu
kopieren. Die Chance liegt in einer klaren Verbindung:

```text
Private Haushaltsdokumente
  + Vorgänge, Fristen, Profile und Nachweise
  + sichere Sync-/Backup-/Sharing-Modi
  + intelligente, prüfbare Core Assistenz
  + europaeische Vertrauens- und Identity-Schicht
```

## Wettbewerbscluster

### 1. Family / Life Vaults

Beispiele:

- Quicken LifeHub: https://www.quicken.com/products/lifehub/
- Trustworthy: https://www.trustworthy.com/
- Everplans: https://www.everplans.com/
- Prisidio: https://www.prisidio.com/

Diese Produkte verkaufen meist nicht "DMS", sondern Sicherheit und
Familienbereitschaft: wichtige Dokumente, IDs, Versicherungen, Estate Planning,
Trusted Contacts, Freigaben und digitale Tresore.

Staerken:

- sehr verstaendliches emotionales Nutzenversprechen.
- familien- und vertrauenspersonenorientiert.
- Cloud-/Account-/Sharing-UX oft einfacher als Self-hosted-Loesungen.
- fuer private Lebensereignisse besser gerahmt als Business-DMS.

Risiken fuer Mappm:

- Sie koennen fuer Nutzerinnen schneller greifbar wirken als
  "Dokumentenmanagement".
- Sie konkurrieren direkt um den Vertrauens- und Familienkontext.
- Sie koennen mit einfacher Cloud-UX schneller kaufbar sein.

Luecken / Mappm-Chance:

- haeufig US-zentriert.
- weniger EU-/eIDAS-/ID-Austria-Vertrauensposition.
- oft eher Vault als vorgangsorientierte Arbeitsflaeche.
- selten eine echte Wahl lokaler Datenautorität bei gleichzeitig
  servicegestützter Assistenz und überprüfbarer Cloud-Exit-Migration.
- weniger starkes Modell fuer Dokumente als Teil von Vorgang, Frist, Claim,
  Nachweis, Profil und Workflow.

### 2. Self-hosted Document Management

Beispiel:

- Paperless-ngx: https://docs.paperless-ngx.com/

Paperless-ngx ist fuer technisch affine Nutzer sehr relevant: self-hosted,
OCR, Tags, Korrespondenten, Dokumenttypen, automatisierte Zuordnung und
serverseitige Kontrolle.

Staerken:

- starke private Kontrolle.
- etablierte OCR-/Archiv-Workflows.
- gute Passung fuer Home-Server-/NAS-Nutzer.
- kein klassischer Cloud-Zwang.

Risiken fuer Mappm:

- Fuer technische Nutzer ist Paperless-ngx heute bereits sehr leistungsfaehig.
- Mappm muss einen klaren Mehrwert jenseits von "Dokumente mit OCR archivieren"
  zeigen.

Luecken / Mappm-Chance:

- eher Archiv als Familienassistenz.
- weniger gefuehrte UX fuer normale Haushalte.
- weniger Mobile-Capture-first und Review-Inbox als Produktkern.
- kein starkes Haushaltsprofil-/Vorgangs-/Sharing-/Recovery-Modell.
- keine Managed-Comfort-Option und keine eIDAS-/ID-Austria-Story als
  Vertrauensanker.

### 3. Enterprise DMS / ECM

Beispiele:

- DocuWare: https://start.docuware.com/
- ELO Digital Office: https://www.elo.com/
- M-Files: https://www.m-files.com/
- d.velop documents: https://www.d-velop.com/software/edms
- ecoDMS: https://www.ecodms.de/
- AMAGNO: https://amagno.de/

Diese Anbieter sind stark bei Dokumentenarchiv, Metadaten, Workflows,
Compliance, OCR, AI, Rollen, Business-Prozessen und teilweise flexiblen
Deployment-Modellen.

Staerken:

- reife DMS-/ECM-Funktionen.
- Business-Workflows, Compliance und Audit.
- teilweise starke OCR-/AI-/Metadata-Funktionen.
- B2B-Vertrauen und etablierte Prozesse.

Risiken fuer Mappm:

- Feature-Tiefe und Compliance-Reife koennen Mappm langfristig unter Druck
  setzen.
- Manche Anbieter koennen kleinere Teams und Haushalte spaeter mit leichteren
  Produkten adressieren.

Luecken / Mappm-Chance:

- meist business-lastig, schwergewichtig und teuer.
- nicht fuer Familienalltag, Kinderprofile, Haushaltsfristen, Versicherungen,
  Arzt-/Schul-/Garantie-Kontexte und private Nachweise optimiert.
- UX-Sprache haeufig Abteilung, Prozess, Mandant, Akte statt Haushalt,
  Person, Vorgang und Erinnerung.
- wenig emotionale Sicherheits- und Vertrauensposition fuer private
  Lebensdokumente.

### 4. E2EE Cloud Storage

Beispiele:

- Proton Drive: https://proton.me/drive
- Tresorit: https://tresorit.com/
- iCloud Advanced Data Protection:
  https://support.apple.com/guide/security/advanced-data-protection-for-icloud-sec973254c5f/web

Diese Produkte gewinnen bei verschluesseltem Speichern, Cloud-Sync,
geraeteuebergreifender Verfuegbarkeit und sicherem Teilen.

Staerken:

- starke Privacy-/Verschluesselungswahrnehmung.
- gute Cloud-UX und bekannte Speichermentalitaet.
- Teilen und Geraetewechsel sind vertraute Workflows.
- Apple zeigt, dass E2EE-Cloud zunehmend Mainstream-Vertrauenssignal wird.

Risiken fuer Mappm:

- Nutzerinnen koennen sagen: "Ich lege PDFs einfach in Proton, Tresorit oder
  iCloud."
- Gute Cloud-Speicher sind einfacher zu erklaeren als ein neues DMS.

Luecken / Mappm-Chance:

- keine echte Dokumentenfachlichkeit.
- keine Vorgänge, Fristen, Claims, Unterlagen, Profile und Review-Inbox als
  Kernmodell.
- keine Assistenz, die ein Dokument in Haushaltskontext uebersetzt.
- wenig Schutz vor "sicher gespeichert, aber trotzdem nicht wiedergefunden
  oder nicht erledigt".

### 5. Scanner / Capture Apps

Beispiele:

- Adobe Scan: https://www.adobe.com/acrobat/mobile/scanner-app.html
- Microsoft Lens: https://www.microsoft.com/microsoft-365/microsoft-lens
- Genius Scan: https://thegrizzlylabs.com/genius-scan/
- Scanner Pro: https://readdle.com/scannerpro

Scanner-Apps loesen die schnelle Erfassung gut: Kamera, Zuschnitt,
Bildverbesserung, PDF-Erzeugung und Export.

Staerken:

- sehr schnelle mobile Erfassung.
- gute Bildqualitaet und vertraute Capture-Flows.
- niedrige Einstiegshuerde.

Risiken fuer Mappm:

- Mobile Capture muss sich mindestens solide anfuehlen.
- Schlechter Scan-Flow wuerde Mappm sofort schwach wirken lassen.

Luecken / Mappm-Chance:

- Capture ist dort meist das Ende des Workflows.
- Mappm kann Capture als Anfang eines Vorgangs verstehen:
  Review, betroffene Person, Frist, Claim, Nachweis, Aufgabe, Sharing,
  Backup und spaetere Assistenz.

## Direktvergleich: fileee

### Gepruefter Stand

Geprueft am 2026-07-14 gegen die offiziellen Seiten:

- [fileee Privatfunktionen](https://www.fileee.com/features-private)
- [fileee Spaces](https://www.fileee.com/fileeespaces)
- [fileee Businessfunktionen](https://www.fileee.com/features-business)

Die oeffentlich beschriebenen Kernstaerken von fileee sind:

- Scan und Import aus E-Mail-/Cloud-Quellen;
- automatische Erkennung von Dokumenttyp, Absender, Datum, Betrag, IBAN und
  Fristen;
- automatische Benennung und Tags;
- OCR-Volltextsuche;
- Aufgaben und Push-/E-Mail-Erinnerungen aus Fristen sowie manuelle Tasks;
- geraeteuebergreifender Cloud-Bestand;
- Freigabe und Zusammenarbeit in `fileeeSpaces` mit Lese-/Schreibrechten,
  Dokumenten, Aufgaben und Chat;
- Business-Automationen und Exporte zu Buchhaltungsdiensten.

Diese Funktionen sind keine optionalen Randideen fuer Mappm. Capture, OCR,
Metadatenvorschlaege, Suche, Fristen/Tasks, sichere Cloud-Nutzung und spaetere
kontrollierte Freigabe bilden die erwartbare Produktbasis, muessen bei Mappm
aber in das eigene Trust-, Vault- und Review-Modell passen.

### Spaces sind nicht Mappm-Vorgaenge

Fileee beschreibt Spaces als bewusst benannte gemeinsame Bereiche, etwa fuer
Steuererklaerung, Haushalt oder Reisekosten. Nutzer laden Personen ein, teilen
Dokumente, vergeben Rechte, verteilen Aufgaben und koennen chatten. Das ist
fachlich eine Sammlung/Freigabeflaeche und kann einen groben Anlass abbilden.

Nach den geprueften oeffentlichen Produktseiten ist es jedoch nicht dasselbe
wie Mappms Zielmodell eines Vorgangs mit:

- eigenstaendigem Ziel, Lifecycle und Abschlusskriterium;
- versioniertem, laender-/institutionsspezifischem Workflow;
- Stages, Steps, parallelen/bedingten Branches und erwarteten Antworten;
- strukturierten Claims/Submissions mit eigenen Status- und Erstattungsdaten;
- typisierten Beziehungen zu anderen eigenstaendigen Cases;
- gleichwertigen langlebigen Unterlagen/Records und Managed Subjects;
- deduplizierten, kontextbezogenen Facts und naechsten Aufgaben.

Das ist eine Produktinferenz aus der oeffentlichen Darstellung, keine Aussage
ueber interne oder nicht beworbene fileee-Funktionen. Fileee Business nennt
Automationen und Prozessfunktionen; Mappm differenziert sich deshalb nicht mit
dem bloßen Wort `Workflow`, sondern mit privaten, nachvollziehbaren
Lebensvorgaengen und deren fachlichem Modell.

### Was Mappm uebernimmt

- sehr schneller Scan/Import und eine sichere Review-Inbox;
- automatische, korrigierbare Typ-/Absender-/Datums-/Betrags-/Fristerkennung;
- starke Volltext- und spaeter semantische Enterprise-Suche;
- automatische und manuelle Tasks/Reminder;
- Dokumentfreigabe und adviser handoff in einer spaeteren kontrollierten
  Sharing-Phase;
- gute geräteuebergreifende Nutzbarkeit im Cloud Vault;
- klare Datenschutz-, Verschluesselungs- und Account-Sicherheitsoberflaechen.

### Was Mappm bewusst anders macht

- Vorgang statt lange Dokumentliste/Tag-/Space-zentrierter Primaerorganisation;
- Unterlagen/Records als eigener gleichwertiger Bereich statt alles als
  einzelnes Dokument oder Sammlungsmitglied zu behandeln;
- automatische Zuordnung zu bestaetigbaren Cases, Records, Claims, Branches,
  Managed Subjects und ExternalParty-Kontakten;
- konkrete naechste Schritte und Ergebnisverfolgung, nicht nur extrahierte
  Fristerinnerungen;
- kuratierte, versionierte Laender-/Institutionsvarianten mit manuellem Custom-
  Case-Fallback;
- typisierter Case-Graph und reversible Top-down-/Bottom-up-Komposition;
- ausdrueckliche Local-/Cloud-Vault-Wahl mit verifiziertem Exit;
- globale ergebniszentrierte Suche statt Chat/Messenger als primaere
  Dokumentinteraktion;
- schlanke kontextuelle Auswertungen statt Buchhaltungs- oder Dashboard-Scope.

### Produktwarnung

Mappm darf die Fileee-Basis nicht unterschätzen. Ein ausgefeilter Vorgangsgraph
kompensiert keinen langsamen Scan, schlechte OCR, schwache Metadatenkorrektur,
unzuverlaessliche Suche oder nervige Reminder. Die Differenzierung wird erst
verkaufbar, wenn diese Basisqualitaet sitzt und der Case-Workflow nach dem
Upload sofort weniger Arbeit erzeugt als eine manuelle Space-/Tag-Sortierung.

## Positionierung fuer Mappm

Mappm sollte nicht als "noch ein DMS" und nicht als "noch ein Cloud Drive"
auftreten.

Arbeitsformulierung:

```text
Mappm ist die private Dokumentenplattform fuer Haushalte:
lokal nutzbar, sicher synchronisierbar, vertrauenswuerdig teilbar und
intelligent genug, Dokumente in echte Vorgänge, Fristen und Lebenskontexte zu
uebersetzen.
```

Alternative Kurzform:

```text
Private document workflow platform with explicit Local/Cloud authority.
```

Deutschsprachige Produktthese:

```text
Mappm hilft Haushalten, wichtige Dokumente nicht nur sicher abzulegen,
sondern sie im richtigen Kontext wiederzufinden, zu verstehen und rechtzeitig
zu erledigen.
```

## Strategische Differenzierung

```text
Gegen Paperless-ngx:
  bessere Haushalts-UX, Mobile Capture, Profile, Vorgänge, Sharing, Managed
  Comfort und europaeische Trust-Schicht.

Gegen Family / Life Vaults:
  staerkeres Vorgangs-/Dokumenten-/Fristenmodell, Local/Cloud-Wahl und Exit,
  EU-/eIDAS-/ID-Austria-Vertrauensposition und spaetere Assistenz.

Gegen E2EE Cloud Storage:
  Dokumentverstaendnis statt nur verschluesselte Dateien.

Gegen Enterprise DMS:
  leichter, privater, familiengeeignet, nicht abteilungs- oder
  compliance-first.

Gegen Scanner Apps:
  Capture ist nur der Eingang; Mappm begleitet Review, Ablage, Frist,
  Nachweis, Sharing und spaetere Verarbeitung.
```

## Produktimplikationen

- Vertrauen und Familiennutzen muessen genauso stark formuliert werden wie
  technische Privacy.
- Mappm darf weder wie ein technisches Serverprojekt noch wie ein beliebiger
  Cloud-Speicher wirken.
- Mobile Capture muss schnell und vertraut sein, aber direkt in Review und
  Haushaltskontext fuehren.
- Die Provider-Architektur ist marktseitig sinnvoll: Local fuer lokale
  Datenautorität, Mappm Cloud fuer Multi-Device und managed Backup, Core Assist
  fuer beide Modi und überprüfbare Migration in beide Richtungen.
- Das noch offene Managed-Trust-versus-E2EE-Modell ist ein potenzielles
  Wettbewerbsmerkmal, darf vor VC-02 aber nicht versprochen werden.
- eIDAS/EUDI/ID Austria kann im DACH-/EU-Kontext ein glaubwuerdiger
  Vertrauensanker werden, darf aber nicht zur nationalen Sackgasse werden.

## Offene Folgefragen

- Welche Zielgruppe ist zuerst wichtiger: privacy-bewusste Local-Nutzer oder
  normale Haushalte mit Managed-Cloud-Bedarf?
- Wird Mappm zuerst als "private Dokumentenplattform" oder als "Familien-
  Readiness / Life Admin" kommuniziert?
- Welche Funktionen muessen fuer den ersten kaufbaren Eindruck sitzen:
  Capture, Review, Fristen, Backup, Sharing oder Assistenz?
- Welche Wettbewerber brauchen spaeter eine tiefere Feature-by-Feature-Matrix?
- Welche rechtlichen und vertrieblichen Anforderungen entstehen, wenn eIDAS,
  ID Austria, Cloud-Backup oder Managed Intelligence aktiv beworben werden?
