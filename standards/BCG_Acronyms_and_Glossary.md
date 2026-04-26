---
DOCUMENT ID:    BCG-GLOS-001
TITLE:          BCG Acronyms and Glossary
VERSION:        v0.1
STATUS:         [DRAFT — SEED VALUES — PENDING POPULATION]
OWNER:          Gregory Bernardo
CONTRIBUTORS:   <open>
SCOPE:          BCG-wide. Referenced by P4 RAG retrieval (acronym expansion),
                P0 governance workflows, and any deliverable that touches
                AEC/data-center/physical-security terminology.
DEPENDENCIES:   None (this is a foundational standards document)
LAST UPDATED:   2026-04-26
---

# BCG Acronyms and Glossary

**BCG-GLOS-001 v0.1 — DRAFT**

---

## 1. Purpose

This document is BCG's controlled-vocabulary reference for acronyms and terms
that appear across BCG's delivery work, governance documents, and the corpus
ingested into BCG's RAG infrastructure. It serves three audiences:

1. **BCG personnel** — terminology onboarding for new team members and a
   look-up reference during deliverable production.
2. **The RAG retrieval pipeline (P4)** — referenced by the system prompt for
   acronym expansion at query time. Future embedding fine-tuning (Phase 1
   Unsloth, Q3 2026) will further internalize this vocabulary into the
   embedding model.
3. **External readers of BCG deliverables** — supplementary reference when
   technical documents reference jargon that is not self-explanatory.

This is a living document. Add to it when you encounter a new acronym in BCG
work product or in client corpus content.

---

## 2. Scope

### 2.1 In scope

- **Client BOD (AWS / data center) terminology** — terms that appear in the
  AWS BOD documents, release notes, drawings, and specifications BCG ingests
  for I-65 / I-47 work.
- **Physical security industry terminology** — standards, equipment, design
  patterns common in BCG's primary practice area.
- **AEC (Architecture / Engineering / Construction) terminology** — design
  document conventions, deliverable phasing, contract roles.
- **BCG-internal terminology** — governance, infrastructure, project
  management terms specific to BCG operations.
- **Standards and frameworks** — referenced industry standards by acronym.

### 2.2 Out of scope

- General-purpose IT acronyms (HTTP, JSON, CSV, etc.) — assumed knowledge.
- Vendor-product names that are not part of design vocabulary (e.g.,
  specific software product names handled in the Custom Module Registry
  and Infrastructure Inventory).
- Definitions that already exist in the AWS-issued `0031.MULTI Glossary of
  Terms & Acronyms` document. That document is **authoritative for AWS
  terms** when ingested into the RAG corpus. This file mirrors only the
  high-value subset needed for BCG-side reference. When the AWS glossary
  conflicts with this file, the AWS document wins for AWS-internal terms.

---

## 3. How to Extend

To add a new term:

1. Identify the correct category (Section 5).
2. Add a row to that category's table. Maintain alphabetical order within
   the category.
3. Fill all four columns: **Term**, **Expansion**, **Definition**,
   **Source**. If unable to fill all four, mark unknowns as `<TBD>` and
   note in the changelog (Section 8) so a follow-up pass can fill them.
4. Update the changelog with a short note.
5. Open a PR against `bcg-ops-governance/standards/`. Greg approves and
   merges.

If a term appears in multiple categories (e.g., `BOD` is both AEC-general
and BCG-internal), put it in the most-specific category and cross-reference
from the others.

---

## 4. Conventions

- **Capitalization** matches how the term appears in source documents
  (e.g., `OPTDC` not `Optdc`).
- **Plurals** are not separately listed (`DAHU` covers both `DAHU` and
  `DAHUs`).
- **Trade names** (e.g., `VESDA`) are listed when they appear as common
  shorthand in technical documents, with their generic equivalents
  noted (e.g., `VESDA` ⇒ `ASSD`).
- **Status notes** are included in the Definition column when a term is
  legacy/superseded, e.g., `(legacy — replaced by ASSD per BOD-1952)`.

---

## 5. Glossary

### 5.1 AWS BOD — Reference Design (Data Center)

