# BCG Corp -- Governance Document Registry

**Version:** 3.1
**Effective:** March 2026
**Last Updated:** 2026-04-17
**Scope:** All Claude Projects (P0-P11) and subprojects
**Owner:** Gregory Bernardo, President

---

## 1. Purpose

This file is the single index of all BCG governance documents maintained in GitHub at `bcg-ops-governance/standards/` as the single source of truth (GOV-001, approved 2026-03-11). Every Claude Project's instructions contain a governance stub pointing to this registry rather than embedding the full document list. When the governance doc collection changes (new docs added, files renamed, fetch triggers updated), only this file is edited -- not 18 project instructions.

**Update this file when:** a governance document is added, renamed, retired, or its fetch triggers change.

---

## 2. How Projects Use This Registry

Each Claude Project's custom instructions contain a GLOBAL GOVERNANCE DOCUMENTS section listing direct GitHub raw URLs for relevant documents. The registry itself is fetched first; then only the documents relevant to the current task are fetched.

**Source of truth:** GitHub (`bcg-ops-governance/standards/`). Per GOV-001, GitHub is the authoritative fetch source. OneDrive at `Corp/AI/Standards/` is archive/backup only.

**Base URL for all raw fetches:**
```
https://raw.githubusercontent.com/bcgcorp/bcg-ops-governance/refs/heads/main/standards/
```

**CRITICAL FETCH RULE (confirmed 2026-03-22):** Never use web_fetch on raw.githubusercontent.com for GitHub files. Always use github-write:get_file_contents (R/W MCP, direct API, no cache). The raw CDN serves stale content -- proven failure 2026-03-22 (served v1.4 when v2.2 was committed). No exceptions. No fallback to web_fetch.

---

## 3. Runtime-Fetched Governance Documents

These documents are fetched by Claude during conversations when the task matches the fetch trigger. Fetch only the ones relevant to the current task -- not all every time.

### 3.1 BCG Style and Formatting Standards (GOV-006)

| Field | Value |
|-------|-------|
| **File** | `BCG_Style_and_Formatting_Standards.md` |
| **Current Version** | 1.5 |
| **Fetch before** | Any document creation, formatting decision, evaluation report, or when uncertain about BCG conventions |
| **Governs** | Typography, colors, tables, timeline tags, security boundaries, evaluation conventions (Section 15), EAB specification (Section 16), project/subproject registries (Section 10), SOP format (Section 8), contribution workflow (Section 9), pressure-test framework (Section 11) |

### 3.2 Our Guiding Principles

| Field | Value |
|-------|-------|
| **File** | `[TEAM] Our Guiding Principles.docx` |
| **Fetch before** | Strategic, culture, or principles-related outputs |
| **Governs** | BCG Corp's three core principles |
| **Note** | Binary .docx file in GitHub -- not raw-fetchable via URL. Reference from knowledge base or OneDrive. |

### 3.3 Project Ecosystem & Handoffs (GOV-007)

| Field | Value |
|-------|-------|
| **File** | `BCG_Project_Ecosystem_and_Handoffs.md` |
| **Current Version** | 1.9 |
| **Fetch before** | Cross-project routing decisions, handoff creation, subproject setup, dependency tracking |
| **Governs** | Project registry (P0-P11), subproject registry (6 active), routing rules, handoff label format, dependency tracking, EAB deployment specification (Section 5.4). Section 3.5: Handoff Validation Protocol (three-question origin check + [ORIGIN:] audit line for automated pipelines). P11 access: Gregory & Jennifer Brezniak. Section 7: Approved Handoff Log maintained in chronological order. |

### 3.4 Team Directory & Roles (GOV-016)

| Field | Value |
|-------|-------|
| **File** | `BCG_Team_Directory.md` |
| **Current Version** | 2.4 |
| **Fetch before** | Assigning owners/reviewers, referencing team members, onboarding tasks, headcount questions |
| **Governs** | Roster (12 members + 1 vacant), titles, emails, project assignments, availability, current headcount, restricted assignments. Includes Jason Harris (Active, Fractional W-2, started 2026-04-01) and Oscar Cucaita Sanchez (Project Manager, full-time, started 2026-04-15). |

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
| **Current Version** | 2.8 |
| **Fetch before** | Strategic planning, initiative status checks, resource allocation, workstream references, I-number assignment |
| **Governs** | 69 active initiatives (I-01--I-72, minus I-20, I-30, and I-32), 11 workstreams (WS-01--WS-11), initiative ownership, target timelines, dependencies. Next available slot: I-73. W-24 claimed (I-70 Schedule Tracking SOP). Next W-slot: W-25. |

