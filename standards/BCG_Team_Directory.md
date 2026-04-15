# BCG Corp — Team Directory & Roles

**Version:** 2.4
**Effective:** March 2026
**Last Updated:** 2026-04-15
**Scope:** All Claude Projects (P0–P11) and subprojects
**Owner:** Gregory Bernardo, President

---

## 1. Purpose

This document is the single source of truth for BCG Corp's team roster, roles, project assignments, and availability. Every Claude Project references this document (via GitHub) to correctly assign owners, reviewers, and contributors without maintaining stale copies in individual project knowledge bases.

**Source of truth:** GitHub (`bcg-ops-governance/standards/`). Per GOV-001, GitHub is the authoritative fetch source.

**Update this file when:** someone is hired, departs, changes role, changes project assignments, or a significant responsibility shift occurs (e.g., backup authority designation, subproject ownership change).

---

## 2. Team Roster

### Gregory Bernardo
- **Title:** President
- **Status:** Active — Full-time
- **Email:** gb@bcg-corp.com
- **Role:** Founder, final approver on all deliverables, primary strategic decision-maker. Currently absorbing BIM Lead responsibilities (temporary — pending I-40 benefits resolution and re-recruitment).
- **Tools:** Windsurf IDE, Claude Code, Claude.ai, Odoo (admin), Open WebUI, Xmind
- **Project Assignments:** P0 (owner), P0-001 (owner), P1 (owner), P3 (owner), P8 (owner), P9 (owner), P10 (owner), P11 (owner — restricted, shared with Jennifer Brezniak)
- **Active Initiatives:** I-24 (Licensing & Insurance Audit — self-execute), I-54 (Production Rework Module — architecture), I-64 (Candidate Pre-Hire OSINT)
- **Open Decisions:** D-01 (accounting data source), D-05 (bcg-ops-knowledge repo — Bob), D-06 (@cap chatbot — Jason)
- **Notes:** All outputs require Gregory's approval before flowing between projects. Backup bid/no-bid authority delegated to Stephanie Bernardo (triggers after 48hr non-response). April 12 calendar hold: CI/CD write mode upgrade review.

### Jennifer Brezniak
- **Title:** Senior HR Generalist
- **Status:** Active — Full-time
- **Email:** jlb@bcg-corp.com
- **Role:** HR operations, benefits administration, SOP library ownership, process documentation coordination. P2 and P6 project owner. Full access to P11 (Candidate OSINT & Pre-Hire Intelligence) — can trigger, review, and act on CIRs; carries findings directly into P6 hiring pipeline.
- **Tools:** Claude.ai, Odoo, Open WebUI
- **Project Assignments:** P2 (owner), P6 (owner), P11 (full access)
- **Active Initiatives:** I-40 (Benefits Package Restructuring), I-50 Phase 1 (Standard Folder & File Structure — owner/coordinator), I-57 (W-19 Chat Quality Evaluation SOP)
- **Notes:** Oscar Cucaita Sanchez onboarding coordination. I-50 Ph1: collect input from Cory, Bob, Rachel, Victor, Stephanie. P11 access does not extend to P10 — CIR custody filing remains Gregory-only. BCG-Wizard guide section received (2026-04-15) — integrate into How-to-Use-AI guide; correct Section X placeholder; apply Style Guide; submit for Gregory approval. Layer B guidance sheets from BCG_AI_Config_Architecture_v1.0.docx to integrate into How-to-Use-AI guide.

### Bob Brezniak
- **Title:** Manager, Information Technology
- **Status:** Active — Full-time
- **Email:** bb@bcg-corp.com
- **Role:** Infrastructure, network security, Defender for Endpoint, Azure Entra ID, firewall management, server administration, pfSense, GitHub org administration. Reviews all infrastructure changes before deployment.
- **Tools:** Windsurf IDE, Claude Code, Claude.ai, Odoo (admin), Open WebUI
- **Project Assignments:** P5 (lead), P5-001 (owner), P5-002 (owner), P9 (lead)
- **Active Initiatives:** I-43 (Outlook Forward Guard — Defender/ASR review), I-52 (CI/CD — API key + runner provisioning), I-53 (Odoo Automated Testing Framework — execution lead), I-61 (Cowork Security/Audit Assessment), I-68 (WireGuard VPN Phase 2), I-66 (IT Equipment Inventory — Phase 1)
- **Open Actions:** D-05 (create bcg-ops-knowledge private repo — est. 10 min, status unconfirmed as of 2026-04-15), I-69 AD group (add Jennifer/Rachel/Cory/Stephanie to Cloudflare_Dashboard_Users), Bob MCP config replication on workstation (~10 min), firewall ANY-to-ANY cleanup (needs target date). Claude Project configuration (BCG_AI_Config_Architecture_v1.0.docx Section 5 — approved 2026-04-15, 10-task checklist, dates need refresh from April 1 baseline).
- **Notes:** P5-002 Phase 1 complete (ClarkKent, WireGuard, Telegraf). Phase 2 active (Jason). GitLab mirror in progress (P9). Does not initiate AI tool evaluations but must approve anything touching BCG infrastructure. COO flag: cumulative load is high — prioritize at next sync.

