# BCG Corp — Governance Document Registry

**Version:** 1.8
**Effective:** March 2026
**Last Updated:** 2026-03-17
**Scope:** All Claude Projects (P0–P10) and subprojects
**Owner:** Gregory Bernardo, President

---

## 1. Purpose

This file is the single index of all BCG governance documents maintained in GitHub at `bcg-ops-governance/standards/` as the single source of truth (GOV-001, approved 2026-03-11). Every Claude Project's instructions contain a governance stub pointing to this registry rather than embedding the full document list. When the governance doc collection changes (new docs added, files renamed, fetch triggers updated), only this file is edited — not 17 project instructions.

**Update this file when:** a governance document is added, renamed, retired, or its fetch triggers change.

---

## 2. How Projects Use This Registry

Each Claude Project's custom instructions contain a GLOBAL GOVERNANCE DOCUMENTS section listing direct GitHub raw URLs for relevant documents. The registry itself is fetched first; then only the documents relevant to the current task are fetched.

**Source of truth:** GitHub (`bcg-ops-governance/standards/`). Per GOV-001, GitHub is the authoritative fetch source. OneDrive at `Corp/AI/Standards/` is archive/backup only.

**Base URL for all raw fetches:**
```
https://raw.githubusercontent.com/bcgcorp/bcg-ops-governance/refs/heads/main/standards/
```

---

## 3. Runtime-Fetched Governance Documents

These documents are fetched by Claude during conversations when the task matches the fetch trigger. Fetch only the ones relevant to the current task — not all every time.

### 3.1 BCG Style and Formatting Standards (GOV-006)

| Field | Value |
|-------|-------|
| **File** | `BCG_Style_and_Formatting_Standards.md` |
| **Current Version** | 1.4 |
| **Fetch before** | Any document creation, formatting decision, evaluation report, or when uncertain about BCG conventions |
| **Governs** | Typography, colors, tables, timeline tags, security boundaries, evaluation conventions (Section 15), EAB specification (Section 16), project/subproject registries (Section 10), SOP format (Section 8), contribution workflow (Section 9), pressure-test framework (Section 11) |

### 3.2 Our Guiding Principles

| Field | Value |
|-------|-------|
| **File** | `[TEAM] Our Guiding Principles.docx` |
| **Fetch before** | Strategic, culture, or principles-related outputs |
| **Governs** | BCG Corp's three core principles |
| **Note** | Binary .docx file in GitHub — not raw-fetchable via URL. Reference from knowledge base or OneDrive. |

### 3.3 Project Ecosystem & Handoffs (GOV-007)

| Field | Value |
|-------|-------|
| **File** | `BCG_Project_Ecosystem_and_Handoffs.md` |
| **Current Version** | 1.4 |
| **Fetch before** | Cross-project routing decisions, handoff creation, subproject setup, dependency tracking |
| **Governs** | Project registry (P0–P10), subproject registry (6 active), routing rules, handoff label format, dependency tracking, EAB deployment specification (Section 5.4) |

### 3.4 Team Directory & Roles (GOV-016)

| Field | Value |
|-------|-------|
| **File** | `BCG_Team_Directory.md` |
| **Current Version** | 2.1 |
| **Fetch before** | Assigning owners/reviewers, referencing team members, onboarding tasks, headcount questions |
| **Governs** | Roster (11 members + 1 vacant), titles, emails, project assignments, availability, current headcount, restricted assignments |

### 3.5 Infrastructure Inventory (GOV-009)

| Field | Value |
|-------|-------|
| **File** | `BCG_Infrastructure_Inventory.md` |
| **Current Version** | 1.3 |
| **Fetch before** | Deployment plans, security assessments, technology evaluations, infrastructure references, data classification questions |
| **Governs** | Compute (VM hosts, AI hardware, NUC9), servers, endpoints, network (3 sites), ERP (Odoo 18), cloud platforms (BIM360, ACC), AI tools, security controls, data classification tiers, monitoring status, MCP deployment tracker, planned infrastructure changes |

### 3.6 Initiative & Workstream Catalog (GOV-002)

