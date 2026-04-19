# BCG Artifact Naming and Capture Standard
**Version:** 1.4
**Effective:** 2026-03-22
**Last Updated:** 2026-04-19
**Owner:** Gregory Bernardo (author) / Jennifer Brezniak (ongoing maintenance)
**Location:** GitHub bcg-ops-governance/standards/
**Status:** APPROVED

---

## PURPOSE

This document defines how all Claude-generated artifacts are named and where
they are stored. Consistent naming makes artifacts sortable, searchable,
attributable, and auditable across all 18 BCG projects and all producers.

**Scope boundary (v1.4):** This standard governs Claude-generated documents,
UI artifacts, and their OneDrive capture workflow. For non-document artifact
classes produced by BCG projects -- source code, installers, RAG feed
artifacts, governance files, infrastructure configs, staging caches, and
any other class -- see **GOV-021 Artifact Deployment Routing Standard**.

---

## SECTION 1 — DOCUMENT OUTPUT NAMING CONVENTION

Applies to: .docx, .md, .pdf, and all other document-type outputs.

### Format

```
[STATUS]_[PROJECT]_[Topic]_[YYYY-MM-DD].[ext]
```

### Status Values

| Value | Meaning |
|---|---|
| `DRAFT` | Claude-generated, not yet reviewed |
| `APPROVED` | Gregory has approved — authoritative version |
| `SUPERSEDED` | Replaced by a newer approved version — retain for record |
| `ARCHIVE` | Retired — historical reference only |

### Project Codes

| Code | Project |
|---|---|
| P0 | Master Strategic Plan |
| P0-001 | Ecosystem Triage & Routing Protocol |
| P1 | Financial Modeling |
| P2 | SOP & Workflow Library |
| P3 | Competitive Intel |
| P4 | AI Infrastructure |
| P4-001 | MCP Evaluation & Selection |
| P4-002 | Revit & BIM Automation |
| P4-003 | BCG EasyButton / Idea Capture |
| P5 | IT Security / QOS |
| P5-001 | Network Infrastructure Assessment |
| P5-002 | Monitoring & Observability Infrastructure |
| P6 | HR & People |
| P7 | Odoo Platform & ERP |
| P8 | Proposals & RFP |
| P8-001 | Document Intake & Routing |
| P9 | Business Continuity |
| P10 | Legal, Compliance & Risk |
| P11 | Candidate OSINT & Pre-Hire Intelligence |

### Examples

```
DRAFT_P2_SOP-W14-Sales-Order-Entry_2026-03-07.docx
APPROVED_P3_Competitor-Segment-Map_2026-03-10.pdf
APPROVED_P0_Ecosystem-Transformation-ExecSummary_2026-03-07.docx
SUPERSEDED_P1_Revenue-Model-v1_2026-02-15.xlsx
```

### Topic Formatting Rules

- Use hyphens, not spaces or underscores, within the topic segment
- Keep topic segment under 40 characters
- Be specific enough to distinguish from other documents in the same project folder

### Storage Location

All document outputs → `Corp/AI/Outputs/[Project-Folder]/`

---

## SECTION 2 — UI ARTIFACT NAMING CONVENTION

Applies to: JSX/HTML interactive artifacts exported from Claude.ai for
async team distribution.

### Format

```
BCG-UI-[PROJECT]-[TYPE]-v[#]
```

### Type Values

| Value | Meaning |
|---|---|
| `TRIAGE` | Triage card / review queue artifact |
| `DASHBOARD` | Status dashboard or pipeline view |
| `MATRIX` | Comparison matrix |
| `DECISION` | Guided decision tree |
| `STATUS` | Status update panel |

### Examples

```
BCG-UI-P0-TRIAGE-v1.html
BCG-UI-P2-TRIAGE-v2.html
BCG-UI-P8-DASHBOARD-v1.html
```

### Version Increment Rules

- Increment v# for any content change to an existing artifact
- Do not overwrite prior versions — retain all versions in UI-Library/
- Append `-DRAFT` before the extension for unreviewed versions:
  `BCG-UI-P0-TRIAGE-v1-DRAFT.html`

### Storage Location

