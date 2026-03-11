# BCG pyRevit Tab Style Guide
**Document ID:** P4-001-STY-001  
**Version:** 1.0  
**Owner:** P4-001 — Revit & BIM Automation  
**Strategic Authority:** P0  
**Established:** March 2026  
**Status:** Active — Living Document  
**Primary Users:** Stephanie Bernardo, Nick Bernardo  

---

## Purpose

This document governs the design and organization of the BCG Corp custom pyRevit tab installed on all production Revit workstations. Every button, dropdown item, and menu entry in the BCG tab must conform to this guide.

**Core design principle:** Every BCG tool must be usable by Stephanie and Nick without Gregory present. If a user needs to ask what a button does or when to click it, the button has failed.

---

## 1 — Panel Architecture

### 1.1 Panel Inventory

Panels appear left-to-right in this fixed order. Do not reorder without P0 approval.

| # | Panel | Workflow Domain | Example Buttons |
|---|-------|----------------|-----------------|
| 1 | **PIDS** | Perimeter pole & device placement | Place Poles, Tag Poles, Number Poles |
| 2 | **Site Plans** | Security site plan & zone plan generation | Build Site Plan, Build Zone Plan |
| 3 | **Model** | Cleanup, links, families, project setup | Reassign Racks, Link Cleanup, Family Uplift |
| 4 | **Data** | Project info, capacity, spatial assignment | Write Project Info, Assign Rooms, Check Capacity |
| 5 | **QC** | Quality control & change tracking | Check Model QC, Change Delta, Rev Cloud |
| 6 | **Print & Output** | Printing, eTransmit, scheduling | Print Sheets, Queue Manager |
| 7 | **BCG** | Help & support — **always rightmost** | Help, Request/Bug, v1.0 |

### 1.2 Panel Sizing Rules

- No panel should exceed **6 top-level controls** before dropdown consolidation is required.
- Panels with 3 or fewer single-action buttons should use a **Stack** layout rather than 3 large buttons side by side.
- The **BCG panel is always the rightmost panel** and contains only support tools — no workflow automation buttons ever go there.

---

## 2 — UI Control Selection

### 2.1 Control Types

| Control | Use When |
|---------|----------|
| **PushButton** | One action, no variants. Default choice. |
| **SplitButton** | One dominant action + 2–5 less-common variants. Top click = primary action. Dropdown reveals variants. |
| **PulldownButton** | 2–6 related actions with no single dominant choice. All items equal weight. Use a descriptive group label. |
| **Stack (×3)** | 3 quick utility actions in the same panel domain. Renders as 3 compact buttons stacked vertically. |
| **Separator** | Visual divider between unrelated groups within one panel. One per panel maximum. |

### 2.2 Decision Tree

1. **One action, no variants?** → PushButton.
2. **Primary action + 2–5 variants?** → SplitButton. Top click = primary.
3. **2–6 equal-weight related actions?** → PulldownButton with descriptive group label.
4. **3 quick utilities in same panel?** → Stack of small PushButtons.
5. **More than 6 controls in one panel?** → Consolidate into dropdowns first. Then consider splitting the panel.

### 2.3 B-02 Applied Example

| Position | Control | Label |
|----------|---------|-------|
| Top-level | SplitButton | Place Poles (default = Step 1) |
| Dropdown item | Menu item | 1 — Place Poles |
| Dropdown item | Menu item | 2 — Tag Poles |
| Dropdown item | Menu item | 3 — Number Poles |
| Dropdown item | Menu item | 4 — Add Devices  `[GATED]` |
| Dropdown item | Menu item | 5 — Clean Up Devices |

> Gated steps remain visible in the dropdown but render as disabled, with a tooltip explaining the gate condition. Never hide a gated step — hidden buttons cause users to think the feature doesn't exist.

---

## 3 — Naming Conventions

### 3.1 Button Labels

- **Verb + Noun, Title Case, 2–4 words maximum.**
- No BCG button IDs in labels (B-02 stays internal documentation, never user-facing).
- Step-prefixed menu items: `1 — Place Poles`, `2 — Tag Poles`, etc.

| Good ✓ | Bad ✗ | Why Bad |
|--------|--------|---------|
| Place Poles | B-02 Step 1 | ID, not a label |
| Number Poles | Pole Numbering Tool | Noun-heavy, verbose |
| Reassign to Racks | B-01 Reassign Iron Racks | ID prefix, unclear |
| Check Model QC | QC | Too terse |
| Write Project Info | Project Info Writer | Noun-first, passive |

### 3.2 Script File Names

Pattern: `B{ID}_{step}_{ActionNoun}.py`

