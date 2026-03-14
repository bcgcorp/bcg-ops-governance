# BCG Corp — W-20: Ecosystem Triage & Governance Audit SOP

**Version:** 1.0
**Effective:** March 2026
**Last Updated:** 2026-03-12
**Scope:** P0, P0-001 — applies ecosystem-wide
**Owner:** Gregory Bernardo
**Backup:** Jason Harris (post April 1, 2026)
**Status:** Approved

---

## 1. Purpose

This SOP defines the repeatable intake-process-route cycle for BCG's Claude ecosystem. It governs how updates enter P0, how they are classified and processed, and how they are routed to satellite projects. It also defines the mandatory governance audit performed at each sync cycle.

Without this process, ecosystem updates are ad hoc: initiatives get numbered in isolation (causing collisions), governance docs drift out of sync, decisions age without visibility, and the president becomes the sole routing node. This SOP externalizes that routing logic so it is documented, delegable, and auditable.

---

## 2. Scope

**In scope:**
- Intake and processing of ecosystem updates from any source
- Initiative registration (I-number assignment)
- Subproject creation and retirement
- Satellite handoff generation
- Governance document audit and reconciliation
- OneDrive file hygiene
- Ecosystem health measurement

**Out of scope:**
- Production work within satellites (governed by individual project instructions)
- SOP drafting (governed by W-19 and P2)
- Individual initiative execution

---

## 3. Trigger Types

W-20 activates in three modes. Each has a distinct processing path.

### Trigger 1 — Scheduled Triage (Biweekly Sync)

**When:** Every sync cycle (biweekly, 2-week max cadence per Ecosystem Status header)
**Who:** Gregory (or designated delegate)
**What:** Batch-collect updates accumulated since last sync, process in bulk, route to satellites, run governance audit.

**This is the primary operating mode.** Most ecosystem updates flow through scheduled triage.

### Trigger 2 — Event-Driven (Significant Satellite Update)

**When:** A satellite produces something that crosses project boundaries before the next scheduled sync.
**Who:** Any project owner
**What:** Satellite owner generates a structured update using the Standard Update Template (Section 5), drops it into P0 for processing.

**"Significant" means any of:**
- A new blocker that affects another project
- A completed deliverable that another project is waiting on
- A dependency shift (timeline change, owner change, scope change)
- A decision that affects multiple workstreams
- A security or compliance finding that requires immediate action

**Does NOT mean:** Routine task completion, minor progress within a single project, questions that can wait for next sync.

### Trigger 3 — Structural (New Initiative, Subproject, or Priority Change)

**When:** Someone proposes a new I-number, a new subproject, or wants to reprioritize an existing initiative.
**Who:** Gregory (approval required for all structural changes)
**What:** Full intake processing with governance doc updates, downstream handoffs, and catalog commits.

**Required information before P0 will process a structural change:**
- Initiative name and description
- Proposed owner
- Parent project (P1–P9)
- Dependencies (upstream and downstream)
- Target timeline
- Any decisions required before work begins

Incomplete structural requests are returned to the requestor for completion.

---

## 4. Processing Checklists

### 4A — Scheduled Triage Checklist (Biweekly)

Run these steps in order during every sync cycle.

**Phase 1 — Collect (~5 min)**

- [ ] Gather all updates accumulated since last sync (P0 chats, handoff prompts, team communications)
- [ ] Classify each item: Routine (stays in satellite), Significant (structured update to P0), Structural (full intake processing)
- [ ] List all items before processing — do not start routing until the full batch is visible

**Phase 2 — Process (~15–30 min depending on volume)**

- [ ] Resolve any I-number or naming conflicts across incoming items
- [ ] For structural items: fetch Initiative Catalog from GitHub, confirm next available slot, assign I-numbers sequentially
- [ ] For each new initiative: validate required information is complete (Section 3, Trigger 3 requirements)
- [ ] Surface all decisions requiring Gregory resolution — present as a decision batch with recommendations
- [ ] Cross-reference dependencies: does any new item affect an existing initiative's timeline or status?
- [ ] Check for cross-project implications: does any update need to be flagged for a satellite that didn't originate it?
- [ ] Update team load snapshot — flag anyone with >8 concurrent active items

