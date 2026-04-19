# BCG Corp -- Artifact Deployment Routing Standard

**Document ID:** GOV-021
**Version:** 1.1
**Status:** APPROVED
**Effective:** 2026-04-19
**Last Updated:** 2026-04-19
**Scope:** All Claude Projects (P0-P11), subprojects, code repositories, and operational artifacts
**Owner:** Gregory Bernardo, President
**GitHub Path:** `standards/BCG_Artifact_Deployment_Routing_Standard.md`

---

## 1. Purpose

Every BCG project produces artifacts that have to live somewhere. Without a declared
canonical location per artifact class, teams end up with duplicate copies in three
places, orphan files nobody can locate six months later, and painful migrations when
infrastructure comes online.

This standard prevents fragmentation by declaring:

- The full taxonomy of artifact classes the ecosystem produces
- One canonical location per class per project, with documented mirrors
- A phased-migration framework for in-flight cutovers (B:\ to A:\, GitHub to GitLab, etc.)
- A per-project deployment manifest (`DEPLOYMENT.md`) for project-specific exceptions
- An orphan-prevention check wired into the finishing-work cadence

This standard SUPPLEMENTS, it does not replace, GOV-001 (GitHub source of truth for
governance docs), GOV-014 (Artifact Naming and Capture), or GOV-019 (Windsurf Skills
Deployment Pattern). Those standards govern specific artifact classes; this standard
names every class the ecosystem produces and routes everything else.

---

## 2. Scope

**In scope:** All artifact classes produced by BCG projects -- Claude-generated
documents, source code, governance documents, installers, RAG feed artifacts,
observability configs, backups, personal staging, archives, and app runtime
outputs.

**Out of scope:**
- The content of artifacts (governed by project-specific standards)
- Credentials and secrets (governed by P5 security and GOV-009 data classification)
- Client-owned artifacts on BIM 360 / ACC (BCG is not the canonical authority for those)
- Naming and capture workflow for Claude-generated .docx/.md/.pdf/.html/.jsx (owned
  by GOV-014; this standard only routes those classes to the GOV-014 destinations)

---

## 3. Artifact Class Taxonomy

Classes are grouped by domain (A-H). Each entry names the producers, the canonical
location, known mirrors with direction, and status.

**Status values:**

| Value | Meaning |
|---|---|
| `Stable` | Canonical and mirror rules declared, routing known to work |
| `In-flight migration` | Current canonical is known but a cutover is planned; see §5 |
| `[NEEDS INPUT: {name}]` | Canonical is not declared; v1.0 surfaces the gap for resolution in v1.1+ |

### 3.1 Group A -- Claude-generated artifacts (routed per GOV-014)

| # | Class | Canonical | Mirror | Status | Reference |
|---|---|---|---|---|---|
| A1 | Documents (.docx/.md/.pdf/.xlsx) | OneDrive `Corp/AI/Outputs/[P#]/` | -- | Stable | GOV-014 §1 |
| A2 | UI artifacts (.html/.jsx) | OneDrive `Corp/AI/Tools/UI-Library/` | -- | Stable | GOV-014 §2 |
| A3 | Status-update prompts for Claude Projects | `A:\AI Accessible\Outputs\<P#>\` | `B:\AI Accessible\Outputs\<P#>\` (additive hourly copy from A:\, see §8.1) | In-flight migration (see §5.2) | New in GOV-021 |

### 3.2 Group B -- Governance artifacts (`bcg-ops-governance` repository)