| Field | Value |
|-------|-------|
| **File** | `BCG_Initiative_and_Workstream_Catalog.md` |
| **Current Version** | 2.0 |
| **Fetch before** | Strategic planning, initiative status checks, resource allocation, workstream references, I-number assignment |
| **Governs** | 61 active initiatives (I-01–I-63, minus I-20 and I-32), 11 workstreams (WS-01–WS-11), initiative ownership, target timelines, dependencies. Next available slot: I-64. |

### 3.7 Custom Module Registry (GOV-015)

| Field | Value |
|-------|-------|
| **File** | `BCG_Custom_Module_Registry.md` |
| **Current Version** | 1.1 |
| **Fetch before** | Any Odoo module development, audit, or deployment work; P7 initiative scoping |
| **Governs** | All BCG custom Odoo 18 modules — status, version, repo location, dependencies, open items. 7 of 17 modules catalogued; Track 2 repo audit pending. |

### 3.8 Artifact Naming & Capture Standard (GOV-014)

| Field | Value |
|-------|-------|
| **File** | `BCG_Artifact_Naming_and_Capture_Standard.md` |
| **Current Version** | 1.2 |
| **Fetch before** | Naming any Claude-generated artifact, filing outputs to OneDrive, exporting UI artifacts |
| **Governs** | Document output naming convention, UI artifact naming, capture workflow, security constraints for artifact export. 17 project codes registered. |

### 3.9 Ecosystem Vocabulary (GOV-012)