**Phase 3 — Route (~15 min)**

- [ ] Generate satellite handoff prompts for every affected project using standard [FROM: P0] label format
- [ ] Generate Ecosystem Status wholesale replacement file (version bump, date update)
- [ ] Commit Initiative Catalog updates to GitHub
- [ ] If EAB changes are required (new/retired subprojects, project count change): update EAB, commit, and propagate
- [ ] Deliver handoff prompts to satellite projects
- [ ] Upload new Ecosystem Status to P0 KB (replace old version)

**Phase 4 — Governance Audit (~10 min)**

Run the Tier 1 Governance Audit (Section 6A) as the final step of every sync.

### 4B — Event-Driven Processing Checklist

- [ ] Receive structured update from satellite (Standard Update Template, Section 5)
- [ ] Classify: does this require immediate routing, or can it wait for next scheduled sync?
- [ ] If immediate: process the single update through Phase 2 and Phase 3 steps above (scoped to this item only)
- [ ] If deferrable: log in P0 for next scheduled triage batch
- [ ] In either case: do NOT run the full governance audit — that stays on the biweekly cycle

### 4C — Structural Change Processing Checklist

- [ ] Validate all required information is present (Section 3, Trigger 3)
- [ ] If incomplete: return to requestor with specific gaps identified
- [ ] Fetch Initiative Catalog from GitHub, confirm next available slot
- [ ] Assign I-number (or subproject ID)
- [ ] Update Initiative Catalog — commit to GitHub
- [ ] Update Ecosystem Status
- [ ] If subproject: update EAB and propagate to all projects
- [ ] Generate handoff prompts for affected satellites
- [ ] If decisions are required: surface to Gregory with recommendations before routing

---

## 5. Standard Update Template

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

---

## 6. Governance Audit Framework

Four tiers of increasing depth. Tier 1 runs every sync. Tiers 2-4 run on defined cadences.

### 6A — Tier 1: Every Sync (Biweekly, ~10 min)

Mandatory. Run as Phase 4 of every scheduled triage.

**GitHub standards/ Folder Reconciliation:**
- [ ] Fetch Governance Doc Registry from GitHub
- [ ] Compare registry Section 3 entries against actual files in `standards/`
- [ ] Flag: any file in folder not in registry (unregistered)
- [ ] Flag: any file in registry not in folder (missing)
- [ ] Flag: any file with "Last Updated" >30 days ago on active topics (stale)

**Document Integrity Checks:**
- [ ] Initiative Catalog: header count matches actual rows minus removed entries
- [ ] Initiative Catalog: next available slot = last entry + 1 (prevents collision)
- [ ] EAB: propagation tracker shows all projects on current version
- [ ] Ecosystem Status: version and date match the most recent sync

**Decision Queue Freshness:**
- [ ] Any decision open >14 days with no movement? Flag with [STALE DECISION] tag
- [ ] Any decision open >30 days? Escalate to top of next sync agenda

**OneDrive Archive Sync:**
- [ ] Were any governance docs updated in GitHub this cycle?
- [ ] If yes: is the OneDrive archive copy in Corp/AI/Standards/ also updated?
- [ ] Flag any GitHub/OneDrive version mismatch

### 6B — Tier 2: Monthly (~20 min)

Run on the first sync of each calendar month, in addition to Tier 1.

**Cross-Document Consistency:**
- [ ] Spot-check one fact across five docs (project count, team size, initiative count): Ecosystem Status, Team Directory, EAB, Initiative Catalog, P0 instructions. If any disagree, a propagation was missed.

