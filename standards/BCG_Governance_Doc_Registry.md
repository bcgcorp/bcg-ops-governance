# BCG Corp — Governance Document Registry

**Version:** 1.7
**Effective:** March 2026
**Last Updated:** 2026-03-16
**Scope:** All Claude Projects (P0–P9) and subprojects
**Owner:** Gregory Bernardo, President

---

## 1. Purpose

This file is the single index of all BCG governance documents maintained in GitHub at `bcgcorp/bcg-ops-governance/standards/`. Every Claude Project's instructions contain a governance stub pointing to this registry. When the governance doc collection changes (new docs added, files renamed, fetch triggers updated), only this file is edited — not 16+ project instructions.

**Source of truth:** GitHub (`bcg-ops-governance/standards/`). Per GOV-001 (approved 2026-03-11), GitHub is the authoritative fetch source. OneDrive is archive/backup only.

**Update this file when:** a governance document is added, renamed, retired, or its fetch triggers change.

**Base path:** `https://raw.githubusercontent.com/bcgcorp/bcg-ops-governance/refs/heads/main/standards/`

---

## 2. How Projects Use This Registry

Each Claude Project's custom instructions contain a governance stub:

```
GLOBAL GOVERNANCE DOCUMENTS

BCG maintains governance documents in GitHub as the single source of
truth (GOV-001, approved 2026-03-11). All standards files live at:

BASE PATH: https://raw.githubusercontent.com/bcgcorp/bcg-ops-governance/refs/heads/main/standards/

STEP 1 — Fetch the Registry first:
https://raw.githubusercontent.com/bcgcorp/bcg-ops-governance/refs/heads/main/standards/BCG_Governance_Doc_Registry.md

STEP 2 — Fetch only the docs relevant to the current task using the
direct URLs listed in the Registry. Do not fetch all docs every time.

If GitHub fetch fails on any file, flag:
[GOVERNANCE WARNING: GitHub fetch failed for [filename]. Proceed with
best available knowledge and flag all outputs as [GOVERNANCE UNVERIFIED]
until Gregory confirms whether to continue or reschedule.]
```

---

## 3. Runtime-Fetched Governance Documents

Fetch only the ones relevant to the current task — not all every time. Use the fetch triggers below to decide.

### 3.1 BCG Style and Formatting Standards

| Field | Value |
|-------|-------|
| **File** | `BCG_Style_and_Formatting_Standards.md` |
| **Fetch URL** | `https://raw.githubusercontent.com/bcgcorp/bcg-ops-governance/refs/heads/main/standards/BCG_Style_and_Formatting_Standards.md` |
| **Current Version** | 1.5 |
| **Fetch before** | Any document creation, formatting decision, evaluation report, or when uncertain about BCG conventions |
| **Governs** | Typography, colors, tables, timeline tags, security boundaries, evaluation conventions, EAB specification, project/subproject registries, SOP format, contribution workflow, pressure-test framework |

### 3.2 Our Guiding Principles

| Field | Value |
|-------|-------|
| **File** | `[TEAM] Our Guiding Principles.docx` |
| **Location** | OneDrive `Corp/AI/Standards/` (not raw-fetchable — .docx format) |
| **Fetch before** | Strategic, culture, or principles-related outputs |
| **Governs** | BCG Corp's three core principles |

### 3.3 Project Ecosystem & Handoffs

| Field | Value |
|-------|-------|
| **File** | `BCG_Project_Ecosystem_and_Handoffs.md` |
| **Fetch URL** | `https://raw.githubusercontent.com/bcgcorp/bcg-ops-governance/refs/heads/main/standards/BCG_Project_Ecosystem_and_Handoffs.md` |
| **Current Version** | 1.6 |
| **Fetch before** | Cross-project routing decisions, handoff creation, subproject setup, dependency tracking |
| **Governs** | Project registry (P0–P9), subproject registry, routing rules, handoff label format, dependency tracking, EAB deployment specification |

### 3.4 Team Directory & Roles

