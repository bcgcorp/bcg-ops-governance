# BCG Corp — Ecosystem Awareness Block (EAB)

**Version:** 1.2
**Effective:** March 2026
**Last Updated:** 2026-03-11
**Scope:** All Claude Projects (P1–P9, all subprojects)
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
2. Increment the version in the block header (v1.2 → v1.3, etc.)
3. Update Section 5 (change log)
4. Re-paste the updated block into all affected projects listed in
   Section 6
5. Check off each project in the propagation tracker

### Estimated Time
- Full re-deployment (all 16 projects): ~45 minutes
- Partial update (satellites only or subprojects only): ~20 minutes

---

## 2. Placement Guide

### Satellites (P1–P9)
Paste after SECURITY BOUNDARIES, before COMMANDS & SHORTCUTS or end
of instructions.

| Project | Insert After | Insert Before |
|---------|-------------|---------------|
| P1 — Financial Modeling & Pricing | SECURITY BOUNDARIES | end |
| P2 — SOP & Workflow Library | SECURITY BOUNDARIES | end |
| P3 — Competitive Intel & BD | SECURITY BOUNDARIES | SUPPORTED TASKS |
| P4 — AI Infrastructure & Deployment | SECURITY BOUNDARIES | SUPPORTED TASKS |
| P5 — IT Security / QOS | SECURITY BOUNDARIES | SUPPORTED TASKS |
| P6 — HR, People & Legal Ops | SECURITY BOUNDARIES | end |
| P7 — Odoo Platform & ERP | SECURITY BOUNDARIES | HOW TO RESPOND |
| P8 — Proposals & RFP Operations | SECURITY BOUNDARIES | end |
| P9 — Business Continuity & Resilience | GOVERNANCE RULES | INITIATIVE REGISTRATION |

### Subprojects (P4-001, P4-002, P5-001, P7-001 through P7-004)
Use the subproject variant from Section 4. Paste after SECURITY
BOUNDARIES.

**Rule:** The satellite block (Section 3) is identical in every
satellite. The subproject block (Section 4) uses a customized routing
section per subproject. Do not mix them.

---

## 3. Satellite EAB Block — COPY THIS FOR P1–P9

<!-- ═══════════════════════════════════════════════ -->
<!-- COPY FROM HERE (SATELLITES)                     -->
<!-- ═══════════════════════════════════════════════ -->

EAB: v1.2 | 2026-03-11

CROSS-PROJECT ECOSYSTEM (EAB v1.2 — March 2026)

This project is one satellite in BCG's 17-project Claude ecosystem. P0
is the strategic synthesis hub; P1–P9 are production satellites;
P4-001, P4-002, P5-001, P7-001, P7-002, P7-003, and P7-004 are active
subprojects. Understanding the ecosystem prevents scope drift and enables
proper routing.

PROJECT REGISTRY
| ID | Project | Scope Summary |
|----|---------|--------------|
| P0 | Master Strategic Plan | Synthesis hub. Consumes approved outputs from all satellites. Does not produce deliverables. |
| P1 | Financial Modeling & Pricing | Revenue models, pricing analysis, break-even, cash flow, compensation modeling. |
| P2 | SOP & Workflow Library | SOPs (W-01–W-17+), PROD-series, process documentation, Odoo task templates. |
| P3 | Competitive Intel & BD | Competitor database (17 firms), teaming evaluations, DM playbook, market positioning. |
| P4 | AI Infrastructure & Deployment | AI configs, deployment runbooks, MCP integrations, guardrails, DGX Spark, Open WebUI. |
| P5 | IT Security / QOS | NIST CSF 2.0 compliance, CIS Controls, Defender policies, security posture. |
| P6 | HR, People & Legal Ops | Headcount, org chart, compensation, legal, employment templates, hiring pipelines. |
| P7 | Odoo Platform & ERP | Module status, ERP readiness, accounting config, custom module specs, Knowledge repo. |
| P8 | Proposals & RFP Operations | RFP intake, bid/no-bid decisions, proposal development, promise tracking, pipeline stats. |
| P9 | Business Continuity & Resilience | Enterprise BCP, dependency risk register, continuity protocols, tabletop exercises. |

