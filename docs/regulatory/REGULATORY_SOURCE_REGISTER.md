---
title: "Mappm Regulatory Source Register"
description: "Datiertes Register offizieller Rechts-, Regulierungs- und Store-Quellen"
tags: [regulatory, eu, austria, stores, sources, review]
lastUpdated: "2026-07-15"
status: "active-baseline"
owner: "compliance/product"
regulatoryAsOf: "2026-07-15"
nextScheduledReview: "2026-08-15"
---

# Mappm Regulatory Source Register

## Zweck und Grenze

Dieses Register dokumentiert den fuer die Produktplanung am **15.07.2026**
geprueften Quellenstand. Es ist Governance und keine Rechtsberatung. Eine
Zeile mit `conditional` oder `needs-legal-review` darf nicht durch einen
Implementation Agent eigenmaechtig als anwendbar oder nicht anwendbar
entschieden werden.

Vor realer Datenverarbeitung, neuem Markt, Provider, Store, AI-Modell,
Geschaeftsmodell und jedem Release werden die betroffenen Zeilen aktualisiert.
Der Nachweis nennt Quelle, Zugriffsdatum, Reviewer, Ergebnis und naechsten
Pruefausloeser.

## EU- und Oesterreich-Baseline

| Bereich | Offizielle Primaer-/Statusquelle | Stand am 15.07.2026 | Vorlaeufige Mappm-Einordnung | Naechster Pflichtcheck |
|---|---|---|---|---|
| DSGVO/GDPR | [Verordnung (EU) 2016/679](https://eur-lex.europa.eu/eli/reg/2016/679/oj/eng) | gilt fuer die Verarbeitung personenbezogener Daten | `applicable`; Gesundheits-, Identitaets-, Finanz- und Haushaltsdokumente erfordern besondere Schutz- und Rechtsgrundlagenpruefung | vor jedem realen Datenfluss, neuen Zweck, Provider oder Release |
| Oesterreichisches DSG | [DSG im RIS](https://ris.bka.gv.at/geltendeFassung.wxe?Abfrage=bundesnormen&Gesetzesnummer=10001597) | nationale Ergaenzungen und Rechtsbehelfe sind mitzubeachten | `applicable` fuer den Startmarkt Oesterreich | mit DSGVO-Review und bei nationaler Aenderung |
| AI Act | [Verordnung (EU) 2024/1689](https://eur-lex.europa.eu/eli/reg/2024/1689/oj/eng), [Kommissionsuebersicht](https://digital-strategy.ec.europa.eu/en/policies/regulatory-framework-ai) | gestufte Anwendung; Rollen, Risikoklasse, Transparenz, AI Literacy und Providerbeziehung sind je Use Case zu pruefen | `applicable` fuer OCR/LLM/ML-Assist; keine pauschale High-Risk- oder Low-Risk-Annahme | vor echten Dokumenten, Modell-/Providerwechsel und jeder materiellen Leitlinie |
| AI Digital Omnibus 2026 | [endgueltige Ratsannahme vom 29.06.2026](https://www.consilium.europa.eu/de/press/press-releases/2026/06/29/artificial-intelligence-council-gives-final-green-light-to-simplify-and-streamline-rules/) | final angenommen; am 15.07.2026 war in der geprueften EUR-Lex-Suche noch keine verkuendete ELI-Fassung belegt. Die neuen High-Risk-Zieldaten 02.12.2027/02.08.2028 werden daher bis zur Amtsblattpruefung nicht als operative Rechtsgrundlage verwendet | `watch`; bestaetigte Aenderung mit ausstehendem Wirksamkeitsnachweis | EUR-Lex/Amtsblatt vor 02.08.2026 und vor jeder AI-Freigabe erneut pruefen |
| EDPB und AI-Modelle | [EDPB-Stellungnahme zu AI-Modellen](https://www.edpb.europa.eu/news/edpb-opinion-on-ai-models-gdpr-principles-support-responsible-ai_en) | Datenschutzgrundsaetze gelten fuer Entwicklung und Einsatz; Anonymitaet, Rechtsgrundlage und Folgen unrechtmaessiger Trainingsdaten sind fallbezogen | `guidance-applicable`; keine Trainingsnutzung echter Mappm-Dokumente ohne separate Freigabe | vor Modelltraining, Fine-Tuning, RAG-Korpus oder Providerwechsel |
| Cyber Resilience Act | [Verordnung (EU) 2024/2847](https://eur-lex.europa.eu/eli/reg/2024/2847/oj/eng), [CRA Reporting](https://digital-strategy.ec.europa.eu/en/policies/cra-reporting) | Meldepflichten ab 11.09.2026; volle Anwendung ab 11.12.2027; Konformitaetsstellen-Regeln seit 11.06.2026 | `expected-applicable` fuer kommerziell bereitgestellte Software mit digitalen Elementen; Rechtsreview bestaetigt Produktklasse und Ausnahmen | vor externer Beta/Update-Infrastruktur und zwingend vor 11.09.2026 |
| NIS2 EU | [Richtlinie (EU) 2022/2555](https://eur-lex.europa.eu/eli/dir/2022/2555/oj/eng) | nationale Umsetzung, Sektor, Groesse und konkrete Dienste entscheiden | `conditional`; Managed Cloud und B2B-/Enterprise-Betrieb sind zu klassifizieren | vor Managed Service, Enterprise-Vertrag oder Sektorerweiterung |
| NISG 2026 Oesterreich | [BGBl. I Nr. 94/2025](https://ris.bka.gv.at/eli/bgbl/I/2025/94), [RIS-Inkrafttreten](https://www.ris.bka.gv.at/Dokumente/Bundesnormen/NOR40273861/NOR40273861.html) | wesentliche Bestimmungen treten am 01.10.2026 in Kraft | `needs-legal-review`; Unternehmensgroesse, Cloud-/ICT-Dienst und Zielkunden koennen direkten oder lieferkettenbezogenen Scope ausloesen | Rechtsklassifikation vor 01.10.2026 und vor Enterprise-/Managed-Cloud-Launch |
| Data Act | [Verordnung (EU) 2023/2854](https://eur-lex.europa.eu/eli/reg/2023/2854) | anwendbar seit 12.09.2025; Cloud-Switching-Regeln sind fuer Datenverarbeitungsdienste relevant, Abschaffung von Switching Charges ab 12.01.2027 | `conditional`; Mappm Cloud als Datenverarbeitungsdienst rechtlich klassifizieren, Portabilitaet ohnehin als Produktbaseline | vor Cloud-AGB, Providerwechsel, Exportformat und vor 12.01.2027 |
| Digital Services Act | [Verordnung (EU) 2022/2065](https://eur-lex.europa.eu/eli/reg/2022/2065/oj/eng) | gilt fuer bestimmte Vermittlungsdienste, insbesondere Hosting | `conditional`; privater Dokumentenspeicher und spaeteres accountuebergreifendes Sharing muessen auf Hosting-/Intermediaer-Scope geprueft werden | vor externem Sharing, fremden Inhalten oder oeffentlichen Kollaborationsfunktionen |
| European Health Data Space | [Verordnung (EU) 2025/327](https://eur-lex.europa.eu/eli/reg/2025/327/oj/eng) | gilt grundsaetzlich ab 26.03.2027, wesentliche Pflichten gestuft ab 2029/2031; EHR-Systeme und als interoperabel beworbene Wellness-Apps haben besonderen Scope | `conditional/watch`; Mappm ist derzeit Dokumentenassistent, kein EHR und macht keinen Interoperabilitaetsclaim. Gesundheitsdaten allein machen die App nicht automatisch zum EHR | vor Health-Interoperabilitaet, Gesundheitsanbieterintegration oder entsprechender Vermarktung; spaetestens 26.03.2027 |
| eIDAS/EUDI | [Verordnung (EU) 2024/1183](https://eur-lex.europa.eu/eli/reg/2024/1183/oj/eng), [Kommissionsstatus EUDI](https://commission.europa.eu/topics/digital-economy-and-society/european-digital-identity_en) | Mitgliedstaaten sollen bis Ende 2026 mindestens eine EUDI Wallet bereitstellen; technische Durchfuehrungsregeln entwickeln sich weiter | `conditional`; generische Identity-Provider-Grenze, keine harte Kopplung an einen Provider | vor Relying-Party-Registrierung, Attributabfrage, Signatur oder Account-Binding |
| ID Austria | [Bundeskanzleramt: ID Austria App](https://www.bundeskanzleramt.gv.at/service/mobile-apps/id-austria-app.html) | aktive oesterreichische eID und moeglicher Vertrauensprovider; nicht schlicht mit der kuenftigen EUDI Wallet gleichzusetzen | `provider-candidate`; technische, vertragliche und datenschutzrechtliche Relying-Party-Bedingungen offen | bei Identity-Contract und vor jeder Integration |
| Produkthaftungsrichtlinie | [Richtlinie (EU) 2024/2853](https://eur-lex.europa.eu/eli/dir/2024/2853/oj/eng) | Software ist erfasst; neue Regeln gelten fuer Produkte, die nach dem 09.12.2026 in Verkehr gebracht oder in Betrieb genommen werden; nationale Umsetzung pruefen | `expected-applicable` fuer kommerzielle Releases | vor erstem Verkauf und zwingend vor 09.12.2026 |
| Barrierefreiheitsrichtlinie/EAA | [Richtlinie (EU) 2019/882](https://eur-lex.europa.eu/eli/dir/2019/882/oj/eng) | seit 28.06.2025 fuer erfasste Produkte/Dienste, unter anderem E-Commerce-Dienste | `needs-legal-review` fuer App-, Verkaufs- und Supportoberflaechen; Accessibility bleibt unabhaengig davon verbindliche Produktbaseline | vor oeffentlichem Verkauf oder Store-Release |
| Digitale Inhalte/Dienste | [Richtlinie (EU) 2019/770](https://eur-lex.europa.eu/eli/dir/2019/770/oj/eng) | regelt Verbraucher-Vertraege ueber digitale Inhalte und Dienste, auch Cloud-Dienste; nationale Umsetzung ist massgeblich | `expected-applicable` fuer B2C-App/Cloud/Subscription | vor Pricing, Trial, AGB, Leistungsversprechen und Kuendigung |
| Verbraucherrechte/Fernabsatz | [Richtlinie 2011/83/EU](https://eur-lex.europa.eu/eli/dir/2011/83/oj/eng) | Informations-, Widerrufs- und Fernabsatzpflichten; nationale Umsetzung und Store-Rollen pruefen | `expected-applicable` fuer Direktverkauf und gegebenenfalls Store-Angebote | vor Checkout, Trial, Subscription und Marktstart |
| E-Commerce | [Richtlinie 2000/31/EG](https://eur-lex.europa.eu/eli/dir/2000/31/oj/eng) | Informationspflichten fuer Dienste der Informationsgesellschaft; nationale Umsetzung ist relevant | `expected-applicable` fuer Website, Direktverkauf und Online-Dienst | vor Website, Checkout und kommerziellem Launch |

## Store- und Plattformquellen

Store-Regeln aendern sich unabhaengig vom Recht und teilweise nach Region,
Programm und Vertriebskanal. Diese Zeilen sind Mindestquellen, kein Ersatz fuer
den vollstaendigen Release-Check.

| Kanal | Offizielle Quelle | Am 15.07.2026 bestaetigtes Mindestsignal | Releasefolge |
|---|---|---|---|
| Apple App Store | [App Review Guidelines](https://developer.apple.com/app-store/review/guidelines/), [App Privacy](https://developer.apple.com/help/app-store-connect/manage-app-information/manage-app-privacy/) | Review-Zugang fuer accountbasierte Funktionen; In-App-Accountloeschung bei Accountanlage; aktuelle Privacy-Angaben inklusive Dritt-SDKs; regionale Purchase-/Subscription-Regeln | Review-Account mit synthetischen Daten, Accountloeschung, Privacy Manifest/Labels, Billing-Entscheid und Review Notes |
| Google Play | [User Data Policy](https://support.google.com/googleplay/android-developer/answer/10144311), [Data Safety](https://support.google.com/googleplay/android-developer/answer/10787469), [Accountloeschung](https://support.google.com/googleplay/android-developer/answer/13327111), [Payments](https://support.google.com/googleplay/android-developer/answer/9858738) | Data-Safety-Erklaerung und Privacy Policy; bei Accountanlage In-App-Pfad und Webressource zur Loeschung; Payments-/Alternative-Billing-Regeln sind regions- und programmabhaengig | Deklarationen gegen tatsaechliche Datenfluesse pruefen, Deletion-End-to-End, Billingprogramm und Subscription-Lifecycle festlegen |
| Microsoft Store | [Microsoft Store Policies](https://learn.microsoft.com/en-us/windows/apps/publish/store-policies) | zum Checkzeitpunkt Policy-Version 7.19, veroeffentlicht 10.09.2025, wirksam 14.10.2025; Security, Testbarkeit, personenbezogene Daten und Transaktionen geregelt | nur bei aktiviertem Store-Kanal erneut Version/Wirksamkeitsdatum pruefen; Testzugang, Datenschutz, Packaging und Commerce dokumentieren |
| Apple Direct Distribution | [Apple Notarization](https://developer.apple.com/documentation/security/notarizing-macos-software-before-distribution) | ausserhalb des Mac App Store bleiben Signing, Hardened Runtime und Notarisierung distributionsrelevant | reproduzierbarer signierter/notarisierter Build und sicherer Updatekanal |
| Android/Windows Direct Download | jeweilige aktuelle OS-, Signing-, Reputation- und Update-Dokumentation | kein einmaliger Store-Check deckt Direktdownload ab | Signatur, Installer, Update, Rollback, Malware-/Reputation- und Supportprozess pro Kanal |

## Quellenhierarchie

1. Amtsblatt, EUR-Lex-ELI oder RIS-Gesetzestext sind die Primaerquelle.
2. Kommission, Rat, BKA, Aufsicht und Store-Betreiber liefern Status,
   Durchfuehrung und verbindliche Plattformregeln.
3. Pressemitteilung, FAQ oder politischer Beschluss wird als solcher markiert
   und ersetzt keinen Wirksamkeitsnachweis im Amtsblatt.
4. Blog, Sekundaerquelle oder Erinnerung eines Agents ist niemals alleiniger
   Freigabenachweis.

## Evidence-Schema

Jeder Compliance-/Release-Check erfasst mindestens:

- `checkedAt`, Reviewer und fachkundige Freigaberolle.
- Rechtsraum, Markt, Produktmodus, Instanz und Version.
- exakte URLs und bei Store-Regeln Version/Wirksamkeitsdatum.
- `applicable`, `not-applicable`, `conditional` oder `open` mit Begruendung.
- betroffene Datenfluesse, Contracts, UI, Betrieb, Support und Tests.
- naechstes Reviewdatum sowie Event-Trigger.

## Stop Rules

- Stop, wenn ein Artifact Rechts- oder Store-Readiness ohne Quelle, Datum,
  Reviewer und Applicability-Entscheid behauptet.
- Stop, wenn eine kuenftige oder noch nicht verkuendete Aenderung als geltendes
  Recht beschrieben wird.
- Stop, wenn `conditional` oder `open` vor dem betroffenen Release ungeklaert
  bleibt.
- Stop, wenn Store-Metadaten, Privacy-/Data-Safety-Angaben oder
  Leistungsversprechen nicht dem tatsaechlichen Produkt entsprechen.
- Stop, wenn ein Implementation Agent eine rechtliche Scope-Entscheidung ohne
  Legal-/Compliance-Owner trifft.
