# BCG Corp — W-20: Ecosystem Triage Protocol

**Protocol ID:** W-20
**Version:** 1.2
**Compatible Wrappers:** P0 v≥1.0
**Trigger Keywords:** `triage now` | `run reconciliation` | `audit tier 1` | any user message containing a `[FROM: P{#}` header (Standard Update Template)
**Last Updated:** 2026-04-19
**Owner:** Gregory Bernardo, President
**Backup Operator:** Bob Brezniak
**Status:** Approved

**What Changed (v1.2):** Carved three embedded disciplines out to standalone protocols in the same folder. Removed Trigger 4 (Completion), Checklist 4D (Completion Verification), and Section 4E (Ecosystem Failure Response) — now live in `Initiative_Closure_Verification.md` and `Post_Mortem.md` respectively. Removed Plan Link language from Trigger 3 — now lives in `Initiative_Plan_Discipline.md`. Cross-references added in Section 6. File relocated from `standards/BCG_W20_Ecosystem_Triage_SOP.md` to `standards/protocols/W-20_Ecosystem_Triage.md`. Old path serves a redirect stub (90-day sunset, deletion scheduled 2026-07-18). Runbooks rewritten in imperative voice with explicit step-level halt conditions. Backup operator changed from Jason Harris to Bob Brezniak (long-term strategy). Added Section 5 — Halt Conditions Consolidated Reference.

---

## 1. Purpose

This protocol defines the repeatable intake-process-route cycle for BCG's Claude ecosystem. It governs how updates enter P0, how they are classified and processed, and how they are routed to satellite projects. It also defines the mandatory governance audit performed at each sync cycle.

Without this process, ecosystem updates are ad hoc: initiatives get numbered in isolation (causing collisions), governance docs drift out of sync, decisions age without visibility, and the president becomes the sole routing node. This protocol externalizes that routing logic so it is documented, delegable, and auditable.

**In scope:** intake and processing of ecosystem updates, initiative registration (I-number assignment), subproject creation and retirement, satellite handoff generation, governance document audit and reconciliation, OneDrive file hygiene, ecosystem health measurement.

**Out of scope:** production work within satellites (governed by individual project instructions), SOP drafting (governed by W-19 and P2), individual initiative execution, completion verification (now governed by `Initiative_Closure_Verification.md`), plan-before-active enforcement (now governed by `Initiative_Plan_Discipline.md`), post-mortem process (now governed by `Post_Mortem.md`).

---

## 2. Pre-Execution Fetch Requirements

Before any runbook executes, fetch the following. Halt on any failure — do not operate from memory.

| Document | Path | Halt Condition |
|----------|------|----------------|
| Initiative & Workstream Catalog | `standards/BCG_Initiative_and_Workstream_Catalog.md` | Fetch fails → report URL and error, halt. Version older than wrapper's last recorded version → flag drift, halt. |
| Governance Doc Registry | `standards/BCG_Governance_Doc_Registry.md` | Fetch fails → halt. |
| Ecosystem Awareness Block (EAB) | `standards/BCG_Ecosystem_Awareness_Block.md` | Fetch fails → halt (needed for project registry and routing). |
| Team Directory | `standards/BCG_Team_Directory.md` | Fetch fails → proceed with caveat flag; roles may be stale. |

**Forbidden fallback:** Do not substitute memory for any of the above. Catalog in particular has a history of multi-version drift between sessions.

---

## 3. Trigger Types

W-20 activates in three modes. Each has a distinct processing path.

### Trigger 1 — Scheduled Triage (Biweekly Sync)

Batch-collect updates accumulated since last sync, process in bulk, route to satellites, run governance audit. **This is the primary operating mode.** Most ecosystem updates flow through scheduled triage.

**Invoked by:** keyword `triage now` or scheduled cadence.
**Who runs it:** Gregory (or Bob as backup).

### Trigger 2 — Event-Driven (Significant Satellite Update)

A satellite produces something that crosses project boundaries before the next scheduled sync. Satellite owner generates a Standard Update (Section 4) and drops it into P0 for processing.

