# BCG Corp — Ecosystem Awareness Block (EAB)

**Version:** 1.4
**Effective:** March 2026
**Last Updated:** 2026-03-16
**Scope:** All Claude Projects (P1–P10, all subprojects)
**Owner:** Gregory Bernardo, President

**What This Is:** The Ecosystem Awareness Block is a standardized text
block copy-pasted into every satellite and subproject's custom
instructions. It gives each project awareness of the full 17-project
ecosystem so that routing, handoffs, and dependency flagging work
correctly. This GitHub file is the single source of truth — copy from
here, paste into projects.

**What This Is NOT:** This is not a runtime-fetched document. Projects
do not fetch this file during conversations. The EAB text is embedded
directly in each project's custom instructions. This file exists so
there is one canonical version to copy from when propagating or updating.

---

## 1. How to Use This File

### Initial Deployment
1. Copy the EAB block from Section 3 (between the START and END markers)
2. Open each project's Custom Instructions in Claude
3. Paste after the SECURITY BOUNDARIES section, before COMMANDS &
   SHORTCUTS (or end)
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
2. Increment the version in the block header (v1.4 → v1.5, etc.)
3. Update Section 5 (change log)
4. Re-paste the updated block into all affected projects listed in
   Section 6
5. Check off each project in the propagation tracker

### Estimated Time
- Full re-deployment (all 16 projects): ~40 minutes
- Partial update (satellites only or subprojects only): ~20 minutes

---

## 2. Placement Guide

### Satellites (P1–P10)
Paste after SECURITY BOUNDARIES, before COMMANDS & SHORTCUTS or end
of instructions.

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
Use the subproject variant from Section 4. Paste after SECURITY
BOUNDARIES.

**Rule:** The satellite block (Section 3) is identical in every
satellite. The subproject block (Section 4) uses a customized routing
section per subproject. Do not mix them.

---

## 3. Satellite EAB Block — COPY THIS FOR P1–P10

<!-- ═══════════════════════════════════════════════ -->
<!-- COPY FROM HERE (SATELLITES)                     -->
<!-- ═══════════════════════════════════════════════ -->

EAB: v1.4 | 2026-03-16

CROSS-PROJECT ECOSYSTEM (EAB v1.4 — March 2026)

This project is one satellite in BCG's 17-project Claude ecosystem. P0
is the strategic synthesis hub; P1–P10 are production satellites;
P0-001, P4-001, P4-002, P5-001, P5-002, and P8-001 are active
subprojects. Understanding the ecosystem prevents scope drift and enables
proper routing.

PROJECT REGISTRY
| ID | Project | Scope Summary |
|----|---------|---------------|
| P0 | Master Strategic Plan | Synthesis hub. Consumes approved outputs from all satellites. Does not produce deliverables. |
| P1 | Financial Modeling & Pricing | Revenue models, pricing analysis, break-even, cash flow, compensation modeling. |
| P2 | SOP & Workflow Library | SOPs (W-01–W-23+), PROD-series, process documentation, Odoo task templates. |
| P3 | Competitive Intel & BD | Competitor database (17 firms), teaming evaluations, DM playbook, market positioning. |
| P4 | AI Infrastructure & Deployment | AI configs, deployment runbooks, MCP integrations, guardrails, DGX Spark, Open WebUI. |
| P5 | IT Security / QOS | NIST CSF 2.0 compliance, CIS Controls, Defender policies, security posture. |
| P6 | HR & People | Headcount, org chart, compensation, employment templates, hiring pipelines. |
| P7 | Odoo Platform & ERP | Module status, ERP readiness, accounting config, custom module specs, Odoo Automation & Configuration Library. |
| P8 | Proposals & RFP Operations | RFP intake, bid/no-bid decisions, proposal development, promise tracking, pipeline stats. |
| P9 | Business Continuity & Resilience | Enterprise BCP, dependency risk register, continuity protocols, tabletop exercises. |
| P10 | Legal, Compliance & Risk | Licensing audit, insurance governance, compliance tracking, contract review. Gregory only. |

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
When a request arrives that belongs in a different project's scope,
redirect — do not produce out-of-scope work. Use this format:
  "This request is better served in P{#} — {project name} because
  {reason}. I can help you frame the request for that project if
  you'd like."

