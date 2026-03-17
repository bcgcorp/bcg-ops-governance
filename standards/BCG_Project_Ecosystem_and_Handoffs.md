# BCG Corp — Project Ecosystem & Handoffs

**Version:** 1.5  
**Effective:** March 2026  
**Last Updated:** 2026-03-16  
**Scope:** All Claude Projects (P0–P10) and subprojects  
**Owner:** Gregory Bernardo, President

**v1.5 Changes:** Updated Section 5.4 EAB version reference from v1.3 to v1.4 (matching actual EAB on GitHub).

**v1.4 Changes:** Updated scope from P0–P8 to P0–P10. Added P9 (Business Continuity), P10 (Legal, Compliance & Risk) to satellite registry. Added P0-001, P4-002, P5-002, P8-001 to subproject registry; updated P4-001 and P5-001 entries. Updated routing redirects for P9/P10. Updated cross-project dependencies to current state. Changed source-of-truth reference from OneDrive to GitHub per GOV-001. Updated EAB section to reference GitHub.

---

## 1. Purpose

This document is the single source of truth for BCG's Claude Project structure: which projects exist, what they produce, how outputs flow between them, and the conventions for creating subprojects and routing work. Every Claude Project should reference this document (fetched from GitHub per GOV-001) rather than maintaining its own copy of the project registry.

**GitHub location:** `bcg-ops-governance/standards/BCG_Project_Ecosystem_and_Handoffs.md`

---

## 2. Project Registry

### 2.1 Master Project (P0)

| Field | Value |
|-------|-------|
| **ID** | P0 |
| **Name** | Master Strategic Plan |
| **Role** | Synthesis hub — consumes approved outputs from all satellites, does not produce deliverables itself |
| **Owner** | Gregory Bernardo |
| **Key Inputs** | Approved handoffs from P1–P10 and subprojects (via parent satellite) |
| **Key Outputs** | Strategic synthesis, cross-project alignment, consolidated planning |

### 2.2 Satellite Projects (P1–P10)

| ID | Project | Owner | What It Produces | Key Consumers |
|----|---------|-------|-----------------|---------------|
| P1 | Financial Modeling & Pricing | Gregory Bernardo | Revenue models, pricing analysis, break-even, compensation modeling, budget impacts | P0, P6 (comp implications) |
| P2 | SOP & Workflow Library | Jennifer Brezniak | Approved SOPs (W-01 through W-23+), PROD-series, process documentation, Odoo task templates | P0, P7 (Odoo mapping), all projects (process reference) |
| P3 | Competitive Intel & BD | Gregory Bernardo | Competitor updates, teaming evaluations, decision-maker playbook, market positioning | P0 |
| P4 | AI Infrastructure & Deployment | Jason Harris | AI configs, deployment runbooks, MCP integrations, guardrails, monitoring architecture | P0, P5 (security review), P7 (Odoo MCP) |
| P5 | IT Security / QOS | Bob Brezniak | Compliance artifacts, NIST CSF 2.0 alignment, CIS Controls implementation, Defender policies | P0, P4 (security requirements) |
| P6 | HR & People | Jennifer Brezniak | Headcount planning, org chart, compensation analysis, employment templates | P0, P1 (financial impacts) |
| P7 | Odoo Platform & ERP | Victor Carrillo | Module status, ERP readiness assessments, accounting configuration, custom module specs | P0, P2 (SOP-to-Odoo mapping), P4 (MCP integration) |
| P8 | Proposals & RFP Ops | Gregory Bernardo | Bid/no-bid recommendations, proposal packages, promise tracking registers, pipeline analytics, pricing forensics | P0, P1, P2, P3, P7 |
| P9 | Business Continuity & Resilience | Gregory Bernardo | BC/DR plans, resilience protocols, risk assessments (Gregory only) | P0 |
| P10 | Legal, Compliance & Risk | Gregory Bernardo | Legal matters, insurance governance, compliance tracking, contract review (Gregory only) | P0 |

**Access restrictions:** P9 and P10 are Gregory-only projects due to sensitive legal and continuity content. No team member access.

### 2.3 Subproject Registry

Subprojects are specialized workstreams within a satellite project that need their own Claude Project, knowledge base, and custom instructions.

