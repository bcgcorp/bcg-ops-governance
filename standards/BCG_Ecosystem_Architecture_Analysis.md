# BCG Ecosystem: Architecture & Strategic Analysis

**Version 1.4 · March 2026 · Prepared by P0 — Master Strategic Plan**

> BCG CORP — CONFIDENTIAL INTERNAL USE ONLY

---

## Executive Summary

The BCG Claude ecosystem was not designed generically and then adapted to Claude — it was purpose-built around the specific affordances and constraints of Claude's project platform, and shaped simultaneously by four organizational design principles: Build to Sell, Redundancy at Every Level, Process Before People, and Employee Ownership & Profit Sharing. Instruction files, knowledge bases, session isolation, context window limits, and MCP connectors each determined a structural decision. Understanding the architecture requires understanding both the platform it runs on and the firm it was built to serve.

This document provides a comprehensive reference for the ecosystem's architecture, current state, known future development plans, and unformalized improvement opportunities — scoped exclusively to the architectural components (Claude, GitHub, Odoo) rather than execution velocity or ownership assignments.

BCG Corp operates an 18-project Claude AI ecosystem purpose-built to run a 9-person physical security consulting firm at significantly above its headcount. The ecosystem is not a collection of chatbot sessions — it is a structured, governed, three-platform architecture comprising GitHub (governance), Odoo ERP (operations), and Claude (intelligence and synthesis), with a separate pyRevit/GitLab layer for production design tooling.

As of March 2026, the ecosystem tracks 62 active initiatives (I-01 through I-64), 11 workstreams, and 154+ catalogued documents across 18 Claude projects. All governance documents are synchronized at their current versions. The Ecosystem Awareness Block is at v1.5 across all 18 project instruction files. The three-system boundary rule has been formally established.

| Claude Projects | Active Initiatives | Workstreams | Gov. Documents | Health Score |
|---|---|---|---|---|
| **18** | **62** | **11** | **14 active** | **87 / 100** |

---

## Glossary of Key Terms

Authoritative source: `BCG_Ecosystem_Vocabulary.md` on GitHub.

| Term | Definition |
|---|---|
| **Initiative (I-series)** | A discrete, measurable project with a defined deliverable tracked in the Initiative Catalog with a unique I-number. Status values: Active, Planned, Blocked, On Hold, Complete. Next available slot: I-67. |
| **Workstream (W-series)** | An operational procedure document — SOP, playbook, or process standard — registered with a unique W-number. Next available slot: W-24. |
| **P-Code / Project** | A numbered Claude AI project. Each has a defined scope, a primary owner, and a 4-file configuration structure in bcg-ops-claude-projects on GitHub. Currently 18 active projects. |
| **Satellite Project** | A domain-specific Claude project (P1–P11) that produces deliverables. Approved outputs flow to P0 via structured handoff prompts. |
| **Subproject** | A scoped decomposition of a parent satellite. 6 active: P0-001, P4-001, P4-002, P5-001, P5-002, P8-001. |
| **Hub (P0)** | The integration center. P0 synthesizes approved outputs from all satellites and provides five-lens executive advisory (CEO/CTO/CFO/COO/CIO). Does not produce primary deliverables. |

---

## Introduction: How Claude's Project Architecture Shaped the Ecosystem

The BCG ecosystem wasn't designed in the abstract and then implemented in Claude. It was designed around what Claude Projects can and cannot do. Every structural constraint in the ecosystem — the hub-and-spoke topology, the EAB, the one-directional handoff flow, the knowledge base layer — is a direct response to the specific capabilities and limitations of Claude's project architecture as a platform.

### What Claude Projects Actually Are

A Claude Project is not a persistent AI agent. It has no continuous awareness, no background processing, and no memory between sessions beyond what is explicitly provided to it. Each conversation session begins from zero — the only state that persists is what is encoded in two places: the instruction file (the system prompt) and the project knowledge base (uploaded files). This is not a limitation to work around. It is the fundamental constraint that shaped every design decision in the BCG ecosystem.

### The Instruction File as the Firm's Institutional Memory

Claude Projects allow a custom system prompt — the instruction file — that is loaded automatically at the start of every session. This is the first and most important architectural affordance Claude provides. It means a persistent identity, a set of rules, a command vocabulary, and a context block can be encoded into every session without relying on the user to remember to provide it.

BCG's ecosystem design treats the instruction file not as a simple prompt but as a configuration artifact — versioned, stored on GitHub, structured as a 4-file package per project. The EAB exists specifically because the instruction file is the only guaranteed-loaded context in every session. If every Claude project needs to know how many projects exist and where to find the catalog, the instruction file is the only reliable delivery mechanism.

The instruction file is also what makes specialization possible. Each project's instruction file defines a fundamentally different Claude identity: P0 is a strategic synthesizer with five executive lenses, P7 is an Odoo ERP specialist with deep custom module knowledge, P11 is a restricted intelligence analyst with explicit routing rules. The instruction file is how the same underlying model becomes 18 different specialists.

