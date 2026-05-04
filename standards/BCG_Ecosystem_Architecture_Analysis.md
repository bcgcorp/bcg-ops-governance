# BCG Ecosystem: Architecture & Strategic Analysis

**Version 1.5 · May 2026 · Prepared by P0 — Master Strategic Plan**

> BCG CORP — CONFIDENTIAL INTERNAL USE ONLY

---

## Executive Summary

The BCG Claude ecosystem was not designed generically and then adapted to Claude — it was purpose-built around the specific affordances and constraints of Claude's project platform, and shaped simultaneously by four organizational design principles: Build to Sell, Redundancy at Every Level, Process Before People, and Employee Ownership & Profit Sharing. Instruction files, knowledge bases, session isolation, context window limits, and MCP connectors each determined a structural decision. Understanding the architecture requires understanding both the platform it runs on and the firm it was built to serve.

This document provides a comprehensive reference for the ecosystem's architecture, current state, known future development plans, and unformalized improvement opportunities — scoped exclusively to the architectural components (Claude, GitHub, Odoo) rather than execution velocity or ownership assignments.

BCG Corp operates an 18-project Claude AI ecosystem purpose-built to run a 9-person physical security consulting firm at significantly above its headcount. The ecosystem is not a collection of chatbot sessions — it is a structured, governed, three-platform architecture comprising GitHub (governance), Odoo ERP (operations), and Claude (intelligence and synthesis), with a separate pyRevit/GitLab layer for production design tooling.

As of May 2026, the ecosystem tracks 65+ active initiatives (I-01 through I-77 with closures and descopes), 11 workstreams, and 154+ catalogued documents across 18 Claude projects. The Ecosystem Awareness Block is at v1.8 (2026-05-03) and re-propagation to all 17 projects is pending (the v1.8 update removed the CDN fetch URL — see Part 6, Improvement Opportunity 7). The three-system boundary rule has been formally established. The first Architectural Decision Record (ADR-001 Visualization Tooling Architecture) was approved 2026-05-02, establishing a new artifact class.

| Claude Projects | Active Initiatives | Workstreams | Gov. Documents | Health Score |
|---|---|---|---|---|
| **18** | **65+** | **11** | **15 active** (incl. ADR-001) | **TBD** |

---

## Glossary of Key Terms

Authoritative source: `BCG_Ecosystem_Vocabulary.md` on GitHub.

| Term | Definition |
|---|---|
| **Initiative (I-series)** | A discrete, measurable project with a defined deliverable tracked in the Initiative Catalog with a unique I-number. Status values: Active, Planned, Blocked, On Hold, Complete. |
| **Workstream (W-series)** | An operational procedure document — SOP, playbook, or process standard — registered with a unique W-number. |
| **ADR (ADR-series)** | Architectural Decision Record. Documents architectural decisions and their rationale. Distinct from GOV-NNN. Established 2026-05-02 with ADR-001. |
| **P-Code / Project** | A numbered Claude AI project. Each has a defined scope, a primary owner, and a 4-file configuration structure in bcg-ops-claude-projects on GitHub. Currently 18 active projects. |
| **Satellite Project** | A domain-specific Claude project (P1–P11) that produces deliverables. Approved outputs flow to P0 via structured handoff prompts. |
| **Subproject** | A scoped decomposition of a parent satellite. 6 active: P4-001, P4-002, P4-003, P5-001, P5-002, P8-001. |
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

The knowledge base has a hard ceiling that shaped BCG's architecture in an equally important way: files in the knowledge base are static. They reflect the state of the world at the time they were uploaded, not at the time of the session. This is why governance documents that change frequently — the Initiative Catalog, the EAB, the team directory — live on GitHub and are fetched via the GitHub MCP rather than uploaded to the knowledge base. The MCP fetch pattern exists precisely because Claude's knowledge base cannot provide the currency a fast-moving 18-project ecosystem requires.

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

This absence is the single most important reason GitHub became the single source of truth. GitHub provides what Claude's project architecture cannot: a version-controlled, persistently queryable, externally accessible record of everything that matters. The MCP fetch pattern turns GitHub into a form of persistent memory that Claude can access at session start — compensating precisely for the platform's lack of native persistence. The pgvector initiative (I-47) is the planned long-term supplement: a semantic memory layer that gives Claude access to the accumulated history of decisions, proposals, and outputs — the persistent memory the platform doesn't natively provide.