| Field | Value |
|-------|-------|
| **File** | `BCG_Team_Directory.md` |
| **Fetch URL** | `https://raw.githubusercontent.com/bcgcorp/bcg-ops-governance/refs/heads/main/standards/BCG_Team_Directory.md` |
| **Current Version** | 2.0 |
| **Fetch before** | Assigning owners/reviewers, referencing team members, onboarding tasks, headcount questions |
| **Governs** | Roster, titles, emails, project assignments, availability, current headcount |

### 3.5 Infrastructure Inventory

| Field | Value |
|-------|-------|
| **File** | `BCG_Infrastructure_Inventory.md` |
| **Fetch URL** | `https://raw.githubusercontent.com/bcgcorp/bcg-ops-governance/refs/heads/main/standards/BCG_Infrastructure_Inventory.md` |
| **Current Version** | 1.2 |
| **Fetch before** | Deployment plans, security assessments, technology evaluations, infrastructure references, data classification questions |
| **Governs** | Compute (VM hosts, AI hardware), servers, endpoints, network, ERP (Odoo 18), cloud platforms, AI tools, security controls, data classification tiers, monitoring status, MCP deployment tracker, planned infrastructure changes |

### 3.6 Initiative & Workstream Catalog

| Field | Value |
|-------|-------|
| **File** | `BCG_Initiative_and_Workstream_Catalog.md` |
| **Fetch URL** | `https://raw.githubusercontent.com/bcgcorp/bcg-ops-governance/refs/heads/main/standards/BCG_Initiative_and_Workstream_Catalog.md` |
| **Current Version** | 1.9 |
| **Fetch before** | Strategic planning, initiative status checks, resource allocation, workstream references, I-number assignment (always fetch before assigning a new I-number to confirm next available slot) |
| **Governs** | Active initiatives (I-01–I-62, minus I-20 removed and I-32 rejected; 60 active total), workstreams (WS-01–WS-11), subproject registry, initiative ownership, target timelines, dependencies. Next available slot: I-63. |

### 3.7 Custom Module Registry

| Field | Value |
|-------|-------|
| **File** | `BCG_Custom_Module_Registry.md` |
| **Fetch URL** | `https://raw.githubusercontent.com/bcgcorp/bcg-ops-governance/refs/heads/main/standards/BCG_Custom_Module_Registry.md` |
| **Current Version** | 1.1 |
| **Fetch before** | Any Odoo module development, audit, or deployment work; P7 subproject setup |
| **Governs** | All BCG custom Odoo 18 modules — status, version, repo location, dependencies, open items. NOTE: Track 2 repo audit pending (Victor) — registry currently shows 7 of 17 installed modules. |

### 3.8 BCG pyRevit Tab Style Guide

| Field | Value |
|-------|-------|
| **File** | `BCG_pyRevit_Tab_Style_Guide.md` |
| **Fetch URL** | `https://raw.githubusercontent.com/bcgcorp/bcg-ops-governance/refs/heads/main/standards/BCG_pyRevit_Tab_Style_Guide.md` |
| **Document ID** | P4-001-STY-001 |
| **Current Version** | 1.0 |
| **Fetch before** | Any pyRevit button development, BCG tab panel changes, icon creation, WPF dialog theming, tooltip authoring, error UX design, or button backlog work (B-01–B-41) in any project or subproject |
| **Governs** | Tab panel architecture (7 panels, fixed order, P0 approval gate), UI control selection, naming conventions, tooltip 3-line structure, icon specifications (32×32 + 16×16, 7-color palette), error handling UX, success feedback, Help & Support panel, version control scheme, deployment checklist |
| **P0 approval gate** | Panel name changes, panel order changes, and naming convention changes require P0 approval before P4-001 implements. Tooltip/icon/error UX changes → P4-001 implements and informs P0 after. |
| **Note** | Icon palette Navy `#1B3A5C` is intentionally different from document brand Navy `#1B365D` — optimized for 32×32 px on Revit ribbon background. Do NOT correct `#1B3A5C` to `#1B365D` in icon contexts. Ruling confirmed 2026-03-14. |