| Term | Expansion | Definition | Source |
|------|-----------|------------|--------|
| ACS | Amazon Controls System | Amazon's data center automation/controls platform; integrates BMS and EPMS layers. | AWS BOD |
| AMCOP | Amazon Maintenance Console / Operations Panel | Amazon's facilities-side operations panel. Mk2 introduced in OPTDC v2.3 (BOD-1824); Mk3 referenced in TDC release notes. | AWS BOD |
| AMLOC | Amazon Low Voltage Control Power | Low-voltage control power architecture (with KILLCUPS). Phase 2 introduced in OPTDC v2.4 (BOD-2146). | AWS BOD |
| AOBR | Area of Best Refuge | Designated shelter-in-place area within a data center building. | AWS BOD |
| ASSD | Air Sampling Smoke Detection | Networked aspirating smoke detection. Replaced VESDA/VEWFD/VEWSD per BOD-1952. | AWS BOD |
| BBU | Battery Backup Unit | Rack-level battery backup. WMW and RP families referenced. | AWS BOD |
| BCPM | Branch Circuit Power Monitoring | Removed from HUPP and CUPP panels per BOD-2030 (OPTDC v2.3). | AWS BOD |
| BOD | Basis of Design | AWS's reference design package (drawings + specifications + Owner's Requirements) for a given DC type and revision. | AWS BOD / AEC general |
| BTS | Build To Suit | Build-to-suit project type variant within OPTDC. | AWS BOD |
| CICO | Clean In / Clean Out | Security checkpoint pattern at red-zone entry. | AWS BOD / Physical Security |
| CSB / ACB | Customer Service Building / Access Control Building | Gate Visitor Center components. | AWS BOD / Physical Security |
| CSH | Common Supply Header | Mechanical supply distribution component above data hall. | AWS BOD |
| CUPS / CUPP | Critical UPS / Critical UPS Panel | Critical-load UPS infrastructure. | AWS BOD |
| DAHU | Data Hall Air Handling Unit | Primary cooling delivery unit for data halls. | AWS BOD |
| DCDE | Data Center Design Engineering | AWS's in-house design engineering team. | AWS BOD |
| DCEO | Data Center Engineering Operations | AWS's operations team responsible for live data centers. | AWS BOD |
| DLB | Dynamic Load Balancing | Catcher redundancy product. Mk2 introduced in OPTDC v2.3 (BOD-1825); Mk3 referenced in TDC release notes (BOD-3003). | AWS BOD |
| EFBC | Exhaust Fan Bank Controller | Removed from Evap Cooling designs in OPTDC v2.3 (BOD-1712). | AWS BOD |
| EPMS | Electronic Power Monitoring System | Power monitoring layer. EPMS Enclosure removed from leased/owned DCs per BOD-2023. | AWS BOD |
| ER | Electrical Room | Interior building space housing power distribution. | AWS BOD / AEC general |
| FALCON | Facilities Automated Load CONtrol | Load-control system, integral to AMCOP Mk2. | AWS BOD |
| FCU | Fan Coil Unit | In-row liquid cooling component. | AWS BOD |
| FER / FRR | Fiber Entry Room / Fiber Riser Room | Telco infrastructure rooms. | AWS BOD |
| GFIP | Generator Fuel Interface Panel | Moved from gen-vendor to OFCI scope per BOD-2383 (OPTDC v2.4). | AWS BOD |
| GREF | Global Real Estate & Facilities | AWS facilities standards organization. | AWS BOD |
| HAC | Hot Aisle Containment | Data-hall hot-aisle architecture. | AWS BOD |
| HSSB | House Service Sub Board | House power distribution component. | AWS BOD |
| HUPS / HUPP | House UPS / House UPS Panel | House-load UPS infrastructure. Capacity increased to 150 kW/kVA in OPTDC v2.4 (BOD-2476). | AWS BOD |
| HVSUB | High-Voltage Substation | BOD type for substation infrastructure (project_type INFRASTRUCTURE/UTILITIES). | AWS BOD |
| IRHX | In-Row Heat Exchanger | Liquid cooling heat exchange unit. Introduced in OPTDC v2.4 (BOD-2448). | AWS BOD |
| IRHC | In-Row Heat Cooling | Mechanical 2D piping element associated with IRHX/data hall racking. | AWS BOD |
| IW / IWW | Industrial Water / Industrial Wastewater | Cooling-tower and process water systems. | AWS BOD |
| KILLCUPS | Kill Critical UPS | Phase 1 / Phase 2 control-power simplification effort. | AWS BOD |
| LC / L2A / L2L | Liquid Cooling / Liquid-to-Air / Liquid-to-Liquid | Liquid cooling configurations. Introduced into OPTDC at v2.4. | AWS BOD |
| LOOM | Lights-Off Operation Mode | Unmanned site monitoring concept (BOD-1249). | AWS BOD |
| MARS | <TBD — racking system full expansion> | Alternative racking system, introduced in OPTDC v2.3 (BOD-1281). 6" posts in mid-seismic regions per v2.4a. | AWS BOD |
| MaxCool / MxC | Maximum Cooling | Cooling event configuration. | AWS BOD |
| MaxChill | Maximum Chill | Cooling event configuration for sites without OA Free Cooling. | AWS BOD |
| MDF | Main Distribution Frame | Telecom main distribution. | AWS BOD / Telecom |
| MMR | Meet-Me Room | Telecommunications interconnection space. | AWS BOD / Telecom |
| MSDB | Main Switch Distribution Board | Low-voltage main distribution. PM+ removal per BOD-2036. | AWS BOD |
| OPTDC | Optimized Data Center | Primary AWS DC reference design family. Variants OPT1Si/OPT2Si/OPT3Si (AMER) and OPT2Sm/OPTMSm (EMEA+APAC). | AWS BOD |
| OR | Owner's Requirements | Section of the BOD that defines AWS's design intent and criteria, distinct from the template drawings and specifications. | AWS BOD / AEC general |
| ORSD | Overhead Row Supply Damper | Removed from EMEA/APAC OPTDC templates per BOD-2126. | AWS BOD |
| PERU | Pre-Engineered Roof Unit | Roof equipment unit. | AWS BOD |
| PNTDC | <TBD — Greg to confirm full name> | DC type co-applicable in 24H1 spec release notes alongside OPTDC and HVSUB. | AWS BOD |
| PU | Pumping Unit | IRHX pumping unit (liquid cooling). | AWS BOD |
| REFA | <TBD — Roof Exhaust Fan variant> | Data hall exhaust fan unit. EAT high-end raised to 112°F in OPTDC v2.4. | AWS BOD |
| SCR | Selective Catalytic Reduction | Generator emissions reduction system; uses urea distribution. | AWS BOD |
| SER / RIO | Sequence Event Recorder / Remote IO | RIO replaced SER per BOD-2031 (OPTDC v2.3). | AWS BOD |
| SFN | Secondary Fluid Network | Liquid cooling secondary loop. | AWS BOD |
| SUPDRW / Folder 99 | Supplemental Drawings | Supplemental drawings folder; carries above-template guidance like SCR-Ready, Sunroom, IWW Reuse, Temporary Power. | AWS BOD |
| TDC | <TBD — Greg to confirm full name> | DC type. Distinct family from OPTDC. REL_1_1 corpus visibility. | AWS BOD |
| Tetris | Tetris LV Switchboard | UL low-voltage switchboard option in AMER 2S OPTDC (BOD-2150). | AWS BOD |
| TITUS | <TBD — origin / scope> | BOD type seeded in registry; not yet visible in current corpus. | BCG internal |
| VESDA | (Trade name — air sampling smoke detection) | Legacy — replaced by ASSD per BOD-1952. | AWS BOD |
| VEWFD / VEWSD | Very Early Warning Fire / Smoke Detection | Legacy — replaced by ASSD per BOD-1952. | AWS BOD |
| WDC | Water Distribution Cabinet | IRHX water distribution component. | AWS BOD |

