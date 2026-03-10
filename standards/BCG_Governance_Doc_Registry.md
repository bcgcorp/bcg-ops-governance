# BCG Corp — Governance Document Registry

**Version:** 1.2
**Effective:** March 2026
**Last Updated:** 2026-03-05
**Scope:** All Claude Projects (P0–P8) and subprojects
**Owner:** Gregory Bernardo, President

---

## 1. Purpose

This file is the single index of all BCG governance documents maintained in OneDrive at `Corp/AI/Standards/`. Every Claude Project's instructions contain a short stub pointing to this registry rather than embedding the full document list. When the governance doc collection changes (new docs added, files renamed, fetch triggers updated), only this file is edited — not 11+ project instructions.

**Update this file when:** a governance document is added, renamed, retired, or its fetch triggers change.

---

## 2. How Projects Use This Registry

Each Claude Project's custom instructions contain a stub like this:

```
GLOBAL GOVERNANCE DOCUMENTS
BCG maintains governance documents in OneDrive at Corp/AI/Standards/ as the
single source of truth. Before producing work, fetch the Governance Doc
Registry to identify which documents are relevant to the current task:
- File: [REF] BCG_Governance_Doc_Registry.txt
- Location: OneDrive Corp/AI/Standards/
- Action: Fetch this file first. It lists all governance documents, their
  filenames, fetch triggers, and rules. Then fetch only the docs relevant
  to the current task — not all of them every time.
If the MS365 connector is unavailable, proceed with best available knowledge
and flag: [NOTE: Unable to fetch current governance documents from OneDrive.
Standards applied from prior knowledge may not reflect latest version.]
```

The stub is identical across all projects. It never needs editing unless the registry filename itself changes.

---

## 3. Runtime-Fetched Governance Documents

These documents are fetched by Claude during conversations when the task matches the fetch trigger. Fetch only the ones relevant to the current task — not all every time.

### 3.1 BCG Style and Formatting Standards

| Field | Value |
|-------|-------|
| **File** | `[REF] BCG_Style_and_Formatting_Standards.txt` |
| **Location** | OneDrive `Corp/AI/Standards/` |
| **Current Version** | 1.3 |
| **Fetch before** | Any document creation, formatting decision, evaluation report, or when uncertain about BCG conventions |
| **Governs** | Typography, colors, tables, timeline tags, security boundaries, evaluation conventions (Section 15), EAB specification (Section 16), project/subproject registries (Section 10), SOP format (Section 8), contribution workflow (Section 9), pressure-test framework (Section 11) |

### 3.2 Our Guiding Principles

| Field | Value |
|-------|-------|
| **File** | `[TEAM] Our Guiding Principles.docx` |
| **Location** | OneDrive `Corp/AI/Standards/` |
| **Fetch before** | Strategic, culture, or principles-related outputs |
| **Governs** | BCG Corp's three core principles |

### 3.3 Project Ecosystem & Handoffs

| Field | Value |
|-------|-------|
| **File** | `[REF] BCG_Project_Ecosystem_and_Handoffs.txt` |
| **Location** | OneDrive `Corp/AI/Standards/` |
| **Current Version** | 1.2 |
| **Fetch before** | Cross-project routing decisions, handoff creation, subproject setup, dependency tracking |
| **Governs** | Project registry (P0–P8), subproject registry, routing rules, handoff label format, dependency tracking, EAB deployment specification (Section 5.4) |

### 3.4 Team Directory & Roles

| Field | Value |
|-------|-------|
| **File** | `[REF] BCG_Team_Directory.txt` |
| **Location** | OneDrive `Corp/AI/Standards/` |
| **Fetch before** | Assigning owners/reviewers, referencing team members, onboarding tasks, headcount questions |
| **Governs** | Roster, titles, emails, project assignments, availability, current headcount |

### 3.5 Infrastructure Inventory

| Field | Value |
|-------|-------|
| **File** | `[REF] BCG_Infrastructure_Inventory.txt` |
| **Location** | OneDrive `Corp/AI/Standards/` |
| **Current Version** | 1.0 |
| **Fetch before** | Deployment plans, security assessments, technology evaluations, infrastructure references, data classification questions |
| **Governs** | Compute (VM hosts, AI hardware), servers, endpoints, network, ERP (Odoo 18), cloud platforms, AI tools, security controls, data classification tiers, monitoring status, MCP deployment tracker, planned infrastructure changes |

### 3.6 Initiative & Workstream Catalog

| Field | Value |
|-------|-------|
| **File** | `[REF] BCG_Initiative_and_Workstream_Catalog.txt` |
| **Location** | OneDrive `Corp/AI/Standards/` |
| **Fetch before** | Strategic planning, initiative status checks, resource allocation, workstream references |
| **Governs** | Active initiatives (I-01–I-39, minus I-20 and I-32), workstreams (WS-01–WS-11), initiative ownership, target timelines, dependencies |