**Owner-Assignment Audit:**
- [ ] Scan catalog for any Active initiative with TBD/blank owner
- [ ] Scan catalog for any Planned initiative targeting current quarter with TBD/blank owner
- [ ] Flag unowned items for Gregory assignment

**Team Load Check:**
- [ ] Count items assigned to each person across Initiative Catalog and Ecosystem Status
- [ ] Flag anyone with >8 concurrent active items
- [ ] Flag anyone with >3 items on their immediate action list

**Stale Initiative Detection:**
- [ ] Any initiative marked Active with no mention in any project's current work section in Ecosystem Status?
- [ ] Any initiative with status unchanged for >30 days?
- [ ] Flag with [STALE INITIATIVE] tag and surface at next sync

**Subproject Justification Review:**
- [ ] For each active subproject: is it still producing distinct value vs. parent project?
- [ ] Any subproject with no activity in 30 days? Flag for retirement consideration.

**Governance Doc Fetch Test:**
- [ ] Pick 2-3 governance docs at random
- [ ] Actually fetch them via raw GitHub URL
- [ ] Confirm: URL works, content is current version, no 404
- [ ] If any fail: investigate immediately (CDN issue, filename mismatch, or file deleted)

**OneDrive Outputs Hygiene:**
- [ ] Check Corp/AI/Outputs/ — any DRAFT files older than 30 days that were never approved?
- [ ] Flag for Gregory: approve, supersede, or delete
- [ ] Check Corp/AI/Tools/UI-Library/ — any artifacts more than 2 versions behind current? Any containing Tier 1/2 data?

### 6C — Tier 3: Quarterly (~45 min)

Run in the first sync after each quarter boundary (April 1, July 1, October 1, January 1), in addition to Tiers 1 and 2.

**Initiative Velocity:**
- [ ] Count initiatives that moved Planned → Active → Complete this quarter
- [ ] Count initiatives added this quarter
- [ ] If additions > completions: backlog is growing — flag for strategic discussion
- [ ] Record: completions, additions, net change

**Gregory Bottleneck Index:**
- [ ] Count initiatives where Gregory is sole owner
- [ ] Count decisions where Gregory is sole approver
- [ ] Count approvals pending Gregory with no backup designated
- [ ] Calculate: (Gregory-sole items) / (total active items) = bottleneck ratio
- [ ] Target: <40%. Red flag: >60%.

**Dependency Chain Audit:**
- [ ] Map all active dependency chains (A gates B gates C)
- [ ] Flag any chain longer than 3 links — these are fragile
- [ ] Confirm each link has a named owner and a target date

**Team Coverage Gap (Build to Sell Test):**
- [ ] For each satellite project: if the owner is unavailable for 2 weeks, can someone else keep it moving?
- [ ] For each critical initiative: is there a named backup?
- [ ] Flag gaps as P9 risks

**SOP Progress Ratio:**
- [ ] Count: Approved SOPs / Total registered W-series
- [ ] Record: progress since last quarter
- [ ] If ratio declined or stalled: flag for P2 sync

**Governance Doc Quality Audit:**
- [ ] Pick 2-3 governance docs
- [ ] Run W-19 Mode 2 (Periodic Audit) against them: are they producing good outputs when fetched by projects?
- [ ] Flag any doc that is being fetched but routinely ignored or misapplied

**Ecosystem Performance Assessment:**
- [ ] Run the full BCG_Ecosystem_Performance_Assessment_Prompt.md
- [ ] Record scorecard results
- [ ] Compare against prior quarter

**OneDrive/GitHub Full Reconciliation:**
- [ ] For every file in Corp/AI/Standards/: does it have a GitHub counterpart?
- [ ] Is the OneDrive version older than GitHub?
- [ ] Should the OneDrive copy be deleted per GOV-001?
- [ ] Goal: prevent anyone from treating OneDrive as source of truth

### 6D — Tier 4: Annual or Trigger-Based

Not on a fixed schedule. Run when conditions warrant.

