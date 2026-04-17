# BCG Corp -- Windsurf Agent Skills Deployment Pattern

**Document ID:** GOV-019
**Version:** 1.0
**Effective:** April 2026
**Last Updated:** 2026-04-17
**Scope:** Any BCG repository where team members use Windsurf/Cascade
**Owner:** Gregory Bernardo, President

---

## 1. Purpose

This document establishes the approved pattern for deploying Agent Skills to BCG team members in Windsurf/Cascade. It emerged from the I-72 Superpowers installation on 2026-04-17 and is now the reference pattern for all future skill deployments.

The problem this solves: teams that install AI agent skills ad-hoc end up with per-user drift -- one developer has v5.0.7, another has v5.0.2, a third never installed, a fourth has a BCG-modified copy. Troubleshooting becomes "which version are you on?" and shared workflows become unreliable.

BCG's answer: **vendor skills into the repo, workspace-scoped, git-pinned.** Every team member gets identical skills automatically on `git pull`.

---

## 2. The Pattern

### 2.1 Scope

| Scope | Location | When to Use |
|---|---|---|
| **Workspace** | `{repo}/.windsurf/skills/` | **Default for BCG.** Skills are part of the repo, shared with everyone. |
| Global | `~/.codeium/windsurf/skills/` | Personal experiments only. Never BCG-approved skills. |
| System (Enterprise) | OS-specific paths | Not currently used at BCG. |

**Rule:** Any skill BCG wants multiple people to use goes at workspace scope, committed to the repo. Period.

### 2.2 Directory Structure

For a repo named `bcg-ops-revit-tools`:

```
bcg-ops-revit-tools/
  .windsurf/
    _SUPERPOWERS_VERSION.md   <-- version marker (see 2.4)
    skills/
      brainstorming/
        SKILL.md              <-- required: YAML frontmatter with name + description
        {supporting files}
      test-driven-development/
        SKILL.md
        {supporting files}
      ...
    workflows/                <-- distinct layer, not for skills
  .windsurfrules              <-- distinct layer, behavioral constraints
```

**Cascade auto-discovers** every subdirectory of `.windsurf/skills/` that contains a valid `SKILL.md`. No configuration required.

### 2.3 SKILL.md Requirements

Every skill folder needs a `SKILL.md` with YAML frontmatter:

```markdown
---
name: skill-name-in-lowercase-hyphens
description: Concise description of when Cascade should invoke this skill
---

# Skill body in markdown below
```

The `description` is what Cascade pattern-matches against user prompts to decide whether to auto-invoke. Write it clearly. Bad: "A helpful skill." Good: "Use when implementing any feature or bugfix, before writing implementation code."

### 2.4 Version Marker File

Every BCG repo that vendors third-party skills must include `.windsurf/_{SOURCE}_VERSION.md` documenting:

- Upstream repo URL
- Pinned version / commit SHA
- License
- BCG initiative that tracks the deployment
- Update procedure (who approves, what review is required)
- Known degradations for Windsurf (if any skills depend on subagent orchestration)
- Coexistence rules (how it relates to `.windsurfrules`, workflows, AGENTS.md)

Filename pattern: `_{SOURCE_SHORTNAME}_VERSION.md`. Example: `_SUPERPOWERS_VERSION.md`.

This file lives at `.windsurf/_{SOURCE}_VERSION.md`, **one level above `skills/`** -- Cascade treats every direct child of `.windsurf/skills/` as a skill folder, so version markers must live outside that directory to avoid parse errors.

---

## 3. Install Procedure (First-Time Deployment)

Use this when adding a new third-party skill collection to a BCG repo.

### Step 1 -- Branch

```powershell
git checkout -b feature/i-XX-{skill-source}-{version}
```

### Step 2 -- Clone upstream to a temp location (not inside the repo)

```powershell
cd $env:TEMP
git clone {upstream-url} {source}-vendor
cd {source}-vendor
git checkout {pinned-version-tag}
git describe --tags   # confirm you're on the right tag
```

### Step 3 -- Copy skill contents into the repo

