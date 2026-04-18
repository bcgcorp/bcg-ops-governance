# BCG Corp — Post-Mortem Template

**Document ID:** GOV-020
**Version:** 1.0
**Effective:** April 2026
**Last Updated:** 2026-04-18
**Scope:** All ecosystem-level incidents affecting governance, infrastructure, or cross-project operations
**Owner:** Gregory Bernardo, President
**Status:** Approved

**Derived from:** I-72 Superpowers methodology port — systematic-debugging skill adapted to BCG's governance and operations layer. Four-phase root-cause structure preserved; mandatory permanent rule change added per BCG governance requirement.

---

## 1. Purpose

This template standardizes BCG's response to ecosystem-level failures. Its goal is not assigning blame — it is producing a permanent rule change so the same failure cannot recur the same way. Every post-mortem must output at least one documented change to an SOP, governance doc, or operational practice.

Without this discipline, failures get fixed in the moment and then recur weeks later with slightly different symptoms. The 2026-03-22 raw CDN cache failure (when `web_fetch` served v1.4 of a governance doc while v2.2 was committed to GitHub) is the canonical example — the fix was "use GitHub MCP instead," and the permanent rule change was codified in BCG_Governance_Doc_Registry.md Section 2. That rule has prevented the same failure class ever since.

---

## 2. When to Use This Template

Initiate a post-mortem within 48 hours of observation when any of these conditions occur:

- **Governance failure:** A governance doc produced wrong output, stale content, or contradicted its own rules
- **Infrastructure failure (multi-project impact):** GitHub MCP outage, Odoo downtime, OneDrive desync, or network failure that affected more than one person or project
- **Ecosystem drift:** I-number collision, missed EAB propagation, catalog count mismatch, or subproject retirement that left orphans
- **SOP failure:** A documented SOP produced an unexpected outcome when followed correctly
- **Data integrity failure:** Incorrect or missing data reached a downstream consumer (dashboard, handoff, deliverable)

**Not required for:**
- Individual contributor errors caught during normal review
- Single-project issues contained within a satellite
- Transient infrastructure issues that auto-resolve without impact
- User-error incidents where the underlying process worked as designed

**If in doubt, file it.** Overreporting produces permanent rule improvements. Underreporting produces repeated failures.

---

## 3. Template

Copy the block below into a new file named `PM-YYYY-MM-DD-##_<short-slug>.md` and commit to `bcg-ops-governance/post-mortems/` (create folder if this is the first post-mortem).

```markdown
# Post-Mortem — [Incident Name]

**ID:** PM-YYYY-MM-DD-## (chronological)
**Incident Date:** YYYY-MM-DD (when the failure occurred, not when observed)
**Observation Date:** YYYY-MM-DD (when someone noticed)
**Filed Date:** YYYY-MM-DD (within 48 hours of observation)
**Author:** [Name]
**Severity:** Low / Medium / High / Critical
**Systems/Projects Affected:** [P-codes, infrastructure, governance docs]
**Status:** Open / Fix Applied / Rule Change Committed / Closed

---

## 1. Incident Summary

One paragraph. What happened, who noticed, how it was reported, how long it lasted, total impact.

## 2. Phase 1 — Symptom

What was observed. Specific behavior, error message, wrong output, missing data. Use exact language from logs, chats, or user reports. No speculation about cause yet.

Example (from 2026-03-22 cache failure): "Fetched BCG_Initiative_and_Workstream_Catalog.md from raw.githubusercontent.com. Response was HTTP 200 with valid content — but the content was the v1.4 version of the file. The v2.2 version had been committed to GitHub four hours earlier. Browser-based verification of the GitHub page showed v2.2."

## 3. Phase 2 — Initial Hypothesis

What we thought was wrong at first. What we tried based on that hypothesis. Record hypotheses even if they turned out to be wrong — they prevent repeat investigation paths.

## 4. Phase 3 — Isolation

How the actual root cause was identified. What evidence confirmed it. This section should be reproducible by someone reading the post-mortem a year later.

## 5. Phase 4 — Root Cause

The underlying cause. Not the symptom. The thing that, if different, would have prevented this failure and prevents failures in the same class.

Guard against "proximate cause" substitution — "the file wasn't committed" is a proximate cause; "there's no commit gate on governance doc updates" is a root cause.

## 6. Fix Applied

What was changed to resolve the immediate incident. Include commit hashes, PR numbers, or specific config changes where applicable.

## 7. Permanent Rule Change (MANDATORY)

What documentation, SOP, governance doc, or ecosystem practice changes to prevent the same failure class from recurring. Every post-mortem produces at least one permanent change.

**Required elements:**
- The specific governance doc, SOP, or practice being updated
- The exact rule or section being added, modified, or deleted
- The version bump of that document (post-mortem closure is gated on the committed rule change)
- Link to the commit where the rule change landed

Example (from 2026-03-22 cache failure): "Added hard rule to BCG_Governance_Doc_Registry.md Section 2: 'Never use web_fetch on raw.githubusercontent.com for GitHub files. Always use github-write:get_file_contents.' Bumped registry from v2.3 to v2.4. Commit: [hash]."

## 8. References

- Commit hashes, PR numbers, issue tickets
- Relevant chat URLs or handoff prompts
- Affected files (before/after)
- Prior post-mortems with related root causes (if any)

## 9. Closure Checklist

Post-mortem is Closed only when all items check:

- [ ] Fix applied and verified
- [ ] Permanent rule change committed to affected governance doc
- [ ] Document version bumped
- [ ] Relevant SOPs updated if affected
- [ ] Post-mortem filed to bcg-ops-governance/post-mortems/
- [ ] Referenced in the next Tier 2 monthly audit's Post-Mortem Review
```