### The Knowledge Base as the Reference Library — and Its Ceiling

Claude Projects allow files to be uploaded to a persistent knowledge base available across all sessions in that project. This enables BCG to give each specialist a curated reference library: P0 has the ecosystem status document and master strategic plan HTML; P4-002 has the pyRevit style guide and tool specifications; P8-001 has historical RFPs and the W-16 intake SOP.

The knowledge base has a hard ceiling that shaped BCG's architecture in an equally important way: files in the knowledge base are static. They reflect the state of the world at the time they were uploaded, not at the time of the session. This is why governance documents that change frequently — the Initiative Catalog, the EAB, the team directory — live on GitHub and are fetched via raw URL rather than uploaded to the knowledge base. The raw fetch pattern exists precisely because Claude's knowledge base cannot provide the currency a fast-moving 18-project ecosystem requires.

The asymmetry between the governed instruction file layer and the ungoverned knowledge base layer — identified as Improvement Opportunity 2 in Part 6 — is a direct consequence of this platform characteristic. The instruction file is refreshed through a deliberate propagation process. The knowledge base has no equivalent forcing function.

### One Project, One Context Window — The Driver of Specialization

Each Claude Project has a single context window. All knowledge base files, the instruction file, and the conversation history compete for that space. The more a project tries to do, the less deeply it can do any one thing.

This constraint is the architectural reason BCG has 18 projects rather than 3 or 4. Early in the ecosystem's development, projects were broader in scope. As the work matured, scope creep in any one project meant degraded performance — too many reference files, too many competing instruction priorities, insufficient context depth for complex tasks. The subproject splits (P4 → P4-001 + P4-002, P5 → P5-001 + P5-002) were direct responses to hitting this ceiling. The hub-and-spoke architecture is specifically calibrated to this constraint: P0 doesn't need to know the details of pyRevit button architecture or Odoo module development — it needs to synthesize approved outputs from projects that do.

### Session Isolation as the Driver of the Handoff Protocol

Claude Projects have no awareness of what happened in other projects. P7 cannot see P2's conversation history. P3 cannot see P10's legal analysis. Each project is an isolated context. This creates an explicit coordination problem: how does work produced in one project get consumed by another?

The structured handoff protocol — `[FROM: P{#}] [DATE:] [TOPIC:]` — exists entirely because of session isolation. Without a formal handoff structure, outputs from satellite projects would exist only in those projects' conversation histories, inaccessible to P0. The one-directional flow (satellite → P0, never P0 → satellite mid-session) is also a response to isolation. Since P0 cannot push context into a satellite project's live session, the only reliable direction is satellites surfacing approved outputs upward on a defined cadence.

### Project-Level Access Control as Security Architecture

Claude Projects support access restrictions that determine who can see and interact with each project. BCG's design treats this platform feature as genuine security architecture. The three restricted projects (P9, P10, P11) are restricted at the Claude platform level, not just by policy. P11's routing exception — CIRs never reaching P0 — is made credible by this architecture. If all projects were accessible to all users, the restriction would be purely procedural. The platform's access control gives the exception structural teeth.

### The Absence of Persistent Memory as the Driver of GitHub

Claude Projects have no long-term memory that persists independent of the instruction file and knowledge base. There is no database of past decisions, no accumulated institutional knowledge that builds automatically over time. Every session starts from the same baseline.

This absence is the single most important reason GitHub became the single source of truth. GitHub provides what Claude's project architecture cannot: a version-controlled, persistently queryable, externally accessible record of everything that matters. The raw fetch pattern turns GitHub into a form of persistent memory that Claude can access at session start — compensating precisely for the platform's lack of native persistence. The pgvector initiative (I-47) is the planned long-term supplement: a semantic memory layer that gives Claude access to the accumulated history of decisions, proposals, and outputs — the persistent memory the platform doesn't natively provide.

### The MCP Layer as Platform Extension

Claude Projects support MCP (Model Context Protocol) connectors — external data sources that can be queried at session start or during a session. This capability changed what was architecturally possible for the ecosystem. Before MCP, the only way to get current data into a Claude session was either the raw GitHub fetch (pull, manual trigger) or a human pasting content. After MCP, Claude can query live data sources — Odoo task status, GitHub repository state, Grafana infrastructure metrics — without human intermediation.

The entire I-31 initiative, the Phase 5 EAB evolution, and the observability layer are only possible because the Claude Projects platform added MCP support. The ecosystem's current architecture is, in several places, explicitly waiting for MCP infrastructure to mature. The EAB is a workaround for the absence of a live ecosystem state query. The manual Odoo-to-Claude boundary is a workaround for the absence of I-31.

### The Net Effect

Claude's project architecture — instruction files, knowledge bases, session isolation, context windows, access control, and MCP connectors — didn't just influence the BCG ecosystem design. It determined it. Every major structural choice is either:

