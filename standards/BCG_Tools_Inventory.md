# BCG Corp -- Tools Inventory

**Document ID:** GOV-013
**Version:** 1.3
**Effective:** March 2026
**Last Updated:** 2026-04-04
**Project:** P4-001
**Owner:** Gregory Bernardo, President
**GitHub Path:** `standards/BCG_Tools_Inventory.md`

---

# BCGTools pyRevit Extension Inventory

**Total: 52 buttons** across **11 panels**

**Status key:** Complete | Beta | In Development | Designed | On Hold | TBD

> **NOTE (2026-03-22):** The IronRacks panel (2 buttons) is present in this inventory but does not
> appear in the P4-002 EAB button table (B-01 through B-46). Panel-to-B-number mapping for
> IronRacks requires Gregory confirmation before the gap can be closed.

> **NOTE (2026-04-04):** B-47 and B-48 panel assignments are pending Gregory confirmation.
> B-49 through B-52 are assigned to the new BCG Notes panel (Panel 11).

---

## 1. FOV Panel (4 buttons)
Camera field-of-view visualization tools.

| Button | Status | Description |
|--------|--------|-------------|
| **FOV Zero** | Beta | Back up Camera Distance to Target-SP for all cameras, then set to near-zero to collapse FOV cones |
| **FOV Restore** | Beta | Restore Camera Distance to Target-SP to original values backed up by FOV Zero |
| **Show FOV** | Beta | Set FOV Visible to Yes on all camera instances (warns if zeroed depths exist) |
| **Hide FOV** | Beta | Set FOV Visible to No on all camera instances |

---

## 2. IronRacks Panel (2 buttons)
Network switch/rack assignment tools.

| Button | Status | Description |
|--------|--------|-------------|
| **Audit Iron Racks** | Complete | Preview network switch assignments and report capacity/overflow (read-only) |
| **Reassign to Iron Racks** | Complete | Assign SwitchNumber_SP and SwitchPort_SP based on phase/headend/side with overflow labeling |

---

## 3. Linked CAD Panel (3 buttons)
Linked DWG layer management.

| Button | Status | Description |
|--------|--------|-------------|
| **CAD Layers Export** | Complete | Select a linked DWG and export all layer data to a JSON file |
| **CAD Layers Apply** | Complete | Apply layer visibility/graphics rules from a JSON config to linked DWGs |
| **Update Defaults** | Complete | Interactively edit layer visibility/color rules in the shared config |

---

## 4. LinkedModel Panel (4 buttons)
Linked Revit model management and change tracking.

| Button | Status | Description |
|--------|--------|-------------|
| **Bulk Link Redirect** | Complete | Redirect linked models to new locations in bulk (browse, auto-match by filename, apply) |
| **Save Baseline** | Complete | Capture current room and door data from linked model as baseline for change detection |
| **Check Changes** | Complete | Compare current linked model rooms/doors against saved baseline and report differences |
| **Tag Untagged** | Complete | Tag all untagged doors and rooms in a selected linked model |

---

## 5. Parameters Panel (2 buttons)
Shared parameter and family registry tools.

| Button | Status | Description |
|--------|--------|-------------|
| **Capture Shared Parameter** | Complete | Select a linked model, choose specific shared parameters, and add them to shared parameter file |
| **Export Family Registry** | Complete | Export a CSV registry of all family types and line styles in the active project |

---

## 6. PIDS Panel (12 buttons)
Perimeter Intrusion Detection System workflow automation.

| Button | Step | Status | Description |
|--------|------|--------|-------------|
| **Fence Polyline** | 1 | Complete | Create fence polyline from linked Civil DWG; converts to Revit model lines with Fence - PIDS Radar line style |
| **Place Poles** | 2 | Complete | Place PIDS poles along fence segments at corners, transitions, and evenly at 60m max spacing |
| **Dimension Poles** | 3 | Complete | Place linear dimensions between consecutive PIDS poles using 'Linear - ft + m' type |
| **Renum Poles** | 4 | Complete | Renumber PIDS poles sequentially (PL.001, PL.002...) clockwise from user-selected pole |
| **Devices** | 5 | Complete | Add all devices (cameras, speakers, RL, LD, PEC, SW) to each PIDS pole |
| **Tag Lines** | 6 | Complete | Create interior and exterior tag alignment lines offset from fence radar line |
| **Add Tags** | 7 | Complete | Place organized tags on PIDS poles, PEC, SW, PTZ, and LD devices |
| **Alarm Zones** | 8 | Complete | Place PIDS alarm zone instances pole-to-pole along the fence radar line |
| **Cleanup** | 9 | Complete | Remove duplicate/orphaned PIDS devices, re-validate parameters, verify device counts |
| **Draw Radar Line** | Utility | Complete | Manually draw the PIDS radar line by picking points with correct line style/workset |
| **Measure Radar Line** | Utility | Complete | Measure total length of PIDS Radar Line and display in Feet and Meters |
| **Extract Device Layout** | Utility | Complete | Extract ALL device parameters relative to their parent pole (debugging/reference) |

