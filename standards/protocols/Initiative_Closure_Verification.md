# BCG Corp — Initiative Closure Verification Protocol

**Protocol ID:** Initiative_Closure_Verification
**Version:** 1.0
**Compatible Wrappers:** P0 v≥1.0
**Trigger Keywords:** `close I-{number}` | `verify closure` | `mark complete I-{number}`
**Last Updated:** 2026-04-19
**Owner:** Gregory Bernardo, President
**Backup Operator:** Bob Brezniak
**Status:** Approved

**Origin:** Carved from W-20 v1.1 Trigger 4 (Completion) and Checklist 4D (Completion Verification). Content preserved; restructured as standalone fetchable protocol so closure logic can be invoked independently of a full triage sync.

---

## 1. Purpose

This protocol enforces the Active → Complete transition gate on any initiative in the BCG catalog. Its goal is **receipts-based closure**: an initiative does not become Complete because someone says it is — it becomes Complete because a verifiable artifact has been filed to its canonical location, and that artifact matches the initiative's registered scope.

Without this gate, Active items get marked Complete based on conversation memory rather than verifiable evidence. This produces catalog drift — the catalog claims completion that the filesystem, GitHub, or Odoo cannot confirm. The verification gate forces receipts before the status change lands.

**Adapted from:** I-72 Superpowers methodology port — `verification-before-completion` skill adapted to BCG's governance layer.

---

## 2. Pre-Execution Fetch Requirements

| Document | Path | Halt Condition |
|---|---|---|
| Initiative & Workstream Catalog | `standards/BCG_Initiative_and_Workstream_Catalog.md` | Fetch fails → report URL and error, halt. Do not operate from memory. |
| Artifact Naming & Capture Standard | `standards/BCG_Artifact_Naming_and_Capture_Standard.md` | Fetch fails → halt (needed for canonical-location check). |
| Governance Doc Registry | `standards/BCG_Governance_Doc_Registry.md` | Fetch fails → halt if the initiative produced a governance doc. Otherwise, proceed with caveat flag. |
| SOP Governance & Intake Protocol | `standards/BCG_SOP_Governance_and_Intake_Protocol.md` | Fetch fails → halt if the initiative produced an SOP. |
| Custom Module Registry | `standards/BCG_Custom_Module_Registry.md` | Fetch fails → halt if the initiative produced an Odoo module. |
| Artifact Deployment Routing | `standards/BCG_Artifact_Deployment_Routing_Standard.md` | Fetch fails → halt if the initiative produced a non-document artifact (source code, installer, RAG feed, etc.). |

---

## 3. Execution Runbook

Execute in order. Reject the closure and bounce back to owner on any failure.

1. **Parse the trigger.** Extract the I-number and any evidence link the owner provided.
   - *Halt if the I-number is malformed or missing → ask owner for the specific I-number.*

2. **Fetch the catalog.** Confirm the I-number exists and is currently in `Active` status.
   - *Halt if the I-number is not in the catalog → ask owner whether it's a new registration or a typo.*
   - *Halt if the I-number's current status is not `Active` (e.g., Planned, On Hold, Removed) → bounce back with current status.*

3. **Require an evidence link.** The owner must supply one with the closure request. Acceptable forms: GitHub commit URL, GitHub PR URL, path to an approved `.docx` in OneDrive, Odoo module name + deployment environment, runbook URL, merged pull request.
   - *Halt if no evidence link supplied → respond with the list of acceptable evidence forms and request one.*

4. **Resolve the evidence link.** The URL must load, the file must exist, the commit must be visible, the module must be deployed.
   - *Halt if the link does not resolve → report what broke; do not proceed.*
   - *Halt if the link resolves but the content is clearly unrelated to the initiative scope → report the mismatch; do not proceed.*

5. **Match evidence against registered scope.** Compare the evidence against the initiative's Name and Notes in the catalog. The evidence must deliver what the initiative promised.
   - *Halt if the evidence partially delivers on scope (e.g., Phase 1 of a multi-phase initiative) → ask owner whether to close the full initiative or split into phases with the closure scoped to just Phase 1.*

6. **Confirm canonical filing.** Run the filing check appropriate to the artifact class:
   - **Governance document:** entry appears in `BCG_Governance_Doc_Registry.md` Section 3, and the document is in `standards/` or `standards/protocols/`.
   - **SOP:** W-number exists, status is Approved, registered in `BCG_SOP_Governance_and_Intake_Protocol.md`.
   - **Code:** merged to `main` on the relevant repo; deployed where applicable.
   - **Odoo module:** installed on R2-D2 (production) and listed in `BCG_Custom_Module_Registry.md`.
   - **Non-document artifact** (installer, RAG feed, infrastructure config): filed per `BCG_Artifact_Deployment_Routing_Standard.md` Section 3.
   - **Operational document** (memo, analysis): filed to the correct B: drive path per `BCG_Artifact_Naming_and_Capture_Standard.md`.
   - *Halt if the artifact is in a temp folder, Downloads, an uncommitted local edit, or otherwise off-canonical → bounce back with the correct canonical location.*
   - *Halt if the artifact class does not map to any of the above categories → surface to Gregory for classification.*

