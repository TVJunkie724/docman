---
title: "Konzept F36 - Vault-Modi und Cloud-Lifecycle"
description: "Mappm Produkt- und UX-Vertrag fuer Account, Local/Cloud Vaults, Assist, Migration, Entitlements, Kuendigung, Recovery und Datenportabilitaet"
tags: [concept, account, vault, cloud, local, assist, migration, subscription, portability, recovery, ux]
lastUpdated: "2026-07-15"
version: "1.1"
status: "accepted"
owner: "product-concept/ui-concept"
---

# Konzept F36 - Vault-Modi und Cloud-Lifecycle

## Status und Source of Truth

Angenommen. Massgebliche Produktentscheidungen sind
`docs/technical/DECISION_VAULT_STORAGE_AND_CLOUD_PRODUCT_MODEL.md` und
`docs/technical/DECISION_ACCOUNT_VAULT_ASSIST_PRODUCT_MODEL.md`. F36 regelt
querschnittliches Frontend-/Produktverhalten, aber keine Backend-DTOs,
Endpunkte, Persistenz oder Authorization-Policy-Architektur.

## Scope

- Vault-Erstellung und Erklaerung des Speichermodus.
- Account-/Device-Onboarding, Offline-Kontinuitaet und Detached Recovery.
- sichtbares Assist-Entitlement, Processing und Opt-out/manuelle Degradation.
- sichtbare Local-/Cloud-Autoritaet und lokale Verfuegbarkeit.
- Local-to-Cloud- und Cloud-to-Local-Migration.
- Kuendigung, Grace/Read-only, Reaktivierung und Loeschung.
- Entitlement-, Quota- und Zahlungsfehler.
- Export, Portabilitaet und sichere destruktive Bestaetigung.

## Nichtziele

- konkrete Preise, Zahlungsprovider oder Store-Purchase-Implementierung.
- Cloud-API-Shape oder serverseitiges Storage-Mapping.
- finales kryptografisches Trust-Modell.
- accountuebergreifendes Sharing und Organisationsadministration.

## Erforderliche User Flows

### Vault erstellen

```text
anmelden / Account anlegen und Geraet autorisieren
  -> Plan oder Free waehlen
  -> Name und Zweck
  -> "Auf diesem Geraet" oder "Mappm Cloud" waehlen
  -> Folgen fuer Plan, Speicher und Assist zeigen
  -> Security und Recovery erklaeren
  -> bestaetigen
  -> erstellt oder handlungsfaehiger Fehler
```

Der Default darf nicht allein zur Maximierung bezahlter Conversion gewaehlt
werden. Product und Legal genehmigen Default, Vergleichstext und Trial-
Verhalten. Normales Onboarding bietet keinen anonymen Local Vault. `Detached
Recovery` gilt nur fuer bestehende lokale Daten oder einen verifizierten
Cloud-to-Local-Exit.

### Local Vault mit Assist

Erforderliche Zustaende:

- Local Vault sowie Device-/Account-Vertrauen sind bereit.
- Core-Assist-Anspruch und verbleibende Quota sind ohne Druck-Copy sichtbar.
- Das Dokument bleibt klar als `lokal gespeichert` gekennzeichnet.
- Processing-Zweck/Policy ist vor der ersten Uebertragung erreichbar.
- `Analyse ausstehend`, Uploading, Processing, Review-ready, retrybarer und
  finaler Fehler sind getrennt.
- Queued Processing kann gemaess Policy abgebrochen und ein Dokument
  ausgeschlossen werden.
- Bei Offline, Opt-out oder Quota-Limit bleibt manuelles Review moeglich.
- Keine UI suggeriert Cloud-Backup, Sync oder dauerhafte Cloud-Speicherung.

### Offline-Kontinuitaet und Detached Recovery

- Ein gesunder Local Vault oeffnet offline mit begrenztem gecachtem
  Account-/Device-Trust.
- Ein abgelaufener Cache verlangt Reauthentication, ohne Daten zu loeschen oder
  zu beschaedigen.
- Paid-Local-Kuendigung fuehrt normalerweise zu Free Local mit reduziertem
  Assist-Entitlement.
- Account-Loeschung oder Verlust normaler Nutzungsberechtigung inventarisiert
  Local Vaults und bietet Detach, Export oder explizite lokale Loeschung.
- Detached Recovery erlaubt bestehende Dokumente, lokale Suche, Export und
  manuelle Pflege, aber kein Assist, Sync, Sharing oder Managed Backup.
- Reattachment ist explizit und laedt lokale Daten niemals automatisch hoch.

### Local zu Cloud upgraden

Erforderliche Zustaende:

- Preflight fuer Account, Entitlement, Netzwerk und Speicher.
- Inventarisierung.
- Upload-Fortschritt nach Anzahl und Bytes, ohne private Dateinamen in globaler
  UI.
- Paused/Offline/retrybarer/finaler Fehler.
- Reconciliation und Checksum-Verifikation.
- kurzer, angekuendigter finaler Write Freeze.
- Abschluss mit eindeutiger Cloud-Autoritaets-Erklaerung.
- fruehere Local-Quelle als inaktiver Read-only-Recovery-Snapshot.
- Snapshot-/Cache-Cleanup als separate Aktionen mit eigenem Scope.

