# BCG Corp -- P4-002 Technical Architecture Standards

**Document ID:** GOV-017
**Version:** 1.3
**Effective:** May 2026
**Last Updated:** 2026-05-03
**Project:** P4-002 (Revit & BIM Automation)
**Owner:** Gregory Bernardo, President
**GitHub Path:** `standards/BCG_P4002_Technical_Architecture.md`

---

## Purpose

This document is the authoritative reference for all architectural constraints governing
BCG's pyRevit button development. These rules are enforced on every PR in the
`bcg-ops-revit-tools` repository. Claude flags any violation during code review.

Fetch this document before: any pyRevit code review, CLAUDE.md authoring, PR triage,
or when an architectural decision is in question.

**ADR cross-reference:** Architectural decisions affecting P4-002 that have ecosystem-wide
scope (visualization tooling, AI tool discipline, etc.) are documented in BCG's ADR-NNN
sequence rather than embedded in this document. See Section 10 for active ADRs that bind
P4-002 work.

---

## 1. IronPython / pyRevit Constraints

**ASCII-only source files**

Every `.py` file must be pure ASCII -- every byte value must be 127 or lower.
IronPython 2.7 rejects any byte above 127 anywhere in the file, including comments
and docstrings. This is not a runtime error; it is a parse-time failure that prevents
the button from loading at all.

Never use:
- Em dashes (--) -- use double hyphen (--)
- Smart/curly quotes or apostrophes -- use straight ASCII quotes
- Box-drawing characters, arrows, bullets, checkmarks
- Multiplication sign or any mathematical symbol outside ASCII range
- Any Unicode character, including those inserted by editors automatically

**WPF DataGrid binding**

WPF DataGrid requires `System.Data.DataTable` for reliable IronPython compatibility.
Do not use ObservableCollection or other .NET collection types for DataGrid sources --
they fail silently or inconsistently under IronPython 2.7.

---

## 2. ExtensibleStorage / AppSettings Architecture

**Storage host**

DataStorage element is the authoritative storage host. Do not use ProjectInformation
as a storage host. ProjectInformation has access restrictions and schema conflicts
that make it unreliable for button settings.

**Schema naming**

Schema names must be generic and non-descriptive:
- Correct: `AppSettings_01`, `AppSettings_02`
- Violation: `BCGPIDSSettings`, `CameraFOVConfig`, `SiteGridState`

Descriptive schema names expose BCG IP through the Revit model and violate the
opaque schema architecture. Flag on every PR.

**Legacy GUID**

The GUID `B7E3F8A1-4C2D-4E6F-9A1B-3C5D7E8F9A0B` is deprecated. Any use of this
GUID in new code is a violation. Flag on every PR.

**Data structure**

- One opaque JSON blob per panel, stored in a single string field
- Short, non-descriptive JSON keys (e.g., `"d"` not `"cameraDepth"`)
- Human-readable key mappings live only in Python source code, never in the model
- Public/Public access levels -- protection comes from data opacity, not access restriction

---

## 3. Sheet Creation: Three-Transaction Architecture

Complex sheet creation scripts (Sheets panel buttons B-34 through B-38) use a
three-transaction architecture. Do not collapse into fewer transactions -- each
boundary corresponds to a required Revit API state change.

| Transaction | Contents |
|-------------|----------|
| T1 | View creation + sheet creation |
| T2 | Viewport placement |
| T3 | CopyElements for extras (north arrows, legends, general notes) |

Established as the reliable pattern after extensive debugging on the Site Grid suite
(I-45). Collapsing T2 and T3 causes element placement failures on certain sheet
configurations.

---

## 4. Revit API Constraints

These API behaviors must be accounted for in all relevant button code.

| Constraint | Detail |
|-----------|--------|
| Scope box creation | Scope boxes cannot be created or resized programmatically. Use `CropBox` (BoundingBoxXYZ) and `ViewCropRegionShapeManager.SetCropShape()` as the programmatic equivalent. |
| SHEET_GUID | `SHEET_GUID` is an invalid parameter in Revit 2025 API. Do not reference it. |
| Guide Grids in CopyElements | Guide Grid elements are model elements. Filter them out before any `CopyElements` call -- they break sheet copy if included. |
| PDF naming (Combine=False) | Individual PDF file naming when `Combine=False` is controlled by `ExportPDFSettings` stored in the project document, not by `PDFExportOptions.FileName`. |
| Object Styles halftone | Object Styles has no native halftone API. Use gray (192, 192, 192) as a proxy for halftone at the Object Styles level. V/G Override mode uses real `SetHalftone(True)`. |
| Title block placement | Title block insertion point is absolute on the sheet canvas. Placement via `ViewSheet.Create()` with a title block type ID is predictable and consistent. |