### 3.7 Custom Module Registry (GOV-015)

| Field | Value |
|-------|-------|
| **File** | `BCG_Custom_Module_Registry.md` |
| **Current Version** | 1.1 |
| **Fetch before** | Any Odoo module development, audit, or deployment work; P7 initiative scoping |
| **Governs** | All BCG custom Odoo 18 modules -- status, version, repo location, dependencies, open items. 7 of 17 modules catalogued; Track 2 repo audit pending. |

### 3.8 Artifact Naming & Capture Standard (GOV-014)

| Field | Value |
|-------|-------|
| **File** | `BCG_Artifact_Naming_and_Capture_Standard.md` |
| **Current Version** | 1.2 |
| **Fetch before** | Naming any Claude-generated artifact, filing outputs to OneDrive, exporting UI artifacts |
| **Governs** | Document output naming convention, UI artifact naming, capture workflow, security constraints for artifact export. 18 project codes registered. |

### 3.9 Ecosystem Vocabulary (GOV-012)

| Field | Value |
|-------|-------|
| **File** | `BCG_Ecosystem_Vocabulary.md` |
| **Current Version** | 1.2 |
| **Fetch before** | Generating weekly sync agendas, creating reference cards, when terminology questions arise |
| **Governs** | Command terms, ecosystem numbering patterns (P#, I-##, W-##, D-##, B-##, WS-##), document and process terms, status terms. Single source of truth for all ecosystem terminology -- never duplicate definitions elsewhere. |

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
| **Current Version** | 1.3 |
| **Fetch before** | PyRevit button development, backlog review, panel inventory check, status confirmation, print button references |
| **Governs** | BCGTools pyRevit extension inventory. 52 buttons across 11 panels. Complete button descriptions, panel assignments, deployment status, gate conditions for print buttons (B-43--B-46). BCG Notes panel (B-49--B-52, status: Designed). B-47/B-48 pending panel assignment confirmation. |

### 3.12 SOP Governance & Intake Protocol (SOP-GOV-001)

| Field | Value |
|-------|-------|
| **File** | `BCG_SOP_Governance_and_Intake_Protocol.md` |
| **Current Version** | 1.5 |
| **Fetch before** | Proposing a new SOP, classifying a workflow idea, generating a P0 to P2 handoff for SOP drafting |
| **Governs** | SOP intake classification, W-series ID assignment (current highest: W-24 claimed by I-70; next available: W-25), tier assignment, key design decisions, standard handoff prompt format, approval loop. |

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
| **Current Version** | 1.1 |
| **Fetch before** | Running quarterly Tier 3 performance assessment |
| **Governs** | Structured prompt for diagnostic conversation assessing utilization, value delivery, adoption depth, integration, and ROI across BCG's operational stack. |

### 3.15 P9 Risk & Resilience Prompt

| Field | Value |
|-------|-------|
| **File** | `BCG_P9_Risk_Resilience_Prompt.md` |
| **Current Version** | 1.1 |
| **Fetch before** | Starting P9 Phase 1 risk assessment |
| **Governs** | Structured prompt for P9 diagnostic conversation producing the BCG Dependency Risk Register v1.0. Six dependency categories, five risk dimensions. |

### 3.16 P4-002 Technical Architecture Standards (GOV-017)

| Field | Value |
|-------|-------|
| **File** | `BCG_P4002_Technical_Architecture.md` |
| **Current Version** | 1.1 |
| **Fetch before** | Any pyRevit code review, CLAUDE.md authoring, PR triage for bcg-ops-revit-tools, or when an architectural decision is in question |
| **Governs** | IronPython ASCII constraint, AppSettings_01 opaque schema rules (including violation patterns), three-transaction sheet architecture, Revit API constraints, Windsurf/windsurfrules coding environment, CI/CD pipeline phase status, pending P4-002 deliverables. |

### 3.17 Project Code Registry (GOV-018)

| Field | Value |
|-------|-------|
| **File** | `BCG_Project_Registry.md` |
| **Current Version** | 2.2 |
| **Fetch before** | Any 4am Cowork schedule tracking run, any Team Project consolidation, any Odoo intake processing, any project code validation or prime firm lookup, any P3 competitive intel update involving prime firm assignments |
| **Governs** | All registered BCG project codes, campus groupings, site assignments, prime firm relationships. 82 total entries (79 standard + 3 non-standard BOD Titus) across 24 campuses and 14 sites (AMA, ATL, BOD, CMH, IAD, IAH, LBB, PBI, PDX, PHL, PHX, STL, YUL, YYC). 1 placeholder (AUS150). All 24 campuses confirmed. 6 prime firms (Arcadis, HKS, Gensler, Corgan, S+R, Atlantic AE). Updated when projects are awarded or closed. Source of truth for I-70 Cowork Schedule Tracker confidence scoring. |

### 3.18 Windsurf Agent Skills Deployment Pattern (GOV-019)

| Field | Value |
|-------|-------|
| **File** | `BCG_Windsurf_Skills_Deployment_Pattern.md` |
| **Current Version** | 1.0 |
| **Fetch before** | Deploying any new third-party skill source to Windsurf/Cascade, bumping versions of existing vendored skills, authoring new BCG-specific skills, resolving per-user-drift issues in skill behavior |
| **Governs** | Workspace-scope + git-vendoring + pinned-version pattern for all BCG skill deployments. Directory structure (`.windsurf/skills/`), SKILL.md requirements, version marker file convention, install/update procedures, coexistence rules with Rules/Workflows/AGENTS.md, Claude Code portability notes, known BCG deployments tracker. Derived from I-72 Superpowers v5.0.7 installation. |

---

## 4. Embedded Governance Documents

These documents are NOT fetched at runtime. They are embedded directly into project custom instructions.

### 4.1 Ecosystem Awareness Block (EAB) (GOV-008)

| Field | Value |
|-------|-------|
| **File** | `BCG_Ecosystem_Awareness_Block.md` |
| **Current Version** | 1.6 |
| **Deployment method** | Copy-paste into custom instructions (not fetched at runtime) |
| **Placement** | After SECURITY BOUNDARIES, before COMMANDS & SHORTCUTS |
| **Scope** | All satellite projects (P1-P11) and subprojects |
| **Update trigger** | New project/subproject created, project renamed/closed, routing pattern added |
| **See also** | Style Guide Section 16 for full EAB specification |
| **Propagation status** | v1.5 fully propagated to all 17 projects (complete 2026-03-17). v1.6 deployed to P11 (2026-04-01). Propagation of v1.6 to remaining 16 projects pending. |

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
| **Current Version** | 3.1 |
| **Deployment method** | Fetched at runtime via the governance stub in each project's instructions |
| **Update trigger** | Governance document added, renamed, retired, or fetch triggers changed |

### 6.2 Total Document Count

| Category | Count | Documents |
|----------|-------|----------|
| Runtime-fetched | 18 | Style Guide, Guiding Principles, Ecosystem & Handoffs, Team Directory, Infrastructure Inventory, Initiative Catalog, Custom Module Registry, Artifact Naming, Ecosystem Vocabulary, pyRevit Tab Style Guide, Tools Inventory, SOP Governance, W-20 Triage SOP, Performance Assessment Prompt, P9 Risk Prompt, P4-002 Technical Architecture, Project Code Registry, Windsurf Skills Deployment Pattern |
| Embedded | 1 | EAB |
| Machine-readable | 1 | Document Registry JSON |
| Registry (this file) | 1 | Governance Doc Registry |
| Reference documents | 1 | Ecosystem Architecture Analysis |
| Status documents | 1 | Ecosystem Status (current: 2026-04-15) |
| **Total in standards folder** | **23** | -- |

---

## 7. Rules

1. **GitHub is the single source of truth** (GOV-001, approved 2026-03-11). All governance documents live in `bcg-ops-governance/standards/`. OneDrive at `Corp/AI/Standards/` is archive/backup only.
2. **Fetch only relevant documents** per task -- not all runtime docs every time. Use the fetch triggers in Section 3 to decide which to pull.
3. **Never use web_fetch on raw.githubusercontent.com** -- always use github-write:get_file_contents (R/W MCP, direct API). The raw CDN serves stale content. Proven failure 2026-03-22.
4. **If GitHub MCP is unavailable,** flag: `[GOVERNANCE WARNING: GitHub MCP unavailable. Proceed with best available knowledge and flag all outputs as [GOVERNANCE UNVERIFIED] until Gregory confirms whether to continue or reschedule.]`
5. **When updating any governance document,** update this registry if the version number, filename, or fetch triggers changed.
6. **EAB updates require propagation** to all satellite projects. See Style Guide Section 16 for the propagation protocol.
7. **Do NOT rely on previously uploaded copies** of governance documents in project knowledge bases. The GitHub versions are authoritative.

---

## 8. Change Log

| Version | Date | What Changed |
|---------|------|-------------|
| 3.1 | 2026-04-17 | Added Section 3.18 -- Windsurf Agent Skills Deployment Pattern (GOV-019, v1.0). Derived from I-72 Superpowers v5.0.7 install. Updated GOV-007 tracked version 1.8→1.9 (added 2026-04-17 P0→P4 handoff to log). Updated GOV-002 tracked version 2.7→2.8 (I-72 registered, 69 active, next slot I-73). Updated runtime-fetched count 17→18. Updated total doc count 22→23. |
| 3.0 | 2026-04-15 | Audit fixes: GOV-007 tracked version 1.5→1.8 (Handoff Validation Protocol, P11 Jennifer access). GOV-016 tracked version 2.1→2.4 (Jason active, Oscar added). GOV-002 tracked version 2.6→2.7 (count corrected 69→68). EAB tracked version 1.5→1.6; corrected propagation note (v1.5 complete 2026-03-17; v1.6 to P11 only; 16 projects pending v1.6). Added Section 9 (Reference Documents — Ecosystem Architecture Analysis). Added Section 10 (Status Documents — Ecosystem Status). Updated total document count 20→22. |
| 2.9 | 2026-04-04 | Bumped GOV-013 tracked version 1.2→1.3. Updated governs description: 52 buttons, 11 panels, BCG Notes panel (B-49--B-52), B-47/B-48 pending. |
| 2.8 | 2026-03-26 | GOV-002 tracked version 2.5→2.6 (69 active initiatives, next slot I-72, W-24 claimed/W-25 next). SOP-GOV-001 corrected tracked version 1.3→1.5 (file was already v1.4; bumped to v1.5 this session for W-slot update). |
| 2.7 | 2026-03-24 | Updated GOV-002 tracked version 2.4→2.5 (68 active initiatives, next slot I-71). Updated GOV-018 tracked version 2.1→2.2 (BOD Titus clarification). |
| 2.6 | 2026-03-24 | Updated GOV-018 tracked version 1.0→2.0. Updated governs description: 78 entries, 23 campuses, 13 sites, 14 unconfirmed primes. |
| 2.5 | 2026-03-24 | Added Section 3.17 -- BCG Project Code Registry (GOV-018, v1.0). Updated runtime-fetched count 16→17. Updated total doc count 19→20. |
| 2.4 | 2026-03-22 | Bumped Catalog tracked version 2.1→2.4. Added raw.githubusercontent.com hard fetch rule. Added EAB propagation status note. |
| 2.3 | 2026-03-22 | Bumped GOV-013 tracked version 1.1→1.2. Bumped GOV-017 tracked version 1.0→1.1. |
| 2.2 | 2026-03-22 | Added GOV-017 (P4-002 Technical Architecture Standards). Updated total doc count 18→19. |
| 2.1 | 2026-03-17 | Corrected tracked versions: Performance Assessment Prompt 1.0→1.1, P9 Risk Prompt 1.0→1.1. |
| 2.0 | 2026-03-17 | Bumped Style Guide 1.4→1.5. Self-reference 1.9→2.0. |
| 1.9 | 2026-03-17 | Updated scope P0-P10 to P0-P11. Bumped Handoffs, Catalog, EAB versions. |
| 1.8 | 2026-03-17 | Complete rewrite. Migrated to GitHub-first governance. |
| 1.1 | 2026-03-07 | Added BCG Custom Module Registry. |
| 1.0 | 2026-03-01 | Initial version. |

---

## 9. Reference Documents

These documents are committed to `standards/` for reference and are indexed here for folder hygiene. They are not runtime-fetched governance standards but are tracked to prevent unregistered orphan files.

### 9.1 Ecosystem Architecture Analysis

| Field | Value |
|-------|-------|
| **File** | `BCG_Ecosystem_Architecture_Analysis.md` |
| **Type** | Reference document — informational, not runtime-fetched |
| **Registered** | 2026-04-15 |
| **Governs** | Comprehensive architecture analysis of BCG's 18-project Claude ecosystem. Produced 2026-03-22. |

---

## 10. Status Documents

Status documents are operational snapshots committed to `standards/` at each sync cycle. The current file is authoritative; prior versions are superseded and may be deleted. Not runtime-fetched — upload current version to P0 project knowledge to activate as runtime reference.

### 10.1 Ecosystem Status

| Field | Value |
|-------|-------|
| **File pattern** | `BCG_Ecosystem_Status_YYYY-MM-DD.md` |
| **Current file** | `BCG_Ecosystem_Status_2026-04-15.md` |
| **Type** | Operational status snapshot — superseded by next sync |
| **Governs** | Current state of all 18 projects, team load, open decisions, 30/60/90-day horizon. Upload to P0 project knowledge to activate as runtime reference. Delete prior dated versions after upload. |

---

*This file is maintained in GitHub at bcg-ops-governance/standards/ and fetched by all Claude Projects via the instruction stub. When governance documents change, update this file -- not 18 project instructions.*
