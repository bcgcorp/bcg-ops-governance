# BCG Corp — Initiative Plan Discipline Protocol

**Protocol ID:** Initiative_Plan_Discipline
**Version:** 1.0
**Compatible Wrappers:** P0 v≥1.0
**Trigger Keywords:** `activate I-{number}` | `plan I-{number}`
**Last Updated:** 2026-04-19
**Owner:** Gregory Bernardo, President
**Backup Operator:** Bob Brezniak
**Status:** Approved

**Origin:** Formalized from the Plan Link Rule landed in Catalog v2.9 and the plan-reference requirement in W-20 v1.1 Section 3 Trigger 3. Restructured as a standalone fetchable protocol so the Planned → Active gate is invokable independently of a triage sync.

---

## 1. Purpose

This protocol enforces the Planned → Active transition gate on any initiative in the BCG catalog. Its goal is **plan-before-assignment**: an initiative does not become Active by owner declaration — it becomes Active when a documented plan exists, recorded in the catalog's `Plan:` reference, describing what will be done, in what sequence, and what success looks like.

Without this gate, initiatives flip Active without forcing the thinking that protects owner capacity and catches infeasible scope early. The result is items that sit nominally Active for months with no progress because the plan was never written. Forcing the plan before activation catches ambiguity at the cheapest point.

**Adapted from:** I-72 Superpowers methodology port — `writing-plans` / `executing-plans` skill adapted to BCG's governance layer.

---

## 2. Pre-Execution Fetch Requirements

| Document | Path | Halt Condition |
|---|---|---|
| Initiative & Workstream Catalog | `standards/BCG_Initiative_and_Workstream_Catalog.md` | Fetch fails → report URL and error, halt. Do not operate from memory. |
| Team Directory | `standards/BCG_Team_Directory.md` | Fetch fails → proceed with caveat flag; owner capacity check will use last-known load. |

---

## 3. Execution Runbook

Execute in order. Reject the activation and bounce back to owner on any failure.

1. **Parse the trigger.** Extract the I-number. If the trigger is `plan I-{number}`, the request is for help drafting a plan — skip to Step 7. If the trigger is `activate I-{number}`, continue.
   - *Halt if the I-number is malformed or missing → ask owner for the specific I-number.*

2. **Fetch the catalog.** Confirm the I-number exists and is currently in `Planned` status.
   - *Halt if the I-number is not in the catalog → ask whether it's a new registration (route to W-20 Structural Change Runbook) or a typo.*
   - *Halt if the I-number's current status is not `Planned` (e.g., Active, On Hold, Complete, Removed) → bounce back with current status; do not force transition.*

3. **Require a plan reference.** The owner must supply either a path to a plan doc (GitHub markdown, OneDrive `.docx`, Odoo note) or an inline plan meeting the minimum content requirements in Section 4. Catalog Notes field will be updated with `Plan: <path-or-inline-ref>`.
   - *Halt if no plan reference supplied → respond with the Section 4 minimum content requirements and request one.*

4. **Validate plan content.** The plan must include, at minimum:
   - **Steps** — numbered or sequenced actions, specific enough to execute
   - **Dependencies** — upstream blockers (other I-numbers, decisions, people), downstream consumers
   - **Success criteria** — what evidence makes this Complete (will be checked by `Initiative_Closure_Verification.md` later)
   - **Target completion** — a date or a sprint reference (not "eventually")

   Length is not a criterion — a paragraph can satisfy all four. Formality is not a criterion — a bullet list in Notes works. What's required is that the four elements exist.

   - *Halt if any element is missing → report which element(s) missing; do not proceed until addressed.*
   - *Halt if success criteria are untestable (e.g., "when it's ready", "when Gregory approves") → ask for a concrete observable.*

5. **Check owner capacity.** Fetch the current count of Active initiatives assigned to the proposed owner from the catalog.
   - *Soft flag (not a halt) if the owner has more than 8 concurrent Active items → surface to Gregory with a recommendation to defer activation, reassign, or accept the overload with awareness.*

6. **Check dependency readiness.** For each upstream dependency named in the plan (I-numbers, decisions, people): confirm the dependency is either Complete, Active and on track, or has a resolution date.
   - *Halt if any upstream dependency is On Hold, Removed, or Blocked with no resolution date → report the gap; owner and Gregory decide whether to defer activation.*

7. **(Path B only) Draft the plan.** If the trigger was `plan I-{number}`, the protocol helps the owner draft a plan meeting Section 4 requirements. Output is an inline plan block the owner can paste into Catalog Notes or save as a standalone file. Control returns to Step 3 for activation.

8. **Update the catalog entry.** On pass: change Status to `Active`; set Notes `Plan: <path-or-inline-ref>`; record the owner's target completion date.
   - *Halt if the catalog commit fails → report current SHA; do not retry with stale SHA.*

9. **Log the activation.** Record a brief note to the current sync's Ecosystem Status document:
   ```
   I-{number} {name} — Activated. Plan: {ref}. Target: {date}. Owner: {name}.
   ```

---

## 4. What Counts as a Plan

The minimum content is four elements. The minimum length is whatever expresses them clearly. Examples of acceptable inline plans:

