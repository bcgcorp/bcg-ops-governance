# BCG CORP — ECOSYSTEM ORIENTATION & EXECUTIVE SUMMARY
**Generated:** 2026-03-22 | **Catalog:** v2.4 | **Registry:** v2.3
**Scope:** All 18 active Claude projects
**Status:** Pre-DCD sync — 5 new initiatives registered, D-05/D-06 assigned, Jason T-10 days

---

## EXECUTIVE SUMMARY

BCG Corp is a 9-person physical security consulting firm operating an 18-project Claude ecosystem for strategic planning, AI deployment, ERP management, operational documentation, legal/compliance governance, and pre-hire intelligence. As of 2026-03-22, 67 active initiatives are tracked across 11 workstreams. Five new I-numbers were registered this week (I-65 through I-69). Jason Harris onboards in 10 days.

**Three headline facts:**
- **Jason Harris starts April 1 (10 days)** — unlocks 8 gated initiatives across P4, P5-002, and P7. D-05 and D-06 must be resolved before he arrives.
- **5 new initiatives registered this week** — I-65 (On-Prem AI Suite), I-66 (IT Equipment Inventory), I-67 (Project Info Writer), I-68 (WireGuard VPN), I-69 (Dashboard/Cloudflare Pages)
- **Gregory remains the bottleneck on 14+ initiatives** — highest-leverage systemic risk in the ecosystem

**Key changes since 2026-03-17:**
- Catalog bumped v2.1 → v2.4 (5 new initiatives, I-30 formally retired)
- Governance Doc Registry bumped v2.0 → v2.3 (GOV-017 P4-002 Technical Architecture Standards added; Tools Inventory v1.2, GOV-017 v1.1)
- I-65 (On-Prem AI Production Intelligence Suite) registered — Jason Harris owner, gates April 1
- I-66 (IT Equipment Inventory & Asset Register) registered — Bob + Victor, 3-phase, Odoo Maintenance
- I-67 (Project Info Writer, B-47) registered — on hold, title block shared parameter blocker
- I-68 (WireGuard Site-to-Site VPN) registered — Bob, Phase 1 complete 2026-03-09
- I-69 (BCG Master Strategic Plan Dashboard — Cloudflare Pages) registered — Complete, dashboard.bcg-corp.com live
- I-30 formally retired in catalog (email-based cross-project sync cancelled; I-31 direct Odoo-MCP only)
- D-05 assigned: Bob — create bcg-ops-knowledge private GitHub repo (Open)
- D-06 assigned: Jason — build @cap chatbot routing to Odoo bcg.knowledge.capture queue (Open, gated D-05)
- CIP (Client Intelligence Profiles) + DDL (Design Doctrine Library) knowledge capture framework designed — feeds I-65 RAG corpus
- Odoo dev request lifecycle documented (BCG_P7_Dev_Request_Lifecycle.docx) — P7
- BCG Ecosystem Architecture Analysis produced (BCG_Ecosystem_Architecture_Analysis.docx) — P0 reference
- Katherine Allen fractional engagement in flight — gated on P10 IP Risk & Engagement Framework assessment
- P4-002 button count: 46 deployed (Tools Inventory v1.2), 47-button backlog (B-01–B-47), next B-48
- HARD RULE confirmed 2026-03-22: Never use web_fetch on raw.githubusercontent.com — always use github-write:get_file_contents (proven stale 2026-03-22: served v1.4 when v2.2 was live)

---

## ECOSYSTEM STRUCTURE

| Layer | Count | Notes |
|-------|-------|-------|
| Active Claude projects | 18 | P0, P0-001, P1–P11, P4-001, P4-002, P5-001, P5-002, P8-001 |
| Active initiatives | 67 | I-01–I-69, minus I-20, I-30, I-32 |
| Active workstreams | 11 | WS-01–WS-11 |
| Active subprojects | 6 | P0-001, P4-001, P4-002, P5-001, P5-002, P8-001 |
| Retired subprojects | 4 | P7-001–P7-004 (consolidated into P7, 2026-03-12) |
| Next I-number | I-70 | Always fetch catalog before assigning |
| Next W-number | W-24 | W-23 assigned (Hiring Nexus SOP, P6/Jennifer) |
| Next B-number | B-48 | P4-002 button backlog |

---

## PROJECT STATUS — ALL 18

### P0 — Master Strategic Plan ✅
**Owner:** Gregory | **Health:** Active
Ecosystem status refreshed 2026-03-22. Architecture Analysis doc produced. Dashboard v2.19+ live on Cloudflare Pages (dashboard.bcg-corp.com). I-69 complete. D-05/D-06 assigned this session.

