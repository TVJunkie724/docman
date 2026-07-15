---
title: "MP-DS-07 Platform Adaptation"
description: "Plattformanpassungsvertrag fuer Mappm Desktop- und Mobile-UI"
tags: [design-system, platform, desktop, mobile, flutter]
lastUpdated: "2026-07-15"
status: "active-draft"
owner: "ui-concept/platform"
---

# MP-DS-07 Platform Adaptation

## Scope

Definiert die produktseitige Anpassung fuer macOS und Mobile Capture zuerst,
mit Gates fuer iOS, Android und spaeter Windows/Linux. Das Konzept autorisiert
keine Native Plugins, Permissions oder Packaging-Entscheidungen ohne
Foundation-/Platform-Planung.

## Erforderliche Anpassung

| Bereich | Desktop | Mobile |
|---|---|---|
| Navigation | persistente Shell/Sidebar, wenn Platz reicht | kompakte Navigation, Sheets/Fullscreen Selection |
| Eingabe | Tastatur, Pointer, Drag/drop und File Picker | Touch Targets, Kamera/Scan und Permission Recovery |
| Workbench | List/Detail/Preview-Kompositionen | fokussierter Capture-/Review-Fortschritt |
| Feedback | Inline-/Panel-Feedback ohne sensible Shell-Leaks | unterbrechungssicheres Queue-/Offline-Feedback |
| Lifecycle | Window Resize, Resume und Multi-window-Entscheid | Background/Resume, Permission Changes, unterbrochener Upload |

## Plattform-Gates

- Jede Phase nennt unterstuetzte Plattformen und explizite Nichtziele.
- Permission Denial und spaetere Recovery ueber Settings sind spezifiziert.
- Native Verhalten darf variieren; Domain-Ergebnis, Privacy und Terminologie
  bleiben konsistent.
- Store, Signing, Entitlements und Native-Dependency-Review gehoeren den
  Release-, Compliance- und Foundation-Ownern.

## Verifikation und Stop Rules

Plaene brauchen Responsive-/Widget-Evidenz und bei nativen Pfaden echte
Target-Platform-Smoke-Checks. Stop, wenn `responsive` ohne Referenzgroessen und
Zustaende behauptet, ein Permission-Modell auf andere Plattformen uebertragen
oder eine Native Dependency ohne Owner/Releasewirkung eingefuehrt wird.
Handoff an `ui-architect` fuer UI und `foundation-builder` fuer Native/
Platform-Arbeit.