- **Exploiting a platform affordance:** instruction files → persistent specialist identity; knowledge bases → curated reference libraries; access control → real security boundaries; MCP → live data queries.
- **Compensating for a platform constraint:** session isolation → handoff protocol; context window limits → subproject splits; static knowledge bases → GitHub raw fetch; no persistent memory → GitHub as institutional record; no live queries (yet) → EAB as static synchronization primitive.

The BCG ecosystem is not a generic AI deployment that happens to use Claude. It is an architecture purpose-built around the specific shape of Claude's project platform — its affordances exploited deliberately, its constraints compensated for systematically.

---

## Part 1: Why the Ecosystem Was Built This Way

The ecosystem's architecture is the answer to a specific problem: how does a 9-person firm compete with 50-person firms without hiring 50 people? Every structural decision traces back to that constraint.

### Why 18 Separate Projects Instead of One

The instinct when someone first encounters Claude is to use it as a single conversation partner. BCG rejected that pattern early because a single Claude context cannot maintain deep expertise across radically different domains simultaneously — pyRevit button development, legal compliance review, financial modeling, and HR policy are not just different topics, they require different reasoning postures, different reference documents, and different output formats.

Separate projects mean each Claude instance can be a genuine specialist. P4-002 knows the AppSettings_01 schema architecture, BCG's 7-panel tab structure, and the GitLab deployment pipeline in depth. P10 knows the Bernard Lewis matter, the insurance governance framework, and the state nexus exposure. Neither needs to know what the other knows. Trying to hold all of that in one context produces mediocrity across the board. The tradeoff is coordination overhead — which is exactly what P0 and the EAB solve.

### Why P0 Is a Hub That Synthesizes Rather Than Produces

This is the most important architectural decision in the ecosystem, and it was made because of how Gregory actually works. Gregory is the firm's strategic brain. He doesn't have time to be in 18 different Claude conversations simultaneously managing execution details. P0 exists so that Gregory has one place where the entire firm's strategic picture is current and coherent — but the work to maintain that picture is distributed to the satellites. Jennifer owns P2. Victor owns P7. Rachel owns P8-001. Their outputs flow to P0; P0 synthesizes.

The alternative — Gregory owning every Claude project as an active producer — is exactly the bottleneck pattern the firm is trying to escape. P0 as synthesis hub is a deliberate delegation structure embedded into the AI architecture itself.

### Why GitHub Is the Single Source of Truth

Before GOV-001, governance information was fragmented. Versions of the same document existed in Claude conversations, OneDrive folders, and team members' local copies. GitHub solves this because it is the only platform in the BCG stack that provides version control, a single authoritative URL, and the ability for Claude to fetch at runtime rather than relying on embedded static data. OneDrive cannot be fetched by Claude at session start. A Claude conversation's knowledge base is a file upload, not a live query. GitHub via raw URL is the only mechanism that gives every Claude project access to the same current data at the moment a session begins.

The deeper reason is Build to Sell. A firm that lives in its founder's head is worth nothing to a buyer. A firm whose processes, governance, and intellectual capital are systematically documented and version-controlled in a structured repository has demonstrable, transferable value. GitHub isn't just a technical choice — it's a due diligence asset.

### Why Odoo Is the Operational Record Layer

BCG needed an ERP that could run on-premise. The security posture for a physical security consulting firm that handles client basis-of-design documents is non-negotiable — client data cannot live on third-party SaaS servers. Odoo 18 self-hosted on R2-D2 satisfies that requirement while also providing PM, CRM, Accounting, and HR in a single integrated platform.

The decision to make Odoo the task ownership layer specifically — rather than letting Claude or GitHub track task status — came from a recognition that Claude is ephemeral and GitHub is not designed for task state changes. The three-system boundary rule is the formal acknowledgment of what each platform is actually good at.

### Why the EAB Exists (and Why It's Fragile)

When there are 18 separate Claude projects, each one risks operating in isolation — not knowing what the other 17 are doing, not knowing the current initiative count, not knowing whether a new project has been added. The EAB is the synchronization primitive that prevents this.

It was designed as a static block embedded in instruction files because that was the fastest, most reliable implementation available with the tools in hand. No MCP infrastructure required. No external dependencies. The fragility — having to update 18 files every time anything changes — is the known cost of that simplicity. The Phase 5 dynamic MCP query is the planned evolution, but the EAB got the ecosystem from 0 to 18 projects without waiting for infrastructure that didn't exist yet.

### Why the Three-System Boundary Was Formalized

The boundary rule (March 20, 2026) wasn't the starting architecture — it was the diagnosis of what was going wrong without it. Before formalization, Claude conversations were being used to track task status. GitHub was being treated as a backup instead of the authority. The boundary rule answers the question every team member faces dozens of times a day: where does this go? Task status goes in Odoo. Governance definitions go in GitHub. Analysis and synthesis happen in Claude.