### The MCP Layer as Platform Extension

Claude Projects support MCP (Model Context Protocol) connectors — external data sources that can be queried at session start or during a session. This capability changed what was architecturally possible for the ecosystem. Before MCP, the only way to get current data into a Claude session was either the raw GitHub fetch (pull, manual trigger) or a human pasting content. After MCP, Claude can query live data sources — Odoo task status, GitHub repository state, Grafana infrastructure metrics — without human intermediation.

The entire I-31 initiative, the Phase 5 EAB evolution, and the observability layer are only possible because the Claude Projects platform added MCP support. The ecosystem's current architecture is, in several places, explicitly waiting for MCP infrastructure to mature. The EAB is a workaround for the absence of a live ecosystem state query. The manual Odoo-to-Claude boundary is a workaround for the absence of I-31.

### The Net Effect

Claude's project architecture — instruction files, knowledge bases, session isolation, context windows, access control, and MCP connectors — didn't just influence the BCG ecosystem design. It determined it. Every major structural choice is either:

- **Exploiting a platform affordance:** instruction files → persistent specialist identity; knowledge bases → curated reference libraries; access control → real security boundaries; MCP → live data queries.
- **Compensating for a platform constraint:** session isolation → handoff protocol; context window limits → subproject splits; static knowledge bases → GitHub MCP fetch; no persistent memory → GitHub as institutional record; no live queries (yet) → EAB as static synchronization primitive.

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

Before GOV-001, governance information was fragmented. Versions of the same document existed in Claude conversations, OneDrive folders, and team members' local copies. GitHub solves this because it is the only platform in the BCG stack that provides version control, a single authoritative URL, and the ability for Claude to fetch at runtime via the GitHub MCP rather than relying on embedded static data. OneDrive cannot be fetched by Claude at session start. A Claude conversation's knowledge base is a file upload, not a live query. GitHub via the MCP API is the only mechanism that gives every Claude project access to the same current data at the moment a session begins.

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

The 18 Claude projects are organized as a deliberate hub-and-spoke topology. P0 (Master Strategic Plan) is the integration hub. P0-001 was retired 2026-04-19 — its triage function is now absorbed directly into P0 via the protocol-harness pattern (W-20 v1.2). P0 does not produce primary deliverables; it consumes and governs.

```
              [ Business & BD ]
              P1 · P3 · P8 · P8-001
                      ↕
[ Operations & People ]   [ P0: Master Strategic Plan ]   [ Technology & AI ]
P2 · P6 · P9 · P10 · P11  Integration Hub + Triage         P4 · P4-001 · P4-002
                      ↕   (W-20 protocol-harness)          P4-003 · P5 · P5-001
              [ ERP Platform ]                             P5-002
              P7 · Odoo 18
```

Flow is one-directional: satellite → P0. P0 reflects the last approved handoff, not real-time satellite state.

### Project Registry — All 18 Projects

| P-Code | Project Name | Owner | Type |
|---|---|---|---|
| **P0** | **Master Strategic Plan** | Gregory Bernardo | Hub (P0-001 absorbed 2026-04-19) |
| **P1** | **Financial Modeling & Pricing** | Gregory Bernardo | Satellite |
| **P2** | **SOP & Workflow Library** | Jennifer Brezniak | Satellite |
| **P3** | **Competitive Intel & BD** | Gregory Bernardo | Satellite |
| **P4** | **AI Infrastructure & Deployment** | Jason Harris | Satellite |
| P4-001 | MCP Evaluation & Selection | Gregory / Jason | Subproject |
| P4-002 | Revit & BIM Automation | Gregory Bernardo | Subproject |
| P4-003 | BCG EasyButton / Idea Capture | Gregory Bernardo | Subproject |
| **P5** | **IT Security / QOS** | Bob Brezniak | Satellite |
| P5-001 | Network Infrastructure Assessment | Bob Brezniak | Subproject |
| P5-002 | Monitoring & Observability | Bob / Jason | Subproject |
| **P6** | **HR & People** | Jennifer Brezniak | Satellite |
| **P7** | **Odoo Platform & ERP** | Victor Carrillo | Satellite |
| **P8** | **Proposals & RFP Operations** | Gregory Bernardo | Satellite |
| P8-001 | Document Intake & Routing | Rachel McGee | Subproject |
| **P9** | **Business Continuity & Resilience** | Gregory Bernardo | Satellite |
| **P10** | **Legal, Compliance & Risk** | Gregory Bernardo | Satellite (Gregory-only) |
| **P11** | **Candidate OSINT & Pre-Hire Intel** | Gregory + Jennifer | Satellite (RESTRICTED) |

