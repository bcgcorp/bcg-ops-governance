# BCG Corp — Ecosystem Awareness Block (EAB)

**Version:** 1.7
**Effective:** April 2026
**Last Updated:** 2026-04-19
**Scope:** All Claude Projects (P1–P11, all subprojects)
**Owner:** Gregory Bernardo, President

**What This Is:** The Ecosystem Awareness Block is a standardized text block copy-pasted into every satellite and subproject's custom instructions. It gives each project awareness of the full 18-project ecosystem so that routing, handoffs, and dependency flagging work correctly. This GitHub file is the single source of truth — copy from here, paste into projects.

**What This Is NOT:** This is not a runtime-fetched document. Projects do not fetch this file during conversations. The EAB text is embedded directly in each project's custom instructions. This file exists so there is one canonical version to copy from when propagating or updating.

**What Changed (v1.7):** Two reconciliation changes bundled into a single bump, plus one in-place correction:
- **Retired P0-001** from the subproject list. Triage function absorbed into P0 via protocol-harness pattern (I-75, see `standards/protocols/`). Removed from Section 2 Placement Guide, Section 3 Subprojects table, and Section 4 parent-routing list.
- **Added P4-003 (BCG EasyButton / Idea Capture)** to the subproject list. P4-003 was registered in Catalog v2.9 (2026-04-18) but never propagated to EAB — this bump fixes that pre-existing drift. Added to Section 3 Subprojects table and Section 4 parent-routing list.
- **P11 access model reconciled (in-place correction during v1.7 propagation):** v1.6 expanded P11 access in the EAB description to "Gregory & Jennifer only" but P11's own project instructions were never updated to match. During v1.7 propagation, a first attempt briefly reverted the EAB to "Gregory-only" on the mistaken assumption that P11's instructions represented the authoritative policy. The president clarified the actual intent: P11 is Gregory and Jennifer, matching v1.6's EAB direction. The in-place correction landed 2026-04-19: P11 description confirmed as "Gregory & Jennifer only" in the EAB (Section 3 registry row + routing redirect), and P11's own instructions updated to reflect Jennifer as co-authorized user (Gregory retains sole approver authority for CIR recommendations).

**Net count:** 18-project ecosystem count unchanged (12 parents + 6 subs). Subproject list members changed: [P0-001, P4-001, P4-002, P5-001, P5-002, P8-001] → [P4-001, P4-002, P4-003, P5-001, P5-002, P8-001].

---

## 1. How to Use This File

### Initial Deployment
1. Copy the EAB block from Section 3 (between the START and END markers)
2. Open each project's Custom Instructions in Claude
3. Paste after the SECURITY BOUNDARIES section, before COMMANDS & SHORTCUTS (or end)
4. For subprojects: use Section 4 variant instead of Section 3
5. Save. Repeat for all 17 non-P0 projects.

### When to Update
Update the EAB and re-propagate when:
- A new project or subproject is created or closed
- A project is renamed or its scope changes significantly
- A new common routing redirect pattern is identified
- The handoff label format changes

### Update Process
1. Edit the relevant section of this file in GitHub
2. Increment the version in the block header (v1.7 to v1.8, etc.)
3. Update Section 5 (change log)
4. Re-paste the updated block into all affected projects listed in Section 6
5. Check off each project in the propagation tracker

### Estimated Time
- Full re-deployment (all 17 projects): ~45 minutes
- Partial update (satellites only or subprojects only): ~25 minutes

---

## 2. Placement Guide

### Satellites (P1–P11)
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
| P11 — Candidate OSINT & Pre-Hire Intelligence | SECURITY BOUNDARIES | end |

### Subprojects (P4-001, P4-002, P4-003, P5-001, P5-002, P8-001)
Use the subproject variant from Section 4. Paste after SECURITY BOUNDARIES.

**Rule:** The satellite block (Section 3) is identical in every satellite. The subproject block (Section 4) uses a customized routing section per subproject. Do not mix them.

---

## 3. Satellite EAB Block — COPY THIS FOR P1–P11

EAB: v1.7 | 2026-04-19

CROSS-PROJECT ECOSYSTEM (EAB v1.7 — April 2026)

This project is one satellite in BCG's 18-project Claude ecosystem. P0 is the strategic synthesis hub; P1–P11 are production satellites; P4-001, P4-002, P4-003, P5-001, P5-002, and P8-001 are active subprojects. Understanding the ecosystem prevents scope drift and enables proper routing.