7. **Update the catalog entry.** On pass: change Status to `Complete`; append the evidence link to Notes for audit trail.
   - *Halt if the catalog commit fails → report current SHA and retry guidance; do not retry with stale SHA.*

8. **Log the closure.** Record a brief completion note to the current sync's Ecosystem Status document:
   ```
   I-{number} {name} — Complete. Evidence: {link}. Verified {YYYY-MM-DD}.
   ```

---

## 4. Output Format

A successful closure produces two committed artifacts:

| Artifact | Location | Contents |
|---|---|---|
| Catalog entry update | `standards/BCG_Initiative_and_Workstream_Catalog.md` | Status: `Active` → `Complete`. Notes field appended with evidence link. |
| Ecosystem Status closure note | current `BCG_Ecosystem_Status_YYYY-MM-DD.md` | One-line entry per Step 8 above. |

A rejected closure produces no commits. The owner receives a specific rejection reason and the step that failed.

---

## 5. Backfill Protocol (Monthly Sweep)

Items already marked `Complete` before v1.0 of this protocol may have incomplete evidence links in their Notes field. These are audited opportunistically during W-20 Tier 2 monthly audits — one Complete item per month is selected for verification.

Execute at W-20 Tier 2 cadence:

1. Pick one initiative marked `Complete` since the last monthly audit.
2. Fetch its Notes field evidence link.
3. Run Steps 4–6 of Section 3 against it.
4. **On pass:** log the verification to the monthly audit record. No further action.
5. **On fail:** either backfill the correct evidence link (if one exists), or return the initiative to `Active` status with a clear reason logged to the next sync's Ecosystem Status.
6. Forbidden fallback: do not silently leave broken links in place.

---

## 6. Halt Conditions — Consolidated Reference

| Condition | Trigger | Required Report | Forbidden Fallback |
|---|---|---|---|
| Catalog fetch fails | Step 2 | Report URL and error | Do not operate from memory |
| I-number not in catalog | Step 2 | Ask owner if new or typo | Do not auto-create |
| I-number status not Active | Step 2 | Report current status | Do not force the transition |
| No evidence link supplied | Step 3 | List acceptable evidence forms | Do not process without link |
| Evidence link does not resolve | Step 4 | Report what broke | Do not proceed on broken link |
| Evidence content unrelated to scope | Step 4 | Report mismatch | Do not proceed on mismatch |
| Partial scope delivery | Step 5 | Ask owner: close full or split phases | Do not auto-close on partial |
| Artifact off-canonical | Step 6 | Bounce back with correct location | Do not accept Downloads/temp |
| Artifact class unmapped | Step 6 | Escalate to Gregory | Do not invent a category |
| Catalog commit fails | Step 7 | Report current SHA | Do not retry with stale SHA |

---

## 7. Relationship to Other Governance

| Document | Relationship |
|---|---|
| `W-20_Ecosystem_Triage.md` | Parent triage protocol. Invokes this protocol from Phase 2 Step 8 when a Completion classification is detected. Tier 2 Step 5 (Completion Verification Sweep) invokes Section 5 of this protocol. |
| `Initiative_Plan_Discipline.md` | Sibling protocol. Plan Discipline gates Planned → Active; Closure Verification gates Active → Complete. |
| `standards/BCG_Initiative_and_Workstream_Catalog.md` | Catalog this protocol reads and writes. Plan Link Rule was absorbed into Plan Discipline protocol; closure gate is this protocol. |
| `standards/BCG_Artifact_Naming_and_Capture_Standard.md` | Source of canonical-location rules used in Step 6. |
| `standards/BCG_Artifact_Deployment_Routing_Standard.md` (GOV-021) | Source of non-document artifact routing used in Step 6. |

---

## 8. Revision History

| Version | Date | What Changed |
|---------|------|-------------|
| 1.0 | 2026-04-19 | Initial standalone protocol. Content carved from W-20 v1.1 Trigger 4 and Checklist 4D. Restructured as fetchable standalone protocol so closure gate is invokable independent of a full triage sync. No content deletions from v1.1; fidelity preserved. Backfill protocol (Section 5) formalized as Tier 2 monthly sweep. |

---

*BCG Corp Initiative Closure Verification Protocol*
*Owner: Gregory Bernardo | Parent wrapper: P0 (Master Strategic Plan)*
*Store in GitHub at bcg-ops-governance/standards/protocols/*