> Bold rows = hub or primary satellite. P10 split from P6 on 2026-03-15. P11 activated 2026-03-17. P7-001–P7-004 retired 2026-03-12. P0-001 retired 2026-04-19.

---

## Part 3: The Three-System Architecture

The BCG ecosystem rests on three distinct platforms, each with a formally defined role established under GOV-001 (approved 2026-03-11) and the System Boundary Definition (2026-03-20).

| Platform | Owns | Architectural Role |
|---|---|---|
| **GitHub** | Initiative definitions (I-series), workstream governance (W-series), ADRs (ADR-series), style standards, vocabulary, all Claude-fetchable operational documents | Authoritative record layer. Single source of truth. GOV-001 prohibits treating OneDrive as authoritative. |
| **Odoo ERP** | Task status, assignment, due dates, completion records, CRM pipeline, project financial data | Operational record layer. Three-environment topology: R2-D2 (prod), C-3PO (dev), BB-8 (staging). |
| **Claude** | Synthesis, decision support, sitrep generation, agenda production, strategic analysis, code specification | Intelligence and synthesis layer. Reads from GitHub and Odoo via MCP. Stores no authoritative records itself. |

### Layer 1 — GitHub: The Governance Layer

**Repository Structure**

| Repository | Visibility | Function |
|---|---|---|
| **bcg-ops-governance** | Public* | Runtime source of truth. All Claude-fetchable operational documents. |
| **bcg-ops-claude-projects** | Private | Version control for Claude project configuration. 4-file structure per project. Not a runtime data source. |
| **bcg-ops-revit-tools** | (GitLab) | Migrated to self-hosted GitLab at `alexandria.bcg-corp.com`. |

> *bcg-ops-governance is currently public. Privatization planned post-MCP deployment.

**The GitHub MCP Fetch Pattern**

Governance documents are fetched at session start via the GitHub MCP tool, not via CDN URLs:

```
Tool: github-write:get_file_contents
Parameters:
  owner: bcgcorp
  repo: bcg-ops-governance
  path: standards/{filename}
```

This is the no-cache, direct API path. Per ADR-001 (APPROVED 2026-05-02) and the 2026-03-22 post-mortem, `web_fetch` against `raw.githubusercontent.com` URLs is prohibited — the CDN serves stale content silently with no error signal. The GitHub MCP is the only authorized fetch mechanism. `git clone` via bash is also acceptable in code-execution environments.

**The Ecosystem Awareness Block (EAB)**

The EAB is a standardized context block embedded in every one of the 18 project instruction files. It provides each Claude instance with: total project count, full P-code list, next available I/W numbers, and GitHub MCP fetch directives. Architecturally, the EAB is a static snapshot — not a live query. Current version: v1.8 (2026-05-03 — removed CDN URL, replaced with github-write MCP directive). Re-propagation pending.

> **Architectural note:** The EAB is the most architecturally fragile component in the ecosystem. It functions, but does not scale. The planned Phase 5 evolution replaces it with a live MCP query. An intermediate solution using a canonical source file is identified in Part 6.

**The Two-Step Fetch Protocol**

1. Fetch the Registry to learn what documents exist and which are relevant to the current task.
2. Fetch only the relevant documents using `github-write:get_file_contents` with the correct path.

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

The boundary is currently one-directional and manual. Claude produces outputs that humans enter into Odoo; Odoo data enters Claude only through manual paste. The Odoo Task Audit Framework is ready to verify catalog alignment — currently blocked on a catalog version reconciliation.

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
| **P11** | **Candidate OSINT & Pre-Hire Intel** | **Gregory + Jennifer — RESTRICTED** | CIRs route to P10 (legal custody) and P6 (go/no-go). Does NOT route to P0. Candidate PII never stored in any Claude knowledge base. |

