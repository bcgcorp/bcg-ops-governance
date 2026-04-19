# BCG Corp — Post-Mortem Template (Fillable Blank)

**Version:** 1.0
**Effective:** April 2026
**Last Updated:** 2026-04-19
**Scope:** Template used by the Post-Mortem Protocol (`standards/protocols/Post_Mortem.md`)
**Owner:** Gregory Bernardo, President
**Status:** Approved

---

## About This File

This file is the fillable blank used by the Post-Mortem Protocol. For the procedural content — when to initiate a post-mortem, the lifecycle stages, the review cadence, the filing location rules — see `standards/protocols/Post_Mortem.md`.

**How to use:** The Post-Mortem Protocol fetches this file and uses its field structure. To create a post-mortem, copy the template block below, replace placeholder text, and save to `bcg-ops-governance/post-mortems/PM-YYYY-MM-DD-##_<short-slug>.md`. Follow the procedural runbook in `Post_Mortem.md` for filing and closure.

**Do not modify this template structure without version-bumping.** The procedural protocol validates against these field names; adding or renaming fields silently breaks the validation.

---

## Template — Copy Block Below

```markdown
# Post-Mortem — [Incident Name]

**ID:** PM-YYYY-MM-DD-## (chronological ordinal for the day)
**Incident Date:** YYYY-MM-DD (when the failure occurred)
**Observation Date:** YYYY-MM-DD (when someone noticed)
**Filed Date:** YYYY-MM-DD (within 48 hours of observation)
**Author:** [Name]
**Severity:** Low / Medium / High / Critical
**Systems/Projects Affected:** [P-codes, infrastructure names, governance docs]
**Status:** Open / Fix Applied / Rule Change Committed / Closed

---

## 1. Incident Summary

One paragraph. What happened, who noticed, how it was reported, how long it lasted, total impact.

---

## 2. Phase 1 — Symptom

What was observed. Specific behavior, error message, wrong output, missing data.
Use exact language from logs, chats, or user reports. No speculation about cause yet.

*Example (from the 2026-03-22 cache failure): "Fetched BCG_Initiative_and_Workstream_Catalog.md from raw.githubusercontent.com. Response was HTTP 200 with valid content — but the content was the v1.4 version of the file. The v2.2 version had been committed to GitHub four hours earlier. Browser-based verification of the GitHub page showed v2.2."*

---

## 3. Phase 2 — Initial Hypothesis

What we thought was wrong at first. What we tried based on that hypothesis.
Record hypotheses even if they turned out to be wrong — they prevent repeat investigation paths.

---

## 4. Phase 3 — Isolation

How the actual root cause was identified. What evidence confirmed it.
This section should be reproducible by someone reading the post-mortem a year later.

---

## 5. Phase 4 — Root Cause

The underlying cause. Not the symptom. The thing that, if different, would have
prevented this failure — and prevents failures in the same class.

Guard against "proximate cause" substitution — "the file wasn't committed" is a
proximate cause; "there's no commit gate on governance doc updates" is a root cause.

---

## 6. Fix Applied

What was changed to resolve the immediate incident. Commit hashes, PR numbers,
or specific config changes where applicable.

---

## 7. Permanent Rule Change (MANDATORY)

What documentation, SOP, governance doc, or ecosystem practice changes to prevent
the same failure class from recurring. Every post-mortem produces at least one
permanent change.

**Required elements:**
- The specific governance doc, SOP, or protocol being updated
- The exact rule or section being added, modified, or deleted
- The version bump of that document (post-mortem closure is gated on the
  committed rule change)
- Link to the commit where the rule change landed

*Example (from 2026-03-22 cache failure): "Added hard rule to BCG_Governance_Doc_Registry.md
Section 2: 'Never use web_fetch on raw.githubusercontent.com for GitHub files. Always
use github-write:get_file_contents.' Bumped registry from v2.3 to v2.4.
Commit: [hash]."*

---

## 8. References

- Commit hashes, PR numbers, issue tickets
- Relevant chat URLs or handoff prompts
- Affected files (before/after)
- Prior post-mortems with related root causes (if any)

---

## 9. Closure Checklist

Post-mortem is Closed only when all items check:

- [ ] Fix applied and verified
- [ ] Permanent rule change committed to affected governance doc
- [ ] Document version bumped
- [ ] Relevant SOPs updated if affected
- [ ] Post-mortem filed to `bcg-ops-governance/post-mortems/`
- [ ] Referenced in the next Tier 2 monthly audit's Post-Mortem Review
```

---

## Revision History

| Version | Date | What Changed |
|---------|------|-------------|
| 1.0 | 2026-04-19 | Initial version at new location. Content is the Template block from former GOV-020 (`standards/BCG_Post_Mortem_Template.md` v1.0). Procedural content (when-to-use, lifecycle, aggregation, filing, relationships) moved to `standards/protocols/Post_Mortem.md`. This file is pure template. Old path serves redirect stub (90-day sunset, deletion scheduled 2026-07-18). |

---

*BCG Corp Post-Mortem Template (fillable blank)*
*Owner: Gregory Bernardo | Fetched by: Post_Mortem protocol*
*Store in GitHub at bcg-ops-governance/standards/protocols/resources/*