Common redirects:
- Revenue/pricing models → P1
- SOP development → P2
- Competitor analysis → P3
- AI/MCP deployment → P4
- Security/compliance policy → P5
- Hiring/compensation/org chart → P6
- Odoo module/ERP config → P7
- RFP analysis/proposal pricing/promise tracking → P8
- Strategic synthesis/cross-project coordination → P0
- Business continuity planning → P9
- Legal matters, licensing, insurance, compliance → P10
- Inbound business documents (RFPs, Contracts, POs, WOs, COs) → P8-001

HANDOFF FORMAT
When producing outputs that should flow to another project or to P0,
use this label:
  [FROM: P{#} — {project name}] [DATE: {YYYY-MM-DD}] [TOPIC: {brief}]

Subproject handoffs go to parent satellite first, never directly to P0:
  [FROM: P{#}-{###} — {subproject name}] [DATE: {YYYY-MM-DD}]
  [TOPIC: {brief}]

CROSS-PROJECT FLAGGING
When work in this project creates implications for another project,
flag it explicitly:
  [DEPENDENCY: P{#} needs {what} from P{#} by {when}]
  [FLAG FOR P{#}: {description of implication}]

Examples:
  [FLAG FOR P1: This scope estimate implies $X budget impact — route
  for financial modeling]
  [FLAG FOR P6: This initiative requires a new hire — route for
  headcount planning]
  [FLAG FOR P7: This workflow needs an Odoo automation — route for
  module spec]
  [FLAG FOR P9: This system has no documented fallback — route for
  BCP risk register]
  [FLAG FOR P10: This contract clause has liability implications —
  route for legal review]

GOVERNANCE DOCUMENTS
BCG maintains governance documents in GitHub as the single source of
truth. The Governance Doc Registry is the entry point:
  URL: https://raw.githubusercontent.com/bcgcorp/bcg-ops-governance/refs/heads/main/standards/BCG_Governance_Doc_Registry.md

For detailed routing rules and handoff requirements, fetch:
  BCG_Project_Ecosystem_and_Handoffs.md (URL in Registry)

For current initiative and workstream status, fetch:
  BCG_Initiative_and_Workstream_Catalog.md (URL in Registry)

Do NOT maintain separate copies of governance documents in this
project's knowledge base. The GitHub versions are authoritative.

If governance doc fetch fails, flag [NOTE: Governance docs unavailable
— operating from embedded EAB only. Routing and handoff functions
remain active.] and proceed with embedded routing rules. Do not halt
the session.

<!-- ═══════════════════════════════════════════════ -->
<!-- STOP COPYING HERE                               -->
<!-- ═══════════════════════════════════════════════ -->

---

## 4. Subproject EAB Variants

The subproject EAB block differs from the satellite block in three ways:
1. Opening line says "one subproject" not "one satellite"
2. Additional routing rule: all outputs route to parent, never directly
   to P0
3. Common redirects section is customized per subproject

Each subproject's complete instructions `.md` file (in the
bcg-ops-claude-projects repo) contains the correct variant already
embedded. When re-propagating, copy the EAB block from the relevant
`.md` file, not from this section.

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
| 1.4 | 2026-03-16 | Added P10 (Legal, Compliance & Risk) to project registry, routing redirects, and flagging examples. Updated project count 16→17, satellite count 9→10. Added P10 to placement guide and propagation tracker. | Pending |
| 1.3 | 2026-03-12 | Retired P7-001 through P7-004. Added P0-001, P5-002, P8-001. Updated project count 17→16. Added P8-001 routing redirect. | Yes — 2026-03-12 |
| 1.2 | 2026-03-11 | OneDrive → GitHub as source of truth. Updated Registry URL. | Yes — 2026-03-12 |
| 1.1 | 2026-03-05 | Added P9, P4-002, P7-001–P7-004. Project count to 17. | Yes — 2026-03-12 |
| 1.0 | 2026-03-01 | Initial version. 9 projects, 2 subprojects. Never deployed. | No |

---

## 6. Propagation Tracker

Check off each project after pasting the updated EAB block.

### Satellites (10)

| Project | EAB Version | Date Pasted | Pasted By | Notes |
|---------|-------------|-------------|-----------|-------|
| P1 — Financial Modeling & Pricing | v1.3 | 2026-03-12 | Greg | Needs v1.4 |
| P2 — SOP & Workflow Library | v1.3 | 2026-03-12 | Greg | Needs v1.4 |
| P3 — Competitive Intel & BD | v1.3 | 2026-03-12 | Greg | Needs v1.4 |
| P4 — AI Infrastructure & Deployment | v1.3 | 2026-03-12 | Greg | Needs v1.4 |
| P5 — IT Security / QOS | v1.3 | 2026-03-12 | Greg | Needs v1.4 |
| P6 — HR & People | v1.3 | 2026-03-12 | Greg | Needs v1.4 |
| P7 — Odoo Platform & ERP | v1.3 | 2026-03-12 | Greg | Needs v1.4 |
| P8 — Proposals & RFP Operations | v1.3 | 2026-03-12 | Greg | Needs v1.4 |
| P9 — Business Continuity & Resilience | v1.3 | 2026-03-12 | Greg | Needs v1.4 |
| P10 — Legal, Compliance & Risk | — | — | — | New — needs v1.4 deployment |

### Subprojects (6)

| Project | EAB Version | Date Pasted | Pasted By | Notes |
|---------|-------------|-------------|-----------|-------|
| P0-001 — Ecosystem Triage & Routing Protocol | v1.3 | 2026-03-12 | Greg | Needs v1.4 |
| P4-001 — MCP Evaluation & Selection | v1.3 | 2026-03-12 | Greg | Needs v1.4 |
| P4-002 — Revit & BIM Automation | v1.3 | 2026-03-12 | Greg | Needs v1.4 |
| P5-001 — Network Infrastructure Assessment | v1.3 | 2026-03-12 | Greg | Needs v1.4 |
| P5-002 — Monitoring & Observability Infrastructure | v1.3 | 2026-03-12 | Greg | Needs v1.4 |
| P8-001 — Document Intake & Routing | v1.3 | 2026-03-12 | Greg | Needs v1.4 |

### Retired (do not propagate)

| Project | Final EAB | Retired |
|---------|-----------|---------|
| P7-001 — Dev Environment & AI Tooling | never deployed | 2026-03-12 |
| P7-002 — Platform Audit & Uplift | never deployed | 2026-03-12 |
| P7-003 — Odoo 19 Feature Mining | never deployed | 2026-03-12 |
| P7-004 — Notification Center & Invoice Request | never deployed | 2026-03-12 |

---

## 7. Validation Tests

Run these test prompts after deployment to confirm routing fires
correctly. Test in at least 3 projects.

**Test 1 — Run in P4:**
> I need help building a fee estimate for an upcoming RFP response.
Expected: Redirects to P8.

**Test 2 — Run in P2:**
> Can you analyze our competitor positioning for the B&F pricing round?
Expected: Redirects to P3.

**Test 3 — Run in P3:**
> I need to track what we promised in the YUL proposal versus what the
> contract requires.
Expected: Redirects to P8.

**Test 4 — Run in P7:**
> Help me draft a performance review framework for when we hit 12
> employees.
Expected: Redirects to P6.

**Test 5 — Run in P4-002:**
> We've completed this button build. Please synthesize findings and
> send to P0.
Expected: Redirects to P4, not directly to P0.

**Test 6 — Run in any satellite:**
> We need to document our fallback procedure if Claude goes down for
> a day.
Expected: Redirects to P9.

**Test 7 — Run in P7:**
> I just received an RFP from Arcadis. Where do I process this?
Expected: Redirects to P8-001.

**Test 8 — Run in P6:**
> We need to check if BCG needs a Virginia contractor license for the
> IAD projects.
Expected: Redirects to P10.

---

*This document is maintained in GitHub at
bcg-ops-governance/standards/ and used as the copy source for
all project custom instructions. Do not maintain separate copies. When
the EAB is updated, re-propagate to all projects and update the tracker
above.*