Abbruch vor Abschluss laesst Local autoritativ. Schliessen oder Neustart der
App setzt sicher fort.

### Cloud kuendigen oder downgraden

Erforderliche Auswahl:

- `Auf diesem Geraet weiternutzen`, wenn die Plattform unterstuetzt ist.
- `Auf unterstuetztem Geraet weitermachen` plus vollstaendiger Export, wenn
  nicht.
- `Cloud-Archiv vorerst nur lesen`, falls die Policy dies erlaubt.
- `Daten exportieren`.
- `Abo fortsetzen` oder Reaktivierung, falls erlaubt.
- `Cloud-Daten loeschen` als separater destruktiver Flow.

Die UI zeigt Paid-through-, Grace/Read-only- und geplantes Loeschdatum,
erforderlichen freien Speicher und den Grund einer nicht unterstuetzten
Plattform.

Wirkt eine Subscription auf mehrere Vaults, zeigt der Flow je Vault Owner/
Access Role, Speichergroesse, Pending Work und gewaehlte Exit-Aktion. Abschluss
wird je Vault berichtet; ein aggregierter Erfolg darf keinen unvollstaendigen
oder blockierten Vault verbergen.

### Cloud zu Local migrieren

Erforderliche Zustaende:

- benoetigten Speicher berechnen.
- unzureichenden lokalen Speicher mit Abhilfe zeigen.
- Download/Resume.
- Pending-Cloud-Operationen reconciliieren und finalen Write Freeze
  ankuendigen.
- Counts/Checksums verifizieren.
- fehlende/beschaedigte Eintraege auflisten.
- Local aktivieren.
- Cloud-Quelle als inaktiven Read-only-Exit-Snapshot bis zur separaten
  Lifecycle-Entscheidung einfrieren; andere Cloud-Clients koennen nicht mehr
  schreiben.

Die Hauptaktion darf Local nicht aktivieren, solange ein erforderlicher Eintrag
unverifiziert ist.

## Zustandsmodell

| Dimension | Werte |
|---|---|
| Vault-Autoritaet | `local`, `cloud` |
| Account/Session | `active`, `offlineCached`, `reauthRequired`, `suspended`, `deletionPending`, `deleted`, `detachedRecovery` |
| Entitlement | `freeActive`, `paidActive`, `quotaLimited`, `expired`, `graceReadOnly`, `none` |
| Assist Processing | `notRequested`, `queued`, `uploading`, `processing`, `reviewReady`, `failedRetryable`, `failedFinal`, `cancelled`, `deleted` |
| lokale Verfuegbarkeit | `complete`, `partial`, `metadataOnly`, `notAvailable` |
| Cloud-Write-Faehigkeit | `writable`, `offlineQueued`, `readOnly`, `quotaGrowthBlocked`, `paymentReview`, `noAccess` |
| Migration | `none`, `preflight`, `transferring`, `paused`, `finalizingReadOnly`, `verifying`, `failedRetryable`, `failedFinal`, `completed` |
| Quelle nach Migration | `activeAuthority`, `inactiveRecoverySnapshot`, `inactiveExitSnapshot`, `deleted` |
| Subscription-Lifecycle | `active`, `cancelScheduled`, `graceReadOnly`, `retentionPendingDeletion`, `deleted` |

`reactivate` ist eine Aktion/Transition zu `active`, kein Lifecycle-Zustand.
Quota und Payment duerfen Write-Faehigkeit reduzieren, aber weder
Subscription-Lifecycle noch Vault-Autoritaet still umschreiben. Die Dimensionen
werden nicht in einem generischen `syncStatus` zusammengefasst.

## Fehler- und Recovery-Matrix

| Situation | Erforderliches Verhalten |
|---|---|
| offline waehrend Upload/Download | Queue/Checkpoint erhalten; nach Connectivity automatisch erneut versuchen |
| zu wenig lokaler Speicher | Cloud-Zugriff erhalten; Aktivierung blockieren; Cleanup-/Speicherort-Hilfe anbieten |
| Quota ueberschritten | Reads/Export erhalten; Wachstum blockieren; Plan-/Cleanup-Aktionen zeigen |
| Zahlungsfehler | Entitlement folgen; Cache/Cloud-Daten nie sofort loeschen |
| Paid Local gekuendigt | Account/Local-Autoritaet behalten; falls moeglich auf Free Local downgraden; keinen Recovery-Modus erzwingen |
| Local Device offline | mit begrenztem gecachtem Trust oeffnen; Assist queuen; manuelle Arbeit erlauben |
| Assist-Quota verbraucht | Daten/manuelle Arbeit erhalten; Reset-/Plan-Fakten zeigen; Export/Korrektur nicht blockieren |
| Assist-Providerfehler | Quelle/akzeptierte Daten erhalten; Retry oder manueller Fallback; Autoritaet unveraendert |
| Account-Loeschung mit Local Vault | Recovery, Export oder explizite lokale Loeschung verlangen; kein stiller Remote Wipe |
| Checksum-/Count-Mismatch | auf Originalautoritaet bleiben; sichere Referenz-IDs zeigen; Retry/Support anbieten |
| App-Ende waehrend Migration | von durable Checkpoint ohne Duplikate fortsetzen |
| Account/Session widerrufen | sichere lokale Pending Work erhalten; Reauth; keine Raw-Token-Fehler |
| Loeschung waehrend Migration | stoppen und explizite Aufloesung verlangen; kein Race |
| Concurrent Write waehrend Migration | bis Finalisierung journalen; im angekuendigten Freeze blockieren; nie zwei schreibbare Autoritaeten |
| anderes Cloud-Device nach Cloud-to-Local | Authority-changed anzeigen; Writes deaktivieren; Refresh/Export/Account-Aktionen |
| Grace mit unbestaetigter lokaler Arbeit | sichtbar pending halten; nicht als Cloud gespeichert behaupten; im Exit reconciliieren oder Konflikt klaeren |
| Crash beim Authority Switch | aus durable Transaction State auf genau eine Autoritaet fortsetzen; nie aus Cache-Praesenz ableiten |
| inaktiver Snapshot geoeffnet | Read-only-Recovery/Exit zeigen; vor Writes expliziten Rollback-/Clone-Flow verlangen |

