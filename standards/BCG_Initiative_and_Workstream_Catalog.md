# BCG Corp — Initiative & Workstream Catalog

**Version:** 3.1
**Effective:** April 2026
**Last Updated:** 2026-04-26
**Scope:** All Claude Projects (P0–P11) and subprojects
**Owner:** Gregory Bernardo, President

**What Changed (v3.1 — Realignment Cleanup):** Comprehensive cleanup pass per Gregory directive 2026-04-26. Removes 7 initiatives (consolidations + strategic supersession + dead dependencies); reclassifies 1 initiative to workstream-level capability; refreshes 5 stale Q1 '26 targets; assigns owner to 1 orphaned initiative. Detailed changes:

- **Removed (consolidated into existing initiatives):** I-06 → I-54, I-07 → I-53.
- **Removed (folded into I-65 / On-Prem AI Suite scope):** I-25 (AI Standards & Guardrails — covered by approved BCG_AI_Config_Architecture_v1.0.docx), I-47 (pgvector vector storage substrate for RAG).
- **Removed (superseded by on-prem AI strategy under I-65):** I-26 (Cowork Enablement — BCG moving away from Cowork as primary surface), I-61 (Cowork Security Policy — moot under on-prem corpus governance).
- **Removed (dependency-dead, scope delivered elsewhere):** I-31 (Cross-Project Sync MCP Phase 2 — Phase 1 = I-30 was removed; cross-project sync now delivered by I-48 API-Driven Hub via GitHub architecture; live MCP Phase 5 capability tracked via D-01 Odoo MCP testing).
- **Reclassified to WS-11 (Resource Planning):** I-64 (Candidate OSINT — ongoing P11 capability, not bounded initiative). WS-11 coverage list updated.
- **Status/date refresh (Q1 '26 → Q2 '26):** I-23 (On Hold → Active), I-24 (date refreshed), I-29 (On Hold → Active). I-01 reaffirmed Active Q2 '26 (no row change needed).
- **Status reset:** I-02 (Active Q1 '26 → On Hold Q4 '26 — paused pending QC peer review prioritization).
- **Owner assignment:** I-09 (TBD → Gregory, interim).
- **WS-10 coverage list cleanup:** Removed strikethrough'd I-25, I-26, I-31, I-47 references. I-27 (Complete) retained.
- **WS-11 coverage updated:** Reclassified I-64 OSINT capability now tracked here as ongoing P11 standing capability.
- **D-01 reframing:** Decision queue note (in Ecosystem Status doc) updated to "Pending Odoo MCP currently in testing" per Gregory direction.
- **Counts:** **65 active initiatives** (was 73; -8 = -7 removed + -1 reclassified). Next I-slot unchanged: **I-77**. 11 removed total: I-06, I-07, I-20, I-25, I-26, I-30, I-31, I-32, I-47, I-61, I-64.

**What Changed (v3.0.1 — I-27 Closure):** I-27 (Windsurf IDE Enablement) closed via Path B (silent-completion exception) per `standards/protocols/Initiative_Closure_Verification.md` v1.0 (2026-04-26). Owner attestation by Gregory: GitLab commit verified at `alexandria.bcg-corp.com/revit/bcg-ops-revit-tools`; Windsurf deployed and in active production use across team; I-72 Superpowers v5.0.7 merge (2026-04-17) functional. Status drifted directly `Planned` → `Complete` — exception authorized by Gregory; documented per protocol Path B. I-69 Section 5 Backfill audit verified same day; evidence link `https://dashboard.bcg-corp.com` resolves; canonical filing confirmed at `bcgcorp/bcg-ops-claude-projects/dashboard/BCG_Master_Strategic_Plan.html` (no catalog edit per Section 5 — verification logged to Ecosystem Status doc).