**Minimal acceptable (one paragraph):**
```
Plan: Draft W-21 skeleton from existing P8-001 folder structure (Step 1).
Resolve five open policy questions with Gregory (Step 2, dep: Gregory decision window).
Circulate for Jennifer review (Step 3). Publish to GitHub as BCG_File_Structure_Standard_v1.0.md (Step 4).
Target: May 15. Success: Gregory-approved .md committed; W-21 status = Approved in SOP Governance.
```

**Acceptable (bulleted):**
```
Plan:
- Steps: [1] Audit current Outlook rules; [2] Design ASR Block/Audit tier split; [3] Draft policy GPO; [4] Test on two machines; [5] Deploy org-wide.
- Deps: I-08 AppLocker stance (Complete); ASR review window (open).
- Success: All endpoints on tier'd ASR with Audit mode on 14 rules, Block on 4. Compliance report committed.
- Target: Q2 2026.
```

**Not acceptable (fails validation):**
```
Plan: Jason will figure out the AI context store architecture.  [Fails: no steps, no success criteria, no target.]
```

```
Plan: See Slack thread from last Tuesday.  [Fails: unstable reference. Slack is not canonical.]
```

**File-based plans** (path-referenced) are preferred for plans longer than ~200 words. Location: `bcg-ops-governance/plans/I-{number}_Plan.md` or OneDrive `Corp/AI/Plans/` — consistent with BCG_Artifact_Deployment_Routing_Standard.md.

---

## 5. Plan Link Backfill Sweep (Monthly)

Initiatives already in `Active` status before this protocol's activation may carry `Plan: TBD` or no plan reference in Notes. These are addressed opportunistically during W-20 Tier 2 monthly audits.

Execute at W-20 Tier 2 cadence:

1. Pick 2–3 Active initiatives with `Plan: TBD` entries (or no plan reference).
2. Contact the owner. Document the plan with them — even one paragraph satisfying Section 4 counts.
3. Update the catalog Notes field with the plan reference.
4. On refusal or inability to plan the work: surface to Gregory. Options are (a) defer the initiative to Planned until a plan can be written, (b) reassign to an owner who can plan it, or (c) remove the initiative as unworkable.
5. Forbidden fallback: do not leave `TBD` in place indefinitely.

---

## 6. Halt Conditions — Consolidated Reference

| Condition | Trigger | Required Report | Forbidden Fallback |
|---|---|---|---|
| Catalog fetch fails | Step 2 | Report URL and error | Do not operate from memory |
| I-number not in catalog | Step 2 | Ask: new or typo | Do not auto-create — route to W-20 Structural |
| I-number status not Planned | Step 2 | Report current status | Do not force transition |
| No plan reference supplied | Step 3 | List Section 4 requirements | Do not process without plan |
| Plan element missing | Step 4 | Report which element(s) | Do not accept incomplete plan |
| Success criteria untestable | Step 4 | Ask for concrete observable | Do not accept vague criteria |
| Unstable plan reference (Slack thread, ephemeral chat) | Step 3 / 4 | Ask for canonical location | Do not accept ephemeral refs |
| Upstream dep not resolvable | Step 6 | Report gap | Owner + Gregory decide |
| Catalog commit fails | Step 8 | Report current SHA | Do not retry stale SHA |

---

## 7. Relationship to Other Governance

| Document | Relationship |
|---|---|
| `W-20_Ecosystem_Triage.md` | Parent triage protocol. Invokes this protocol from Phase 2 Step 7 when an Activation classification is detected, and from Structural Change Runbook Step 8 when a proposed structural change includes Planned → Active transition. Tier 2 Step 6 (Plan Link Backfill Sweep) invokes Section 5 of this protocol. |
| `Initiative_Closure_Verification.md` | Sibling protocol. This protocol gates Planned → Active; Closure Verification gates Active → Complete. The plan's success criteria (Step 4) are the evidence criteria Closure Verification checks against (Step 5). |
| `standards/BCG_Initiative_and_Workstream_Catalog.md` | Catalog this protocol reads and writes. The Plan Link Rule (referenced in Catalog v2.9/v3.0 Notes) is enforced here. |
| `standards/BCG_Team_Directory.md` | Source of owner role info for capacity check (Step 5). |
| `standards/BCG_Artifact_Deployment_Routing_Standard.md` (GOV-021) | Governs where file-based plans live (preferred path format). |

---

## 8. Revision History

| Version | Date | What Changed |
|---------|------|-------------|
| 1.0 | 2026-04-19 | Initial standalone protocol. Formalizes the Plan Link Rule landed in Catalog v2.9 and the plan-reference requirement in W-20 v1.1 Section 3 Trigger 3. Adds plan content validation (Section 4 four-element minimum), capacity check (Step 5), dependency readiness check (Step 6), and monthly backfill sweep (Section 5). `plan I-{number}` trigger added as drafting-help path for owners who need to author a plan before activation. |

---

*BCG Corp Initiative Plan Discipline Protocol*
*Owner: Gregory Bernardo | Parent wrapper: P0 (Master Strategic Plan)*
*Store in GitHub at bcg-ops-governance/standards/protocols/*
