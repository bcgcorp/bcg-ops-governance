# BCG Corp -- P4-002 Technical Architecture Standards

**Document ID:** GOV-017
**Version:** 1.0
**Effective:** March 2026
**Last Updated:** 2026-03-22
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
first commit. CLAUDE.md contents: 42-button architecture overview, AppSettings_01 schema
enforcement rules, PoleNumber-SP shared parameter conventions, priority backlog flags.

---

## 7. Pending Deliverables (P4-002 scope)

| Item | Description | Gate |
|------|-------------|------|
| CLAUDE.md | `bcg-ops-revit-tools` repo -- see Section 6 | Gregory approval |
| Print button slots | B-08a, B-08b, B-18, B-19 need B-number assignment. Options: append as B-43-B-46, insert, or new Print panel. Gregory decision required. | Gregory decision |
| B-STY-001 | Style Guide Audit Tool. Scoped and queued. | B-02 Steps 1-3 live |

**Ecosystem registration (P0 action):**
The following items are flagged for P0 resolution and are tracked here for reference only.
- I-44 Initiative Catalog entry not yet in OneDrive (catalog at v1.3; v1.4 pending)
- P4 handoff messages for I-42, I-43, I-44 not yet sent
- B-24 through B-27 (legacy numbering) not confirmed in P0 registry

---

## 8. Change Log

| Version | Date | Change |
|---------|------|--------|
| 1.0 | 2026-03-22 | Initial version. Extracted from P4-002 session analysis (gap audit 2026-03-22). Covers IronPython constraints, AppSettings architecture, three-transaction pattern, Revit API constraints, Windsurf environment, CI/CD phase status, and pending deliverables. |
