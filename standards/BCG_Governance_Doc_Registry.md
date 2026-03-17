# BCG Corp — Governance Document Registry

**Version:** 1.8
**Effective:** March 2026
**Last Updated:** 2026-03-16
**Scope:** All Claude Projects (P0–P10) and subprojects
**Owner:** Gregory Bernardo, President

---

## 1. Purpose

This file is the single index of all BCG governance documents maintained in GitHub at `bcg-ops-governance/standards/` as the single source of truth (GOV-001, approved 2026-03-11). Every Claude Project's instructions contain a short stub pointing to this registry. When the governance doc collection changes (new docs added, files renamed, fetch triggers updated), only this file is edited — not 17 project instructions.

**Source of truth:** GitHub (`bcg-ops-governance/standards/`). Per GOV-001, GitHub is the authoritative fetch source. OneDrive = archive/backup only.

**Update this file when:** a governance document is added, renamed, retired, or its fetch triggers change.

---

## 2. How Projects Use This Registry

Each Claude Project's custom instructions contain a governance stub that points to this registry on GitHub. The stub directs Claude to:
1. Fetch this registry first
2. Identify which documents are relevant to the current task
3. Fetch only the relevant docs using the direct URLs in Section 3

The stub is identical across all projects. It never needs editing unless the registry filename or GitHub URL changes.

---

## 3. Runtime-Fetched Governance Documents

These documents are fetched by Claude during conversations when the task matches the fetch trigger. Fetch only the ones relevant to the current task — not all every time.

**Base URL:** `https://raw.githubusercontent.com/bcgcorp/bcg-ops-governance/refs/heads/main/standards/`

### 3.1 BCG Style and Formatting Standards

| Field | Value |
|-------|-------|
| **File** | `BCG_Style_and_Formatting_Standards.md` |
| **Current Version** | 1.3 |
| **Fetch before** | Any document creation, formatting decision, evaluation report, or when uncertain about BCG conventions |
| **Governs** | Typography, colors, tables, timeline tags, security boundaries, evaluation conventions (Section 15), EAB specification (Section 16), project/subproject registries (Section 10), SOP format (Section 8), contribution workflow (Section 9), pressure-test framework (Section 11) |

### 3.2 Our Guiding Principles

| Field | Value |
|-------|-------|
| **File** | `[TEAM] Our Guiding Principles.docx` |
| **Current Version** | N/A (binary) |
| **Fetch before** | Strategic, culture, or principles-related outputs |
| **Governs** | BCG Corp's three core principles |
| **Note** | Binary .docx file — available on GitHub but not raw-fetchable as markdown |

### 3.3 Project Ecosystem & Handoffs

| Field | Value |
|-------|-------|
| **File** | `BCG_Project_Ecosystem_and_Handoffs.md` |
| **Current Version** | 1.4 |
| **Fetch before** | Cross-project routing decisions, handoff creation, subproject setup, dependency tracking |
| **Governs** | Project registry (P0–P10), subproject registry (6 active), routing rules, handoff label format, dependency tracking, EAB deployment specification (Section 5.4) |

### 3.4 Team Directory & Roles

| Field | Value |
|-------|-------|
| **File** | `BCG_Team_Directory.md` |
| **Current Version** | 2.1 |
| **Fetch before** | Assigning owners/reviewers, referencing team members, onboarding tasks, headcount questions |
| **Governs** | Roster (11 members + 1 vacant), titles, emails, project assignments, availability, current headcount |

### 3.5 Infrastructure Inventory

| Field | Value |
|-------|-------|
| **File** | `BCG_Infrastructure_Inventory.md` |
| **Current Version** | 1.3 |
| **Fetch before** | Deployment plans, security assessments, technology evaluations, infrastructure references, data classification questions |
| **Governs** | Compute (VM hosts, AI hardware), servers, endpoints, network (3 sites), ERP (Odoo 18), cloud platforms, AI tools, security controls, data classification tiers, monitoring status, MCP deployment tracker, GitHub/GitLab repos |

### 3.6 Initiative & Workstream Catalog