### 3.9 Ecosystem Vocabulary

| Field | Value |
|-------|-------|
| **File** | `BCG_Ecosystem_Vocabulary.md` |
| **Fetch URL** | `https://raw.githubusercontent.com/bcgcorp/bcg-ops-governance/refs/heads/main/standards/BCG_Ecosystem_Vocabulary.md` |
| **Current Version** | 1.1 |
| **Fetch before** | Weekly sync agenda generation (Page 3 vocabulary section), BCG-Wizard guide updates, any output requiring ecosystem term definitions, onboarding materials |
| **Governs** | Single source of truth for all BCG ecosystem terminology: command terms, numbering patterns (I-/W-/D-/B-/WS-), document & process terms, status terms. All surfaces reference this file — never duplicate definitions. |

### 3.10 SOP Governance & Intake Protocol

| Field | Value |
|-------|-------|
| **File** | `BCG_SOP_Governance_and_Intake_Protocol.md` |
| **Fetch URL** | `https://raw.githubusercontent.com/bcgcorp/bcg-ops-governance/refs/heads/main/standards/BCG_SOP_Governance_and_Intake_Protocol.md` |
| **Current Version** | 1.2 |
| **Fetch before** | Creating a new SOP, assigning a W-series ID, routing a SOP idea from any satellite to P2, or generating a P0→P2 handoff prompt for a new workflow |
| **Governs** | SOP intake classification, tier assignment (Tier 1/2/3), W-series ID assignment, standard P0→P2 handoff prompt format, approval loop, registry update checklist. Current highest assigned W-ID: W-22. Next available: W-23. |

### 3.11 W-20 Ecosystem Triage SOP

| Field | Value |
|-------|-------|
| **File** | `BCG_W20_Ecosystem_Triage_SOP.md` |
| **Fetch URL** | `https://raw.githubusercontent.com/bcgcorp/bcg-ops-governance/refs/heads/main/standards/BCG_W20_Ecosystem_Triage_SOP.md` |
| **Current Version** | 1.0 |
| **Fetch before** | Running ecosystem triage (biweekly sync), processing structural changes (new I-numbers, subprojects), conducting governance audits, ecosystem health assessment |
| **Governs** | Intake-process-route cycle for P0; three trigger types (scheduled, event-driven, structural); four processing checklists (4A–4C); four-tier governance audit framework (Tier 1 every sync through Tier 4 annual); ecosystem health metrics; standard update template for satellite → P0 updates |

### 3.12 Artifact Naming & Capture Standard

| Field | Value |
|-------|-------|
| **File** | `BCG_Artifact_Naming_and_Capture_Standard.md` |
| **Fetch URL** | `https://raw.githubusercontent.com/bcgcorp/bcg-ops-governance/refs/heads/main/standards/BCG_Artifact_Naming_and_Capture_Standard.md` |
| **Current Version** | 1.1 |
| **Fetch before** | Naming or storing any Claude-generated document or UI artifact, setting up output folder structure, onboarding a new producer |
| **Governs** | Document naming convention (`[STATUS]_[PROJECT]_[Topic]_[YYYY-MM-DD].[ext]`), UI artifact naming (`BCG-UI-[PROJECT]-[TYPE]-v[#]`), capture workflow (Option A manual, Option B future automated), security constraints on artifact export |

### 3.13 Ecosystem Performance Assessment Prompt

| Field | Value |
|-------|-------|
| **File** | `BCG_Ecosystem_Performance_Assessment_Prompt.md` |
| **Fetch URL** | `https://raw.githubusercontent.com/bcgcorp/bcg-ops-governance/refs/heads/main/standards/BCG_Ecosystem_Performance_Assessment_Prompt.md` |
| **Current Version** | 1.1 |
| **Fetch before** | Running a performance audit of BCG's operational stack (Claude ecosystem, Odoo, AI infrastructure, design tools, M365, overall integration). Quarterly or on-demand. |
| **Governs** | Diagnostic prompt and assessment framework for ecosystem performance evaluation. Covers 6 categories. Produces executive summary, category scorecards, cross-cutting findings, priority action list. |