PROJECT REGISTRY
| ID | Project | Scope Summary |
|----|---------|---------------|
| P0 | Master Strategic Plan | Synthesis hub. Consumes approved outputs from all satellites. Does not produce deliverables. Owns ecosystem triage via protocol-harness (W-20 v1.2 in standards/protocols/). |
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
| P11 | Candidate OSINT & Pre-Hire Intelligence | Pre-hire public record and digital footprint review. Gregory & Jennifer only. Triggered pre-offer. RESTRICTED. |

SUBPROJECTS
| ID | Parent | Name |
|----|--------|------|
| P4-001 | P4 | MCP Evaluation & Selection |
| P4-002 | P4 | Revit & BIM Automation |
| P4-003 | P4 | BCG EasyButton / Idea Capture |
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
- Strategic synthesis/cross-project coordination/ecosystem triage → P0
- Business continuity planning → P9
- Legal/compliance/licensing/contract review/insurance → P10 (Gregory-only; route to Gregory directly)
- Pre-hire candidate background investigation → P11 (Gregory & Jennifer only; RESTRICTED)
- Inbound business documents (RFPs, Contracts, POs, WOs, COs) → P8-001
- Voice-activated idea capture / EasyButton tooling → P4-003

HANDOFF FORMAT
When producing outputs that should flow to another project or to P0, use this label:
  [FROM: P{#} — {project name}] [DATE: {YYYY-MM-DD}] [TOPIC: {brief}]

Subproject handoffs go to parent satellite first, never directly to P0:
  [FROM: P{#}-{###} — {subproject name}] [DATE: {YYYY-MM-DD}] [TOPIC: {brief}]

Exception: subprojects of P0 (if any) route directly to P0. As of 2026-04-19, P0 has no active subprojects (P0-001 retired; its triage function absorbed into P0 via protocol-harness).

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
  [FLAG FOR P11: New hire candidate at conditional offer stage — trigger pre-offer OSINT investigation]

GOVERNANCE DOCUMENTS
BCG maintains governance documents in GitHub as the single source of truth (GOV-001, approved 2026-03-11). The Governance Doc Registry is the entry point:
  URL: https://raw.githubusercontent.com/bcgcorp/bcg-ops-governance/refs/heads/main/standards/BCG_Governance_Doc_Registry.md

For detailed routing rules and handoff requirements, fetch:
  BCG_Project_Ecosystem_and_Handoffs.md (URL in Registry)

For current initiative and workstream status, fetch:
  BCG_Initiative_and_Workstream_Catalog.md (URL in Registry)

For ecosystem triage / classification / I-number assignment: P0 owns this function as of 2026-04-19 (absorbed from retired P0-001). P0 fetches `standards/protocols/W-20_Ecosystem_Triage.md` on matching triggers.

Do NOT maintain separate copies of governance documents in this project's knowledge base. The GitHub versions are authoritative.

If governance doc fetch fails, flag [NOTE: Governance docs unavailable — operating from embedded EAB only. Routing and handoff functions remain active.] and proceed with embedded routing rules. Do not halt the session.

---

## 4. Subproject EAB Variants

The subproject EAB block differs from the satellite block in three ways:
1. Opening line says "one subproject" not "one satellite"
2. Additional routing rule: all outputs route to parent, never directly to P0
3. Common redirects section is customized per subproject

Subproject routing parent assignments:
- P4-001 → P4
- P4-002 → P4
- P4-003 → P4
- P5-001 → P5
- P5-002 → P5
- P8-001 → P8

(P0-001 retired 2026-04-19 — triage function absorbed into P0 via protocol-harness pattern.)

---

## 5. Change Log

| Version | Date | What Changed | Propagated? |
|---------|------|-------------|-------------|
| 1.7 | 2026-04-19 | Retired P0-001 from subproject list (absorbed into P0 via protocol-harness / I-75). Added P4-003 to subproject list (catches up 2026-04-18 catalog drift). Confirmed P11 access as "Gregory & Jennifer only" (reconciling v1.6 intent with P11's own instructions — see in-place correction note below). Updated Section 3 Subprojects table, Section 4 parent-routing, Section 2 Placement Guide. Added P0 scope note referencing W-20 v1.2 protocol. Added P4-003 routing redirect. Net project count unchanged (18). | ✅ Yes — all 17 projects at v1.7 (2026-04-19). P1 pushed via GitHub MCP (commit 5c6dad43); P2–P11 + subprojects + README pushed via local repo commit 2026-04-19. P11 description in-place correction pushed 2026-04-19. Claude UI propagation completed 2026-04-19. |
| 1.6 | 2026-04-01 | P11 access expanded: "Gregory-only" → "Gregory & Jennifer only" in project registry row and routing redirect. No structural changes to EAB format. NOTE: The expansion was reflected in the EAB but not applied to P11's own project instructions at the time; that gap was closed during v1.7 propagation (2026-04-19). | ✅ Yes — all 17 projects at v1.6 (2026-04-15). P11 updated at deploy (2026-04-01); P1–P10 and all subprojects updated 2026-04-15 via GitHub MCP batch commits. |
| 1.5 | 2026-03-17 | Added P11 (Candidate OSINT & Pre-Hire Intelligence) to project registry. Updated project count 17 to 18. Updated scope P1–P11. Added P11 routing redirect and flagging example. | Yes — 17/17 projects at v1.5 (2026-03-17) |
| 1.4 | 2026-03-17 | Added P10 to project registry. Updated project count 16 to 17. Updated P6 scope: HR & People (removed Legal Ops). Added P10 routing redirect. Added P10 flagging example. | Superseded by v1.5 |
| 1.3 | 2026-03-12 | Retired P7-001 through P7-004. Added P0-001, P5-002, P8-001. Updated project count 17 to 16. | Superseded by v1.4 |
| 1.2 | 2026-03-11 | OneDrive to GitHub source of truth. | Yes — 2026-03-12 |
| 1.1 | 2026-03-05 | Added P9, P4-002, P7-001 through P7-004. | Yes — 2026-03-12 |
| 1.0 | 2026-03-01 | Initial version. Never deployed. | No |

---

## 6. Propagation Tracker

### Satellites (11)

| Project | Current EAB Version | v1.7 Propagation Status | Notes |
|---------|-------------|-------------|-------|
| P1 | v1.7 | ✅ Propagated 2026-04-19 | GitHub MCP commit 5c6dad43 |
| P2 | v1.7 | ✅ Propagated 2026-04-19 | Local repo commit |
| P3 | v1.7 | ✅ Propagated 2026-04-19 | Local repo commit |
| P4 | v1.7 | ✅ Propagated 2026-04-19 | Local repo commit |
| P5 | v1.7 | ✅ Propagated 2026-04-19 | Local repo commit |
| P6 | v1.7 | ✅ Propagated 2026-04-19 | Local repo commit |
| P7 | v1.7 | ✅ Propagated 2026-04-19 | Local repo commit |
| P8 | v1.7 | ✅ Propagated 2026-04-19 | Local repo commit |
| P9 | v1.7 | ✅ Propagated 2026-04-19 | Local repo commit |
| P10 | v1.7 | ✅ Propagated 2026-04-19 | Local repo commit. P10 uses variant EAB shape (no `EAB: v1.6\|` header line; `## CROSS-PROJECT ECOSYSTEM` heading format preserved) |
| P11 | v1.7 | ✅ Propagated 2026-04-19 | Local repo commit. P11 had been left at v1.5 in the v1.6 propagation — this bump catches it up. |

### Subprojects (6 — P0-001 retired 2026-04-19)

| Project | Current EAB Version | v1.7 Propagation Status | Notes |
|---------|-------------|-------------|-------|
| P4-001 | v1.7 | ✅ Propagated 2026-04-19 | Local repo commit. Satellite-shape EAB. |
| P4-002 | v1.7 | ✅ Propagated 2026-04-19 | Local repo commit. Satellite-shape EAB. |
| P4-003 | v1.7 | ✅ Initial deploy 2026-04-19 | P4-003 registered 2026-04-18; first-ever EAB deploy at v1.7 via this migration. Satellite-shape EAB matching P4-001/P4-002 precedent. |
| P5-001 | v1.7 | ✅ Propagated 2026-04-19 | Local repo commit. Satellite-shape EAB. |
| P5-002 | v1.7 | ✅ Propagated 2026-04-19 | Local repo commit. Subproject-shape EAB (custom routing-to-parent language). |
| P8-001 | v1.7 | ✅ Propagated 2026-04-19 | Local repo commit. Subproject-shape EAB (custom routing-to-parent language). |

### Retired (do not propagate)

| Project | Retired | Reason |
|---------|---------|--------|
| P7-001 | 2026-03-12 | Consolidated into P7 parent |
| P7-002 | 2026-03-12 | Consolidated into P7 parent |
| P7-003 | 2026-03-12 | Consolidated into P7 parent |
| P7-004 | 2026-03-12 | Consolidated into P7 parent |
| P0-001 | 2026-04-19 | Triage function absorbed into P0 via protocol-harness pattern (I-75) |

---

*This document is maintained in GitHub at bcg-ops-governance/standards/ and used as the copy source for all project custom instructions.*