### Victor Carrillo
- **Title:** Operations Assistant
- **Status:** Active — Full-time
- **Email:** vc@bcg-corp.com
- **Role:** Odoo 18 custom module development, platform configuration, P7 sole owner. Works from P7 directly — one chat per initiative with I-number in title.
- **Tools:** Windsurf IDE, Claude Code, Claude.ai, Odoo (admin), Open WebUI
- **Project Assignments:** P7 (owner — sole)
- **Active Initiatives:** I-52 (CI/CD CLAUDE.md — UNBLOCKED, due within 5 days), I-55 (Appointment Coverage — recommended first build), I-56 (Notification Center Phase A remediation), I-66 (IT Equipment Inventory — Odoo import build)
- **Military Service:** Veteran
- **Notes:** BCG is exclusively on-premises Odoo 18 — odoo.sh fully decommissioned. Odoo MCP proven with Windsurf. Coordinate with Gregory on API key access and Cloudflare Tunnel. D-06 @cap Odoo receiver to scope with Jason (D-05 must exist first).

### Jason Harris
- **Title:** VP, AI & Emerging Technology (Fractional W-2)
- **Status:** Active — Fractional W-2 (started 2026-04-01)
- **Email:** jh@bcg-corp.com
- **Role:** AI tool installation and configuration (MCP servers, monitoring stack, model infrastructure, CI/CD Phase 2). Follows Bob's IT security requirements for all deployments. Owns all Phase 4+ AI build work and P5-002 Phase 2.
- **Tools:** Windsurf IDE, Claude Code, Claude.ai, Odoo (admin), Open WebUI
- **Project Assignments:** P4 (owner), P4-001 (owner), P4-002 (contributor)
- **Active Initiatives:** I-65 (On-Prem AI Production Intelligence Suite — owner, active), P5-002 Phase 2 (Monitoring architecture — active), D-06 (@cap chatbot — scoped with Victor, pending D-05), I-48 (API-Driven Hub Script), I-71 (On-Prem AI/Revit Live Integration — architecture phase)
- **Gated Work (pending D-05):** D-06 (@cap chatbot routing), I-31 (Cross-Project Sync MCP Server)
- **Notes:** Week 2 as of 2026-04-15. Terrain brief (BCG_Jason_Harris_AI_Terrain_Brief_2026-03-26_v2.docx) and onboarding package delivered. Revised Employment Agreement filing status: confirm filed in OneDrive (old versions only in Teams Chat Files). W-20 Triage SOP backup operator (post-onboarding).

### Oscar Cucaita Sanchez
- **Title:** Project Manager
- **Status:** Active — Full-time (started approx. 2026-04-15)
- **Email:** oscar@bcg-corp.com
- **Role:** Project management support. Direct report to Gregory Bernardo.
- **Tools:** Claude.ai, Odoo, Open WebUI
- **Project Assignments:** — (TBD — pending initiative assignments from Gregory)
- **Notes:** Added to org chart (BCG_Master_Strategic_Plan.html v2.27 — matrix: Stephanie, Cory). Onboarding via verbal handoff. NTFS access: standard B: drive tier (no P6/P10/P11 restrictions). Initiative assignments pending Gregory direction.

