# BCG Corp — Governance Document Registry

**Version:** 1.3
**Effective:** March 2026
**Last Updated:** 2026-03-10
**Scope:** All Claude Projects (P0–P9) and subprojects
**Owner:** Gregory Bernardo, President

---

## 1. Purpose

This file is the single index of all BCG governance documents maintained
in GitHub at `bcgcorp/bcg-ops-governance/standards/` as the single source
of truth. Every Claude Project's instructions contain a short stub pointing
to this registry rather than embedding the full document list. When the
governance doc collection changes (new docs added, files renamed, fetch
triggers updated), only this file is edited — not 12+ project instructions.

**Update this file when:** a governance document is added, renamed, retired,
or its fetch triggers change.

**Architecture:**
- Governance documents (.md) → GitHub `bcgcorp/bcg-ops-governance/standards/`
  fetched via `web_fetch` raw URLs
- Shareable/distributable files (.docx, .pdf) → OneDrive `Corp/` folders
  fetched via MS365 connector
- The two layers do not overlap. OneDrive is not a source of truth for
  governance content.

---

## 2. How Projects Use This Registry

Each Claude Project's custom instructions contain a stub like this:
```
GLOBAL GOVERNANCE DOCUMENTS

BCG maintains governance documents in GitHub as the single source of truth.
Before producing work, fetch the Governance Doc Registry:
- URL: https://raw.githubusercontent.com/bcgcorp/bcg-ops-governance/refs/heads/main/standards/BCG_Governance_Doc_Registry.md
- Action: Fetch this URL first. It lists all governance docs, their raw
  GitHub URLs, fetch triggers, and rules. Then fetch only the docs
  relevant to the current task — not all of them every time.

If GitHub registry fetch fails, flag:
[GOVERNANCE WARNING: GitHub registry fetch failed. Proceed with best
available knowledge and flag all outputs as [GOVERNANCE UNVERIFIED]
until Gregory confirms whether to continue or reschedule.]
```

The stub is identical across all projects. It never needs editing unless
the registry URL itself changes.

---

## 3. Runtime-Fetched Governance Documents

These documents are fetched by Claude during conversations when the task
matches the fetch trigger. Fetch only the ones relevant to the current
task — not all every time. All documents are fetched via `web_fetch` using
the raw GitHub URLs listed below.

### 3.1 BCG Style and Formatting Standards

| Field | Value |
|-------|-------|
| **File** | `BCG_Style_and_Formatting_Standards.md` |
| **Raw URL** | `https://raw.githubusercontent.com/bcgcorp/bcg-ops-governance/refs/heads/main/standards/BCG_Style_and_Formatting_Standards.md` |
| **Current Version** | See file header |
| **Fetch before** | Any document creation, formatting decision, evaluation report, or when uncertain about BCG conventions |
| **Governs** | Typography, colors, tables, timeline tags, security boundaries, evaluation conventions, EAB specification, project/subproject registries, SOP format, contribution workflow, pressure-test framework |

### 3.2 Our Guiding Principles

| Field | Value |
|-------|-------|
| **File** | `[TEAM] Our Guiding Principles.docx` |
| **Location** | OneDrive `Corp/AI/Standards/` — fetch via MS365 connector |
| **Fetch before** | Strategic, culture, or principles-related outputs |
| **Governs** | BCG Corp's three core principles |
| **Note** | This is the only governance document that remains on OneDrive. It is a .docx intended for distribution; it is not a machine-readable governance file. |

### 3.3 Project Ecosystem & Handoffs

| Field | Value |
|-------|-------|
| **File** | `BCG_Project_Ecosystem_and_Handoffs.md` |
| **Raw URL** | `https://raw.githubusercontent.com/bcgcorp/bcg-ops-governance/refs/heads/main/standards/BCG_Project_Ecosystem_and_Handoffs.md` |
| **Current Version** | See file header |
| **Fetch before** | Cross-project routing decisions, handoff creation, subproject setup, dependency tracking |
| **Governs** | Project registry (P0–P9), subproject registry, routing rules, handoff label format, dependency tracking, EAB deployment specification |