Copy the **contents** of the upstream `skills/` directory into `{repo}/.windsurf/skills/`. Do not copy the `skills/` folder itself -- that would create `{repo}/.windsurf/skills/skills/`.

```powershell
$repo = "C:\path\to\{repo}"
New-Item -ItemType Directory -Force -Path "$repo\.windsurf\skills" | Out-Null
Copy-Item -Recurse -Force .\skills\* "$repo\.windsurf\skills\"
```

### Step 4 -- Write the version marker

Create `.windsurf/_{SOURCE}_VERSION.md` at the repo root's `.windsurf/` directory, outside `skills/`. Use the template in Section 5.

### Step 5 -- Commit and verify locally

Commit to the feature branch. Open the repo in Windsurf (fresh session). Verify:

1. Customizations -> Skills panel lists all expected skills
2. An auto-invocation test prompt triggers at least one skill without `@mention`

Do NOT push until both verifications pass.

### Step 6 -- Push, MR (if applicable), merge

For I-number work, merge with `--no-ff` to preserve the feature-branch boundary in history:

```powershell
git checkout main
git pull origin main
git merge --no-ff feature/i-XX-{skill-source}-{version} -m "Merge I-XX: {description}"
git push origin main
```

### Step 7 -- Delete feature branch

```powershell
git branch -d feature/i-XX-{skill-source}-{version}
git push origin --delete feature/i-XX-{skill-source}-{version}
```

---

## 4. Update Procedure (Version Bumps)

**No auto-update.** Cascade and Windsurf do not auto-update workspace skills; upstream tools like Claude Code's `/plugin update` do not touch workspace-vendored skills. Updates are explicit, reviewed git operations.

### Step 1 -- Review the upstream changelog

Read release notes for every version between the current pin and the target pin. Flag anything security-relevant, anything that changes skill descriptions (affects auto-invocation), anything that touches session-start hooks.

### Step 2 -- Security review (if required by the initiative)

For Superpowers and other skill sources that include executable scripts or session hooks, a BCG-internal security review is required before bumping. Scope is narrower than full MCP or plugin review because skills have no network or data-access surface of their own, but three items are always checked:

1. Supply chain -- has the dependency tree grown? Are there new npm/pip packages?
2. Session hooks -- does the source inject prompts at session start? What do they say?
3. Changelog -- any breaking changes to skill behavior that would affect existing team workflows?

### Step 3 -- Execute the bump

Branch, replace `{repo}/.windsurf/skills/*` with the new version's contents, update the version marker, commit, verify in Windsurf, MR/merge, push.

### Step 4 -- Communicate the bump

Post a note in Teams to the affected team so users know to `git pull` before their next work session.

---

## 5. Version Marker Template

Copy this into `.windsurf/_{SOURCE}_VERSION.md`:

