# P0-001 Retrospective — Ecosystem Triage & Routing Protocol

**Version:** 1.0
**Filed:** 2026-04-19
**Scope:** Retirement record for the P0-001 Claude subproject
**Author:** Gregory Bernardo (with P0 session capture)
**Status:** Final
**Parent Initiative:** I-75 (Ecosystem Protocol Harness)

---

## Summary

P0-001 (Ecosystem Triage & Routing Protocol) was a Claude subproject of P0 that owned the ecosystem's intake-process-route function from 2026-03-12 through 2026-04-19. Its operating logic was codified in W-20 v1.0 (2026-03-14), expanded to v1.1 (2026-04-18) to include completion verification and failure-response patterns, and then structurally migrated to a protocol-harness pattern under P0 directly on 2026-04-19. This retirement is the final step of the I-75 migration — the subproject's function was not lost; it was elevated to a different structural home.

**Net effect:** P0 now owns triage directly. W-20 v1.2 is the protocol P0 fetches to execute triage runbooks. The three disciplines embedded in W-20 v1.1 (Closure Verification, Plan Discipline, Post-Mortem) are now standalone sibling protocols that P0 fetches on their own trigger keywords. The `standards/protocols/` folder established by I-75 is the structural home for this pattern going forward.

---

## Timeline

| Date | Event |
|------|------|
| 2026-03-05 | P0-001 concept first surfaces — identified need for a triage layer between individual project updates and P0's synthesis function |
| 2026-03-12 | P0-001 created as a Claude subproject of P0. Included in EAB v1.3 subproject list. Intended to carry the routing classification logic and handoff-generation logic that was accumulating in P0 conversations. |
| 2026-03-14 | W-20 v1.0 codified. Three trigger types (Scheduled Biweekly, Event-Driven, Structural), four processing checklists, four audit tiers, health metrics dashboard, Standard Update Template. Stored at `standards/BCG_W20_Ecosystem_Triage_SOP.md` as an SOP with P0-001 as the parent wrapper. |
| 2026-03-14 → 2026-04-17 | P0-001 operated roughly per design — but in practice, most triage sessions ran in P0 directly. The subproject got used for batch classification sprints, not for biweekly sync execution. Gregory executed triage from P0; P0-001 was effectively idle most of the time. |
| 2026-04-18 | W-20 v1.1 landed. Trigger 4 (Completion Verification), Checklist 4D, Section 4E (Ecosystem Failure Response), Plan Link Rule references, Post-Mortem Review cadence, and associated health metrics were absorbed into W-20 v1.1. GOV-020 Post-Mortem Template landed alongside. The three disciplines were *content-complete* but lived inside W-20's existing structural home (which was still attached to P0-001 as wrapper). |
| 2026-04-19 | I-75 migration — the protocol-harness pattern is established at `standards/protocols/`. W-20 v1.1 is carved into four protocols: W-20 v1.2 (ecosystem triage only), Initiative_Closure_Verification v1.0, Initiative_Plan_Discipline v1.0, Post_Mortem v1.0. P0-001 is retired from the Subproject Registry (Catalog v3.0) and the EAB (v1.7). P0 custom instructions bump to v1.0 and absorb the triage-invocation function directly. |

---

## What P0-001 Produced

During its operational life, P0-001 produced:

- **Routing classifications** for ecosystem updates (Routine / Significant / Structural / Completion categorization).
- **Satellite handoff prompts** in the `[FROM: P0]` label format, delivered from P0-001 chats to downstream projects.
- **I-number registrations** — slot assignment during structural-change sprints. Most I-numbers in the I-40–I-72 range were assigned via P0-001 batch sprints.
- **Ecosystem Status files** — the sync-cycle snapshots stored in `standards/` with the `BCG_Ecosystem_Status_YYYY-MM-DD.md` naming pattern.
- **Governance audit outputs** — Tier 1 audit reports at each sync, Tier 2 monthly drift sweeps, Tier 3 quarterly scorecards.
- **W-20 itself** — the SOP that defined the triage function was authored inside P0-001 sessions.
- **Initial scaffolding of the Plan Link Rule** — the language that eventually became `Initiative_Plan_Discipline.md` v1.0 was drafted in P0-001 during the Catalog v2.9 reconciliation commit.

