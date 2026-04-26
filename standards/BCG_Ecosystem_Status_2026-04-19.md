# BCG CORP — ECOSYSTEM ORIENTATION & EXECUTIVE SUMMARY
**Generated:** 2026-04-19 | **Catalog:** v3.0.1 | **Registry:** v3.6 | **EAB:** v1.7 | **Team Dir:** v2.5
**Scope:** All 18 active Claude projects
**Status:** Protocol-Harness Era Boundary — I-75 shipped; P0-001 retired; four protocols live in `standards/protocols/`; P0 custom instructions formally versioned at v1.0
**Closure log appended 2026-04-26:** I-27 closed via Path B; I-69 Section 5 Backfill verified.

---

## EXECUTIVE SUMMARY

BCG Corp is a 9-person physical security consulting firm operating an 18-project Claude ecosystem. As of 2026-04-19, **73 active initiatives** are tracked across 11 workstreams. The headline change since the 2026-04-15 sync is the **Protocol-Harness Migration (I-75)**: ecosystem triage moves from a subproject (P0-001, retired) to a protocol-harness pattern under P0. Four executable protocols now live in `bcg-ops-governance/standards/protocols/` and are fetched by P0 on reserved trigger keywords. End-to-end smoke tests across all four triggers (`triage now`, `close I-*`, `activate I-*`, `post-mortem`) passed this session.

**Three headline facts:**
- **Protocol-Harness live.** Triage, closure verification, plan discipline, and post-mortem are now runbook-executed governance — no memory-based routing. P0 is formally versioned at v1.0 (first formally versioned P0 instruction set).
- **73 active initiatives, Catalog at v3.0.1 (era boundary + 2026-04-26 closure increment).** I-75 (Ecosystem Protocol Harness, Active) and I-76 (Grading Schema Extraction, Planned) registered 2026-04-19. P0-001 retired. P4-003 added to EAB (catches up 2026-04-18 catalog drift). I-27 closed via Path B; I-69 backfill verified (2026-04-26).
- **Gregory remains the bottleneck on 7+ items.** D-01 (accounting) now 59+ days open. D-05 bootstrap handoff delivered to Bob this session — execution path restored. AI Config Architecture review closed (APPROVED 2026-04-15). BCG-Wizard P2 handoff closed (PASTED 2026-04-15).