| ID | Parent | Subproject Name | What It Produces | Status |
|----|--------|----------------|-----------------|--------|
| P0-001 | P0 | Ecosystem Triage & Routing | Classified updates, I-number registrations, handoff prompts, Initiative Catalog maintenance | Active |
| P4-001 | P4 | BCG Tab / pyRevit Tools | pyRevit button panels, Revit automation tools, tab architecture | Active |
| P4-002 | P4 | Revit Design Tools | Design-layer Revit tooling (I-09, I-28, I-44–I-46, I-49) | Active |
| P5-001 | P5 | Network Infrastructure | Firewall/switch assessment, monitoring specs, security monitoring runbooks | Active (Ph1 complete) |
| P5-002 | P5 | Monitoring & Observability | Ph2 monitoring stack (unblocked April 1 with Jason) | Active (gated) |
| P8-001 | P8 | Document Intake & Routing | RFP/CO/PO intake processing, pipeline feed | Active (go-live pending) |

*Add rows as subprojects are created. See Section 5 for conventions.*

---

## 3. Handoff Conventions

### 3.1 Handoff Label Format

All approved outputs flowing between projects use standardized labels.

**Satellite → P0 (or satellite → satellite):**
```
[FROM: P{#} — {project name}] [DATE: {YYYY-MM-DD}] [TOPIC: {brief description}]
```

**Subproject → Parent satellite:**
```
[FROM: P{#}-{###} — {subproject name}] [DATE: {YYYY-MM-DD}] [TOPIC: {brief description}]
```

**Examples:**
```
[FROM: P4 — AI Infrastructure & Deployment] [DATE: 2026-03-01] [TOPIC: Observability MCP server selections approved]
[FROM: P4-001 — BCG Tab / pyRevit Tools] [DATE: 2026-03-08] [TOPIC: Tab Style Guide v1.0 locked]
[FROM: P10 — Legal, Compliance & Risk] [DATE: 2026-03-15] [TOPIC: I-24 licensing audit scope defined]
```

### 3.2 What Triggers a Handoff

A handoff occurs when:
- A deliverable is approved (`[APPROVED — v{date}]`) and has value for another project
- A subproject completes an evaluation, analysis, or recommendation that the parent needs to act on
- A project discovers work that belongs in a different project's scope (routing redirect)
- Cross-project dependencies are identified (e.g., P4 MCP deployment requires P5 security review)

### 3.3 Handoff Content Requirements

Every handoff must include:
- The standardized label (Section 3.1)
- Approval status and approver
- Summary of what was decided or produced (not just "see attached")
- Action items for the receiving project, with owner names
- Any items flagged for specific reviewers: `[CONTRIBUTED BY: {name} — NEEDS REVIEW BY: {owner}]`
- Link or reference to the source document in the originating project's knowledge base

### 3.4 Handoff Routing Rules

| Scenario | Route | Example |
|----------|-------|---------|
| Satellite produces a strategic insight | Satellite → P0 | P3 competitive analysis → P0 strategic plan |
| Subproject completes an evaluation | Subproject → Parent satellite | P4-001 MCP selection → P4 for deployment |
| Work belongs in a different satellite | Redirect with explanation | P4 identifies SOP need → redirect to P2 |
| Cross-project dependency | Flag in both projects | P4 MCP deployment needs P5 Defender policy |
| Budget/financial implication | Flag for P1 | P4 recommends commercial tool → flag for P1 cost analysis |
| HR/staffing implication | Flag for P6 | P4 needs fractional hire → flag for P6 |
| Odoo configuration needed | Flag for P7 | P2 SOP requires Odoo automation → flag for P7 |
| Proposal pricing data available | Flag for P1 | P8 fee estimates → P1 for revenue model calibration |
| Competitor spotted in RFP process | Flag for P3 | P8 competitor sighting → P3 for database update |
| Proposal creates Odoo CRM requirement | Flag for P7 | P8 pipeline tracking need → P7 for module spec |
| BC/DR concern identified | Flag for P9 | P5 identifies single point of failure → P9 for resilience plan |
| Legal/compliance concern identified | Flag for P10 | P6 discovers licensing gap → P10 for compliance tracking |
| Insurance or contract question | Flag for P10 | P8 encounters liability clause → P10 for review |

