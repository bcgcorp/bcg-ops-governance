# BCG Corp — Infrastructure Inventory

**Version:** 1.0
**Effective:** March 2026
**Last Updated:** 2026-03-01
**Scope:** All Claude Projects (P0–P7) and subprojects
**Owner:** Gregory Bernardo, President

---

## 1. Purpose

This document is the single source of truth for BCG Corp's technology infrastructure: compute, networking, storage, software platforms, AI tools, and security controls. Every Claude Project references this document (via OneDrive) so that evaluations, deployment plans, and security assessments use current infrastructure data rather than stale snapshots embedded in individual project instructions.

Update this file when: hardware is added or decommissioned, software versions change, new platforms are adopted, or monitoring/security tooling status changes.

---

## 2. Compute — VM Hosts

Hypervisor hosts running BCG's virtualized server infrastructure.

| Hostname | Hardware | Role | Notes |
|----------|----------|------|-------|
| Batman | HP | VM host | — |
| Superman | HP | VM host | — |
| Wolverine | HP | VM host | — |
| Punisher | HP | VM host | — |
| GhostRider | HP | VM host | — |
| Lenovo ST50 | Lenovo | VM host | — |

**Total:** 6 hosts (5x HP, 1x Lenovo)

---

## 3. Compute — AI Infrastructure

Dedicated hardware for on-premises AI model serving and development.

| Asset | Type | Quantity | Role | Notes |
|-------|------|----------|------|-------|
| NVIDIA DGX Spark | AI compute appliance | 2 | On-prem model inference and training | Key metrics: GPU utilization, memory, temperature, power draw, PCIe throughput. Monitor via DCGM + dcgm-exporter → Prometheus (planned). |
| RTX 5090 Workstation | GPU workstation | 2 | AI development, model fine-tuning | Same GPU monitoring path as DGX Spark. |

---

## 4. Servers

| Role | OS | Count | Notes |
|------|----|-------|-------|
| Domain Controllers | Windows Server 2022 | 2+ | Active Directory |
| Member Servers | Windows Server 2022 | Multiple | Various roles |
| Odoo Production (r2-d2) | Linux | 1 | Self-hosted Odoo 18 — production instance |
| Odoo Dev (c-3po) | Linux | 1 | Odoo 18 development/staging |
| Odoo Dev (bb-8) | Linux | 1 | Odoo 18 development/staging |

---

## 5. Endpoints

| Type | OS | Count | Management | Notes |
|------|----|-------|------------|-------|
| Workstations/Laptops | Windows 11 | ~25 | Intune-managed | Includes engineer and designer workstations |

---

## 6. Network

| Component | Type | Notes |
|-----------|------|-------|
| pfSense | Firewall/router | Dual WAN configuration. CE/Plus edition. |
| QNAP switches | Network switches | — |
| Tailscale | VPN/overlay network | Remote access and site connectivity |

---

## 7. ERP — Odoo 18

BCG's self-hosted ERP platform. Managed under P7.