### Why pyRevit Lives on GitLab Instead of GitHub

The pyRevit toolset contains production design tooling that runs inside Autodesk Revit on BCG project files. Client design data touches this code. The self-hosted GitLab instance at `alexandria.bcg-corp.com` keeps that code entirely within BCG's infrastructure — the same security boundary as the Odoo production server. The principle of keeping client-adjacent code on-premise was established before GOV-001 and was judged worth maintaining even after the GitHub MCP was proven.

### Why P10 and P11 Were Split Out Late

P6 was originally the catch-all for people, legal, and compliance. That worked at 15 initiatives. At 60+ initiatives it broke — not because the topics are unrelated, but because the access requirements diverged sharply. Legal matters and insurance governance require Gregory-only confidentiality that HR operational work doesn't. Candidate intelligence (P11) requires not just Gregory-only access but an explicit routing exception that prevents CIR data from ever reaching P0's knowledge base. The splits weren't architectural rethinking — they were the ecosystem maturing to enforce information boundaries that the firm's actual risk posture demands.

### The Underlying Philosophy

All of it traces to four organizational design principles:

- **Build to Sell** — documented, transferable processes. Every initiative has an I-number, every SOP has a W-number, every project has a 4-file configuration structure someone other than Gregory could pick up and run.
- **Redundancy at Every Level** — no single absence halts revenue. Satellite project owners exist; Stephanie has backup bid/no-bid authority; Jason Harris's onboarding is a phase-gate event.
- **Process Before People** — the process is defined before the person is assigned. The ecosystem existed before Jason was hired; P4's AI infrastructure is architected before he arrives to implement it.
- **Employee Ownership & Profit Sharing** — the ecosystem distributes ownership. Jennifer genuinely owns P2 and P6. Victor genuinely owns P7. Rachel genuinely owns P8-001.

The architecture is a direct expression of those four principles applied to the constraint of a 9-person firm that needs to operate like a much larger one.

---

## Part 2: Ecosystem Overview

### The Hub-and-Spoke Model

The 18 Claude projects are organized as a deliberate hub-and-spoke topology. P0 (Master Strategic Plan) is the integration hub. P0-001 (Ecosystem Triage & Routing Protocol) is the routing sub-hub that enforces catalog governance and handles initiative registration. Neither P0 nor P0-001 produces primary deliverables; they consume and govern.

```
              [ Business & BD ]
              P1 · P3 · P8 · P8-001
                      ↕
[ Operations & People ]   [ P0: Master Strategic Plan ]   [ Technology & AI ]
P2 · P6 · P9 · P10 · P11  Integration Hub + P0-001 Triage  P4 · P4-001 · P4-002
                      ↕                                    P5 · P5-001 · P5-002
              [ ERP Platform ]
              P7 · Odoo 18
```

Flow is one-directional: satellite → P0. P0 reflects the last approved handoff, not real-time satellite state.

### Project Registry — All 18 Projects

| P-Code | Project Name | Owner | Type | Current Health |
|---|---|---|---|---|
| **P0** | **Master Strategic Plan** | Gregory Bernardo | Hub | Active |
| P0-001 | Ecosystem Triage & Routing | Gregory Bernardo | Sub-hub | Active |
| **P1** | **Financial Modeling & Pricing** | Gregory Bernardo | Satellite | Stalled — D-01 open 30+ days |
| **P2** | **SOP & Workflow Library** | Jennifer Brezniak | Satellite | Active — backlog building |
| **P3** | **Competitive Intel & BD** | Gregory Bernardo | Satellite | Planned — no active drafting |
| **P4** | **AI Infrastructure & Deployment** | Jason Harris (Apr 1) | Satellite | Active |
| P4-001 | BCG Tab / pyRevit Tools | Gregory / Jason (Apr 1) | Subproject | Active |
| P4-002 | Revit & BIM Automation | Gregory Bernardo | Subproject | Active — largest backlog |
| **P5** | **IT Security / QOS** | Bob Brezniak | Satellite | Active |
| P5-001 | Network Infrastructure Assessment | Bob Brezniak | Subproject | Planned — not started |
| P5-002 | Monitoring & Observability | Bob / Jason (Apr 1) | Subproject | Phase 1 complete |
| **P6** | **HR & People** | Jennifer Brezniak | Satellite | Active — scope narrowed |
| **P7** | **Odoo Platform & ERP** | Victor Carrillo | Satellite | Active — large queue |
| **P8** | **Proposals & RFP Operations** | Gregory Bernardo | Satellite | Active — KB needs population |
| P8-001 | Document Intake & Routing | Rachel McGee | Subproject | Active — operational |
| **P9** | **Business Continuity & Resilience** | Gregory Bernardo | Satellite | Phase 1 in progress |
| **P10** | **Legal, Compliance & Risk** | Gregory Bernardo | Satellite | Active — Gregory-only |
| **P11** | **Candidate OSINT & Pre-Hire Intel** | Gregory Bernardo | Satellite | Active — RESTRICTED |