**Core rule:** Subprojects report to their parent satellite — never directly to P0. The parent satellite consolidates and routes to P0 as part of its own handoff cycle.

---

## 4. Routing Redirects

When a request arrives in the wrong project, Claude should redirect rather than produce out-of-scope work.

**Template:**
```
This request is better served in P{#} — {project name} because {reason}. 
That project handles {scope description}. 
I can help you frame the request for that project if you'd like.
```

**Common redirects:**

| If someone asks for... | In project... | Redirect to... |
|----------------------|--------------|----------------|
| Revenue model or pricing | P4, P5, P7 | P1 — Financial Modeling & Pricing |
| SOP development | P4, P5 | P2 — SOP & Workflow Library |
| Competitor analysis | P1, P4 | P3 — Competitive Intel & BD |
| MCP server evaluation | P4 | P4-001 — BCG Tab / pyRevit Tools |
| Custom MCP server development | P4-001 | P4 — AI Infrastructure & Deployment |
| Revit design tooling | P4 | P4-002 — Revit Design Tools |
| Defender or compliance policy | P4 | P5 — IT Security / QOS |
| Hiring, compensation, org chart | Any | P6 — HR & People |
| Odoo module or ERP config | P2, P4 | P7 — Odoo Platform & ERP |
| RFP analysis or bid decision | Any | P8 — Proposals & RFP Ops |
| Document intake processing | P8 | P8-001 — Document Intake & Routing |
| BC/DR planning, resilience | Any | P9 — Business Continuity & Resilience |
| Legal matters, licensing, insurance | Any | P10 — Legal, Compliance & Risk |
| Contract review, compliance tracking | P6, P8 | P10 — Legal, Compliance & Risk |

---

## 5. Subproject Conventions

### 5.1 When to Create a Subproject