### Cory Bialke
- **Title:** Senior Physical Security Engineer / Design Team Lead
- **Status:** Active — Full-time
- **Email:** cb@bcg-corp.com
- **Role:** Physical security engineering, design team leadership, QC oversight, technical scope review on RFPs.
- **Tools:** Claude.ai, Odoo, Open WebUI
- **Project Assignments:** P4-002 (contributor)
- **Active Initiatives:** W-01 (DD Sprint SOP), W-04 (QC/Peer Review), I-02 (Peer Review Workflows)
- **Other:** CI/CD Phase 2 pre-work — CLAUDE.md for PyRevit repo (bcg-ops-revit-tools). I-50 Ph1 input contributor (design/production files). W-25 SOP (Sanitized Dev Model) primary owner candidate.
- **Notes:** Copied on all RFP heads-up emails for technical scope awareness. I-44/I-45/I-49 IAH100 live test pending Gregory scheduling.

### Stephanie Bernardo
- **Title:** Senior Designer / Production Lead
- **Status:** Active — Full-time
- **Email:** srb@bcg-corp.com
- **Role:** Design production leadership, BIM Lead backup (limited Revit depth), PROD-series SOP ownership, backup bid/no-bid authority.
- **Tools:** Claude.ai, Odoo, Open WebUI
- **Project Assignments:** P4-002 (contributor)
- **Active Initiatives:** W-10 (Document Control/Transmittal), PROD-series SOPs (PROD-01 through PROD-09)
- **Backup Authority:** Designated backup bid/no-bid decision-maker (W-16 Step 6b). Triggers after 48hr Gregory non-response to RFP deadline. Added to RFP heads-up email distribution 2026-03-12.
- **Other:** I-50 Ph1 input contributor (production file lifecycle, archive/purge policy). CI/CD Phase 2 pre-work — CLAUDE.md for PyRevit repo. Confirm Civil DWG link on IAH100 before scheduling live test block (OQ-2).

### Rachel McGee
- **Title:** Administrative Manager
- **Status:** Active — Full-time
- **Email:** rm@bcg-corp.com
- **Role:** Office administration, operations management, document intake processing, billing support.
- **Tools:** Claude.ai, Odoo, Open WebUI
- **Project Assignments:** P8-001 (owner)
- **Active Initiatives:** I-58 (P8-001 Document Intake & Routing — go-live), W-08 (AIA Billing/Invoicing), W-14 (Sales Order Entry), I-24 (Insurance — co-owner with Gregory), I-66 (IT Equipment Inventory — Accounting Asset review approver), I-70 (Client Deliverable Schedule Tracker — daily ops owner)
- **Other:** I-50 Ph1 primary input contributor (admin/billing/proposals file structure). Contracts upload pending for I-24 Track A counsel call.

### Joshua Davis
- **Title:** Senior Physical Security Engineer
- **Status:** Active — Full-time
- **Email:** jd@bcg-corp.com
- **Role:** Physical security engineering and design.
- **Tools:** Claude.ai, Odoo, Open WebUI
- **Project Assignments:** —
- **Active Initiatives:** W-02 (CA Workflow SOP — owner)
- **Military Service:** Veteran

### Jefferey Bernardo
- **Title:** QC Engineer
- **Status:** Active — Full-time
- **Email:** jb@bcg-corp.com
- **Role:** Quality control review.
- **Tools:** Claude.ai, Odoo, Open WebUI
- **Project Assignments:** —
- **Active Initiatives:** I-02 (Peer Review Workflows — contributor)

### Nick Bernardo
- **Title:** Drafter
- **Status:** Active — Full-time
- **Email:** nick@bcg-corp.com
- **Role:** Drafting and design production.
- **Tools:** Claude.ai, Odoo, Open WebUI
- **Project Assignments:** —

### BIM Lead — VACANT
- **Status:** Position open — hiring on hold pending I-40 (Benefits Package Restructuring)
- **Role:** BIM/Revit tool development, production standards, model management
- **Notes:** Kathrine Allen declined offer due to lack of Tier 1 health insurance. BIM/Revit tool development temporarily owned by Gregory with Stephanie as backup. Re-recruitment blocked until I-40 resolves benefits competitive positioning. Triggers P6 benefits review.

---

## 3. Role-to-Project Matrix

Quick reference for primary project assignments. Dash (—) means no current assignment.

