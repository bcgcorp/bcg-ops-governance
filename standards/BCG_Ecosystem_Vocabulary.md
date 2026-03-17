# BCG Ecosystem Vocabulary
**Version:** 1.2
**Last Updated:** 2026-03-17
**Owner:** Gregory Bernardo
**GitHub:** bcgcorp/bcg-ops-governance/standards/BCG_Ecosystem_Vocabulary.md
**Fetch URL:** https://raw.githubusercontent.com/bcgcorp/bcg-ops-governance/refs/heads/main/standards/BCG_Ecosystem_Vocabulary.md

---

> **Governance note:** This file is the single source of truth for all BCG ecosystem terminology.
> All other surfaces (agenda templates, JSX artifacts, BCG-Wizard guide, project instructions)
> reference this file rather than maintaining independent copies. Follows the
> "one document owns one definition" principle. Do NOT duplicate definitions elsewhere.

---

## 1. Command Terms

| Term | Context | Definition |
|------|---------|------------|
| Sitrep | Gregory requests | Structured status report covering all projects, with blockers flagged and actions listed. Default: emoji-marked markdown. "Formal sitrep" = branded .docx. |
| "Can I pivot?" | Team member requests | Request to change direction on an assigned task. State what you want to change and why. Gregory approves or redirects. |
| Pressure-test | Gregory requests | Run an idea through the 6-criteria framework: revenue impact, capacity impact, competitive moat, scalability, reversibility, opportunity cost. |
| "Route to P#" | Any direction | This work belongs in a different project. Hand it off to the correct satellite using a structured handoff prompt. |
| "Challenge me on this" | Gregory requests | Force pushback from the most skeptical executive lens. Surface blind spots and risks. |
| "What am I missing?" | Gregory requests | Devil's advocate analysis. Surface risks, dependencies, and failure modes not yet considered. |
| "All five perspectives" | Gregory requests | Full C-suite analysis (CEO/CTO/CFO/COO/CIO) of the topic at hand. |
| "Phase this out" | Gregory requests | Structure a recommendation as a 30/60/90-day or quarterly implementation timeline. |
| "Draft for the plan" | Gregory requests | Produce a document-ready section formatted for the master strategic plan. |
| "Model this" | Gregory requests | Financial scenario with explicit assumptions, math shown, tables for comparison. |
| Quick | Modifier | Added to any command to skip clarifying questions and execute immediately from available context. |
| Sync the project | Gregory requests | Produce copy-paste-ready handoff prompts for P0 ingest AND all affected satellite projects. |
| Ecosystem assessment | Gregory requests | Run full W-20 audit (Tiers 1-3). Produce summary scorecard with pass/fail per check. "quick" modifier = Tier 1 only. |

---

## 2. Ecosystem Numbering

| Pattern | System | Description |
|---------|--------|-------------|
| P# (e.g., P5) | Project code | A Claude project in the BCG ecosystem. P0 = master hub, P1-P10 = satellites. Subprojects use P#-### (e.g., P4-002). |
| I-## (e.g., I-40) | Initiative number | A tracked workstream item with defined owner, status, and target. Look up in the Initiative Catalog on GitHub. |
| W-## (e.g., W-14) | Workflow / SOP number | An operational procedure document. Owned by P2 (SOP & Workflow Library). |
| D-## (e.g., D-04) | Decision number | A pending decision requiring Gregory's call. Numbered for tracking in the Pending Decisions queue. |
| B-## (e.g., B-24) | PyRevit button backlog | A Revit automation tool in the development backlog. Tracked in P4-002. 42-button backlog: B-01-B-42 across 9 panels. |
| WS-## (e.g., WS-05) | Workstream | A thematic grouping of related initiatives. 11 active workstreams (WS-01-WS-11). |

---

## 3. Document & Process Terms

| Term | Definition |
|------|------------|
| Handoff prompt | Structured message that transfers context between projects. Uses label format: [FROM: P#] [DATE: date] [TOPIC: brief]. |
| Carry-forward | An action item that persists from one weekly sync to the next until resolved. Tracked on Page 1 of the sync agenda. |
| Ecosystem update | Structured output from a meeting or work session that routes decisions, status changes, and new items to the correct satellite projects. |
| EAB | Ecosystem Awareness Block — a governance stub embedded in every project's instructions. Ensures all projects know the ecosystem structure and can route work correctly. Current version: v1.4. |
| Sync packet | A structured data transfer from a satellite project to P0. Format: .md only. Uses the [FROM: P#] label format. |
| Quick reference card | Page 3 of the weekly sync agenda — permanent reference showing projects, locations, and vocabulary. |
| Governance Doc Registry | Master index of all BCG governance documents. Single source of truth for what documents exist, where they live, and when to fetch them. GitHub: bcg-ops-governance/standards/. |
| P0 | The master strategic plan hub. Consumes approved outputs from satellites (P1-P10). Does not produce; it synthesizes. |
| Satellite project | Any of P1-P10 (and their subprojects). Production work happens here. Outputs flow one-directionally to P0. |
| Initiative Catalog | The authoritative list of all 61 active initiatives (I-01-I-63, minus I-20 and I-32). GitHub: bcg-ops-governance/standards/. Next available slot: I-64. |

---

## 4. Status Terms

| Term | Color | Hex | Meaning |
|------|-------|-----|---------|
| Open | Amber | #D4850A | Active, not yet resolved |
| Done | Green | #27AE60 | Completed — will roll off carry-forward tracker when page fills |
| Blocked | Red | #C0392B | Cannot proceed — requires action from someone else, identified in notes |
| Planned | — | — | Scoped and tracked but not yet started |
| Active | — | — | In progress |
| Deferred | — | — | Intentionally paused; not abandoned |
| Retired | — | — | Permanently closed; knowledge consolidated into parent or successor |

---

## 5. Change Log

| Version | Date | What Changed |
|---------|------|-------------|
| 1.2 | 2026-03-17 | Initiative Catalog count corrected 60 to 61. B-series backlog updated B-01-B-41 to B-01-B-42 (42 buttons across 9 panels per BCG_Tools_Inventory.md). EAB current version updated v1.3 to v1.4. Added P10 to satellite project definition. Initiative Catalog next slot I-64 added. |
| 1.1 | 2026-03-14 | Initiative Catalog count corrected 59 to 60. B-series backlog updated to B-01-B-41. |
| 1.0 | 2026-03-14 | Initial version. Registered as I-62 deliverable. |

---

*Maintained in GitHub at bcg-ops-governance/standards/BCG_Ecosystem_Vocabulary.md.
All surfaces reference this file — never duplicate definitions.*