# D-05 Bootstrap Handoff — `bcg-ops-knowledge` Repo Creation

**[FROM: P0 — Master Strategic Plan]** **[TO: Bob Brezniak — IT Manager]** **[DATE: 2026-04-19]** **[TOPIC: D-05 execution — create bcg-ops-knowledge private repo + seed structure]**

**Why you're receiving this:** The GitHub MCP service PAT lacks `admin:org` scope for `bcgcorp`, so repo creation in the org returns 403 when attempted via MCP. This is correct security posture — repo creation belongs with a human org admin (you). This handoff gives you everything you need to complete D-05 in ~10 minutes without further specification.

---

## TL;DR

Create `bcgcorp/bcg-ops-knowledge` as a private repo. Seed `/client-intel/` and `/design-doctrine/` folders with README placeholders. Grant RW to Gregory/Jason/yourself. Grant RO to the GitHub MCP service account (same one already on `bcg-ops-governance`). Send Gregory a one-liner on Teams when done. That closes D-05 and unblocks D-06.

---

## Why this repo exists

Operational knowledge store — distinct from governance (`bcg-ops-governance`) and code (`bcg-ops-*`). Two knowledge classes:

- **Client Intel Packets (CIPs)** → `/client-intel/` — per-client/per-project intelligence briefs, reference material, decision history. Not deliverables, not governance — operational context Claude retrieves during work sessions.
- **Design Doctrine Library (DDL)** → `/design-doctrine/` — BCG design methodology artifacts, precedent library, reasoning templates. The "how BCG thinks" side of operational knowledge.

**Access model:** Gregory/Bob/Jason read-write; Claude reads via GitHub MCP for context retrieval during work sessions.

---

## Step-by-step (~10 min total)

### 1. Create the repo (~2 min)

At https://github.com/organizations/bcgcorp/repositories/new:

| Field | Value |
|---|---|
| Owner | `bcgcorp` |
| Repository name | `bcg-ops-knowledge` |
| Description | `BCG Corp operational knowledge base — Client Intel Packets (CIPs) and Design Doctrine Library (DDL). Private.` |
| Visibility | **Private** |
| Initialize with README | ✓ Yes |
| Add .gitignore | None (we'll push one below) |
| Choose a license | None |

Click **Create repository**.

### 2. Configure access (~3 min)

Settings → Collaborators and teams. Add in this order:

| User | Role |
|---|---|
| Gregory Bernardo | Admin |
| Bob Brezniak (yourself) | Admin |
| Jason Harris | Maintain (RW, no settings access) |
| GitHub MCP service account | Read (RO only) |

If the MCP service account name is unclear, check `bcg-ops-governance` collaborators — use the exact same account. This is what guarantees Claude read access via the existing MCP PAT.

### 3. Seed folder structure (~5 min)

Easiest path: use the GitHub web UI to create files one at a time. Faster path: clone locally, add the four files, and push a single commit. File contents below — paste verbatim.

#### File 1: `README.md` (replace the auto-init content)

```markdown
# bcg-ops-knowledge

BCG Corp operational knowledge base.

## Structure

| Folder | Purpose |
|--------|---------|
| `/client-intel/` | Client Intel Packets (CIPs) — per-client/per-project intelligence briefs, reference material, decision history |
| `/design-doctrine/` | Design Doctrine Library (DDL) — BCG design methodology artifacts, precedent library, reasoning templates |

## Access Model

- **Read-Write:** Gregory Bernardo, Bob Brezniak, Jason Harris
- **Read-Only (via GitHub MCP):** Claude (BCG AI agents)

## Related Repos

- `bcgcorp/bcg-ops-governance` — governance standards and protocols (single source of truth per GOV-001)
- `bcgcorp/bcg-ops-claude-projects` — per-project custom instructions
- `alexandria.bcg-corp.com/revit/bcg-ops-revit-tools` — pyRevit source (GitLab, self-hosted)

## Naming Conventions

- **CIPs:** `CIP-{CLIENT}-{YYYY-MM-DD}-{slug}.md`
- **DDL entries:** `DDL-{domain}-{YYYY-MM-DD}-{slug}.md`

Domain codes (DDL) and client codes (CIPs) established per first-entry precedent. If growth warrants a formal registry, route through P0 for governance doc registration.

---

*Repo created 2026-04-19 as D-05 deliverable per Jason Harris onboarding package.*
*Handoff: `bcg-ops-governance/handoffs/D-05_bcg-ops-knowledge_Bootstrap_Bob_Handoff_2026-04-19.md`*
```

#### File 2: `client-intel/README.md`

```markdown
# Client Intel Packets (CIPs)

Per-client/per-project intelligence briefs. Not governance, not deliverables — operational context for BCG's client engagement work.

## Naming convention

`CIP-{CLIENT}-{YYYY-MM-DD}-{slug}.md`

Examples:
- `CIP-IAH100-2026-04-19-site-security-posture.md`
- `CIP-Arcadis-2026-04-19-prime-relationship-context.md`

## What belongs here

- Client decision history
- Stakeholder maps and reporting lines
- Prime firm relationship context (Arcadis, HKS, Gensler, Corgan, S+R, Atlantic AE)
- Site-specific security posture references
- Pre-meeting briefs
- Retrospectives from completed engagements (distilled to context for future work)

## What does NOT belong here

- Governance standards → `bcgcorp/bcg-ops-governance`
- Deliverable artifacts → project-specific `B:\` drive folders per GOV-014
- Credentials, keys, access tokens — never commit to any repo
- PII beyond what's already in Project Code Registry / Team Directory scope
```

#### File 3: `design-doctrine/README.md`

```markdown
# Design Doctrine Library (DDL)

BCG's design methodology — the "how BCG thinks" side of operational knowledge. Informs how pyRevit tools, proposals, and design work get done.

## Naming convention

`DDL-{domain}-{YYYY-MM-DD}-{slug}.md`

Examples:
- `DDL-access-control-2026-04-19-door-hierarchy-rationale.md`
- `DDL-video-surveillance-2026-04-19-camera-placement-logic.md`
- `DDL-intrusion-detection-2026-04-19-sensor-selection-framework.md`

## What belongs here

- Design principle articulations (why BCG does X when Y)
- Precedent library entries (we did X at site Y for reason Z)
- Reasoning templates for common design problems
- Post-project lessons distilled to principles (not raw retrospectives — those go in CIPs)
- Methodology deltas when BCG's approach evolves

## What does NOT belong here

- Specific project deliverables → project-specific folders / B: drive
- Governance rules (SOPs, protocols) → `bcgcorp/bcg-ops-governance`
- Live working drawings → Revit project files (Autodesk platforms)
- Client-specific intelligence → `/client-intel/` (CIPs)
```

#### File 4: `.gitignore`

```
# OS
.DS_Store
Thumbs.db

# Editors
.vscode/
.idea/
*.swp
*~

# Temp
*.tmp
*.bak

# Sensitive (never commit)
*.env
secrets/
credentials/
*.key
*.pem
```

### 4. Confirm completion (~0 min)

Send Gregory a one-liner on Teams:

> D-05 complete. `bcg-ops-knowledge` created (private), seeded with CIP/DDL placeholder folders, access configured (Greg/me/Jason RW; Claude MCP RO). Unblocks D-06.

That closes D-05. Jason + Victor can then proceed with D-06 (`@cap` chatbot routing to Odoo `bcg.knowledge.capture` queue).

---

## Troubleshooting

| Blocker | Fix |
|---------|-----|
| You're not a `bcgcorp` org admin | Gregory needs to promote your role, or create the repo himself — he has Admin on the org |
| GitHub MCP service account name unclear | Check `bcg-ops-governance` → Settings → Collaborators. Use the exact same account. |
| Jason/Gregory user handles unknown | Check recent contributor list on `bcg-ops-governance` |
| You want to use GitHub CLI (`gh`) instead of web UI | `gh repo create bcgcorp/bcg-ops-knowledge --private --description "BCG Corp operational knowledge base"`, then `gh api` for collaborator adds |
| You want to script the whole thing | Ask P0 for a PowerShell snippet that does all four files + collaborator adds via `gh` |

---

## What this unblocks downstream

Immediate (within this session once you complete):
- **D-06** unblocks → Jason scopes `@cap` chatbot → Odoo receiver queue; Victor builds the Odoo receiver
- **Jason's knowledge-capture infrastructure** — CIPs/DDL become retrievable via GitHub MCP in any Claude session

Downstream (next 30 days):
- **I-31 Cross-Project Sync MCP Server** currently On Hold pending Jason hosting confirmation — knowledge capture is one piece of that puzzle
- **I-47 AI Context Store (pgvector)** planned Q3 2026 — CIPs/DDL become one of the content sources for vector embedding when that lands

---

## Audit trail

| Action | Timestamp | Reference |
|---|---|---|
| D-05 assigned | 2026-03-22 | Tier 1 audit during that week's triage sync |
| MCP `create_repository` attempt returned 403 | 2026-04-19 | `bcgcorp` org lacks `admin:org` scope on current MCP PAT — correct security posture |
| Bootstrap handoff delivered | 2026-04-19 | This file, committed to `bcg-ops-governance/handoffs/` |
| D-05 execution target | ≤10 min after Bob's next window | Closes the oldest amber decision on Bob's queue |

---

*Handoff generated 2026-04-19 by P0 during the Protocol-Harness Migration sync (I-75). MCP PAT 403 on `create_repository` (org admin scope required) necessitated routing to Bob for execution. Once complete, D-05 closes and D-06 unblocks.*

*Filed: `bcgcorp/bcg-ops-governance/handoffs/D-05_bcg-ops-knowledge_Bootstrap_Bob_Handoff_2026-04-19.md`*
