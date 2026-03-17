# BCG Corp — Governance Document Registry

**Version:** 1.8  
**Effective:** March 2026  
**Last Updated:** 2026-03-16  
**Scope:** All Claude Projects (P0–P10) and subprojects  
**Owner:** Gregory Bernardo, President

**v1.8 Changes:** Corrected 9 version entries from full audit of all 18 files on main HEAD. All versions now verified against actual file headers on GitHub.

---

## 1. Purpose

This file is the single index of all BCG governance documents maintained in GitHub at `bcg-ops-governance/standards/`. Every Claude Project's instructions contain a short stub pointing to this registry. When the governance doc collection changes, only this file is edited — not 17+ project instructions.

**Source of truth:** GitHub (GOV-001). OneDrive copies at `Corp/AI/Standards/` are archive/backup only.

**Update this file when:** a governance document is added, renamed, retired, or its fetch triggers change.

---

## 2. How Projects Use This Registry

Each Claude Project's custom instructions contain a stub pointing to:

```
https://raw.githubusercontent.com/bcgcorp/bcg-ops-governance/refs/heads/main/standards/BCG_Governance_Doc_Registry.md
```

---

## 3. Runtime-Fetched Governance Documents

| # | File | Version | Updated | Fetch Before | Governs |
|---|------|---------|---------|-------------|---------|
| 3.1 | `BCG_Style_and_Formatting_Standards.md` | 1.4 | 2026-03-16 | Document creation, formatting decisions | Typography, colors, security boundaries, SOP format, project registries, eval conventions |
| 3.2 | `[TEAM] Our Guiding Principles.docx` | N/A | N/A | Strategic/culture outputs | BCG's three core principles. Binary .docx — not raw-fetchable. |
| 3.3 | `BCG_Project_Ecosystem_and_Handoffs.md` | 1.4 | 2026-03-16 | Routing, handoffs, subproject setup | Project registry (P0–P10), 6 subprojects, routing rules, dependencies |
| 3.4 | `BCG_Team_Directory.md` | 2.0 | 2026-03-12 | Owner assignment, team references | Roster, titles, emails, project assignments |
| 3.5 | `BCG_Infrastructure_Inventory.md` | 1.2 | 2026-03-15 | Deployment plans, security assessments | Compute, network, ERP, AI tools. Note: v1.3 pending (Highland Village + NUC9 + scope P0–P10). |
| 3.6 | `BCG_Initiative_and_Workstream_Catalog.md` | 2.0 | 2026-03-15 | Strategic planning, initiative status | 61 initiatives (I-01–I-63 minus I-20/I-32), 11 workstreams, next slot I-64 |
| 3.7 | `BCG_Custom_Module_Registry.md` | 1.1 | 2026-03-15 | Odoo module development | All BCG custom Odoo 18 modules. 7 of 17 catalogued — Track 2 audit pending. |
| 3.8 | `BCG_Artifact_Naming_and_Capture_Standard.md` | 1.1 | 2026-03-14 | File naming, artifact capture | Naming patterns, capture workflows, folder conventions |
| 3.9 | `BCG_Ecosystem_Vocabulary.md` | 1.1 | 2026-03-14 | Term definitions, agenda generation | Single source for ecosystem terminology |
| 3.10 | `BCG_SOP_Governance_and_Intake_Protocol.md` | 1.0 | 2026-03-10 | SOP creation, intake workflow | SOP creation/approval workflow, intake classification |
| 3.11 | `BCG_W20_Ecosystem_Triage_SOP.md` | 1.0 | 2026-03-12 | P0-001 triage operations | Triage protocol, classification matrix, routing rules |
| 3.12 | `BCG_Ecosystem_Performance_Assessment_Prompt.md` | 1.0 | 2026-03-11 | Ecosystem assessments, health checks | Tier 1/2/3 assessment checklists, scoring methodology |
| 3.13 | `BCG_pyRevit_Tab_Style_Guide.md` | 1.0 | 2026-03 | pyRevit button development | 7-panel BCG tab architecture, icon specs (#1B3A5C) |
| 3.14 | `BCG_P9_Risk_Resilience_Prompt.md` | 1.0 | 2026-03-11 | Business continuity, risk register | P9 project structure, risk methodology, BCP framework |
| 3.15 | `BCG_Tools_Inventory.md` | 1.0 | 2026-03-16 | Tool selection, license audits | BCGTools pyRevit extension. 42 buttons across 9 panels. |

---

## 4. Embedded Governance Documents

| File | Version | Updated | Deployment | Scope |
|------|---------|---------|-----------|-------|
| `BCG_Ecosystem_Awareness_Block.md` | 1.4 | 2026-03-16 | Copy-paste into custom instructions | All satellites (P1–P10) and subprojects |

---

## 5. Data Files

| File | Version | Status | Purpose |
|------|---------|--------|---------|
| `BCG_Document_Registry.json` | 1.0 | In review — internal data stale, needs refresh | Machine-readable doc status for dashboard |

---

## 6. This Registry

| Field | Value |
|-------|-------|
| **File** | `BCG_Governance_Doc_Registry.md` |
| **Current Version** | 1.8 |
| **Total files on GitHub** | 18 |

---

## 7. Rules

1. **GitHub is authoritative** (GOV-001). OneDrive = archive/backup only.
2. **Fetch only relevant documents** per task — use fetch triggers above.
3. **If GitHub fetch fails:** `[GOVERNANCE WARNING: GitHub fetch failed for {filename}. Proceed with best available knowledge. Flag outputs as GOVERNANCE UNVERIFIED.]`
4. **When updating any governance document,** update this registry if version/filename/triggers changed.
5. **EAB updates require propagation** to all satellite projects.
6. **Before publishing a new Registry version,** read every file on main HEAD and verify versions match. No assumptions from memory.

---

## 8. Scope Update Tracker

The following files still reference P0–P9 (should be P0–P10) or 16 projects (should be 17). Track until all are corrected:

| File | Current Scope | Needs | Status |
|------|--------------|-------|--------|
| `BCG_Artifact_Naming_and_Capture_Standard.md` | P0–P9, 16 projects | P0–P10, 17, add P10 row | Pending |
| `BCG_Ecosystem_Vocabulary.md` | P0–P9, 60 initiatives | P0–P10, 61, EAB v1.4 | Pending |
| `BCG_Team_Directory.md` | P0–P9, 16 projects | P0–P10, 17, add P10 to Gregory | Pending |
| `BCG_Infrastructure_Inventory.md` | P0–P9, 16 projects | P0–P10, 17 | Pending |
| `BCG_SOP_Governance_and_Intake_Protocol.md` | P0–P9 | P0–P10 | Pending |
| `BCG_Style_and_Formatting_Standards.md` | Section 16.4 says EAB v1.3 | EAB v1.4 | Pending |
| `BCG_Project_Ecosystem_and_Handoffs.md` | Section 5.4 says EAB v1.3 | EAB v1.4 | Pending |
| `BCG_Document_Registry.json` | Multiple stale entries | Full refresh needed | Pending |

---

## 9. Change Log

| Version | Date | What Changed |
|---------|------|-------------|
| 1.8 | 2026-03-16 | Corrected all 15 file version entries from full audit. Added Section 8 (Scope Update Tracker) for P10 propagation. Added Rule 6 (verify-before-publish). Flagged Document_Registry.json as stale. |
| 1.7 | 2026-03-16 | Complete rewrite. GitHub source-of-truth (GOV-001). Scope P0–P10. 18 files tracked. |
| 1.6 | 2026-03-12 | Updated EAB to v1.3. Added runtime-fetch docs. |
| 1.1 | 2026-03-07 | Added Custom Module Registry. |
| 1.0 | 2026-03-01 | Initial version. 9 files. |

---

*GitHub at `bcg-ops-governance/standards/` is the single source of truth (GOV-001). Before publishing a new version, verify every entry against actual file headers.*