Create a subproject when a workstream within a satellite:
- Needs its own custom instructions (different from the parent's)
- Has a knowledge base that would clutter the parent project
- Will produce multiple evaluation cycles or versioned deliverables
- Has a distinct enough scope that contributors need dedicated context

Do NOT create a subproject for:
- A single deliverable or one-time analysis (just do it in the parent)
- Work that doesn't need its own knowledge base
- Anything that doesn't recur or version over time

### 5.2 Subproject Structure

| Element | Convention |
|---------|------------|
| **Numbering** | Three-digit sequential within parent: P4-001, P4-002, P4-003 |
| **Naming** | Descriptive name after the ID (e.g., "BCG Tab / pyRevit Tools") |
| **Claude Project** | Each subproject gets its own Claude Project with custom instructions |
| **Knowledge base** | Scoped to that workstream. Shared governance docs fetched from GitHub per GOV-001. |
| **Inheritance** | Subprojects inherit all security boundaries and formatting standards from the master style guide and their parent project |
| **Precedence** | Parent project-specific instructions take precedence over subproject instructions in case of conflict |

### 5.3 Subproject Lifecycle

| Stage | Action |
|-------|--------|
| **Creation** | Parent project owner decides a workstream needs isolation. Assigns ID, creates Claude Project, writes custom instructions. |
| **Active** | Subproject produces deliverables, manages its own knowledge base, hands off approved outputs to parent. |
| **Dormant** | Workstream complete but may reactivate (e.g., quarterly evaluation cycles). Project remains, no active work. |
| **Closed** | Workstream permanently complete. Final handoff to parent. Knowledge base archived. Claude Project can be deleted. |

### 5.4 Ecosystem Awareness Block (EAB)

Every satellite project's custom instructions must include the Ecosystem Awareness Block (EAB), which provides cross-project routing awareness, handoff labeling format, and dependency flagging conventions.

| Attribute | Value |
|-----------|-------|
| **Master file** | GitHub: `bcg-ops-governance/standards/BCG_Ecosystem_Awareness_Block.md` |
| **Current version** | v1.4 |
| **Deployment** | Copy-paste into custom instructions (embedded, not runtime-fetched) |
| **Placement** | After SECURITY BOUNDARIES, before COMMANDS & SHORTCUTS |
| **Update cycle** | Re-propagate to all satellites whenever the block changes |

When a new satellite project or subproject is created:
1. Add it to the EAB master file's project registry and subproject tables
2. Increment the EAB version number
3. Re-propagate the updated EAB to all existing satellites
4. Paste the EAB into the new project's custom instructions
5. Update the propagation tracker in the EAB master file

---

## 6. Cross-Project Dependency Tracking

When one project's work depends on another project's output, flag the dependency explicitly.

**Format:**
```
[DEPENDENCY: P{#} needs {what} from P{#} by {when}]
```

**Active Dependencies (as of March 16, 2026):**

| Dependent Project | Needs | From Project | By When | Status |
|-------------------|-------|-------------|---------|--------|
| P4 | Jason Harris start (Phase 4 AI build) | D-04 milestone | Apr 1, 2026 | Confirmed — 16 days |
| P4 | Defender ASR whitelisting for MCP servers | P5 | Q2 '26 | Pending — Bob to review |
| P5-002 | Jason Harris start (Ph2 monitoring) | D-04 milestone | Apr 1, 2026 | Gated |
| P1 | Accounting data source decision | D-01 (Gregory) | Q2 '26 | Blocked — open decision |
| P7 (I-23) | Accounting data source decision | D-01 (Gregory) | Q2 '26 | Blocked — open decision |
| P8-001 | Go-live test scheduling | Gregory + Rachel | Q2 '26 | Ready — 30-min test needed |
| P4-002 | BIM Lead hire | P6 (I-40 benefits review) | Q2 '26 | Blocked on I-40 |
| P2 (W-21) | Document storage policy decisions | Gregory | Q2 '26 | Blocked — 3 decisions needed |
| I-60 (Cowork) | Security assessment completion | P5 (I-61) | Q2 '26 | Gated on I-61 |

*Add rows as cross-project dependencies are identified. Remove rows when resolved.*

---

## 7. Approved Handoff Log

Running log of all approved handoffs. Newest first.

| Date | From | To | Topic | Approver |
|------|------|----|-------|----------|
| 2026-03-15 | P0 | P10 | P10 Legal project activated, I-24 owner assigned | Gregory |
| 2026-03-14 | P5 | P0 | M365 security lockdown confirmed complete | Bob / Gregory |
| 2026-03-12 | P8 | P0 | W-16 Bid/No-Bid SOP closed — $15K threshold, Stephanie backup | Gregory |
| 2026-03-01 | P4-001 | P4 | MCP server selection for Observability & Monitoring | Gregory |

*Add rows as handoffs are approved.*

---

## 8. Change Log

| Version | Date | What Changed |
|---------|------|-------------|
| 1.5 | 2026-03-16 | Updated Section 5.4 EAB version reference from v1.3 to v1.4. |
| 1.4 | 2026-03-16 | Full ecosystem update: scope P0–P10. Added P9, P10 to satellites. Added P0-001, P4-002, P5-002, P8-001 to subprojects. Updated P4-001 and P5-001 entries. Added P9/P10 routing redirects. Replaced dependency table with current state. Added handoff log entries. Changed source-of-truth from OneDrive to GitHub per GOV-001. Updated EAB section to reference GitHub. |
| 1.3 | 2026-03-09 | Added P5 VPN architecture documentation dependency (P4 → P5) to Section 6 cross-project dependency table. |
| 1.2 | 2026-03-01 | Added P5-001 (Network Infrastructure Assessment) to subproject registry. Added Section 5.4 Ecosystem Awareness Block (EAB) with master file location, deployment method, and new-project checklist. |
| 1.1 | 2026-03-01 | Added P8 (Proposals & RFP Operations) to project registry. Updated P0 inputs scope to P1–P8. Added P8 routing redirects (4 entries). Added P8 cross-project dependencies (4 entries). Added P8 handoff routing rules (3 entries). Updated document scope from P0–P7 to P0–P8. |
| 1.0 | 2026-03-01 | Initial version. Extracted from BCG_Style_and_Formatting_Standards.md Section 10, expanded with handoff content requirements, routing redirects, cross-project dependencies, and handoff log. |

---

*This document is maintained on GitHub at `bcg-ops-governance/standards/` and is the authoritative source per GOV-001. OneDrive copies are archive/backup only. Update this file when projects are created, closed, or restructured.*