### 3.14 P9 Risk & Resilience Assessment Prompt

| Field | Value |
|-------|-------|
| **File** | `BCG_P9_Risk_Resilience_Prompt.md` |
| **Fetch URL** | `https://raw.githubusercontent.com/bcgcorp/bcg-ops-governance/refs/heads/main/standards/BCG_P9_Risk_Resilience_Prompt.md` |
| **Current Version** | 1.1 |
| **Fetch before** | Beginning P9 Phase 1 (Dependency Risk Register), conducting business continuity assessment, identifying single points of failure |
| **Governs** | Diagnostic prompt for P9 Phase 1 risk assessment. Covers 6 dependency categories. Produces BCG Dependency Risk Register v1.0, top failure scenarios, critical gaps summary, continuity protocol recommendations. |

### 3.15 BCG Tools Inventory

| Field | Value |
|-------|-------|
| **File** | `BCG_Tools_Inventory.md` |
| **Fetch URL** | `https://raw.githubusercontent.com/bcgcorp/bcg-ops-governance/refs/heads/main/standards/BCG_Tools_Inventory.md` |
| **Document ID** | GOV-013 |
| **Current Version** | 1.0 |
| **Fetch before** | Any pyRevit button development or audit, scoping new B-number backlog items, onboarding new P4 contributors, reviewing BCGTools extension scope, resolving button naming or panel assignment questions |
| **Governs** | Complete inventory of all 42 buttons across 9 panels in the BCGTools pyRevit extension: FOV (4), IronRacks (2), Linked CAD (3), LinkedModel (4), PIDS (12), Parameters (2), RenumberElements (6), Sheets (7), Temp (3). Each button includes description and workflow step where applicable. Companion reference to BCG_pyRevit_Tab_Style_Guide.md (GOV-011 / P4-001-STY-001). |

---

## 4. Embedded Governance Documents

These documents are NOT fetched at runtime. They are pasted directly into project instructions during setup or propagation.

### 4.1 Ecosystem Awareness Block (EAB)

| Field | Value |
|-------|-------|
| **File** | `BCG_Ecosystem_Awareness_Block.md` |
| **Fetch URL** | `https://raw.githubusercontent.com/bcgcorp/bcg-ops-governance/refs/heads/main/standards/BCG_Ecosystem_Awareness_Block.md` |
| **Current Version** | 1.3 |
| **Deployment method** | Copy-paste into custom instructions (not fetched at runtime) |
| **Placement** | After SECURITY BOUNDARIES, before COMMANDS & SHORTCUTS |
| **Scope** | All satellite projects (P1–P9) and subprojects (P0-001, P4-001, P4-002, P5-001, P5-002, P8-001) |
| **Update trigger** | New project/subproject created or retired, project renamed/closed, routing pattern added |

**Why embedded, not fetched:** The EAB provides cross-project routing and handoff capabilities that must work even when GitHub is unavailable. Embedding ensures zero-dependency availability.

---

## 5. This Registry

### 5.1 Self-Reference

| Field | Value |
|-------|-------|
| **File** | `BCG_Governance_Doc_Registry.md` |
| **Fetch URL** | `https://raw.githubusercontent.com/bcgcorp/bcg-ops-governance/refs/heads/main/standards/BCG_Governance_Doc_Registry.md` |
| **Current Version** | 1.7 |
| **Deployment method** | Fetched at runtime via the governance stub in each project's instructions |
| **Update trigger** | Governance document added, renamed, retired, or fetch triggers changed |

### 5.2 Total Document Count