### Layer 4 — pyRevit / GitLab: The Production Tools Layer

| Component | Details |
|---|---|
| Source Control | Self-hosted GitLab at `alexandria.bcg-corp.com` — Repo: `bcg-ops-revit-tools` |
| Deploy Target | `Q:\Pearl_Prod\z_pyRevit` — manual deployment via `deploy.ps1` |
| Current Scale | 47-button backlog (B-01–B-47) across 10 panels |
| Build Tool | Windsurf IDE / Cascade AI — specifications authored in P4-001 and P4-002 |
| Storage Architecture | AppSettings_01 opaque schema with SCHEMA_GUIDS.md registry — prevents parallel-session Revit ExtensibleStorage GUID collisions |
| Claude Interface | P4-001 and P4-002 plan and specify tools. No live query from Claude to GitLab — tool status manually reported into sessions. |

---

## Part 4: Active Architectural Decision Records (ADRs)

ADRs document architectural decisions and their rationale. Established as a distinct artifact class 2026-05-02 with ADR-001. Indexed in the Governance Doc Registry Section 6.

| ID | Title | Status | Approved | Owner |
|---|---|---|---|---|
| ADR-001 | Visualization Tooling Architecture | APPROVED | 2026-05-02 | P4 |

ADR-001 establishes a four-tool visualization stack used across all ecosystem projects: built-in Visualizer (chat), Mermaid Chart MCP (governance docs), PowerPoint SmartArt (presentations), draw.io (backup for complex diagrams that exceed Mermaid). All other visualization tools explicitly rejected. Includes BCP risk assessment with acceptable failure modes documented for P9 risk register integration.

---

## Part 5: Known Future Plans

### Near-Term Architectural Events

| Horizon | Event / Initiative | Architectural Impact |
|---|---|---|
| **Q2 2026** | EAB v1.8 re-propagation across 17 projects | Removes CDN URL from all project custom instructions. Closes 2026-05-03 audit finding. ~45-90 minutes manual work. |
| | GitHub write-mode PAT review (Apr 12) | Determines whether automated governance doc commits are permitted. Gates write-PAT deployment. |
| **Q3 2026** | I-71 — On-Premise AI / Revit Live Model Integration | Local MCP server connecting DGX Spark to client Revit models. Re-scope around `mcp-server-for-revit-python` registered extension (per P4-002 pyRevit deep-dive 2026-05-01). |

### Medium-Term Architecture Evolution

**I-31: Cross-Project Sync MCP Server** — BCG's planned architecture for closing the Odoo-Claude integration gap. When live, P0 sitreps can query both GitHub (governance state) and Odoo (operational state) without human data entry. Owner: Jason Harris.

**Phase 5: EAB → Dynamic MCP Query** — The static EAB embedded in all 18 instruction files will be replaced by a live MCP query at session start. Eliminates propagation entirely.

**pgvector AI Context Store (I-47)** — PostgreSQL vector database on DGX Spark. Use cases: proposal similarity search, past decision retrieval. Gated on Jason Harris.

**bcg-ops-governance Repository Privatization** — Will be made private once GitHub MCP two-token Docker config is fully deployed.

---

## Part 6: Architectural Improvement Opportunities

### Opportunity Summary

| Opportunity | Effort | Impact | Register |
|---|---|---|---|
| 1. EAB canonical source file | Low | Very High | P0 |
| 2. Knowledge Base Manifest | Low | High | P0 |
| 3. Odoo controlled vocabulary | Low–Med | Medium | P7 Odoo Studio |
| 4. GitLab MCP for pyRevit | Medium | Medium | P4-001 MCP Evaluation |
| 5. Claude output filing convention | Low | High | P0 Artifact Standard |
| 6a. Dashboard refresh trigger | Low | Medium | P0 Gov Registry |
| 6b. Dashboard live-query redesign | High | Very High | P0 (gated: Phase 5 + I-31) |
| **7. Stored-rule enforcement structural fix** | **Medium** | **Very High** | **P0 (under triage 2026-05-03)** |

### 1. EAB Is a Synchronization Problem Disguised as a Document Problem

EAB propagation is misclassified as a documentation task. It is a synchronization problem. **Solution:** Create a single canonical EAB source file on GitHub. All 18 instruction files include a fetch directive pointing to it rather than embedding EAB content. Eliminates propagation entirely without waiting for Phase 5.