### 5.2 Physical Security

| Term | Expansion | Definition | Source |
|------|-----------|------------|--------|
| ASTM F883 | (Standard) | ASTM standard for portable security padlocks. Grade 5 referenced in AWS PSDS. | Industry standard |
| CCTV | Closed Circuit Television | Surveillance camera system. | Industry standard |
| FEBR | Forced Entry Ballistic Resistant | Door/window rating standard. Removed from Main Entry Door per BOD-2426. | Industry / AWS BOD |
| IDS | Intrusion Detection System | Perimeter/interior intrusion detection. | Industry standard |
| K4 / K12 | (Vehicle barrier crash ratings) | DOS / ASTM F2656 vehicle barrier impact ratings. K4 references removed in OPTDC v2.3 (BOD-2340). | Industry standard |
| NFPA 704 | (Standard) | Hazard signage standard. Type T/U signage corrected in OPTDC v2.4 (BOD-2365). | Industry standard |
| PIDS | Perimeter Intrusion Detection System | Fence-mounted or volumetric perimeter detection. | Industry standard |
| PSDS | Physical Security Design Standard | Generic term for client-side physical security design standards (e.g., AWS PSDS). | Industry / Client |

### 5.3 AEC — Architecture / Engineering / Construction

| Term | Expansion | Definition | Source |
|------|-----------|------------|--------|
| AHJ | Authority Having Jurisdiction | Local code/permitting authority. | AEC general |
| AOR | Architect of Record | Licensed architect responsible for the project's architectural design. | AEC general |
| BIM | Building Information Modeling | 3D model-based design and coordination workflow. | AEC general |
| BEP | BIM Execution Plan | Project-level plan for BIM coordination. | AEC general |
| CDE | Common Data Environment | Centralized BIM/document repository. | AEC / ISO 19650 |
| CFCI | Contractor Furnished Contractor Installed | Scope assignment for materials/equipment. | AEC general |
| CD / DD / SD | Construction Documents / Design Development / Schematic Design | Phase markers for document revisions (e.g., 100CD, 50DD). | AEC general |
| Div XX | Division XX | MasterFormat division grouping (e.g., Div 26 = Electrical, Div 27 = Communications, Div 28 = Electronic Safety & Security). | CSI MasterFormat |
| EIR | Exchange Information Requirements | BIM information requirements per ISO 19650. | ISO 19650 |
| IBC | International Building Code | Model building code. | Industry standard |
| IECC | International Energy Conservation Code | Model energy code. | Industry standard |
| IFC | Issued For Construction | Document revision marker indicating the set is released for construction. | AEC general |
| IFP | Issued For Permit | Document revision marker indicating the set is released for permitting. | AEC general |
| ISO 19650 | (Standard) | International standard for BIM information management. AWS adopted for global drawing numbering per BOD-2170. | Industry standard |
| MasterFormat | (CSI numbering system) | Construction Specifications Institute spec section numbering (6-digit and 16-digit forms). | CSI |
| MEP | Mechanical / Electrical / Plumbing | Engineering trades grouping. | AEC general |
| NEC | National Electrical Code | NFPA 70. | Industry standard |
| NFPA | National Fire Protection Association | Fire and life safety standards body. | Industry standard |
| OFCI | Owner Furnished Contractor Installed | Scope assignment for materials/equipment. | AEC general |
| OIR | Organization Information Requirements | Organization-level BIM requirements per ISO 19650. Added as appendix to 0041.MULTI EIR per BOD-1996. | ISO 19650 |
| PFHO | Practical Final Hand-Over | Construction-stage milestone in BIM model handover. | AEC general |
| RFI | Request for Information | Formal information request from contractor to design team. | AEC general |
| SEOR | Structural Engineer of Record | Licensed structural engineer responsible for the project's structural design. | AEC general |
| SIM | Service Improvement Management (AWS-internal ticket type) | AWS internal ticket system for BOD changes. Each release note entry references its triggering SIM (e.g., BOD-2290). | AWS-internal |
| Submittal | (AEC document type) | Contractor submission of product data, shop drawings, samples, etc. for design team review. | AEC general |