> Bold rows = hub or primary satellite. P10 split from P6 on 2026-03-15. P11 activated 2026-03-17. P7-001–P7-004 retired 2026-03-12.

---

## Part 3: The Three-System Architecture

The BCG ecosystem rests on three distinct platforms, each with a formally defined role established under GOV-001 (approved 2026-03-11) and the System Boundary Definition (2026-03-20).

| Platform | Owns | Architectural Role |
|---|---|---|
| **GitHub** | Initiative definitions (I-series), workstream governance (W-series), style standards, vocabulary, all Claude-fetchable operational documents | Authoritative record layer. Single source of truth. GOV-001 prohibits treating OneDrive as authoritative. |
| **Odoo ERP** | Task status, assignment, due dates, completion records, CRM pipeline, project financial data | Operational record layer. Three-environment topology: R2-D2 (prod), C-3PO (dev), BB-8 (staging). |
| **Claude** | Synthesis, decision support, sitrep generation, agenda production, strategic analysis, code specification | Intelligence and synthesis layer. Reads from GitHub and Odoo. Stores no authoritative records itself. |

### Layer 1 — GitHub: The Governance Layer

**Repository Structure**

| Repository | Visibility | Function |
|---|---|---|
| **bcg-ops-governance** | Public* | Runtime source of truth. All Claude-fetchable operational documents. |
| **bcg-ops-claude-projects** | Private | Version control for Claude project configuration. 4-file structure per project. Not a runtime data source. |
| **bcg-ops-revit-tools** | Deleted | Migrated to self-hosted GitLab at `alexandria.bcg-corp.com`. |

> *bcg-ops-governance is currently public. Privatization planned post-MCP deployment.

**The Raw Fetch Pattern**

```
https://raw.githubusercontent.com/bcgcorp/bcg-ops-governance/refs/heads/main/standards/{filename}.md
```

Governance data is fetched at session start rather than embedded statically. Structural weakness: the fetch is pull-based and manually triggered. No push notification or cache invalidation.

**The Ecosystem Awareness Block (EAB)**

The EAB is a standardized context block embedded in every one of the 18 project instruction files (currently v1.5). It provides each Claude instance with: total project count, full P-code list, next available I/W numbers, and GitHub fetch URLs. Architecturally, the EAB is a static snapshot — not a live query.

> **Architectural note:** The EAB is the most architecturally fragile component in the ecosystem. It functions, but does not scale. The planned Phase 5 evolution replaces it with a live MCP query. An intermediate solution using a canonical source file is identified in Part 6.

**The Two-Step Fetch Protocol**

1. Fetch the Registry to learn what documents exist and which are relevant to the current task.
2. Fetch only the relevant documents using the direct raw URLs defined in the Registry.

### Layer 2 — Odoo: The Operational Layer

**Infrastructure Topology**

| Instance | Hostname | Role |
|---|---|---|
| **R2-D2** | r2-d2.bcg-corp.com | Production |
| **C-3PO** | Internal network | Development |
| **BB-8** | Internal network | Staging |

Odoo runs with Studio and custom modules covering PM, CRM, Accounting, and HR. The odoo.sh hosted service is fully decommissioned. P7-001 through P7-004 were consolidated into P7 in March 2026.

**The MCP Integration Layer**

The Odoo MCP server is the planned architectural bridge — proven working with Windsurf. Once live as a Claude.ai connector, it enables Claude projects to query Odoo task data directly. This is the foundation for I-31 (Cross-Project Sync MCP Server).

**Current Odoo-Claude Integration Gap**

The boundary is currently one-directional and manual. Claude produces outputs that humans enter into Odoo; Odoo data enters Claude only through manual paste. The Odoo Task Audit Framework is ready to verify the 62-initiative alignment — currently blocked on a catalog version mismatch.

### Layer 3 — Claude: The Intelligence Layer

**Project Configuration Architecture**

Each Claude project operates through two context mechanisms:

- **Instruction file** — Static system prompt defining scope, role, commands, and embedded EAB. Stored in bcg-ops-claude-projects. Fully governed: versioned, propagation-tracked, auditable.
- **Project knowledge base** — Uploaded files providing runtime reference documents. Not automatically refreshed. No governance equivalent. Root cause of stale context in Claude sessions.

> The instruction file layer is versioned and auditable. The knowledge base layer is not. This asymmetry is addressed in Part 6 (Improvement Opportunity 2).

**Access Control Architecture**

| Project | Project Name | Restriction | Routing Exception |
|---|---|---|---|
| P9 | Business Continuity & Resilience | Gregory only | None — standard routing to P0 |
| P10 | Legal, Compliance & Risk | Gregory only | None — standard routing to P0 |
| **P11** | **Candidate OSINT & Pre-Hire Intel** | **Gregory only — RESTRICTED** | CIRs route to P10 (legal custody) and P6 (go/no-go). Does NOT route to P0. Candidate PII never stored in any Claude knowledge base. |