### P0-001 — Ecosystem Triage & Routing Protocol ✅
**Owner:** Gregory | **Health:** Active
W-20 Triage SOP live. Next I-slot: I-70. MANDATORY PRE-ASSIGNMENT RULE: fetch catalog before assigning.

### P1 — Financial Modeling & Pricing 🔴
**Owner:** Gregory | **Health:** Stalled
Zero active initiatives. All workstreams blocked on D-01 (accounting data source — open 40+ days). No movement until Gregory resolves D-01.

### P2 — SOP & Workflow Library 🟡
**Owner:** Jennifer Brezniak | **Health:** Active — backlog building
BCG-Wizard guide handoff pending (Gregory to paste into P2). Wave 1 SOP Lookup Pilot gates on 5 approved SOPs. W-21 Document Storage SOP blocked on Gregory policy decisions (3 competing destinations).

### P3 — Competitive Intel & BD 🟡
**Owner:** Gregory | **Health:** Planned — no active drafting
9 initiatives, all Planned. All new service lines gated on I-24 licensing audit.

### P4 — AI Infrastructure & Deployment ✅
**Owner:** Jason Harris (April 1) / Gregory (interim) | **Health:** Active
12 initiatives. I-65 (On-Prem AI Suite) registered — Jason owns on arrival. I-52 CI/CD active. I-60 Cowork Ph2-3 gated Jason. CIP/DDL framework designed this week — feeds I-65 Phase 1 RAG corpus build.

### P4-001 — MCP Evaluation & Selection ✅
**Owner:** Gregory / Jason (April 1) | **Health:** Active
Odoo MCP proven with Windsurf. MS365 MCP selected. Grafana + Prometheus MCPs selected, blocked on P5-002 Ph2 stack deployment.

### P4-002 — Revit & BIM Automation ✅
**Owner:** Gregory | **Health:** Active — largest backlog
46 buttons deployed (Tools Inventory v1.2). 47-button backlog (B-01–B-47). I-67 (B-47 Project Info Writer) on hold — title block shared parameter blocker. Live test block for I-44/I-45/I-49 on IAH100 still pending. GitLab: `alexandria.bcg-corp.com/revit/bcg-ops-revit-tools`.

### P5 — IT Security / QOS ✅
**Owner:** Bob Brezniak | **Health:** Active
I-68 (WireGuard VPN) registered — Phase 1 complete 2026-03-09. I-69 (Dashboard) complete. I-43 Outlook Forward Guard ASR review pending (Bob notification needed — open carry-forward). I-61 Cowork audit gates Cowork work.

### P5-001 — Network Infrastructure Assessment 🟦
**Owner:** Bob Brezniak | **Health:** Planned — not started
I-38 defined. Three-phase assessment. Gated on Bob capacity.

### P5-002 — Monitoring & Observability Infrastructure ✅
**Owner:** Bob (Ph1) / Jason (Ph2) | **Health:** Phase 1 Complete
ClarkKent operational. Telegraf on both pfSense nodes. WireGuard to Harris Lab validated (I-68 Ph1). Phase 2 gated on Jason April 1.

### P6 — HR & People 🟡
**Owner:** Jennifer Brezniak | **Health:** Active
HR/People only (Legal/compliance in P10). I-40 Benefits Restructuring is keystone — BIM Lead vacancy gated here. I-63 ADP Recruiting Transition active. Katherine Allen fractional offer in flight — pending P10 IP assessment. W-23 gated on I-24.

### P7 — Odoo Platform & ERP 🟡
**Owner:** Victor Carrillo | **Health:** Active — large queue
12 initiatives. I-66 (IT Equipment Inventory, Ph1: Claude Vision → CSV → Odoo import) added. Victor: I-56 Notification Center Ph A remediation. Odoo dev request lifecycle documented (BCG_P7_Dev_Request_Lifecycle.docx). D-06 queued for Jason April 1 (@cap chatbot, depends on D-05). I-23 on hold (D-01 blocks).

### P8 — Proposals & RFP Operations 🟡
**Owner:** Gregory | **Health:** Active — KB needs population
P8-001 processing documents. P8 needs: rate card, 3–5 historical proposals, W-17 RFP Intake SOP.

### P8-001 — Document Intake & Routing ✅
**Owner:** Rachel McGee | **Health:** Active — operational
Instructions v1.2 approved 2026-03-15. W-16 rules active ($15K auto no-bid, Stephanie 48hr backup authority).

### P9 — Business Continuity & Resilience 🟦
**Owner:** Gregory | **Health:** Phase 1 in progress
I-41 Risk Register (Weeks 1–3) is current deliverable. 18-project ecosystem and 47-button PyRevit backlog included in dependency mapping.