| Name | Primary Projects | Role |
|------|-----------------|------|
| Gregory | P0, P0-001, P1, P3, P8, P9, P10, P11 | Owner |
| Jennifer | P2, P6, P11 | Owner / Full Access |
| Bob | P5, P5-001, P5-002, P9 | Lead / Owner |
| Victor | P7 | Owner (sole) |
| Jason | P4, P4-001, P4-002 | Owner / Contributor |
| Oscar | — | PM (Gregory direct report) |
| Cory | P4-002 | Contributor |
| Stephanie | P4-002 | Contributor |
| Rachel | P8-001 | Owner |
| Joshua | — | W-02 owner |
| Jefferey | — | I-02 contributor |
| Nick | — | — |

**Capacity types:** Owner (approver + contributor), Lead (day-to-day execution authority), Contributor (produces work), Reviewer (reviews before deployment)

**Sync Liaisons:** Gregory (primary) / Bob (backup) for all 18 projects.

---

## 4. Status Definitions

| Status | Meaning |
|--------|--------|
| **Active — Full-time** | W-2 employee, continuous availability during business hours |
| **Active — Fractional** | W-2 with reduced/defined hours, specific engagement scope |
| **Pre-employment** | Engagement confirmed, start date set, not yet active |
| **Active — Part-time** | Employee with reduced hours or specific day schedule |
| **On Leave** | Temporarily unavailable (medical, personal, military) |
| **Pending** | Offer extended or engagement planned but not yet started |
| **Departed** | No longer with BCG. Retain entry with departure date for historical reference. |
| **VACANT** | Approved position with no current occupant |

---

## 5. Restricted Assignments

The following individual must NOT be assigned to any initiative, role, or project:

- **Bernard Lewis** — Active legal matter. Do not reference in work assignments, owner fields, or initiative tracking. Retained for awareness only.

---

## 6. Change Log

| Version | Date | What Changed |
|---------|------|--------------|
| 2.4 | 2026-04-15 | Jason Harris status updated: Pre-employment → Active Fractional W-2 (started 2026-04-01). Active initiatives updated to reflect week-2 state. Added Oscar Cucaita Sanchez (PM, full-time, Gregory direct report). Updated Role-to-Project Matrix (added Oscar, confirmed Jason row). Updated Jennifer notes (BCG-Wizard received, Layer B integration task). Updated Bob open actions (AI Config approved, checklist active). Headcount 11→12 FTE + 1 vacant. |
| 2.3 | 2026-04-01 | P11 access expanded: Gregory sole → Gregory & Jennifer Brezniak (full access). Updated Gregory project assignments (P11 now "restricted, shared with Jennifer Brezniak"). Updated Gregory I-64 (removed "sole operator"). Updated Jennifer role description, project assignments (added P11 full access), and notes (P10 custody exclusion). Updated Role-to-Project Matrix (Jennifer adds P11, role "Owner / Full Access"). |
| 2.2 | 2026-03-22 | Scope P0–P10 → P0–P11. Added P11 to Gregory's project assignments and active initiatives (I-64). Updated Role-to-Project Matrix Gregory row to include P11. Sync Liaisons 17 → 18. Removed stale odoo.sh decommission note from Bob (complete). Updated Bob open actions to current (D-05, I-69 AD group, MCP replication). Added Jason D-06 and EA filing note. Updated Victor active initiatives (I-56, I-66). Added Rachel I-66 approver role. |
| 2.1 | 2026-03-16 | Scope P0–P9 → P0–P10. Added P10 to Gregory's project assignments. Updated Role-to-Project Matrix (Gregory row includes P10). Sync Liaisons 16→17 projects. Added I-24 co-owner to Rachel McGee entry. |
| 2.0 | 2026-03-12 | Complete rewrite. Updated all titles, roles, and project assignments to reflect current ecosystem (16 projects). Added Jason start date (April 1). Added Stephanie as backup bid/no-bid authority. Updated Victor to P7 sole owner (P7 subprojects retired). Added Rachel as P8-001 owner. Added BIM Lead vacancy. Added Bernard Lewis restriction. Added active initiatives per person. Updated source of truth to GitHub (GOV-001). Simplified Role-to-Project Matrix. Removed stale "P0–P7" scope. |
| 1.0 | 2026-03-01 | Initial version. 11 team members (10 full-time, 1 fractional). Core project assignments defined. |

---

*This document is maintained in GitHub at bcg-ops-governance/standards/ and fetched by all Claude Projects at runtime. Update this file when team composition or assignments change. Do not maintain separate copies in individual project knowledge bases.*
