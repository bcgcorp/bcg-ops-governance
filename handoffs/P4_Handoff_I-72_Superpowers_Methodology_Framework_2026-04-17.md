# P4 Handoff -- I-72 Superpowers Methodology Framework

**[FROM: P0 -- Master Strategic Plan] [DATE: 2026-04-17] [TOPIC: I-72 Superpowers Methodology Framework -- Phase 1 complete, Phase 2/3 scope for P4]**

**Approval status:** Approved by Gregory Bernardo 2026-04-17
**Routes to:** P4 (AI Infrastructure & Deployment)

---

## Summary

I-72 adopts obra/superpowers, an MIT-licensed, Anthropic-marketplace skills framework, as BCG's methodology layer for AI-assisted coding. Phase 1 (personal evaluation in Windsurf) is complete. Phase 2 (scoped deployment + security review) and Phase 3 (team-wide rollout + BCG-specific skills) are scoped to P4 for Q2--Q3 2026.

Superpowers is the current reference implementation for agentic skills frameworks. 152k GitHub stars, 13.1k forks, v5.0.7 released 2026-03-31. Skills auto-invoke via progressive disclosure -- they encode disciplined workflows like test-driven-development (RED-GREEN-REFACTOR enforcement), systematic-debugging (4-phase root cause), brainstorming-before-implementation, and subagent-driven-development.

The framework is adopted in Phase 1, not just evaluated. Phase 2 decides whether to expand scope and publish BCG-specific skills on top of it. Rolling back Phase 1 is a `git revert` of the vendored skills if Phase 2 concludes the posture is wrong.

## What Superpowers Is

Fourteen core skills bundled as a single plugin:

| Category | Skills |
|---|---|
| Testing | test-driven-development |
| Debugging | systematic-debugging, verification-before-completion |
| Collaboration | brainstorming, writing-plans, executing-plans, dispatching-parallel-agents, requesting-code-review, receiving-code-review, using-git-worktrees, finishing-a-development-branch, subagent-driven-development |
| Meta | writing-skills, using-superpowers |

Token cost is light. Core bootstrap under 2k tokens. Skill bodies load only on invocation.

Supported platforms: Claude Code (official Anthropic marketplace), Cursor, Codex, OpenCode, Gemini CLI, GitHub Copilot CLI, and Windsurf (via native Agent Skills spec, added 2026-01-13).

License: MIT. Maintained by Jesse Vincent (obra) and Prime Radiant.

## Phase 1 -- Complete (2026-04-17)

Installed Superpowers v5.0.7 in Windsurf on the canonical bcg-ops-revit-tools working copy (`~\CascadeProjects\pyRevit`).

Deployment pattern used: **git-vendored workspace skills**. Superpowers `skills/*` contents copied into `.windsurf/skills/`, committed to main, pushed to GitLab. Every team member who pulls bcg-ops-revit-tools gets identical skills automatically. No per-user install, no per-user drift, no global install pollution.

Merge commit `03bcaf8` on bcg-ops-revit-tools main. Version marker at `.windsurf/_SUPERPOWERS_VERSION.md` documents the pin, license, update procedure, known degradations, and coexistence rules.

Functional verification passed:
- All 14 skills discovered in Cascade Customizations panel
- Live auto-invocation confirmed ("help me plan a new pyRevit button" triggered `brainstorming` without `@mention`)

## Known Degradations in Windsurf

Cascade is a single-agent-flow model. Two Superpowers skills degrade:

- `subagent-driven-development` falls back to `executing-plans` (serial execution)
- `dispatching-parallel-agents` is not operable as designed

For workflows that genuinely need subagent orchestration (large Odoo refactors, cross-repo work), use Claude Code instead of Windsurf. pyRevit button development is unaffected -- those workflows are naturally serial.

## Coexistence With Existing Windsurf Layers

Four distinct layers; do not consolidate.

| Layer | Location | Purpose |
|---|---|---|
| Rules | `.windsurfrules` (v1.1) | Behavioral constraints, always-on (opaque schema architecture, coding standards, etc.) |
| Skills | `.windsurf/skills/` | Methodology scaffolding, progressive disclosure (Superpowers + future BCG skills) |
| Workflows | `.windsurf/workflows/` | Slash-command prompt templates |
| AGENTS.md | Per-directory | Directory-scoped instructions (not yet in BCG use) |

`.windsurfrules` v1.1 continues to govern BCG-specific coding constraints. Skills are orthogonal methodology. Neither layer enforces the other.

## Phase 2 Scope (Q2 2026)

Two parallel tracks. Total estimate ~8 hours.

### Track A -- Claude Code Deployment for I-52 Phase 2

Owner: P4 initiative lead.

Scope:
- Install Superpowers via Anthropic official marketplace on the I-52 CI/CD runner
- Decide which skills are enforced in the GitHub Actions pipeline vs. advisory
- Document the pin/update policy (no auto-update in production)
- Coordinate with Bob Brezniak on the runner's CLAUDE.md (I-52 Phase 1 artifact)