**Invoked by:** `[FROM: P{#}` header in an incoming user message.
**Who runs it:** Any project owner submits; Gregory (or Bob) processes.

**"Significant" means any of:** a new blocker affecting another project; a completed deliverable another project is waiting on; a dependency shift; a decision affecting multiple workstreams; a security or compliance finding requiring immediate action.

**Does NOT mean:** routine task completion, minor intra-project progress, questions that can wait for next sync.

### Trigger 3 — Structural (New Initiative, Subproject, or Priority Change)

Someone proposes a new I-number, a new subproject, or wants to reprioritize an existing initiative.

**Invoked by:** structural-change request inside `[FROM: P{#}` update or directly in P0.
**Who runs it:** Gregory — approval required for all structural changes.

**Required information before P0 processes a structural change:** initiative name and description; proposed owner; parent project (P0–P11); dependencies (upstream and downstream); target timeline; any decisions required before work begins.

**Planned → Active transitions** are governed by `Initiative_Plan_Discipline.md` — Trigger 3 registers the initiative; Plan Discipline gates its activation.

Incomplete structural requests are returned to the requestor for completion.

---

## 4. Execution Runbooks

### 4A — Scheduled Triage Runbook (Biweekly)

Execute in order. Halt on any step failure and report to Gregory.

**Phase 1 — Collect (~5 min)**

1. Gather all updates accumulated since the last sync (P0 chats, handoff prompts, team communications).
   - *Halt if batch is empty and a sync is overdue by more than 14 days → confirm with Gregory whether to skip the cycle or run governance audit only.*
2. Classify each item: **Routine** (stays in satellite), **Significant** (structured update to P0 per Trigger 2), **Structural** (full intake processing per Trigger 3), **Completion** (hand to `Initiative_Closure_Verification.md`), **Activation** (hand to `Initiative_Plan_Discipline.md`).
   - *Halt if any item is ambiguous → present to Gregory with classification recommendation; do not proceed on guess.*
3. List the full batch before processing begins. Do not route or commit until the complete batch is visible.

**Phase 2 — Process (~15–30 min depending on volume)**

4. Resolve any I-number or naming conflicts across incoming items.
   - *Halt if two items claim the same I-number → surface both to Gregory with recommended resolution.*
5. For structural items: confirm the next available I-slot from the freshly fetched Catalog. Assign I-numbers sequentially starting from that slot.
   - *Halt if Catalog fetch returns content older than the last recorded version → flag drift; do not assign from memory.*
6. For each new initiative: validate required information is complete (Section 3, Trigger 3 requirements).
   - *Halt if required info is missing → bounce request back to originator with gap list.*
7. For each proposed Planned → Active transition: invoke `Initiative_Plan_Discipline.md`.
8. For each proposed Active → Complete transition: invoke `Initiative_Closure_Verification.md`.
9. Surface all decisions requiring Gregory resolution as a decision batch with recommendations.
10. Cross-reference dependencies: for each new item, identify any existing initiative whose timeline or status is affected.
11. Check cross-project implications: for each update, identify any satellite that did not originate it but is impacted.
12. Update team load snapshot. Flag anyone with more than 8 concurrent active items.

**Phase 3 — Route (~15 min)**

13. Generate satellite handoff prompts for every affected project using the `[FROM: P0]` label format.
14. Generate the Ecosystem Status wholesale replacement file (version bump, date update).
15. Commit Initiative Catalog updates to GitHub.
    - *Halt if commit fails → report error; do not retry without confirming current SHA.*
16. If EAB changes are required (new/retired subprojects, project count change): update EAB, commit, and flag propagation to all satellite projects.
17. Deliver handoff prompts to satellite projects.
18. Upload new Ecosystem Status to P0 project knowledge (replace old version).

**Phase 4 — Governance Audit (~10 min)**

19. Run the Tier 1 Governance Audit (Section 4D) as the final step of every sync.

### 4B — Event-Driven Runbook

Execute when a `[FROM: P{#}` header is detected.