---

## 4. Post-Mortem Lifecycle

| Stage | Owner | Expected Duration | Gate |
|-------|-------|------------------|------|
| Observation | Discoverer | Immediate | Incident meets Section 2 criteria |
| Filing | Author | Within 48 hours | Template completed through Phase 5 (Root Cause) |
| Fix | Affected system owner | Varies by severity | Phase 6 completed |
| Rule Change | Author + Gregory | Within 1 week | Phase 7 complete — committed rule change |
| Closure | Author | Review at next Tier 2 audit | All Section 9 checklist items complete |

---

## 5. Aggregation and Review

Post-mortems are reviewed at two cadences:

**Tier 2 Monthly Audit (W-20 v1.1 Section 6B):**
- Confirm each post-mortem filed this month produced a permanent rule change
- Confirm the rule change is visible in the affected governance doc
- Flag any post-mortem without a documented rule change for remediation

**Tier 3 Quarterly Assessment (W-20 v1.1 Section 6C):**
- Count post-mortems by affected governance surface
- If three or more post-mortems in a quarter target the same governance surface, trigger a Tier 4 structural review of that surface
- Review for pattern: are we producing rule changes that prevent failure class recurrence, or just fixing symptoms?

---

## 6. Filing Location

**Canonical location:** `bcg-ops-governance/post-mortems/`

Folder is created on first commit. Filenames follow the pattern `PM-YYYY-MM-DD-##_<short-slug>.md` (chronological ordinal per day). Example: `PM-2026-04-18-01_raw-cdn-cache-failure.md`.

**Sensitive post-mortems:** If a post-mortem involves Tier 1 or Tier 2 data (personnel, legal, security), file to a restricted location (P10 project knowledge) instead. Reference the restricted filing in a redacted public placeholder in `post-mortems/` so the ordinal sequence is preserved.

---

## 7. Relationship to Other Governance

| Document | Relationship |
|----------|-------------|
| W-20 Ecosystem Triage SOP v1.1 | Section 4E initiates post-mortems. Tier 2 and Tier 3 audits review them. |
| BCG_Governance_Doc_Registry.md | Canonical home for rule changes produced by governance-surface post-mortems |
| BCG_Initiative_and_Workstream_Catalog.md | Rule changes may produce new I-numbers (remediation initiatives) |
| BCG_Artifact_Naming_and_Capture_Standard.md | Post-mortem filenames follow its chronological-ordinal pattern |

---

## 8. Revision History

| Version | Date | What Changed |
|---------|------|-------------|
| 1.0 | 2026-04-18 | Initial version. Four-phase systematic-debugging structure adapted from I-72 Superpowers methodology port. Mandatory permanent rule change added as BCG-specific governance requirement. Referenced from W-20 v1.1 Section 4E. |

---

*BCG Corp Post-Mortem Template (GOV-020)*
*Owner: Gregory Bernardo, President | Store in GitHub at bcg-ops-governance/standards/*
*Completed post-mortems filed to bcg-ops-governance/post-mortems/*