### P10 — Legal, Compliance & Risk ✅
**Owner:** Gregory (only) | **Health:** Active
Owns: I-24 (Licensing & Insurance Audit — GATING, 5 counsel questions pending), CAP-01, Bernard Lewis matter, State Nexus Reference Card, contract review. IP Risk & Engagement Framework assessment in progress (Katherine Allen fractional engagement decision pending). Gates 6 downstream initiatives.

### P11 — Candidate OSINT & Pre-Hire Intelligence ✅
**Owner:** Gregory (only) | **Health:** Active — RESTRICTED
Activated 2026-03-17. I-64 registered. Produces CIRs at conditional offer stage. Routes to P10 (custody) and P6 (go/no-go). Does NOT route to P0.

---

## TEAM LOAD SNAPSHOT

| Person | Load | Immediate Focus |
|--------|------|------------------|
| Gregory | 🔴 Bottleneck | D-01; I-24; W-21 policy; PIDS ES rewrite; live test block; BCG-Wizard handoff; Katherine decision (P10 assessment); I-69 AD group sign-off |
| Bob | 🟠 Heavy | D-05 (bcg-ops-knowledge repo, ~10 min); I-68 Ph2 (WireGuard DNS + hardening); I-43 ASR review; I-69 AD group adds (Jennifer/Rachel/Cory/Stephanie); Bob MCP replication |
| Victor | 🟠 Growing | I-56 Ph A remediation; I-66 Ph1 (CSV import + Odoo config); D-06 Odoo receiver (April 1) |
| Jennifer | 🟡 Moderate | I-63 ADP transition; I-50 Ph1; I-40 benefits; Jason onboarding coordination |
| Rachel | 🟢 Clear | P8-001 operations; I-24 Track B (insurance); I-66 Accounting Asset review queue |
| Cory | 🟢 Clear | Live test block (unscheduled — IAH100) |
| Stephanie | 🟢 Clear | Backup bid/no-bid active; PROD-series when ready |
| Joshua | 🟢 Clear | W-02 when prioritized |
| Jeff | 🟢 Clear | I-02 QC peer review |
| Jason | 🟦 Pre-employment | Starts April 1 (T-10) — I-65, I-48, I-60 Ph2-3, I-52 Ph2, I-51, I-47, D-06, P5-002 Ph2 unlock |

---

## OPEN DECISIONS

| ID | Decision | Blocks | Age | Owner |
|----|----------|--------|-----|-------|
| 🔴 D-01 | Accounting data source | I-23, all P1 models, WS-02/03/06 | 40+ days | Gregory |
| 🟡 D-05 | Create bcg-ops-knowledge private GitHub repo | D-06, CIP/DDL storage, Jason onboarding | Assigned 2026-03-22 | Bob |
| 🟡 D-06 | @cap chatbot routing to Odoo bcg.knowledge.capture queue | I-31 MCP, knowledge capture ops | Unblocks April 1, gated D-05 | Jason |
| 🟡 I-29 | 3 Odoo Knowledge Repository decisions | I-29 start | 14+ days | Gregory |
| 🟡 W-21 | Document storage policy (3 competing destinations) | W-21 SOP draft | 14+ days | Gregory |

**Closed since last status (2026-03-17):**
- D-02: I-24 ownership (Gregory + Rachel) — CLOSED 2026-03-15
- D-04: Jason Harris start date (April 1) — CLOSED

---

## GREGORY BOTTLENECK — ITEMS ONLY GREGORY CAN UNBLOCK

1. **D-01** — Accounting data source (blocks entire P1 + 3 workstreams, 40+ days)
2. **I-24** — Licensing & Insurance Audit execution (gates 6 initiatives)
3. **W-21** — Document storage policy decisions (3 competing destinations)
4. **PIDS ES rewrite** — Windsurf session needed (SCHEMA_GUIDS.md prerequisite ready)
5. **Katherine fractional offer** — P10 IP assessment needed first; decision pending
6. **I-29** — 3 open decisions on Odoo Knowledge Repository
7. **BCG-Wizard guide** — Paste handoff prompt into P2, confirm Jen received it (2 min)
8. **Live test block** — Schedule 30 min on IAH100 (I-44/I-45/I-49)
9. **I-69 AD group** — Confirm Bob has added Jennifer/Rachel/Cory/Stephanie before distributing dashboard URL

---

## JASON ONBOARDING READINESS (T-10 DAYS)