### 3.4 Team Directory & Roles

| Field | Value |
|-------|-------|
| **File** | `BCG_Team_Directory.md` |
| **Raw URL** | `https://raw.githubusercontent.com/bcgcorp/bcg-ops-governance/refs/heads/main/standards/BCG_Team_Directory.md` |
| **Current Version** | See file header |
| **Fetch before** | Assigning owners/reviewers, referencing team members, onboarding tasks, headcount questions |
| **Governs** | Roster, titles, emails, project assignments, availability, current headcount |

### 3.5 Infrastructure Inventory

| Field | Value |
|-------|-------|
| **File** | `BCG_Infrastructure_Inventory.md` |
| **Raw URL** | `https://raw.githubusercontent.com/bcgcorp/bcg-ops-governance/refs/heads/main/standards/BCG_Infrastructure_Inventory.md` |
| **Current Version** | See file header |
| **Fetch before** | Deployment plans, security assessments, technology evaluations, infrastructure references, data classification questions |
| **Governs** | Compute (VM hosts, AI hardware), servers, endpoints, network, ERP (Odoo 18), cloud platforms, AI tools, security controls, data classification tiers, monitoring status, MCP deployment tracker, planned infrastructure changes |

### 3.6 Initiative & Workstream Catalog

| Field | Value |
|-------|-------|
| **File** | `BCG_Initiative_and_Workstream_Catalog.md` |
| **Raw URL** | `https://raw.githubusercontent.com/bcgcorp/bcg-ops-governance/refs/heads/main/standards/BCG_Initiative_and_Workstream_Catalog.md` |
| **Current Version** | See file header |
| **Fetch before** | Strategic planning, initiative status checks, resource allocation, workstream references |
| **Governs** | Active initiatives, workstreams (WS-01–WS-11), initiative ownership, target timelines, dependencies |

### 3.7 Custom Module Registry

| Field | Value |
|-------|-------|
| **File** | `BCG_Custom_Module_Registry.md` |
| **Raw URL** | `https://raw.githubusercontent.com/bcgcorp/bcg-ops-governance/refs/heads/main/standards/BCG_Custom_Module_Registry.md` |
| **Current Version** | See file header |
| **Fetch before** | Any Odoo module development, audit, or deployment work; P7 subproject setup |
| **Governs** | All BCG custom Odoo 18 modules — status, version, repo location, dependencies, open items |

### 3.8 SOP Governance & Intake Protocol

| Field | Value |
|-------|-------|
| **File** | `BCG_SOP_Governance_and_Intake_Protocol.md` |
| **Raw URL** | `https://raw.githubusercontent.com/bcgcorp/bcg-ops-governance/refs/heads/main/standards/BCG_SOP_Governance_and_Intake_Protocol.md` |
| **Current Version** | 1.0 |
| **Fetch before** | Any SOP intake classification, W-series ID assignment, or P0→P2 handoff creation |
| **Governs** | How new workflow ideas are surfaced, classified, tiered, and handed off for SOP drafting; W-series ID registry rules; standard handoff prompt format; distinction between W-series SOPs and governance documents |

---

## 4. Embedded Governance Documents

These documents are NOT fetched at runtime. They are pasted directly into
project instructions during setup or propagation.

### 4.1 Ecosystem Awareness Block (EAB)

| Field | Value |
|-------|-------|
| **File** | `BCG_Ecosystem_Awareness_Block.md` |
| **Raw URL** | `https://raw.githubusercontent.com/bcgcorp/bcg-ops-governance/refs/heads/main/standards/BCG_Ecosystem_Awareness_Block.md` |
| **Current Version** | See file header |
| **Deployment method** | Copy-paste into custom instructions (not fetched at runtime) |
| **Placement** | After SECURITY BOUNDARIES, before COMMANDS & SHORTCUTS |
| **Scope** | All satellite projects (P1–P9) and subprojects |
| **Update trigger** | New project/subproject created, project renamed/closed, routing pattern added |