### Layer 4 — pyRevit / GitLab: The Production Tools Layer

| Component | Details |
|---|---|
| Source Control | Self-hosted GitLab at `alexandria.bcg-corp.com` — Repo: `bcg-ops-revit-tools` |
| Deploy Target | `Q:\Pearl_Prod\z_pyRevit` — manual deployment via `deploy.ps1` |
| Current Scale | 42 buttons across 7-panel BCG Tab: 25 Complete, 12 Beta, 4 In Development, 1 TBD |
| Build Tool | Windsurf IDE / Cascade AI — specifications authored in P4-001 and P4-002 |
| Storage Architecture | AppSettings_01 opaque schema with SCHEMA_GUIDS.md registry — prevents parallel-session Revit ExtensibleStorage GUID collisions |
| Claude Interface | P4-001 and P4-002 plan and specify tools. No live query from Claude to GitLab — tool status manually reported into sessions. |

---

## Part 4: Current State Assessment

### Governance Health

Ecosystem health score as of March 17, 2026: **87/100** (Reference integrity 40pts + Version parity 25pts + Ownership coverage 20pts + Velocity-adjusted freshness 15pts).

| Governance Component | Status | Version / Notes |
|---|---|---|
| Governance Doc Registry | ✅ Live | v2.0 — 14 active documents tracked |
| Initiative & Workstream Catalog | ✅ Live | v2.1 — 62 active, next slot I-65 |
| Ecosystem Awareness Block | ✅ Live | v1.5 — propagated to all 18 projects |
| Style & Formatting Standards | ✅ Live | v1.5 |
| Project Ecosystem & Handoffs | ✅ Live | v1.5 — 18-project registry |
| Ecosystem Vocabulary | ✅ Live | v1.0 — single source of truth for all terminology |
| Infrastructure Inventory | ⚠️ Unchecked | v1.2 — missing Highland Village branch and NUC9 cluster |
| Dashboard HTML | 🔴 Stale | v2.19 in P0 knowledge base / v2.24 in GitHub / 18-project actual state |
| M365 Security Lockdown | ✅ Complete | Confirmed 2026-03-14 |
| GitHub write-mode review | ⚠️ Scheduled | April 12, 2026 — CI/CD write PAT decision |
| bcg-ops-governance visibility | ⚠️ Public | Privatization planned post-MCP deployment |

### System Boundary Integrity

Known gaps as of this document:

- Odoo task audit unverified — whether all 62 catalog initiatives have correctly-tagged Odoo tasks is unknown. Audit blocked on catalog version mismatch.
- Project knowledge bases contain stale files. P0 ecosystem status reflects 16 projects; dashboard HTML reflects 17; actual state is 18.
- bcg-ops-governance is public, exposing Infrastructure Inventory and Team Directory without authentication.
- Odoo I-series tag field uses free-text, not a controlled vocabulary. No structural enforcement prevents status values that diverge from the catalog.

---

## Part 5: Known Future Plans

### Near-Term Architectural Events (30 / 60 / 90 Days)

| Horizon | Event / Initiative | Architectural Impact |
|---|---|---|
| **30 days (Apr 17)** | Jason Harris onboards April 1 | Unlocks 8 gated initiatives: I-51, I-52 Ph2, I-60 Ph2-3, P5-002 Ph2, I-47 (pgvector), I-48, WS-09, I-59 (Odoo NL). |
| | GitHub write-mode PAT review (Apr 12) | Determines whether automated governance doc commits are permitted. Gates write-PAT deployment. |
| | PIDS ExtensibleStorage rewrite | Migrates PIDS button from legacy descriptive ES schema to AppSettings_01 opaque architecture. |
| | Dashboard v2.24 rebuild | Restores P0 knowledge base accuracy: 18 projects, current team roster, 62 initiatives. |
| **60 days (May 17)** | P5-002 Phase 2 first components deployed | Grafana + Prometheus stack begins. MCP connections become activatable. |
| | I-50 Phase 1 — Standard Folder & File Structure | Prerequisite for W-21 Document Storage SOP and the Claude output filing convention. |
| **90 days (Jun 17)** | P5-002 Phase 2 fully operational | Full Grafana/Prometheus stack live. MCP integrations active. Live infrastructure health queries available to Claude. |
| | Wave 1 SOP Lookup Pilot | First Claude deployment to non-Gregory users for daily workflow. Validates BCG-Wizard AI guide integration. |

### Medium-Term Architecture Evolution (Q3–Q4 2026)

**I-31: Cross-Project Sync MCP Server**

I-31 is BCG's single planned architecture for closing the Odoo-Claude integration gap — a dedicated MCP server bridging Odoo task data directly to Claude with no interim email-based phase. When live, P0 sitreps can query both GitHub (governance state) and Odoo (operational state) without any human data input. Owner: Jason Harris, April 1.

