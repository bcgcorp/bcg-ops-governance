# BCG Corp — Protocols Folder (Governing README)

**Version:** 1.0
**Effective:** April 2026
**Last Updated:** 2026-04-19
**Scope:** `standards/protocols/` folder and all files within
**Owner:** Gregory Bernardo, President
**Backup Operator:** Bob Brezniak
**Status:** Approved

---

## 1. Purpose & Scope

This folder holds BCG's **protocols** — versioned, fetch-on-trigger execution runbooks that Claude Projects load when a reserved trigger phrase fires. A protocol tells Claude exactly what steps to execute, in what order, with what halt conditions.

Protocols differ from W-series SOPs in intent: **W-series state policy (why); protocols state execution (how).** A topic may have both — when it does, they cross-reference each other and never duplicate content.

**In scope for this folder:** Every ecosystem-level execution runbook that is fetched and run by a Claude Project wrapper. W-20 (Ecosystem Triage) is the anchor protocol. Initiative Closure Verification, Initiative Plan Discipline, and Post-Mortem join it in this v1.0 establishment.

**Out of scope:** Policy documents (stay in `standards/` root), single-project SOPs that don't get fetched cross-project (stay in their project's knowledge base), Windsurf/Claude-Code agent skills (live in `.windsurf/skills/` in their respective repos per GOV-019).

---

## 2. Design Contract — Four Principles

Every protocol in this folder satisfies these four principles without exception. A file that violates any one of them is not a protocol and does not belong here.

### Principle 1 — Triggers are keyword-based and unambiguous.

Reserved trigger phrases fire a protocol. Natural-language inference does not. Keywords are short, distinctive, and registered in Section 6 of this README before any protocol ships. Prohibit operation-from-memory — if the keyword fires, the wrapper fetches the protocol and executes it, even if it ran the same protocol five minutes ago.

Natural-language triggers degrade silently as the conversation context evolves. Keyword triggers do not. This is why every protocol declares its exact trigger phrases and why this README maintains a global reservation list.

### Principle 2 — Protocols version-stamp themselves.

Every protocol carries a header block at the top of the file with four fields: **Protocol ID**, **Version**, **Compatible Wrappers** (project + minimum version), **Last Updated**. Wrappers that invoke a protocol MUST verify the Compatible Wrappers field includes themselves at or above their own instruction version.

This forces the failure mode "wrapper and protocol disagree on what to do" to surface as an explicit halt rather than a silent misexecution. When a wrapper's instruction version bumps, every protocol it fetches is audited for compatibility — that audit is a standing discipline, not an ad-hoc task.

### Principle 3 — Protocols are prescriptive, not descriptive.

Imperative voice. Numbered steps. Explicit halt conditions at each step. Specified output format. A protocol that cannot be executed top-to-bottom by a human reader (or by Claude following the runbook) is not a protocol — it is a policy document, and it belongs in `standards/` root with a W-number.

"We should verify evidence before closing" is descriptive. "Fetch the evidence link. Halt if it does not resolve" is prescriptive. This folder holds only the latter.

### Principle 4 — Fail loud, fail halted.

Every protocol enumerates its halt conditions explicitly, per step and consolidated. When a halt fires, the protocol stops, reports what triggered the halt, and waits for human input. It does not fall back to a "best-effort" path. It does not proceed from memory.

Bias toward annoying-but-safe over smooth-but-wrong. A halted protocol is recoverable; a silently-drifted one produces catalog corruption that takes weeks to detect.

---

## 3. Required Protocol File Format

Every protocol file in this folder matches the following template structure:

```
# BCG Corp — [Protocol Name]

**Protocol ID:** [short identifier, e.g., W-20 or named slug]
**Version:** [semantic, x.y]
**Compatible Wrappers:** [list: P-code v≥X]
**Trigger Keywords:** [backtick-wrapped exact phrases, pipe-separated]
**Last Updated:** YYYY-MM-DD
**Owner:** [name]
**Backup Operator:** [name]
**Status:** Approved | Draft | Deprecated

---

## 1. Purpose
[1 paragraph: what this protocol executes and why it exists.]

## 2. Pre-Execution Fetch Requirements
[Documents the protocol must fetch before execution begins.
Each entry includes path, halt condition on fetch failure,
and halt condition on version mismatch.]

## 3. Execution Runbook
[Numbered imperative steps. Every step that can fail carries a
halt condition written in the form "Halt if X → report Y. Do not Z."]

## 4. Output Format
[Exact specification of what the protocol produces.
Required fields, location, naming.]

## 5. Halt Conditions — Consolidated Reference
[Table: every halt condition from the runbook, consolidated.
Columns: condition, trigger, required report format,
forbidden fallback (usually "do not operate from memory").]

## 6. Relationship to Other Governance
[Cross-references to W-series SOPs, catalogs, other protocols.
A protocol with an SOP partner links to it here. Never duplicate
the SOP's content — link to it.]

## 7. Revision History
[Table: version, date, what changed.]
```

