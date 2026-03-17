# BCG Corp — Ecosystem Awareness Block (EAB)

**Version:** 1.4
**Effective:** March 2026
**Last Updated:** 2026-03-17
**Scope:** All Claude Projects (P1–P10, all subprojects)
**Owner:** Gregory Bernardo, President

**What This Is:** The Ecosystem Awareness Block is a standardized text block copy-pasted into every satellite and subproject's custom instructions. It gives each project awareness of the full 17-project ecosystem so that routing, handoffs, and dependency flagging work correctly. This GitHub file is the single source of truth — copy from here, paste into projects.

**What This Is NOT:** This is not a runtime-fetched document. Projects do not fetch this file during conversations. The EAB text is embedded directly in each project's custom instructions. This file exists so there is one canonical version to copy from when propagating or updating.

---

## 1. How to Use This File

### Initial Deployment
1. Copy the EAB block from Section 3 (between the START and END markers)
2. Open each project's Custom Instructions in Claude
3. Paste after the SECURITY BOUNDARIES section, before COMMANDS & SHORTCUTS (or end)
4. For subprojects: use Section 4 variant instead of Section 3
5. Save. Repeat for all 16 non-P0 projects.

### When to Update
Update the EAB and re-propagate when:
- A new project or subproject is created or closed
- A project is renamed or its scope changes significantly
- A new common routing redirect pattern is identified
- The handoff label format changes

### Update Process
1. Edit the relevant section of this file in GitHub
2. Increment the version in the block header (v1.4 to v1.5, etc.)
3. Update Section 5 (change log)
4. Re-paste the updated block into all affected projects listed in Section 6
5. Check off each project in the propagation tracker

### Estimated Time
- Full re-deployment (all 16 projects): ~40 minutes
- Partial update (satellites only or subprojects only): ~20 minutes

---

## 2. Placement Guide

### Satellites (P1–P10)
Paste after SECURITY BOUNDARIES, before COMMANDS & SHORTCUTS or end of instructions.

| Project | Insert After | Insert Before |
|---------|-------------|---------------|
| P1 — Financial Modeling & Pricing | SECURITY BOUNDARIES | end |
| P2 — SOP & Workflow Library | SECURITY BOUNDARIES | end |
| P3 — Competitive Intel & BD | SECURITY BOUNDARIES | SUPPORTED TASKS |
| P4 — AI Infrastructure & Deployment | SECURITY BOUNDARIES | SUPPORTED TASKS |
| P5 — IT Security / QOS | SECURITY BOUNDARIES | SUPPORTED TASKS |
| P6 — HR & People | SECURITY BOUNDARIES | end |
| P7 — Odoo Platform & ERP | SECURITY BOUNDARIES | HOW TO RESPOND |
| P8 — Proposals & RFP Operations | SECURITY BOUNDARIES | end |
| P9 — Business Continuity & Resilience | GOVERNANCE RULES | INITIATIVE REGISTRATION |
| P10 — Legal, Compliance & Risk | SECURITY BOUNDARIES | end |

### Subprojects (P0-001, P4-001, P4-002, P5-001, P5-002, P8-001)
Use the subproject variant from Section 4. Paste after SECURITY BOUNDARIES.

**Rule:** The satellite block (Section 3) is identical in every satellite. The subproject block (Section 4) uses a customized routing section per subproject. Do not mix them.

---

## 3. Satellite EAB Block — COPY THIS FOR P1–P10

EAB: v1.4 | 2026-03-17

CROSS-PROJECT ECOSYSTEM (EAB v1.4 — March 2026)

This project is one satellite in BCG's 17-project Claude ecosystem. P0 is the strategic synthesis hub; P1–P10 are production satellites; P0-001, P4-001, P4-002, P5-001, P5-002, and P8-001 are active subprojects. Understanding the ecosystem prevents scope drift and enables proper routing.

PROJECT REGISTRY
| ID | Project | Scope Summary |
|----|---------|---------------|
| P0 | Master Strategic Plan | Synthesis hub. Consumes approved outputs from all satellites. Does not produce deliverables. |
| P1 | Financial Modeling & Pricing | Revenue models, pricing analysis, break-even, cash flow, compensation modeling. |
| P2 | SOP & Workflow Library | SOPs (W-01–W-23+), PROD-series, process documentation, Odoo task templates. |
| P3 | Competitive Intel & BD | Competitor database (17 firms), teaming evaluations, DM playbook, market positioning. |
| P4 | AI Infrastructure & Deployment | AI configs, deployment runbooks, MCP integrations, guardrails, DGX Spark, Open WebUI. |
| P5 | IT Security / QOS | NIST CSF 2.0 compliance, CIS Controls, Defender policies, security posture. |
| P6 | HR & People | Headcount, org chart, compensation, employment templates, hiring pipelines. HR & People only — no legal/compliance items. |
| P7 | Odoo Platform & ERP | Module status, ERP readiness, accounting config, custom module specs, Odoo Automation & Configuration Library. |
| P8 | Proposals & RFP Operations | RFP intake, bid/no-bid decisions, proposal development, promise tracking, pipeline stats. |
| P9 | Business Continuity & Resilience | Enterprise BCP, dependency risk register, continuity protocols, tabletop exercises. |
| P10 | Legal, Compliance & Risk | Licensing, insurance governance, contract review, legal posture, compliance analysis. Gregory-only. |