**What Changed (v3.0 — Protocol-Harness Era Boundary):** Major version bump marking the transition to the protocol-harness pattern (see `standards/protocols/README.md`). This is a **structural commit**, not a scope change:
- **Retires P0-001** from the Subproject Registry (Section 5). Triage function absorbed into P0 via the protocol-harness pattern; W-20 v1.2 is the protocol P0 fetches to execute triage. Archival is a manual Claude-UI action for Gregory.
- **Registers I-75 — Ecosystem Protocol Harness** (Gregory owner, Bob backup, P0, Active, Q2 '26). This migration's deliverable initiative; anchors `standards/protocols/` folder and the four initial protocols (W-20 v1.2, Initiative_Closure_Verification v1.0, Initiative_Plan_Discipline v1.0, Post_Mortem v1.0).
- **Registers I-76 — Ecosystem Grading Schema Extraction** (Gregory owner, Bob backup, P0, Planned, Q2 '26). Next sprint. Extracts the dashboard's grading schema (freshness tiers, parity dimensions, integrity checks, scoring constants) from `BCG_Master_Strategic_Plan.html` JS constants into a canonical governance document. The dashboard becomes a rendering of EAB-referenced data, not a source of it.
- **Corrects internal registry drift.** The Governance Doc Registry's v3.2 (2026-04-18) commit forward-referenced this catalog as v2.10 (Plan Link Rule landed). That v2.10 was never shipped as a standalone commit — the Plan Link Rule content was effective via W-20 v1.1 enforcement. v3.0 lands directly from v2.9, acknowledging the v2.10 forward-reference in this changelog and in the updated Registry v3.5.
- **Counts:** **73 active initiatives** (71 prior + I-75 + I-76). **6 active subprojects** (7 prior − P0-001). **11 workstreams** unchanged. Next I-slot: **I-77**.

---

## 1. Purpose

This document is the single source of truth for BCG Corp's active initiatives and workstreams. Every Claude Project references this document (fetched from GitHub per GOV-001) so that strategic planning, resource allocation, and cross-project coordination use current initiative data rather than stale counts embedded in individual project instructions.

Update this file when: an initiative is added, completed, reprioritized, or removed; a workstream is created, completed, or reassigned.

**Transition enforcement (v3.0+):** Planned → Active transitions are gated by `standards/protocols/Initiative_Plan_Discipline.md`. Active → Complete transitions are gated by `standards/protocols/Initiative_Closure_Verification.md`. W-20 Ecosystem Triage (v1.2) invokes both.

---

## 2. Initiative Registry

**65 active initiatives** (I-01 through I-76, minus 11 removed: I-06, I-07, I-20, I-25, I-26, I-30, I-31, I-32, I-47, I-61, I-64).

| ID | Initiative Name | Owner | Status | Project | Target | Notes |
|----|----------------|-------|--------|---------|--------|-------|
| I-01 | ACC Fundamentals Training | Greg | Active | P2 | Q2 '26 | QR-ACC-01 session with Joshua + Cory pending. Owner changed from Bernard Lewis (2026-03-05). Reaffirmed Active/Q2 '26 in v3.1 (2026-04-26). |
| I-02 | Peer Review Workflows (QC 30/60/90%) | Jeff Bernardo | On Hold | P2 | Q4 '26 | Define QC checkpoints. Status moved Active → On Hold per Gregory direction (2026-04-26); date refreshed Q1 '26 → Q4 '26 (deferred to align with QC peer review prioritization). |
| I-03 | Employee Recognition & Merch Platform | TBD | Planned | P6 | Q3 '26 | |
| I-04 | Website Build (7 Pages) | Greg | Planned | P3 | Q2 '26 | |
| I-05 | Canvas Image Editor (Odoo Module) | TBD | Active | P7 | Q2 '26 | Phase 1 deployed |
| ~~I-06~~ | ~~Production Rework Module (Odoo)~~ | — | Removed | — | — | Removed 2026-04-26 — consolidated into I-54 (Production Rework Tracking Module). Retained for numbering continuity. |
| ~~I-07~~ | ~~Odoo Automated Testing Framework~~ | — | Removed | — | — | Removed 2026-04-26 — consolidated into I-53 (Odoo 18 Automated Testing Framework). Retained for numbering continuity. |
| I-08 | ASR/AppLocker Remediation | Bob | Active | P5 | Q1 '26 | AppLocker disabled; ASR tiered model (4 Block / 14 Audit). Closure verification handoff to Bob pending (separate `close I-08` protocol invocation). |
| I-09 | Revit Batch Print Utility | Gregory (interim) | Active | P4-002 | Q2 '26 | Started — not functional. Owner updated TBD → Gregory (interim) on 2026-04-26 per Gregory. |
| I-10 | DD Sprint Delivery SOP (W-01) | Cory | Planned | P2 | Q2 '26 | |
| I-11 | CA Workflow SOP (W-02) | Joshua | Planned | P2 | Q2 '26 | |
| I-12 | Project Kickoff Checklist (W-05) | Greg → PM | Planned | P2 | Q2 '26 | |
| I-13 | Client/Prime Comm Playbook (W-11) | Greg → PM | Planned | P2 | Q3 '26 | |
| I-14 | Guiding Principles Integration | Greg | Planned | P2/P0 | Q3 '26 | |
| I-15 | Data Classification Policy (4-Tier) | Bob/Greg | Planned | P5 | Q2 '26 | |
| I-16 | Expert Witness Practice | Greg | Planned | P3/P6 | Q3 '26 | Depends on I-21, I-24 |
| I-17 | Telecom/ICT Feasibility (Pearl-ICT) | Greg | Planned | P3 | Q3 '26 | Depends on I-24 |
| I-18 | Security System Commissioning | Greg | Planned | P3 | Q4 '26 | Depends on I-24 |
| I-19 | Peer Review & Advisory Service | Greg | Planned | P3 | Q4 '26 | Depends on I-24 |
| ~~I-20~~ | ~~Federal/DoD Market Entry~~ | — | Removed | — | — | Removed from catalog. Retained for numbering continuity. |
| I-21 | Expert Witness Entity Structure | Greg | Planned | P6 | Q2 '26 | Depends on I-24 |
| I-22 | AI-Assisted Proposal & BD | Greg/Jason | Planned | P3/P4 | Q3 '26 | |
| I-23 | Odoo Accounting / Financial Baseline | Bob/Victor | Active | P7 | Q2 '26 | D-01 reframed 2026-04-26 — pending Odoo MCP currently in testing. Status moved On Hold → Active per Gregory direction; date refreshed Q1 '26 → Q2 '26. |
| I-24 | Licensing & Insurance Audit | Greg | Active | P10 | Q2 '26 | Re-homed P6→P10 on 2026-03-15. GATING — gates I-16, I-17, I-18, I-19, I-21, I-37. Track A: Licensing (Gregory). Track B: Insurance (Rachel). Date refreshed Q1 '26 → Q2 '26 (2026-04-26). |
| ~~I-25~~ | ~~AI Standards & Guardrails Framework~~ | — | Removed | — | — | Removed 2026-04-26 — folded into I-65 (On-Prem AI Suite) scope via approved `BCG_AI_Config_Architecture_v1.0.docx` (AI Staff Enablement & Guardrail Program, 2026-04-15). Retained for numbering continuity. |
| ~~I-26~~ | ~~Claude Cowork Enablement~~ | — | Removed | — | — | Removed 2026-04-26 — superseded by on-prem AI strategy under I-65. BCG moving away from Cowork as primary surface; on-prem DGX Spark + RAG corpus on alexandria (GitLab) is the strategic path for client-adjacent AI. Retained for numbering continuity. |
| I-27 | Windsurf IDE Enablement | Greg/Bob | Complete | P4 | Q2 '26 | **Closed 2026-04-26 via Path B (silent-completion exception per `standards/protocols/Initiative_Closure_Verification.md` v1.0).** Owner attestation by Gregory: GitLab `alexandria.bcg-corp.com/revit/bcg-ops-revit-tools` commit verified; Windsurf deployed and in active production use across team; I-72 Superpowers v5.0.7 merge (2026-04-17) functional. Status drifted directly `Planned` → `Complete` — exception authorized by Gregory; documented per protocol Path B. Original `Depends on I-26` resolved as moot at closure (I-26 also Removed in v3.1). |
| I-28 | Production Force Multipliers | Greg | Planned | P2/P4 | Q2 '26 | Depends on PROD-01, PROD-02 |
| I-29 | Odoo Knowledge Repository | Bob/Victor | Active | P7 | Q2 '26 | 3 Greg decisions pending. Status moved On Hold → Active per Gregory direction (2026-04-26); date refreshed Q1 '26 → Q2 '26. |
| ~~I-30~~ | ~~Cross-Project Sync Pipeline (Phase 1 — Email)~~ | — | Removed | — | — | Superseded by I-48 (API-Driven Hub). Removed 2026-04-18. Retained for numbering continuity. |
| ~~I-31~~ | ~~Cross-Project Sync MCP Server (Phase 2)~~ | — | Removed | — | — | Removed 2026-04-26 — Phase 2 scope (cross-project sync) delivered by I-48 (API-Driven Hub via GitHub architecture, per March 2026 architecture review). Phase 5 live Odoo MCP query capability tracked via D-01 (Odoo MCP currently in testing). Retained for numbering continuity. |
| ~~I-32~~ | ~~Oracle Opportunity Evaluation~~ | — | Removed | — | — | Rejected — tracked as WS-09 workstream activity |
| I-33 | DM Stakeholder Engagement Strategy | Greg | Planned | P3 | Q2 '26 | |
| I-34 | Competitor Tracking Dashboard / BI Tool | Greg | Planned | P3 | Q2 '26 | |
| I-35 | Employee Handbook | Jennifer | Planned | P6 | Q3 '26 | Build-to-Sell requirement |
| I-36 | Performance Management Framework | Jennifer | Planned | P6 | Q2 '26 | |
| I-37 | CA Takeover Service Playbook | Greg | Planned | P3 | Q2 '26 | Depends on I-24 |
| I-38 | Network Infrastructure Configuration Assessment | Bob/Greg | Planned | P5-001 / P4 | Q2 '26 | AI-assisted firewall/switch config assessment |
| I-39 | Promise Tracking & Proposal Forensics | Greg | Planned | P8 | Q2 '26 | |
| I-40 | Benefits Package Restructuring | Jennifer | Active | P6 | Q2 '26 | Keystone — BIM Lead vacancy gated |
| I-41 | Enterprise Business Continuity Planning | Greg | Active | P9 | Q3 '26 | Three-phase. Risk Register current deliverable |
| I-42 | JSX Artifact Workflow Standard | Greg | Planned | P0 | Q2 '26 | |
| I-43 | Outlook Forward Guard Add-in | Greg | Planned | P4 | Q2 '26 | Bob ASR review pending |
| I-44 | FOV Camera Tool Suite | Greg | Planned | P4-002 | Q2 '26 | Live Revit test pending IAH100 |
| I-45 | Site Grid & Sheet Builder | Greg | Active | P4-002 | Q2 '26 | B-24, B-25. Live Revit test pending IAH100 |
| I-46 | Bulk Title Block Parameter Editor | Greg | Active | P4-002 | Q2 '26 | Live Revit test pending |
| ~~I-47~~ | ~~AI Context Store (pgvector/PostgreSQL)~~ | — | Removed | — | — | Removed 2026-04-26 — folded into I-65 (On-Prem AI Suite) as RAG vector storage substrate. pgvector on DGX Spark is the storage layer for I-65 Phase 1 RAG architecture. Retained for numbering continuity. |
| I-48 | API-Driven Hub Script (Alternative E) | Jason | Active | P4 | Q2 '26 | Automated P0 sync via Claude API. Supersedes I-30 email pipeline. **Delivers I-31 Phase 2 cross-project sync scope via GitHub architecture (per March 2026 architecture review; I-31 removed 2026-04-26).** |
| I-49 | Linked CAD Layer Manager | Greg | Planned | P4-002 | Q2 '26 | Awaiting IAH100 live test, Civil DWG link via Stephanie (OQ-2) |
| I-50 | Standard Folder & File Structure | TBD (Jen or Rachel) / Jason (Ph2) | Planned | P2 (Ph1) → P4 (Ph2) | Q2 '26 | Cross-project folder/file standard |
| I-51 | Email Attachment Ingestion Agent | Jason | Planned | P4 | Q3 '26 | Post D-04 dependency |
| I-52 | Odoo CI/CD Pipeline (Claude Code GitHub Actions) | Victor | Planned | P7 | Q2 '26 (Ph1: 30 days) | |
| I-53 | Odoo 18 Automated Testing Framework | Bob | Planned | P7 | Q2 '26 | **Absorbs I-07 scope (consolidated 2026-04-26).** |
| I-54 | Production Rework Tracking Module | Greg (arch) / Victor (dev) | Planned | P7 | Q2–Q3 '26 | 2 blockers. **Absorbs I-06 scope (consolidated 2026-04-26).** |
| I-55 | Appointment Coverage Request System | Greg (sponsor) / TBD dev | Planned | P7 | Q2 '26 | |
| I-56 | Odoo Task Calendar Display — Project Name Prefix | Bob (exec) / Victor (dev) | Planned — LOW | P7 | Q3 '26 | |
| I-57 | Chat Quality Evaluation SOP (W-19) | Jennifer | Planned | P2 | Q2 '26 | |
| I-58 | P8-001 Document Intake & Routing — Go-Live | Rachel | Active | P8 | Q2 '26 | P8-001 operational scope |
| I-59 | Odoo NL Command Interface (`bcg_nl_intake`) | Victor | Planned | P7 | Q2 '26 | |
| I-60 | BCG Cowork Plugin Development | Greg → Jason (Ph2+) | Planned | P4 (primary), P2/P5/P7 | Q2–Q3 '26 | 4 phases. Distinct from I-75 (governance-layer protocol-harness, Claude Projects surface) |
| ~~I-61~~ | ~~Cowork Security & Audit Policy Assessment~~ | — | Removed | — | — | Removed 2026-04-26 — superseded by on-prem AI strategy under I-65. Security model shifts from Cowork policy to on-prem corpus governance (alexandria/Tailscale boundary). Retained for numbering continuity. |
| I-62 | R2-D2 REST Bridge — Live Dashboard Data (Server-Side Auth) | Bob (Q2) / Jason (Ph5 arch) | Planned | P5 | Q2 '26 (Phase 5) | Dashboard Access Option D |
| I-63 | ADP Recruiting Transition | Jennifer | Active | P6 | Q2 '26 | |
| ~~I-64~~ | ~~Candidate OSINT & Pre-Hire Intelligence~~ | — | Removed (reclassified) | — | — | Reclassified 2026-04-26 to **WS-11 (Resource Planning)** as ongoing P11 capability rather than bounded initiative. Continues as standing operational capability. RESTRICTED — Gregory (sole CIR approver) / Jennifer (full access). Outputs → P10 (custody) + P6 (go/no-go). Retained for numbering continuity. |
| I-65 | On-Prem AI Suite | Jason | Active | P4 | Q3 '26 | RAG archive + meeting transcription on DGX Spark. Phase 1 in progress. Incorporates `BCG_AI_Config_Architecture_v1.0.docx` (AI Staff Enablement & Guardrail Program) — folded into I-65 scope on 2026-04-18 per Gregory. **v3.1 cleanup (2026-04-26) absorbs:** I-25 (AI Standards & Guardrails — covered by AI Config Architecture), I-26 (Cowork Enablement — superseded by on-prem path), I-47 (pgvector vector storage substrate for RAG), I-61 (Cowork security policy — moot under on-prem corpus governance). |
| I-66 | IT Equipment Inventory | Bob + Victor | Active | P7/P5 | Q2 '26 | Claude Vision → CSV → Odoo Maintenance import. Ph1 in progress |
| I-67 | B-47 Project Info Writer | Greg | On Hold | P4-002 | Q2 '26 | Title block shared parameter blocker. Coordinate with I-71 |
| I-68 | WireGuard VPN Architecture | Bob | Active | P5 | Q2 '26 | Ph1 complete (2026-03-09). Ph2: DNS integration + PSK hardening |
| I-69 | Dashboard / Cloudflare Pages | Greg | Complete | P0 | Q1 '26 | Dashboard v2.27 live at dashboard.bcg-corp.com. Evidence: https://dashboard.bcg-corp.com. **Section 5 Backfill audit verified 2026-04-26** — canonical filing confirmed at `bcgcorp/bcg-ops-claude-projects/dashboard/BCG_Master_Strategic_Plan.html`. |
| I-70 | Client Deliverable Schedule Tracker | Rachel | Active | P8-001 | Operational | 82 projects, 24 campuses, 14 sites. Rachel daily ops, Gregory oversight |
| I-71 | On-Premise AI/Revit Live Integration | Jason | Planned | P4-002 | Q3 '26 | Hard constraint: zero cloud AI on client models. Hard deps: I-65 Ph1, I-22, W-25, Jason onboarded |
| I-72 | Superpowers Methodology Framework | Greg → Jason | Active | P4 | Ph1 complete | Ph1 complete. Ph2/3 scope handed off 2026-04-17 (`handoffs/P4_Handoff_I-72_Superpowers_Methodology_Framework_2026-04-17.md`) |
| I-73 | BCG EasyButton (Idea Capture) — Platform, Governance & Team Rollout | Greg (Ph1) → Jason (Ph2–4) | Active | P4-003 | Ph1 Q2 '26 / Ph2 Q3 '26 / Ph3 Q3–Q4 '26 / Ph4 2027 | Priority: Medium. Transition v3 voice-activated idea capture POC from single-user to governed, BCG-wide tool. 4 phases. Hard deps: Jason active (April 1 ✓), DGX Spark availability for faster-whisper. Soft deps: I-65, Windsurf global_rules.md. Ph3 gated on Ph2 complete — cloud STT is Ph1-only. Related: I-65. Touchpoints: P4 parent, P5 (data-path), P7 (`bcg_ai_rfi` routing), P2/P3/P8 (note routing). W-series registration deferred to Ph3 |
| I-74 | Notification Center Ph A Remediation | Victor | Active | P7 | Q2 '26 | `bcg_notification_center` module. Split from prior I-56 scope on 2026-04-18 (pre-v2.9 status doc 2026-04-15 had mis-labeled I-56). Was P7-004 work pre-consolidation (2026-03-12) |
| **I-75** | **Ecosystem Protocol Harness** | **Greg (Bob backup)** | **Active** | **P0** | **Q2 '26** | **NEW 2026-04-19.** Establishes `standards/protocols/` folder and the protocol-harness pattern (see `standards/protocols/README.md`). Ships four anchor protocols: W-20 v1.2 (migrated from SOP), Initiative_Closure_Verification v1.0 (carved from W-20 v1.1), Initiative_Plan_Discipline v1.0 (formalized from Plan Link Rule + W-20 Trigger 3), Post_Mortem v1.0 (carved from W-20 v1.1 Section 4E + GOV-020). Retires P0-001 subproject. Bumps P0 custom instructions to v1.0 (first formally versioned set). EAB v1.6 → v1.7 (P0-001 removed, P4-003 added, propagation to 18 projects). Registry v3.4 → v3.5. Plan: `standards/migrations/P0-001_Protocol_Harness_Migration_Prompt_2026-04-19.md` (authored during migration session). Distinct from I-60 (Windsurf/Cowork surface); same architectural pattern, different runtime. |
| **I-76** | **Ecosystem Grading Schema Extraction** | **Greg (Bob backup)** | **Planned** | **P0** | **Q2 '26** | **NEW 2026-04-19.** Extracts grading schema from dashboard JS constants (freshness tiers `hot:7/active:14/slow_burn:30`, parity dimensions, integrity checks, scoring functions) into canonical governance doc `standards/BCG_Ecosystem_Grading_Schema.md`. EAB references it; dashboard becomes a rendering of canonical data rather than a source. Unblocks cross-protocol scoring references (W-20 audit, P5 health checks, P9 resilience scoring, P10 compliance audits). Hard dep: I-75 complete (needs protocol data-source registry in `standards/protocols/README.md` Section 8 to register the new doc's slot). Plan: TBD — author during activation. |

### Initiative Status Definitions

| Status | Meaning |
|--------|---------|
| **Active** | In progress, resources assigned. Plan recorded per `Initiative_Plan_Discipline.md`. |
| **Planned** | Approved, not yet started. Requires plan before Active transition. |
| **On Hold** | Paused pending dependency or decision |
| **Complete** | Delivered, verified per `Initiative_Closure_Verification.md` |
| **Removed** | Dropped from catalog (retain row for numbering continuity) |

---

## 3. Workstream Registry

11 active workstreams (WS-01 through WS-11).

| ID | Workstream Name | Owner | Status | Project | Initiatives Covered | Notes |
|----|----------------|-------|--------|---------|-------------------|-------|
| WS-01 | Business Model Definition | Greg | Active | P0/P3 | — | |
| WS-02 | Revenue Forecasting & Risk | Greg | Active | P0/P1 | I-34 | Blocked on D-01 |
| WS-03 | Cash Flow Planning | Greg | Active | P0/P1 | — | Blocked on D-01 |
| WS-04 | Prime Relationship Strategy | Greg | Active | P0/P3 | — | |
| WS-05 | Client Relationship Strategy | Greg | Active | P0/P3 | I-33 | |
| WS-06 | Standardized Pricing Response | Greg | Active | P0/P1/P3/P8 | I-39 | |
| WS-07 | Capture Strategy | Greg | Active | P0/P3/P8 | — | |
| WS-08 | Direct MSA Evaluation | Greg | Active | P0/P3 | — | |
| WS-09 | New Teaming & Diversification | Greg | Active | P0/P3 | I-37 | |
| WS-10 | Efficiency & AI Deployment | Greg/Jason | Active | P0/P4 | I-09, I-22, I-27, I-28, I-43, I-44, I-45, I-46, I-48, I-49, I-51, I-52, I-60, I-65, I-66, I-67, I-71, I-72, I-73, **I-75**, **I-76** | v3.1 cleanup 2026-04-26: removed strikethrough'd I-25, I-26, I-31, I-47 from coverage list (all Removed). I-27 (Complete) retained. |
| WS-11 | Resource Planning | Greg/Jennifer | Active | P0/P6/**P11** | I-03, I-35, I-36, I-40, I-63 + ongoing P11 OSINT capability (formerly I-64, reclassified 2026-04-26) | v3.1: Now includes ongoing P11 standing OSINT capability (RESTRICTED — Gregory sole CIR approver / Jennifer full access). |

---

## 4. Cross-Reference: Initiatives by Project

| Project | Active Initiative Count | Primary IDs |
|---------|-----------------|-----|
| P0 | **5** | I-14 (shared P2), I-42, I-69, **I-75, I-76** |
| P1 | 0 | Consumes WS-02, WS-03, WS-06 |
| P2 | 8 | I-01, I-02, I-10, I-11, I-12, I-13, I-50 (Ph1), I-57 |
| P3 | 9 | I-04, I-16 (shared P6), I-17, I-18, I-19, I-22 (shared P4), I-33, I-34, I-37 |
| P4 | 8 | I-27, I-28, I-43, I-48, I-51, I-60, I-65, I-72 |
| P4-001 | 0 | |
| P4-002 | 7 | I-09, I-44, I-45, I-46, I-49, I-67, I-71 |
| P4-003 | 1 | I-73 |
| P5 | 4 | I-08, I-15, I-62, I-68 |
| P5-001 | 1 | I-38 |
| P5-002 | 0 | |
| P6 | 6 | I-03, I-21, I-35, I-36, I-40, I-63 |
| P7 | 11 | I-05, I-23, I-29, I-52 (shared P4), I-53, I-54, I-55, I-56, I-59, I-66 (shared P5), I-74 |
| P8 | 2 | I-39, I-58 |
| P8-001 | 1 | I-70 |
| P9 | 1 | I-41 |
| P10 | 1 | I-24 (re-homed P6→P10) |
| P11 | 0 | I-64 reclassified to WS-11 (2026-04-26) |

**Total:** 65 active initiative primary-project assignments.

**P0-001 retired.** Triage function absorbed into P0 via protocol-harness pattern (I-75). W-20 v1.2 is the protocol P0 fetches to execute triage runbooks.

---

## 5. Subproject Registry

| ID | Parent | Name | Initiatives | Status | What It Produces |
|----|--------|------|-----------|--------|-----------------|
| P4-001 | P4 | MCP Evaluation & Selection | — | Active | MCP server evaluations, capability matrices |
| P4-002 | P4 | Revit & BIM Automation | I-09, I-44, I-45, I-46, I-49, I-67, I-71 | Active | PyRevit buttons (47-button backlog B-01–B-47 across 10 panels), Dynamo scripts. GitLab: `alexandria.bcg-corp.com/revit/bcg-ops-revit-tools` |
| P4-003 | P4 | BCG EasyButton / Idea Capture | I-73 | Active | Voice-activated idea capture tool: code, governance, beta testing, rollout, ecosystem integration |
| P5-001 | P5 | Network Infrastructure Assessment | I-38 | Planned | Firewall/switch config assessment, gap analysis |
| P5-002 | P5 | Monitoring & Observability Infrastructure | — | Active (Ph1 complete) | Prometheus/Grafana/Loki stack, telemetry |
| P8-001 | P8 | Document Intake & Routing | I-58, I-70 | Active | RFP/CO/PO intake processing, file placement |

**Active subprojects: 6** (down from 7 — P0-001 retired 2026-04-19).

**Retired subprojects (2026-03-12):** P7-001 (Dev Environment & AI Tooling), P7-002 (Platform Audit & Uplift — I-07 re-homed to P7 parent), P7-003 (Odoo 19 Feature Mining), P7-004 (Notification Center & Invoice Request — I-74 now carries Ph A remediation). Knowledge consolidated into P7 parent.

**Retired subprojects (2026-04-19):** P0-001 (Ecosystem Triage & Routing Protocol — function absorbed into P0 via protocol-harness pattern, I-75). Manual archive of Claude project required by Gregory. Retrospective filed at `standards/migrations/P0-001_Retrospective.md`.

---

## 6. Numbering Conventions

- **Initiatives:** I-01 through I-## (sequential, never reuse removed numbers). Next: **I-77**
- **Workstreams:** WS-01 through WS-## (sequential). Next: WS-12
- **Subprojects:** P{#}-{###} (parent project dash three-digit sequence)
- **Removed items:** Keep the row with strikethrough and "Removed" status. Do not renumber.
- **New additions:** Append to the end of the sequence.
- **Retired subprojects:** Remove from Section 5 active registry; list in the retirement block at the end of Section 5 with date, consolidation target, and rationale.

---

## 7. Change Log

| Version | Date | What Changed |
|---------|------|-------------|
| **3.1** | **2026-04-26** | **REALIGNMENT CLEANUP** per Gregory directive. Removed 7 initiatives: I-06 (consolidated → I-54), I-07 (consolidated → I-53), I-25 (folded → I-65), I-26 (superseded by on-prem strategy under I-65), I-31 (Phase 2 delivered by I-48; Phase 5 tracked via D-01), I-47 (folded → I-65 as RAG vector storage), I-61 (superseded by on-prem strategy under I-65). Reclassified I-64 to WS-11 (ongoing P11 capability, not bounded initiative). Status/date refresh: I-23 (On Hold/Q1 → Active/Q2), I-24 (Active/Q1 → Active/Q2), I-29 (On Hold/Q1 → Active/Q2). Status reset: I-02 (Active/Q1 → On Hold/Q4 — paused). Owner update: I-09 (TBD → Gregory interim). WS-10 coverage list cleaned (removed strikethrough'd I-25, I-26, I-31, I-47). WS-11 coverage updated to include reclassified I-64 capability. **Counts: 65 active initiatives** (was 73; -8). 11 total removed: I-06, I-07, I-20, I-25, I-26, I-30, I-31, I-32, I-47, I-61, I-64. Next I-slot unchanged: I-77. |
| **3.0.1** | **2026-04-26** | **I-27 (Windsurf IDE Enablement) closed via Path B** silent-completion exception per `standards/protocols/Initiative_Closure_Verification.md` v1.0. Owner attestation by Gregory: GitLab commit verified at `alexandria.bcg-corp.com/revit/bcg-ops-revit-tools`; Windsurf in active production use across team; I-72 Superpowers v5.0.7 merge (2026-04-17) functional. Status drifted directly `Planned` → `Complete` — exception authorized by Gregory. Original `Depends on I-26` resolved as moot at closure. **I-69 (Dashboard / Cloudflare Pages) Section 5 Backfill audit verified same day** — evidence link `https://dashboard.bcg-corp.com` resolves; canonical filing at `bcgcorp/bcg-ops-claude-projects/dashboard/BCG_Master_Strategic_Plan.html`; verification logged to Ecosystem Status doc per protocol Section 5. Counts unchanged: 73 tracked initiatives. Next I-slot unchanged: I-77. |
| **3.0** | **2026-04-19** | **PROTOCOL-HARNESS ERA BOUNDARY.** Retired P0-001 subproject (triage function absorbed into P0 via protocol-harness pattern). Registered I-75 (Ecosystem Protocol Harness — this migration's deliverable initiative) and I-76 (Ecosystem Grading Schema Extraction — next sprint). Counts: 73 active initiatives, 6 active subprojects, 11 workstreams. Next I-slot: I-77. Ecosystem scope unchanged (P0–P11 + 6 subs). **Note on v2.10:** Governance Doc Registry v3.2 (2026-04-18) forward-referenced a Catalog v2.10 shipping the Plan Link Rule. That standalone v2.10 commit never shipped — the Plan Link Rule was effective via W-20 v1.1 enforcement. v3.0 lands directly from v2.9; Registry v3.5 corrects the tracked version to match. **[Annotation 2026-04-26]:** Registry references in this entry ("v3.2", "v3.5") describe a phantom version sequence — see Registry v1.3 changelog (2026-04-26) for full resolution. The actual Registry file in this repo never tracked v3.x; its real sequence is v1.0 → v1.1 → v1.2 → v1.3 (current). The phantom 'v3.x' framing was an in-narrative artifact that became self-perpetuating across changelog entries. This annotation is the resolution, not a rewrite of historical changelog text. |
| 2.9 | 2026-04-18 | **RECONCILIATION COMMIT.** Reconstructs v1.5–v2.8 into single canonical commit from governance narrative + Gregory working-copy extraction (P0 session 2026-04-18). Added I-49 through I-72 (24 initiatives). Registered I-73 (BCG EasyButton — P4-003 / Greg Ph1 → Jason Ph2–4). Registered I-74 (Notification Center Ph A Remediation — Victor / P7). Registered P4-003 subproject under P4. Folded `BCG_AI_Config_Architecture_v1.0.docx` into I-65 scope. Re-homed I-24 to P10 (was P6). Removed I-30 (superseded by I-48). Retired P7-001–P7-004 (consolidated into P7 on 2026-03-12). Added P0-001, P5-002, P8-001, P4-003 to subproject registry. Updated scope P0–P11. Total: 71 active, 3 removed, 11 WS, 7 active subprojects + 4 retired. Next I-slot: I-75. |
| v1.5–v2.8 | 2026-03-10 to 2026-04-17 | NOT PREVIOUSLY COMMITTED — rolled into v2.9. Working-copy versions existed locally but were never pushed to GitHub. |
| 1.4 | 2026-03-10 | Added I-42–I-48. Updated P4-002 subproject registry. Confirmed B-24, B-25. Total: 46 active, 2 removed, 11 WS, 7 subprojects. |
| 1.3 | 2026-03-05 | I-01 owner corrected. Added I-40, I-41. Added P4-002, P7-001–P7-004. Updated scope P0–P9. |
| 1.2 | 2026-03-01 | Added I-39. Total: 37 active. |
| 1.1 | 2026-03-01 | Populated I-01–I-27 and WS-01–WS-11. Confirmed I-28–I-31. I-32 rejected, I-33–I-37 approved. Added I-38. Registered P4-001, P5-001. Total: 36 active, 2 removed, 11 WS, 2 subprojects. |
| 1.0 | 2026-03-01 | Initial version. Structure and numbering scheme established. |

---

*This document is maintained on GitHub at `bcgcorp/bcg-ops-governance/standards/` per GOV-001. Do not maintain separate copies in individual project knowledge bases.*
