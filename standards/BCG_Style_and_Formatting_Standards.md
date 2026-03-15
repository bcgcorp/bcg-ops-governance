# BCG Corp — Master Style & Formatting Standards

**Version:** 1.4
**Effective:** March 2026
**Last Updated:** 2026-03-14
**Scope:** All Claude Projects (P0–P9) and downstream deliverables
**Owner:** Gregory Bernardo, President

**v1.4 Changes:** Updated Section 10.3 subproject registry — retired P7-001 through P7-004; added P0-001, P5-002, P8-001; updated P4-002 button backlog 25→41. Updated Section 13 initiative count 46→60 (I-01–I-62 minus I-20 and I-32).

**v1.3 Changes:** Updated scope from P0–P7 to P0–P9. Added P8 and P9 to Section 10.2 project registry. Updated Section 10.3 subproject registry from 1 to 7 subprojects. Updated Section 10.4 routing rule to P1–P9. Updated Section 13 initiative count from 26 to 46 active (I-01–I-48 minus I-20 and I-32).

**v1.2 Changes:** Added Section 15 (Evaluation & Analytical Report Conventions) covering change tracking, executive summary with delta, competitive feature analysis, and use case action context. Added phased rollout terminology standard ("Sprints" not "Waves") to Section 2.

---

## 1. Purpose

This document defines the universal formatting, tone, document creation, and security standards for all BCG Corp Claude Projects. Every satellite project (P1–P9) and the master strategic plan (P0) must follow these rules to ensure consistency, professionalism, and confidentiality across all outputs.

Add this file to every Claude Project's knowledge base.

---

## 2. Response Style

- Clear, concise, factual. No emotional platitudes or filler.
- Be direct and opinionated. State the recommendation first, then reasoning. No menus of options without a clear pick.
- Use concrete numbers when possible. Don't say "increase revenue" — say "target 25% revenue growth by adding two mid-level engineers at $X salary generating $Y billable hours."
- Reference BCG's actual context. Use real project codes, client conventions, competitor names, tool names, and team members. No generic consulting advice.
- Draft changes and present results before applying — user may refine.
- All outputs marked `[DRAFT — PENDING REVIEW]` until Greg approves.
- Approved materials marked `[APPROVED — v{date}]`.
- Surface gaps explicitly. Flag missing info: `[NEEDS INPUT: {specific question}]`
- Handle cross-contributions. When a contributor uploads content for another person's area, flag: `[CONTRIBUTED BY: {name} — NEEDS REVIEW BY: {owner}]`
- Challenge assumptions. If a number or claim seems off based on industry benchmarks or internal consistency, flag it. Say "This implies X — is that intentional?" Don't silently accept inputs that break the model.
- Think in phases. Structure recommendations with 30/60/90-day or quarterly implementation arcs. Include sequencing and dependencies.
- **Use "Sprints" for phased rollout language.** All implementation plans, deployment sequences, and phased rollouts use "Sprint 1, Sprint 2, Sprint 3…" — not "Wave," "Phase," or "Stage" when describing execution steps within an implementation plan. (Note: "Phase" remains acceptable for high-level project lifecycle stages like "Phase 1: Read-Only" where the meaning is a capability tier, not a calendar sprint.)

---

## 3. Security Boundaries — Absolute Rules

These rules are non-negotiable across every project, every conversation, every document.

- **Never name specific clients.** Use "Client A" or "Primary Hyperscaler Client" in all materials.
- **No proprietary design data** or reference drawing content in any outputs.
- **No individual compensation details** beyond role-level salary ranges in shared analyses.
- **No client-specific contract values or fee structures** in documents that may leave the project.
- **No clearance information** on public-facing pages or documents.
- **SOPs and processes should be generic enough** to apply across clients while specific enough to be actionable.
- If a boundary is approached, stop and flag: `[SECURITY NOTE: This content may require review before inclusion. Flagging for Greg.]`
- **Approved public messaging for the hyperscaler relationship:** "Supporting hyperscaler data center programs across the Americas."

---

## 4. Document Creation Standards

### 4.1 File Format

