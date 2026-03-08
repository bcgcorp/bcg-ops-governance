# BCG Corp — Ecosystem Awareness Block (EAB)

**Version:** 1.0
**Effective:** March 2026
**Last Updated:** 2026-03-01
**Scope:** All satellite Claude Projects (P1–P8)
**Owner:** Gregory Bernardo, President

**What This Is:** The Ecosystem Awareness Block is a standardized text block that gets copy-pasted into every satellite project's custom instructions. It gives each project awareness of the full ecosystem so that routing, handoffs, and dependency flagging work correctly. This OneDrive file is the single source of truth — copy from here, paste into projects.

**What This Is NOT:** This is not a runtime-fetched document like the other governance files. Projects do not fetch this file during conversations. The EAB text is embedded directly in each project's custom instructions. This file exists so there is one canonical version to copy from when propagating or updating.

---

## 1. How to Use This File

### Initial Deployment
1. Copy the entire EAB block from Section 3 below (between the START and END markers)
2. Open each satellite project's Custom Instructions in Claude
3. Paste after the SECURITY BOUNDARIES section, before COMMANDS & SHORTCUTS
4. Save. Repeat for all 8 satellites.

### When to Update
Update the EAB and re-propagate when:
- A new project or subproject is created or closed
- A project is renamed or its scope changes significantly
- A new common routing redirect pattern is identified
- The handoff label format changes

### Update Process
1. Edit Section 3 of this file (the EAB block)
2. Increment the version in the block header (v1.0 → v1.1, etc.)
3. Update Section 4 (change log) of this file
4. Re-paste the updated block into all satellite projects listed in Section 5
5. Check off each project in the propagation tracker (Section 5)

### Estimated Time
- Initial deployment: ~20 minutes (8 projects × ~2.5 min each)
- Update propagation: ~15 minutes per update cycle

---

## 2. Placement Guide

Paste the EAB into each project's custom instructions at the position shown below. The exact section names may vary slightly per project — use the closest match.

| Project | Insert After | Insert Before |
|---------|-------------|---------------|
| P1 — Financial Modeling & Pricing | SECURITY BOUNDARIES | COMMANDS & SHORTCUTS or end |
| P2 — SOP & Workflow Library | SECURITY BOUNDARIES | COMMANDS & SHORTCUTS |
| P3 — Competitive Intel & BD | SECURITY BOUNDARIES | COMMANDS & SHORTCUTS |
| P4 — AI Infrastructure & Deployment | SECURITY BOUNDARIES | SUPPORTED TASKS |
| P5 — IT Security / QOS | SECURITY BOUNDARIES | COMMANDS & SHORTCUTS or end |
| P6 — HR, People & Legal Ops | SECURITY BOUNDARIES | COMMANDS & SHORTCUTS or end |
| P7 — Odoo Platform & ERP | SECURITY BOUNDARIES | COMMANDS & SHORTCUTS |
| P8 — Proposals & RFP Operations | SECURITY BOUNDARIES | COMMANDS & SHORTCUTS |

**Rule:** The block is identical in every project. Do not customize per project. Each project already knows its own identity from its role definition section.

---

## 3. Ecosystem Awareness Block

EAB: v1.0 | 2026-03-01
CROSS-PROJECT ECOSYSTEM (EAB v1.0 — March 2026)
This project is one satellite in BCG's 11-project Claude ecosystem. P0 is the strategic synthesis hub; P1–P8 are production satellites; P4-001 and P5-001 are active subprojects. Understanding the ecosystem prevents scope drift and enables proper routing.
PROJECT REGISTRY
IDProjectScope SummaryP0Master Strategic PlanSynthesis hub. Consumes approved outputs from all satellites. Does not produce deliverables.P1Financial Modeling & PricingRevenue models, pricing analysis, break-even, cash flow, compensation modeling.P2SOP & Workflow LibrarySOPs (W-01–W-17+), PROD-series, process documentation, Odoo task templates.P3Competitive Intel & BDCompetitor database (17 firms), teaming evaluations, DM playbook, market positioning.P4AI Infrastructure & DeploymentAI configs, deployment runbooks, MCP integrations, guardrails, DGX Spark, Open WebUI.P5IT Security / QOSNIST CSF 2.0 compliance, CIS Controls, Defender policies, security posture.P6HR, People & Legal OpsHeadcount, org chart, compensation, legal, employment templates, hiring pipelines.P7Odoo Platform & ERPModule status, ERP readiness, accounting config, custom module specs, Knowledge repo.P8Proposals & RFP OperationsRFP intake, bid/no-bid decisions, proposal development, promise tracking, pipeline stats.
SUBPROJECTS
IDParentNameP4-001P4MCP Evaluation & SelectionP5-001P5Network Infrastructure Assessment
ROUTING RULES
When a request arrives that belongs in a different project's scope, redirect — do not produce out-of-scope work. Use this format:
"This request is better served in P{#} — {project name} because {reason}. I can help you frame the request for that project if you'd like."
Common redirects:

Revenue/pricing models → P1
SOP development → P2
Competitor analysis → P3
AI/MCP deployment → P4
Security/compliance policy → P5
Hiring/compensation/legal → P6
Odoo module/ERP config → P7
RFP analysis/proposal pricing/promise tracking → P8
Strategic synthesis/cross-project coordination → P0

HANDOFF FORMAT
When producing outputs that should flow to another project or to P0, use this label:
[FROM: P{#} — {project name}] [DATE: {YYYY-MM-DD}] [TOPIC: {brief description}]
Subproject handoffs go to parent satellite first, never directly to P0:
[FROM: P{#}-{###} — {subproject name}] [DATE: {YYYY-MM-DD}] [TOPIC: {brief}]
CROSS-PROJECT FLAGGING
When work in this project creates implications for another project, flag it explicitly:
[DEPENDENCY: P{#} needs {what} from P{#} by {when}]
[FLAG FOR P{#}: {description of implication}]
Examples:
[FLAG FOR P1: This scope estimate implies $X budget impact — route for financial modeling]
[FLAG FOR P6: This initiative requires a new hire — route for headcount planning]
[FLAG FOR P7: This workflow needs an Odoo automation — route for module spec]
GOVERNANCE DOCUMENTS
Six governance documents are maintained in OneDrive at Corp/AI/Standards/. For detailed routing rules, handoff content requirements, and dependency tracking, fetch:
[REF] BCG_Project_Ecosystem_and_Handoffs.txt
For current initiative and workstream status, fetch:
[REF] BCG_Initiative_and_Workstream_Catalog.txt
Do NOT maintain separate copies of governance documents in this project's knowledge base. The OneDrive versions are authoritative.
If governance doc fetch fails, flag [NOTE: Governance docs unavailable — operating from embedded EAB only. Routing and handoff functions remain active.] and proceed with embedded routing rules. Do not halt the session.

---

## 4. Change Log

| Version | Date | What Changed | Propagated? |
|---------|------|-------------|-------------|
| 1.0 | 2026-03-01 | Initial version. 9 projects (P0–P8), 2 subprojects (P4-001, P5-001), routing redirects, handoff format, cross-project flagging, governance doc references. | Pending — awaiting Greg approval |

---

## 5. Propagation Tracker

Use this checklist each time the EAB is updated. Check off each project after pasting the updated block.

| Project | EAB Version | Date Pasted | Pasted By | Notes |
|---------|-------------|-------------|-----------|-------|
| P1 — Financial Modeling & Pricing | — | — | — | Not yet deployed |
| P2 — SOP & Workflow Library | — | — | — | Not yet deployed |
| P3 — Competitive Intel & BD | — | — | — | Not yet deployed |
| P4 — AI Infrastructure & Deployment | — | — | — | Not yet deployed |
| P5 — IT Security / QOS | — | — | — | Not yet deployed |
| P6 — HR, People & Legal Ops | — | — | — | Not yet deployed |
| P7 — Odoo Platform & ERP | — | — | — | Not yet deployed |
| P8 — Proposals & RFP Operations | — | — | — | Not yet deployed |

---

## 6. Validation Tests

After propagating, run these test prompts in 2–3 satellites to confirm routing works:

**Test 1 — Paste into P4:**
> I need help building a fee estimate for an upcoming RFP response.

Expected: P4 redirects to P8.

**Test 2 — Paste into P2:**
> Can you analyze our competitor positioning for the B&F pricing round?

Expected: P2 redirects to P3.

**Test 3 — Paste into P3:**
> I need to track what we promised in the YUL proposal versus what the contract requires.

Expected: P3 redirects to P8.

**Test 4 — Paste into P7:**
> Help me draft a performance review framework for when we hit 12 employees.

Expected: P7 redirects to P6.

---

*This document is maintained in OneDrive at Corp/AI/Standards/ and used as the copy source for all satellite project custom instructions. Do not maintain separate copies. When the EAB is updated, re-propagate to all satellites and update the tracker above.*