### 5.4 BCG-Internal

| Term | Expansion | Definition | Source |
|------|-----------|------------|--------|
| AgentGateway | (AI platform component) | Single-ingress gateway routing all AI client traffic to inference backends. Approved for BCG AI Platform; multi-replica HA. No client speaks to vLLM directly. See `BCG_AI_Platform_Architecture.docx`. | BCG / P4 |
| ASR | Attack Surface Reduction | Microsoft Defender for Endpoint feature; coordinated with MCP server allow-listing. | Microsoft / BCG infra |
| BCG | Bernardo Consulting Group | BCG Corp. (corporate identity). | BCG |
| BCP | Business Continuity Plan | BCG operational continuity documentation. | BCG |
| BGE-M3 | (Embedding model) | BAAI's open multilingual embedding model. Selected for the BCG AI Platform on gpu01 alongside BGE-reranker. Replaces prior Qwen3-Embedding-0.6B. | Open source / BCG |
| CIP | Client Intelligence Profile | BCG's client-level reference document; lives at `_CLIENT_LEVEL` tier in the RAG corpus. | BCG / P4 |
| CIS Controls | Center for Internet Security Critical Security Controls | One of two security frameworks BCG operates under (with NIST CSF). | Industry standard |
| DDL | Design Doctrine Library | BCG's internal design doctrine; lives at `_INTERNAL` tier in the RAG corpus. | BCG / P4 |
| EAB | Ecosystem Awareness Block | Embedded governance block in Claude project instructions providing cross-project routing. | BCG governance |
| MCP | Model Context Protocol | Anthropic's protocol for connecting LLM clients to tool servers. | Anthropic / BCG infra |
| NIST CSF | NIST Cybersecurity Framework | Primary security framework BCG operates under. | NIST |
| P0–P11 | (BCG project codes) | BCG-internal project structure. P0 = Ecosystem; P4 = AI Infrastructure; etc. See `BCG_Project_Ecosystem_and_Handoffs.md` for the full registry. | BCG governance |
| pgvector | (PostgreSQL extension) | PostgreSQL extension for vector similarity search. Recommended for the AI Context Store in the March 2026 ecosystem report; **superseded by Qdrant** per BCG AI Platform Target Architecture. | Open source / BCG (legacy) |
| Qdrant | (Vector database) | Vector database selected for the BCG AI Platform RAG corpus. Helm-deployed, single replica, snapshot CronJob. Two collections: `cad-corpus` (curated) and `user-uploads` (writable). | Open source / BCG |
| RAG | Retrieval-Augmented Generation | Pattern of grounding LLM responses in retrieved corpus content; central to I-65 / I-47. | Industry / BCG |
| SOP | Standard Operating Procedure | BCG-internal procedural document; lives at `_INTERNAL` tier. | BCG governance |
| Tier 1–4 | (BCG data classification) | BCG's four-tier data classification. Tier 1–2 = client data, on-prem only. Tier 3–4 = BCG-internal / public. | BCG governance |
| vLLM | (LLM inference engine) | Open-source high-throughput LLM inference engine. Selected for the BCG AI Platform across DGX Sparks (chat) and RTX 5090s (agents, vision). Replaces prior llama.cpp/Ollama runtime. | Open source / BCG |