| Field | Value |
|-------|-------|
| **Version** | Odoo 18 (self-hosted) |
| **Production** | r2-d2 |
| **Development** | c-3po, bb-8 |
| **Modules Active** | PM, CRM, Accounting, HR, Studio (custom modules) |
| **Backend DB** | PostgreSQL |
| **Access** | On-prem; XML-RPC API for MCP integration |
| **MCP Integration** | ivnvxd/mcp-server-odoo v0.4.3 (selected Feb 2026, deployment Q1–Q2 '26) |

---

## 8. Cloud Platforms

| Platform | Purpose | Data Classification | Notes |
|----------|---------|---------------------|-------|
| **Microsoft 365** | Email, calendar, Teams, SharePoint, OneDrive | Tier 3 (internal comms/docs) | Azure Entra ID for identity. No client design data in M365 by policy. |
| **Claude.ai** | Non-client AI reasoning, project management, analysis | Tier 3 | Anthropic Team/Enterprise plan. MS365 connector active. |

---

## 9. AI Tools & Interfaces

| Tool | Type | Transport | Status | Notes |
|------|------|-----------|--------|-------|
| **Open WebUI** | On-prem AI chat interface | HTTP | Active | Connects to local models on DGX Spark. MCP server integration planned (Odoo HTTP:8000, Softeria HTTP:3000, Grafana HTTP:8000). |
| **Windsurf IDE** | AI-assisted development | stdio | Active | Used by Greg and Victor. MCP servers connect via stdio subprocess. |
| **Claude Code** | CLI agentic coding tool | stdio | Active | Used by Greg. MCP integration via `claude mcp add`. |
| **Claude.ai** | Cloud AI interface | N/A | Active | Anthropic MS365 connector live. Used for non-client work only. |

---

## 10. Security & Compliance

| Component | Product/Standard | Status | Notes |
|-----------|-----------------|--------|-------|
| **Endpoint Protection** | Microsoft Defender for Endpoint | Active | ASR (Attack Surface Reduction) rules enforced. MCP server processes require Defender whitelisting. |
| **Identity** | Azure Entra ID | Active | M365 tenant. Custom Entra app registrations needed for MCP OAuth flows. |
| **Patching** | WSUS | Active | 8 patch groups configured. |
| **Backup** | Veeam | Active | — |
| **Framework (Primary)** | NIST CSF 2.0 | Implementing | P5 manages alignment. |
| **Framework (Secondary)** | CIS Controls v8 IG2 | Implementing | P5 manages alignment. |

### 10.1 Data Classification

| Tier | Classification | Storage | AI Processing | Examples |
|------|---------------|---------|---------------|----------|
| 1 | Restricted | On-prem only, encrypted | On-prem models only | Client design files, NDA materials |
| 2 | Confidential | On-prem preferred, encrypted | On-prem models only | Financials, HR, contracts |
| 3 | Internal | On-prem or approved cloud | Cloud AI permitted | SOPs, training, internal comms |
| 4 | Public | Any platform | Any | Marketing, website content |

---

## 11. Monitoring & Observability

**Current state: No monitoring deployed.** All 13 monitoring components are Planned/greenfield as of March 2026.

| Component | Product | Status | Target | Notes |
|-----------|---------|--------|--------|-------|
| Metrics collection | Prometheus | Planned | Q2 '26 | Bob + Greg to deploy. Prerequisite for all MCP observability. |
| Exporters (host) | node_exporter | Planned | Q2 '26 | For VM hosts (6 machines). |
| Exporters (GPU) | dcgm-exporter | Planned | Q2 '26 | For DGX Spark and RTX 5090. |
| Exporters (Windows) | windows_exporter | Planned | Q2 '26 | For ~25 endpoints. |
| Dashboards | Grafana | Planned | Q2 '26 | Prometheus as primary data source. |
| Log aggregation | Loki | Planned | Q4 '26 | Evaluate after Prometheus + Grafana stable. |
| Alerting | Grafana Alerting | Planned | Q3 '26 | Alert pipelines for DGX, Odoo, pfSense WAN. |
| MCP (dashboards) | grafana/mcp-grafana | Selected | Q2 '26 | Primary observability MCP. 5/5 BCG Fit. |
| MCP (metrics) | pab1it0/prometheus-mcp-server | Selected | Q2 '26 | Supplementary. IDE-only PromQL. 4/5 BCG Fit. |

---

## 12. MCP Server Deployment Status

Tracks all MCP servers that have been evaluated, selected, or deployed. Cross-references P4-001 evaluation reports.

| MCP Server | Ecosystem | BCG Fit | Status | Transport | Eval Date | Notes |
|------------|-----------|---------|--------|-----------|-----------|-------|
| **Anthropic MS365 Connector** | Microsoft 365 | 5/5 | Active | Built-in | Feb 2026 | Zero setup. Live in Claude.ai. |
| **ivnvxd/mcp-server-odoo** v0.4.3 | Odoo 18 | 5/5 | Selected | stdio + HTTP:8000 | Feb 2026 | Phase 1 (read-only Windsurf) Q1 '26. Phase 2 (Docker/Open WebUI) Q2 '26. Phase 3 (writes) Q2 '26. |
| **Softeria/ms-365-mcp-server** v0.36.0 | Microsoft 365 | 5/5 | Selected | stdio + HTTP:3000 | Feb 2026 | For Windsurf/Open WebUI M365 access. Phase 1 (read-only) Q2 '26. |
| **grafana/mcp-grafana** | Observability | 5/5 | Selected | stdio + HTTP:8000 | Mar 2026 | Primary observability MCP. Blocked by Prometheus/Grafana deployment. |
| **pab1it0/prometheus-mcp-server** | Observability | 4/5 | Selected | stdio | Mar 2026 | Supplementary PromQL in IDE. Blocked by Prometheus deployment. |

### Status Definitions

| Status | Meaning |
|--------|---------|
| **Active** | Deployed and in use |
| **Selected** | Evaluation complete, approved for deployment, not yet live |
| **Evaluating** | Currently under P4-001 evaluation |
| **Watch** | Cataloged, monitoring for maturity or BCG need |
| **Deprecated** | Previously deployed, being phased out |

---

## 13. Planned Infrastructure Changes

Tracks upcoming deployments and changes that affect multiple projects. Remove items as they complete and update the relevant sections above.

| Change | Owner | Target | Depends On | Affects |
|--------|-------|--------|------------|---------|
| Prometheus + exporters deployment | Bob + Greg | Q2 '26 | — | P4 (MCP servers unblocked), P5 (security monitoring) |
| Grafana deployment | Bob + Greg | Q2 '26 | Prometheus | P4 (mcp-grafana unblocked) |
| Odoo MCP Phase 1 (read-only, Windsurf) | Greg | Q1 '26 | Companion module installed | P4, P7 |
| Odoo MCP Phase 2 (Docker, Open WebUI) | Bob + Greg | Q2 '26 | Phase 1 validated | P4 |
| Softeria MS365 MCP (read-only, Windsurf) | Greg | Q2 '26 | npm install | P4 |
| Softeria MS365 MCP (HTTP, Open WebUI) | Bob + Greg | Q2 '26 | Custom Entra app | P4, P5 |
| Grafana MCP (read-only, Windsurf) | Greg | Q2 '26 | Grafana running | P4 |
| Loki log aggregation | Bob + Greg | Q4 '26 | Prometheus + Grafana stable | P4, P5 |
| Jason Harris onboarding | Greg | Q1 '26 | Engagement confirmed | P4 (AI tool deployment) |

---

## 14. Change Log

| Version | Date | What Changed |
|---------|------|-------------|
| 1.0 | 2026-03-01 | Initial version. Compiled from P4-001 Observability evaluation (BCG stack snapshot), P4 MCP deep dives, and project instructions. |

---

*This document is maintained in OneDrive at Corp/AI/Standards/ and fetched by all Claude Projects at runtime. Update this file when infrastructure changes. Do not maintain separate copies in individual project knowledge bases.*