**Triggers:**
- Any governance doc reaches v3.0+ or 12 months old → full rewrite audit
- Project count exceeds 20 → project retirement review
- Any project has zero activity for 90 days → retirement candidate
- Major strategic shift (new service line, acquisition, key hire) → full ecosystem reassessment

---

## 7. Ecosystem Health Metrics

Track these over time. Record at each quarterly audit (Tier 3). Trend direction matters more than absolute numbers.

| Metric | Target | Yellow Flag | Red Flag | Record Frequency |
|--------|--------|-------------|----------|-----------------|
| Governance doc average age | <30 days since last update | Any doc >45 days on active topics | Any doc >60 days | Quarterly |
| Initiative completion velocity | ≥3 per quarter to Complete | 1-2 completions | 0 completions | Quarterly |
| Decision queue depth | ≤5 open at any time | 6-8 open | >10 open | Every sync |
| Decision aging (average) | <7 days open | 7-14 days | >14 days average | Every sync |
| Gregory bottleneck ratio | <40% | 40-60% | >60% | Quarterly |
| EAB propagation lag | 0 (all current) | 1 project behind | >1 behind | Every sync |
| Bob concurrent items | ≤8 | 9-10 | >12 | Monthly |
| SOP approved ratio | Improving each quarter | Stalled | Declining | Quarterly |
| Initiative backlog net change | Stable or shrinking | Growing by 1-5 | Growing by >5 | Quarterly |
| Subproject count vs. value | Each producing distinct output | Any idle >30 days | Any idle >60 days | Monthly |

---

## 8. Roles

| Role | Responsibility |
|------|---------------|
| **Gregory Bernardo** | Runs scheduled triage, makes all structural decisions, approves governance doc changes, owns this SOP |
| **Jason Harris (post April 1)** | Backup triage operator, Phase 4 build work owner, can run Tier 1 audit independently |
| **Satellite project owners** | Generate Standard Update Templates for significant events, maintain their project's current state |
| **P0 (Claude)** | Executes the processing and routing steps, generates handoff prompts, produces Ecosystem Status files, runs audit checklists |

---

## 9. Cadence Summary

| Activity | Frequency | Estimated Time | Owner |
|----------|-----------|---------------|-------|
| Scheduled Triage (Phases 1-3) | Biweekly | 45-90 min | Gregory |
| Tier 1 Governance Audit (Phase 4) | Every sync | 10 min | Gregory / P0 |
| Tier 2 Monthly Deep Check | First sync of month | +20 min | Gregory / P0 |
| Tier 3 Quarterly Assessment | First sync after quarter | +45 min | Gregory / P0 |
| Tier 4 Trigger-Based | As needed | Variable | Gregory |
| Event-Driven Processing | As received | 10-20 min per event | Gregory |
| Structural Change Processing | As proposed | 15-30 min per change | Gregory |

---

## 10. Dependencies

| Dependency | Relationship |
|------------|-------------|
| W-19 (Chat Quality Evaluation SOP) | Mode 2 used in Tier 3 quarterly governance doc quality audit |
| Initiative Catalog (GitHub) | Fetched at every structural change and every sync |
| Governance Doc Registry (GitHub) | Fetched at every Tier 1 audit |
| Ecosystem Status (P0 KB) | Replaced wholesale at every sync |
| EAB (GitHub) | Updated and propagated when structural changes affect project/subproject count |

---

## 11. Revision History

| Version | Date | What Changed |
|---------|------|-------------|
| 1.0 | 2026-03-14 | Initial version. Codified from P0 consolidation sprint session (2026-03-12). Three trigger types, four processing checklists, four audit tiers, health metrics dashboard, standard update template. |

---

*W-20: Ecosystem Triage & Governance Audit SOP*
*Owner: Gregory Bernardo | Parent: P0-001 (Ecosystem Triage & Routing Protocol)*
*Store in GitHub at bcg-ops-governance/standards/ *