These outputs are not retired. They are preserved in their committed forms in GitHub and OneDrive; the retirement is of the *subproject* as an organizational container, not of the content it produced.

---

## Why the Function Moved

Three structural observations accumulated over P0-001's six weeks of operation:

### 1. The subproject did not produce distinct operational value

P0-001 and P0 answered the same operator (Gregory) and fetched the same governance documents. A triage session that ran in P0-001 was indistinguishable from one that ran in P0, except for context-switching overhead. In practice, Gregory executed triage in P0 most of the time because the alternative required opening a second Claude conversation.

The subproject pattern is valuable when the subproject has **a distinct operator**, **a distinct knowledge boundary**, or **a distinct runtime** (different MCP tools, different security posture, different data scope). P4-002 has all three vs. P4 parent. P8-001 has all three vs. P8. P0-001 had none of the three vs. P0. It was a structural shell with no operational distinction.

### 2. Protocols that auto-fetch beat subprojects that require context-switching

Once I-72 Superpowers landed in P4 (2026-04-17) and the agent-skills pattern was demonstrated working in Windsurf, the equivalent for Claude Projects became obvious: a wrapper fetches a named protocol on a trigger keyword, and the protocol's runbook executes. No subproject needed — the wrapper is the runtime, the protocol is the logic, and the governance folder is the distribution channel.

This makes `triage now` fetched-as-W-20 structurally identical to `TDD` fetched-as-Superpowers-skill in Windsurf. Both are disciplines loaded on demand from a canonical source. The subproject pattern was solving a problem the protocol-harness pattern solves better, cheaper, and with stronger version discipline.

### 3. Content absorbed into W-20 v1.1 was in the wrong structural home

The 2026-04-18 expansion of W-20 to v1.1 added three disciplines (Completion Verification, Failure Response, and the Plan Link cross-references) into a document titled "Ecosystem Triage & Governance Audit SOP." This worked for shipping the content fast, but it buried three independent runbooks inside a document named after a different workflow. A reader asking "what's BCG's process for closing an initiative?" would not think to open W-20.

The 2026-04-19 migration is the correction: W-20 goes back to being pure ecosystem triage, and the three disciplines get their own files with their own trigger keywords. This is what the protocol-harness pattern enforces structurally — one protocol, one trigger family, one file. The 2026-04-18 commit was right content in the wrong home; this migration moves the content into homes that match their operational shapes.

---

## Why This Migration Formalizes It

A lighter version of this retirement was already implicit in the 2026-04-18 commit: W-20 v1.1 expanded into a mega-SOP because no better structural home existed. The subproject (P0-001) was still the nominal wrapper, but the actual execution was running in P0 anyway.

The migration makes the informal formal:

- **Retires the subproject** instead of leaving it as a zombie container.
- **Carves the content** into homes that match each discipline's operational shape.
- **Establishes the pattern** (`/protocols/` folder with README design contract) so future disciplines have a home to go to without a migration.
- **Bumps P0 to v1.0** as the first formally versioned wrapper that invokes the pattern.

Without formalization, the system would have accumulated more content inside W-20 until the SOP became unnavigable — the classic failure mode where one file absorbs unrelated disciplines because no architectural alternative exists.

---

## Key Learnings

**1. Subprojects accrete. Protocols don't.**
Once a subproject is created, adding more content to it is the path of least resistance. It grows until retirement becomes expensive. A protocol folder doesn't grow content — new protocols are new files. The shape is additive, not accretive.

**2. "Solve an architectural problem by adding a subproject" is usually wrong.**
The initial P0-001 creation (2026-03-12) was a reasonable choice given the pattern options visible at the time. Six weeks of operation showed the subproject pattern was poorly fit. The Superpowers / Agent Skills demonstration in April made the better pattern obvious. **The lesson is not that P0-001 was a mistake** — it's that architectural choices ship before all patterns are visible, and retiring them cleanly when a better pattern emerges is part of normal operation, not a failure.