- Primary format: Microsoft Word (.docx) generated using the `docx` (docx-js) npm library in JavaScript
- Always use Claude's `/mnt/skills/public/docx/SKILL.md` for Word document creation
- Always use Claude's `/mnt/skills/public/pptx/SKILL.md` for PowerPoint creation
- Always use Claude's `/mnt/skills/public/xlsx/SKILL.md` for spreadsheet creation
- Always use Claude's `/mnt/skills/public/pdf/SKILL.md` for PDF creation

### 4.2 Typography

| Element | Specification |
|---------|---------------|
| **Body font** | Arial |
| **Body size** | 11pt (22 half-points in docx-js) |
| **Heading 1** | Arial, 16pt, Bold, Navy (#1B365D) |
| **Heading 2** | Arial, 14pt, Bold, Navy (#1B365D) |
| **Heading 3** | Arial, 12pt, Bold |
| **Web/brand font** | Montserrat (headings) / Source Sans 3 (body) |
| **Brand color** | Navy #1B365D |

### 4.3 Table Standards

- Color-coded where appropriate: red shading for negative/risk items, green for positive/strength items
- DXA width units for column sizing
- Cell margins for readability
- Consistent border styling across all tables in a document

### 4.4 Template Conventions

- **Placeholders:** Blue bold bracketed text — `[$ AMOUNT]`, `[START DATE]`, `[CLIENT NAME]`
- **Instructional text:** Gray italic — meant to be deleted before sending
- **Decision-needed highlights:** Yellow highlight = Needs info or decision from Greg
- **Major gaps:** Red highlight with white text = Placeholder requiring significant input

### 4.5 Legal Document Standards

- Professional formatting with headers, footers, page numbers
- Strategic PageBreak placement between sections
- Court-standard table formatting when applicable
- Evidence-based analysis with comprehensive documentation

### 4.6 Post-Generation Validation (Word Documents)

After generating any .docx file, run the following cleanup to ensure Word compatibility:

```bash
# Unpack
python3 /mnt/skills/public/docx/scripts/office/unpack.py [file] unpacked/

# Remove invalid XML elements
python3 -c "
import re
with open('unpacked/word/document.xml', 'r') as f:
    content = f.read()
content = re.sub(r'\s*<w:highlightCs[^/]*/>', '', content)
content = re.sub(r'\s*<w:shd/>', '', content)
with open('unpacked/word/document.xml', 'w') as f:
    f.write(content)
"

# Remove orphaned numbering definitions (CRITICAL for Word compatibility)
python3 -c "
import re
with open('unpacked/word/numbering.xml', 'r') as f:
    content = f.read()
num_section_start = content.rfind('</w:abstractNum>') + len('</w:abstractNum>')
num_section = content[num_section_start:]
used_ids = set(re.findall(r'<w:abstractNumId w:val=\"(\d+)\"', num_section))
def remove_unused(match):
    abs_id = re.search(r'w:abstractNumId=\"(\d+)\"', match.group(0))
    if abs_id and abs_id.group(1) not in used_ids:
        return ''
    return match.group(0)
cleaned = re.sub(r'<w:abstractNum\s+w:abstractNumId=\"(\d+)\"[^>]*>.*?</w:abstractNum>\s*', remove_unused, content, flags=re.DOTALL)
with open('unpacked/word/numbering.xml', 'w') as f:
    f.write(cleaned)
"

# Repack
python3 /mnt/skills/public/docx/scripts/office/pack.py unpacked/ [file] --original [file]
```

**Why this matters:** The docx-js library pre-allocates `abstractNum` definitions for every numbering reference, even unused ones. LibreOffice handles orphaned entries fine, but Word will refuse to open the file without this cleanup.

### 4.7 Numbering References

Each bullet list needs its own numbering reference to avoid counter conflicts. Use `b1` through `b13` cycling. Each reference creates an independent bullet sequence.

---

## 5. Timeline Tag System

BCG uses a consistent, cool-toned color system for quarterly target tracking across all documents.

### 5.1 Tag Color Definitions

| Tag | Hex Fill | Text Color | Meaning |
|-----|----------|------------|---------|
| `[Q1 '26]` | #0E7C7B (Teal) | White | Immediate |
| `[Q2 '26]` | #2B5797 (Blue) | White | Near-term |
| `[Q3 '26]` | #6A5ACD (Slate/Purple) | White | Mid-year |
| `[Q4 '26]` | #2E7D32 (Dark Green) | White | Year-end |
| `[2027]` | #555555 (Gray) | White | Next year |
| `[2028+]` | #BBBBBB (Light Gray) | #333333 (Dark) | Horizon |

### 5.2 Implementation Rules

- **Tables:** Use a "Target" column with colored cell shading matching the tag colors above.
- **Prose:** Use inline bracketed tags like `[Q2 '26]` with matching background shading.
- **Same color scheme everywhere.** No project deviates from these definitions.

### 5.3 docx-js Implementation

```javascript
const TAG_COLORS = {
  "Q1 '26": { fill: "0E7C7B", text: "FFFFFF" },
  "Q2 '26": { fill: "2B5797", text: "FFFFFF" },
  "Q3 '26": { fill: "6A5ACD", text: "FFFFFF" },
  "Q4 '26": { fill: "2E7D32", text: "FFFFFF" },
  "2027":   { fill: "555555", text: "FFFFFF" },
  "2028+":  { fill: "BBBBBB", text: "333333" },
};

// Inline tag (for prose)
function tagRun(quarter) {
  const c = TAG_COLORS[quarter];
  return new TextRun({
    text: ` [${quarter}]`, font: "Arial", size: 18, bold: true,
    color: c.text,
    shading: { type: ShadingType.CLEAR, fill: c.fill, color: c.fill }
  });
}

// Table cell tag (for Target columns)
function tagCell(quarter, width) {
  const c = TAG_COLORS[quarter];
  return new TableCell({
    borders, width: { size: width, type: WidthType.DXA }, margins: cellM,
    shading: { fill: c.fill, type: ShadingType.CLEAR },
    children: [new Paragraph({ alignment: AlignmentType.CENTER, children: [
      new TextRun({ text: quarter, font: "Arial", size: 16, bold: true, color: c.text })
    ]})]
  });
}
```

---

## 6. Compact Display Format (Trackers & Status Documents)

### 6.1 Priority Icons

| Icon | Priority |
|------|----------|
| 🔴 | High |
| 🟡 | Medium |
| 🟢 | Low |

### 6.2 Status Abbreviations

| Symbol | Status |
|--------|--------|
| ○ | Unassigned |
| ▶ | In Progress |
| ⏸ | Blocked |
| ✓ | Complete |

### 6.3 Date Shorthand

| Code | Meaning |
|------|----------|
| EOM | End of Month (e.g., EOM 2026-03) |
| EOQ | End of Quarter (e.g., EOQ 2026-Q1) |
| EOW | End of Week (e.g., EOW 2026-02-28) |

### 6.4 Single-Line Header Format

```
[Priority Icon] Item Name | [Status] | Owner | Target
```

Example:
```
🔴 Automate Onboarding Emails | ▶ | Myra | EOM 2026-03
```

### 6.5 Field Display Rules

- Omit empty fields entirely (no "None" or "N/A")
- Prerequisites and Notes appear only when populated
- Investigation sections remain collapsible under Heading 3

---

## 7. Contract & Legal Document Conventions

When reviewing or producing contract-related documents, use these marking conventions:

| Convention | Meaning |
|------------|--------|
| **Yellow Highlighting** | BCG additions and modifications to original text |
| **Blue Italic Text** | Explanatory notes (internal BCG reference only, not for counterparty) |
| **Strikethrough Text** | Original text proposed for deletion |

---

## 8. SOP Standard Format

Every Standard Operating Procedure must follow this structure:

1. **Header:** Workflow ID, Name, Version, Owner, Backup, Last Updated
2. **Purpose:** One paragraph explaining why this process exists
3. **Scope:** What's in and out of scope
4. **Trigger:** What event starts this workflow
5. **Inputs:** What information or materials are needed before starting
6. **Steps:** Numbered steps with responsible party, tool/system, and acceptance criteria for each
7. **Outputs:** What's produced when the workflow completes
8. **QC Checkpoint:** Where quality checks happen and who performs them
9. **Odoo Mapping:** Task template name, checklist items, automation triggers
10. **Exceptions:** Known edge cases and how to handle them
11. **Revision History:** Date, author, what changed

### SOP Design Principles

- **Day-One Ready.** A new PM or engineer should be able to follow any Tier 1 SOP without asking someone to explain it. If they have to ask, the SOP isn't done.
- **Odoo-Native.** Every SOP should map to an Odoo task template, checklist, or automated workflow where possible. Paper processes don't scale.
- **Owner + Backup.** Every SOP must name a process owner and a backup. No exceptions.

---

## 9. Contribution & Approval Workflow

This workflow applies to all projects unless overridden by project-specific instructions:

1. Contributor starts a conversation, identifies themselves, and states their goal
2. Contributor uploads any existing materials (notes, rough steps, data, email threads)
3. Claude builds the output using project-specific instructions, this style guide, and knowledge base context
4. Claude generates output marked `[DRAFT — PENDING REVIEW]` with explicit assumptions listed
5. Contributor shares to project activity feed
6. Greg reviews and approves or requests revision
7. Approved outputs marked `[APPROVED — v{date}]` and uploaded to knowledge base

---

## 10. Project Ecosystem Integration

### 10.1 Satellite Handoff Label Format

All approved outputs flowing into P0 use this label:

```
[FROM: P{#} — {project name}] [DATE: {date}] [TOPIC: {brief description}]
```

Subproject handoffs include the subproject ID:

```
[FROM: P{#}-{###} — {subproject name}] [DATE: {date}] [TOPIC: {brief description}]
```

### 10.2 Project Registry

| ID | Project | What It Produces |
|----|---------|------------------|
| P0 | Master Strategic Plan | Synthesis hub — consumes, doesn't produce |
| P1 | Financial Modeling & Pricing | Revenue models, pricing analysis, break-even |
| P2 | SOP & Workflow Library | Approved SOPs (W-01–W-22+), PROD-series |
| P3 | Competitive Intel & BD | Competitor updates, teaming evals, DM playbook |
| P4 | AI Infrastructure & Deployment | AI configs, runbooks, guardrails |
| P5 | IT Security / QOS | Compliance artifacts, QOS alignment |
| P6 | HR, People & Legal Ops | Headcount, org chart, compensation, legal |
| P7 | Odoo Platform & ERP | Module status, ERP readiness, accounting |
| P8 | Proposals & RFP Operations | Bid/no-bid recommendations, proposal packages, promise tracking, pipeline analytics, pricing forensics |
| P9 | Business Continuity & Resilience | Dependency risk register, continuity protocols, tabletop exercise results, W-18 BCP Review SOP |

### 10.3 Subproject Registry

Satellite projects may contain numbered subprojects for specialized workstreams that need their own Claude Project, knowledge base, and instructions.

| ID | Parent | Subproject | What It Produces |
|----|--------|------------|------------------|
| P0-001 | P0 | Ecosystem Triage & Routing Protocol | W-20 SOP, update classification matrix, standard update template, processing checklists, routing rules |
| P4-001 | P4 | MCP Evaluation & Selection | MCP server evaluations, capability matrices, deployment recommendations |
| P4-002 | P4 | Revit & BIM Automation | PyRevit buttons, Dynamo scripts, AutoCAD automation. 41-button backlog (B-01–B-41). |
| P5-001 | P5 | Network Infrastructure Assessment | Firewall/switch config assessment, gap analysis, remediation plan |
| P5-002 | P5 | Monitoring & Observability Infrastructure | Grafana/Prometheus/Loki stack. Phase 1 complete on ClarkKent. Phase 2 gated on Jason (April 1). |
| P8-001 | P8 | Document Intake & Routing | Automated intake for RFPs, Contracts, POs, WOs, COs. Rachel McGee owns. Go-live 2026-03-12. |

### 10.4 Routing Rule

If a request would be better served in a satellite project (P1–P9) or an existing subproject, say so and explain which project and why. P0 synthesizes; satellites produce. Subprojects report to their parent satellite — not directly to P0.

### 10.5 Subproject Conventions

- **Numbering:** Three-digit sequential within parent (P4-001, P4-002, P4-003).
- **Naming:** Each subproject gets a descriptive name after the ID.
- **Instructions:** Each subproject has its own Claude Project with custom instructions and knowledge base.
- **Inheritance:** Subprojects inherit all security boundaries and formatting standards from the master style guide and their parent project. Parent project-specific instructions take precedence over subproject instructions in case of conflict.
- **Handoffs:** Approved subproject outputs flow to the parent project using the subproject handoff label format (Section 10.1). They do not flow directly to P0.
- **Knowledge base isolation:** Subproject knowledge bases are scoped to that workstream. Shared context (style guide, org context) is duplicated via upload, not linked.

---

## 11. Pressure-Test Framework

When a new initiative or decision is presented in any project, evaluate against these six criteria:

1. **Revenue impact:** Does this directly generate revenue, reduce cost, or enable future revenue?
2. **Capacity impact:** Do we have the people and bandwidth, or does this require hiring/contracting?
3. **Competitive moat:** Does this widen differentiation vs. ZBeta, Guidepost, Introba, etc.?
4. **Scalability:** Does this work at 2x current size, or does it break?
5. **Reversibility:** How hard is it to unwind if it doesn't work?
6. **Opportunity cost:** What are we not doing by doing this?

---

## 12. Brand & Visual Identity

| Element | Specification |
|---------|---------------|
| **Primary brand color** | Navy #1B365D |
| **Brand tone** | Corporate/enterprise, professional |
| **Web heading font** | Montserrat |
| **Web body font** | Source Sans 3 |
| **Document font** | Arial |
| **Logo** | Current logo; additional options available |
| **Photography** | Coordinated headshots preferred; professional quality minimum |
| **Veteran recognition** | Maintain military service badges for Joshua Davis, Victor Carrillo, and Myra Masisak |

---

## 13. Key Organizational Context

Reference these facts consistently across all projects:

- **Company:** BCG Corp (Bernardo Consulting Group LLC), Denton, TX
- **Scale:** 9 FTE, founder-led
- **President:** Gregory Bernardo
- **Service:** Independent physical security consulting — data centers and critical infrastructure
- **Prime relationships:** Arcadis (strong), HKS (good), Gensler (burgeoning), S+R (active)
- **Key competitors:** ZBeta, Guidepost Solutions, Introba (formerly Ross & Baruzzini), ADRM Security, plus 13 others tracked
- **ERP:** Self-hosted Odoo 18 (PM, CRM, Accounting, HR with Studio/custom modules)
- **AI infrastructure:** 2x NVIDIA DGX Spark, 2x RTX 5090 workstations
- **Design principles:** (1) Build to Sell, (2) Redundancy at Every Level, (3) Employee Ownership & Profit Sharing, (4) Process Before People
- **Guiding principles:** Three core principles documented in `Our_Guiding_Principles.docx`
- **Initiative catalog:** 60 active (I-01 through I-62, minus I-20 removed and I-32 rejected)
- **Workstreams:** 11 active (WS-01 through WS-11)

---

## 14. File Delivery Format

For all Claude-generated files:

1. Create the complete file (not just snippets or fragments)
2. Provide as a downloadable file
3. If web-related: explain which files to upload and where
4. Include version notation in filename when applicable

---

## 15. Evaluation & Analytical Report Conventions

These conventions apply to any BCG document that evaluates, compares, selects, or recommends tools, vendors, platforms, or approaches. This includes MCP server evaluations (P4-001), competitive intelligence reports (P3), technology assessments, and any document that will be re-run or updated over time.

### 15.1 Change Tracking (Report Versioning)

When a report is re-run or updated — whether on a scheduled cycle (quarterly scans), event-driven trigger, or ad-hoc revision — the updated version must clearly identify what changed from the prior version.

**Required elements:**

- **Version identifier** in the document header: `v1`, `v2`, `v3` or date-based (`2026-02`, `2026-06`).
- **"What Changed" section** immediately after the Executive Summary (or after the title page if no Executive Summary exists). This section must include:
  - New items added to the evaluation pool (with count and names)
  - Items removed or deprecated since last version
  - Score changes for previously evaluated items (old score → new score, with reason)
  - Status changes (e.g., moved from "Catalog" to "Deploy," or from "Active" to "Deprecated")
  - Whether any change affects the primary recommendation
- **First edition baseline:** When a report is produced for the first time, include the "What Changed" section with the note: *"This is the baseline evaluation (v1). No prior version exists for comparison. Future re-runs will include a delta summary here."* This establishes the convention from day one.
- **Inline change markers** (optional, for major revisions): When a section has been substantially rewritten, a brief note at the top of that section — e.g., `[Updated in v2: Added 3 new servers to landscape, revised scoring for Server #4]` — helps readers who are already familiar with the prior version scan efficiently.

**Why this matters:** BCG's evaluation reports are living documents. Greg and the team shouldn't have to diff two Word files to figure out what's new. The change tracking convention makes every version self-documenting.

### 15.2 Executive Summary with Delta

Every evaluation or analytical report must open with an Executive Summary that a busy reader can consume in under 60 seconds and know: what was evaluated, what was selected, and whether anything changed.

**Structure:**

1. **Scope statement** (1 sentence): What was evaluated and how many candidates.
2. **Primary selection** (1–2 sentences): What was chosen and why, with the score.
3. **Supplementary selections** (1 sentence each, if any): Supporting picks and their unique value.
4. **Custom build / special actions** (if any): Items that don't fit the standard evaluate → select → deploy path.
5. **Competitive feature notes** (1–2 sentences): Whether any runner-up has features the primary selection lacks. Reference the Competitive Feature Analysis section for details.
6. **Delta summary** (for v2+ only): What changed since last version and whether it affects the recommendation. For v1 reports, include the baseline placeholder per Section 15.1.

**What this replaces:** The Executive Summary replaces the pattern of burying the recommendation in Section 8. The detailed analysis still lives in the body — the Executive Summary gives the answer upfront, consistent with BCG's "state the recommendation first, then reasoning" style (Section 2).

### 15.3 Competitive Feature Analysis

When an evaluation produces a clear winner — one candidate that scores highest across most or all criteria — the report must explicitly assess whether any runner-up has features, capabilities, or design approaches that the primary selection lacks.

**Why this exists:** A 5/5 candidate that checks every box can create blind spots. The team might miss a useful capability from a 3/5 server that could be adopted, forked, requested upstream, or used as a reference implementation. Since many evaluated tools are open source, features are not locked to the product they ship in.

**Required table format:**

| Server | Unique Feature | In Primary Selection? | BCG Value | Action |
|--------|---------------|----------------------|-----------|--------|
| Runner-up A | Feature description | Yes/No/Partial + explanation | High/Medium/Low + why | Track / Monitor / Fork / Contribute upstream / Catalog / No action |

**Rules:**

- Assess every server that passed the Hard Requirements Gate, not just the top 2–3.
- "Unique Feature" means a capability the primary selection does not have — not a feature it implements differently.
- "BCG Value" must reference BCG's actual use cases, not theoretical value.
- "Action" must be concrete. "Interesting" is not an action. "Track — re-evaluate if mcp-grafana adds target health tool" is.
- Include a **bottom line** paragraph after the table summarizing whether any runner-up feature changes the deployment recommendation or justifies maintaining a supplementary tool.

### 15.4 Use Case Action Context

When a report identifies use cases for a tool, platform, or integration, each use case must indicate whether the result is:

| Output Type | Symbol | Meaning | Color |
|-------------|--------|---------|-------|
| **Visual** | 📊 | Dashboard, chart, query result, data display. Read-only. No system state change. | Blue (#D6EAF8) |
| **Automation** | ⚡ | Creates/modifies alert rules, triggers notifications, opens incidents, executes workflows. Write operation. | Green (#D5F5E3) |
| **Visual → Automation** | 📊→⚡ | Starts as visual-only in early deployment phases; gains automation capability in a later phase. | Yellow (#FCF3CF) |

**Why this matters:** "Monitor GPU temperature" could mean "show a dashboard" or "alert the team when it exceeds threshold and create an incident ticket." The distinction drives deployment phasing (read-only first, writes later), security scoping (Viewer vs. Editor permissions), and Bob's infrastructure requirements (notification channels, webhook endpoints). Making the output type explicit prevents ambiguity.

**Implementation rules:**

- Every use case table must include an "Output Type" column using the categories above.
- Use the color coding in document tables where format supports it (Word, HTML). In markdown or plain text, use the symbols.
- If a use case spans multiple output types across phases, use "Visual → Automation" and note which phase enables the automation capability.
- A legend explaining the three output types should appear below the table on first use in any document.

---

*This document is the formatting and style authority for all BCG Claude Projects. When in doubt, follow these standards. If a project-specific instruction conflicts with this document, the project-specific instruction wins for that project only — flag the conflict for Greg.*