1. Receive structured update from satellite using the Standard Update Template (Section 4E).
   - *Halt if the update lacks required fields → bounce back to originator with field list.*
2. Classify urgency: does this require immediate routing, or can it wait for next scheduled sync?
3. **If immediate:** execute Phase 2 and Phase 3 of the Scheduled Triage runbook scoped to this single item only.
4. **If deferrable:** log in P0 for next scheduled triage batch; acknowledge receipt to originator.
5. In either case, do NOT run the full governance audit — that stays on the biweekly cycle.

### 4C — Structural Change Runbook

Execute when a new I-number, subproject, or re-prioritization is proposed.

1. Validate all required information is present per Section 3 Trigger 3.
   - *Halt if incomplete → return to requestor with specific gaps identified.*
2. Fetch Initiative Catalog from GitHub. Confirm the next available slot.
   - *Halt if fetch fails → report error; do not assign from memory.*
3. Assign I-number (or subproject ID) from the next available slot.
4. Update Initiative Catalog; commit to GitHub.
    - *Halt if commit fails → report error.*
5. Update Ecosystem Status.
6. If the change adds or retires a subproject: update EAB and flag propagation.
7. Generate handoff prompts for affected satellites.
8. If the change proposes Planned → Active: invoke `Initiative_Plan_Discipline.md` before marking Active.
9. If decisions are required: surface to Gregory with recommendations before routing.

### 4D — Tier 1 Governance Audit (Every Sync, ~10 min)

Mandatory. Run as Phase 4 of every scheduled triage.

**GitHub standards/ Folder Reconciliation**

1. Fetch Governance Doc Registry.
2. Compare registry Section 3 entries against actual files in `standards/` and `standards/protocols/`.
3. Flag any file in folder not in registry (unregistered).
4. Flag any file in registry not in folder (missing — 404 on fetch).
5. Flag any file with "Last Updated" more than 30 days ago on active topics (stale).

**Document Integrity Checks**

6. Initiative Catalog: header "total active" count matches actual rows minus removed entries.
7. Initiative Catalog: next-available-slot = last active + 1 (prevents collision).
8. EAB: propagation tracker shows all projects on current version.
9. Ecosystem Status: version and date match the most recent sync.

**Decision Queue Freshness**

10. Any decision open more than 14 days with no movement → flag with `[STALE DECISION]` tag.
11. Any decision open more than 30 days → escalate to top of next sync agenda.

**OneDrive Archive Sync**

12. If any governance docs were updated in GitHub this cycle, confirm the OneDrive archive copy in `Corp/AI/Standards/` is also updated.
13. Flag any GitHub/OneDrive version mismatch.

### 4E — Standard Update Template

Any satellite project sending a significant update to P0 uses this format:

```
[FROM: P{#} — {project name}] [DATE: {YYYY-MM-DD}] [TOPIC: {brief}]

UPDATE TYPE: [ ] Blocker  [ ] Deliverable Complete  [ ] Dependency Shift
             [ ] Decision Impact  [ ] Security/Compliance  [ ] Other

AFFECTED INITIATIVES: {I-numbers}
AFFECTED PROJECTS: {P-numbers beyond the originating project}

DECISION NEEDED FROM GREGORY: [ ] Yes  [ ] No
If yes: {specific question with recommended answer}

BLOCKER: [ ] Yes  [ ] No
If yes: {what is blocked and what unblocks it}

GOVERNANCE DOCS IMPACTED: [ ] None  [ ] Initiative Catalog  [ ] Ecosystem Status
                          [ ] Team Directory  [ ] Infrastructure Inventory
                          [ ] EAB  [ ] Other: {specify}

SUMMARY:
{2-5 sentences describing the update, what changed, and what P0 needs to do}
```

Completion requests are NOT submitted via this template. Use `close I-{number}` to invoke `Initiative_Closure_Verification.md` directly.

---

## 4F — Tier 2 / 3 / 4 Audits (Extended Cadence)

Longer-horizon audits. Tier 1 runs every sync; these run on the cadences below.

### Tier 2 — Monthly (~20 min)