| # | Class | Canonical | Mirror | Status | Reference |
|---|---|---|---|---|---|
| B1 | Governance standards (GOV-### series) | GitHub `bcgcorp/bcg-ops-governance/standards/` | OneDrive `Corp/AI/Standards/` (archive/backup only) | Stable | GOV-001 |
| B2 | Approved handoff logs (cross-project) | GitHub `bcgcorp/bcg-ops-governance/handoffs/` | -- | Stable | GOV-007 §7 |
| B3 | Post-mortems | GitHub `bcgcorp/bcg-ops-governance/post-mortems/` | -- | Stable | Governance Doc Registry v3.2 Rule 8 |
| B4 | Ecosystem Status snapshots (dated) | GitHub `standards/BCG_Ecosystem_Status_YYYY-MM-DD.md` (superseded on next sync) | -- | Stable | Governance Doc Registry v3.2 §10 |
| B5 | `archive/` directory contents | GitHub `bcgcorp/bcg-ops-governance/archive/` | -- | [NEEDS INPUT: Gregory] -- directory exists but purpose and retention rule are not declared in any standard | -- |
| B6 | Machine-readable registry | GitHub `standards/BCG_Document_Registry.json` | -- | Stable | Governance Doc Registry v3.2 §5 |

### 3.3 Group C -- Source code repositories

| # | Class | Canonical | Mirror | Status | Flip trigger |
|---|---|---|---|---|---|
| C1 | `bcg-ops-governance` source | GitHub `bcgcorp/bcg-ops-governance` | -- | In-flight migration (see §5.2) | claude.ai GitLab connector GA |
| C2 | `bcg-ops-revit-tools` (P4-002) | GitLab self-hosted `alexandria.bcg-corp.com/revit/bcg-ops-revit-tools` | -- | Stable -- migration complete | -- |
| C3 | `bcg-ops-claude-projects` | GitHub (per Infrastructure Inventory §13) | -- | [NEEDS INPUT: Gregory] -- confirm exact owner/repo path and whether same GitLab flip trigger applies | -- |
| C4 | `bcg-easybutton` (P4-003) | GitHub `bcgcorp/bcg-easybutton` | -- | In-flight migration (see §5.2) | claude.ai GitLab connector GA |
| C5 | Custom Odoo modules (17 total; 7 catalogued) | -- | -- | [NEEDS INPUT: Victor] -- GOV-015 Custom Module Registry lists "-- confirm" for repo location on every row. Close the repo-location column in GOV-015 before this row can declare canonical. | -- |
| C6 | Agent skills (vendored into repos) | `{repo}/.windsurf/skills/` with `_{SOURCE}_VERSION.md` marker | -- | Stable | GOV-019 |
| C7 | `.windsurfrules` per repo | Repo root | -- | Stable | GOV-019 §6 |
| C8 | Windsurf rebuild prompts (P4-002 requires one per button build) | "Alongside code" per GOV-017 §5 | -- | [NEEDS INPUT: Gregory + Jason] -- pin exact path convention (repo subfolder? filename pattern?) | -- |

### 3.4 Group D -- Infrastructure / operational configs

| # | Class | Canonical | Mirror | Status |
|---|---|---|---|---|
| D1 | ClarkKent Docker Compose stack (P5-002) | `D:\observability` on ClarkKent VM | -- | [NEEDS INPUT: Bob + Jason] -- Infrastructure Inventory v1.5 §23 Gap #10 explicitly flags this as undocumented. Need container names, volume paths, provisioning directory, and repo-of-record for compose files. |
| D2 | Grafana dashboards (file-provisioned) | Co-located with D1 | -- | [NEEDS INPUT: Bob + Jason] -- tied to D1 resolution |
| D3 | pfSense configs (Anakin, Vader, OuterRim) | Live config on device | -- | [NEEDS INPUT: Bob] -- backup destination, retention, and config-as-code repo (if any) not documented |
| D4 | Odoo custom addons (production) | `/opt/odoo/custom-addons/` on R2-D2 (filesystem) | -- | [NEEDS INPUT: Victor] -- ties to C5. Per-module "repo of record" must be declared so the filesystem is demonstrably derived from a canonical source, not the other way around. |
| D5 | RevitPrint Minion CI/CD runner config | GitHub Actions workflow in `bcg-ops-revit-tools` (which now lives on GitLab) | -- | [NEEDS INPUT: Bob] -- cross-platform tooling situation: the repo moved to GitLab, the runner tooling was GitHub Actions. Declare current execution platform (Jenkins? GitLab CI? GitHub Actions still pointed at the retired GitHub copy?). |
| D6 | Veeam backup targets and retention | -- | -- | [NEEDS INPUT: Bob] -- Infrastructure Inventory v1.5 §23 Gap #6 explicitly flags this. Targets, retention policy, immutable/air-gap status all undocumented. |

### 3.5 Group E -- Capture / intake / operational artifacts

| # | Class | Canonical | Mirror | Status | Flip trigger |
|---|---|---|---|---|---|
| E1 | P4-003 idea-queue markdown (RAG feed) | `~/BCG/idea-queue/*.md` on capture device (per-user home). Contract frozen in `bcg-easybutton/paths.py` and `.windsurfrules` §8. | -- | In-flight migration (see §5.2) | I-65 Ph1 RAG corpus operational on DGX Spark |
| E1b | P4-003 digest markdown | `~/BCG/digests/*.md` on capture device | -- | In-flight migration (same as E1) | Same as E1 |
| E1c | P4-003 runtime log | `~/BCG/idea_capture.log` | -- | Stable (per-device operational log, no mirror required) | -- |
| E1d | P4-003 app config (non-sensitive) | `%APPDATA%\BCG\EasyButton\config.json` (frozen) or source tree (dev) | -- | Stable | -- |
| E2 | P8-001 intake docs (RFP/CO/PO) | -- | -- | [NEEDS INPUT: Rachel] -- I-58/I-70 operational. File placement destination per-doc-type undocumented in governance. |
| E3 | Cowork 4am daily run outputs | -- | -- | [NEEDS INPUT: Rachel + Gregory] -- GOV-018 declares the 4am fetch, but where Cowork writes its own outputs each run is not documented |
| E4 | I-48 API-Driven Hub outputs (P0 sync, supersedes I-30 email pipeline) | -- | -- | [NEEDS INPUT: Jason] -- destination path(s) not declared in Infrastructure Inventory or Initiative Catalog |
| E5 | BCG Notes sidecar JSON (P4-002, B-49 -- B-52) | `Q:\Pearl_Prod\zz_revit_BCGNotes\{ProjectNumber}_notes.json` (UNC production share) | Odoo Rework module (system of record; sidecar is write-ahead log) | Stable | -- |

### 3.6 Group F -- Client-project deliverables

| # | Class | Canonical | Mirror | Status |
|---|---|---|---|---|
| F1 | Client-project deliverables (per GOV-018 project codes -- 114 projects, 25 campuses) | Varies per prime firm (Arcadis, HKS, Gensler, Corgan, Stendel+Reich, Atlantic AE) | -- | [NEEDS INPUT: Gregory] -- per-prime delivery conventions exist implicitly but are not catalogued. Consider a follow-on standard or a section in GOV-018. |
| F2 | BIM 360 / ACC-hosted models | BIM 360 cloud or Autodesk Construction Cloud per prime | -- | Stable (client-owned; BCG is not canonical authority) | Infrastructure Inventory §8 |

### 3.7 Group G -- Local / personal / archival

| # | Class | Canonical | Mirror | Rule |
|---|---|---|---|---|
| G1 | CascadeProjects WIP (e.g., `C:\Users\gb\CascadeProjects\<project>\`) | **Never canonical.** Git remote is canonical. | -- | End-of-session rule (see §10 Rule 4): any file modified in a Cascade session must be committed and pushed before session close, or deferred with an explicit TODO in the corresponding `DEPLOYMENT.md` or plan. Unpushed work is an explicit decision, not a drift outcome. |
| G2 | Retired subproject knowledge bases (P7-001 through P7-004 consolidated into P7 parent on 2026-03-12) | "Consolidated into parent" per Project Ecosystem & Handoffs v2.0 §2.3 | -- | [NEEDS INPUT: Gregory] -- physical archive location for the original KB content (downloadable Claude project export? governance `archive/` dir? deleted?) not declared |
| G3 | Pre-2024 legacy records | -- | -- | [NEEDS INPUT: Bob] -- Infrastructure Inventory v1.5 §23 "Items NOT Included" explicitly notes pre-Jul 2024 records are out of scope of the email-extraction audit. Declare a routing target or formally mark as not-retained. |
| G4 | Post-mortem aggregation artifacts (monthly Tier 2 / quarterly Tier 3 reviews per W-20 v1.1) | -- | -- | [NEEDS INPUT: Gregory + Jennifer] -- individual post-mortems route to `post-mortems/` (B3) but aggregation outputs have no declared home |

### 3.8 Group H -- Application installer binaries

| # | Class | Canonical | Mirror | Status |
|---|---|---|---|---|
| H1 | P4-003 BCG EasyButton installers | Azure Blob Storage (`RELEASE_BASE_URL` via Azure service principal, see `bcg-easybutton/.github/workflows/release.yml`) | GitHub Releases on `bcgcorp/bcg-easybutton` (for discovery and changelog); `latest.json` manifest on Azure Blob (consumed by auto-updater) | Stable |

---

## 4. Canonical / Mirror Model

### 4.1 Rules

1. **Every artifact class has exactly one canonical location per project.** The
   canonical is the authoritative copy. If two copies disagree, the canonical
   wins by definition.
2. **Every other copy is a mirror.** Mirrors are documented with direction of
   flow: canonical -> mirror. The reverse direction is forbidden unless
   explicitly declared (e.g., a Phase-0 one-time import before flipping
   canonical). Each mirror row also declares its **sync mode** -- exact
   (destructive; destination pruned to match source), additive (new + newer
   source overwrites; destination-only content preserved), or snapshot
   (one-off copy, not kept in sync). The sync mode is load-bearing; it
   determines whether the mirror is a reliable copy of canonical or a
   superset of it.
3. **No dual-write.** For classes where the canonical can be written, writes go
   to the canonical only. Mirrors are populated by an explicit, documented
   sync mechanism (§8). This is non-negotiable for source code -- dual-write
   to two git remotes is a permanent merge-conflict source.
4. **Mirror direction is load-bearing.** A mirror whose direction is ambiguous
   or undocumented does not count as a mirror; it's a fragmentation hazard.
   If you see one, raise it via the finishing-work check (§7) and close it
   or document it.

### 4.2 Classes exempt from "exactly one canonical"

Two specific exemptions recognized:

- **Per-user operational artifacts** (E1c runtime logs, E1d app config): each
  user's device has its own canonical. The standard declares the path
  pattern, not a single physical location.
- **Client-owned artifacts** (F2): BCG is not the canonical authority. The
  canonical is defined by the client or the prime.

All other classes must name one canonical per project.

---

## 5. Phased Migration Framework

### 5.1 Format

Migrations are in-flight transitions from one canonical to another. Each
migration row declares a flip trigger and a mirror rule for the transition
period.

```
| Class | Current canonical | Target canonical | Flip trigger | Mirror rule | Status |
```

**Flip trigger** = the named, checkable condition that causes the canonical
to move. Trigger must be observable (a vendor announcement, a deployment
milestone, a head-count threshold), not a date guess.

**Mirror rule** = how the non-canonical location stays useful during the
transition. One of:

- **None** -- target has no content yet; migrate in one cutover
- **One-way exact canonical -> target** -- destination kept identical to source (destination-only content is pruned)
- **One-way additive canonical -> target** -- new + newer source files overwrite; destination-only content preserved; no pruning
- **One-way target -> canonical** -- rarely correct; only when target can't yet accept writes but content is already there
- **Read-only** -- target exists but accepts no writes

### 5.2 Active migrations

| Class | Current canonical | Target canonical | Flip trigger | Mirror rule | Status |
|---|---|---|---|---|---|
| A3 Status-update prompts | `A:\AI Accessible\Outputs\<P#>\` | Same path (no further migration after team has A:\ access) | All project contributors have A:\ access | One-way additive canonical (A:\) -> secondary copy (B:\) via Task Scheduler hourly, see §8.1. Non-destructive: new files and newer-on-A:\ overwrites copy to B:\; B:\-only content is preserved. B:\ is a strict superset of A:\, not an exact mirror. | Active as of 2026-04-19. Canonical already flipped to A:\; B:\ kept as compatibility copy for non-A:\ users. Pruning, if ever needed, is a separate manual pass. |
| C1 `bcg-ops-governance` source | GitHub `bcgcorp/bcg-ops-governance` | GitLab self-hosted `alexandria.bcg-corp.com` | claude.ai GitLab connector GA | None -- do not dual-write to GitHub and GitLab. Optional one-way read-only mirror GitHub -> GitLab for visibility. | Active |
| C4 `bcg-easybutton` source | GitHub `bcgcorp/bcg-easybutton` | GitLab self-hosted `alexandria.bcg-corp.com/?/bcg-easybutton` (path TBD by Jason) | claude.ai GitLab connector GA (same trigger as C1) | None | Active. Note: `BCG-Greg/bcg-easybutton` (personal account duplicate) archived 2026-04-19 with README redirect to the canonical org repo per §11.3. |
| E1 P4-003 idea-queue markdown | `~/BCG/idea-queue/*.md` on capture device | DGX Spark RAG corpus (path TBD by Jason under I-65 Ph1) | I-65 Ph1 RAG corpus operational (see P4-003 hard dependency in Project Ecosystem & Handoffs v2.0 §6) | One-way additive canonical (~/BCG/) -> target (RAG corpus) during burn-in; then flip | Active. Cloud STT is Ph1-only per P4-003 invariants; Ph3 rollout gated on Ph2 on-prem STT + RAG corpus. |
| E1b P4-003 digest markdown | `~/BCG/digests/*.md` on capture device | Same as E1 | Same as E1 | Same as E1 | Active (paired with E1) |

### 5.3 Completed migrations (historical reference)

Captured here so the pattern is repeatable, not just to keep records.

| Class | Prior canonical | New canonical | Flip date | Reference |
|---|---|---|---|---|
| C2 `bcg-ops-revit-tools` source | GitHub | GitLab self-hosted `alexandria.bcg-corp.com/revit/bcg-ops-revit-tools` | 2026-03-15 (inferred from Infrastructure Inventory v1.2 change log) | Infrastructure Inventory §13 |
| Odoo production hosting | odoo.sh | On-prem R2-D2 (Ubuntu 24.04 LTS / Hyper-V) | Pre-March 2026 | Infrastructure Inventory §1 (odoo.sh decommission notice) |

### 5.4 Proposing a new migration

New rows added to §5.2 require:

1. A named flip trigger (observable, not a date guess)
2. A mirror rule for the transition period
3. Declaration of which column owns writes during the transition
4. Approval from the affected project owner(s) and Gregory

Submit via PR to this file with the proposed row in §5.2 and a one-paragraph
justification in the PR description.

---

## 6. Per-Project Deployment Manifest (`DEPLOYMENT.md`)

### 6.1 Convention

Every BCG project with a code repository places a `DEPLOYMENT.md` file at the
repository root, parallel to `README.md`. The file declares which artifact
classes the project produces and where each one is routed, naming overrides
to the global defaults in §3 where applicable.

Rationale for root placement (not `docs/` or `.windsurf/`): this is a
project-level contract as important as `README.md`. Top-level visibility
matches its role.

### 6.2 Template

```markdown
# <project-name> Deployment Manifest

**Governed by:** GOV-021 Artifact Deployment Routing Standard
**Project:** <P# or subproject ID>
**Last Updated:** YYYY-MM-DD
**Owner:** <name>

## Artifact classes produced

| Class (GOV-021 §3) | Notes specific to this project |
|---|---|
| <e.g., E1 idea-queue markdown> | <per-user path; contract with RAG pipeline> |
| <e.g., H1 installer binaries> | <Azure Blob + GitHub Releases> |
| ... | ... |

## Overrides of global defaults

None. / <explicit list with rationale>

## Deferred / unpushed working items

<none>, or list TODOs with rationale (see GOV-021 §10 Rule 4)

## Dependencies on in-flight migrations (GOV-021 §5.2)

<list the migrations this project depends on, with the flip trigger so the
reader knows what changes when>
```

### 6.3 Precedence

A project's `DEPLOYMENT.md` can override the global defaults in §3 only when:

- The override has a declared rationale in the `DEPLOYMENT.md` itself
- The override does not conflict with a Rule in §10
- Gregory has approved the override (explicit commit or PR review)

Without those three conditions, the global default wins.

### 6.4 Pilot

P4-003 (`bcg-easybutton`) is the pilot project for this convention. A
starter `DEPLOYMENT.md` is produced as part of this standard's v1.0 rollout
(see §11).

---

## 7. Finishing-Work Routing Check

### 7.1 When to run

The routing check ties into three existing BCG cadences; no new cadence is
introduced.

- **W-20 Triage Checklist 4D -- Completion Verification.** The routing check
  is a question set within 4D; failure to answer it blocks the Active ->
  Complete transition.
- **Status-update prompt trigger.** Any substantial unit of work that
  produces a Claude Projects status-update prompt per the existing
  convention also runs the routing check. The output of the check appears in
  the prompt's "WHAT CHANGED" block.
- **End-of-session commit rule** (G1). The check runs before session close
  for any project whose working copy has uncommitted changes.

### 7.2 The five-question gate

1. **What artifacts did this unit of work produce?** Enumerate them.
2. **For each artifact, what class is it in per §3?** If unclassified,
   stop and classify -- either by matching an existing class or by
   proposing a new class via PR to this standard.
3. **Is the canonical copy in place?** For Stable classes: yes or no. For
   In-flight migrations: is it in the correct canonical for the current
   phase of the migration?
4. **Are mirrors updated (or explicitly N/A)?** For classes with mirror
   rules in §5 or §3, check that the mirror is current. Use `last-sync.txt`
   (§8.2) where applicable.
5. **Any artifact that doesn't fit an existing class?** Flag for update to
   §3 or §5 via PR. Do not let an orphan slip.

### 7.3 Recording the answer

The answer is recorded in one of three places depending on trigger:

- In the W-20 Checklist 4D record (per W-20 v1.1)
- In the status-update prompt's WHAT CHANGED block
- In the session close-out note (lightweight; a single line in
  `progress.txt` or equivalent is sufficient)

---

## 8. Tooling

### 8.1 A:\ -> B:\ additive hourly sync

The A3 status-update-prompt copy runs via Windows Task Scheduler invoking a
PowerShell script that wraps `robocopy /E /XO` and writes a timestamp file.

**Script:** [`scripts/sync-a-to-b.ps1`](../scripts/sync-a-to-b.ps1)

**Task Scheduler settings:**
- Trigger: hourly
- User context: the account with access to both `A:\` and `B:\`
- Run whether user is logged on or not: yes
- Run with highest privileges if either drive requires elevation

**Sync semantics (non-destructive additive, v1.1 change from v1.0 /MIR):**

`/E` copies subdirectories including empty ones. `/XO` excludes older
source files -- only copies when the source file is strictly newer than
the destination file, or when the destination file does not exist.

The consequence is that B:\ becomes a **strict superset** of A:\ with
source-newer-wins conflict resolution:

- Files present on A:\ but missing from B:\ are copied to B:\
- Files on A:\ that are newer than B:\ overwrite B:\
- Files on A:\ that are older than B:\ are **not** copied (B:\ wins)
- Files on B:\ that do not exist on A:\ are **preserved**
- No deletions ever occur on B:\

This trades exact-mirror semantics for safety-of-content. Un-migrated
historical content on B:\ is preserved rather than wiped when the script
runs against a partially-populated A:\. The tradeoff is that B:\ can
accumulate stale or orphaned content; pruning, if ever required, is a
separate manual pass, not an automated step.

**Prior behavior (v1.0 history):** The v1.0 release of this standard
shipped the script with `/MIR` (destructive mirror) plus two file-count
safety guards (refuse to run if A:\ is empty while B:\ has content, or if
A:\ has fewer files than B:\). Gregory revised the approach on
2026-04-19 to remove both the destructive operation and the guards in
favor of additive semantics. See the change log below.

### 8.2 `last-sync.txt` contract

The `last-sync.txt` timestamp file is the single mechanism the
finishing-work check uses to detect stale syncs.

**Path:** `C:\ProgramData\BCG\sync-a-to-b\last-sync.txt` (outside the synced tree)

**Contents:** one line, ISO-8601 timestamp, UTF-8.

**Consumers:** the §7 routing check reads this file. If its age exceeds 2x
the expected sync interval (so 2 hours for the A3 sync), the check reports
`STALE SYNC` and the unit of work does not transition to Complete.

**Failure semantics:** a robocopy failure writes a `FAILED` line to
`last-sync.txt` without advancing the success timestamp. This makes silent
sync failures loud at the next routing check. The contract is mode-agnostic
-- it works identically whether the script runs in exact-mirror or additive
mode.

### 8.3 Other sync scripts

As migrations land and new sync needs arise, tools go under
`scripts/` in this repo. The naming pattern is
`sync-<source>-to-<target>.ps1` (or `.sh` if cross-platform). Every new
script commits with a one-paragraph entry in §8 describing canonical,
destination, sync mode (§4.1 Rule 2), and schedule.

---

## 9. Explicit Gaps (v1.0 Forcing Function)

Every row in this table is an artifact class whose routing is not yet
declared. v1.0 surfaces these gaps so the conversations happen. v1.1+ closes
rows as they're answered. When a gap closes, move the row to the
appropriate §3 subsection and update the change log.

| # | Class | Owner to resolve | Target v1.x | What's needed |
|---|---|---|---|---|
| B5 | governance `archive/` directory purpose | Gregory | 1.2 | Retention rule, what goes here, when |
| C3 | `bcg-ops-claude-projects` exact location | Gregory | 1.2 | Owner/repo path + GitLab flip applicability |
| C5 | Odoo custom modules repo locations (17 modules, 7 catalogued) | Victor | 1.2 (paced with GOV-015 Track 2 repo audit) | Per-module repo of record; tie to D4 |
| C8 | Windsurf rebuild prompts canonical path | Gregory + Jason | 1.2 | Path convention (repo subfolder? filename pattern?) |
| D1 | ClarkKent Docker Compose stack source of truth | Bob + Jason | 1.2 | Container names, volumes, provisioning dir, repo-of-record for compose files (Infrastructure Inventory v1.5 Gap #10) |
| D2 | Grafana dashboards source of truth | Bob + Jason | 1.2 | Tied to D1 |
| D3 | pfSense config backup destination | Bob | 1.2 | Backup target, retention, config-as-code repo (if any) |
| D4 | Odoo custom addons source-of-truth per module | Victor | 1.2 | Tied to C5 |
| D5 | RevitPrint Minion CI/CD cross-platform situation | Bob | 1.2 | Current execution platform given bcg-ops-revit-tools moved to GitLab |
| D6 | Veeam backup targets and retention | Bob | 1.2 | Targets, retention, immutability (Infrastructure Inventory v1.5 Gap #6) |
| E2 | P8-001 intake routing per doc type | Rachel | 1.2 | RFP/CO/PO file placement destinations |
| E3 | Cowork 4am daily run outputs location | Rachel + Gregory | 1.2 | Where Cowork writes its own outputs each run |
| E4 | I-48 API-Driven Hub outputs | Jason | 1.2 | Destination path(s) for the API-driven P0 sync |
| F1 | Client-project delivery conventions (per-prime) | Gregory | 1.2 or separate standard | Catalogue of per-prime handoff paths and any BCG-retained copies |
| G2 | Retired subproject KB archive location | Gregory | 1.2 | Physical archive for retired P7-001 through P7-004 KB content |
| G3 | Pre-2024 legacy records target | Bob | 1.2 | Routing target or formal "not retained" marker |
| G4 | Post-mortem aggregation artifact location | Gregory + Jennifer | 1.2 | Monthly Tier 2 / quarterly Tier 3 review output home |

When a row is resolved, note the closure in the change log and reference the
governing standard (or the section of GOV-021 where the class now lives).

---

## 10. Rules

1. **One canonical per artifact class per project.** (See §4.1 Rule 1 and
   §4.2 exemptions for per-user and client-owned classes.)
2. **Every mirror direction and sync mode is documented, or it doesn't
   exist.** A copy without a documented direction is a fragmentation hazard
   and must be resolved (documented or eliminated) when surfaced by the §7
   check. A mirror whose sync mode (exact / additive / snapshot) is
   ambiguous is equivalent to a mirror with undocumented direction.
3. **No dual-write for source code.** Pick GitHub XOR GitLab per repo, not
   both. Until the C1/C4 flip trigger fires, GitHub is canonical. After
   flip, GitLab is canonical. Dual-write is forbidden in all phases.
4. **CascadeProjects is never canonical.** Git remote is canonical. Any file
   modified in a Cascade session must be committed and pushed before
   session close, or deferred with an explicit TODO in the project's
   `DEPLOYMENT.md` or plan. Unpushed work is an explicit decision, not a
   drift outcome.
5. **Phased migrations name a flip trigger, not a date.** Dates guess;
   triggers check. (§5.1)
6. **Per-project manifests can override global defaults only with
   documented rationale and Gregory's approval.** (§6.3)
7. **Silent sync failures are loud at the next routing check.**
   `last-sync.txt` is the single mechanism; if age exceeds 2x expected
   sync interval, the unit of work does not transition to Complete. (§8.2)
8. **New artifact classes land via PR to this standard.** The routing check
   (§7 question 5) surfaces unclassified artifacts; the correct response
   is always a PR, never a local-only workaround.
9. **Completed migrations stay in §5.3.** The historical record teaches the
   pattern for the next migration.
10. **When infrastructure comes online (BCG IT provisioning, new platforms,
    decommissioning), the response is a new migration row in §5.2 with a
    flip trigger.** Never a silent cutover, never dual-write during the
    transition.

---

## 11. Relationship to Other Standards

### 11.1 Direct cross-references

| Standard | Relationship |
|---|---|
| GOV-001 | GitHub-as-source-of-truth rule for governance docs. This standard inherits and broadens to all artifact classes. |
| GOV-007 Project Ecosystem & Handoffs | Handoff routing (§3.4) is orthogonal; handoffs are a class of artifact (B2) whose routing this standard declares. |
| GOV-009 Infrastructure Inventory | Source for D-group classes and the storage destinations this standard routes to. Several §9 gaps are already flagged in Infrastructure Inventory §23 Data Gaps. |
| GOV-013 Tools Inventory | E5 sidecar JSON routing is authored there; this standard references. |
| GOV-014 Artifact Naming and Capture | Owns A1 and A2 naming and OneDrive capture workflow. This standard routes A3 (new class) and cross-references A1/A2 without duplication. |
| GOV-015 Custom Module Registry | Closure of the "repo location" column there is a precondition for C5 in this standard to move from `[NEEDS INPUT]` to Stable. |
| GOV-017 P4-002 Technical Architecture | C8 Windsurf rebuild prompts are referenced there; this standard names the class and flags the location gap. |
| GOV-018 Project Code Registry | F1 (client-project deliverables) routes against the codes registered there. |
| GOV-019 Windsurf Skills Deployment Pattern | C6 and C7 routing is authored there; this standard references. |
| GOV-020 Post-Mortem Template | B3 post-mortem filing rule authored in the Governance Doc Registry Rule 8; this standard references. G4 aggregation is a gap. |
| W-20 Ecosystem Triage SOP v1.1 | The §7 routing check integrates with W-20 Checklist 4D Completion Verification. No new cadence introduced. |

### 11.2 This standard does NOT

- Re-declare routing rules authored elsewhere (GOV-014, GOV-019). It points.
- Govern artifact content, naming, or quality (those are per-class standards).
- Own credentials or secrets storage (that's P5 / GOV-009 data classification).

### 11.3 v1.0 cleanup actions (completed 2026-04-19)

1. **Archived `BCG-Greg/bcg-easybutton`** -- personal-account duplicate of the
   canonical `bcgcorp/bcg-easybutton`. README replaced with redirect;
   archive flag set manually in GitHub Settings.
2. **Created `DEPLOYMENT.md` in `bcgcorp/bcg-easybutton`** as the pilot for
   §6 using the template in §6.2.
3. **Registered GOV-021** in `BCG_Governance_Doc_Registry.md` §3.20 and in
   `BCG_Document_Registry.json`. Runtime-fetched count 19 -> 20; total doc
   count 24 -> 25.
4. **Cross-reference insertion** into GOV-014 §3 pointing to GOV-021 for
   non-document artifact classes produced by capture workflows. GOV-014
   bumped v1.3 -> v1.4.
5. **Deployed `scripts/sync-a-to-b.ps1`** and the Task Scheduler job (§8.1)
   on Gregory's workstation.

---

## 12. Change Log

| Version | Date | What Changed |
|---|---|---|
| 1.1 | 2026-04-19 | Aligned §8.1 and §5.2 A3 row to the script change from `/MIR` to `/E /XO` (committed earlier the same day per Gregory direction). Added sync-mode vocabulary to §4.1 Rule 2 and §5.1 (exact / additive / snapshot). Clarified that B:\ under the A3 migration is a strict superset of A:\, not an exact mirror -- B:\-only content is preserved, not pruned. Removed v1.0 file-count safety guards from §8.1 (no destructive operation to guard against). `last-sync.txt` contract unchanged (mode-agnostic). Updated Rule 2 to require sync-mode documentation alongside direction. §11.3 cleanup actions marked completed. §9 gap target versions bumped from v1.1/v1.2 to v1.2 uniformly since v1.1 is consumed by this sync-mode clarification. |
| 1.0 | 2026-04-19 | APPROVED. Initial version. Establishes taxonomy (8 groups A-H), canonical/mirror model, phased-migration framework, per-project `DEPLOYMENT.md` convention, finishing-work routing check integration with W-20 Checklist 4D, `A:\ -> B:\` auto-mirror tooling (scripts/sync-a-to-b.ps1 shipped with /MIR and file-count guards), and explicit `[NEEDS INPUT]` gaps table as v1.0 forcing function. Locks routing for the classes Gregory owns directly: A3 (status-update prompts, A:\ canonical with auto-mirror to B:\), C1/C4 (GitHub->GitLab phased migration with claude.ai connector flip trigger), E1/E1b (P4-003 RAG feed/digests, `~/BCG/` canonical with DGX Spark as Ph2 target), G1 (CascadeProjects never canonical; end-of-session commit rule), H1 (P4-003 installers, Azure Blob canonical + GitHub Releases mirror). 17 remaining gaps explicitly tagged with `[NEEDS INPUT: <owner>]` targeting Bob/Victor/Rachel/Jason/Gregory/Jennifer for resolution in v1.1 and v1.2. |

---

*This document is maintained in GitHub at `bcg-ops-governance/standards/`. Registered in
`BCG_Governance_Doc_Registry.md` §3.20 and `BCG_Document_Registry.json` as of v1.0
approval on 2026-04-19.*
