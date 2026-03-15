# BCG Corp — Project Ecosystem & Handoffs

**Version:** 1.6
**Effective:** March 2026
**Last Updated:** 2026-03-14
**Scope:** All Claude Projects (P0–P9) and subprojects
**Owner:** Gregory Bernardo, President

---

## 1. Purpose

This document is the single source of truth for BCG's Claude Project structure: which projects exist, what they produce, how outputs flow between them, and the conventions for creating subprojects and routing work. Every Claude Project should reference this document (via GitHub) rather than maintaining its own copy of the project registry.

---

## 2. Project Registry

### 2.1 Master Project (P0)

| Field | Value |
|-------|-------|
| **ID** | P0 |
| **Name** | Master Strategic Plan |
| **Role** | Synthesis hub — consumes approved outputs from all satellites, does not produce deliverables itself |
| **Owner** | Greg |
| **Key Inputs** | Approved handoffs from P1–P8 and subprojects (via parent satellite) |
| **Key Outputs** | Strategic synthesis, cross-project alignment, consolidated planning |

### 2.2 Satellite Projects (P1–P9)

| ID | Project | Owner | What It Produces | Key Consumers |
|----|---------|-------|-----------------|---------------|
| P1 | Financial Modeling & Pricing | Greg | Revenue models, pricing analysis, break-even, compensation modeling, budget impacts | P0, P6 (comp implications) |
| P2 | SOP & Workflow Library | Greg | Approved SOPs (W-01 through W-22+), PROD-series, process documentation, Odoo task templates | P0, P7 (Odoo mapping), all projects (process reference) |
| P3 | Competitive Intel & BD | Greg | Competitor updates, teaming evaluations, decision-maker playbook, market positioning | P0 |
| P4 | AI Infrastructure & Deployment | Greg | AI configs, deployment runbooks, MCP integrations, guardrails, monitoring architecture | P0, P5 (security review), P7 (Odoo MCP) |
| P5 | IT Security / QOS | Greg + Bob | Compliance artifacts, NIST CSF 2.0 alignment, CIS Controls implementation, Defender policies | P0, P4 (security requirements) |
| P6 | HR, People & Legal Ops | Greg | Headcount planning, org chart, compensation analysis, legal documents, employment templates | P0, P1 (financial impacts) |
| P7 | Odoo Platform & ERP | Greg | Module status, ERP readiness assessments, accounting configuration, custom module specs | P0, P2 (SOP-to-Odoo mapping), P4 (MCP integration) |
| P8 | Proposals & RFP Operations | Greg | Bid/no-bid recommendations, proposal packages, promise tracking registers, pipeline analytics, pricing forensics | P0 (pipeline stats, capacity trends), P1 (actual pricing data, win/loss analysis), P2 (W-17 refinements), P3 (competitor sightings during pursuits), P7 (Odoo CRM pipeline requirements) |
| P9 | Business Continuity & Resilience | Greg | Dependency risk register, continuity protocols, tabletop exercise results, W-18 BCP Review SOP | P0 (Section 4 Risk Matrix, Addendum E), P2 (W-18 SOP registration) |

### 2.3 Subproject Registry

Subprojects are specialized workstreams within a satellite project that need their own Claude Project, knowledge base, and custom instructions.

| ID | Parent | Subproject Name | What It Produces | Status |
|----|--------|----------------|-----------------|--------|
| P0-001 | P0 | Ecosystem Triage & Routing Protocol | W-20 SOP, update classification matrix, standard update template, processing checklists, routing rules | Active |
| P4-001 | P4 | MCP Evaluation & Selection | MCP server evaluations, capability matrices, deployment recommendations | Active |
| P4-002 | P4 | Revit & BIM Automation | PyRevit buttons, Dynamo scripts, AutoCAD automation. 41-button backlog (B-01–B-41). | Active |
| P5-001 | P5 | Network Infrastructure Assessment | Firewall/switch config assessment, gap analysis, monitoring specs | Planned |
| P5-002 | P5 | Monitoring & Observability Infrastructure | Grafana/Prometheus/Loki stack. Phase 1 complete on ClarkKent. Phase 2 gated on Jason (April 1). | Active |
| P8-001 | P8 | Document Intake & Routing | Automated intake for RFPs, Contracts, POs, WOs, COs. Rachel McGee owns. Go-live 2026-03-12. | Active |

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
[FROM: P4-001 — MCP Evaluation & Selection] [DATE: 2026-03-01] [TOPIC: MCP server selection for Observability & Monitoring]
[FROM: P1 — Financial Modeling & Pricing] [DATE: 2026-02-15] [TOPIC: Updated revenue model with Q1 actuals]
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
|----------|-------|----------|
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
| BCP risk or continuity gap identified | Flag for P9 | Any project identifies system with no fallback → P9 risk register |

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
| MCP server evaluation | P4 | P4-001 — MCP Evaluation & Selection |
| Custom MCP server development | P4-001 | P4 — AI Infrastructure & Deployment |
| Defender or compliance policy | P4 | P5 — IT Security / QOS |
| Hiring, compensation, org chart | Any | P6 — HR, People & Legal Ops |
| Odoo module or ERP config | P2, P4 | P7 — Odoo Platform & ERP |
| RFP analysis or bid decision | Any | P8 — Proposals & RFP Operations |
| Proposal pricing or fee estimate | P1, P3 | P8 — Proposals & RFP Operations |
| Promise tracking or scope creep analysis | Any | P8 — Proposals & RFP Operations |
| Win/loss analysis or pipeline stats | P1, P3 | P8 — Proposals & RFP Operations |
| Business continuity or disaster recovery | Any | P9 — Business Continuity & Resilience |

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
| **Naming** | Descriptive name after the ID (e.g., "MCP Evaluation & Selection") |
| **Claude Project** | Each subproject gets its own Claude Project with custom instructions |
| **Knowledge base** | Scoped to that workstream. Shared governance docs fetched from GitHub. |
| **Inheritance** | Subprojects inherit all security boundaries and formatting standards from the master style guide and their parent project |
| **Precedence** | Parent project-specific instructions take precedence over subproject instructions in case of conflict |