```
B02_1_PlacePoles.py
B02_2_TagPoles.py
B01_ReassignRacks.py
BCG_Help.py
BCG_FeatureRequest.py
```

### 3.3 Bundle Directory Names

```
PlacePoles.pushbutton/
PIDSPoles.splitbutton/
ModelCleanup.pulldown/
Help.pushbutton/
```

### 3.4 Icon File Names

Pattern: `icon_{buttonlabel}.png` — lowercase, underscores.

```
icon_place_poles.png        # 32×32  (icon.png in bundle)
icon_place_poles_small.png  # 16×16  (icon_small.png in bundle)
```

Both sizes are required in every bundle. pyRevit falls back to a placeholder if either is missing.

---

## 4 — Tooltip Standards

### 4.1 Requirements

Every PushButton, SplitButton, PulldownButton, and individual menu item **must** have a tooltip. No exceptions.

### 4.2 Three-Line Structure

| Line | Content | Required? |
|------|---------|-----------|
| **Line 1** | What it does — one sentence, active voice, ≤120 chars | Always |
| **Line 2** | When to use it — correct context or trigger condition | Almost always |
| **Line 3** | Key prerequisite or warning — only genuine footguns | If applicable |

### 4.3 Format Examples

| Button | Tooltip |
|--------|---------|
| Place Poles | Places PIDS poles along the active fence polyline at even spacing. / Use after drawing the fence polyline and selecting a start point. / Run in a plan view — does not work in 3D or section views. |
| Tag Poles | Tags all untagged poles in the active view with the BCG pole tag family. / Run after Place Poles (Step 1). Tags show blank numbers until Number Poles (Step 3) runs. |
| Number Poles | Assigns sequential pole numbers to PoleNumber-SP on all poles in the active view. / Tags update automatically. Re-running overwrites existing numbers. |
| Help | Opens the BCG pyRevit knowledge base in your browser. / All button documentation, known issues, and walkthroughs are there. |
| Request / Bug | Opens a pre-filled bug/request email to Gregory. / Describe what you want or what broke — reviewed weekly. |

### 4.4 Implementation — Script Docstring

pyRevit reads the script docstring as the tooltip body automatically. The button label becomes the tooltip title.

```python
"""
Places PIDS poles along the active fence polyline at even spacing.
Use after drawing the fence polyline and selecting a start point.
Run in a plan view -- does not work in 3D or section views.
"""
```

### 4.5 Anti-Patterns (Prohibited)

- Tooltip that repeats the button label verbatim — adds no information.
- Tooltip referencing internal button IDs (`"This runs B-02 Step 1."`) — users don't know IDs.
- Tooltip longer than 3 lines — excess belongs in the knowledge base.
- Empty tooltip — every control must have one.

---

## 5 — Help & Support Buttons

### 5.1 BCG Panel Layout

| Position | Label | Control | Action |
|----------|-------|---------|--------|
| Left | Help | PushButton (large) | Opens Odoo knowledge base in browser |
| Center | Request / Bug | PushButton (large) | Opens pre-filled bug/request email |
| Right | BCG Tab v1.0 | PushButton (small) | Opens changelog in browser |

### 5.2 Help Button

```python
import webbrowser
KB_URL = 'https://r2-d2.bcg-corp.com/odoo/knowledge/49'
webbrowser.open(KB_URL)
```

### 5.3 Feature Request / Bug Button

```python
import webbrowser, urllib.parse

FEATURE_REQUEST_EMAIL = 'gb@bcg-corp.com'
subject = urllib.parse.quote('BCG pyRevit — [Bug/Request]: ')
body = urllib.parse.quote(
    'Button: \n'
    'Issue or Request: \n'
    'Steps to reproduce (if bug): \n'
    'Revit version: \n'
)
webbrowser.open(f'mailto:{FEATURE_REQUEST_EMAIL}?subject={subject}&body={body}')
```

### 5.4 Version Display

Version is read from `BCG.tab/version.txt` at runtime — update the file, not the script.

```python
import os
VERSION_FILE = os.path.join(os.path.dirname(__file__), '..', '..', 'version.txt')
version = open(VERSION_FILE).read().strip() if os.path.exists(VERSION_FILE) else 'unknown'
```

---

## 6 — Icon Standards

### 6.1 Required Sizes

- `icon.png` — 32×32 pixels (large PushButton format)
- `icon_small.png` — 16×16 pixels (stacked buttons and menu items)

Both sizes required per bundle. Store co-located with `script.py` inside the bundle directory.

### 6.2 Color Palette

