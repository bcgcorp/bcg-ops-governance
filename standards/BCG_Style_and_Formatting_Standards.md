# BCG Corp — Master Style & Formatting Standards

**Version:** 1.4
**Effective:** March 2026
**Last Updated:** 2026-03-17
**Scope:** All Claude Projects (P0–P10) and subprojects
**Owner:** Gregory Bernardo, President

**v1.4 Changes:** Updated scope P0–P7 to P0–P10. Added Section 16 (Ecosystem Awareness Block Specification). Updated project registry (Section 10.2) to include P8–P10. Updated subproject registry (Section 10.3) to include all 6 active subprojects. Updated initiative/workstream counts in Section 13. Added v1.3 and v1.4 change log entries.

---

## 1. Purpose

This document defines the universal formatting, tone, document creation, and security standards for all BCG Corp Claude Projects. Every satellite project (P1–P10) and the master strategic plan (P0) must follow these rules to ensure consistency, professionalism, and confidentiality across all outputs.

---

## 2. Response Style

- Clear, concise, factual. No emotional platitudes or filler.
- Be direct and opinionated. State the recommendation first, then reasoning.
- Use concrete numbers when possible.
- Reference BCG's actual context. Use real project codes, client conventions, competitor names, tool names, and team members.
- Draft changes and present results before applying.
- All outputs marked `[DRAFT — PENDING REVIEW]` until Greg approves.
- Approved materials marked `[APPROVED — v{date}]`.
- Surface gaps explicitly: `[NEEDS INPUT: {specific question}]`
- Handle cross-contributions: `[CONTRIBUTED BY: {name} — NEEDS REVIEW BY: {owner}]`
- Challenge assumptions. Flag inconsistencies.
- Think in phases. Use 30/60/90-day or quarterly arcs.
- **Use "Sprints" for phased rollout language.** Not "Wave," "Phase," or "Stage" for execution steps. ("Phase" remains acceptable for high-level lifecycle stages.)

---

## 3. Security Boundaries — Absolute Rules

- **Never name specific clients.** Use "Client A" or "Primary Hyperscaler Client."
- **No proprietary design data** or reference drawing content.
- **No individual compensation details** beyond role-level salary ranges.
- **No client-specific contract values or fee structures** in external documents.
- **No clearance information** on public-facing pages.
- **SOPs should be generic enough** to apply across clients while specific enough to be actionable.
- If a boundary is approached: `[SECURITY NOTE: This content may require review before inclusion. Flagging for Greg.]`
- **Approved public messaging:** "Supporting hyperscaler data center programs across the Americas."

---

## 4. Document Creation Standards

### 4.1 File Format

- Primary: Microsoft Word (.docx) via `docx` (docx-js) npm library
- Always use Claude's skill files: `/mnt/skills/public/docx/SKILL.md` (Word), `/mnt/skills/public/pptx/SKILL.md` (PowerPoint), `/mnt/skills/public/xlsx/SKILL.md` (spreadsheet), `/mnt/skills/public/pdf/SKILL.md` (PDF)

### 4.2 Typography