Run on the first sync of each calendar month, in addition to Tier 1.

1. **Cross-Document Consistency** — spot-check one fact across five docs (project count, team size, initiative count): Ecosystem Status, Team Directory, EAB, Initiative Catalog, P0 instructions. If any disagree, a propagation was missed.
2. **Owner-Assignment Audit** — scan Catalog for any Active initiative with TBD/blank owner; same for Planned in current quarter.
3. **Team Load Check** — count items per person; flag more than 8 concurrent active or more than 3 on immediate action list.
4. **Stale Initiative Detection** — flag any Active with no mention in current Ecosystem Status, or status unchanged more than 30 days.
5. **Completion Verification Sweep** — pick one initiative marked Complete since last monthly audit. Confirm evidence link resolves and matches scope. (See `Initiative_Closure_Verification.md` Section 5 for audit protocol.)
6. **Plan Link Backfill Sweep** — pick 2–3 Active initiatives with `Plan: TBD` entries. Work with owner to document plan. (See `Initiative_Plan_Discipline.md` Section 5.)
7. **Post-Mortem Review** — confirm each post-mortem filed this month produced a committed permanent rule change. (See `Post_Mortem.md` Section 5.)
8. **Subproject Justification Review** — is each active subproject still producing distinct value vs. parent? Flag any idle more than 30 days.
9. **Governance Doc Fetch Test** — pick 2–3 governance docs at random. Actually fetch them via github-write:get_file_contents. Confirm fetch works, content is current version, no 404.
10. **OneDrive Outputs Hygiene** — flag DRAFT files older than 30 days never approved; flag UI-Library artifacts more than 2 versions behind.

### Tier 3 — Quarterly (~45 min)

Run in the first sync after each quarter boundary (April 1, July 1, October 1, January 1), in addition to Tiers 1 and 2.

1. **Initiative Velocity** — count Planned → Active → Complete transitions this quarter. Count additions. If additions exceed completions, backlog is growing — flag for strategic discussion.
2. **Gregory Bottleneck Index** — count initiatives where Gregory is sole owner; decisions where Gregory is sole approver; approvals pending Gregory with no backup designated. Target bottleneck ratio <40%; red flag >60%.
3. **Dependency Chain Audit** — map all active chains. Flag any chain longer than 3 links — these are fragile.
4. **Team Coverage Gap (Build-to-Sell Test)** — if each project's owner is unavailable for 2 weeks, can someone keep it moving? Flag gaps as P9 risks.
5. **SOP Progress Ratio** — count Approved SOPs / Total registered W-series. Flag declined or stalled.
6. **Post-Mortem Pattern Detection** — three or more post-mortems in a quarter on the same governance surface → trigger Tier 4 structural review of that surface.
7. **Governance Doc Quality Audit** — run W-19 Mode 2 (Periodic Audit) against 2–3 governance docs.
8. **Ecosystem Performance Assessment** — run the full `BCG_Ecosystem_Performance_Assessment_Prompt.md`. Record scorecard. Compare to prior quarter.
9. **OneDrive/GitHub Full Reconciliation** — for every file in `Corp/AI/Standards/`: does it have a GitHub counterpart? Is OneDrive older? Should the OneDrive copy be deleted per GOV-001?

### Tier 4 — Annual or Trigger-Based

Not on a fixed schedule. Run when conditions warrant.

Triggers include: governance doc reaching v3.0+ or 12 months old; project count exceeding 20; any project zero activity for 90 days; major strategic shift; three or more post-mortems in a quarter on the same governance surface.

---

## 5. Halt Conditions — Consolidated Reference

