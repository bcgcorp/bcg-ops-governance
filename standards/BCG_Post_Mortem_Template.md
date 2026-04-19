# [MOVED] — BCG Corp Post-Mortem Template (GOV-020)

**⚠️ This file has been split and relocated.**

As of 2026-04-19, the Post-Mortem Template's content has been split into two files under the protocol-harness pattern established at `standards/protocols/`.

---

## New Locations

**Procedural runbook (when to initiate, lifecycle, filing, review cadence, halt conditions):**
- **File:** `standards/protocols/Post_Mortem.md`
- **Version:** 1.0
- **This is the protocol.** Invoke via trigger keywords: `post-mortem`, `root-cause this`, `write incident review`.

**Fillable template blank (field structure, example content):**
- **File:** `standards/protocols/resources/Post_Mortem_Template.md`
- **Version:** 1.0
- **This is the template.** The Post-Mortem protocol fetches it to produce filled post-mortems.

---

## Why the Split

Under the protocol-harness pattern, runbook (how to execute) and resource (template data) live separately. The procedural content and the fillable blank were bundled in GOV-020 v1.0; the 2026-04-19 migration separated them so:
- Authors of post-mortems fetch only the template (smaller, cleaner).
- The runbook can evolve (new halt conditions, cadence tweaks) without invalidating in-flight post-mortems whose template shape remains stable.
- Cross-references between Post-Mortem Protocol, W-20 Ecosystem Triage, and Closure Verification become explicit.

See `standards/protocols/README.md` for the pattern.

---

## Sunset Schedule

**This redirect stub is scheduled for deletion on 2026-07-18 (90 days from migration).**

Any reference to `standards/BCG_Post_Mortem_Template.md` will 404 after that date. Update references to either the protocol or the template as appropriate to the use:
- Procedural questions ("when do I file a post-mortem?") → `standards/protocols/Post_Mortem.md`
- Template fetch ("give me the fillable blank") → `standards/protocols/resources/Post_Mortem_Template.md`

---

## Governance Doc Registry

GOV-020 retired as a standalone ID. The Post-Mortem Protocol and its template are tracked under the `standards/protocols/` registry entries in `BCG_Governance_Doc_Registry.md` v3.5+.

---

*Redirect stub — 2026-04-19 → scheduled deletion 2026-07-18*
*See `standards/protocols/README.md` for protocol-harness pattern*