---

## 7. Print Panel (4 buttons)
PDF and print output automation.

| B# | Button | Status | Description |
|----|--------|--------|-------------|
| B-43 | **Print On-Demand** | In Development | On-demand PDF export using native Revit `Document.Export()` / `PDFExportOptions` API. Filters sheets by BCG shared parameter (e.g. Issued to Client). Naming driven by a named `ExportPDFSettings` element stored in the project template. No third-party dependency. |
| B-44 | **Print Agent Overnight** | In Development | Unattended overnight batch print via CTC Plotter & Exporter on RevitPrint Minion. Proven workflow. Retained until RF Automator pilot is complete. |
| B-45 | **Auto-Schedule Print from Odoo** | In Development | Odoo-triggered print via CTC WorkToDoFolder XML injection. Script writes a parameterized job XML to the watched folder; Revit/CTC executes on next startup. Gate: inspect CTC scheduler XML format on Minion VM before build. |
| B-46 | **ACC Pre-Sync Print** | In Development | Recurring print/download from BIM 360/ACC using RF Automator. Gated on Rushforth Tools acquisition decision. Only tool with native ACC recurring download scheduling. |

> **Gate note -- B-43:** Requires a named `ExportPDFSettings` element to be created and saved in
> the BCG project template before B-43 build starts.
>
> **Gate note -- B-45:** Inspect the XML written by CTC's scheduler on RevitPrint Minion to
> document the job file format before writing the injection script.
>
> **Gate note -- B-46:** Gated on Rushforth Tools acquisition decision (routes through P0/P1).
> Do not build until acquisition decision is confirmed.

---

## 8. RenumberElements Panel (6 buttons)
Device and switch renumbering tools.

| Button | Status | Description |
|--------|--------|-------------|
| **Renum Cameras TDC1.0** | Beta | Renumber camera elements (CCTV) by Level, Phase, RoomNumber starting at C0001 |
| **Renum Cameras TDC1.1** | Beta | Renumber cameras (Family Classification-SP=CCTV) by Level, Phase, RoomNumber-SP, Switch Name-SP |
| **Renumber SW Ports** | Beta | Renumber SwitchPort_SP starting at 1 for each switch, incrementing by 1 |
| **Renumber Switches** | Beta | Renumber switches sequentially (SW01, SW02...) by rack and update all referencing elements |
| **Reset SW & Ports** | Complete | Reset switch/port numbers sorted by HeadendRackID, Network_Layer_SP, Mark; DSN NORTH/SOUTH separation |
| **Reset SW & Ports OPTDC 2.2a** | Complete | Same as above but sorted by HeadendID_SP instead of HeadendRackID |

> **NOTE:** Switch Summary (B-32 per P4-002 EAB) does not appear in this panel. Requires
> Gregory confirmation on current button name and placement.

---

## 9. Sheets Panel (7 buttons)
Sheet creation and sector grid workflow.

| Button | Status | Description |
|--------|--------|-------------|
| **Duplicate Sheet Set to New Level** | Complete | Duplicate sheets and floor plan views from one level to another with find-replace on level code |
| **Quikset Keyplan N Arrow** | Beta | Bulk edit Keyplan Legend-SP, Show Key Plan, and Show North Arrow across selected sheets |
| **SG: 1. Input & Preview** | In Development | Collect sector grid parameters via dialog, calculate grid layout, show preview, save state |
| **SG: 2. Views** | In Development | Create floor plan views with crop regions for each grid cell (uses CropBox + CurveLoop) |
| **SG: 3. Sheets** | In Development | Create sheets and place viewports for each view using saved state from Step 2 |
| **SG: 4. Key Plan** | In Development | Create a drafting view with sector grid drawn as detail lines/labels, place on index sheet |
| **SG: Run All Steps** | In Development | Execute all four Sector Grid steps in sequence with feedback |

---

## 10. Temp Panel (3 buttons)
Scope box utilities (experimental/temporary).

| Button | Status | Description |
|--------|--------|-------------|
| **Place In Scope Boxes** | Beta | Pick a text note, then copy it into every scope box with the sector number |
| **Scope Box Rename** | Beta | Batch rename scope boxes using find/replace with preview |
| **Scope Box Views/Sheets** | Beta | Create dependent views and sheets from scope boxes (selectable rows, per-item transactions) |

---

## 11. BCG Notes Panel (4 buttons)
Model-embedded issue tracking with Odoo Rework module integration.