### 5.5 Standards & Frameworks

Already covered inline in 5.2, 5.3, and 5.4. Cross-references:

- ASTM F883 → 5.2
- ISO 19650 → 5.3
- MasterFormat → 5.3
- NFPA 70 (NEC), NFPA 704 → 5.2 / 5.3
- NIST CSF, CIS Controls → 5.4

---

## 6. Cross-Reference to Authoritative Glossaries

| Source | Coverage | Authority |
|--------|----------|-----------|
| `0031.MULTI Glossary of Terms & Acronyms` (AWS BOD) | AWS-internal data center terminology | Authoritative for AWS terms; this file mirrors high-value subset only |
| `BCG_Project_Ecosystem_and_Handoffs.md` | BCG project codes (P0–P11+) | Authoritative for BCG project structure |
| `BCG_Infrastructure_Inventory.txt` | BCG infrastructure components | Authoritative for BCG infrastructure |
| `BCG_Custom_Module_Registry.txt` | BCG custom Odoo modules | Authoritative for module list |
| `BCG_AI_Platform_Architecture.docx` | BCG AI Platform target architecture | Authoritative for inference + RAG architecture |

---

## 7. Open Items

| ID | Item |
|----|------|
| GL-1 | Confirm full names for `PNTDC`, `TDC` (currently `<TBD>` in 5.1). |
| GL-2 | Confirm full expansion of `MARS` racking system (currently `<TBD>`). |
| GL-3 | Confirm origin and current revision of `TITUS` BOD type (seeded in registry; not in current corpus). |
| GL-4 | RESOLVED 2026-04-26 — registered in `BCG_Governance_Doc_Registry.md` v1.2 Section 3.8. |
| GL-5 | Decide whether this glossary is itself ingestable into the RAG corpus. Recommended: yes, as `document_type: DDL` with `project_code: _INTERNAL`. Defer to schema v0.3 lock. |

---

## 8. Changelog

| Version | Date | Change |
|---------|------|--------|
| v0.1 | 2026-04-26 | Seed version. Categories 5.1 (AWS BOD), 5.2 (Physical Security), 5.3 (AEC), 5.4 (BCG-internal) populated from P4 RAG corpus validation samples and EAB context. ~90 terms total. AI platform architecture terms (AgentGateway, BGE-M3, Qdrant, vLLM) included; pgvector marked as superseded recommendation. Open items GL-1, GL-2, GL-3, GL-5 logged; GL-4 resolved on commit. |

---

**END OF GLOSSARY BCG-GLOS-001 v0.1 DRAFT**

Routing: This is a living document. Update in place when terminology
encounters a gap or correction.