Why this track: GitHub Copilot CLI is officially supported as of Superpowers v5.0.7. I-52 Phase 2 is BCG's nearest CI/CD target for automated skill-enforced workflows.

### Track B -- Security Review

Owner: Bob Brezniak. Scoped sub-task under I-72, not a separate I-number.

Narrower than I-61 (Cowork security review) because Superpowers has smaller blast radius: no client-data access path, no network endpoints, no persistent agent.

Three items to verify:

1. **Supply chain posture post-v5.0.2.** The v5.0.2 release removed 714 files and ~85k lines of `node_modules`, replacing express/ws/chokidar with Node built-ins. Confirm v5.0.7 ships this lean footprint; spot-check `package.json` dependencies.
2. **SessionStart hook behavior.** Superpowers injects a bootstrap prompt at session start. Read the hook code; confirm it does not exfiltrate data or phone home.
3. **Auto-update policy.** Default Superpowers install allows `/plugin update` to pull latest. BCG governance posture (GOV-001) requires pinned versions with manual review. Document the approved workflow: pin current tag, review changelog on bump, security spot-check on bump.

Deliverable: short memo to P0 (standard handoff) recommending go/no-go for Phase 3.

## Phase 3 Scope (Q3 2026)

Contingent on Phase 2 clearance.

- Team-wide Windsurf deployment via existing workspace-skill distribution (pulls happen via `git pull` on bcg-ops-revit-tools)
- BCG-specific skills authored on the Superpowers foundation:
  - Revit QC patterns (verification-before-completion specialized for pyRevit)
  - Hyperscaler review discipline (security-design review checklist)
  - Odoo module review patterns
- BCG-authored skills become BCG IP; storage location TBD (candidates: `bcg-ops-revit-tools`, `bcg-ops-knowledge` when available)

## Why This Matters to BCG

Four concrete applications, ranked by leverage:

1. **I-52 Phase 2 (CI/CD).** Direct install target. Superpowers runs natively in GitHub Copilot CLI.
2. **I-65 (On-Prem AI Production Intelligence Suite).** Architectural reference. `subagent-driven-development` is the clearest prior art for how BCG's on-prem AI orchestration should structure implementer and reviewer roles.
3. **I-71 (On-Premise AI / Revit Live Model Integration).** Methodology template. Brainstorm → plan → execute → review is the loop BCG wants Claude running when it touches sanitized Revit models.
4. **I-60 (Cowork Plugin).** Build reference. Superpowers is the canonical example of "how to structure a plugin well."

## Dependencies and Coordination

- **Hard dep:** Jason Harris onboarded (cleared 2026-04-01)
- **Soft dep:** I-65 Phase 1 stable -- for architectural-template alignment
- **Soft dep:** I-52 Phase 2 runner operational -- for Track A install
- **Coordinates with:** I-60, I-65, I-71 (see above); I-61 (Cowork security review pattern, scaled down)
- **Does not block:** I-71 can proceed without I-72; Superpowers is reference, not critical path

## Action Items for P4

1. Schedule Phase 2 kickoff when I-65 Phase 1 is stable. Output a rough scoping plan back to P0.
2. Track A: scope the I-52 Phase 2 install. Coordinate with Bob on the runner's `CLAUDE.md`.
3. Track B: route the scoped security review to Bob (three-item checklist above). Bob delivers memo to P0.
4. On Phase 2 clearance: scope Phase 3 team deployment and BCG-specific skill authoring.

## Open Items

- Windsurf support for subagent orchestration -- monitor Cognition/Windsurf roadmap; if Cascade gains true subagent dispatch, `subagent-driven-development` and `dispatching-parallel-agents` degradations would close
- BCG-specific skill storage location -- defer to Phase 3 scoping
- Pin/bump cadence -- Phase 2 Track B output should include a recommended review frequency (quarterly? every minor version?)

## Reference

- Superpowers repo: https://github.com/obra/superpowers
- v5.0.7 release notes: https://github.com/obra/superpowers/releases/tag/v5.0.7
- v5.0.2 supply-chain-hardening postmortem: https://blog.fsck.com/releases/2026/03/11/superpowers-v5-0-2/
- Windsurf Agent Skills docs: https://docs.windsurf.com/windsurf/cascade/skills
- Agent Skills open spec: https://agentskills.io
- BCG install location: `~\CascadeProjects\pyRevit\.windsurf\skills\` (bcg-ops-revit-tools canonical working copy)
- BCG version marker: `.windsurf/_SUPERPOWERS_VERSION.md` in bcg-ops-revit-tools
- Catalog entry: `bcg-ops-governance/standards/BCG_Initiative_and_Workstream_Catalog.md` v2.8, I-72