**3. The 2026-04-18 content absorption was right content in the wrong home.**
Shipping the three disciplines inside W-20 v1.1 was the fastest way to land the content. Leaving them there permanently would have been wrong. The migration pattern (carve out, elevate, cross-reference) generalizes: whenever a governance doc accumulates unrelated sections, the signal is that those sections want their own file.

**4. Version `1.0` means "first formally versioned," not "first ever."**
P0 custom instructions operated for months without a formal version stamp. Bumping to v1.0 at this migration is a reset — the prior iterations existed but were never version-tracked. The same pattern will apply to future wrappers that haven't yet been formally versioned.

**5. Retrospectives commit before Claude projects archive.**
The Claude UI step (archiving the P0-001 project) is manual and out-of-band. Filing the retrospective first ensures the record is canonical regardless of whether the archive step is completed, deferred, or forgotten. Future subproject retirements follow the same pattern: retrospective commit precedes UI archive.

---

## Post-Migration Checklist

- [x] Retrospective filed at `standards/migrations/P0-001_Retrospective.md` (v1.0, 2026-04-19)
- [ ] P0-001 Claude project archived (manual UI action — Gregory). **Do NOT delete** — preserve chat history for audit. Archival note: "Retired 2026-04-19 per I-75 migration. Function absorbed into P0 via protocol-harness pattern. See W-20 v1.2 at `standards/protocols/W-20_Ecosystem_Triage.md` and retrospective at `standards/migrations/P0-001_Retrospective.md`."
- [x] P0-001 removed from Catalog v3.0 Subproject Registry (Section 5)
- [x] P0-001 removed from EAB v1.7 (Section 3 Subprojects table, Section 4 parent routing, Section 2 Placement Guide)
- [x] P4-003 added to EAB v1.7 (corrects 2026-04-18 drift — registered in Catalog v2.9 but never propagated to EAB)
- [x] W-20 v1.2 filed at `standards/protocols/W-20_Ecosystem_Triage.md`
- [x] Initiative Closure Verification v1.0 filed at `standards/protocols/Initiative_Closure_Verification.md`
- [x] Initiative Plan Discipline v1.0 filed at `standards/protocols/Initiative_Plan_Discipline.md`
- [x] Post-Mortem Protocol v1.0 filed at `standards/protocols/Post_Mortem.md`
- [x] Post-Mortem Template relocated to `standards/protocols/resources/Post_Mortem_Template.md`
- [x] Redirect stubs filed at old W-20 SOP path and old Post-Mortem Template path (90-day sunset, deletion scheduled 2026-07-18)
- [x] Registry v3.5 reflects all relocations, new protocols, and redirect stubs
- [ ] EAB v1.7 propagated to 17 non-P0 projects (manual paste — Gregory + team, tracked in EAB Section 6)
- [ ] P0 custom instructions v1.0 pasted into Claude UI (manual — Gregory)
- [ ] Step 7 post-migration verification run in fresh P0 session (per I-75 migration prompt): `triage now`, `close I-dummy`, `activate I-dummy`, `post-mortem` on test incident — all four must pass; any fail → rollback

---

## References

- **Migration prompt** — `BCG — Protocol-Harness Migration Prompt v1.0` (authored 2026-04-19, authorized 2026-04-19)
- **I-75 registration** — Catalog v3.0 Section 2 (`I-75 — Ecosystem Protocol Harness`)
- **I-76 registration** — Catalog v3.0 Section 2 (`I-76 — Ecosystem Grading Schema Extraction`, Planned, next sprint)
- **Protocol harness pattern** — `standards/protocols/README.md` v1.0
- **Prior state** — W-20 v1.1 (2026-04-18) at `standards/BCG_W20_Ecosystem_Triage_SOP.md`, now redirect stub
- **Prior state** — GOV-020 Post-Mortem Template v1.0 (2026-04-18) at `standards/BCG_Post_Mortem_Template.md`, now redirect stub
- **Related pattern** — Superpowers / Agent Skills deployment (GOV-019, I-72 Ph1). Protocol-harness coexists; see `standards/protocols/README.md` Section 7 for the relationship.

---

*P0-001 Retrospective*
*Owner: Gregory Bernardo | Filed: 2026-04-19 | Scope: I-75 deliverable*
*Store in GitHub at bcg-ops-governance/standards/migrations/*
