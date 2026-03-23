# BCG Corp — Project Ecosystem & Handoffs

**Version:** 1.6
**Effective:** March 2026
**Last Updated:** 2026-03-22
**Scope:** All Claude Projects (P0–P11) and subprojects
**Owner:** Gregory Bernardo, President

---

## 1. Purpose

This document is the single source of truth for BCG's Claude Project structure: which projects exist, what they produce, how outputs flow between them, and the conventions for creating subprojects and routing work.

**Source of truth:** GitHub (`bcg-ops-governance/standards/`). Per GOV-001, GitHub is the authoritative fetch source.

---

## 2. Project Registry

### 2.1 Master Project (P0)

| Field | Value |
|-------|-------|
| **ID** | P0 |
| **Name** | Master Strategic Plan |
| **Role** | Synthesis hub — consumes approved outputs from all satellites, does not produce deliverables |
| **Owner** | Gregory |

### 2.2 Satellite Projects (P1–P11)

| ID | Project | Owner | What It Produces | Key Consumers |
|----|---------|-------|-----------------|---------------|
| P1 | Financial Modeling & Pricing | Gregory | Revenue models, pricing analysis, break-even, compensation modeling | P0, P6 |
| P2 | SOP & Workflow Library | Jennifer | Approved SOPs (W-01–W-23+), PROD-series, process documentation | P0, P7, all projects |
| P3 | Competitive Intel & BD | Gregory | Competitor updates, teaming evaluations, DM playbook, market positioning | P0 |
| P4 | AI Infrastructure & Deployment | Jason (April 1) | AI configs, deployment runbooks, MCP integrations, guardrails | P0, P5, P7 |
| P5 | IT Security / QOS | Bob | Compliance artifacts, NIST CSF 2.0 alignment, CIS Controls, Defender policies | P0, P4 |
| P6 | HR & People | Jennifer | Headcount planning, org chart, compensation analysis, employment templates | P0, P1 |
| P7 | Odoo Platform & ERP | Victor | Module status, ERP readiness, accounting config, custom module specs | P0, P2, P4 |
| P8 | Proposals & RFP Operations | Gregory | Bid/no-bid recommendations, proposals, promise tracking, pipeline analytics | P0, P1, P2, P3, P7 |
| P9 | Business Continuity & Resilience | Gregory | Enterprise BCP, dependency risk register, continuity protocols | P0 |
| P10 | Legal, Compliance & Risk | Gregory (only) | Legal clearances, compliance status, insurance governance, contract review | P0 |
| P11 | Candidate OSINT & Pre-Hire Intelligence | Gregory (only) | Candidate Intelligence Reports (CIRs) — pre-hire public record and digital footprint review. RESTRICTED. | P10 (CIR custody), P6 (go/no-go decision) |

**Note:** P6 is HR & People ONLY. Legal, compliance, licensing, and insurance governance migrated to P10 as of 2026-03-15.
**Note:** P11 is Gregory-only, RESTRICTED. CIRs are triggered pre-offer and filed to P10 for custody. Go/no-go hiring decisions route to P6.

### 2.3 Subproject Registry

| ID | Parent | Subproject Name | What It Produces | Status |
|----|--------|----------------|-----------------|--------|
| P0-001 | P0 | Ecosystem Triage & Routing Protocol | Classified updates, handoff prompts, I-number registrations | Active |
| P4-001 | P4 | MCP Evaluation & Selection | MCP server evaluations, capability matrices | Active |
| P4-002 | P4 | Revit & BIM Automation | PyRevit buttons (47-button backlog B-01–B-47 across 10 panels), Dynamo scripts | Active |
| P5-001 | P5 | Network Infrastructure Assessment | Firewall/switch config assessment, gap analysis | Planned |
| P5-002 | P5 | Monitoring & Observability Infrastructure | Prometheus/Grafana/Loki stack, telemetry | Active (Ph1 complete) |
| P8-001 | P8 | Document Intake & Routing | RFP/CO/PO intake processing, file placement | Active |

**Retired subprojects:** P7-001 through P7-004 (retired 2026-03-12, knowledge consolidated into P7 parent).

---

## 3. Handoff Conventions

### 3.1 Handoff Label Format

**Satellite to P0:** `[FROM: P{#} — {project name}] [DATE: {YYYY-MM-DD}] [TOPIC: {brief}]`

**Subproject to Parent:** `[FROM: P{#}-{###} — {subproject name}] [DATE: {YYYY-MM-DD}] [TOPIC: {brief}]`

### 3.2 What Triggers a Handoff

A deliverable is approved and has value for another project, a subproject completes an evaluation, work is discovered that belongs in a different project's scope, or cross-project dependencies are identified.

### 3.3 Handoff Content Requirements

Every handoff must include: standardized label, approval status, summary of what was decided, action items for the receiving project with owner names, and reference to the source document.

### 3.4 Handoff Routing Rules

| Scenario | Route |
|----------|-------|
| Satellite produces strategic insight | Satellite to P0 |
| Subproject completes evaluation | Subproject to Parent satellite |
| Work belongs in different satellite | Redirect with explanation |
| Budget/financial implication | Flag for P1 |
| HR/staffing implication | Flag for P6 |
| Odoo configuration needed | Flag for P7 |
| Legal/compliance implication | Flag for P10 (Gregory only) |
| Business continuity gap | Flag for P9 |
| Pre-hire candidate investigation | Flag for P11 (Gregory only) |