### 3.7 Custom Module Registry

| Field | Value |
|-------|-------|
| **File** | `[REF] BCG_Custom_Module_Registry.txt` |
| **Location** | OneDrive `Corp/AI/Standards/` |
| **Current Version** | 1.0 |
| **Fetch before** | Any Odoo module development, audit, or deployment work; P7 subproject setup |
| **Governs** | All BCG custom Odoo 18 modules — status, version, repo location, dependencies, open items |

### 3.8 SOP Governance & Intake Protocol

| Field | Value |
|-------|-------|
| **File** | `[REF] BCG_SOP_Governance_and_Intake_Protocol.txt` |
| **Location** | OneDrive `Corp/AI/Standards/` |
| **Current Version** | 1.0 (pending approval) |
| **Fetch before** | Any SOP intake classification, W-series ID assignment, or P0→P2 handoff creation |
| **Governs** | How new workflow ideas are surfaced, classified, tiered, and handed off for SOP drafting; W-series ID registry rules; standard handoff prompt format; distinction between W-series SOPs and governance documents |

---

## 4. Embedded Governance Documents

These documents are NOT fetched at runtime. They are pasted directly into project instructions during setup or propagation.

### 4.1 Ecosystem Awareness Block (EAB)

| Field | Value |
|-------|-------|
| **File** | `[REF] BCG_Ecosystem_Awareness_Block.txt` |
| **Location** | OneDrive `Corp/AI/Standards/` |
| **Current Version** | 1.0 |
| **Deployment method** | Copy-paste into custom instructions (not fetched at runtime) |
| **Placement** | After SECURITY BOUNDARIES, before COMMANDS & SHORTCUTS |
| **Scope** | All satellite projects (P1–P8) and subprojects |
| **Update trigger** | New project/subproject created, project renamed/closed, routing pattern added |
| **See also** | Style Guide Section 16 for full EAB specification |

**Why embedded, not fetched:** The EAB provides cross-project routing and handoff capabilities. These must work even when the MS365 connector is unavailable. Embedding ensures zero-dependency availability.

---

## 5. This Registry

### 5.1 Self-Reference

| Field | Value |
|-------|-------|
| **File** | `[REF] BCG_Governance_Doc_Registry.txt` |
| **Location** | OneDrive `Corp/AI/Standards/` |
| **Current Version** | 1.1 |
| **Deployment method** | Fetched at runtime via the stub in each project's instructions |
| **Update trigger** | Governance document added, renamed, retired, or fetch triggers changed |

### 5.2 Total Document Count

| Category | Count | Documents |
|----------|-------|-----------|
| Runtime-fetched | 8 | Style Guide, Guiding Principles, Ecosystem & Handoffs, Team Directory, Infrastructure Inventory, Initiative Catalog, Custom Module Registry, SOP Governance & Intake Protocol |
| Embedded | 1 | EAB |
| Registry (this file) | 1 | Governance Doc Registry |
| **Total in Standards folder** | **10** | — |

---

## 6. Rules

1. **Do NOT rely on previously uploaded copies** of governance documents in project knowledge bases. The OneDrive versions are authoritative.
2. **Fetch only relevant documents** per task — not all runtime docs every time. Use the fetch triggers in Section 3 to decide which to pull.
3. **If the MS365 connector is unavailable,** proceed with best available knowledge and flag: `[NOTE: Unable to fetch current governance documents from OneDrive. Standards applied from prior knowledge may not reflect latest version.]`
4. **When updating any governance document,** update this registry if the version number, filename, or fetch triggers changed.
5. **EAB updates require propagation** to all satellite projects. See Style Guide Section 16 for the propagation protocol.

---

## 7. Change Log

| Version | Date | What Changed |
|---------|------|-------------|
| 1.2 | 2026-03-05 | Added Section 3.8 — SOP Governance & Intake Protocol. Updated Section 5.2 totals (runtime-fetched 7→8, total 9→10). |
| 1.1 | 2026-03-07 | Added Section 3.7 — BCG Custom Module Registry. Updated Section 5.2 totals (runtime-fetched 6→7, total 8→9). |
| 1.0 | 2026-03-01 | Initial version. Externalized from the ~40-line GLOBAL GOVERNANCE DOCUMENTS boilerplate previously embedded in all project instructions. |

---

*This file is maintained in OneDrive at Corp/AI/Standards/ and fetched by all Claude Projects via the instruction stub. When governance documents change, update this file — not 11 project instructions.*