| Item | Status | Owner |
|------|--------|-------|
| D-05: bcg-ops-knowledge repo created | 🔴 Open | Bob |
| D-06: Odoo @cap receiver scoped | 🟡 Queued April 1 | Jason + Victor |
| P4 handoff prompt (I-65 scope) | ✅ Produced | Gregory |
| I-65 open decisions (3) | 🟡 Pending | Gregory |
| CIP/DDL framework designed | ✅ Complete | Gregory |
| Employment Agreement filed | 🔴 Not filed (old versions only in Teams Chat Files) | Gregory |
| Benefits PDF | 🔴 Missing from OneDrive | Gregory/Jennifer |
| I-43 ASR review notification | 🟡 Pending Bob ping | Gregory → Bob |

---

## 30/60/90-DAY HORIZON

**30 days (by April 21)**
- April 1: Jason starts — P5-002 Ph2, I-52 Ph2, I-60 Ph2-3, I-65, I-48 unlock
- D-05 resolved: bcg-ops-knowledge repo live before April 1
- D-06 scope locked: @cap Odoo receiver with Victor
- April 12: CI/CD write mode review (Victor + Bob → Gregory)
- W-21 SOP draft complete (pending Gregory policy decisions)
- PIDS ES rewrite + IAH100 live test scheduled
- I-68 Ph2: WireGuard DNS integration + PSK hardening
- P10 IP Risk assessment delivered → Katherine fractional decision

**60 days (by May 21)**
- I-50 Ph1 folder/file standard delivered (Jennifer)
- P5-002 Ph2 first components deployed (Jason)
- I-55 Appointment Coverage module complete (Victor)
- I-40 Benefits analysis delivered — gates BIM Lead re-hire
- I-66 Ph1 complete: equipment inventory in Odoo Maintenance (Bob + Victor)

**90 days (by June 21)**
- I-24 Licensing Audit complete — 6 initiatives unlock
- B&F pricing model ready (P1 + P3 + P8 convergence)
- P5-002 Phase 2 Grafana/Prometheus operational
- All Beta pyRevit buttons validated on IAH100
- Wave 1 SOP Lookup Pilot (Q2 2026, requires 5 approved SOPs from P2)
- I-65 Phase 1 deliverables: RAG archive + meeting transcription live on DGX Spark

---

## CARRY-FORWARD ITEMS (unresolved from prior sessions)

1. **EAB v1.5 propagation** — 16 instruction files still at v1.4. Batch update pending.
2. **Gov Registry v2.3 — Catalog version listed as v2.1** — Registry Section 3.6 still shows catalog v2.1/I-65 next. Needs bump to v2.4/I-70 next.
3. **Style Guide v1.3 + Project Ecosystem & Handoffs v1.4 updates** — still carry-forward from 2026-03-12 governance audit (now at v1.5 but confirm content current).
4. **Infrastructure Inventory v1.2** — add: Highland Village branch, NUC9 cluster detail, BIM360+ACC both in use.
5. **Bob sync agenda items** — BB-8 IP, ClarkKent specs, RevitPrint specs, QNAP detail, VM host mapping, Veeam detail, Revit/AutoCAD/Bluebeam versions + licenses.
6. **bcg-ops-governance repo → private** — flag: re-auth Cloudflare Pages (new OAuth scope) after repo goes private.
7. **18-file instruction audit** — EAB v1.5 propagation to 16 files.
8. **PIDS ES rewrite prerequisite** — SCHEMA_GUIDS.md creation + shared parameters file path decision needed before Windsurf session.

---

## GOVERNANCE HEALTH

| Check | Status |
|-------|--------|
| Governance Doc Registry | ✅ v2.3 |
| Style Guide | ✅ v1.5 |
| Project Ecosystem & Handoffs | ✅ v1.5 |
| Initiative Catalog | ✅ v2.4 (67 active, next I-70) |
| EAB | 🟡 v1.5 — propagation to 16 files pending |
| Tools Inventory | ✅ v1.2 (46 buttons / 10 panels) |
| P4-002 Technical Architecture | ✅ GOV-017 v1.1 |
| All 18 project instructions on GitHub | 🟡 EAB v1.5 propagation pending |
| Next I-slot | ✅ I-70 |
| Next W-slot | ✅ W-24 |
| Next B-slot | ✅ B-48 |
| odoo.sh references | ✅ Purged |
| pyRevit repo | ✅ GitLab (alexandria.bcg-corp.com) |
| Raw GitHub fetch rule | ✅ Confirmed — always use github-write MCP, never web_fetch raw URLs |
| M365 security lockdown | ✅ Confirmed 2026-03-14 |
| Dashboard | ✅ Live — dashboard.bcg-corp.com (I-69 Complete) |

---

*BCG Corp — CONFIDENTIAL INTERNAL USE ONLY*
*Generated by P0 — Master Strategic Plan | 2026-03-22*
*Supersedes BCG_Ecosystem_Status_2026-03-17.md*
*Upload to P0 project knowledge to activate as runtime reference*