### 5.3 Subproject Lifecycle

| Stage | Action |
|-------|--------|
| **Creation** | Parent project owner (usually Greg) decides a workstream needs isolation. Assigns ID, creates Claude Project, writes custom instructions. |
| **Active** | Subproject produces deliverables, manages its own knowledge base, hands off approved outputs to parent. |
| **Dormant** | Workstream complete but may reactivate (e.g., quarterly evaluation cycles). Project remains, no active work. |
| **Closed** | Workstream permanently complete. Final handoff to parent. Knowledge base archived. Claude Project can be deleted. |

### 5.4 Ecosystem Awareness Block (EAB)

Every satellite project's custom instructions must include the Ecosystem Awareness Block (EAB), which provides cross-project routing awareness, handoff labeling format, and dependency flagging conventions.

| Attribute | Value |
|-----------|-------|
| **Master file** | GitHub: `bcgcorp/bcg-ops-governance/standards/BCG_Ecosystem_Awareness_Block.md` |
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

**Active Dependencies (as of March 2026):**

| Dependent Project | Needs | From Project | By When | Status |
|-------------------|-------|-------------|---------|--------|
| P4 | Observability MCP deployment (infra + AI tools) | P4-001 (evaluation complete) | Q2 '26 | Handoff approved 2026-03-01 |
| P4 | Defender ASR whitelisting for MCP servers | P5 | Q2 '26 Sprint 1 | Pending — Bob to review |
| P4 | Custom pfSense MCP server development | P4 (self, via I-25) | Q3 '26 | Pending — awaiting capacity |
| P2 | Prometheus/Grafana SOPs | P4 (deployment knowledge) | Q2–Q3 '26 | Flagged in P4-001 handoff |
| P8 | Rate card and historical pricing data | Greg (upload) | Q2 '26 Sprint 1 | Not started — P8 KB empty |
| P8 | W-17 RFP Intake SOP | P2 | Q2 '26 | W-17 not yet drafted |
| P1 | Actual bid pricing and win/loss analysis | P8 | Ongoing | P8 feeds calibration data to P1 models |
| P3 | Competitor sightings from RFP processes | P8 | Ongoing | P8 feeds intel to P3 database |
| P5 | VPN architecture documentation (WireGuard + Tailscale) | P4 (architecture decision) | Q2 '26 | Handoff drafted 2026-03-09 |
| P8 | W-16 RFP Review SOP | P2 | Q2 '26 | Closed 2026-03-12. Step 6a ($15K auto no-bid threshold) and Step 6b (Stephanie Bernardo backup authority) both confirmed. |

*Add rows as cross-project dependencies are identified. Remove rows when resolved.*

---

## 7. Approved Handoff Log

Running log of all approved handoffs. Newest first.

| Date | From | To | Topic | Approver |
|------|------|----|-------|----------|
| 2026-03-01 | P4-001 | P4 | MCP server selection for Observability & Monitoring | Greg |

*Formal handoff tracking began March 2026. Prior cross-project work was not tracked under this convention. Add rows as handoffs are approved.*

---

## 8. Change Log

| Version | Date | What Changed |
|---------|------|-------------|
| 1.6 | 2026-03-14 | Section 2.3: Added P0-001, P4-002, P5-002; renamed P8-### to P8-001 with current status. Section 6: Closed W-16 dependency entry (both Step 6a and 6b confirmed 2026-03-12). |
| 1.5 | 2026-03-11 | Fixed malformed P8-### subproject registry row. Added W-16 cross-project dependency (P8 ← P2). |
| 1.4 | 2026-03-11 | Added P9 (Business Continuity & Resilience) to project registry (Section 2.2), routing rules (Section 3.4), and redirects (Section 4). Corrected all OneDrive references to GitHub. Updated EAB master file location. Updated scope to P0–P9. |
| 1.3 | 2026-03-09 | Added P5 VPN architecture documentation dependency (P4 → P5) to Section 6 cross-project dependency table. |
| 1.2 | 2026-03-01 | Added P5-001 (Network Infrastructure Assessment) to subproject registry. Added Section 5.4 Ecosystem Awareness Block (EAB) with master file location, deployment method, and new-project checklist. |
| 1.1 | 2026-03-01 | Added P8 (Proposals & RFP Operations) to project registry. Updated P0 inputs scope to P1–P8. Added P8 routing redirects (4 entries). Added P8 cross-project dependencies (4 entries). Added P8 handoff routing rules (3 entries). Updated document scope from P0–P7 to P0–P8. |
| 1.0 | 2026-03-01 | Initial version. Extracted from BCG_Style_and_Formatting_Standards.md Section 10, expanded with handoff content requirements, routing redirects, cross-project dependencies, and handoff log. |

---

*This document is maintained in GitHub at bcgcorp/bcg-ops-governance/standards/ and fetched by all Claude Projects at runtime. Update this file when projects are created, closed, or restructured. Do not maintain separate copies in individual project knowledge bases.*