### 2. The Knowledge Base Layer Has No Governance Equivalent

The instruction file layer is fully governed. The knowledge base layer has no Registry entry for required files, no version tracking, and no enforced refresh cycle. **Solution:** A Knowledge Base Manifest extending the Governance Doc Registry.

### 3. Odoo-GitHub Boundary Has No Enforcement Mechanism

The three-system boundary is a policy declaration. No technical constraint prevents definitions duplicating into Odoo or status tracking in Claude conversations. **Solution:** Design the Odoo I-series tag field as a controlled-value field in Odoo Studio.

### 4. pyRevit Layer Has No Bidirectional Visibility Into Claude

All pyRevit tool status is manually reported into Claude sessions. **Solution:** A GitLab MCP integration extending the proven GitHub MCP pattern to `alexandria.bcg-corp.com`.

### 5. No Defined Architecture for Claude Output Persistence

Valuable Claude outputs are not persisted systematically. **Solution:** A structured output filing convention committing significant Claude outputs to GitHub.

### 6. Dashboard HTML Is Architectural Dead Weight

Manually regenerated and re-uploaded. **Near-term:** Dashboard refresh trigger in Governance Doc Registry. **Long-term:** Redesign as live-query artifact after Phase 5 + I-31 are operational.

### 7. Stored-Rule Enforcement Is Behavioral, Not Structural

**New 2026-05-03.** Claude has repeatedly violated the CDN-fetch rule despite multiple stored memory edits, a 2026-03-22 post-mortem, and verbal reinforcement across at least a dozen sessions. The pattern is structural: action selection runs ahead of rule retrieval; URL pattern matching is shallow; memory read is not memory used; plausible-shortcut bias favors `web_fetch` over the correct tool; no structural penalty for the wrong choice. **Solution:** Five-fix structural stack — (1) Edit project system prompts to remove CDN URLs, (2) Edit committed governance files referencing CDN URLs, (3) Pre-action verbalization protocol in memory, (4) Anthropic product feedback for per-project tool denylists, (5) P9 BCP risk register entry. Currently under P0 triage per 2026-05-03 P0 handoff prompt. Opportunity registers as candidate ADR-002 or initiative.

> Suggested register: P0 (under triage). Effort: Medium. Impact: Very High — closes a multi-occurrence reliability failure with documented post-mortem precedent.

---

## Appendix A: P0 Trigger Phrase Reference

All trigger phrases recognized by P0 (Master Strategic Plan). [Full table preserved from v1.4; abbreviated here for space.]

> See full version in v1.4. Trigger categories: Documents, Dashboard, Agenda, Sitrep, Assessment, Analysis, Meta.

---

## Appendix B: Change Summary

| Version | Date | Changes |
|---|---|---|
| v1.5 | 2026-05-03 | Removed `raw.githubusercontent.com` URL pattern template (was on line 233 of v1.4 in the "Raw Fetch Pattern" subsection). Replaced with explicit `github-write:get_file_contents` MCP tool directive. Added prohibition on `web_fetch` against CDN URLs with ADR-001 and 2026-03-22 post-mortem references. New Part 4 (Active Architectural Decision Records) — ADR-001 indexed. New Improvement Opportunity 7 (Stored-Rule Enforcement Structural Fix). Updated EAB version reference v1.5 → v1.8. Subproject list updated (P0-001 retired, P4-003 added). Initiative count updated to 65+ (I-01–I-77 with closures). Health score marked TBD pending re-baseline. Cross-references updated throughout. |
| v1.4 | March 2026 | Architecture decision paragraph added to Executive Summary. New Introduction section. New Part 1. Migrated to GitHub markdown. |
| v1.3 | March 2026 | H2 sections start on new page. Project Registry bold/non-bold logic. Access Control table column added. |
| v1.2 | March 2026 | Exec summary reordered. Glossary trimmed. Hub-and-spoke diagram added. Trigger table restructured. |
| v1.1 | March 2026 | Glossary added. Appendix added. |
| v1.0 | March 2026 | Initial release. |

---

*BCG Corp · CONFIDENTIAL INTERNAL USE ONLY · P0 Master Strategic Plan · May 2026*