| Role | Hex | Used For |
|------|-----|----------|
| BCG Navy (primary) | `#1B3A5C` | Main glyph color, active states |
| BCG Blue (secondary) | `#2E6DA4` | Supporting shapes, outlines |
| BCG Accent | `#4A90D9` | Highlights, arrows, indicators |
| Warning Amber | `#F59E0B` | Gated/unavailable step indicators |
| Error Red | `#DC2626` | Destructive action warnings |
| Success Green | `#16A34A` | Confirmation states |
| White | `#FFFFFF` | Background (transparent preferred) |

### 6.3 Glyph Conventions

| Glyph | Button Category |
|-------|----------------|
| Dot + crosshair / pin | Placement tools |
| Tag / label shape | Tagging tools |
| `#` or ordered list | Numbering tools |
| Broom or ✕-circle | Cleanup / delete |
| Checkmark + magnifier | QC tools |
| Printer / export arrow | Print & Output |
| `?` in circle | Help |
| Wrench or speech bubble | Request / Bug |

---

## 7 — Error Handling & User Feedback

### 7.1 Error Message Rules

- State what went wrong in plain English — never surface a raw Python exception.
- State what to do next — actionable, not technical.
- Use pyRevit's `TaskDialog` / `forms.alert()` — not `print()`.

```python
from pyrevit import forms
forms.alert(
    'No fence polyline found in the active view.\n'
    'Draw a model line along the fence perimeter, then run Place Poles again.',
    title='BCG — Place Poles',
    warn_icon=True
)
```

### 7.2 Success Confirmation

- Short operations (< 2 seconds): no dialog needed — result is visible.
- Bulk operations: show a summary dialog with count and next step. Example: *"Placed 47 poles. Run Tag Poles (Step 2) next."*

### 7.3 Pre-Flight Checks

Every script validates all preconditions before touching the model:

| Check | What to Validate |
|-------|-----------------|
| Active view type | Script is running in a supported view (plan, elevation, etc.) |
| Selection / geometry | Required input exists (polyline drawn, elements selected) |
| Family availability | Required families are loaded |

If any check fails: show a clear `forms.alert()` and exit. Do not proceed with partial execution.

---

## 8 — Version Control

### 8.1 Version Scheme

Stored in `BCG.tab/version.txt`. Format: `MAJOR.MINOR`

| Increment | When |
|-----------|------|
| MAJOR | Panel reorganized, button removed, breaking change to existing behavior |
| MINOR | New button added, non-breaking improvement |

### 8.2 Deployment Checklist

Before pushing any update to production workstations:

- [ ] All new buttons have tooltips (3-line structure per Section 4)
- [ ] `icon.png` (32×32) and `icon_small.png` (16×16) present in every bundle
- [ ] Error handling tested: wrong view type, missing input, missing family
- [ ] `version.txt` incremented
- [ ] P0 output label sent if any button reached production-ready status

---

## 9 — P# Governance Routing

| Project | Role |
|---------|------|
| **P0** | Strategic owner. Holds pointer to this document. Must approve changes to panel names, panel order, or naming conventions. |
| **P4** | Tooling roadmap owner. Sequences button priority and receives all P4-001 handoffs. |
| **P4-001** | Document owner and execution team. Maintains this guide. Implements all pyRevit buttons. |
| **Other P4-00x subprojects** | Must reference this document by ID (`P4-001-STY-001`) for any pyRevit work. |

**Change routing:**
- Panel names, panel order, naming conventions → P0 approval required before P4-001 implements.
- Tooltip format, icon standards, error UX → P4-001 can implement and inform P0 after.

---

## 10 — Tab Standards Audit Tool (B-STY-001)

Queued for build after B-02 Steps 1–3 reach production. A Python script that walks all BCG tab bundle directories and auto-generates a compliance report against this style guide.

| Check | Pass Condition | Severity |
|-------|---------------|----------|
| `icon.png` present | File exists in bundle dir, 32×32 px | Error |
| `icon_small.png` present | File exists in bundle dir, 16×16 px | Error |
| Tooltip present | `script.py` has a non-empty docstring | Error |
| Tooltip length | Docstring has 1–3 meaningful lines | Warning |
| Label convention | Bundle dir name matches Verb+Noun pattern | Warning |
| Panel placement | Bundle lives under correct panel directory | Info |
| `version.txt` exists | File present at `BCG.tab/` root | Error |

---

*P4-001-STY-001 v1.0 — March 2026 — BCG Corp — CONFIDENTIAL INTERNAL USE ONLY*  
*Next review: When B-02 Steps 1–3 reach production-ready status, or when panel architecture changes.*