Deviations from this template require an entry in the protocol's revision history explaining the deviation.

---

## 4. Relationship to W-Series SOPs

A protocol and a W-series SOP may cover the same ground. When both exist, their roles are distinct:

- **SOP states policy and rationale** — why this is the way we do it, who signs off, what the tradeoffs were, what failure modes drove the rule.
- **Protocol states execution** — the exact steps, the halts, the output format, the fetches.

Cross-reference both ways: the SOP's "Execution" section points to the protocol; the protocol's Section 6 points back to the SOP. **Never duplicate content across the two.** Content duplication is the failure mode this pattern exists to prevent — when an SOP and a protocol disagree on a step, there is no way for a reader to know which is authoritative.

**Dual-identity files.** W-20 is both a W-number (it started as an SOP) and a protocol (it's executable). It retains the W-20 name and lives in this folder. It has no separate SOP partner because its prior policy content was absorbed into the protocol's Purpose section. This is a legacy carve-out; new protocols launched from this folder onward are **named only, not W-numbered** — see Section 5.

---

## 5. Numbering & Naming Convention

**New protocols are named, not numbered.** Filename matches protocol name in CamelCase_With_Underscores, e.g., `Initiative_Closure_Verification.md`, `Post_Mortem.md`. Rationale: protocols are invoked by trigger keywords, not by ID lookup. Numbering adds memorization cost without operational value.

**W-numbered protocols are legacy-only.** W-20 carries its W-number because it predates this folder. Future ecosystem-level SOPs that become protocols follow the same carve-out pattern (they keep their W-number as a filename prefix: `W-XX_<n>.md`). Net-new protocols do not get W-numbers.

**Keyword collisions are forbidden.** Section 6 maintains the global reservation list. Proposing a new protocol with an unreserved keyword is a requirement before the protocol is drafted — keyword reservation precedes content.

---

## 6. Keyword Reservation List

Every trigger phrase reserved by a protocol in this folder is listed here. New protocols reserve their keywords in this list before their content is authored. Collisions (two protocols claiming the same phrase) are not permitted.

| Trigger Phrase | Protocol | Fires When |
|---|---|---|
| `triage now` | W-20 Ecosystem Triage | User requests a sync cycle or batch processing |
| `run reconciliation` | W-20 Ecosystem Triage | User requests a governance-doc reconciliation pass |
| `audit tier 1` | W-20 Ecosystem Triage | User requests a Tier 1 governance audit |
| `[FROM: P{#}` header in user message | W-20 Ecosystem Triage | A satellite delivers a Standard Update to P0 |
| `close I-{number}` | Initiative Closure Verification | Owner proposes Active → Complete transition |
| `verify closure` | Initiative Closure Verification | User requests verification gate on a completion |
| `mark complete I-{number}` | Initiative Closure Verification | Same as `close I-{number}` — alternate phrasing |
| `activate I-{number}` | Initiative Plan Discipline | Owner proposes Planned → Active transition |
| `plan I-{number}` | Initiative Plan Discipline | User requests a plan record before activation |
| `post-mortem` | Post-Mortem | User initiates an ecosystem-level incident review |
| `root-cause this` | Post-Mortem | User requests root-cause analysis of an observed failure |
| `write incident review` | Post-Mortem | Same as `post-mortem` — alternate phrasing |

**Reservation discipline:** Adding a new trigger phrase requires (a) confirming no existing protocol claims it, (b) confirming it is distinctive enough not to fire by accident in normal conversation, (c) updating this section in the same commit that ships the new protocol.

---

## 7. Relationship to the Superpowers / Agent Skills Pattern

The protocol-harness pattern shares DNA with the Superpowers / Agent Skills framework (see GOV-019). Both encode disciplined workflows that auto-invoke on trigger, both use progressive disclosure (header loads first, body loads on match), both version-pin, both enforce halt conditions.

**Where they differ:**

| Dimension | Superpowers / Agent Skills | Protocol-Harness |
|---|---|---|
| Runtime | Windsurf, Claude Code (skill-aware) | Claude.ai Projects (no skill runtime) |
| Invocation | Description-match via Cascade/Code | Keyword-match via wrapper fetch |
| Distribution | Vendored into repo `.windsurf/skills/` | Fetched from `bcg-ops-governance/standards/protocols/` |
| Content scope | Code-adjacent disciplines (TDD, debugging, git workflow) | Governance-adjacent disciplines (triage, verification, planning, post-mortem) |
| Versioning | Git commit pin + SKILL.md header | Protocol header block + git |

**They coexist, they do not compete.** A workflow that lives naturally in code (TDD) stays in Windsurf as a skill. A workflow that lives in governance (ecosystem triage) becomes a protocol here. Some workflows may warrant both a Windsurf skill and a protocol — when that happens, they cross-reference like an SOP/protocol pair (Section 4).

**For future authors:** If you're writing a discipline and unsure which pattern to use, ask whether it will be invoked during code editing (Windsurf skill) or during governance/planning conversations (protocol). Both-invocations disciplines get both representations with explicit cross-reference.

---

## 8. Data Sources a Protocol May Reference

Protocols fetch canonical data from a fixed list of sources. Fetching anything else requires a revision to this section first.

| Source | Path | What It Provides |
|---|---|---|
| Ecosystem Awareness Block (EAB) | `standards/BCG_Ecosystem_Awareness_Block.md` | Project registry, subproject list, routing rules |
| Initiative & Workstream Catalog | `standards/BCG_Initiative_and_Workstream_Catalog.md` | I-numbers, status, owners, Plan Link references |
| Governance Doc Registry | `standards/BCG_Governance_Doc_Registry.md` | All governance docs, versions, fetch triggers |
| Team Directory | `standards/BCG_Team_Directory.md` | People, roles, project assignments |
| Artifact Naming Standard | `standards/BCG_Artifact_Naming_and_Capture_Standard.md` | Canonical filing locations |
| Artifact Deployment Routing | `standards/BCG_Artifact_Deployment_Routing_Standard.md` | Where non-document artifacts live (GOV-021) |
| Protocol resources | `standards/protocols/resources/` | Templates, checklists, data assets co-located with protocols that use them |
| Ecosystem Grading Schema | *(forthcoming — I-76)* | Scoring dimensions, freshness tiers, parity checks. Slot reserved. |

**Grading Schema note:** Currently the dashboard (`BCG_Master_Strategic_Plan.html`) carries the grading schema as JS constants. I-76 extracts it to canonical governance. Protocols that need scoring dimensions today may fetch the dashboard; post I-76, they fetch the canonical doc.

---

## 9. Change Governance

Protocols are versioned like any governance doc. Every edit bumps the version. Never edit in place without a revision history entry.

**Breaking changes to Compatible Wrappers require downstream wrapper updates before merge.** If a protocol bumps its minimum wrapper version, every affected wrapper must be updated to that version in the same migration. A wrapper invoking a protocol it is no longer compatible with must halt on version mismatch — it must not fall back to "best-effort."

**Wrapper-bump compatibility discipline.** When a wrapper (e.g., P0 custom instructions) bumps its version, every protocol it fetches must be audited for Compatible Wrappers compatibility within the same change window. This discipline is recorded in W-20's revision discipline and in the wrapper's own revision history.

---

## 10. Revision History

| Version | Date | What Changed |
|---------|------|-------------|
| 1.0 | 2026-04-19 | Initial version. Establishes protocol-harness pattern. Anchor protocols: W-20 v1.2 (migrated), Initiative_Closure_Verification v1.0 (carved from W-20 v1.1), Initiative_Plan_Discipline v1.0 (formalized from Catalog Plan Link Rule + W-20 Trigger 3 plan-reference language), Post_Mortem v1.0 (carved from W-20 v1.1 Section 4E). Post_Mortem_Template relocated to `resources/` subfolder. |

---

*BCG Corp Protocols Folder — Governing README*
*Owner: Gregory Bernardo, President | Store in GitHub at bcg-ops-governance/standards/protocols/*
