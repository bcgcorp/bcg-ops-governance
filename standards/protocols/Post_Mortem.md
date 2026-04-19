# BCG Corp — Post-Mortem Protocol

**Protocol ID:** Post_Mortem
**Version:** 1.0
**Compatible Wrappers:** P0 v≥1.0
**Trigger Keywords:** `post-mortem` | `root-cause this` | `write incident review`
**Last Updated:** 2026-04-19
**Owner:** Gregory Bernardo, President
**Backup Operator:** Bob Brezniak
**Status:** Approved

**Origin:** Carved from W-20 v1.1 Section 4E (Ecosystem Failure Response) and the procedural content of GOV-020 (`BCG_Post_Mortem_Template.md` — when-to-use, lifecycle, aggregation, filing). The template itself — the fillable blank — relocates to `standards/protocols/resources/Post_Mortem_Template.md` as a data asset fetched by this protocol.

---

## 1. Purpose

This protocol standardizes BCG's response to ecosystem-level failures. Its goal is **not assigning blame** — it is producing a permanent rule change so the same failure cannot recur the same way. Every post-mortem must output at least one documented change to an SOP, governance doc, or operational practice.

Without this discipline, failures get fixed in the moment and then recur weeks later with slightly different symptoms. The 2026-03-22 raw CDN cache failure (when `web_fetch` served v1.4 of a governance doc while v2.2 was committed to GitHub) is the canonical example — the fix was "use GitHub MCP instead," and the permanent rule change was codified in `BCG_Governance_Doc_Registry.md` Section 7 Rule 3. That rule has prevented the same failure class ever since.

**Adapted from:** I-72 Superpowers methodology port — `systematic-debugging` skill adapted to BCG governance. Four-phase root-cause structure preserved; mandatory permanent rule change retained as BCG-specific governance requirement.

---

## 2. When to Use This Protocol

Initiate a post-mortem within **48 hours of observation** when any of these conditions occur:

- **Governance failure:** A governance doc produced wrong output, stale content, or contradicted its own rules.
- **Infrastructure failure (multi-project impact):** GitHub MCP outage, Odoo downtime, OneDrive desync, or network failure affecting more than one person or project.
- **Ecosystem drift:** I-number collision, missed EAB propagation, catalog count mismatch, subproject retirement leaving orphans.
- **SOP or protocol failure:** A documented SOP or protocol produced an unexpected outcome when followed correctly.
- **Data integrity failure:** Incorrect or missing data reached a downstream consumer (dashboard, handoff, deliverable).

**Not required for:**
- Individual contributor errors caught during normal review.
- Single-project issues contained within a satellite.
- Transient infrastructure that auto-resolves without impact.
- User-error incidents where the underlying process worked as designed.

**If in doubt, file it.** Overreporting produces permanent rule improvements. Underreporting produces repeated failures.

---

## 3. Pre-Execution Fetch Requirements

| Document | Path | Halt Condition |
|---|---|---|
| Post-Mortem Template | `standards/protocols/resources/Post_Mortem_Template.md` | Fetch fails → report error, halt. Do not attempt to write a post-mortem from memory — the template's field structure is part of the governance contract. |
| Governance Doc Registry | `standards/BCG_Governance_Doc_Registry.md` | Fetch fails → halt if the post-mortem targets a governance doc as the affected surface. |
| Artifact Naming & Capture Standard | `standards/BCG_Artifact_Naming_and_Capture_Standard.md` | Fetch fails → proceed with caveat flag; filename pattern documented inline in Step 6. |

---

## 4. Execution Runbook

Execute in order.

1. **Confirm the incident qualifies.** Check observed conditions against Section 2 criteria.
   - *Halt if the incident does not meet Section 2 criteria → do not file. Respond with why the incident does not qualify and what would cause it to qualify.*

2. **Assign an ID.** Format: `PM-YYYY-MM-DD-##_<short-slug>.md` where `##` is the chronological ordinal for that day and `<short-slug>` is 2–5 words describing the incident.
   - Example: `PM-2026-04-19-01_protocol-harness-drift.md`.

