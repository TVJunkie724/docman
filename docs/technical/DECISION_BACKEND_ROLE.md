---
title: "Superseded Draft - Backend Role and Self-hosted Server Stack"
description: "Historischer Backendentwurf; ersetzt durch Managed Mappm Cloud und contract-first Architektur"
tags: [decision, historical, superseded, backend]
lastUpdated: "2026-07-15"
status: "superseded"
owner: "backend/product"
---

# Superseded Draft - Backend Role and Self-hosted Server Stack

Der fruehere Self-Hosted-/Home-Hub-Entwurf ist verworfen und autorisiert keine
Implementierung. Docker/Compose bleibt ausschliesslich Local-Development-
Werkzeug mit synthetischen Daten.

Verbindlich sind:

- `docs/technical/DECISION_HOME_HUB_BACKEND_TECHNOLOGY.md` trotz historischem
  Dateinamen fuer den Managed-Mappm-Cloud-Zielstack;
- `docs/technical/DECISION_BACKEND_CONTRACT_FIRST_ARCHITECTURE.md`;
- `docs/technical/DECISION_API_CONTRACT_MOCKS.md`;
- `docs/technical/DECISION_FILE_STORAGE_AND_DOCKER_STACK.md`.

Frontend beschreibt Backendbedarf, aber ein getrenntes Backend-/Contract-Team
entscheidet DTOs, Endpunkte, Mapping, Persistenz und Policy-Architektur.
