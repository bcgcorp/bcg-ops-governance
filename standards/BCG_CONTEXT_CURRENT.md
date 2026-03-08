# BCG_CONTEXT_CURRENT
**Version:** 1.0
**Last Updated:** 2026-03-07
**Owner:** Gregory Bernardo
**Location:** OneDrive Corp/AI/Standards/
**Purpose:** Paste into any Claude session where connectors fail, or when
working outside the normal project structure. Gives Claude full BCG context
without relying on the MS365 connector or project knowledge base retrieval.
**Maintenance:** Update within 2 weeks of any material change (team change,
new project, major initiative status shift). Overwrite in place — OneDrive
version history provides the audit trail.

---

## COMPANY OVERVIEW

**Legal Name:** Bernardo Consulting Group LLC (BCG Corp)
**President:** Gregory Bernardo
**Headquarters:** Denton, TX — fully remote team, U.S. nationwide
**Domain:** BCG-CORP.COM
**Industry:** Physical security consulting — hyperscale data centers and
critical infrastructure
**Services:** Physical Security Design, Reference Design Development,
Construction Documentation, Construction Administration, Peer Review & Advisory
**Core Capability:** Security system design (access control, video surveillance,
intrusion detection, perimeter security) for hyperscale data center programs.
**Current Scale:** 9 FTE, founder-led. Active hiring pipelines.
**Prime Relationships:** Arcadis (strong), HKS (good), Gensler (burgeoning), S+R (active)

---

## TEAM ROSTER

| Name | Role | Projects |
|---|---|---|
| Gregory Bernardo | President | P0, P1, P3, P8, P9 |
| Bob Brezniak | IT Manager | P5, P5-001, P7-001 |
| Jason Harris | Fractional VP AI (pending engagement) | P4, P4-001, P4-002 |
| Jennifer Brezniak | HR Lead | P2, P6 |
| Victor Carrillo | Operations Assistant | P7, P7-004 |
| Cory Bialke | Sr. PSE / Design Team Lead | P2 contributor |
| Joshua Davis | Sr. PSE | Active projects |
| Jeff Bernardo | PSE / QC | Active projects |
| Stephanie Bernardo | Sr. Designer / Production Lead | P4-002 contributor |
| BIM Lead | VACANT — hiring on hold pending I-40 | — |

**Sync Liaisons:** Gregory primary / Bob backup for all 17 projects.

---

## PROJECT ECOSYSTEM (17 Projects)

### Hub
| ID | Name |
|---|---|
| P0 | Master Strategic Plan |

### Satellites
| ID | Name | Primary Owner |
|---|---|---|
| P1 | Financial Modeling | Gregory |
| P2 | SOP & Workflow Library | Jennifer |
| P3 | Competitive Intel | Gregory |
| P4 | AI Infrastructure | Jason |
| P5 | IT Security / QOS | Bob |
| P6 | HR, People & Legal | Jennifer |
| P7 | Odoo Platform & ERP | Victor/Bob |
| P8 | Proposals & RFP | Gregory |
| P9 | Business Continuity | Gregory |

### Subprojects
| ID | Name | Parent | Owner |
|---|---|---|---|
| P4-001 | MCP Evaluation & Selection | P4 | Jason |
| P4-002 | Revit & BIM Automation | P4 | Gregory/Stephanie |
| P5-001 | Network Infrastructure Assessment | P5 | Bob |
| P7-001 | Dev Environment & AI Tooling | P7 | Bob |
| P7-002 | Platform Audit & Uplift | P7 | Gregory/Jason |
| P7-003 | Odoo 19 Feature Mining | P7 | Gregory/Jason |
| P7-004 | Notification Center & Invoice Req | P7 | Victor/Gregory |

---

## INITIATIVE CATALOG SUMMARY

**Active:** 39 initiatives (I-01 through I-41, minus I-20 and I-32 removed)
**Next slot:** I-42 (assigned: JSX Artifact Workflow Standard / Gregory / P0 / Q2 '26)
**Workstreams:** 11 (WS-01 through WS-11)

### Top Priority / Active Blockers

| ID | Initiative | Status | Blocker |
|---|---|---|---|
| I-23 | Odoo Accounting / Financial Baseline | On Hold | Data source not identified |
| I-24 | Licensing & Insurance Audit | Planned | No owner or start date — gates 5 downstream |
| I-40 | Benefits Package Restructuring | Active | Jennifer owner — gates BIM Lead hiring |
| I-41 | Enterprise Business Continuity Planning | Active Phase 1 | Gregory sole owner (continuity risk) |
| I-42 | JSX Artifact Workflow Standard | Active | Pattern library entry pending |

### Active / In Progress
I-01 (ACC Fundamentals Training), I-02 (Peer Review Workflows),
I-05 (Canvas Image Editor), I-08 (ASR/AppLocker), I-26 (AI Tool Onboarding)

---

## TECHNOLOGY STACK

**AI Infrastructure:** 2x NVIDIA DGX Spark, 2x RTX 5090 workstations
**ERP:** Odoo 18 self-hosted — C-3PO (production), BB-8 (staging), R2-D2 (dev)
**AI Interface:** Open WebUI
**Design Tools:** Autodesk Revit, AutoCAD, Bluebeam
**Collaboration:** Microsoft 365 (email/calendar/OneDrive/SharePoint)
**Network:** pfSense firewalls (×3), managed switches
**Security Framework:** NIST CSF 2.0 (primary), CIS Controls v8 IG2 (secondary)
**IDE:** Windsurf (AI-assisted development)

---

## GOVERNANCE DOCUMENT LOCATIONS

| Location | Purpose |
|---|---|
| OneDrive `Corp/AI/Standards/` | Governance docs (migrating to GitHub Phase 2) |
| OneDrive `Corp/AI/Outputs/[Project]/` | Claude-generated document outputs |
| OneDrive `Corp/AI/Tools/UI-Library/` | Exported JSX/HTML interactive artifacts |
| GitHub `bcg-governance` (Phase 2) | Version-controlled governance authority |
| GitHub `bcg-claude-projects` (Phase 2) | All 17 project instruction files |

---

## ROUTING RULES

- Production work happens in satellites (P1–P9). P0 synthesizes.
- Approved outputs flow to P0 with label:
  `[FROM: P#] [DATE: YYYY-MM-DD] [TOPIC: brief]`
- Cross-project routing goes through P0, not peer-to-peer
- Client security design data never leaves BCG-controlled systems (Tier 1)
- Tier 1/2 data artifacts stay in Claude.ai — never exported to HTML or SharePoint

---

## ACTIVE DECISIONS PENDING (as of 2026-03-07)

| # | Decision | Blocking |
|---|---|---|
| D-01 | Identify accounting data source | I-23, P1 financial models |
| D-02 | I-24 owner and start date | I-16/17/18/19/21 |
| D-03 | GitHub org name and repo name confirmation | Phase 2 standup |
| D-04 | Jason Harris onboarding start date | Phase 4 build |

---

## SECURITY BOUNDARY — ALWAYS APPLY

- **Tier 1 (Confidential):** Client security designs, project-specific data → on-premises ONLY. Never cloud.
- **Tier 2 (Restricted):** Financials, HR, contracts → on-premises preferred, encrypted.
- **Tier 3 (Internal):** SOPs, training, comms → on-premises or approved cloud (Odoo, M365).
- **Tier 4 (Public):** Marketing, website → any platform.
- NIST CSF 2.0 primary standard. CIS Controls v8 IG2 secondary.
- Current security rating: B+ with 3 identified gaps under remediation.