| Field | Value |
|-------|-------|
| **File** | `BCG_Ecosystem_Vocabulary.md` |
| **Current Version** | 1.2 |
| **Fetch before** | Generating weekly sync agendas, creating reference cards, when terminology questions arise |
| **Governs** | Command terms, ecosystem numbering patterns (P#, I-##, W-##, D-##, B-##, WS-##), document and process terms, status terms. Single source of truth for all ecosystem terminology — never duplicate definitions elsewhere. |

### 3.10 pyRevit Tab Style Guide (GOV-011)

| Field | Value |
|-------|-------|
| **File** | `BCG_pyRevit_Tab_Style_Guide.md` |
| **Current Version** | 1.0 |
| **Fetch before** | Any pyRevit button UI work, icon design, tooltip writing, panel organization |
| **Governs** | Panel architecture (7 panels), UI control selection, naming conventions, tooltip standards, icon standards, error handling, version control. Document ID: P4-001-STY-001. |

### 3.11 Tools Inventory (GOV-013)

| Field | Value |
|-------|-------|
| **File** | `BCG_Tools_Inventory.md` |
| **Current Version** | 1.0 |
| **Fetch before** | PyRevit button development, backlog review, panel inventory check |
| **Governs** | BCGTools pyRevit extension inventory. 42 buttons across 9 panels. Complete button descriptions and panel assignments. |

### 3.12 SOP Governance & Intake Protocol (SOP-GOV-001)

| Field | Value |
|-------|-------|
| **File** | `BCG_SOP_Governance_and_Intake_Protocol.md` |
| **Current Version** | 1.3 |
| **Fetch before** | Proposing a new SOP, classifying a workflow idea, generating a P0 to P2 handoff for SOP drafting |
| **Governs** | SOP intake classification, W-series ID assignment (current highest: W-23, next: W-24), tier assignment, key design decisions, standard handoff prompt format, approval loop. |

### 3.13 W-20 Ecosystem Triage SOP

| Field | Value |
|-------|-------|
| **File** | `BCG_W20_Ecosystem_Triage_SOP.md` |
| **Current Version** | 1.0 |
| **Fetch before** | Running triage sessions, performing governance audits, processing ecosystem updates |
| **Governs** | Intake-process-route cycle for BCG's Claude ecosystem. Three trigger types, four processing checklists, four audit tiers (biweekly/monthly/quarterly/annual), health metrics dashboard. |

### 3.14 Ecosystem Performance Assessment Prompt

| Field | Value |
|-------|-------|
| **File** | `BCG_Ecosystem_Performance_Assessment_Prompt.md` |
| **Current Version** | 1.0 |
| **Fetch before** | Running quarterly Tier 3 performance assessment |
| **Governs** | Structured prompt for diagnostic conversation assessing utilization, value delivery, adoption depth, integration, and ROI across BCG's operational stack. |

### 3.15 P9 Risk & Resilience Prompt

| Field | Value |
|-------|-------|
| **File** | `BCG_P9_Risk_Resilience_Prompt.md` |
| **Current Version** | 1.0 |
| **Fetch before** | Starting P9 Phase 1 risk assessment |
| **Governs** | Structured prompt for P9 diagnostic conversation producing the BCG Dependency Risk Register v1.0. Six dependency categories, five risk dimensions. |

---

## 4. Embedded Governance Documents

These documents are NOT fetched at runtime. They are embedded directly into project custom instructions.

### 4.1 Ecosystem Awareness Block (EAB) (GOV-008)

| Field | Value |
|-------|-------|
| **File** | `BCG_Ecosystem_Awareness_Block.md` |
| **Current Version** | 1.4 |
| **Deployment method** | Copy-paste into custom instructions (not fetched at runtime) |
| **Placement** | After SECURITY BOUNDARIES, before COMMANDS & SHORTCUTS |
| **Scope** | All satellite projects (P1–P10) and subprojects |
| **Update trigger** | New project/subproject created, project renamed/closed, routing pattern added |
| **See also** | Style Guide Section 16 for full EAB specification |

**Why embedded, not fetched:** The EAB provides cross-project routing and handoff capabilities. These must work even when GitHub is unavailable. Embedding ensures zero-dependency availability.

---

## 5. Machine-Readable Registry

### 5.1 BCG_Document_Registry.json (GOV-005)

| Field | Value |
|-------|-------|
| **File** | `BCG_Document_Registry.json` |
| **Current Version** | 1.1 |
| **Deployment method** | Fetched programmatically by dashboard and automation tools |
| **Governs** | Machine-readable document status tracking for all governance documents and SOPs. Used by the P0 dashboard for document health scoring. |

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
| Runtime-fetched | 15 | Style Guide, Guiding Principles, Ecosystem & Handoffs, Team Directory, Infrastructure Inventory, Initiative Catalog, Custom Module Registry, Artifact Naming, Ecosystem Vocabulary, pyRevit Tab Style Guide, Tools Inventory, SOP Governance, W-20 Triage SOP, Performance Assessment Prompt, P9 Risk Prompt |
| Embedded | 1 | EAB |
| Machine-readable | 1 | Document Registry JSON |
| Registry (this file) | 1 | Governance Doc Registry |
| **Total in standards folder** | **18** | — |

---

## 7. Rules

1. **GitHub is the single source of truth** (GOV-001, approved 2026-03-11). All governance documents live in `bcg-ops-governance/standards/`. OneDrive at `Corp/AI/Standards/` is archive/backup only.
2. **Fetch only relevant documents** per task — not all runtime docs every time. Use the fetch triggers in Section 3 to decide which to pull.
3. **If GitHub fetch fails,** flag: `[GOVERNANCE WARNING: GitHub fetch failed for [filename]. Proceed with best available knowledge and flag all outputs as [GOVERNANCE UNVERIFIED] until Gregory confirms whether to continue or reschedule.]`
4. **When updating any governance document,** update this registry if the version number, filename, or fetch triggers changed.
5. **EAB updates require propagation** to all satellite projects. See Style Guide Section 16 for the propagation protocol.
6. **Do NOT rely on previously uploaded copies** of governance documents in project knowledge bases. The GitHub versions are authoritative.

---

## 8. Change Log

| Version | Date | What Changed |
|---------|------|-------------|
| 1.8 | 2026-03-17 | Complete rewrite. Migrated source of truth from OneDrive to GitHub per GOV-001. Updated from 9 to 18 tracked files. Added Sections 3.8-3.15. Added Section 4.1 EAB. Added Section 5.1 JSON registry. Updated all version numbers to current. Updated Rules section for GitHub-first governance. |
| 1.1 | 2026-03-07 | Added Section 3.7 — BCG Custom Module Registry. Updated totals. |
| 1.0 | 2026-03-01 | Initial version. |

---

*This file is maintained in GitHub at bcg-ops-governance/standards/ and fetched by all Claude Projects via the instruction stub. When governance documents change, update this file — not 17 project instructions.*