| Condition | Trigger | Required Report | Forbidden Fallback |
|---|---|---|---|
| Catalog fetch fails | Any runbook step that reads Catalog | Report URL and error to Gregory | Do not operate from memory; do not assign I-numbers from prior session context |
| Catalog version older than wrapper's last recorded | Version check on fetch | Flag `[GOVERNANCE DRIFT DETECTED]` | Do not proceed — resolve drift first |
| EAB fetch fails | Routing or project-registry-dependent step | Report error | Do not attempt routing from memory |
| Governance Doc Registry fetch fails | Tier 1 Governance Audit | Report error | Do not skip audit; reschedule sync |
| Batch contains ambiguous classification | Phase 1 Step 2 | Present to Gregory with recommendation | Do not proceed on guess |
| I-number collision between batch items | Phase 2 Step 4 | Surface both items with resolution options | Do not assign both to the same number |
| Required info missing on structural request | Phase 2 Step 6 | Return to originator with gap list | Do not process with gaps |
| GitHub commit fails | Phase 3 Step 15 / 4C Step 4 | Report error; confirm current SHA before retry | Do not retry on stale SHA |
| Standard Update Template missing fields | Runbook 4B Step 1 | Bounce back to originator with field list | Do not process incomplete update |
| Overdue sync with empty batch | Phase 1 Step 1 | Confirm with Gregory: skip cycle or audit-only? | Do not silently skip |
| Tier 2/3 audit finds stale doc | Audit step | Flag with `[STALE]` tag and escalate | Do not auto-bump version without review |

---

## 6. Relationship to Other Governance

| Document | Relationship |
|---|---|
| `Initiative_Closure_Verification.md` | Invoked from W-20 Phase 2 Step 8 (Completion classification). Handles Active → Complete gate. W-20 does not duplicate its content. |
| `Initiative_Plan_Discipline.md` | Invoked from W-20 Phase 2 Step 7 (Activation classification) and from Structural Change Runbook Step 8. Handles Planned → Active gate. |
| `Post_Mortem.md` | Invoked when an ecosystem-level failure is observed. Runs independently of W-20 runbooks; its outputs are reviewed in W-20 Tier 2 (Step 7) and Tier 3 (Step 6). |
| `standards/protocols/resources/Post_Mortem_Template.md` | Template used by the Post-Mortem protocol. Not directly referenced by W-20. |
| `standards/BCG_Project_Ecosystem_and_Handoffs.md` | Source of truth for handoff label format and satellite routing rules. W-20 references; does not duplicate. |
| `standards/BCG_Ecosystem_Awareness_Block.md` | Source of truth for project registry and subproject list. W-20 fetches. |
| `standards/BCG_Initiative_and_Workstream_Catalog.md` | Source of truth for I-numbers and workstreams. W-20 fetches and commits to. |
| `standards/BCG_Governance_Doc_Registry.md` | Source of truth for governance doc inventory. W-20 fetches for Tier 1 audit. |
| `standards/BCG_Artifact_Naming_and_Capture_Standard.md` | Referenced by closure verification (indirectly, via the Closure Verification protocol). |
| W-19 Chat Quality Evaluation SOP | Mode 2 invoked from Tier 3 governance doc quality audit. |

---

## 7. Ecosystem Health Metrics

Track over time. Record at each quarterly audit (Tier 3). Trend direction matters more than absolute numbers.

| Metric | Target | Yellow Flag | Red Flag | Record |
|--------|--------|-------------|----------|--------|
| Governance doc average age | <30 days since last update on active topics | Any doc >45 days | Any doc >60 days | Quarterly |
| Initiative completion velocity | ≥3 per quarter to Complete | 1–2 completions | 0 completions | Quarterly |
| Completion evidence integrity | 100% Complete items have resolving evidence links | 1 broken link | >1 broken link | Monthly (Tier 2) — see `Initiative_Closure_Verification.md` |
| Plan link coverage | 100% Active items have plan links | 1–3 TBD entries | >3 TBD for >30 days | Monthly (Tier 2) — see `Initiative_Plan_Discipline.md` |
| Decision queue depth | ≤5 open | 6–8 open | >10 open | Every sync |
| Decision aging (avg) | <7 days | 7–14 days | >14 days avg | Every sync |
| Gregory bottleneck ratio | <40% | 40–60% | >60% | Quarterly |
| EAB propagation lag | 0 | 1 project behind | >1 behind | Every sync |
| Post-mortems filed | All eligible failures produce one | One skipped | Repeated failure type with no PM | Quarterly — see `Post_Mortem.md` |
| Bob concurrent items | ≤8 | 9–10 | >12 | Monthly |
| SOP approved ratio | Improving each quarter | Stalled | Declining | Quarterly |
| Initiative backlog net change | Stable or shrinking | Growing 1–5 | Growing >5 | Quarterly |
| Subproject count vs. value | Each producing distinct output | Any idle >30 days | Any idle >60 days | Monthly |

