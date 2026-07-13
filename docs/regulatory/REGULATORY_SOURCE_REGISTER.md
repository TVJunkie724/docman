---
title: "Mappm Regulatory Source Register"
description: "Datiertes Register offizieller Quellen und Applicability-Entscheidungen"
tags: [regulatory, eu, austria, sources, review]
lastUpdated: "2026-07-12"
status: "active-baseline"
owner: "compliance/product"
---

# Mappm Regulatory Source Register

## Review Boundary

Planning review date: 2026-07-11. This register is not legal advice and does not
replace counsel. It proves which official sources were checked and when. Every
affected implementation/release phase must refresh the applicable rows and
record the reviewer, result and next review trigger.

## Official Source Baseline

| Area | Official source | Current planning signal | Mappm applicability | Next mandatory review |
|---|---|---|---|---|
| GDPR/DSGVO | [Regulation (EU) 2016/679](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX:32016R0679) | Applies to personal-data processing | always applicable | before persistence, sync, support analytics or release |
| EU AI Act | [Regulation (EU) 2024/1689](https://eur-lex.europa.eu/eli/reg/2024/1689/oj/eng); [current Commission implementation overview](https://digital-strategy.ec.europa.eu/en/policies/regulatory-framework-ai) | staged application; general applicability from 2026-08-02 with exceptions and later high-risk dates; proposed/agreed simplifications must not be treated as operative law until legally effective | applicable to production OCR/LLM assistance; role and risk classification must be reviewed | before any real-document AI and again after material guidance or legislative change |
| Cyber Resilience Act | [Regulation (EU) 2024/2847](https://eur-lex.europa.eu/eli/reg/2024/2847/oj/eng); [Commission implementation summary](https://digital-strategy.ec.europa.eu/en/policies/cra-summary) | reporting obligations from 2026-09-11; full application from 2027-12-11 | expected for commercially supplied connected software; final scope needs legal review | before external beta/update infrastructure and before 2026-09-11 |
| eIDAS/EUDI | [Regulation (EU) 2024/1183](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX:32024R1183) | European Digital Identity Framework and wallet/relying-party obligations | conditional on login, account binding, signing or trusted sharing | before identity-provider design |
| NIS2 | [Directive (EU) 2022/2555](https://eur-lex.europa.eu/eli/dir/2022/2555/oj) | entity/sector/size and national transposition determine applicability | needs-review for managed cloud and enterprise operation | before managed service or enterprise procurement |
| Data Act | [Regulation (EU) 2023/2854](https://eur-lex.europa.eu/eli/reg/2023/2854/oj/eng); [Commission implementation overview](https://digital-strategy.ec.europa.eu/en/policies/data-act) | applicable since 2025-09-12; includes cloud switching/interoperability rules | conditional for managed cloud/data-processing service and provider switching | before managed cloud terms or portability design |
| Product Liability | [Directive (EU) 2024/2853](https://eur-lex.europa.eu/eli/dir/2024/2853/oj/eng) | software is covered; applies to products placed on market after 2026-12-09 | expected for commercial distribution; national implementation needs review | before first paid/public release and before 2026-12-09 |
| European Accessibility Act | [Directive (EU) 2019/882](https://eur-lex.europa.eu/eli/dir/2019/882/oj) | applies since 2025-06-28 to covered products/services including e-commerce services | scope review required for product, sales and support surfaces; accessibility remains product baseline regardless | before public commerce/store release |
| ID Austria | [Official Austrian ID Austria information](https://www.oesterreich.gv.at/id-austria.html) | Austrian national eID; relationship to EUDI implementation must be reviewed at integration time | conditional provider candidate, not mandatory login assumption | before REG-04/identity contract |

## Store And Platform Sources

Store rules change independently from EU law. Before distribution, REG-08 must
record dated checks of Apple App Review, Google Play policy, Microsoft Store
policy, macOS notarization and direct-download signing requirements for the
selected channels. A generic remembered rule is not valid evidence.

## Source Hierarchy

- EUR-Lex Official Journal or consolidated legislation is the legal primary
  source where available.
- Commission, Austrian government and regulator pages are implementation
  guidance and current-status evidence, not substitutes for the legal text.
- Proposals, political agreements, FAQs and summaries must be labeled as such;
  they may trigger review but do not silently overwrite operative law.
- Each affected phase records the exact source URLs, access date, reviewer and
  applicability result it relied on.

## Stop Rules

- Stop if an artifact claims legal review without source, date and reviewer.
- Stop if a future/pending amendment is described as final law.
- Stop if commercial, store, cloud, AI or identity implementation starts before
  the applicable row is refreshed and classified.
- Stop if legal applicability is silently decided by an implementation agent.
