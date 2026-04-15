# BCG CORP — ECOSYSTEM ORIENTATION & EXECUTIVE SUMMARY
**Generated:** 2026-04-15 | **Catalog:** v2.6 | **Registry:** v2.7+
**Scope:** All 18 active Claude projects
**Status:** Jason Harris week 2 — D-06 live-eligible; 10 Gregory-owned blockers; Oscar Cucaita Sanchez org chart added, ecosystem reconciliation open

---

## EXECUTIVE SUMMARY

BCG Corp is a 9-person physical security consulting firm operating an 18-project Claude ecosystem for strategic planning, AI deployment, ERP management, operational documentation, legal/compliance governance, and pre-hire intelligence. As of 2026-04-15, 69 active initiatives are tracked across 11 workstreams. Jason Harris (VP AI & Emerging Technology) completed his second week. Two new initiatives were registered since last status (I-70, I-71). Oscar Cucaita Sanchez has been added to the org chart as PM; ecosystem reconciliation is open.

**Three headline facts:**
- **Jason Harris is 2 weeks in** — D-06 is now live-eligible pending D-05 (Bob's repo). I-65, P5-002 Ph2, I-71, and knowledge capture infrastructure all unblocked.
- **69 active initiatives, catalog at v2.6** — I-70 (Client Deliverable Schedule Tracker, operational) and I-71 (On-Prem AI/Revit Integration, Planned Q3 2026) registered since March 22.
- **Gregory remains the bottleneck on 10+ items** — D-01 (accounting) now 55+ days open; AI Config Architecture review flag 3+ weeks stalled; live test block, BCG-Wizard handoff, and Oscar reconciliation all open.

**Key changes since 2026-03-22:**
- I-70 registered: Client Deliverable Schedule Tracker (Rachel daily ops / Gregory oversight, P8-001). 82 projects across 24 campuses/14 sites. Primes confirmed: Arcadis (49), HKS (12), Gensler (11), Corgan (3), S+R (3), Atlantic AE (1).
- I-71 registered: On-Premise AI/Revit Live Integration (Jason Harris, P4-002, Planned, Q3 2026). Hard architectural constraint: zero cloud AI on client models. Hard deps: I-65 Ph1, I-22, W-25, Jason onboarded.
- W-24 claimed: Schedule Tracking & Sync SOP (I-70 companion). Next W-slot: W-25 (Sanitized Dev Model SOP candidate, Cory/Stephanie, routes P2).
- Catalog bumped v2.4 → v2.6. Next I-slot: I-72.
- Governance Doc Registry at v2.7+. Ecosystem sync completed 2026-03-23 — all 18 instruction files audited and corrected. Handoff Validation Protocol committed to BCG_Project_Ecosystem_and_Handoffs.md v1.7.
- W-21 Document Storage SOP fully unblocked 2026-03-25 (all 3 policy decisions resolved). Jennifer can draft. AI outputs → `B:\AI Accessible\Outputs\{P-CODE}\`. RFP/CO/PO → B: drive.
- BCG-Wizard guide drafted and stored OneDrive Corp/AI/Standards/. P2 handoff prompt generated — Gregory to paste into P2 (pending).
- BCG_AI_Config_Architecture_v1.0.docx produced (AI Staff Enablement & Guardrail Program) — status UNDER REVIEW. I-number needs GitHub catalog confirmation (memory conflict: pre-registration reference to I-70 conflicts with Client Deliverable Tracker also registered I-70 on 2026-03-24). Fetch live catalog to resolve before next sprint.
- Dashboard updated to v2.27 — org chart added to Team Load tab; Oscar Cucaita Sanchez added as PM reporting to Gregory. DCD Connect Live NYC attended (Gregory, Stephanie, Jason, March 23–24).
- Jason Harris Terrain Brief produced and corrected (BCG_Jason_Harris_AI_Terrain_Brief_2026-03-26_v2.docx — corrected I-70→I-71). Onboarding package delivered 2026-04-15.
- Scalar LM deep-dive research complete: vLLM (production inference) + Unsloth Studio (fine-tuning, RTX 5090) recommended; ScalarLM deferred to 2027. Routes to I-65 (Jason). P4.
- Windsurf global_rules.md drafted — BCG-wide baseline rules file for all Windsurf workstations. UNDER REVIEW. Routes to P4 for governance, Bob for deployment.
- Handoff Validation Protocol (Section 3.5 of BCG_Project_Ecosystem_and_Handoffs.md v1.7) committed 2026-03-23 — three mandatory pre-generation questions + [ORIGIN:] audit line for automation pipelines.
- HARD RULE re-confirmed: Never use `web_fetch` on `raw.githubusercontent.com`. Always use `github-write:get_file_contents` (proven failure 2026-03-22).

---

## ECOSYSTEM STRUCTURE

| Layer | Count | Notes |
|-------|-------|-------|
| Active Claude projects | 18 | P0, P0-001, P1–P11, P4-001, P4-002, P5-001, P5-002, P8-001 |
| Active initiatives | 69 | I-01–I-71, minus I-20, I-30, I-32 |
| Active workstreams | 11 | WS-01–WS-11 |
| Active subprojects | 6 | P0-001, P4-001, P4-002, P5-001, P5-002, P8-001 |
| Retired subprojects | 4 | P7-001–P7-004 (consolidated into P7, 2026-03-12) |
| Next I-number | I-72 | Always fetch catalog before assigning |
| Next W-number | W-25 | W-24 claimed (I-70 Schedule Tracking SOP) |
| Next B-number | B-48 | P4-002 button backlog |

---

## PROJECT STATUS — ALL 18

### P0 — Master Strategic Plan ✅
**Owner:** Gregory | **Health:** Active
Dashboard v2.27 live on Cloudflare Pages (dashboard.bcg-corp.com). Org chart added to Team Load tab. Oscar Cucaita Sanchez in org chart as PM; ecosystem reconciliation open (P6, Team Directory, initiative assignments). DCD NYC complete. Ecosystem status doc last committed 2026-03-22 — this document supersedes.

### P0-001 — Ecosystem Triage & Routing Protocol ✅
**Owner:** Gregory | **Health:** Active
W-20 Triage SOP live. Handoff Validation Protocol added to Handoffs v1.7 (2026-03-23). Next I-slot: I-72. MANDATORY: fetch catalog before assigning.

### P1 — Financial Modeling & Pricing 🔴
**Owner:** Gregory | **Health:** Stalled
Zero active initiatives. All workstreams blocked on D-01 (accounting data source — open 55+ days). No movement until Gregory resolves D-01.

### P2 — SOP & Workflow Library 🟡
**Owner:** Jennifer Brezniak | **Health:** Active — ready to accelerate
W-21 Document Storage SOP fully unblocked — Jennifer can begin drafting. BCG-Wizard guide drafted; Gregory paste into P2 still pending (2-min task). Wave 1 SOP Lookup Pilot (Q2 2026) gates on 5 approved SOPs — clock hasn't started. W-25 (Sanitized Dev Model SOP) routes to P2 once Gregory approves concept.

### P3 — Competitive Intel & BD 🟡
**Owner:** Gregory | **Health:** Planned — no active drafting
9 initiatives, all Planned. New service lines gated on I-24 licensing audit completion.

### P4 — AI Infrastructure & Deployment ✅
**Owner:** Jason Harris | **Health:** Active — Jason engaged
12 initiatives. Jason owns I-65 (On-Prem AI Suite), I-47, I-48, I-25, I-22, I-31, I-71, P5-002 Ph2, D-06. Scalar LM research complete → vLLM + Unsloth recommendation delivered for I-65 ingestion. Windsurf global_rules.md drafted (BCG-wide, UNDER REVIEW, routes P4 governance / Bob deployment). I-52 CI/CD review scheduled April 12 (Victor + Bob → Gregory).

### P4-001 — MCP Evaluation & Selection ✅
**Owner:** Gregory / Jason | **Health:** Active
Odoo MCP proven with Windsurf. MS365 MCP selected. Grafana + Prometheus MCPs selected, blocked on P5-002 Ph2 stack deployment.

### P4-002 — Revit & BIM Automation ✅
**Owner:** Gregory (BIM Lead vacancy) | **Health:** Active — largest backlog
46 buttons deployed (Tools Inventory v1.2). 47-button backlog (B-01–B-47). I-71 registered — Jason owner, Q3 2026, zero cloud AI on client models. I-67 (B-47 Project Info Writer) on hold — title block shared parameter blocker; coordinate with I-71 (shared parameter overlap risk). Live test block for I-44/I-45/I-49 on IAH100 still pending — confirm Civil DWG link with Stephanie (OQ-2) before scheduling. Kathrine Allen fractional engagement: two paths (A: use-case + acceptance testing; B: vibe-code pyRevit in Windsurf). IP risk structural concern raised — any external BIM resource exposure risks proprietary methodology. Jason identified as future owner of long-term tool protection architecture. GitLab: `alexandria.bcg-corp.com/revit/bcg-ops-revit-tools`.

### P5 — IT Security / QOS ✅
**Owner:** Bob Brezniak | **Health:** Active
I-68 (WireGuard VPN) Ph1 complete (2026-03-09). I-69 (Dashboard/Cloudflare) complete. I-43 Outlook Forward Guard ASR review pending (Bob). D-05 (bcg-ops-knowledge repo) assigned 2026-03-22 — status unconfirmed; ~10-min task. Windsurf global_rules.md deployment: Bob owns when Gregory clears review. Claude Desktop security review: open action → route findings to P5/P10.

### P5-001 — Network Infrastructure Assessment 🟦
**Owner:** Bob Brezniak | **Health:** Planned — not started
I-38 defined. Three-phase assessment. Gated on Bob capacity.

### P5-002 — Monitoring & Observability Infrastructure ✅
**Owner:** Jason Harris (Ph2) / Bob (Ph1 complete) | **Health:** Phase 2 active
ClarkKent operational. Telegraf on both pfSense nodes. WireGuard to Harris Lab validated (I-68 Ph1). Jason owns Ph2 — Grafana/Prometheus stack deployment. No Ph2 output confirmed yet; Jason 2 weeks in.

### P6 — HR & People 🟡
**Owner:** Jennifer Brezniak | **Health:** Active — reconciliation needed
Oscar Cucaita Sanchez added to dashboard org chart as PM reporting to Gregory — not yet in P6 roster, Team Directory, initiative assignments, or NTFS access list. Resolution needed. I-40 Benefits Restructuring keystone — BIM Lead vacancy gated. I-63 ADP Recruiting Transition active. Katherine Allen fractional offer pending P10 IP assessment. W-23 gated on I-24. Benefits package competitive positioning review triggered by Kathrine Allen declining full-time offer (Tier 1 health insurance gap).

### P7 — Odoo Platform & ERP 🟡
**Owner:** Victor Carrillo | **Health:** Active — queue growing
12 initiatives. I-56 Notification Center Ph A remediation active. I-66 (IT Equipment Inventory) Ph1 (Claude Vision → CSV → Odoo import) in progress. D-06 receiver scoped for Victor — now live-eligible pending D-05. I-23 on hold (D-01 blocks). Odoo dev request lifecycle documented (BCG_P7_Dev_Request_Lifecycle.docx). Environments: R2-D2 (prod), C-3PO (dev), BB-8 (staging). odoo.sh fully decommissioned.

### P8 — Proposals & RFP Operations 🟡
**Owner:** Gregory | **Health:** Active — KB needs population
P8-001 operational. P8 still needs: rate card, 3–5 historical proposals, W-17 RFP Intake SOP.

### P8-001 — Document Intake & Routing ✅
**Owner:** Rachel McGee | **Health:** Active — operational + I-70
Instructions v1.2 approved 2026-03-15. W-16 rules active ($15K auto no-bid, Stephanie 48hr backup authority). I-70 (Client Deliverable Schedule Tracker) operational — 82 projects registered, Rachel daily ops owner.

### P9 — Business Continuity & Resilience 🟦
**Owner:** Gregory | **Health:** Phase 1 in progress
I-41 Risk Register (Weeks 1–3) current deliverable. 18-project ecosystem and P4-002 backlog included in dependency mapping.

### P10 — Legal, Compliance & Risk ✅
**Owner:** Gregory (only) | **Health:** Active
I-24 (Licensing & Insurance Audit) active — Rachel owns insurance track (broker outreach, underwriter evidence package), Gregory owns licensing track (5 counsel questions pending contracts upload). AI exclusion risk flagged in E&O/professional liability (Verisk new generative AI exclusion forms, Q1–Q2 renewals). Katherine Allen fractional engagement: P10 IP Risk & Engagement Framework assessment in progress — gates fractional offer decision. Bernard Lewis: active legal matter — never assign to any initiative or role. Claude Desktop security review findings route here (+ P5).

### P11 — Candidate OSINT & Pre-Hire Intelligence ✅
**Owner:** Gregory (only) | **Health:** Active — RESTRICTED
I-64 registered. Produces CIRs at conditional offer stage. Routes to P10 (custody) and P6 (go/no-go). Does NOT route to P0.

---

## TEAM LOAD SNAPSHOT

| Person | Load | Immediate Focus |
|--------|------|-----------------|
| Gregory | 🔴 Bottleneck | D-01; D-05 confirm; AI Config review; BCG-Wizard→P2 paste; I-24 counsel call; live test block IAH100; Katherine decision; Oscar reconciliation; I-29 Odoo decisions |
| Jason | 🟠 Ramping (Wk 2) | D-06 (gated D-05); I-65 scope; P5-002 Ph2 stack; vLLM/Unsloth architecture ingestion |
| Bob | 🟠 Heavy | D-05 repo (~10 min — unconfirmed); I-68 Ph2 (WireGuard DNS + hardening); I-43 ASR review; global_rules.md deployment (pending Gregory review clear) |
| Victor | 🟠 Growing | I-56 Ph A remediation; I-66 Ph1 (CSV import + Odoo config); D-06 Odoo receiver (live-eligible pending D-05) |
| Jennifer | 🟡 Moderate | W-21 SOP draft (now unblocked); I-63 ADP; BCG-Wizard integration (pending Gregory P2 paste); Jason onboarding coordination; Oscar onboarding TBD |
| Rachel | 🟢 Clear | I-70 daily ops; I-24 Track B (insurance/broker outreach); contracts upload for Track A |
| Cory | 🟢 Clear | IAH100 live test (unscheduled — Gregory action); W-25 SOP candidate (not yet scoped) |
| Stephanie | 🟢 Clear | Backup bid/no-bid active; PROD-series when ready; confirm Civil DWG link IAH100 (OQ-2) |
| Joshua | 🟢 Clear | W-02 when prioritized |
| Jeff | 🟢 Clear | I-02 QC peer review |
| Nick | 🟢 Clear | Production support |
| Oscar | ❓ Unknown | In dashboard org chart as PM / Gregory DR. No ecosystem integration confirmed. |

---

## OPEN DECISIONS

| ID | Decision | Blocks | Age | Owner |
|----|----------|--------|-----|-------|
| 🔴 D-01 | Accounting data source | All P1 models, WS-02/03/06, I-23 | 55+ days | Gregory |
| ⚠️ D-05 | Create bcg-ops-knowledge private GitHub repo | D-06, @cap routing, CIP/DDL storage | Assigned 2026-03-22, status unconfirmed | Bob |
| 🟡 D-06 | @cap chatbot routing → Odoo bcg.knowledge.capture queue | I-31 MCP, knowledge capture ops | Live-eligible now; gated D-05 | Jason + Victor |
| 🟡 I-29 | 3 Odoo Knowledge Repository decisions | I-29 start | 3+ weeks | Gregory |
| 🟡 AI Config I-number | Confirm I-number for BCG_AI_Config_Architecture_v1.0.docx | Catalog integrity | ~3 weeks | Gregory (fetch catalog) |
| 🟡 Oscar reconciliation | Formal hire vs. contractor; reporting; NTFS; initiative assignments | P6, Team Directory, onboarding | New | Gregory → P6/Jennifer |
| 🟡 Katherine fractional offer | Path A vs. B; IP risk framework needed first | P4-002 BIM tool development | Open | Gregory (P10 assessment first) |

**Closed since last status (2026-03-22):**
- D-04: Jason Harris start date (April 1) — CLOSED ✅
- W-21 policy: All 3 document storage decisions resolved 2026-03-25 — CLOSED ✅

---

## GREGORY BOTTLENECK — ITEMS ONLY GREGORY CAN UNBLOCK

1. **D-01** — Accounting data source (blocks entire P1 + 3 workstreams, 55+ days)
2. **AI Config Architecture review** — Clear flag so Bob/Jennifer can execute (3+ weeks stalled on complete document)
3. **BCG-Wizard guide** — Paste handoff prompt into P2, confirm Jen received it (2 min; Wave 1 SOP pilot gates on this)
4. **Live test block** — Schedule 30 min on IAH100: I-44 (FOV Camera, lowest risk first), I-45/B-24 (Site Grid), I-49 (Linked CAD Layer Manager). Confirm Civil DWG link with Stephanie first (OQ-2).
5. **Oscar Cucaita Sanchez** — Determine ecosystem status: hire/contractor, reporting structure, NTFS tier, initiative assignments. Route to P6/Jennifer.
6. **I-24 counsel call** — 5 questions scoped; pending contracts upload (Rachel running parallel insurance track)
7. **I-29** — 3 open decisions on Odoo Knowledge Repository
8. **Katherine fractional offer** — P10 IP assessment first; then decide Path A vs. B
9. **D-05 confirm** — Ping Bob: is bcg-ops-knowledge repo created? (~10 min task assigned 2026-03-22, status unknown)
10. **AI Config I-number** — Fetch live catalog, confirm correct I-number for BCG_AI_Config_Architecture_v1.0.docx. Memory conflict exists between two sessions both referencing I-70 for different initiatives.

---

## JASON HARRIS ONBOARDING STATUS (Week 2)

| Item | Status | Owner |
|------|--------|-------|
| Started April 1 | ✅ Complete | — |
| Terrain Brief v2 (I-71 corrected) | ✅ Delivered | Gregory |
| Onboarding package (.docx, 8 tabs) | ✅ Delivered 2026-04-15 | Gregory |
| D-05: bcg-ops-knowledge repo | ⚠️ Unconfirmed | Bob |
| D-06: @cap Odoo receiver scoped | 🟡 Live-eligible pending D-05 | Jason + Victor |
| I-65 scope kick-off | 🟡 In progress (Wk 2) | Jason |
| P5-002 Ph2 first components | 🟡 In progress | Jason |
| Scalar LM research ingested | ✅ vLLM + Unsloth recommendation available | Jason (ingest) |
| Employment Agreement filed | ⚠️ Confirm filed (old versions only confirmed in Teams Chat Files) | Gregory |

---

## 30/60/90-DAY HORIZON

**30 days (by May 15)**
- D-05 confirmed closed — bcg-ops-knowledge repo live
- D-06 @cap routing deployed — Victor Odoo receiver live
- AI Config Architecture review cleared — Bob begins Claude Project configuration
- BCG-Wizard pasted into P2 — Jennifer begins Wave 1 SOP Lookup Pilot prep
- W-21 Document Storage SOP drafted (Jennifer)
- IAH100 live test scheduled and executed — I-44, I-45, I-49 validated
- I-65 Phase 1 architecture committed (Jason)
- I-24 counsel call executed — contracts uploaded
- Oscar Cucaita Sanchez ecosystem integration complete (P6, Team Directory, NTFS)
- I-68 Ph2: WireGuard DNS integration + PSK hardening (Bob)

**60 days (by June 15)**
- P5-002 Ph2 first components deployed — Grafana/Prometheus stack up (Jason)
- I-50 Ph1 folder/file standard delivered (Jennifer)
- I-55 Appointment Coverage module complete (Victor)
- I-40 Benefits analysis delivered — gates BIM Lead re-hire or Katherine fractional commitment
- I-66 Ph1 complete: equipment inventory in Odoo Maintenance (Bob + Victor)
- vLLM inference server live on DGX Spark (Jason)
- W-25 Sanitized Dev Model SOP drafted (Jennifer, Cory/Stephanie input)

**90 days (by July 15)**
- I-24 Licensing Audit complete — 6 initiatives unlock
- B&F pricing model ready (P1 + P3 + P8 convergence, pending D-01)
- P5-002 Ph2 Grafana/Prometheus fully operational
- All Beta pyRevit buttons validated on IAH100
- Wave 1 SOP Lookup Pilot (Q2 2026) — requires 5 approved SOPs from P2
- I-65 Phase 1 deliverables: RAG archive + meeting transcription live on DGX Spark
- I-71 detailed architecture committed — ready for Q3 build kick-off

---

## CARRY-FORWARD ITEMS

1. **PIDS button ES compliance** — When returning to windsurfrules v1.1 work: existing PIDS button panel ES storage needs updating in Windsurf to comply with opaque schema architecture (AppSettings_01, short JSON keys, DataStorage host). Prior code used descriptive schema with GUID B7E3F8A1-4C2D-4E6F-9A1B-3C5D7E8F9A0B — must be replaced.
2. **windsurfrules v1.1 prerequisites (open)** — Shared parameters file path decision, line style manifest population, SCHEMA_GUIDS.md creation in bcg-ops-revit-tools.
3. **bcg-ops-governance → private** — Flag: repo must go private once GitHub MCP live on all workstations. Cloudflare Pages will require re-auth with new OAuth scope after repo visibility change.
4. **Infrastructure Inventory** — Add: Highland Village branch, NUC9 cluster detail, BIM360+ACC both in use, ClarkKent specs, BB-8 IP, RevitPrint specs, QNAP detail, VM host mapping, Veeam detail, Revit/AutoCAD/Bluebeam versions + licenses.
5. **Claude Desktop security review** — Open action: assess data handling, file system access scope, MCP exposure, governance implications. Route findings to P5/P10.
6. **Windsurf global_rules.md** — Drafted (P4, ~4,979 chars, 1,021 char headroom). Pending Gregory review; Bob deploys to all workstations. Confirm Victor inclusion (may not run Windsurf).
7. **Gov Registry** — Confirm version is current after all recent doc bumps (target v2.7+).

---

## GOVERNANCE HEALTH

| Check | Status |
|-------|--------|
| Governance Doc Registry | ✅ v2.7+ |
| Style Guide | ✅ v1.5 |
| Project Ecosystem & Handoffs | ✅ v1.7 (Handoff Validation Protocol added 2026-03-23) |
| Initiative Catalog | ✅ v2.6 (69 active, next I-72) |
| EAB | ✅ v1.5 — all 18 projects propagated (completed 2026-03-23 sync) |
| Tools Inventory | ✅ v1.2 (46 buttons / 10 panels) |
| P4-002 Technical Architecture | ✅ GOV-017 v1.1 |
| All 18 project instructions on GitHub | ✅ Audited and corrected 2026-03-23 |
| Next I-slot | ✅ I-72 |
| Next W-slot | ✅ W-25 |
| Next B-slot | ✅ B-48 |
| AI Config I-number | ⚠️ Unconfirmed — memory conflict, fetch catalog to resolve |
| Oscar in ecosystem | ⚠️ Dashboard only — P6/governance reconciliation open |
| D-05 status | ⚠️ Unconfirmed since 2026-03-22 assignment |
| odoo.sh references | ✅ Purged — any future reference is stale and must be corrected |
| pyRevit repo | ✅ GitLab (alexandria.bcg-corp.com/revit/bcg-ops-revit-tools) |
| Raw GitHub fetch rule | ✅ Confirmed — always use github-write MCP, never web_fetch raw URLs |
| M365 security lockdown | ✅ Confirmed 2026-03-14 |
| Dashboard | ✅ v2.27 — live at dashboard.bcg-corp.com |
| Slack MCP | ⚠️ Connected but NOT authorized — Teams is BCG standard. No Slack use until Gregory explicitly permits. |
| bcg-ops-governance repo visibility | ⚠️ Still public — must go private once GitHub MCP live on all workstations |

---

*BCG Corp — CONFIDENTIAL INTERNAL USE ONLY*
*Generated by P0 — Master Strategic Plan | 2026-04-15*
*Supersedes BCG_Ecosystem_Status_2026-03-22.md*
*Upload to P0 project knowledge to activate as runtime reference*
*Commit to: bcgcorp/bcg-ops-governance/standards/BCG_Ecosystem_Status_2026-04-15.md*