> I-31 is the highest-leverage infrastructure initiative in the ecosystem. It closes the Odoo-Claude gap and makes every future sitrep self-updating rather than manually assembled.

**Phase 5: EAB → Dynamic MCP Query**

The static EAB embedded in all 18 instruction files will be replaced by a live MCP query executed at each session start. Adding P12 would require one GitHub commit; every session started after that commit would automatically see 19 projects. Prerequisite: bcg-ops-governance MCP deployed as a Claude.ai connector.

**pgvector AI Context Store (I-47)**

A PostgreSQL vector database running on BCG's on-premise DGX Spark hardware. Use cases: proposal similarity search, past decision retrieval, design standard lookup for P4-002. Gated on Jason Harris.

**Grafana + Prometheus Observability Stack (P5-002 Phase 2)**

Phase 1 complete. Phase 2 builds the visualization and alerting layer. When live, Claude can query real-time infrastructure health metrics directly. Owner: Jason Harris, April 1.

**bcg-ops-governance Repository Privatization**

Will be made private once the GitHub MCP two-token Docker configuration is fully deployed and tested. Cloudflare Pages will require re-authentication under the new OAuth scope.

---

## Part 6: Architectural Improvement Opportunities

Six improvement opportunities identified through architectural analysis. All scoped to GitHub, Odoo, and Claude infrastructure components only.

### Opportunity Summary

| Opportunity | Effort | Impact | Register |
|---|---|---|---|
| 1. EAB canonical source file | Low | Very High | P0/P0-001 |
| 2. Knowledge Base Manifest | Low | High | P0-001 |
| 3. Odoo controlled vocabulary | Low–Med | Medium | P7 Odoo Studio |
| 4. GitLab MCP for pyRevit | Medium | Medium | P4-001 MCP Evaluation |
| 5. Claude output filing convention | Low | High | P0-001 Artifact Standard |
| 6a. Dashboard refresh trigger | Low | Medium | P0 Gov Registry |
| 6b. Dashboard live-query redesign | High | Very High | P0 (gated: Phase 5 + I-31) |

### 1. EAB Is a Synchronization Problem Disguised as a Document Problem

EAB propagation is misclassified as a documentation task. It is a synchronization problem. **Solution:** Create a single canonical EAB source file on GitHub. All 18 instruction files include a fetch directive pointing to it rather than embedding EAB content. Eliminates propagation entirely without waiting for Phase 5.

> Suggested register: P0/P0-001. Effort: Low. Impact: Very High — eliminates the most expensive recurring maintenance task in the ecosystem.

### 2. The Knowledge Base Layer Has No Governance Equivalent

The instruction file layer is fully governed. The knowledge base layer has no Registry entry for required files, no version tracking, and no enforced refresh cycle. **Solution:** A Knowledge Base Manifest — an extension to the Governance Doc Registry listing required knowledge base files, expected versions, and last-confirmed-upload date per project.

> Suggested register: P0-001 — extend Governance Doc Registry. Effort: Low. Impact: High.

### 3. Odoo-GitHub Boundary Has No Enforcement Mechanism

The three-system boundary is a policy declaration. No technical constraint prevents definitions duplicating into Odoo or status tracking in Claude conversations. **Solution:** Design the Odoo I-series tag field as a controlled-value field in Odoo Studio using the same status vocabulary as the Initiative Catalog: Active, Planned, Blocked, On Hold, Parked, Complete.

> Suggested register: P7 — Odoo Studio configuration. Effort: Low to medium. Impact: Medium.

### 4. pyRevit Layer Has No Bidirectional Visibility Into Claude

All pyRevit tool status is manually reported into Claude sessions. Claude cannot query GitLab for current branch status, deployed button count, or development state. **Solution:** A GitLab MCP integration for P4-001 and P4-002, extending the proven GitHub MCP pattern to the self-hosted GitLab instance at `alexandria.bcg-corp.com`.

> Suggested register: P4-001 MCP Evaluation. Effort: Medium. Impact: Medium.

### 5. No Defined Architecture for Claude Output Persistence

Valuable Claude outputs are not persisted systematically — either manually copied to OneDrive (not Claude-queryable) or lost when session context ages out. **Solution:** A structured output filing convention committing significant Claude outputs to GitHub as dated markdown files: `bcg-ops-governance/outputs/{project}/{date}_{type}.md`. Extend the Artifact Naming & Capture Standard to cover Claude-generated outputs.

> Suggested register: P0-001 — extend Artifact Naming & Capture Standard. Effort: Low. Impact: High.

### 6. The Dashboard HTML Is Architectural Dead Weight in Its Current Form

BCG_Master_Strategic_Plan.html must be manually regenerated, committed, and re-uploaded whenever the ecosystem changes. Currently out of sync: v2.19 in knowledge base, v2.24 in GitHub, 18-project actual state.

**Near-term:** Add a dashboard refresh trigger to the Governance Doc Registry. Any ecosystem state change flags the dashboard as requiring rebuild before next distribution.

