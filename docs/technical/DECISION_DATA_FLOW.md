---
title: "Decision - Local-first Data Flow and Self-hosted Sync Backend"
description: "Entscheidung zu DocMans Datenfluss: lokale Quelle der Wahrheit, generisches Sync Backend, Self-Hosted-Betrieb als Zielrichtung"
tags: [decision, architecture, local-first, sync, backend]
lastUpdated: "2026-04-26"
status: "accepted"
---

# Decision - Local-first Data Flow and Self-hosted Sync Backend

## Status

Accepted.

## Entscheidung

DocMan wird local-first und backend-agnostisch gebaut.

Die lokale App-Datenbank ist die primäre Arbeitsbasis der App. Kernfunktionen muessen ohne aktive Netzwerkverbindung nutzbar bleiben. Synchronisation ist Replikation, Backup und Multi-Geraete-Funktion, nicht die Voraussetzung fuer normale Nutzung.

Die stabile Produkt- und Architekturgrenze ist ein generisches DocMan Sync Backend:

```text
DocMan App <-> DocMan Sync Backend
```

Der DocMan Home Hub ist die erste empfohlene Backend-Variante fuer private Self-Hosted-Setups auf NAS, Mini-Server oder Heimserver. Tailscale ist die empfohlene private Netzwerkoption fuer fruehe Setups ohne offene eingehende Firewall-Ports. Tailscale ist aber kein Produktbestandteil, kein Domain-Begriff und keine harte Architekturabhaengigkeit.

Eine Managed-Cloud-Variante ist aktuell nicht Teil der Produktplanung. Die generische Backend-Grenze bleibt trotzdem wichtig, damit der Home Hub, ein privater VPS oder ein spaeterer anderer Self-Hosted-Stack austauschbar bleiben.

## Backend-Varianten

| Variante | Rolle |
|---|---|
| Home Hub | Erste empfohlene Self-Hosted-Variante fuer private Haushalte |
| VPS / Hosted Private Server | Alternative fuer Nutzer mit eigenem Server ausserhalb des Heimnetzes |
| Single-device mode | Lokale Nutzung ohne Sync Backend, mit Export/Backup als Fallback |

## Begründung

DocMan verwaltet sensible und langlebige Dokumente. Die App darf deshalb nicht davon abhaengen, dass ein bestimmter Server oder ein bestimmter Netzwerktransport jederzeit erreichbar ist.

Local-first gibt der Nutzerin Kontrolle, Offline-Faehigkeit und ein robustes Arbeitsmodell. Ein generisches Sync Backend haelt trotzdem Multi-Geraete-Nutzung, Backup, Mobile Capture und verschiedene Self-Hosted-Betriebsformen offen.

Tailscale passt sehr gut fuer den Anfang, weil es Heimserver und mobile Geraete privat verbinden kann, ohne Ports ins Heimnetz zu oeffnen. Trotzdem soll DocMan nicht zu einer Tailscale-spezifischen App werden. Die App kennt nur Backend-Adresse, Auth, Sync-Status und Faehigkeiten.

## Zielregeln

- Die App verwendet eine generische Backend-Konfiguration, nicht Tailscale-spezifische Logik.
- UI-Texte sprechen von "DocMan Backend", "Home Hub" oder "Verbindung", nicht von Tailscale als Produktfunktion.
- Core-Workflows funktionieren lokal ohne Netzwerk.
- Mobile Capture muss offline erfassen und Uploads fuer spaetere Synchronisation vormerken koennen.
- Sync ist asynchron und sichtbar.
- Konflikte duerfen nicht still ueberschrieben werden.
- Backend-SDKs und konkrete Transportdetails duerfen nicht in Domain-Kontrakte leaken.

## Konsequenzen

- Der erste Sync-Ausbau kann auf einen Home Hub zielen, muss aber ueber generische Schnittstellen geplant werden.
- PocketBase, falls weiter genutzt, ist eine austauschbare Backend-Implementierung und nicht Teil des Domain-Kerns.
- Tailscale gehoert in Setup-/Deployment-Dokumentation, nicht in Domain-Modell oder Produktlogik.
- Sync-Status, Upload-Queue, Konfliktanzeige und lokale Datei-Caches werden zentrale Foundation-Themen.
- Ein reiner Einzelgeraete-Modus bleibt als Einstieg oder Fallback moeglich.

## Offene Folgefragen

- Welche konkrete lokale Datenbank bleibt Ziel fuer die erste Foundation-Phase?
- Welche Daten duerfen in welcher Backend-Variante synchronisiert werden?
- Wie werden Dokumentdateien gespeichert: Dateisystem, Object Storage oder Datenbank-Blob nur als Ausnahme?
- Welche Auth-Strategie passt fuer Home Hub und private Server-Varianten gleichermassen?
- Welche Konfliktstrategie reicht fuer den ersten Multi-Geraete-Ausbau?
- Welche Setup-Oberflaeche braucht die App fuer Backend-URL, Health Check und Verbindungstest?