**Core rule:** Subprojects report to their parent satellite — never directly to P0.
**P10 rule:** P10 outputs route directly to P0. P10 does NOT route to other satellites.
**P11 rule:** P11 outputs route to P10 (CIR custody) and P6 (go/no-go). P11 does NOT route to P0 directly. Gregory-only.

---

## 4. Routing Redirects

| If someone asks for... | Redirect to... |
|----------------------|----------------|
| Revenue model or pricing | P1 |
| SOP development | P2 |
| Competitor analysis | P3 |
| AI/MCP deployment | P4 |
| MCP server evaluation | P4-001 |
| PyRevit/Revit automation | P4-002 |
| Defender or compliance policy | P5 |
| Network infrastructure assessment | P5-001 |
| Monitoring/observability stack | P5-002 |
| Hiring, compensation, org chart | P6 |
| Odoo module or ERP config | P7 |
| RFP analysis or bid decision | P8 |
| Inbound business document intake | P8-001 |
| Business continuity planning | P9 |
| Licensing, insurance, contract review, legal | P10 (Gregory only) |
| Pre-hire candidate background investigation | P11 (Gregory only) |

---

## 5. Subproject Conventions

### 5.1 When to Create a Subproject

Create when a workstream needs its own custom instructions, has a knowledge base that would clutter the parent, will produce multiple versioned deliverables, or has distinct enough scope for dedicated context. Do NOT create for single deliverables or non-recurring work.

### 5.2 Subproject Structure

Numbering: Three-digit sequential within parent (P4-001, P4-002). Each gets its own Claude Project. Subprojects inherit all security boundaries and formatting standards. Parent instructions take precedence in conflict.

### 5.3 Subproject Lifecycle

Creation (owner assigns ID, creates project) → Active (produces deliverables, hands off to parent) → Dormant (may reactivate) → Closed (final handoff, archive KB).

### 5.4 Ecosystem Awareness Block (EAB)

Every satellite's custom instructions must include the EAB. Master file: `bcg-ops-governance/standards/BCG_Ecosystem_Awareness_Block.md`. Current version: **v1.5**. Deployed by copy-paste (embedded, not runtime-fetched). Placement: after SECURITY BOUNDARIES, before COMMANDS & SHORTCUTS.

---

## 6. Cross-Project Dependency Tracking

Format: `[DEPENDENCY: P{#} needs {what} from P{#} by {when}]`

**Active Dependencies (March 2026):**

| Dependent | Needs | From | By When | Status |
|-----------|-------|------|---------|--------|
| P4 | Observability MCP deployment | P4-001 (complete) | Q2 '26 | Approved 2026-03-01 |
| P4 | Defender ASR whitelisting for MCP | P5 | Q2 '26 | Pending — Bob |
| P2 | Prometheus/Grafana SOPs | P4 | Q2-Q3 '26 | Flagged |
| P5 | VPN architecture doc | P4 | Q2 '26 | Handoff drafted 2026-03-09 |
| P5-002 | Jason Harris start (Phase 2) | D-04 | April 1, 2026 | Phase 1 complete |
| P6 | I-24 Track A counsel opinion (Q4-Q5) | P10 | TBD | Gates W-23 |
| P3 | I-24 Track A counsel opinion (Q1-Q3) | P10 | TBD | Gates I-16, I-17, I-18, I-19, I-37 |
| P7 | Accounting data source decision | D-01 | TBD | Blocks I-23 |
| P6 | CIR go/no-go for finalist candidates | P11 | Ongoing | Active — triggered pre-offer |
| P10 | CIR custody filing | P11 | Ongoing | Active — P11 outputs to P10 |

---

## 7. Approved Handoff Log

| Date | From | To | Topic | Approver |
|------|------|----|-------|----------|
| 2026-03-17 | P0 | P11 | P11 activation — I-64, Candidate OSINT & Pre-Hire Intelligence | Gregory |
| 2026-03-15 | P0 | P10 | P10 activation — I-24, W-23, CAP-01, contract review | Gregory |
| 2026-03-12 | P5-002 | P5 | Phase 1 complete — ClarkKent, Telegraf, WireGuard | Gregory |
| 2026-03-09 | P4 | P5 | VPN architecture — WireGuard site-to-site Phase 1 | Gregory |
| 2026-03-01 | P4-001 | P4 | MCP server selection for Observability & Monitoring | Gregory |

---

## 8. Change Log

| Version | Date | What Changed |
|---------|------|-------------|
| 1.6 | 2026-03-22 | Section 2.3: Updated P4-002 button count 42 → 47 (B-01–B-47 across 10 panels, Print panel added). |
| 1.5 | 2026-03-17 | Added P11 (Candidate OSINT & Pre-Hire Intelligence) to satellite registry. Added P11 routing rules and redirect. Added P6/P10 dependencies from P11. Updated scope P0–P11. Updated EAB reference to v1.5. |
| 1.4 | 2026-03-17 | Added P9, P10 to project registry. Added P0-001, P4-002, P5-002, P8-001 to subproject registry. Added retired subproject table. Updated P6 name. Added P10 routing rules. Updated dependencies. Updated scope P0-P10. |
| 1.3 | 2026-03-09 | Added P5 VPN dependency. |
| 1.2 | 2026-03-01 | Added P5-001 to subprojects. Added Section 5.4 EAB. |
| 1.1 | 2026-03-01 | Added P8. Updated scope P0-P8. |
| 1.0 | 2026-03-01 | Initial version. |

---

*This document is maintained in GitHub at bcg-ops-governance/standards/ and fetched by all Claude Projects at runtime.*