---

## 5. Coding Environment

**Windsurf IDE (Cascade)**

All pyRevit code for BCG Tools is authored in Windsurf IDE. The `.windsurfrules` file
in the `bcg-ops-revit-tools` repo root is the single source of truth for architectural
decisions enforced at authoring time.

**Windsurf rebuild prompts**

A Windsurf-formatted rebuild prompt is a required deliverable alongside code for every
button build or significant modification. This ensures any button can be reproduced
from scratch by any team member or Claude instance with repo access.

---

## 6. CI/CD Pipeline Status

### Phase 1 -- Active (Odoo CI)
Phase 1 deployed Odoo repo CI/CD. Active as of March 2026.

### Phase 2 -- Pre-Work (Revit CI)
Target window: 60-90 days from March 2026.

**Confirmed decisions:**
- D-GH-01: Both repos (Odoo + PyRevit) confirmed for Claude Code Actions access
- D-GH-02: Read-only review mode confirmed. Claude comments on PRs; no commit access.
  Write-mode upgrade review: **April 12, 2026**
- D-GH-03: API spend cap configured in Anthropic Console

**Jason Harris onboarding:** April 1, 2026
Leading RevitTestFramework test harness architecture. Test runs against real Revit on
RevitPrint Minion. Scheduled overnight and weekends via cron, concurrency-grouped to
prevent overlap with automated printing queue.

**Bob (RevitPrint Minion pre-work):**
Autodesk single-seat credential persistence across reboot must be verified before the
GitHub Actions runner goes live. A silent re-authentication prompt during a scheduled
overnight run will fail all tests with no obvious error -- this is the highest-risk
failure mode in Phase 2 setup.

**CLAUDE.md for bcg-ops-revit-tools:**
Required deliverable before Phase 2 YAML authoring begins. Gregory must approve before
first commit. CLAUDE.md contents: 46-button architecture overview, AppSettings_01 schema
enforcement rules, PoleNumber-SP shared parameter conventions, priority backlog flags.

---

## 7. pyRevit Version Registry

BCG upgrades pyRevit deliberately on a quarterly review cycle per W-XX (pyRevit Channel
Watch SOP), not automatically on every upstream release. This section records the
production version deployed across all BCG workstations.

**Current Production Version:** 6.4.0.26098+2214  
**Commit:** 496e71b (eirannejad/pyRevit master branch)  
**Release Date:** 2026-04-29  
**Deployed to BCG Production:** 2026-05-03 (version registry established)  
**Next Scheduled Review:** Q3 2026 (July, per W-XX quarterly cycle)

