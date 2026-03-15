# BCG Corp — SOP Governance & Intake Protocol

**Version:** 1.2
**Effective:** March 2026
**Last Updated:** 2026-03-14
**Scope:** All Claude Projects (P0–P9) and subprojects
**Owner:** Gregory Bernardo, President
**Maintenance:** Jennifer Brezniak (post-approval)

---

## 1. Purpose

This document governs how new workflow ideas are surfaced, evaluated,
classified, and handed off for SOP drafting at BCG Corp. It is a
meta-process — it does not describe a workflow BCG performs for clients;
it describes how BCG creates and maintains its own workflow library (the
W-series SOPs).

Without this process, SOP creation is ad hoc: good ideas get lost,
duplicate work happens, and the W-series grows without consistent
classification or quality control. This document ensures every new SOP
candidate moves through a defined path from idea to approved workflow.

---

## 2. Scope

**In scope:**
- Any new workflow idea that may become a standalone W-series SOP
- Reclassification of existing embedded steps that should be promoted
  to full SOPs
- W-series ID assignment and tier classification
- Handoff from P0 (or any satellite project) to P2 for drafting

**Out of scope:**
- The drafting of SOPs themselves (governed by the SOP Standard Format
  in the BCG Style Guide)
- Revisions to existing approved SOPs (governed by the individual SOP's
  revision history process)
- PROD-series documents (production templates; separate classification)

---

## 3. Who Can Surface a New SOP Idea

Any BCG team member can surface a new SOP idea. There is no gatekeeping
on submission — the classification step filters what proceeds.

**Common triggers:**
- A task is performed repeatedly and relies on tribal knowledge rather
  than documentation
- A new team member has to ask how something is done rather than read
  how it is done
- A workflow exists in someone's head or email but not in writing
- A process breaks or produces inconsistent results due to lack of
  documented steps
- A satellite project (P1–P9) identifies a process gap while executing
  its own work
- Gregory identifies a new capability or service delivery pattern that
  needs standardization

**How to surface an idea:**
- Verbally to Gregory or in a satellite project session
- As a note or message to Jennifer Brezniak (P2 owner)
- As a flagged item during a project review or team meeting

All ideas are logged by Gregory (or delegated to Jennifer) before
evaluation begins. An unlogged idea is not in the queue.

---

## 4. Classification Steps (P0 Responsibility)

Before any idea is handed off to P2 for drafting, it must be classified.
This is P0's job — not P2's. P2 drafts; P0 decides what gets drafted.

### Step 1 — SOP vs. Embedded Step

Determine whether the idea warrants a standalone SOP or whether it
belongs as an embedded step within an existing SOP.

**Standalone SOP if:**
- The workflow has a clear trigger, defined inputs, and defined outputs
- It is performed by a named owner with a named backup
- It maps to an Odoo task template or checklist
- It will be referenced by more than one other process

**Embedded step if:**
- The activity is a sub-action within a larger workflow already being
  documented
- It does not have its own trigger or independent lifecycle
- It requires no separate QC checkpoint

If the idea is an embedded step, route it to the relevant existing SOP
owner. No new W-series ID is assigned.

### Step 2 — Tier Assignment

If the idea qualifies as a standalone SOP, assign a tier. Tier
assignment affects drafting priority in P2 — Tier 1 SOPs are drafted
first.

| Tier   | Description                                              | Example                                           |
|--------|----------------------------------------------------------|---------------------------------------------------|
| Tier 1 | Core operational — directly supports billable delivery   | Project kickoff, drawing submittal, RFI response  |
| Tier 2 | Business operations — supports firm function, not directly billable | Meeting coverage, timesheet submission, vendor onboarding |
| Tier 3 | Governance / administrative — infrequent, compliance-oriented | Contract review, benefits enrollment, audit prep |

### Step 3 — W-Series ID Assignment

Assign the next available W-series ID from the workflow registry. The
registry is maintained in P2 and reflected in the BCG Initiative and
Workstream Catalog.

**Current highest assigned ID:** W-22 (as of 2026-03-14). Next available: **W-23**.

**ID rules:**
- IDs are sequential and permanent. Once assigned, an ID is not reused
  even if the SOP is retired.
- Retired SOPs are marked [RETIRED] in the registry — not deleted.
- PROD-series (production templates) use a separate numbering sequence.

### Step 4 — Key Design Decisions

Before handoff to P2, the following decisions must be made by Gregory
(or explicitly delegated). A handoff prompt is not complete until all
six are documented. P2 should not receive an incomplete handoff.

| Decision           | Options                                                         | Who Decides                   |
|--------------------|-----------------------------------------------------------------|-------------------------------|
| Delivery model     | Push (system/owner initiates) vs. Pull (recipient requests)     | Gregory                       |
| Odoo mapping       | Task template, checklist, automation trigger, or manual only    | Gregory + Bob Brezniak (IT)   |
| Owner assignment   | Who owns the process                                            | Gregory                       |
| Backup assignment  | Who covers when owner is unavailable                            | Gregory                       |
| Tier confirmation  | Tier 1 / 2 / 3                                                  | Gregory                       |
| Dependencies       | Does this SOP require another SOP to exist first?               | Gregory                       |

### Step 5 — Dependency Mapping

Identify whether the new SOP:
- Requires another SOP to be completed before it can be drafted
  (upstream dependency)
- Will be referenced by or trigger another SOP (downstream dependency)
- Affects an existing Odoo module configuration (flag for P7)
- Affects a team role or responsibility (flag for P6)

Document dependencies in the handoff prompt. P2 cannot sequence its
drafting backlog without this.

---

## 5. Standard Handoff Prompt

