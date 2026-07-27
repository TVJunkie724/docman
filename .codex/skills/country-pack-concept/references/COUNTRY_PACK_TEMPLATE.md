# Template - Country-/Provider-Pack

## Identitaet

- Pack-ID
- Country/Region/Jurisdiction
- Sprache(n) getrennt
- Provider/Tarif/Formular, falls anwendbar
- Version, `validFrom`, optional `validTo`
- Status und Zielrelease

## Globale Referenzen

- Case-Familien
- Workflow-Muster
- Dokumenttypen/Varianten
- Rollen/Slots
- Record-Arten

## Lokalisierung und Erkennung

- lokale Titel/Aliase
- typische Referenz-/Feld-/Datumsformate
- Provider-/Formularvarianten
- realistisch erkennbare grobe Kandidaten auf der Small-/Medium-Model-Baseline
- typabhaengig vorschlagbare, aber nicht autonom finalisierte
  Datumsbedeutungen sowie bewusst nicht automatisch erkennbare Personen-,
  Workflow-, rechtliche Frist-, Kausalitaets- und Beziehungssignale
- generischer Fallback

## Intelligence-Grenze

- usergewaehlter Managed Subject/Case-Kontext bleibt autoritativ
- lokale Muster verbessern Kandidaten, behaupten keine semantische Wahrheit
- semantische Datumsfeldvorschlaege werden erst durch sichtbaren Review oder
  eine eng gepruefte Regel fachlich aktiv
- gemischter Dokumentinhalt bleibt im aktuellen Zielrelease gueltig und
  generisch; keine Ablehnung, Invalidierung oder Auto-Segmentierung
- Backend-/Data-Feasibility-ID fuer jede staerkere Erkennung

## Workflow-/Task-/Fristregeln

| Rule-ID | Ausloeser/Startanker | Folge | Quelle/Fundstelle | Review/Confirmation | Fallback |
|---|---|---|---|---|---|

## Quellen und Betrieb

- Source Review Matrix
- fachlicher/Legal/Compliance-Owner
- technischer Owner
- monatlicher Quellencheck
- naechster Fachreview spaetestens
- Pre-Publish-/Release-Gate
- Withdrawal-/Incident-/Correction-Verhalten

## Produktgrenzen

- keine Rechts-/Steuer-/Deckungs-/Erstattungsberatung
- keine globale ID nur fuer lokale Form/Institution
- keine stille historische Neuberechnung
- keine Aktivierung ohne aktuelle offizielle Evidenz
- keine staerkere Modellfaehigkeit still voraussetzen

## Verifikation

- gueltige/ungueltige Anwendbarkeit
- fehlende/alte Pack-Version
- Provider unbekannt
- Startanker fehlt
- Regelupdate
- Withdrawal/Fallback
- Locale/Jurisdiction-Konflikt
- synthetische Fixtures