**Upgrade History:**
- 2026-05-03: Established version registry. Pinned 6.4.0.26098+2214 as baseline.
  - Rationale: First pinned version under W-XX SOP. pyRevit 6.4.0 is stable, rocket-mode
    compatible, and supports IronPython 2.7.12 (BCG's ASCII-only constraint).
  - No upgrade performed -- this is documentation of existing deployed version.

**Why we pin versions:**

Pinning a known-good version prevents production disruption from upstream breaking changes.
BCG tests pyRevit upgrades deliberately (30-60 min test cycle on critical buttons B-01
through B-12) before deploying to all workstations. This is especially important because:
1. BCG's 47-button custom extension depends on pyRevit's API surface remaining stable
2. CPython engine changes could invalidate BCG's IronPython 2.7.12 / ASCII-only constraint
3. Breaking changes in routes module or Preflight framework would impact I-71 and B-09

**Upgrade approval authority:**
- Quarterly review: Gregory Bernardo (identifies need, approves decision)
- Execution: Bob Brezniak (P5 -- tests, deploys, updates this registry)
- Emergency security patches: Bob initiates, Greg approves same-day if critical

**Related documents:**
- W-XX: pyRevit Channel Watch & Version Management SOP (quarterly review procedure)
- extensions.json baseline: 20 registered extensions as of 2026-05-03 (see W-XX SOP Step 2)

---

## 8. Pending Deliverables (P4-002 scope)

| Item | Description | Gate | Status |
|------|-------------|------|--------|
| CLAUDE.md | `bcg-ops-revit-tools` repo -- see Section 6 | Gregory approval | Open |
| Print button slots | B-43 through B-46 assigned to new Print panel. | -- | Resolved 2026-03-22 |
| B-STY-001 | Style Guide Audit Tool. Scoped and queued. | B-02 Steps 1-3 live | Open |

**Ecosystem registration (P0 action):**
The following items are flagged for P0 resolution and are tracked here for reference only.
- I-44 Initiative Catalog entry not yet in OneDrive (catalog at v1.3; v1.4 pending)
- P4 handoff messages for I-42, I-43, I-44 not yet sent
- B-24 through B-27 (legacy numbering) not confirmed in P0 registry

---

## 9. Companion governance documents

| Doc | Scope | When to fetch |
|-----|-------|---------------|
| GOV-013 (Tools Inventory) | Active button inventory across all panels | Button additions, status updates |
| BCG_Governance_Doc_Registry.md (v1.4+) | Master index of all BCG governance docs and ADRs | Before any new governance fetch |
| `.windsurfrules` (bcg-ops-revit-tools) | Authoring-time architectural enforcement | Any pyRevit code authoring session |
| CLAUDE.md (bcg-ops-revit-tools) | CI/CD-time review enforcement | Pending; gates on Section 6 deliverable |

---

## 10. Active ADRs Binding P4-002 Work

ADRs (Architectural Decision Records) document architectural decisions and their
rationale. The ADR class was established 2026-05-02 with ADR-001. ADRs apply
ecosystem-wide; this section indexes those that govern P4-002 work specifically.

### ADR-001 -- Visualization Tooling Architecture
**Status:** APPROVED 2026-05-02
**Architectural Owner:** P4 -- AI Infrastructure & Deployment
**Originating Subproject:** P4-002

ADR-001 establishes the four-tool visualization stack used across all BCG ecosystem
projects. P4-002 deliverables follow this stack:

| Use case in P4-002 | Tool per ADR-001 |
|--------------------|------------------|
| Inline chat brainstorming during planning | Built-in Visualizer |
| Diagrams in `.md` governance docs (this file, GOV-013, CLAUDE.md when authored) | Mermaid Chart MCP |
| Diagrams embedded in `.docx` assessments and decision memos | Visualizer SVG embedded |
| Diagrams in client-facing `.pptx` (rare for P4-002 but possible) | PowerPoint SmartArt |
| Complex network or system diagrams that exceed Mermaid auto-layout | draw.io (exception, requires P4 justification) |

Tools explicitly rejected and not authorized: Visio, Lucidchart, Miro/Mural, Figma/FigJam,
Excalidraw, Whimsical, Canva, Google Drawings/Slides.

**Canonical file:** `standards/ADR-001_Visualization_Tooling_Architecture.md`

**Operational companion:** Visualization Authoring Standard SOP (W-XX, in P2 queue).
When that SOP is published, this section will reference it.

---

## 11. Change Log

| Version | Date | Change |
|---------|------|--------|
| 1.3 | 2026-05-03 | Added Section 7 (pyRevit Version Registry) documenting current production version 6.4.0.26098+2214 and quarterly upgrade discipline per W-XX SOP. Renumbered subsequent sections (Pending Deliverables is now Section 8, Companion governance documents is Section 9, Active ADRs is Section 10). |
| 1.2 | 2026-05-03 | Added Section 9 (Active ADRs Binding P4-002 Work) referencing ADR-001 (Visualization Tooling Architecture, APPROVED 2026-05-02). Added Section 8 (Companion governance documents) for cross-reference clarity. Added ADR cross-reference note to Purpose section. Closes ADR-001 Action 7. |
| 1.1 | 2026-03-22 | Print button slots resolved: B-43 through B-46 assigned to new dedicated Print panel. Updated CLAUDE.md button count reference 42 to 46. Marked print slots row as resolved in pending deliverables table. |
| 1.0 | 2026-03-22 | Initial version. Extracted from P4-002 session analysis (gap audit 2026-03-22). Covers IronPython constraints, AppSettings architecture, three-transaction pattern, Revit API constraints, Windsurf environment, CI/CD phase status, and pending deliverables. |