Every P0 → P2 SOP handoff uses the following format. No exceptions.
A partial handoff is returned to P0 for completion.
```
[HANDOFF: P0 → P2] | [DATE: {date}] | [TOPIC: {W-ID} Draft — {SOP Name}]

CLASSIFICATION
  W-Series ID:       W-{##}
  SOP Name:          {Full name}
  Tier:              Tier {1/2/3} — {description}
  Delivery Model:    Push / Pull / [Decision pending — Gregory]

OWNERSHIP
  Process Owner:     {Name}
  Backup:            {Name}

BUSINESS NEED
  {2–3 sentence description of why this SOP is needed. What breaks
  without it? What working example or trigger surfaced this need?}

DRAFT SCOPE
  {Numbered list of what the SOP must cover. Minimum: trigger, inputs,
  steps, outputs, QC checkpoint, Odoo mapping, exceptions.}

DEPENDENCIES
  Upstream:          {SOP IDs or "None"}
  Downstream:        {SOP IDs or "None"}
  Odoo flag:         {Yes — flag P7 / No}
  HR/Org flag:       {Yes — flag P6 / No}

EXPECTED DELIVERABLE
  Full SOP draft in BCG Style Guide format, marked
  [DRAFT — PENDING REVIEW], ready for Gregory's approval and P0 ingest.

VISIBILITY
  Notify:            {Names of team members who should know this SOP
                      is in draft}
```

---

## 6. Execution Roles and Access

| Role                          | Responsibility                                                               |
|-------------------------------|------------------------------------------------------------------------------|
| Gregory Bernardo (P0)         | Classification, design decisions, W-ID assignment, handoff prompt creation   |
| Jennifer Brezniak (P2 owner)  | Receives handoff, assigns drafting priority, owns draft to approval          |
| SOP process owner             | Provides subject matter input during drafting; reviews draft before Gregory approval |
| Bob Brezniak (IT / P7)        | Consulted on Odoo mapping when flagged                                       |
| Satellite project owners      | Can surface ideas; cannot self-classify or self-assign W-IDs                 |

**Access required for P2 drafting:**
- P2 Claude project (Jennifer Brezniak)
- BCG Style Guide (GitHub `bcgcorp/bcg-ops-governance/standards/`)
- W-series workflow registry (maintained in P2)
- Odoo task template library (if Odoo mapping is required)

---

## 7. Visibility and Stakeholder Notification

When a new SOP enters the drafting queue, notify the following:
- Process owner — they will be asked for subject matter input
- Process backup — they will need to learn and operate the workflow
- Any team member whose daily work will change when the SOP is adopted
- Gregory — confirm handoff received and queued (acknowledgment only)

Notification method: Slack or email. No formal meeting required for
routine SOP handoffs. A meeting may be warranted for Tier 1 SOPs that
affect project delivery workflows.

Do NOT announce a new SOP to the full team until it is approved. Draft
SOPs can create confusion if circulated prematurely.

---

## 8. Approval Loop and Registry Update

### Draft Approval

1. P2 produces draft marked [DRAFT — PENDING REVIEW]
2. Process owner reviews and provides input (via P2 or directly to
   Jennifer Brezniak)
3. Jennifer incorporates feedback and flags for Gregory's review
4. Gregory approves: marks [APPROVED — v{date}] and uploads to P2
   knowledge base
5. Approved SOP flows to P0 using the standard handoff label:
   `[FROM: P2 — SOP & Workflow Library] [DATE: {date}] [TOPIC: W-{##} Approved — {SOP Name}]`

### Registry Update (Post-Approval)

When a new SOP is approved, the following must be completed before the
process is considered closed. Owner: Jennifer Brezniak. Due: within 5
business days of Gregory's approval.

- [ ] W-series workflow registry in P2 (add new row: ID, name, tier,
      owner, version, status)
- [ ] BCG Initiative and Workstream Catalog — update workstream WS-02
      SOP count
- [ ] Odoo task template created or updated (if Odoo mapping was flagged)
- [ ] P6 notified if the SOP changes a role or responsibility
- [ ] Team notification issued (see Section 7)

---

## 9. Special Case: Meta-SOPs and Governance Documents

Some process documentation governs BCG's internal operations rather
than client delivery. These documents may not fit the W-series format.

**Use the W-series for:** Any operational workflow performed by a BCG team
member on a recurring basis, regardless of whether it is client-facing
or internal.

**Use the Governance repository** (`bcgcorp/bcg-ops-governance/standards/`)
**for:** Documents that define how BCG's systems, standards, or processes
are structured — not how they are operated. This includes the Style Guide,
the Project Ecosystem doc, and this document.

When an idea surfaces that is clearly governance (e.g., "how do we create
SOPs") rather than operational (e.g., "how do we submit a drawing
package"), classify it as a governance document and route it to Gregory
for first-pass drafting before Jennifer takes ownership.

---

## 10. Revision History

| Version | Date       | Author           | What Changed                                      |
|---------|------------|------------------|---------------------------------------------------|
| 1.2     | 2026-03-14 | Gregory Bernardo | Updated highest assigned W-ID from W-20 to W-22 (W-21 Document Storage SOP candidate, W-22 Weekly Sync Agenda Process assigned 2026-03-14). Updated next available slot to W-23. Updated file location to GitHub per GOV-001. |
| 1.1     | 2026-03-12 | Gregory Bernardo | Updated highest W-ID from W-17 to W-20 (W-18 Artifact Capture, W-19 Chat Quality Eval, W-20 Ecosystem Triage assigned). |
| 1.0     | 2026-03-05 | Gregory Bernardo | Initial draft                                     |

---

*This document is indexed in the BCG Governance Doc Registry at
`bcgcorp/bcg-ops-governance/standards/BCG_Governance_Doc_Registry.md`
and fetched at runtime by Claude projects via web_fetch.*