## Security und Privacy

- Keine Dokumentnamen/-inhalte in Lockscreen-Notifications, Analytics oder
  globaler Migrationstelemetrie.
- Autoritaets-, Entitlement- und Migrationsereignisse loggen nur
  synthetische/Referenz-IDs.
- Screenshots, Tests und Support-Evidenz verwenden synthetische Daten.
- Destruktive Aktionen brauchen klaren Scope, Folge und Reauthentication gemaess
  akzeptierter Security Policy.
- Cache-Cleanup ist keine Cloud-Loeschung; Cloud-Loeschung keine
  Account-Loeschung.
- Assist-Uebertragung ist weder Cloud-Vault-Speicherung noch Backup oder
  Zustimmung zu Modelltraining.

## Accessibility und Lokalisierung

- Deutsche Produkttexte unterscheiden `lokal verfuegbar`, `in Mappm Cloud
  gespeichert`, `nur lesen`, `Export` und `Loeschung`.
- Fortschritt/Fehler werden semantisch ohne laermende Wiederholung angekuendigt.
- Fokus-/Tastaturreihenfolge erreicht Blocker und primaere Recovery-Aktion.
- Farbe ist nie alleiniger Traeger fuer Cloud-/Grace-/Quota-/Loeschstatus.
- Lange Daten, Speichergroessen und lokalisierte Plannamen clippen bei Textscale
  `2.0` nicht.

## Tests und Verifikation

Jede betroffene Phase umfasst:

- State-Machine-Tests fuer gueltige und ungueltige Transitionen.
- Repository-/Provider-Tests mit Local-/Cloud-Fakes.
- Resume-/Idempotenztests ueber App-Neustart.
- Widget-/Semantics-Tests fuer alle Flows und Fehlerzustaende.
- Privacy-Tests fuer Logs, Notifications und Fixtures.
- Contract-/Microcks-Tests fuer Cloud-Consumer-Verhalten.
- Integrationsevidenz, dass Quelldaten bis zur verifizierten Zielaktivierung
  intakt bleiben.
- Split-Brain-Tests fuer genau eine schreibbare Autoritaet, inklusive anderem
  Device und App-Neustart.
- Kuendigungsgrenzen mit Offline-Pending-Work und Grace-Transition.
- Multi-Vault-Subscription mit Scope, Abschluss je Vault und keinem
  versteckten gestrandeten Vault.
- Free/Paid Local/Cloud mit Online-/Offline-Assist.
- Account-Loeschung/Detached-Recovery ohne impliziten Upload oder Remote Wipe.

## Stop Rules

Stop, wenn:

- die UI einen Toggle statt einer Migration anbietet.
- Kuendigung oder Quota Export/Local-Migration blockiert.
- Read-only, Vault-Loeschung und Account-Loeschung visuell vermischt sind.
- die Autoritaet vor Checksum-/Count-Verifikation wechselt.
- nach Migration beide Providerquellen schreibbar bleiben.
- Frontend Serververtrag oder Retention erfindet.
- ein fuer die Phase relevantes VC-01..VC-08 offen ist.
- Local-Onboarding den Accountvertrag umgeht oder jeder Local-Start Live-Netz
  verlangt.
- Assist-Zustand als Vault-Sync-/Storage-Zustand dargestellt wird.

## Handoff

Der Produktflow geht zuerst durch `ui-concept-review`. Akzeptierte UI-Phasen
gehen an `ui-architect`, Datenmigration an `data-architect`, API-Verhalten an
`contract-api` und kommerzielle/rechtliche Dauern an ihre Fachowner.

## Enterprise Quality Contract

Dieses Konzept uebernimmt
`docs/execution/CONCEPT_ENTERPRISE_QUALITY_CONTRACT.md`. Eigener Scope und
Status bleiben massgeblich; der gemeinsame Vertrag liefert strengere Defaults,
wo F36 schweigt.