| Field | Value |
|-------|-------|
| **File** | `BCG_Initiative_and_Workstream_Catalog.md` |
| **Current Version** | 2.0 |
| **Fetch before** | Strategic planning, initiative status checks, resource allocation, workstream references, I-number assignment |
| **Governs** | Active initiatives (I-01–I-63, minus I-20 and I-32; 61 active), workstreams (WS-01–WS-11), initiative ownership, target timelines, dependencies. Next available slot: I-64. |

### 3.7 Custom Module Registry

| Field | Value |
|-------|-------|
| **File** | `BCG_Custom_Module_Registry.md` |
| **Current Version** | 1.0 |
| **Fetch before** | Any Odoo module development, audit, or deployment work; P7 context |
| **Governs** | All BCG custom Odoo 18 modules — status, version, repo location, dependencies, open items |

### 3.8 Ecosystem Vocabulary

| Field | Value |
|-------|-------|
| **File** | `BCG_Ecosystem_Vocabulary.md` |
| **Current Version** | 1.2 |
| **Fetch before** | Agenda generation (Page 3 / Reference tab), any context where ecosystem terminology needs standardization |
| **Governs** | Command terms, numbering systems (P#, I-##, W-##, D-##, B-##, WS-##), document/process terms, status definitions. Single source of truth for all terminology — never duplicate. |

### 3.9 Artifact Naming and Capture Standard

| Field | Value |
|-------|-------|
| **File** | `BCG_Artifact_Naming_and_Capture_Standard.md` |
| **Current Version** | 1.2 |
| **Fetch before** | Creating, naming, or filing any Claude-generated artifact (docx, md, pdf) |
| **Governs** | Document naming conventions, status values, storage locations, project code prefixes |

### 3.10 SOP Governance & Intake Protocol

| Field | Value |
|-------|-------|
| **File** | `BCG_SOP_Governance_and_Intake_Protocol.md` |
| **Current Version** | 1.0 |
| **Fetch before** | Surfacing new SOP ideas, classifying workflow candidates, assigning W-series IDs |
| **Governs** | SOP intake pipeline, tier classification, W-series ID assignment, handoff from any project to P2 |

### 3.11 W-20 Ecosystem Triage SOP

| Field | Value |
|-------|-------|
| **File** | `BCG_W20_Ecosystem_Triage_SOP.md` |
| **Current Version** | 1.0 |
| **Fetch before** | Ecosystem intake processing, governance audits, sync cycles |
| **Governs** | Intake-process-route cycle for P0/P0-001, initiative registration, subproject lifecycle, governance audit protocol |

### 3.12 Ecosystem Performance Assessment Prompt

| Field | Value |
|-------|-------|
| **File** | `BCG_Ecosystem_Performance_Assessment_Prompt.md` |
| **Current Version** | 1.0 |
| **Fetch before** | Running ecosystem performance assessment |
| **Governs** | Structured performance audit prompt for BCG's operational stack |
| **Note** | Paste prompt, not custom instructions. Project count needs update (says 11, now 17). |

### 3.13 P9 Risk & Resilience Prompt

| Field | Value |
|-------|-------|
| **File** | `BCG_P9_Risk_Resilience_Prompt.md` |
| **Current Version** | 1.0 |
| **Fetch before** | Running P9 Phase 1 risk/resilience assessment |
| **Governs** | Business continuity diagnostic prompt for dependency risk register |

### 3.14 pyRevit Tab Style Guide

| Field | Value |
|-------|-------|
| **File** | `BCG_pyRevit_Tab_Style_Guide.md` |
| **Current Version** | 1.0 (P4-001-STY-001) |
| **Fetch before** | Any pyRevit button development, icon design, or Revit ribbon customization |
| **Governs** | Button layout, icon colors (#1B3A5C icon Navy — intentionally different from doc Navy #1B365D), panel organization, tooltip standards |

### 3.15 Tools Inventory (pyRevit)

| Field | Value |
|-------|-------|
| **File** | `BCG_Tools_Inventory.md` |
| **Current Version** | 1.0 (GOV-013) |
| **Fetch before** | Referencing existing pyRevit buttons, checking button inventory, planning new tools |
| **Governs** | Complete BCGTools pyRevit extension inventory — 42 buttons across 9 panels |

---

## 4. Embedded Governance Documents

These documents are NOT fetched at runtime. They are pasted directly into project instructions during setup or propagation.

### 4.1 Ecosystem Awareness Block (EAB)

| Field | Value |
|-------|-------|
| **File** | `BCG_Ecosystem_Awareness_Block.md` |
| **Current Version** | 1.4 |
| **Deployment method** | Copy-paste into custom instructions (not fetched at runtime) |
| **Placement** | After SECURITY BOUNDARIES, before COMMANDS & SHORTCUTS |
| **Scope** | All satellite projects (P1–P10) and subprojects |
| **Update trigger** | New project/subproject created, project renamed/closed, routing pattern added |
| **Current propagation status** | v1.3 deployed to 15/16 projects (2026-03-12). v1.4 pending propagation (adds P10). |

**Why embedded, not fetched:** The EAB provides cross-project routing and handoff capabilities. These must work even when GitHub fetch fails. Embedding ensures zero-dependency availability.

---

## 5. Machine-Readable Registry

### 5.1 Document Registry JSON

| Field | Value |
|-------|-------|
| **File** | `BCG_Document_Registry.json` |
| **Purpose** | Machine-readable version of this registry for dashboard and automated tooling |
| **Note** | May lag behind this markdown file. This markdown file is authoritative. |

---

## 6. This Registry

### 6.1 Self-Reference

| Field | Value |
|-------|-------|
| **File** | `BCG_Governance_Doc_Registry.md` |
| **Current Version** | 1.8 |
| **Deployment method** | Fetched at runtime via the governance stub in each project's instructions |
| **Update trigger** | Governance document added, renamed, retired, or fetch triggers changed |

### 6.2 Total Document Count

| Category | Count | Documents |
|----------|-------|-----------|
| Runtime-fetched | 15 | Style Guide, Guiding Principles, Ecosystem & Handoffs, Team Directory, Infrastructure Inventory, Initiative Catalog, Custom Module Registry, Vocabulary, Artifact Naming, SOP Governance, W-20 Triage, Performance Assessment Prompt, P9 Risk Prompt, pyRevit Style Guide, Tools Inventory |
| Embedded | 1 | EAB |
| Machine-readable | 1 | Document Registry JSON |
| Registry (this file) | 1 | Governance Doc Registry |
| **Total in standards folder** | **18** | — |

---

## 7. Rules

1. **GitHub is the single source of truth** (GOV-001). Do NOT rely on OneDrive copies or previously uploaded copies in project knowledge bases.
2. **Fetch only relevant documents** per task — not all runtime docs every time. Use the fetch triggers in Section 3 to decide which to pull.
3. **If GitHub fetch fails,** proceed with best available knowledge and flag: `[GOVERNANCE WARNING: GitHub fetch failed for {filename}. Proceed with best available knowledge and flag all outputs as [GOVERNANCE UNVERIFIED] until Gregory confirms whether to continue or reschedule.]`
4. **When updating any governance document,** update this registry if the version number, filename, or fetch triggers changed.
5. **EAB updates require propagation** to all satellite projects. See EAB file Section 1 for the propagation protocol.
6. **One document owns one definition.** Never duplicate governance definitions across files. Reference the owning document instead.

---

## 8. Change Log

| Version | Date | What Changed |
|---------|------|--------------|
| 1.8 | 2026-03-16 | Complete rewrite. GitHub SOT (GOV-001). Scope P0–P10. Added 8 files not previously tracked (Vocabulary, Artifact Naming, SOP Governance, W-20 Triage, Performance Assessment, P9 Risk, pyRevit Style Guide, Tools Inventory). Added Document Registry JSON. Updated all version numbers to current. Total: 15 runtime-fetched, 1 embedded, 1 JSON, 1 registry = 18 files. |
| 1.1 | 2026-03-07 | Added Section 3.7 — BCG Custom Module Registry. Updated totals. |
| 1.0 | 2026-03-01 | Initial version. |

---

*This file is maintained in GitHub at bcg-ops-governance/standards/ and fetched by all Claude Projects via the instruction stub. When governance documents change, update this file — not 17 project instructions.*