3. **Determine severity.** Classify as Low / Medium / High / Critical:
   - **Critical:** multi-day ecosystem outage, data loss, or failure affecting client deliverables.
   - **High:** multi-hour outage, governance doc produced wrong output that reached a reader, ecosystem drift that corrupted a catalog.
   - **Medium:** brief outage, caught-in-time drift, SOP produced unexpected outcome but no downstream damage.
   - **Low:** transient issue with process implications but no current impact.
   - *Halt if severity cannot be determined → surface to Gregory.*

4. **Fetch the template.** Load `standards/protocols/resources/Post_Mortem_Template.md`. Use its field structure — do not invent fields or skip required ones.

5. **Complete the four-phase analysis.** Fill the template:
   - **Phase 1 — Symptom.** What was observed. Exact language from logs, chats, or user reports. No speculation about cause yet.
   - **Phase 2 — Initial Hypothesis.** What was thought wrong at first. What was tried based on that hypothesis. Record even wrong hypotheses — they prevent repeat investigation paths.
   - **Phase 3 — Isolation.** How the actual root cause was identified. What evidence confirmed it. Reproducible by someone reading the post-mortem a year later.
   - **Phase 4 — Root Cause.** The underlying cause, not the symptom. The thing that, if different, would have prevented this failure class.
   - *Halt if Root Cause is phrased as a proximate cause ("the file wasn't committed") rather than a structural cause ("no commit gate on governance doc updates") → escalate to Gregory for Phase 4 rewrite.*

6. **Record the fix applied.** What changed to resolve the immediate incident. Commit hashes, PR numbers, or specific config changes.

7. **Author the permanent rule change (MANDATORY).** No post-mortem is filed without one.

   Required elements:
   - The specific governance doc, SOP, or protocol being updated.
   - The exact rule or section being added, modified, or deleted.
   - The version bump of that document.
   - Link to the commit where the rule change landed.

   - *Halt if no permanent rule change is identified → do not close. The post-mortem remains in Open status until a rule change is authored and committed. Escalate to Gregory if the incident genuinely requires no rule change — that itself is a meta-decision that must be logged.*

8. **File the post-mortem.** Canonical location: `bcg-ops-governance/post-mortems/`. Create the folder if this is the first post-mortem.
   - **Sensitive post-mortems** (Tier 1 or Tier 2 data — personnel, legal, security): file to restricted P10 project knowledge instead. Leave a redacted public placeholder in `post-mortems/` preserving the ordinal.
   - *Halt if filing fails → report error; do not proceed to closure.*

9. **Complete the closure checklist.** See Step 10 — all items must check before status moves to Closed.

10. **Closure checklist.** Post-mortem is Closed only when all items pass:
    - [ ] Fix applied and verified
    - [ ] Permanent rule change committed to affected governance doc
    - [ ] Affected document version bumped
    - [ ] Relevant SOPs updated if affected
    - [ ] Post-mortem filed to `bcg-ops-governance/post-mortems/`
    - [ ] Referenced in the next Tier 2 monthly audit's Post-Mortem Review (see Section 5)

---

## 5. Lifecycle & Review Cadence

| Stage | Owner | Expected Duration | Gate |
|-------|-------|------------------|------|
| Observation | Discoverer | Immediate | Incident meets Section 2 criteria |
| Filing | Author | Within 48 hours of observation | Template fields complete through Phase 5 (Root Cause) |
| Fix | Affected system owner | Varies by severity | Phase 6 complete |
| Rule Change | Author + Gregory | Within 1 week of filing | Phase 7 complete — committed rule change |
| Closure | Author | Review at next Tier 2 audit | Section 10 closure checklist all pass |

Post-mortems are reviewed at two cadences by W-20:

**W-20 Tier 2 Monthly Audit (Step 7 in W-20 v1.2):**
- Confirm each post-mortem filed this month produced a committed permanent rule change.
- Confirm the rule change is visible in the affected governance doc.
- Flag any post-mortem without a documented rule change for remediation.

