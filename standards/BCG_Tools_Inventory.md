# BCGTools pyRevit Extension Inventory

**Total: 42 buttons** across **9 panels**

---

## 1. FOV Panel (4 buttons)
Camera field-of-view visualization tools.

| Button | Description |
|--------|-------------|
| **FOV Zero** | Back up Camera Distance to Target-SP for all cameras, then set to near-zero to collapse FOV cones |
| **FOV Restore** | Restore Camera Distance to Target-SP to original values backed up by FOV Zero |
| **Show FOV** | Set FOV Visible to Yes on all camera instances (warns if zeroed depths exist) |
| **Hide FOV** | Set FOV Visible to No on all camera instances |

---

## 2. IronRacks Panel (2 buttons)
Network switch/rack assignment tools.

| Button | Description |
|--------|-------------|
| **Audit Iron Racks** | Preview network switch assignments and report capacity/overflow (read-only) |
| **Reassign to Iron Racks** | Assign SwitchNumber_SP and SwitchPort_SP based on phase/headend/side with overflow labeling |

---

## 3. Linked CAD Panel (3 buttons)
Linked DWG layer management.

| Button | Description |
|--------|-------------|
| **CAD Layers Export** | Select a linked DWG and export all layer data to a JSON file |
| **CAD Layers Apply** | Apply layer visibility/graphics rules from a JSON config to linked DWGs |
| **Update Defaults** | Interactively edit layer visibility/color rules in the shared config |

---

## 4. LinkedModel Panel (4 buttons)
Linked Revit model management and change tracking.

| Button | Description |
|--------|-------------|
| **Bulk Link Redirect** | Redirect linked models to new locations in bulk (browse, auto-match by filename, apply) |
| **Save Baseline** | Capture current room and door data from linked model as baseline for change detection |
| **Check Changes** | Compare current linked model rooms/doors against saved baseline and report differences |
| **Tag Untagged** | Tag all untagged doors and rooms in a selected linked model |

---

## 5. PIDS Panel (12 buttons)
Perimeter Intrusion Detection System workflow automation.

| Button | Step | Description |
|--------|------|-------------|
| **Fence Polyline** | 1 | Create fence polyline from linked Civil DWG; converts to Revit model lines with Fence - PIDS Radar line style |
| **Place Poles** | 2 | Place PIDS poles along fence segments at corners, transitions, and evenly at 60m max spacing |
| **Dimension Poles** | 3 | Place linear dimensions between consecutive PIDS poles using 'Linear - ft + m' type |
| **Renum Poles** | 4 | Renumber PIDS poles sequentially (PL.001, PL.002...) clockwise from user-selected pole |
| **Devices** | 5 | Add all devices (cameras, speakers, RL, LD, PEC, SW) to each PIDS pole |
| **Tag Lines** | 6 | Create interior and exterior tag alignment lines offset from fence radar line |
| **Add Tags** | 7 | Place organized tags on PIDS poles, PEC, SW, PTZ, and LD devices |
| **Alarm Zones** | 8 | Place PIDS alarm zone instances pole-to-pole along the fence radar line |
| **Cleanup** | 9 | Remove duplicate/orphaned PIDS devices, re-validate parameters, verify device counts |
| **Draw Radar Line** | Utility | Manually draw the PIDS radar line by picking points with correct line style/workset |
| **Measure Radar Line** | Utility | Measure total length of PIDS Radar Line and display in Feet and Meters |
| **Extract Device Layout** | Utility | Extract ALL device parameters relative to their parent pole (debugging/reference) |

---

## 6. Parameters Panel (2 buttons)
Shared parameter and family registry tools.

| Button | Description |
|--------|-------------|
| **Capture Shared Parameter** | Select a linked model, choose specific shared parameters, and add them to shared parameter file |
| **Export Family Registry** | Export a CSV registry of all family types and line styles in the active project |

---

## 7. RenumberElements Panel (6 buttons)
Device and switch renumbering tools.

| Button | Description |
|--------|-------------|
| **Renum Cameras TDC1.0** | Renumber camera elements (CCTV) by Level, Phase, RoomNumber starting at C0001 |
| **Renum Cameras TDC1.1** | Renumber cameras (Family Classification-SP=CCTV) by Level, Phase, RoomNumber-SP, Switch Name-SP |
| **Renumber SW Ports** | Renumber SwitchPort_SP starting at 1 for each switch, incrementing by 1 |
| **Renumber Switches** | Renumber switches sequentially (SW01, SW02...) by rack and update all referencing elements |
| **Reset SW & Ports** | Reset switch/port numbers sorted by HeadendRackID, Network_Layer_SP, Mark; DSN NORTH/SOUTH separation |
| **Reset SW & Ports OPTDC 2.2a** | Same as above but sorted by HeadendID_SP instead of HeadendRackID |

---

## 8. Sheets Panel (7 buttons)
Sheet creation and sector grid workflow.

| Button | Description |
|--------|-------------|
| **Duplicate Sheet Set** | Duplicate sheets and floor plan views from one level to another with find-replace on level code |
| **Quikset Keyplan N Arrow** | Bulk edit Keyplan Legend-SP, Show Key Plan, and Show North Arrow across selected sheets |
| **SG: 1. Input & Preview** | Collect sector grid parameters via dialog, calculate grid layout, show preview, save state |
| **SG: 2. Views** | Create floor plan views with crop regions for each grid cell (uses CropBox + CurveLoop) |
| **SG: 3. Sheets** | Create sheets and place viewports for each view using saved state from Step 2 |
| **SG: 4. Key Plan** | Create a drafting view with sector grid drawn as detail lines/labels, place on index sheet |
| **SG: Run All Steps** | Execute all four Sector Grid steps in sequence with feedback |

---

## 9. Temp Panel (3 buttons)
Scope box utilities (experimental/temporary).

| Button | Description |
|--------|-------------|
| **Place In Scope Boxes** | Pick a text note, then copy it into every scope box with the sector number |
| **Scope Box Rename** | Batch rename scope boxes using find/replace with preview |
| **Scope Box Views/Sheets** | Create dependent views and sheets from scope boxes (selectable rows, per-item transactions) |

---

## Summary by Category

| Panel | Button Count | Purpose |
|-------|--------------|---------|
| **PIDS** | 12 | Perimeter security workflow |
| **Sheets** | 7 | Sheet/view automation |
| **RenumberElements** | 6 | Device numbering |
| **FOV** | 4 | Camera FOV visualization |
| **LinkedModel** | 4 | Linked model management |
| **Linked CAD** | 3 | DWG layer management |
| **Temp** | 3 | Scope box utilities |
| **IronRacks** | 2 | Network switch assignment |
| **Parameters** | 2 | Parameter/family tools |