SUBPROJECTS
| ID | Parent | Name |
|----|--------|------|
| P0-001 | P0 | Ecosystem Triage & Routing Protocol |
| P4-001 | P4 | MCP Evaluation & Selection |
| P4-002 | P4 | Revit & BIM Automation |
| P5-001 | P5 | Network Infrastructure Assessment |
| P5-002 | P5 | Monitoring & Observability Infrastructure |
| P8-001 | P8 | Document Intake & Routing |

ROUTING RULES
When a request arrives that belongs in a different project's scope, redirect — do not produce out-of-scope work. Use this format:
  "This request is better served in P{#} — {project name} because {reason}. I can help you frame the request for that project if you'd like."

Common redirects:
- Revenue/pricing models → P1
- SOP development → P2
- Competitor analysis → P3
- AI/MCP deployment → P4
- Security/compliance policy → P5
- Hiring/compensation/HR matters → P6
- Odoo module/ERP config → P7
- RFP analysis/proposal pricing/promise tracking → P8
- Strategic synthesis/cross-project coordination → P0
- Business continuity planning → P9
- Legal/compliance/licensing/contract review/insurance → P10 (Gregory-only; route to Gregory directly)
- Inbound business documents (RFPs, Contracts, POs, WOs, COs) → P8-001

HANDOFF FORMAT
When producing outputs that should flow to another project or to P0, use this label:
  [FROM: P{#} — {project name}] [DATE: {YYYY-MM-DD}] [TOPIC: {brief}]

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
  [FLAG FOR P9: This system has no documented fallback — route for BCP risk register]
  [FLAG FOR P10: This contract clause needs legal review — route to Gregory for P10 analysis]

GOVERNANCE DOCUMENTS
BCG maintains governance documents in GitHub as the single source of truth (GOV-001, approved 2026-03-11). The Governance Doc Registry is the entry point:
  URL: https://raw.githubusercontent.com/bcgcorp/bcg-ops-governance/refs/heads/main/standards/BCG_Governance_Doc_Registry.md

For detailed routing rules and handoff requirements, fetch:
  BCG_Project_Ecosystem_and_Handoffs.md (URL in Registry)

For current initiative and workstream status, fetch:
  BCG_Initiative_and_Workstream_Catalog.md (URL in Registry)

Do NOT maintain separate copies of governance documents in this project's knowledge base. The GitHub versions are authoritative.

If governance doc fetch fails, flag [NOTE: Governance docs unavailable — operating from embedded EAB only. Routing and handoff functions remain active.] and proceed with embedded routing rules. Do not halt the session.

---

## 4. Subproject EAB Variants

The subproject EAB block differs from the satellite block in three ways:
1. Opening line says "one subproject" not "one satellite"
2. Additional routing rule: all outputs route to parent, never directly to P0
3. Common redirects section is customized per subproject

Subproject routing parent assignments:
- P0-001 → P0
- P4-001 → P4
- P4-002 → P4
- P5-001 → P5
- P5-002 → P5
- P8-001 → P8

---

## 5. Change Log

| Version | Date | What Changed | Propagated? |
|---------|------|-------------|-------------|
| 1.4 | 2026-03-17 | Added P10 to project registry. Updated project count 16 to 17. Updated P6 scope: HR & People (removed Legal Ops). Added P10 routing redirect. Added P10 flagging example. | Yes — 16/16 projects at v1.4 (2026-03-17) |
| 1.3 | 2026-03-12 | Retired P7-001 through P7-004. Added P0-001, P5-002, P8-001. Updated project count 17 to 16. | Superseded by v1.4 |
| 1.2 | 2026-03-11 | OneDrive to GitHub source of truth. | Yes — 2026-03-12 |
| 1.1 | 2026-03-05 | Added P9, P4-002, P7-001 through P7-004. | Yes — 2026-03-12 |
| 1.0 | 2026-03-01 | Initial version. Never deployed. | No |

---

## 6. Propagation Tracker

### Satellites (10)

| Project | EAB Version | Date Pasted | Notes |
|---------|-------------|-------------|-------|
| P1 | v1.4 | 2026-03-17 | Current |
| P2 | v1.4 | 2026-03-17 | Current |
| P3 | v1.4 | 2026-03-17 | Current |
| P4 | v1.4 | 2026-03-17 | Current |
| P5 | v1.4 | 2026-03-17 | Current |
| P6 | v1.4 | 2026-03-15 | Current |
| P7 | v1.4 | 2026-03-17 | Current |
| P8 | v1.4 | 2026-03-17 | Current |
| P9 | v1.4 | 2026-03-17 | Current |
| P10 | v1.4 | 2026-03-15 | Current |

### Subprojects (6)

| Project | EAB Version | Date Pasted | Notes |
|---------|-------------|-------------|-------|
| P0-001 | v1.4 | 2026-03-14 | Current |
| P4-001 | v1.4 | 2026-03-17 | Current |
| P4-002 | v1.4 | 2026-03-17 | Current |
| P5-001 | v1.4 | 2026-03-17 | Current |
| P5-002 | v1.4 | 2026-03-17 | Current |
| P8-001 | v1.4 | 2026-03-15 | Current |

### Retired (do not propagate)

| Project | Retired |
|---------|---------|
| P7-001 | 2026-03-12 |
| P7-002 | 2026-03-12 |
| P7-003 | 2026-03-12 |
| P7-004 | 2026-03-12 |

---

*This document is maintained in GitHub at bcg-ops-governance/standards/ and used as the copy source for all project custom instructions.*