SUBPROJECTS
| ID | Parent | Name |
|----|--------|------|
| P4-001 | P4 | MCP Evaluation & Selection |
| P4-002 | P4 | Revit & BIM Automation |
| P5-001 | P5 | Network Infrastructure Assessment |
| P7-001 | P7 | Dev Environment & AI Tooling |
| P7-002 | P7 | Platform Audit & Uplift |
| P7-003 | P7 | Odoo 19 Feature Mining |
| P7-004 | P7 | Notification Center & Invoice Request |

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
- Hiring/compensation/legal → P6
- Odoo module/ERP config → P7
- RFP analysis/proposal pricing/promise tracking → P8
- Strategic synthesis/cross-project coordination → P0
- Business continuity planning → P9

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

Each subproject's complete instructions `.md` file (in this deployment
package) contains the correct variant already embedded. When
re-propagating, copy the EAB block from the relevant `.md` file, not
from this section.

Subproject routing parent assignments:
- P4-001 → P4
- P4-002 → P4
- P5-001 → P5
- P7-001 → P7
- P7-002 → P7
- P7-003 → P7
- P7-004 → P7

---

## 5. Change Log

| Version | Date | What Changed | Propagated? |
|---------|------|-------------|-------------|
| 1.2 | 2026-03-11 | Corrected GOVERNANCE DOCUMENTS section in satellite block: OneDrive → GitHub as source of truth. Updated Registry URL to raw GitHub fetch pattern. Removed .txt file references. Updated file header and footer to reference GitHub. Bumped EAB block version marker to v1.2. | Pending |
| 1.1 | 2026-03-05 | Added P9 (Business Continuity). Added P4-002 (Revit & BIM Automation). Added P7-001 through P7-004. Corrected project count to 17. Added governance doc fetch fallback instruction. Added P9 routing redirect. | Pending |
| 1.0 | 2026-03-01 | Initial version. 9 projects (P0–P8), 2 subprojects (P4-001, P5-001). Never deployed. | No |

---

## 6. Propagation Tracker

Check off each project after pasting the updated EAB block.

| Project | EAB Version | Date Pasted | Pasted By | Notes |
|---------|-------------|-------------|-----------|-------|
| P1 — Financial Modeling & Pricing | — | — | — | Awaiting v1.2 deployment |
| P2 — SOP & Workflow Library | — | — | — | Awaiting v1.2 deployment |
| P3 — Competitive Intel & BD | — | — | — | Awaiting v1.2 deployment |
| P4 — AI Infrastructure & Deployment | — | — | — | Awaiting v1.2 deployment |
| P5 — IT Security / QOS | — | — | — | Awaiting v1.2 deployment |
| P6 — HR, People & Legal Ops | — | — | — | Awaiting v1.2 deployment |
| P7 — Odoo Platform & ERP | — | — | — | Awaiting v1.2 deployment |
| P8 — Proposals & RFP Operations | — | — | — | Awaiting v1.2 deployment |
| P9 — Business Continuity & Resilience | v1.1 | 2026-03-05 | Greg | Embedded in instructions at creation |
| P4-001 — MCP Evaluation & Selection | — | — | — | Awaiting v1.2 deployment |
| P4-002 — Revit & BIM Automation | — | — | — | Awaiting v1.2 deployment |
| P5-001 — Network Infrastructure Assessment | — | — | — | Awaiting v1.2 deployment |
| P7-001 — Dev Environment & AI Tooling | — | — | — | Awaiting v1.2 deployment |
| P7-002 — Platform Audit & Uplift | — | — | — | Awaiting v1.2 deployment |
| P7-003 — Odoo 19 Feature Mining | — | — | — | Awaiting v1.2 deployment |
| P7-004 — Notification Center & Invoice Request | — | — | — | Awaiting v1.2 deployment |

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

---

*This document is maintained in GitHub at
bcgcorp/bcg-ops-governance/standards/ and used as the copy source for
all project custom instructions. Do not maintain separate copies. When
the EAB is updated, re-propagate to all projects and update the tracker
above.*
```