**W-20 Tier 3 Quarterly Assessment (Step 6 in W-20 v1.2):**
- Count post-mortems by affected governance surface.
- If three or more post-mortems in a quarter target the same governance surface, trigger a W-20 Tier 4 structural review of that surface.
- Review for pattern: are we producing rule changes that prevent failure-class recurrence, or just fixing symptoms?

---

## 6. Output Format

A completed post-mortem is a single markdown file:

- **Location:** `bcg-ops-governance/post-mortems/PM-YYYY-MM-DD-##_<short-slug>.md` (or P10 restricted location for sensitive cases, with redacted public placeholder preserving ordinal).
- **Structure:** exactly matches `standards/protocols/resources/Post_Mortem_Template.md`.
- **Status lifecycle:** Open → Fix Applied → Rule Change Committed → Closed.
- **Companion commit:** the permanent rule change commit in an affected governance doc. Post-mortem references the rule-change commit; the rule-change commit's message references the post-mortem ID.

---

## 7. Halt Conditions — Consolidated Reference

| Condition | Trigger | Required Report | Forbidden Fallback |
|---|---|---|---|
| Incident does not meet Section 2 criteria | Step 1 | Report why not; what would qualify | Do not file frivolous post-mortems |
| Severity undeterminable | Step 3 | Escalate to Gregory | Do not default to Low to avoid escalation |
| Template fetch fails | Step 4 | Report error | Do not write from memory — field structure is contractual |
| Root Cause phrased as proximate cause | Step 5 | Escalate to Gregory for Phase 4 rewrite | Do not close with surface-level cause |
| No permanent rule change identified | Step 7 | Escalate to Gregory; log meta-decision if no rule change genuinely warranted | Do not file without rule change in normal case |
| Filing fails | Step 8 | Report error | Do not proceed to closure on unfiled PM |
| Closure checklist incomplete | Step 10 | Report which items fail | Do not mark Closed with open items |

---

## 8. Relationship to Other Governance

| Document | Relationship |
|---|---|
| `W-20_Ecosystem_Triage.md` | Parent triage protocol. W-20 Tier 2 Step 7 reviews filed post-mortems monthly; Tier 3 Step 6 reviews patterns quarterly. This protocol runs independently of W-20 runbooks but its outputs feed W-20 audits. |
| `standards/protocols/resources/Post_Mortem_Template.md` | Template fetched by this protocol. Contains exact field structure, example content, and no procedural narrative. |
| `standards/BCG_Governance_Doc_Registry.md` | Canonical home for rule changes produced by governance-surface post-mortems. |
| `standards/BCG_Initiative_and_Workstream_Catalog.md` | Rule changes may produce new I-numbers for remediation initiatives. Register via W-20 Structural Change Runbook. |
| `standards/BCG_Artifact_Naming_and_Capture_Standard.md` | Post-mortem filenames follow its chronological-ordinal pattern. |
| `Initiative_Closure_Verification.md` | Sibling protocol. A post-mortem remediation initiative, once closed, goes through Closure Verification like any other. |

---

## 9. Revision History

| Version | Date | What Changed |
|---------|------|-------------|
| 1.0 | 2026-04-19 | Initial standalone protocol. Carved from W-20 v1.1 Section 4E and GOV-020 (`BCG_Post_Mortem_Template.md`) procedural sections (when-to-use, lifecycle, aggregation, filing). The template itself — the fillable blank — relocates to `standards/protocols/resources/Post_Mortem_Template.md`. Old GOV-020 path serves a redirect stub (90-day sunset, deletion scheduled 2026-07-18). Content preserved; restructured to separate runbook (this file) from template (resources file) per protocol-harness pattern. |

---

*BCG Corp Post-Mortem Protocol*
*Owner: Gregory Bernardo | Parent wrapper: P0 (Master Strategic Plan)*
*Store in GitHub at bcg-ops-governance/standards/protocols/*