**Key changes since 2026-04-15:**
- **Protocol-Harness migration (I-75, 2026-04-19).** W-20 v1.1 → v1.2 (migrated to `standards/protocols/`). Three protocols carved out: `Initiative_Closure_Verification.md` v1.0, `Initiative_Plan_Discipline.md` v1.0, `Post_Mortem.md` v1.0. Protocol folder README v1.0 published. Post-Mortem Template (was GOV-020) relocated to `protocols/resources/`. EAB v1.6 → v1.7. P0-001 subproject retired; triage absorbed into P0.
- **I-76 registered** — Ecosystem Grading Schema Extraction (Gregory/Bob, Planned Q2 '26). Extracts dashboard grading constants into a canonical governance doc. Plan authoring required before activation per `Initiative_Plan_Discipline.md`.
- **Catalog v2.6 → v3.0** (era boundary). Internal drift corrected: v2.10 forward-reference resolved (Plan Link Rule was effective via W-20 v1.1; now canonically landed in Plan Discipline protocol).
- **Catalog v3.0 → v3.0.1** (2026-04-26). I-27 closed via Path B silent-completion exception per `Initiative_Closure_Verification.md` v1.0. I-69 Section 5 Backfill audit verified same day (no catalog status edit per Section 5 — backfill verification logged here). See Closure Log below.
- **Registry v2.7+ → v3.6** (sections 3.13–3.18 new for protocol folder; §10.1 pointer refreshed to this document).
- **Team Directory v2.4 → v2.5** (Oscar Cucaita Sanchez email corrected: ocs@bcg-corp.com).
- **BCG_AI_Config_Architecture_v1.0.docx APPROVED 2026-04-15** (was under review since March). Bob executing Section 5 10-task checklist. Jennifer integrating Layer B guidance into How-to-Use-AI guide. Folded into I-65 scope.
- **BCG-Wizard guide P2 handoff PASTED 2026-04-15.** Jen to confirm receipt, integrate, correct Section X placeholder, apply Style Guide, submit for Gregory approval. Wave 1 SOP Lookup Pilot (Q2 2026) gates on 5 approved SOPs.
- **D-05 bootstrap handoff delivered 2026-04-19** (see `handoffs/D-05_bcg-ops-knowledge_Bootstrap_Bob_Handoff_2026-04-19.md`). MCP PAT returned 403 on `create_repository` (org admin scope required). Bob has everything needed to execute in ~10 min.
- **I-72 Superpowers v5.0.7 merged to main 2026-04-17** (`.windsurf/skills/` vendored in pyRevit working copy).

---

## ECOSYSTEM STRUCTURE

| Layer | Count | Notes |
|-------|-------|-------|
| Active Claude projects | 18 | P0, P1–P11, P4-001, P4-002, P4-003, P5-001, P5-002, P8-001 |
| Active initiatives | 73 | I-01–I-76, minus I-20, I-30, I-32 |
| Active workstreams | 11 | WS-01–WS-11 |
| Active subprojects | 6 | P4-001, P4-002, P4-003, P5-001, P5-002, P8-001 |
| Retired subprojects (2026-04-19) | 1 | P0-001 (triage absorbed into P0 via protocol-harness / I-75) |
| Retired subprojects (2026-03-12) | 4 | P7-001–P7-004 (consolidated into P7 parent) |
| Next I-number | I-77 | Always fetch catalog before assigning |
| Next W-number | W-25 | W-24 claimed (I-70 Schedule Tracking SOP) |
| Next B-number | B-48 | P4-002 button backlog |

---

## PROJECT STATUS — ALL 18

### P0 — Master Strategic Plan ✅
**Owner:** Gregory | **Health:** Active
Dashboard v2.27 live on Cloudflare Pages (dashboard.bcg-corp.com). **Custom instructions now formally versioned at v1.0** — triage/closure/plan/post-mortem now protocol-harness driven. Reserved triggers: `triage now`, `close I-{n}`, `activate I-{n}`/`plan I-{n}`, `post-mortem`. W-20 triage function absorbed from retired P0-001. Ecosystem Status refreshed 2026-04-19 (this document).

### P1 — Financial Modeling & Pricing 🔴
**Owner:** Gregory | **Health:** Stalled
No change from 2026-04-15. Zero active initiatives. All workstreams blocked on D-01 (accounting data source — 59+ days open).

### P2 — SOP & Workflow Library 🟢 (was 🟡)
**Owner:** Jennifer Brezniak | **Health:** Active — unblocked
BCG-Wizard P2 handoff PASTED by Gregory 2026-04-15. Jen executing: confirm receipt, integrate into How-to-Use-AI guide, correct Section X placeholder, apply Style Guide, submit for Gregory approval. Layer B guidance from approved BCG_AI_Config_Architecture also integrating. W-21 Document Storage SOP fully unblocked — Jen can draft. Wave 1 SOP Lookup Pilot (Q2 2026) gates on 5 approved SOPs.

### P3 — Competitive Intel & BD 🟡
No change. 9 initiatives, all Planned. New service lines (I-16, I-17, I-18, I-19, I-21, I-37) gated on I-24 licensing audit.

### P4 — AI Infrastructure & Deployment ✅
**Owner:** Jason Harris | **Health:** Active — Week 3
12 initiatives. **BCG_AI_Config_Architecture_v1.0.docx APPROVED 2026-04-15**, folded into I-65 scope. Jason active on I-65 Ph1 architecture, I-48 API-Driven Hub, I-71 architecture, P5-002 Ph2. I-72 Superpowers methodology framework: Ph1 complete; Ph2/3 handoff delivered 2026-04-17. vLLM + Unsloth recommendation available for I-65 ingestion. **I-27 (Windsurf IDE Enablement) closed 2026-04-26 via Path B silent-completion exception** — Catalog now reflects Complete status.

### P4-001 — MCP Evaluation & Selection ✅
Unchanged. Odoo MCP proven with Windsurf. MS365 MCP selected. Grafana + Prometheus MCPs blocked on P5-002 Ph2 stack deployment.

### P4-002 — Revit & BIM Automation ✅
**Owner:** Gregory (BIM Lead vacancy, Stephanie backup) | **Health:** Active — largest backlog
46 buttons deployed (Tools Inventory v1.3 tracks 52 across 11 panels including Designed state). 47-button backlog (B-01–B-47). Next B: B-48. I-71 Q3 2026 (hard constraint: zero cloud AI on client models). I-67 on hold — title block shared parameter blocker; coordinate with I-71. **Live-test block on IAH100 still pending** — confirm Civil DWG link with Stephanie (OQ-2) before scheduling. pyRevit source: GitLab `alexandria.bcg-corp.com/revit/bcg-ops-revit-tools`. Canonical working copy: `~\CascadeProjects\pyRevit`. `.windsurf/skills/` I-72 Superpowers v5.0.7 vendored (merged 2026-04-17).

### P4-003 — BCG EasyButton / Idea Capture ✅ (NEW TO EAB 2026-04-19)
**Owner:** Greg (Ph1) → Jason (Ph2–4) | **Health:** Active
Registered in Catalog v2.9 (2026-04-18); EAB v1.7 catches up 2026-04-19. Hosts I-73 (voice-activated idea capture, 4 phases). Ph1 POC active; Ph2–3 Jason Q3 2026; Ph4 2027. Hard deps: Jason active (✓), DGX Spark availability for faster-whisper. Soft deps: I-65.

### P5 — IT Security / QOS ✅
**Owner:** Bob Brezniak | **Health:** Active — heavy
Bob executing BCG_AI_Config Section 5 10-task checklist (dates need refresh from April 1 baseline). **D-05 bootstrap handoff delivered 2026-04-19** — MCP PAT 403 on repo creation, Bob executes directly (~10 min with complete package). I-68 Ph2 (WireGuard DNS + PSK hardening) active. I-43 Outlook Forward Guard ASR review pending. Claude Desktop security review open.

### P5-001 — Network Infrastructure Assessment 🟦
Unchanged. Planned. I-38 defined. Gated on Bob capacity.

### P5-002 — Monitoring & Observability Infrastructure ✅
Unchanged. Ph1 complete. Jason Ph2 active — Grafana/Prometheus stack deployment. ClarkKent/Telegraf/WireGuard foundation in place.

### P6 — HR & People 🟡 (was 🟡)
**Owner:** Jennifer Brezniak | **Health:** Active
**Oscar Cucaita Sanchez ACTIVE 2026-04-15** — full-time PM, Gregory direct report, email ocs@bcg-corp.com (corrected in Team Dir v2.5). Initiative assignments still pending Gregory direction. NTFS: standard B: drive tier. I-40 Benefits Restructuring keystone — BIM Lead vacancy gated. I-63 ADP Recruiting active. Katherine Allen fractional offer open (P10 IP assessment first).

### P7 — Odoo Platform & ERP 🟡
**Owner:** Victor Carrillo | **Health:** Active — queue growing
13 initiatives. I-74 Notification Center Ph A active (split from prior I-56 scope 2026-04-18). I-52 CI/CD UNBLOCKED (April 12 review cleared — due within 5 days of unblock). I-66 Ph1 (Claude Vision → CSV → Odoo Maintenance import) in progress. D-06 Odoo receiver scoped for Victor — live-eligible pending D-05. Environments: R2-D2 (prod), C-3PO (dev), BB-8 (staging). odoo.sh decommissioned.

### P8 — Proposals & RFP Operations 🟡
Unchanged. P8-001 operational. P8 still needs rate card, historical proposals, W-17 RFP Intake SOP.

### P8-001 — Document Intake & Routing ✅
**Owner:** Rachel McGee | **Health:** Active
I-70 Client Deliverable Schedule Tracker operational — 82 projects registered (79 standard + 3 BOD Titus), 24 campuses, 14 sites. W-16 rules active ($15K auto no-bid, Stephanie 48hr backup authority).

### P9 — Business Continuity & Resilience 🟦
Unchanged. I-41 Phase 1 (Risk Register) current deliverable.

### P10 — Legal, Compliance & Risk ✅
**Owner:** Gregory (only) | **Health:** Active
I-24 Licensing & Insurance Audit active. Rachel owns insurance track (broker outreach, underwriter evidence package); Gregory owns licensing track (5 counsel questions pending contracts upload). AI exclusion risk in E&O/professional liability (Verisk generative AI exclusion forms, Q1–Q2 renewals). Katherine P10 IP assessment pending. Bernard Lewis active legal matter — never assign.

### P11 — Candidate OSINT & Pre-Hire Intelligence ✅
**Owner:** Gregory (sole CIR approver) / Jennifer (full access) | **Health:** Active — RESTRICTED
EAB v1.7 reconciled: P11 description confirmed "Gregory & Jennifer only" (v1.6 intent was never reflected in P11's own instructions; closed 2026-04-19 with P11 instructions updated). I-64 active.

---

## TEAM LOAD SNAPSHOT

(12 FTE + 1 vacant — Oscar now active as of 2026-04-15)

| Person | Load | Immediate Focus |
|--------|------|-----------------|
| Gregory | 🔴 Bottleneck | D-01; I-24 counsel call; live-test block IAH100; Katherine decision; Oscar initiative assignments; I-29 Odoo decisions; I-76 plan authoring |
| Jason | 🟠 Wk 3 | I-65 Ph1 architecture; P5-002 Ph2 Grafana/Prometheus; I-71 architecture; I-72 Ph2/3 (handoff 2026-04-17); D-06 (gated D-05) |
| Bob | 🟠 Heavy | **D-05 execute (bootstrap ready)**; AI Config Section 5 10-task checklist; I-68 Ph2; I-43 ASR review |
| Victor | 🟠 Growing | I-74 Notification Center Ph A; I-66 Ph1; I-52 CI/CD (unblocked, 5 days); D-06 Odoo receiver (gated D-05) |
| Jennifer | 🟡 Moderate | BCG-Wizard integration (Gregory pasted 2026-04-15, Jen executes); AI Config Layer B integration; W-21 SOP draft; I-63 ADP; Oscar onboarding |
| Oscar | 🟡 Ramping | PM support — initiative assignments pending Gregory direction |
| Rachel | 🟢 Clear | I-70 daily ops; I-24 Track B (insurance/broker); contracts upload for Track A |
| Cory | 🟢 Clear | IAH100 live test (unscheduled — Gregory action); W-25 SOP candidate |
| Stephanie | 🟢 Clear | Backup bid/no-bid active; confirm Civil DWG link IAH100 (OQ-2) |
| Joshua | 🟢 Clear | W-02 when prioritized |
| Jeff | 🟢 Clear | I-02 QC peer review |
| Nick | 🟢 Clear | Production support |

---

## OPEN DECISIONS

| ID | Decision | Blocks | Age | Owner |
|----|----------|--------|-----|-------|
| 🔴 D-01 | Accounting data source | All P1 models, WS-02/03/06, I-23 | 59+ days | Gregory |
| 🟡 D-05 | Create bcg-ops-knowledge private GitHub repo | D-06, @cap routing, CIP/DDL storage | **Bootstrap handoff delivered 2026-04-19** — Bob execute (~10 min) | Bob |
| 🟡 D-06 | @cap chatbot routing → Odoo bcg.knowledge.capture queue | I-31 MCP, knowledge capture ops | Live-eligible, gated D-05 | Jason + Victor |
| 🟡 I-29 | 3 Odoo Knowledge Repository decisions | I-29 start | 3+ weeks | Gregory |
| 🟡 Oscar initiative assignments | Which initiatives Oscar drives | P6 onboarding completion | Active since 2026-04-15 | Gregory → P6/Jennifer |
| 🟡 Katherine fractional offer | Path A vs. B; IP risk framework | P4-002 BIM tool development | Open | Gregory (P10 assessment first) |
| 🟡 I-76 plan | Authoring required before activation | I-76 Planned → Active | New 2026-04-19 | Gregory/Bob |

**Closed since 2026-04-15:**
- D-04: Jason Harris start date — CLOSED ✅ (previously; Jason now Wk 3 active)
- BCG_AI_Config_Architecture_v1.0.docx — APPROVED 2026-04-15 ✅ (folded into I-65)
- BCG-Wizard P2 handoff — PASTED 2026-04-15 ✅ (Jen executes)
- AI Config I-number resolution — CLOSED ✅ (folded into I-65 per Gregory)
- Oscar onboarding status — CLOSED ✅ (PM, full-time, ocs@bcg-corp.com)
- P11 access reconciliation — CLOSED ✅ (Gregory & Jennifer per v1.7)
- I-75 Ecosystem Protocol Harness shipping — CLOSED ✅ (Active; formal closure pending evidence link inventory)
- **I-27 Windsurf IDE Enablement — CLOSED ✅ 2026-04-26** via Path B silent-completion exception per `Initiative_Closure_Verification.md` v1.0. Owner attestation by Gregory: GitLab commit verified at `alexandria.bcg-corp.com/revit/bcg-ops-revit-tools`; Windsurf in active production use across team; I-72 Superpowers v5.0.7 merge (2026-04-17) functional. Catalog row updated `Planned` → `Complete` per Path B exception.
- **I-69 Dashboard / Cloudflare Pages — Section 5 Backfill VERIFIED ✅ 2026-04-26.** Evidence link `https://dashboard.bcg-corp.com` resolves; canonical filing confirmed at `bcgcorp/bcg-ops-claude-projects/dashboard/BCG_Master_Strategic_Plan.html`. Status remains `Complete` (no catalog status edit per Section 5 protocol — verification logged here as the audit record).

---

## GREGORY BOTTLENECK — ITEMS ONLY GREGORY CAN UNBLOCK

1. **D-01** — Accounting data source (blocks P1 + 3 workstreams, 59+ days)
2. **Live-test block** — Schedule 30 min on IAH100: I-44 FOV Camera first (lowest risk), then I-45/B-24 Site Grid, then I-49 Linked CAD Layer Manager. Confirm Civil DWG link with Stephanie (OQ-2) before scheduling.
3. **Oscar initiative assignments** — Route to P6/Jennifer for formal assignment sequence.
4. **I-24 counsel call** — Contracts upload pending (Rachel running parallel insurance track).
5. **I-29** — 3 open decisions on Odoo Knowledge Repository (3+ weeks).
6. **Katherine fractional** — P10 IP Risk & Engagement Framework assessment first; then decide Path A vs. B.
7. **I-76 plan authoring** — Before activation per `Initiative_Plan_Discipline.md` (four-element minimum: steps, deps, success criteria, target).
8. **bcg-ops-governance → private** — Flag when GitHub MCP live on all workstations. Cloudflare Pages re-auth required after visibility change.

---

## JASON HARRIS ONBOARDING STATUS (Week 3)

| Item | Status | Owner |
|------|--------|-------|
| Started April 1 | ✅ Complete | — |
| Terrain Brief v2 (I-71 corrected) | ✅ Delivered | Gregory |
| Onboarding package (.docx, 8 tabs) | ✅ Delivered 2026-04-15 | Gregory |
| D-05: bcg-ops-knowledge repo | 🟡 Bootstrap handoff to Bob 2026-04-19 | Bob |
| D-06: @cap Odoo receiver | 🟡 Live-eligible, gated D-05 | Jason + Victor |
| I-65 Ph1 architecture | 🟡 In progress | Jason |
| P5-002 Ph2 Grafana/Prometheus | 🟡 In progress | Jason |
| I-71 architecture | 🟡 In progress | Jason |
| I-72 Ph2/3 handoff | ✅ Delivered 2026-04-17 | Jason |
| Employment Agreement filed | ⚠️ Confirm filed in OneDrive | Gregory |
| W-20 Triage backup operator | — (Bob assumed role per W-20 v1.2) | Bob |

---

## 30/60/90-DAY HORIZON

**30 days (by May 18)**
- D-05 executed by Bob (~10 min with bootstrap package) → D-06 unblocked
- D-06 @cap routing deployed — Victor Odoo receiver live
- Bob completes AI Config Section 5 10-task checklist
- Jennifer delivers BCG-Wizard integrated How-to-Use-AI guide (Gregory approval)
- W-21 Document Storage SOP drafted
- IAH100 live-test block scheduled and executed — I-44, I-45, I-49 validated
- I-65 Phase 1 architecture committed (Jason)
- I-24 counsel call executed — contracts uploaded
- Oscar first initiative assignments landed
- I-68 Ph2 (WireGuard DNS + PSK hardening) complete
- I-76 plan authored and initiative activated

**60 days (by June 18)**
- P5-002 Ph2 Grafana/Prometheus stack up (Jason)
- I-50 Ph1 folder/file standard delivered (Jennifer)
- I-55 Appointment Coverage module complete (Victor)
- I-40 Benefits analysis delivered — gates BIM Lead re-hire or Katherine fractional commitment
- I-66 Ph1 complete — equipment inventory in Odoo Maintenance (Bob + Victor)
- vLLM inference server live on DGX Spark (Jason)
- W-25 Sanitized Dev Model SOP drafted (Cory/Stephanie input)
- I-76 Grading Schema extracted to canonical governance doc

**90 days (by July 18)**
- I-24 Licensing Audit complete — 6 initiatives unlock (I-16, I-17, I-18, I-19, I-21, I-37)
- B&F pricing model ready (P1+P3+P8 convergence, pending D-01)
- All Beta pyRevit buttons validated on IAH100
- Wave 1 SOP Lookup Pilot (Q2 2026) — requires 5 approved SOPs from P2
- I-65 Phase 1 deliverables live on DGX Spark (RAG archive + meeting transcription)
- I-71 detailed architecture committed — ready for Q3 build kick-off
- Redirect stubs sunset 2026-07-18 (old W-20 SOP path, old Post-Mortem Template path)

---

## CARRY-FORWARD ITEMS

1. **PIDS button ES compliance** — When returning to windsurfrules v1.1 work: PIDS button panel ES storage to opaque schema (AppSettings_01, short JSON keys, DataStorage host). Prior GUID `B7E3F8A1-4C2D-4E6F-9A1B-3C5D7E8F9A0B` must be replaced.
2. **windsurfrules v1.1 prerequisites** — Shared parameters file path decision, line style manifest population, SCHEMA_GUIDS.md creation in bcg-ops-revit-tools (GitLab).
3. **bcg-ops-governance → private** — Flag once GitHub MCP live on all workstations. Cloudflare Pages will require re-auth with new OAuth scope after repo visibility change.
4. **Infrastructure Inventory additions** — Highland Village branch, NUC9 cluster detail, BIM360+ACC both in use, ClarkKent specs, BB-8 IP, RevitPrint specs, QNAP detail, VM host mapping, Veeam detail, Revit/AutoCAD/Bluebeam versions + licenses.
5. **Claude Desktop security review** — Open action: assess data handling, file system access scope, MCP exposure, governance implications. Route findings to P5/P10.
6. **Windsurf global_rules.md** — Drafted (P4, ~4,979 chars). Pending Gregory review; Bob deploys to all workstations. Confirm Victor inclusion (may not run Windsurf).
7. **I-76 activation** — Plan authoring required per `Initiative_Plan_Discipline.md` v1.0.
8. **Registry §10.1 pointer** — Updated 2026-04-19 to reference this document (Registry v3.5 → v3.6).
9. **I-75 formal closure** — Active status current; formal Closure Verification (`close I-75`) pending evidence link inventory for the six protocol files + P0 v1.0 instructions commit.
10. **v3.1 catalog cleanup** — Pending Gregory approval. Includes: Removals (I-06, I-07, I-25, I-26, I-31, I-47, I-61), additional closures (I-08), reclassifications (I-64 → WS-11), date refreshes (I-01, I-02, I-23, I-24, I-29), owner update (I-09 → Gregory), D-01 note refresh.

---

## GOVERNANCE HEALTH

| Check | Status |
|-------|--------|
| Governance Doc Registry | ✅ v3.6 (2026-04-19) |
| Style Guide | ✅ v1.5 |
| Project Ecosystem & Handoffs | ✅ v1.9 |
| Initiative & Workstream Catalog | ✅ **v3.0.1** (73 tracked, next I-77) |
| Team Directory | ✅ v2.5 (2026-04-15) |
| Infrastructure Inventory | ✅ v1.3 |
| Ecosystem Awareness Block | ✅ v1.7 — all 17 projects propagated 2026-04-19 |
| Artifact Naming & Capture Standard | ✅ GOV-014 v1.4 |
| Ecosystem Vocabulary | ✅ GOV-012 v1.2 |
| pyRevit Tab Style Guide | ✅ GOV-011 v1.0 |
| Tools Inventory | ✅ GOV-013 v1.3 (52 buttons / 11 panels) |
| SOP Governance & Intake Protocol | ✅ SOP-GOV-001 v1.5 |
| P4-002 Technical Architecture | ✅ GOV-017 v1.1 |
| Project Code Registry | ✅ GOV-018 v2.2 |
| Windsurf Skills Deployment Pattern | ✅ GOV-019 v1.0 |
| Artifact Deployment Routing Standard | ✅ GOV-021 v1.1 |
| W-20 Ecosystem Triage | ✅ v1.2 (relocated to `standards/protocols/`) |
| Initiative Closure Verification | ✅ v1.0 (NEW 2026-04-19) — first invocations 2026-04-26: I-27 Path B + I-69 Section 5 Backfill |
| Initiative Plan Discipline | ✅ v1.0 (NEW 2026-04-19) |
| Post-Mortem Protocol | ✅ v1.0 (NEW 2026-04-19) |
| Post-Mortem Template | ✅ v1.0 (relocated to `protocols/resources/`) |
| Protocols Folder README | ✅ v1.0 (NEW 2026-04-19) |
| P0 custom instructions | ✅ **v1.0** (first formally versioned set, 2026-04-19) |
| Next I-slot | ✅ I-77 |
| Next W-slot | ✅ W-25 |
| Next B-slot | ✅ B-48 |
| Raw GitHub fetch rule | ✅ Confirmed — always `github-write` MCP, never `web_fetch` on raw.githubusercontent.com |
| odoo.sh references | ✅ Purged — any future reference is stale, must be corrected on sight |
| pyRevit source repo | ✅ GitLab `alexandria.bcg-corp.com/revit/bcg-ops-revit-tools` |
| Dashboard | ✅ v2.27 live at dashboard.bcg-corp.com (Section 5 Backfill verified 2026-04-26) |
| Slack MCP | ⚠️ Connected but NOT authorized — Teams is BCG standard. No Slack use until Gregory explicitly permits. |
| `bcg-ops-governance` repo visibility | ⚠️ Still public — flag once GitHub MCP live on all workstations. Cloudflare Pages re-auth required. |
| `bcg-ops-knowledge` repo | 🟡 Not yet created — Bob has bootstrap handoff as of 2026-04-19 |
| Redirect stubs | ✅ Sunset 2026-07-18 (old W-20 SOP path, old Post-Mortem Template path) |

---

*BCG Corp — CONFIDENTIAL INTERNAL USE ONLY*
*Generated by P0 — Master Strategic Plan | 2026-04-19*
*Closure log appended 2026-04-26 (I-27 Path B; I-69 Section 5 Backfill)*
*Supersedes BCG_Ecosystem_Status_2026-04-15.md*
*Upload to P0 project knowledge to activate as runtime reference; delete prior 2026-04-15 copy after upload*
*Commit: bcgcorp/bcg-ops-governance/standards/BCG_Ecosystem_Status_2026-04-19.md*