**Long-term:** Redesign as a live-query artifact after Phase 5 + I-31 are operational.

> Suggested register: P0. Short-term effort: Low. Long-term: High (gated on Phase 5 + I-31).

---

## Appendix A: P0 Trigger Phrase Reference

All trigger phrases recognized by P0 (Master Strategic Plan).

> `show [keyword]` searches P0 project knowledge for a file whose name contains the keyword and presents it for immediate download. Upload all project knowledge files without version numbers in the filename (e.g., `BCG_Ecosystem_Architecture_Analysis.docx`). When a new version is built, overwrite the project knowledge file with the same name.

| Category | Trigger Phrase | What It Produces |
|---|---|---|
| Documents | `show arch doc` | Serves the current BCG_Ecosystem_Architecture_Analysis.docx from P0 project knowledge. No rebuild — instant download. |
| | `rebuild arch doc` | Rebuilds the Ecosystem Architecture Analysis at an incremented version. Ends with a reminder to upload to P0 project knowledge. |
| | `show [keyword]` | Searches P0 project knowledge for a filename containing the keyword. Examples: "show onboarding", "show task audit", "show ecosystem status". |
| Dashboard | `render / show / open / load the dashboard` | Renders BCG_Master_Strategic_Plan.html as an interactive inline artifact in the chat. |
| Agenda | `agenda for [name]` | 3-page Weekly Sync Agenda .docx for the named team member. Searches recent chats for open items. Asks "any new items?" before generating. |
| | `agenda for [name], quick` | Same as above but skips the "any new items?" question and generates immediately. |
| | `agenda for [name], as a jsx` | .docx agenda plus JSX Live Sync Companion artifact with interactive resolution fields and two export buttons. |
| Sitrep | `sitrep` | Full ecosystem sitrep across all 18 projects. Auto-fetches Initiative Catalog from GitHub, sweeps recent chats, reads project knowledge, synthesizes. Default: markdown with 🔴 blockers and 🔵 high-impact actions. |
| | `formal sitrep / sitrep for distribution` | Same as sitrep but produced as a .docx with red/blue font. |
| Assessment | `ecosystem assessment` | Full W-20 audit (Tiers 1–3). Summary scorecard with pass/fail per check and health metrics. |
| | `ecosystem assessment, quick` | Tier 1 only: registry↔folder alignment, EAB versions, counts, decision queue, next-slot verification. |
| Analysis | `do a deep dive on [subject]` | Holistic multi-angle analysis: all five executive perspectives + pressure-test + challenge me + what am I missing. |
| | `all five perspectives` | Full C-suite analysis: CEO / CTO / CFO / COO / CIO. Conflicts between perspectives called out explicitly. |
| | `pressure-test this` | 6-criteria evaluation: revenue impact, capacity impact, competitive moat, scalability, reversibility, opportunity cost. |
| | `phase this out` | 30/60/90-day or quarterly implementation timeline with sequencing and dependencies. |
| | `model this` | Financial scenario with explicit assumptions, math shown, tables for scenario comparison. |
| | `draft for the plan` | Document-ready section formatted for integration into the BCG Master Strategic Plan. |
| | `route this to P[#]` | Context handoff prompt for the named satellite project. |
| | `challenge me on this` | Pushback from the most skeptical executive lens. |
| | `what am I missing?` | Devil's advocate mode — blind spots, risks, overlooked considerations. |
| Meta | `trigger phrases / list trigger phrases` | Returns the complete trigger phrase reference in the current chat. |

---

## Appendix B: Change Summary

| Version | Date | Changes |
|---|---|---|
| v1.0 | March 2026 | Initial release. Parts 1–5: Executive Summary, Ecosystem Overview, Three-System Architecture, Current State, Future Plans, Improvement Opportunities. |
| v1.1 | March 2026 | Added: Glossary of Key Terms (13 terms). Added: Appendix — Trigger Phrase Reference (6 categories, individual tables). |
| v1.2 | March 2026 | Exec summary reordered. Glossary trimmed to 6 core terms. Hub-and-spoke diagram added. Trigger table restructured to single 3-column format. Empty pages removed. Appendix B added. Version-agnostic filename convention established. |
| v1.3 | March 2026 | H2 sections start on new page. Project Registry bold/non-bold logic. Access Control table: Project Name column added. Opportunity Summary moved before numbered items. Deep Dive trigger added. |
| v1.4 | March 2026 | Architecture decision paragraph added to Executive Summary. New Introduction section: How Claude's Project Architecture Shaped the Ecosystem. New Part 1: Why the Ecosystem Was Built This Way. Previous Parts 1–5 renumbered to Parts 2–6. Migrated to GitHub markdown (bcg-ops-governance/standards/). |

---

*BCG Corp · CONFIDENTIAL INTERNAL USE ONLY · P0 Master Strategic Plan · March 2026*
