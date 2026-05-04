# BCG Corp \u2014 Governance Document Registry

**Version:** 1.4
**Effective:** May 2026
**Last Updated:** 2026-05-03
**Scope:** All Claude Projects (P0\u2013P11) and subprojects
**Owner:** Gregory Bernardo, President

---

## 1. Purpose

This file is the single index of all BCG governance documents maintained in OneDrive at `Corp/AI/Standards/`. Every Claude Project's instructions contain a short stub pointing to this registry rather than embedding the full document list. When the governance doc collection changes (new docs added, files renamed, fetch triggers updated), only this file is edited \u2014 not 11+ project instructions.

**Update this file when:** a governance document is added, renamed, retired, or its fetch triggers change.

**ADRs:** Architectural Decision Records (ADR-NNN) are a distinct artifact class established 2026-05-02 with ADR-001. ADRs document architectural decisions and their rationale; GOV/REF docs in this registry document the resulting rules. ADRs are listed in Section 6.

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
  to the current task \u2014 not all of them every time.
If the MS365 connector is unavailable, proceed with best available knowledge
and flag: [NOTE: Unable to fetch current governance documents from OneDrive.
Standards applied from prior knowledge may not reflect latest version.]
```

The stub is identical across all projects. It never needs editing unless the registry filename itself changes.

---

## 3. Runtime-Fetched Governance Documents

These documents are fetched by Claude during conversations when the task matches the fetch trigger. Fetch only the ones relevant to the current task \u2014 not all every time.

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
| **Governs** | Project registry (P0\u2013P11), subproject registry, routing rules, handoff label format, dependency tracking, EAB deployment specification (Section 5.4) |

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
| **File** | `BCG_Initiative_and_Workstream_Catalog.md` |
| **Location** | GitHub `bcg-ops-governance/standards/` (per GOV-001) |
| **Current Version** | **3.2** |
| **Fetch before** | Strategic planning, initiative status checks, resource allocation, workstream references |
| **Governs** | Active initiatives (I-01\u2013I-77, with closures and descopes tracked in catalog), 11 active workstreams (WS-01\u2013WS-11), initiative ownership, target timelines, dependencies. Most recent additions: I-77 PDF Deliverable Automation Pipeline (2026-04-30, gated on I-09). |

### 3.7 Custom Module Registry

| Field | Value |
|-------|-------|
| **File** | `[REF] BCG_Custom_Module_Registry.txt` |
| **Location** | OneDrive `Corp/AI/Standards/` |
| **Current Version** | 1.0 |
| **Fetch before** | Any Odoo module development, audit, or deployment work; P7 subproject setup |
| **Governs** | All BCG custom Odoo 18 modules \u2014 status, version, repo location, dependencies, open items |

### 3.8 BCG Acronyms and Glossary

| Field | Value |
|-------|-------|
| **File** | `BCG_Acronyms_and_Glossary.md` |
| **Location** | GitHub `bcg-ops-governance/standards/` |
| **Current Version** | 0.1 |
| **Fetch before** | Any deliverable that touches AEC, data center, physical security, AI platform, or BCG-internal terminology where acronym expansion or term lookup is needed; ingest into RAG corpus where vocabulary control matters |
| **Governs** | Acronyms and term definitions across AWS BOD reference design, physical security, AEC, BCG-internal (incl. AI platform stack), and standards & frameworks. Authoritative cross-references to the AWS `0031.MULTI Glossary`, `BCG_Project_Ecosystem_and_Handoffs.md`, `BCG_Infrastructure_Inventory.txt`, `BCG_Custom_Module_Registry.txt`, and `BCG_AI_Platform_Architecture.docx` |

---

## 4. Embedded Governance Documents

These documents are NOT fetched at runtime. They are pasted directly into project instructions during setup or propagation.

### 4.1 Ecosystem Awareness Block (EAB)

| Field | Value |
|-------|-------|
| **File** | `[REF] BCG_Ecosystem_Awareness_Block.txt` |
| **Location** | OneDrive `Corp/AI/Standards/` |
| **Current Version** | 1.7 |
| **Deployment method** | Copy-paste into custom instructions (not fetched at runtime) |
| **Placement** | After SECURITY BOUNDARIES, before COMMANDS & SHORTCUTS |
| **Scope** | All satellite projects (P1\u2013P11) and subprojects |
| **Update trigger** | New project/subproject created, project renamed/closed, routing pattern added |
| **See also** | Style Guide Section 16 for full EAB specification |

**Why embedded, not fetched:** The EAB provides cross-project routing and handoff capabilities. These must work even when the MS365 connector is unavailable. Embedding ensures zero-dependency availability.

---

## 5. This Registry

### 5.1 Self-Reference

| Field | Value |
|-------|-------|
| **File** | `[REF] BCG_Governance_Doc_Registry.txt` |
| **Location** | OneDrive `Corp/AI/Standards/` (and GitHub `bcg-ops-governance/standards/` per GOV-001) |
| **Current Version** | **1.4** |
| **Deployment method** | Fetched at runtime via the stub in each project's instructions |
| **Update trigger** | Governance document added, renamed, retired, or fetch triggers changed; ADR added to Section 6 |

### 5.2 Total Document Count

| Category | Count | Documents |
|----------|-------|-----------|
| Runtime-fetched | 8 | Style Guide, Guiding Principles, Ecosystem & Handoffs, Team Directory, Infrastructure Inventory, Initiative Catalog, Custom Module Registry, Acronyms and Glossary |
| Embedded | 1 | EAB |
| Registry (this file) | 1 | Governance Doc Registry |
| ADRs | 1 | ADR-001 (see Section 6) |
| **Total in Standards folder** | **11** | \u2014 |

---

## 6. Architectural Decision Records (ADRs)

Architectural Decision Records (ADR-NNN) document architectural decisions and their rationale \u2014 what was chosen, what was rejected, and why. Distinct from GOV/REF documents in Sections 3 and 4, which document the resulting rules. Established as a new artifact class on 2026-05-02 with ADR-001.

**Distinction:**
- **ADR-NNN** documents *the decision and its rationale.* Architectural decisions only.
- **GOV/REF documents** in Sections 3 and 4 document *the resulting rules.* Standards, inventories, registries, operational doctrine.
- **Operational SOPs** (W-NN sequence) are companions to ADRs that codify operational behavior. SOPs receive their own numbering from the SOP library, not ADR or GOV numbers.

A given subject may have artifacts in multiple classes. Example: ADR-001 (the decision) is operationally companioned by the pending Visualization Authoring Standard SOP (the rules), which will receive a W-NN number from the SOP library when authored by P2.

### 6.1 ADR Index

| ID | Title | Status | Approved | Architectural Owner | Canonical File |
|----|-------|--------|----------|---------------------|----------------|
| ADR-001 | Visualization Tooling Architecture | APPROVED | 2026-05-02 | P4 \u2014 AI Infrastructure & Deployment | `standards/ADR-001_Visualization_Tooling_Architecture.md` (canonical Markdown, pending commit) and `standards/BCG_ADR-001_Visualization_Tooling_Architecture_2026-05-02_APPROVED.docx` (historical archive, committed 2026-05-03) |

### 6.2 ADR-001 \u2014 Visualization Tooling Architecture

| Field | Value |
|-------|-------|
| **ID** | ADR-001 |
| **Title** | Visualization Tooling Architecture |
| **Status** | APPROVED |
| **Decision Date** | 2026-05-02 |
| **Approved By** | Gregory Bernardo, President |
| **Originating Subproject** | P4-002 \u2014 Revit & BIM Automation |
| **Architectural Owner** | P4 \u2014 AI Infrastructure & Deployment |
| **Canonical File (Markdown)** | `bcg-ops-governance/standards/ADR-001_Visualization_Tooling_Architecture.md` |
| **Historical Archive (.docx)** | `bcg-ops-governance/standards/BCG_ADR-001_Visualization_Tooling_Architecture_2026-05-02_APPROVED.docx` |
| **Supersedes** | None |
| **Related** | GOV-013 (Tools Inventory), GOV-017 (P4-002 Technical Architecture), pending Visualization Authoring Standard SOP (P2 queue), pending BCP risk register entry (P9 queue) |
| **Review Cadence** | Annual full review (next: 2027-05-02) co-owned by P4 and P9; quarterly health check by P4 |
| **Reversibility** | Fully reversible \u2014 disable any one tool with one decision; no licensing lock-in beyond what BCG already pays for (M365) |
| **Governs** | Adopted four-tool visualization stack: (1) built-in Anthropic Visualizer for inline chat; (2) Mermaid Chart MCP for governance docs in GitHub; (3) PowerPoint SmartArt for client presentations; (4) draw.io / diagrams.net as open-format backup. Explicitly rejects Visio, Lucidchart, Miro/Mural, Figma/FigJam, Excalidraw, Whimsical, Canva, Google Drawings/Slides. Includes BCP risk assessment and acceptable-failure-mode analysis (\u00a75 of canonical file). |

### 6.3 Adding an ADR

Process for adding a new ADR to the registry:

1. ADR is drafted, reviewed, and APPROVED by Gregory.
2. Canonical Markdown file is committed to `bcg-ops-governance/standards/` with filename pattern `ADR-NNN_Title_With_Underscores.md`.
3. Historical archive `.docx` is committed alongside (filename pattern `BCG_ADR-NNN_Title_With_Underscores_YYYY-MM-DD_APPROVED.docx`).
4. This registry's Section 6.1 (ADR Index) gets a new row.
5. A new subsection (Section 6.N) provides the full metadata table for the ADR.
6. Section 5.2 (Total Document Count) ADR row count is incremented.
7. Self-reference Section 5.1 version is bumped.
8. Change log Section 8 records the addition.

---

## 7. Rules

1. **Do NOT rely on previously uploaded copies** of governance documents in project knowledge bases. The OneDrive versions are authoritative.
2. **Fetch only relevant documents** per task \u2014 not all runtime docs every time. Use the fetch triggers in Section 3 to decide which to pull.
3. **If the MS365 connector is unavailable,** proceed with best available knowledge and flag: `[NOTE: Unable to fetch current governance documents from OneDrive. Standards applied from prior knowledge may not reflect latest version.]`
4. **When updating any governance document,** update this registry if the version number, filename, or fetch triggers changed.
5. **EAB updates require propagation** to all satellite projects. See Style Guide Section 16 for the propagation protocol.
6. **ADRs follow the process in Section 6.3** when added. ADRs are append-only (existing ADRs are not removed; a superseded ADR has its status updated and the superseding ADR references it).

---

## 8. Change Log

| Version | Date | What Changed |
|---------|------|-------------|
| **1.4** | **2026-05-03** | **Established ADR artifact class.** Added Section 6 (Architectural Decision Records) with ADR Index, full ADR-001 metadata table, and ADR addition process (Section 6.3). Section 1 Purpose updated to define ADR distinction from GOV/REF docs. Section 5.2 Total Document Count: added ADRs row (1), incremented total to 11. Section 5.1 Self-Reference bumped to v1.4. Section 7 Rule 6 added (ADR addition process and append-only convention). Section 3.6 Initiative & Workstream Catalog version reference updated 3.1 \u2192 3.2 to reflect catalog v3.2 commit (2026-04-28). |
| 1.3 | 2026-04-26 | Catalog reference bumped to v3.1. Updated Section 3.6 (Initiative & Workstream Catalog): file path/location moved to canonical GitHub location per GOV-001 (was OneDrive); added Current Version field set to 3.1; updated Governs to reflect 65 active initiatives (was "I-01\u2013I-72+" range). Self-reference Section 5.1 bumped to v1.3. **Note on prior version drift:** the catalog and ecosystem status docs have referenced this Registry as v3.4/v3.5/v3.6 in their changelogs and version trackers since approximately the v2.9 reconciliation commit (2026-04-18). The actual file in this repo never tracked v3.x \u2014 the v3.x sequence appears to be a phantom version pattern (similar to the v2.10 catalog phantom resolved in catalog v3.0). This commit lands the actual next sequential version (v1.3) per the file's real change log. Broader cleanup of cross-doc references and Section 3 OneDrive-vs-GitHub locations flagged for follow-up sweep. |
| 1.2 | 2026-04-26 | Added Section 3.8 \u2014 BCG Acronyms and Glossary (v0.1 seed, GitHub-hosted). Updated Section 5.2 totals (runtime-fetched 7\u21928, total 9\u219210). Updated scope from P0\u2013P8 to P0\u2013P11. Updated EAB version reference (1.0\u21921.7) and scope (P1\u2013P8 \u2192 P1\u2013P11). Updated Initiative Catalog reference range (I-01\u2013I-39 \u2192 I-01\u2013I-72+) and workstream range (WS-01\u2013WS-11 \u2192 WS-01\u2013WS-25+). Updated Project Ecosystem & Handoffs reference scope (P0\u2013P8 \u2192 P0\u2013P11). Self-reference updated to note GitHub-hosted source-of-truth per GOV-001. |
| 1.1 | 2026-03-07 | Added Section 3.7 \u2014 BCG Custom Module Registry. Updated Section 5.2 totals (runtime-fetched 6\u21927, total 8\u21929). |
| 1.0 | 2026-03-01 | Initial version. Externalized from the ~40-line GLOBAL GOVERNANCE DOCUMENTS boilerplate previously embedded in all project instructions. |

---

*This file is maintained in OneDrive at Corp/AI/Standards/ and fetched by all Claude Projects via the instruction stub. When governance documents change, update this file \u2014 not 11 project instructions.*