Exported UI artifacts → `Corp/AI/Tools/UI-Library/`

### SECURITY CONSTRAINT — MANDATORY

Artifacts containing Tier 1 or Tier 2 data stay in Claude.ai ONLY.
**Never export to HTML** any artifact containing:
- Client project codes (PHX065, STL100, ATL114, IAD534-537, PDX070, YUL, CMH, etc.)
- Client names
- Fee or billing data
- Personnel compensation data
- Any data classified Tier 1 (Confidential) or Tier 2 (Restricted)

When in doubt, keep it in Claude.ai. Do not export.

---

## SECTION 3 — CAPTURE WORKFLOW (Option A — Current)

> **Scope note (GOV-021 added 2026-04-19):** This section governs capture of
> Claude-generated documents (Section 1) and UI artifacts (Section 2) only --
> classes A1 and A2 in GOV-021 section 3.1. For non-document artifact classes
> produced by BCG projects (source code, installers, RAG feed artifacts,
> governance files, infrastructure configs, staging caches, status-update
> prompts, etc.), see GOV-021 Artifact Deployment Routing Standard. GOV-021
> also establishes the per-project `DEPLOYMENT.md` convention, the
> phased-migration framework, and the finishing-work routing check.

Option A is the active workflow until Option B (automated Claude → OneDrive push)
is available via M365 connector write permissions (pending P5 assessment).

### Steps for Every Producer

1. Claude generates the artifact in the session
2. Download the file from Claude (or copy text to a new file)
3. Rename the file to match the naming convention above
4. Upload to the correct `Corp/AI/Outputs/[Project]/` folder in OneDrive
5. If superseding a prior version, rename the old file with `SUPERSEDED_` prefix

### Who Does This

Every producer is responsible for their own captures:
- Gregory — P0, P0-001, P1, P3, P4-003 (Ph1), P8, P9, P10, P11 outputs
- Bob — P5, P5-001, P5-002 outputs
- Jason — P4, P4-001, P4-002 outputs; P4-003 Ph2+ outputs (post-transition)
- Jennifer — P2, P6 outputs
- Victor — P7 outputs
- Rachel — P8-001 outputs

---

## SECTION 4 — OPTION B (FUTURE — PENDING)

Claude pushes files directly to OneDrive at session end via M365 connector
write permissions. Eliminates the manual download-rename-upload step.

**Status:** Pending Bob's M365 connector write permission assessment (P5)
**Dependency:** Odoo MCP stable first; M365 write permission cleared in P5
**Owner when ready:** Victor Carrillo / Bob Brezniak (P7 backlog initiative)

---

## MAINTENANCE

- This document is owned by Jennifer Brezniak for ongoing updates
- Changes require Gregory's approval before taking effect
- Maintained in GitHub bcg-ops-governance/standards/
- Any new project codes added to the ecosystem must be added to Section 1
  project codes table within one week of project registration

---

## CHANGE LOG

| Version | Date | What Changed |
|---------|------|-------------|
| 1.4 | 2026-04-19 | Added scope note to Section 3 pointing to GOV-021 Artifact Deployment Routing Standard for non-document artifact classes. Added P4-003 to project codes table (BCG EasyButton / Idea Capture). Updated Section 3 capture owner list to reflect P4-003 Ph1 (Gregory) → Ph2+ (Jason) transition per I-73 ownership. Added PURPOSE section scope-boundary paragraph. |
| 1.3 | 2026-03-22 | Added P11 (Candidate OSINT & Pre-Hire Intelligence) to project codes table. Updated project count 17→18 in Purpose section. Added Gregory as P11 capture owner in Section 3. |
| 1.2 | 2026-03-16 | Added P10 (Legal, Compliance & Risk) to project codes table. Updated project count 16→17. Added Gregory as P10 capture owner. |
| 1.1 | 2026-03-14 | Updated project codes table: retired P7-001–P7-004; added P0-001, P4-002, P5-002, P8-001. Updated "17 BCG projects" → "16". Updated capture owner list (Bob no longer owns P7-001; Rachel added for P8-001). |
| 1.0 | 2026-03-07 | Initial version. |