```markdown
# {Source Name} Skill Source

**Upstream:** {repo URL}
**Version pinned:** {tag or SHA}
**Pinned date:** YYYY-MM-DD
**License:** {MIT | Apache-2.0 | etc.}
**BCG initiative:** I-XX ({initiative name})
**Phase:** {which phase of the initiative this deployment is part of}

## How to update

1. Review changelog: {releases URL}
2. {Who approves bumps -- typically the initiative owner + security reviewer}
3. Clone target version to temp, copy `skills/*` into `.windsurf/skills/`, update this file
4. Commit on feature branch, verify in Windsurf locally, open MR for review

## Known degradations in Windsurf

{List any skills that don't fully work in Cascade due to platform differences.
Common ones: subagent-driven-development, dispatching-parallel-agents.}

## Coexistence

- `.windsurfrules` ({version}) -- behavioral constraints, always-on
- `.windsurf/skills/` -- methodology scaffolding, progressive disclosure
- `.windsurf/workflows/` -- slash-command prompt templates
- These are distinct layers; do not consolidate.
```

---

## 6. Coexistence With Other Windsurf Layers

Windsurf supports four instruction layers. Skills are one of them. Do not consolidate them.

| Layer | Location | Load Pattern | Use For |
|---|---|---|---|
| Rules | `.windsurfrules` or `.windsurf/rules/` | Always-on or glob-scoped | Behavioral constraints ("use tabs not spaces"), project conventions, coding standards |
| Skills | `.windsurf/skills/{skill}/SKILL.md` | Progressive disclosure -- name + description visible, body loaded on invocation | Multi-step methodology with supporting files |
| Workflows | `.windsurf/workflows/{workflow}.md` | Manual via `/slash-command` | Prompt templates for repeatable tasks the user triggers explicitly |
| AGENTS.md | Any directory | Auto-attached based on file location | Directory-scoped context ("files in this folder follow X pattern") |

**Guidance:**
- If Cascade should pick it up automatically AND it needs supporting files -> Skill
- If it's a short behavioral constraint -> Rule
- If you always want to trigger it yourself -> Workflow
- If it only applies when Cascade is editing a specific directory -> AGENTS.md

Do not put methodology skills in `.windsurfrules`. Do not put always-on constraints as skills. Do not put user-triggered templates as skills.

---

## 7. Claude Code Compatibility

BCG uses both Windsurf and Claude Code. Windsurf natively discovers skills at `.claude/skills/` when "Read Claude Code Config" is enabled in Cascade settings. This means:

- **Skills authored to the Agent Skills spec are portable across both tools.**
- The Anthropic official marketplace for Claude Code (`/plugin install ...`) installs skills to `~/.claude/plugins/cache/{marketplace}/{plugin}/<version>/skills/`. That path is NOT automatically scanned by Windsurf even with Claude Code Config reading enabled, because the directory structure is different.
- **For workspace-committed BCG skills, this doesn't matter.** Skills in `{repo}/.windsurf/skills/` are discovered by Windsurf directly and by Claude Code if the user configures Claude Code to scan the project.

**Known platform difference:** Cascade is a single-agent-flow model. Skills that depend on subagent orchestration (e.g., Superpowers `subagent-driven-development`, `dispatching-parallel-agents`) degrade to serial execution in Windsurf. For workflows that genuinely need subagent orchestration, use Claude Code. Document these degradations in the version marker so team members know when to switch tools.

---

## 8. Known BCG Deployments

| Initiative | Source | Version | Repo | Commit | Status |
|---|---|---|---|---|---|
| I-72 | obra/superpowers | v5.0.7 | bcg-ops-revit-tools | `03bcaf8` merge (2026-04-17) | Phase 1 complete |

New deployments append to this table. One row per vendored source per repo.

---

## 9. Rules

1. **Workspace scope, git-vendored.** All BCG skill deployments go in `{repo}/.windsurf/skills/`, committed to the repo. No global installs for BCG-approved skills, no per-user drift.
2. **Pinned versions only.** Always pin to a specific release tag or commit SHA. No tracking of upstream `main`.
3. **Version marker required.** Every vendored skill source needs a `.windsurf/_{SOURCE}_VERSION.md` documenting the pin, license, update procedure, and degradations.
4. **Security review before bumps.** Any version bump of a third-party skill source requires initiative-level security review (scoped appropriately).
5. **Verify locally before push.** Never push a skill-install commit without first confirming in Windsurf that Customizations -> Skills populates correctly.
6. **Do not mix layers.** Skills, Rules, Workflows, and AGENTS.md are distinct. Do not consolidate or relocate.
7. **Document known degradations.** When a skill doesn't fully work in Cascade, document it in the version marker and coach the team on when to use Claude Code instead.

---

## 10. Change Log

| Version | Date | What Changed |
|---------|------|-------------|
| 1.0 | 2026-04-17 | Initial version. Derived from I-72 Superpowers v5.0.7 installation (bcg-ops-revit-tools, merge commit 03bcaf8). Establishes workspace-scope + git-vendoring + pinned-version pattern as BCG default for all future skill deployments. |

---

*This document is maintained in GitHub at bcg-ops-governance/standards/ and referenced by the Governance Doc Registry as GOV-019.*