---

## 8. Roles

| Role | Responsibility |
|------|---------------|
| **Gregory Bernardo** | Runs scheduled triage. Makes all structural decisions. Approves governance doc changes. Approves completion transitions (via Closure Verification protocol). Owns this protocol. |
| **Bob Brezniak (backup operator)** | Runs scheduled triage when Gregory unavailable. Can run Tier 1 audit independently. Authorized to assign I-numbers for routine structural changes; structural decisions affecting scope escalate back to Gregory. |
| **Satellite project owners** | Generate Standard Update Templates for significant events. Initiate completion verification requests with evidence links (via `close I-{number}`). Maintain their project's current state. |
| **P0 (Claude wrapper)** | Executes runbooks. Generates handoff prompts. Produces Ecosystem Status files. Runs audit checklists. Invokes companion protocols on matching triggers. |

---

## 9. Cadence Summary

| Activity | Frequency | Estimated Time | Owner |
|----------|-----------|---------------|-------|
| Scheduled Triage (Phases 1–3) | Biweekly | 45–90 min | Gregory (or Bob) |
| Tier 1 Governance Audit (Phase 4) | Every sync | 10 min | Gregory / Bob / P0 |
| Tier 2 Monthly Deep Check | First sync of month | +20 min | Gregory / Bob / P0 |
| Tier 3 Quarterly Assessment | First sync after quarter | +45 min | Gregory / Bob / P0 |
| Tier 4 Trigger-Based | As needed | Variable | Gregory |
| Event-Driven Processing | As received | 10–20 min per event | Gregory (or Bob) |
| Structural Change Processing | As proposed | 15–30 min per change | Gregory |

Completion Verification and Plan Discipline cadences are governed by their respective protocols.

---

## 10. Revision History

| Version | Date | What Changed |
|---------|------|-------------|
| 1.2 | 2026-04-19 | Migration commit. Relocated from `standards/BCG_W20_Ecosystem_Triage_SOP.md` to `standards/protocols/W-20_Ecosystem_Triage.md`. Carved three embedded disciplines out to standalone protocols: Initiative Closure Verification (was Trigger 4 + Checklist 4D), Initiative Plan Discipline (was Trigger 3 plan-reference language + Catalog Plan Link Rule), Post-Mortem (was Section 4E + Post-Mortem Review cadence entries). Runbooks rewritten in imperative voice with step-level halt conditions. Added Section 5 — Halt Conditions Consolidated Reference. Backup operator changed Jason Harris → Bob Brezniak (long-term strategy). Metrics Section 7 retains summary rows with cross-references to companion protocols for enforcement. Content carved out was relocated, not deleted — content fidelity preserved. |
| 1.1 | 2026-04-18 | Added Trigger 4 (Completion) and Checklist 4D (Completion Verification). Added Section 4E (Ecosystem Failure Response — post-mortem initiation). Added Completion Verification Sweep and Plan Link Backfill Sweep to Tier 2. Added Post-Mortem Review to Tier 3. Added three metrics. Derived from I-72 Superpowers methodology port: verification-before-completion and systematic-debugging patterns adapted to governance. |
| 1.0 | 2026-03-14 | Initial version. Codified from P0 consolidation sprint 2026-03-12. Three trigger types, four processing checklists, four audit tiers, health metrics dashboard, Standard Update Template. |

---

*W-20: Ecosystem Triage Protocol*
*Owner: Gregory Bernardo | Parent wrapper: P0 (Master Strategic Plan)*
*Store in GitHub at bcg-ops-governance/standards/protocols/*
