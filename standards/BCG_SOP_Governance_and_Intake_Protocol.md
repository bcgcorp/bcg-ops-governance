# BCG Corp — SOP Governance & Intake Protocol

**Version:** 1.3
**Effective:** March 2026
**Last Updated:** 2026-03-17
**Scope:** All Claude Projects (P0–P10) and subprojects
**Owner:** Gregory Bernardo, President
**Maintenance:** Jennifer Brezniak (post-approval)

---

## 1. Purpose

This document governs how new workflow ideas are surfaced, evaluated, classified, and handed off for SOP drafting at BCG Corp. It is a meta-process — it does not describe a workflow BCG performs for clients; it describes how BCG creates and maintains its own workflow library (the W-series SOPs).

---

## 2. Scope

**In scope:** Any new workflow idea that may become a standalone W-series SOP, reclassification of existing embedded steps, W-series ID assignment and tier classification, handoff from P0 to P2 for drafting.

**Out of scope:** The drafting of SOPs themselves (governed by BCG Style Guide), revisions to existing approved SOPs, PROD-series documents.

---

## 3. Who Can Surface a New SOP Idea

Any BCG team member can surface a new SOP idea. There is no gatekeeping on submission — the classification step filters what proceeds.

**Common triggers:** A task relies on tribal knowledge, a new hire has to ask how something is done, a process breaks due to lack of documentation, a satellite project (P1–P10) identifies a process gap.

**How to surface:** Verbally to Gregory or in a satellite project session, as a note to Jennifer Brezniak (P2 owner), or as a flagged item during a project review. All ideas are logged before evaluation begins.

---

## 4. Classification Steps (P0 Responsibility)

Before any idea is handed off to P2 for drafting, it must be classified. This is P0's job — not P2's.

### Step 1 — SOP vs. Embedded Step

**Standalone SOP if:** The workflow has a clear trigger, defined inputs/outputs, a named owner with backup, maps to an Odoo task template, and will be referenced by more than one process.

**Embedded step if:** The activity is a sub-action within a larger workflow, has no independent lifecycle, and requires no separate QC checkpoint.

### Step 2 — Tier Assignment

| Tier | Description | Example |
|------|-------------|--------|
| Tier 1 | Core operational — directly supports billable delivery | Project kickoff, drawing submittal, RFI response |
| Tier 2 | Business operations — supports firm function | Meeting coverage, timesheet submission, vendor onboarding |
| Tier 3 | Governance / administrative — infrequent, compliance-oriented | Contract review, benefits enrollment, audit prep |

### Step 3 — W-Series ID Assignment

**Current highest assigned ID:** W-23 (as of 2026-03-17). Next available: **W-24**.

IDs are sequential and permanent. Once assigned, an ID is not reused even if the SOP is retired. Retired SOPs are marked [RETIRED] — not deleted. PROD-series uses a separate numbering sequence.

### Step 4 — Key Design Decisions

Before handoff to P2, all six decisions must be documented:

| Decision | Options | Who Decides |
|----------|---------|-------------|
| Delivery model | Push vs. Pull | Gregory |
| Odoo mapping | Task template, checklist, automation trigger, or manual only | Gregory + Bob |
| Owner assignment | Who owns the process | Gregory |
| Backup assignment | Who covers when owner is unavailable | Gregory |
| Tier confirmation | Tier 1 / 2 / 3 | Gregory |
| Dependencies | Does this SOP require another SOP to exist first? | Gregory |

### Step 5 — Dependency Mapping

Identify whether the new SOP requires another SOP (upstream), will be referenced by another SOP (downstream), affects an Odoo module (flag P7), affects a team role (flag P6), or has legal/compliance implications (flag P10).

---

## 5. Standard Handoff Prompt

Every P0 to P2 SOP handoff uses this format. No exceptions.

```
[HANDOFF: P0 to P2] | [DATE: {date}] | [TOPIC: {W-ID} Draft — {SOP Name}]

CLASSIFICATION
  W-Series ID:       W-{##}
  SOP Name:          {Full name}
  Tier:              Tier {1/2/3} — {description}
  Delivery Model:    Push / Pull / [Decision pending]

OWNERSHIP
  Process Owner:     {Name}
  Backup:            {Name}

BUSINESS NEED
  {2-3 sentence description}

DRAFT SCOPE
  {Numbered list: trigger, inputs, steps, outputs, QC checkpoint, Odoo mapping, exceptions}

DEPENDENCIES
  Upstream:          {SOP IDs or None}
  Downstream:        {SOP IDs or None}
  Odoo flag:         {Yes — flag P7 / No}
  HR/Org flag:       {Yes — flag P6 / No}
  Legal/Compliance:  {Yes — flag P10 / No}

EXPECTED DELIVERABLE
  Full SOP draft in BCG Style Guide format, marked [DRAFT — PENDING REVIEW].

VISIBILITY
  Notify: {Names}
```

---

## 6. Execution Roles and Access

| Role | Responsibility |
|------|---------------|
| Gregory Bernardo (P0) | Classification, design decisions, W-ID assignment, handoff prompt creation |
| Jennifer Brezniak (P2 owner) | Receives handoff, assigns drafting priority, owns draft to approval |
| SOP process owner | Provides subject matter input during drafting |
| Bob Brezniak (IT / P5) | Consulted on Odoo mapping when flagged |
| Victor Carrillo (P7) | Consulted on Odoo module implications when flagged |
| Satellite project owners | Can surface ideas; cannot self-classify or self-assign W-IDs |

---

## 7. Visibility and Stakeholder Notification

When a new SOP enters the drafting queue, notify: process owner, process backup, any team member whose daily work will change, and Gregory (acknowledgment). Do NOT announce a new SOP to the full team until it is approved.

---

## 8. Approval Loop and Registry Update

1. P2 produces draft marked [DRAFT — PENDING REVIEW]
2. Process owner reviews
3. Jennifer incorporates feedback and flags for Gregory
4. Gregory approves: marks [APPROVED — v{date}]
5. Approved SOP flows to P0 using handoff label

**Post-approval registry updates (Jennifer, within 5 business days):**
- W-series workflow registry in P2
- BCG Initiative and Workstream Catalog — update WS-02 SOP count
- Odoo task template created or updated (if flagged)
- P6 notified if SOP changes a role
- P10 notified if SOP has legal/compliance implications
- Team notification issued

---

## 9. Special Case: Meta-SOPs and Governance Documents

**Use the W-series for:** Any operational workflow performed on a recurring basis.
**Use the Governance repository for:** Documents that define how systems, standards, or processes are structured — not how they are operated.

---

## 10. Revision History

| Version | Date | Author | What Changed |
|---------|------|--------|-------------|
| 1.3 | 2026-03-17 | Gregory Bernardo | Updated scope P0-P9 to P0-P10. W-ID pointer W-17 to W-23 (next: W-24). Added P10 flag to dependency mapping and handoff template. Added Victor and P10 to execution roles. |
| 1.2 | 2026-03-15 | Gregory Bernardo | Updated W-ID pointer W-17 to W-22. |
| 1.1 | 2026-03-10 | Gregory Bernardo | Updated scope P0-P7 to P0-P9. |
| 1.0 | 2026-03-05 | Gregory Bernardo | Initial draft. |

---

*This document is indexed in the BCG Governance Doc Registry and fetched at runtime by Claude projects via web_fetch.*