| Element | Specification |
|---------|---------------|
| **Body font** | Arial |
| **Body size** | 11pt (22 half-points in docx-js) |
| **Heading 1** | Arial, 16pt, Bold, Navy (#1B365D) |
| **Heading 2** | Arial, 14pt, Bold, Navy (#1B365D) |
| **Heading 3** | Arial, 12pt, Bold |
| **Web/brand font** | Montserrat (headings) / Source Sans 3 (body) |
| **Brand color** | Navy #1B365D |

### 4.3 Table Standards

Color-coded where appropriate: red for risk, green for strength. DXA width units. Cell margins for readability. Consistent border styling.

### 4.4 Template Conventions

- **Placeholders:** Blue bold bracketed text — `[$ AMOUNT]`, `[START DATE]`
- **Instructional text:** Gray italic — delete before sending
- **Decision-needed:** Yellow highlight = Needs info/decision from Greg
- **Major gaps:** Red highlight with white text

### 4.5 Legal Document Standards

Professional formatting with headers, footers, page numbers. Strategic PageBreak placement. Court-standard table formatting. Evidence-based analysis.

### 4.6 Post-Generation Validation

After generating any .docx, run unpack/cleanup/repack cycle per the docx skill to ensure Word compatibility.

### 4.7 Numbering References

Each bullet list needs its own numbering reference to avoid counter conflicts.

---

## 5. Timeline Tag System

### 5.1 Tag Color Definitions

| Tag | Hex Fill | Text Color | Meaning |
|-----|----------|------------|---------|
| `[Q1 '26]` | #0E7C7B (Teal) | White | Immediate |
| `[Q2 '26]` | #2B5797 (Blue) | White | Near-term |
| `[Q3 '26]` | #6A5ACD (Slate/Purple) | White | Mid-year |
| `[Q4 '26]` | #2E7D32 (Dark Green) | White | Year-end |
| `[2027]` | #555555 (Gray) | White | Next year |
| `[2028+]` | #BBBBBB (Light Gray) | #333333 | Horizon |

### 5.2 Implementation Rules

Tables: use "Target" column with colored cell shading. Prose: use inline bracketed tags with matching background. Same color scheme everywhere.

---

## 6. Compact Display Format

### 6.1 Priority Icons

| Icon | Priority |
|------|----------|
| Red circle | High |
| Yellow circle | Medium |
| Green circle | Low |

### 6.2 Status Abbreviations

| Symbol | Status |
|--------|--------|
| Open circle | Unassigned |
| Play | In Progress |
| Pause | Blocked |
| Check | Complete |

### 6.3 Date Shorthand

EOM (End of Month), EOQ (End of Quarter), EOW (End of Week).

---

## 7. Contract & Legal Document Conventions

| Convention | Meaning |
|------------|---------|
| **Yellow Highlighting** | BCG additions and modifications |
| **Blue Italic Text** | Explanatory notes (internal only) |
| **Strikethrough Text** | Original text proposed for deletion |

---

## 8. SOP Standard Format

Every SOP must follow: (1) Header, (2) Purpose, (3) Scope, (4) Trigger, (5) Inputs, (6) Steps, (7) Outputs, (8) QC Checkpoint, (9) Odoo Mapping, (10) Exceptions, (11) Revision History.

### SOP Design Principles

- **Day-One Ready.** A new hire can follow any Tier 1 SOP without asking.
- **Odoo-Native.** Map to Odoo task templates where possible.
- **Owner + Backup.** Every SOP must name both.

---

## 9. Contribution & Approval Workflow

1. Contributor identifies themselves and states goal
2. Uploads existing materials
3. Claude builds output using instructions, this style guide, and KB
4. Output marked `[DRAFT — PENDING REVIEW]` with explicit assumptions
5. Contributor shares to activity feed
6. Greg reviews and approves or revises
7. Approved outputs marked `[APPROVED — v{date}]`

---

## 10. Project Ecosystem Integration

### 10.1 Handoff Label Format

Satellite to P0: `[FROM: P{#} — {name}] [DATE: {date}] [TOPIC: {brief}]`
Subproject to Parent: `[FROM: P{#}-{###} — {name}] [DATE: {date}] [TOPIC: {brief}]`

### 10.2 Project Registry

| ID | Project | What It Produces |
|----|---------|-----------------|
| P0 | Master Strategic Plan | Synthesis hub — consumes, doesn't produce |
| P1 | Financial Modeling & Pricing | Revenue models, pricing analysis, break-even |
| P2 | SOP & Workflow Library | Approved SOPs (W-01–W-23+), PROD-series |
| P3 | Competitive Intel & BD | Competitor updates, teaming evals, DM playbook |
| P4 | AI Infrastructure & Deployment | AI configs, runbooks, guardrails |
| P5 | IT Security / QOS | Compliance artifacts, QOS alignment |
| P6 | HR & People | Headcount, org chart, compensation |
| P7 | Odoo Platform & ERP | Module status, ERP readiness, accounting |
| P8 | Proposals & RFP Operations | Bid/no-bid, proposals, promise tracking, pipeline |
| P9 | Business Continuity & Resilience | BCP, risk register, continuity protocols |
| P10 | Legal, Compliance & Risk | Licensing, insurance, contract review (Gregory only) |

### 10.3 Subproject Registry

| ID | Parent | Subproject | What It Produces |
|----|--------|------------|-----------------|
| P0-001 | P0 | Ecosystem Triage & Routing | Classified updates, handoff prompts, I-number registrations |
| P4-001 | P4 | MCP Evaluation & Selection | MCP server evaluations, capability matrices |
| P4-002 | P4 | Revit & BIM Automation | PyRevit buttons (42-button backlog), Dynamo scripts |
| P5-001 | P5 | Network Infrastructure Assessment | Firewall/switch config assessment, gap analysis |
| P5-002 | P5 | Monitoring & Observability | Prometheus/Grafana/Loki stack, telemetry |
| P8-001 | P8 | Document Intake & Routing | RFP/CO/PO intake processing |

### 10.4 Routing Rule

If a request is better served in a satellite (P1–P10) or subproject, redirect. P0 synthesizes; satellites produce. Subprojects report to parent — not directly to P0.

### 10.5 Subproject Conventions

Three-digit sequential numbering. Own Claude Project per subproject. Inherit security boundaries and formatting from this guide. Handoffs flow to parent, not P0.

---

## 11. Pressure-Test Framework

1. **Revenue impact:** Generate revenue, reduce cost, or enable future revenue?
2. **Capacity impact:** Have people/bandwidth, or need to hire?
3. **Competitive moat:** Widen differentiation vs. ZBeta, Guidepost, Introba?
4. **Scalability:** Work at 2x size?
5. **Reversibility:** How hard to unwind?
6. **Opportunity cost:** What are we not doing?

---

## 12. Brand & Visual Identity

| Element | Specification |
|---------|---------------|
| **Primary brand color** | Navy #1B365D |
| **Brand tone** | Corporate/enterprise, professional |
| **Web heading font** | Montserrat |
| **Web body font** | Source Sans 3 |
| **Document font** | Arial |
| **Veteran recognition** | Military service badges for Joshua Davis, Victor Carrillo |

---

## 13. Key Organizational Context

- **Company:** BCG Corp (Bernardo Consulting Group LLC), Denton, TX
- **Scale:** 9 FTE + 1 fractional (Jason Harris, April 1), founder-led
- **President:** Gregory Bernardo
- **Service:** Independent physical security consulting — data centers and critical infrastructure
- **Prime relationships:** Arcadis (strong), HKS (good), Gensler (burgeoning), S+R (active)
- **Key competitors:** ZBeta, Guidepost Solutions, Introba (formerly Ross & Baruzzini), ADRM Security, plus 13 others
- **ERP:** Self-hosted Odoo 18 (PM, CRM, Accounting, HR with Studio/custom modules)
- **AI infrastructure:** 2x NVIDIA DGX Spark, 2x RTX 5090 workstations
- **Design principles:** (1) Build to Sell, (2) Redundancy at Every Level, (3) Employee Ownership & Profit Sharing, (4) Process Before People
- **Initiative catalog:** 61 active (I-01–I-63, minus I-20 and I-32). Next slot: I-64.
- **Workstreams:** 11 active (WS-01–WS-11)
- **SOPs:** W-01 through W-23+ registered
- **Projects:** 17 active Claude projects (P0, P0-001, P1–P10, P4-001, P4-002, P5-001, P5-002, P8-001)

---

## 14. File Delivery Format

1. Create the complete file (not snippets)
2. Provide as downloadable file
3. If web-related: explain which files to upload and where
4. Include version notation in filename when applicable

---

## 15. Evaluation & Analytical Report Conventions

### 15.1 Change Tracking

Every updated report must include a "What Changed" section with: new items, items removed, score changes, status changes, and whether changes affect the recommendation.

### 15.2 Executive Summary with Delta

Every evaluation report must open with: scope statement, primary selection, supplementary selections, competitive feature notes, delta summary (v2+).

### 15.3 Competitive Feature Analysis

When evaluation produces a clear winner, assess runner-up unique features. Table: Server | Unique Feature | In Primary Selection? | BCG Value | Action.

### 15.4 Use Case Action Context

Each use case must indicate output type: Visual (read-only, blue), Automation (write, green), or Visual-to-Automation (phased, yellow).

---

## 16. Ecosystem Awareness Block (EAB) Specification

### 16.1 What the EAB Is

The EAB is a standardized text block embedded (copy-pasted) into every satellite and subproject's custom instructions. It provides cross-project routing awareness, handoff labeling format, and dependency flagging conventions. It is NOT fetched at runtime — it is embedded directly so it works even when GitHub is unavailable.

### 16.2 EAB Master File

Single source of truth: `bcg-ops-governance/standards/BCG_Ecosystem_Awareness_Block.md`
Current version: **v1.4** (17 projects, P1–P10 + 6 subprojects).

### 16.3 EAB Structure

The satellite EAB block contains: (1) Header line with version/date, (2) Project Registry with all 17 projects, (3) Subproject table with 6 active subprojects, (4) Routing Rules with redirect format and common redirect table, (5) Handoff Format for satellite-to-P0 and subproject-to-parent, (6) Cross-Project Flagging with dependency and flag format, (7) Governance Documents section with GitHub fetch instructions and fallback behavior.

Subproject variants differ: opening line says "one subproject," additional routing rule routes to parent only, and customized redirect table.

### 16.4 Propagation Protocol

When the EAB is updated: (1) Edit master file on GitHub and increment version, (2) Update propagation tracker, (3) Copy updated block from between START/END markers, (4) Paste into each satellite's custom instructions replacing old EAB, (5) For subprojects use subproject variant from Section 4, (6) Check off each project in tracker, (7) Test routing in at least 3 projects.

Estimated time: Full re-deployment (all 16 non-P0 projects): ~40 minutes.

### 16.5 When to Update

Update and re-propagate when: a new project/subproject is created or closed, a project is renamed or scope changes significantly, a new common routing redirect pattern is identified, or the handoff label format changes.

Do NOT update for: initiative additions, governance doc version bumps, or team member changes.

---

*This document is the formatting and style authority for all BCG Claude Projects. When in doubt, follow these standards. If a project-specific instruction conflicts, the project-specific instruction wins for that project only — flag the conflict for Greg.*