| Category | Count | Documents |
|----------|-------|-----------|
| Runtime-fetched (.md) | 14 | Style Guide, Project Ecosystem & Handoffs, Team Directory, Infrastructure Inventory, Initiative Catalog, Custom Module Registry, pyRevit Tab Style Guide, Ecosystem Vocabulary, SOP Governance & Intake Protocol, W-20 Triage SOP, Artifact Naming Standard, Ecosystem Performance Assessment Prompt, P9 Risk & Resilience Prompt, Tools Inventory |
| Runtime-fetched (.docx, non-raw) | 1 | Guiding Principles (OneDrive only) |
| Embedded (EAB) | 1 | Ecosystem Awareness Block |
| Registry (this file) | 1 | Governance Doc Registry |
| **Total in Standards folder** | **17** | — |

---

## 6. Rules

1. **GitHub is the single source of truth** per GOV-001 (approved 2026-03-11). OneDrive is archive/backup only.
2. **Fetch only relevant documents** per task — not all runtime docs every time. Use the fetch triggers in Section 3 to decide which to pull.
3. **If a GitHub fetch fails,** flag: `[GOVERNANCE WARNING: GitHub fetch failed for [filename]. Proceed with best available knowledge and flag all outputs as [GOVERNANCE UNVERIFIED] until Gregory confirms whether to continue or reschedule.]`
4. **When updating any governance document,** update this registry if the version number, filename, or fetch triggers changed.
5. **EAB updates require propagation** to all satellite and subproject instructions. See BCG_Ecosystem_Awareness_Block.md for the propagation protocol.
6. **Before assigning any new I-number,** fetch the Initiative Catalog from GitHub and confirm the next available slot. Never assign from memory.
7. **The Guiding Principles .docx** is not raw-fetchable from GitHub. Access via OneDrive at `Corp/AI/Standards/[TEAM] Our Guiding Principles.docx`.

---

## 7. Change Log

| Version | Date | What Changed |
|---------|------|--------------|
| 1.7 | 2026-03-16 | Added Section 3.15 — BCG Tools Inventory (GOV-013, `BCG_Tools_Inventory.md`, P4-001). Updated Section 5.2: runtime-fetched 13→14, total 16→17. |
| 1.6 | 2026-03-15 | 3.1 Style Guide: v1.4 → v1.5 (veteran recognition generalized — named individuals removed). |
| 1.5 | 2026-03-15 | 3.6 Initiative Catalog: v1.8 → v1.9 (I-24 Active, 50-state research complete, P6 executing). 3.5 Infrastructure Inventory: v1.1 → v1.2 (PyRevit repo corrected to GitLab). 3.7 Custom Module Registry: v1.0 → v1.1 (P7-004 reference scrubbed, audit gap noted). |
| 1.4 | 2026-03-14 | Updated version numbers to reflect batch follow-on commit (4950b0b). 3.1 Style Guide v1.3→v1.4. 3.3 Project Ecosystem v1.5→v1.6. 3.6 Catalog v1.7→v1.8 (B-number corrections, P4-002 subproject updated). 3.9 Vocabulary v1.0→v1.1. 3.10 SOP Governance v1.1→v1.2. 3.12 Artifact Naming v1.0→v1.1. 3.13 Performance Prompt v1.0→v1.1. 3.14 P9 Risk Prompt v1.0→v1.1. Registry self-reference bumped to v1.4. |
| 1.3 | 2026-03-14 | Version number alignment pass — corrected registry entries to match actual file versions on disk at time of commit. B-range updated B-01–B-27→B-01–B-41. |
| 1.2 | 2026-03-14 | Comprehensive rewrite per GOV-001 migration. Converted all file locations from OneDrive to GitHub. Updated all filenames from .txt to .md. Added Sections 3.8–3.14. Fixed Section 3.6 scope. Updated totals and rules. |
| 1.1 | 2026-03-07 | Added Section 3.7 — BCG Custom Module Registry. Updated Section 5.2 totals (runtime-fetched 6→7, total 8→9). |
| 1.0 | 2026-03-01 | Initial version. Externalized from the ~40-line GLOBAL GOVERNANCE DOCUMENTS boilerplate previously embedded in all project instructions. |

---

*This file is maintained in GitHub at bcgcorp/bcg-ops-governance/standards/ and fetched by all Claude Projects via the instruction stub. When governance documents change, update this file — not 16 project instructions.*