**Why embedded, not fetched:** The EAB provides cross-project routing and
handoff capabilities. These must work even when GitHub is unavailable.
Embedding ensures zero-dependency availability.

---

## 5. This Registry

### 5.1 Self-Reference

| Field | Value |
|-------|-------|
| **File** | `BCG_Governance_Doc_Registry.md` |
| **Raw URL** | `https://raw.githubusercontent.com/bcgcorp/bcg-ops-governance/refs/heads/main/standards/BCG_Governance_Doc_Registry.md` |
| **Current Version** | 1.3 |
| **Deployment method** | Fetched at runtime via the stub in each project's instructions |
| **Update trigger** | Governance document added, renamed, retired, or fetch triggers changed |

### 5.2 Total Document Count

| Category | Count | Documents |
|----------|-------|-----------|
| Runtime-fetched (GitHub) | 7 | Style Guide, Ecosystem & Handoffs, Team Directory, Infrastructure Inventory, Initiative Catalog, Custom Module Registry, SOP Governance & Intake Protocol |
| Runtime-fetched (OneDrive) | 1 | Our Guiding Principles (.docx) |
| Embedded | 1 | EAB |
| Registry (this file) | 1 | Governance Doc Registry |
| **Total** | **10** | — |

---

## 6. Rules

1. **GitHub is the single source of truth** for all governance documents.
   Do not maintain duplicate copies in OneDrive for machine-readable
   governance files.
2. **OneDrive is for distributable files only** — .docx, .pdf, and files
   intended for human sharing (e.g., Our Guiding Principles.docx,
   Risk Register.docx). These are not fetched as governance inputs.
3. **Fetch only relevant documents** per task — not all runtime docs every
   time. Use the fetch triggers in Section 3 to decide which to pull.
4. **If GitHub fetch fails,** proceed with best available knowledge and
   flag: `[GOVERNANCE WARNING: GitHub registry fetch failed. Proceed with
   best available knowledge and flag all outputs as [GOVERNANCE UNVERIFIED]
   until Gregory confirms whether to continue or reschedule.]`
5. **When updating any governance document,** update this registry if the
   version number, filename, or fetch triggers changed.
6. **EAB updates require propagation** to all satellite projects and
   subprojects. See Style Guide for the propagation protocol.

---

## 7. Change Log

| Version | Date | What Changed |
|---------|------|--------------|
| 1.3 | 2026-03-10 | Corrected architecture: GitHub is single source of truth for all governance docs. Removed OneDrive as governance doc destination. Updated all doc entries to include raw GitHub URLs. Updated stub in Section 2 to GitHub-only fetch pattern. Updated scope to P0–P9. Added SOP Governance & Intake Protocol (Section 3.8). Updated Section 5.2 totals. |
| 1.2 | 2026-03-10 | Added Section 3.8 — SOP Governance & Intake Protocol. (Superseded same day by v1.3 architecture correction.) |
| 1.1 | 2026-03-07 | Added Section 3.7 — BCG Custom Module Registry. |
| 1.0 | 2026-03-01 | Initial version. |

---

*This file is the entry point for all BCG governance document fetching.
Maintained in GitHub at bcgcorp/bcg-ops-governance/standards/.
When governance documents change, update this file — not 12 project instructions.*
```

---

**Commit message:**
```
Fix governance architecture: GitHub as single source of truth (v1.3)

- Corrected all doc entries to GitHub raw URLs (removed OneDrive paths)
- Updated Section 2 stub to GitHub-only web_fetch pattern
- Clarified OneDrive role: distributable files only (.docx/.pdf)
- Updated scope to P0–P9
- Added SOP Governance & Intake Protocol (Section 3.8)
- Supersedes v1.2 which incorrectly retained OneDrive as governance destination