| B# | Button | Status | Description |
|----|--------|--------|-------------|
| B-49 | **New Note** | Designed | Create a new model note (category: Issue/Todo/Warning/Info/Note). Captures model context automatically (project number, model name, active view). Writes to sidecar JSON at Q:\Pearl_Prod\zz_revit_BCGNotes\ then attempts Odoo sync. |
| B-50 | **View Notes** | Designed | Display all notes for the current model filtered by status and category. Reads from sidecar JSON. Shows Odoo sync status per entry. |
| B-51 | **Edit / Resolve** | Designed | Select an existing note to edit or mark resolved. Updates sidecar JSON and calls Odoo update endpoint. Resolution is authoritative in Odoo; this button is a convenience path. |
| B-52 | **Sync Pending** | Designed | Sweep all sidecar JSON entries with odoo_synced: false and retry Odoo push. Handles offline/connectivity gap recovery. |

> **Architecture note:** Write-ahead JSON sidecar at `Q:\Pearl_Prod\zz_revit_BCGNotes\{ProjectNumber}_notes.json`
> is written first on every create/edit operation. Odoo push is attempted second. JSON is the
> write-ahead log; Odoo Rework module is the system of record. Entries carry `odoo_synced`
> boolean and `odoo_record_id` for reconciliation.
>
> **Integration gate:** Odoo REST/MCP endpoint definition required from P7 (Victor) before
> Revit-side API calls can be implemented. Field mapping to existing Rework module record
> structure pending P7 response to handoff issued 2026-04-04.
>
> **Future Odoo integration:** Revit-originated entries distinguishable from manual Rework
> entries via `source: "revit"` field. Revit context (model name, path, project number,
> active view, Revit version, optional element ID) stored as structured data on Odoo record.

---

## Pending Panel Assignment

The following buttons have been designed but panel placement has not yet been confirmed by Gregory.

| B# | Button | Status | Description |
|----|--------|--------|-------------|
| B-47 | **Project Info Writer** | On Hold | Read project parameters from Excel at fixed network path, match row by Project Number, present read-only confirmation before writing to model. Blocked: title block shared parameter list not yet received. Unblock path: extract from title block .rfa or IAH100 model. |
| B-48 | **Door/Room Resolve & Tag** | In Development | Three-phase: Phase 1 investigates blocking via nested link walk; Phase 2 self-heals via workset/path/Approach-B tiers; Phase 2b rehosts orphaned tags; Phase 3 tags untagged doors/rooms in directly-loaded links. Windsurf prompt delivered. Live test on IAH100 pending. |

> **Action required:** Gregory to confirm panel placement for B-47 and B-48 so these rows
> can be moved to their correct panel sections in the next GOV-013 update.

---

## Summary by Status

| Status | Count |
|--------|-------|
| Complete | 26 |
| Beta | 12 |
| In Development | 9 |
| Designed | 4 |
| On Hold | 1 |
| **Total** | **52** |

## Summary by Panel

| Panel | Button Count | Purpose |
|-------|--------------|----------|
| **PIDS** | 12 | Perimeter security workflow |
| **Sheets** | 7 | Sheet/view automation |
| **RenumberElements** | 6 | Device numbering |
| **Print** | 4 | PDF and print output automation |
| **FOV** | 4 | Camera FOV visualization |
| **LinkedModel** | 4 | Linked model management |
| **BCG Notes** | 4 | Model issue tracking / Odoo integration |
| **Linked CAD** | 3 | DWG layer management |
| **Temp** | 3 | Scope box utilities |
| **IronRacks** | 2 | Network switch assignment |
| **Parameters** | 2 | Parameter/family tools |
| **Pending Assignment** | 2 | B-47, B-48 -- panel TBD |

---

## Change Log

| Version | Date | Change |
|---------|------|--------|
| 1.3 | 2026-04-04 | Added B-47 (Project Info Writer, On Hold) and B-48 (Door/Room Resolve & Tag, In Development) to Pending Panel Assignment section. Added BCG Notes panel (Panel 11) with B-49 through B-52 (status: Designed). Updated total 46 to 52 buttons, 10 to 11 panels. Added Designed and On Hold to status key. |
| 1.2 | 2026-03-22 | Added Print panel (Section 7) with B-43 through B-46. Updated total 42 to 46 buttons, 9 to 10 panels. In Development count updated 4 to 8. Decisions: B-numbers append (not insert), dedicated Print panel (not Sheets or Temp). |
| 1.1 | 2026-03-22 | Added Status column to all panels. Corrected Sheets panel button name: "Duplicate Sheet Set" to "Duplicate Sheet Set to New Level" (B-42, confirmed Complete 2026-03-17). Added IronRacks and RenumberElements panel gap notes for Gregory confirmation. |
| 1.0 | 2026-03-16 | Initial version. |
