# BCG Corp — Infrastructure Inventory

**Version:** 1.2
**Effective:** March 2026
**Last Updated:** 2026-03-15
**Scope:** All Claude Projects (P0–P9) and subprojects
**Owner:** Gregory Bernardo, President

---

## 1. Purpose

This document is the single source of truth for BCG Corp's technology infrastructure: compute, networking, storage, software platforms, AI tools, and security controls. Every Claude Project references this document (via GitHub) so that evaluations, deployment plans, and security assessments use current infrastructure data rather than stale snapshots embedded in individual project instructions.

**Source of truth:** GitHub (`bcg-ops-governance/standards/`). Per GOV-001, GitHub is the authoritative fetch source.

**CRITICAL:** BCG is exclusively on-premises Odoo 18. odoo.sh is fully decommissioned — all data/archives deleted. Any odoo.sh reference anywhere is stale and must be corrected on sight.

**Update this file when:** hardware is added or decommissioned, software versions change, new platforms are adopted, or monitoring/security tooling status changes.

---

## 2. Compute — VM Hosts

Hypervisor hosts running BCG's virtualized server infrastructure.

| Hostname | Hardware | Role | Notes |
|----------|----------|------|-------|
| Batman | HP | VM host | — |
| Superman | HP | VM host | — |
| Wolverine | HP ProLiant DL380 Gen10 | VM host / General compute / VDI | 512GB RAM, NVMe+SATA. RDP VMs with Revit 2024. [BOB CONFIRM: production status, current workloads] |
| Punisher | HP ProLiant DL380 Gen10 | VM host / GPU compute | 768GB RAM, 3x NVIDIA Tesla P4 8GB. [BOB CONFIRM: production status, current workloads, firmware version] |
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

| Hostname | Role | OS | Notes |
|----------|------|----|-------|
| — | Domain Controllers | Windows Server 2022 | 2+ instances. Active Directory. |
| — | Member Servers | Windows Server 2022 | Multiple roles. |
| R2-D2 | Odoo 18 Production | Ubuntu 24.04 LTS (Hyper-V) | IP: 192.168.40.170. DB: odoo_production. Python 3.12. Custom addons: /opt/odoo/custom-addons/. Config: /etc/odoo.conf. Logs: /var/log/odoo/odoo.log. LDAP active against BCG-CORP AD. |
| C-3PO | Odoo 18 Development | Ubuntu 24.04 LTS (Hyper-V) | IP: 192.168.40.172. DB: odoo_dev. Refresh script v3.1 from R2-D2. All testing happens here first. |
| BB-8 | Odoo 18 Staging | Ubuntu 24.04 LTS (Hyper-V) | Target for I-53 Automated Testing Framework. [BOB CONFIRM: IP, current status] |
| ClarkKent | Observability / Monitoring | Windows (WSL2 / Docker Desktop) | P5-002 Phase 1 host. D:\observability target path. Docker-users group configured. DNS records in place. Phase 2: Docker Compose stack (Jason, April 1+). |
| RevitPrint Minion | Revit CI/CD Runner | Windows | Always-on dedicated single-seat Autodesk Revit license. CI/CD Phase 2 target: GitHub Actions runner as Windows service. Overnight/weekend test runs (2-5 AM cron). Concurrency group prevents overlap with automated printing. [BOB CONFIRM: hardware specs, IP] |

---

## 5. Endpoints

| Type | OS | Count | Management | Notes |
|------|----|-------|------------|-------|
| Workstations/Laptops | Windows 11 | ~25 | Intune-managed | Includes engineer and designer workstations |

---

## 6. Network

### 6.1 Firewalls

| Hostname | Model | Role | WAN IP | Subnet | Notes |
|----------|-------|------|--------|--------|-------|
| Anakin | Netgate 6100 (pfSense) | Primary firewall (CARP primary) | 47.190.52.143 (static) | 192.168.20.0/24 (workstations), 192.168.40.0/24 (servers) | WireGuard endpoint (WG_REMOTE/opt4, port 51820, tunnel IP 10.10.10.1/24). Telegraf agent operational. Prometheus scraping rules in place. |
| Vader | Netgate 6100 (pfSense) | Secondary firewall (CARP secondary) | — | Same subnets as Anakin | WireGuard config pending — Phase 2 (HA failover). Telegraf agent operational. |

**ISP Configuration:** Dual WAN. Primary: 2 Gbps fiber (static IP). Secondary: Starlink Roam (100 GB cap, failover).

**Known Issues:**
- Temp ANY-to-ANY firewall rule on SERVERS — security hygiene item, needs target date for removal (carry-forward for Bob's sync agenda)
- pfSense known to lock up during updates, requiring physical power cycling
- Hyper-V network drops workaround: `sudo ethtool -K eth0 tx off rx off gro off tso off`

### 6.2 Switches

| Component | Type | Notes |
|-----------|------|-------|
| QNAP switches | Managed network switches | [BOB CONFIRM: model, count, VLAN config] |

### 6.3 VPN & Remote Access

| Service | Type | Status | Notes |
|---------|------|--------|-------|
| WireGuard Site-to-Site | Denton ↔ Harris Lab | Phase 1 Active | Deployed 2026-03-09. Anakin (static) ↔ OuterRim (dynamic). Transit: 10.10.10.0/24. Keepalive 25s, MTU 1420. PSK not configured (Phase 2 post-quantum hardening). Doc: BCG-WireGuard-Site-to-Site-Phase1.docx (P5 KB). |
| Tailscale | Mesh VPN | Active | Retained for remote user access. Site-to-site traffic moved to WireGuard. |

### 6.4 Harris Lab Network

| Hostname | Model | Role | WAN IP | Subnet | Notes |
|----------|-------|------|--------|--------|-------|
| OuterRim | Netgate 4100 (pfSense) | Harris Lab firewall | 47.187.157.191 (dynamic) | 192.168.100.0/24 (Office_Work) | WireGuard endpoint (WG_BCG_SITE/opt6, port 51821, tunnel IP 10.10.10.2/24). Initiates connection (dynamic endpoint). |

### 6.5 Subnet Map

| Site | Subnet | Description |
|------|--------|-------------|
| Denton | 192.168.20.0/24 | Workstations |
| Denton | 192.168.40.0/24 | Servers |
| Harris Lab | 192.168.100.0/24 | Office_Work |
| WG Transit | 10.10.10.0/24 | WireGuard tunnel (isolated) |

---

## 7. ERP — Odoo 18

BCG's self-hosted ERP platform. Managed under P7. Victor Carrillo is sole P7 owner.

| Field | Value |
|-------|-------|
| **Version** | Odoo 18.0, Community + Enterprise |
| **Runtime** | Python 3.12, Ubuntu 24.04 LTS on Hyper-V |
| **Production** | R2-D2 (192.168.40.170) |
| **Development** | C-3PO (192.168.40.172) |
| **Staging** | BB-8 (TBD) |
| **Modules Active** | PM, CRM, Accounting, HR, Studio (custom modules) |
| **Custom Modules** | 17 installed (see BCG_Custom_Module_Registry.md) |
| **Custom Addons Path** | /opt/odoo/custom-addons/ |
| **Config** | /etc/odoo.conf |
| **Logs** | /var/log/odoo/odoo.log |
| **Backend DB** | PostgreSQL |
| **LDAP** | Active against BCG-CORP AD (auto-creates users on first domain login) |
| **Access** | On-prem only; XML-RPC API for MCP integration |
| **MCP Integration** | ivnvxd/mcp-server-odoo v0.4.3 (proven with Windsurf, deployment Q2 '26) |

**CRITICAL:** BCG is exclusively on-premises Odoo 18. odoo.sh is fully decommissioned — all data/archives deleted with prejudice (2026-03-12). Any odoo.sh reference is stale and must be corrected on sight.

### 7.1 Odoo Coding Standards (All Modules)

1. Always use logging — `log("message", level='info')` at entry, key decisions, and exit
2. Use try/except for field access — safer than hasattr()
3. Prevent recursion — `env.context.get('no_automation_recursion')` guard
4. Batch processing — `limit=` on searches, `env.cr.commit()` after batches of 50
5. Test domains in list view first — before adding to automation rules
6. Task state values are strings — '01_in_progress', '1_done', '1_canceled' (inconsistent prefixes)
7. Stage AND state must both be set — stage = visual column, state = status enum
8. Template identification by tag — never hardcode project IDs
9. Milestone names must exactly match product names — for Odoo auto-linking
10. Always test on C-3PO first — refresh from R2-D2 before testing

### 7.2 Known Gotchas

- **Access Manager Ninja:** DO NOT install. Caused Signal 9. Use native access rights only.
- **Dashboard Ninja timezone:** Dates display one day off. Workaround fields exist. Proper fix needed.
- **Knowledge app blank content:** Known issue. Content in DB but doesn't render.
- **OWL in Odoo 18:** XPath can't move OWL-injected components (chatter, calendar). Don't try.
- **First login after refresh:** Slow (2-3 min). Expected — cache building.

---

## 8. Cloud Platforms

| Platform | Purpose | Data Classification | Notes |
|----------|---------|---------------------|-------|
| **Microsoft 365** | Email, calendar, Teams, SharePoint, OneDrive | Tier 3 (internal comms/docs) | Azure Entra ID for identity. No client design data in M365 by policy. M365 security lockdown completed 2026-03-12: each user sees only their own data through Claude connector. |
| **Claude.ai** | Non-client AI reasoning, project management, analysis | Tier 3 | Anthropic Team plan. MS365 connector active. 16 active projects. |
| **GitHub** | Governance docs, project instructions, code repos | Tier 3 | Single source of truth for governance (GOV-001). 5 repos: bcg-ops-governance (public), bcg-ops-claude-projects, bcg-ai-infrastructure (private). PyRevit source code hosted on self-hosted GitLab — see Section 9. |

---

## 9. AI Tools & Interfaces

| Tool | Type | Transport | Status | Notes |
|------|------|-----------|--------|-------|
| **Open WebUI** | On-prem AI chat interface | HTTP | Active | Connects to local models on DGX Spark. |
| **Windsurf IDE** | AI-assisted development | stdio | Active | Used by Gregory and Victor. Odoo MCP proven. |
| **Claude Code** | CLI agentic coding tool | stdio | Active | Used by Gregory. |
| **Claude.ai** | Cloud AI interface | N/A | Active | Anthropic MS365 connector live. 16 projects. |
| **Claude Code GitHub Actions** | CI/CD automation | Cloud + self-hosted runners | Selected — I-52 | Phase 1: Odoo + PyRevit repos. Read-only 30 days, $100/mo cap. Victor owns CLAUDE.md. |

---

## 10. Security & Compliance

| Component | Product/Standard | Status | Notes |
|-----------|-----------------|--------|-------|
| **Endpoint Protection** | Microsoft Defender for Endpoint | Active | ASR (Attack Surface Reduction) rules enforced. I-43: Outlook Forward Guard add-in Defender/ASR review pending (Bob). |
| **Identity** | Azure Entra ID | Active | M365 tenant. Claude M365 connector locked down — each user sees own data only. |
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

## 11. Monitoring & Observability (P5-002)

**Current state:** Phase 1 infrastructure COMPLETE on ClarkKent. Phase 2 (Docker Compose stack, Grafana, Loki decision) gated on Jason Harris (April 1).

### Phase 1 Complete (Bob, 2026-03-12)

| Component | Status | Notes |
|-----------|--------|-------|
| ClarkKent VM provisioned | ✅ Complete | WSL2 + Docker Desktop, D:\observability, docker-users group, DNS records |
| Telegraf on Anakin | ✅ Complete | pfSense telemetry collection operational |
| Telegraf on Vader | ✅ Complete | pfSense telemetry collection operational |
| Firewall rules (Prometheus scraping) | ✅ Complete | — |
| WireGuard tunnel to Harris Lab | ✅ Complete | Validated and operational. See Section 6.3. |

### Phase 2 Pending (Jason, post-April 1)

| Component | Product | Target | Notes |
|-----------|---------|--------|-------|
| Docker Compose stack | Prometheus + Grafana + Loki (TBD) | Q2 '26 | Deploy to D:\observability on ClarkKent. Jason owns architecture. |
| Entra ID redirect URI | Grafana OAuth | Q2 '26 | Update needed for Grafana login. |
| Loki enablement | Log aggregation | Q2 '26 | Jason decision: yes/no/defer. |
| Syslog integration | pfSense → Loki | Q2 '26 | Depends on Loki decision. |

### Future Scope

| Item | Priority | Notes |
|------|----------|-------|
| TLS termination via internal CA | MEDIUM | — |
| Vader WireGuard tunnel (HA failover) | MEDIUM | Phase 2 |
| WireGuard PSK hardening | LOW | Post-quantum preparation |
| Temp ANY-to-ANY rule removal | HIGH | Security hygiene — Bob needs target date |
| Automated monitoring for WireGuard tunnel | LOW | Currently manual |

### MCP Servers (Observability)

| MCP Server | BCG Fit | Status | Transport | Notes |
|------------|---------|--------|-----------|-------|
| grafana/mcp-grafana | 5/5 | Selected | stdio + HTTP:8000 | Primary observability MCP. Blocked by Grafana deployment. |
| pab1it0/prometheus-mcp-server | 4/5 | Selected | stdio | Supplementary PromQL in IDE. Blocked by Prometheus deployment. |

---

## 12. MCP Server Deployment Status

Tracks all MCP servers that have been evaluated, selected, or deployed. Cross-references P4-001 evaluation reports.

| MCP Server | Ecosystem | BCG Fit | Status | Transport | Notes |
|------------|-----------|---------|--------|-----------|-------|
| **Anthropic MS365 Connector** | Microsoft 365 | 5/5 | Active | Built-in | Zero setup. Live in Claude.ai. Locked down 2026-03-12. |
| **ivnvxd/mcp-server-odoo** v0.4.3 | Odoo 18 | 5/5 | Selected | stdio + HTTP:8000 | Proven with Windsurf. Phase 1 read-only Q2 '26. Cloudflare Tunnel dependency for remote access. |
| **Softeria/ms-365-mcp-server** v0.36.0 | Microsoft 365 | 5/5 | Selected | stdio + HTTP:3000 | For Windsurf/Open WebUI M365 access. Phase 1 read-only Q2 '26. |
| **grafana/mcp-grafana** | Observability | 5/5 | Selected | stdio + HTTP:8000 | Blocked by Prometheus/Grafana deployment on ClarkKent. |
| **pab1it0/prometheus-mcp-server** | Observability | 4/5 | Selected | stdio | Blocked by Prometheus deployment. |
| **File Server MCP** | On-prem file system | TBD | Planned | TBD | Dependency for I-50 Phase 2 (B: Drive Cleanup Agent). Bob to assess availability. |

### Status Definitions

| Status | Meaning |
|--------|---------|
| **Active** | Deployed and in use |
| **Selected** | Evaluation complete, approved for deployment, not yet live |
| **Planned** | Identified as needed, not yet evaluated |
| **Evaluating** | Currently under P4-001 evaluation |
| **Watch** | Cataloged, monitoring for maturity or BCG need |
| **Deprecated** | Previously deployed, being phased out |

---

## 13. GitHub & GitLab Repositories

| Repo | Platform | Visibility | Contents | Status |
|------|----------|------------|----------|--------|
| bcg-ops-governance | **GitHub** | **PUBLIC** | Governance docs, Style Guide, Initiative Catalog, EAB, naming standards | Live — Single source of truth (GOV-001). PUBLIC repo — Bob: periodic review to confirm no sensitive data committed. |
| bcg-ops-claude-projects | GitHub | Private | 16 project instruction files, _template folder | Live |
| bcg-odoo-dev | GitHub | Private | Custom modules, MCP configs, runbooks | Live |
| bcg-ai-infrastructure | GitHub | Private | DGX Spark runbooks, Open WebUI config, network architecture | Live |
| bcg-ops-revit-tools | **GitLab (self-hosted)** | Private | PyRevit B-01–B-41 backlog, shared libraries | Live — hosted at `alexandria.bcg-corp.com`. SSH remote: `git@alexandria.bcg-corp.com:revit/bcg-ops-revit-tools.git`. Runtime deploy target: `Q:\Pearl_Prod\z_pyRevit`. Deploy is manual via deploy.ps1. **GitHub bcgcorp/bcg-ops-revit-tools has been DELETED.** |

**CI/CD:** Claude Code GitHub Actions approved for both Odoo and PyRevit repos (I-52). Read-only review for 30 days. $100/mo API cap. Self-hosted Linux runner for Odoo CI; future Windows runner on RevitPrint Minion for Revit CI.

**GitLab on-prem mirror:** Assigned to Bob — in progress (P9). Provides no-cost CI redundancy for I-41 BCP.

---

## 14. Planned Infrastructure Changes

| Change | Owner | Target | Depends On | Status | Affects |
|--------|-------|--------|------------|--------|---------|
| Docker Compose stack (Prometheus + Grafana) | Jason | Q2 '26 | April 1 start | Phase 1 infra complete | P5-002 Phase 2 |
| Odoo MCP Phase 1 (read-only, Windsurf) | Greg/Victor | Q2 '26 | Cloudflare Tunnel | Proven in testing | P4, P7 |
| Odoo MCP Phase 2 (Docker, Open WebUI) | Bob + Greg | Q2 '26 | Phase 1 validated | — | P4 |
| Softeria MS365 MCP (read-only, Windsurf) | Greg | Q2 '26 | npm install | — | P4 |
| File Server MCP | Bob | Q2 '26 | Assessment needed | Planned | I-50 Ph2 |
| CI/CD Phase 1 (Odoo + PyRevit, cloud runners) | Victor + Bob | Q2 '26 | D-GH decisions resolved | UNBLOCKED | I-52 |
| CI/CD Phase 2 (RevitPrint Minion runner) | Bob | Q3 '26 | Jason (April 1), credential persistence check | — | I-52 Ph2 |
| Loki log aggregation | Jason + Bob | Q2–Q3 '26 | Prometheus + Grafana stable | — | P5-002 |
| GitLab on-prem mirror | Bob | Q2 '26 | — | In progress | P9 I-41 |
| Odoo.sh decommission | Bob | ASAP | — | Ordered 2026-03-12 | P5, P7 |
| Temp ANY-to-ANY rule removal | Bob | TBD | Target date needed | — | P5, P5-002 |
| WireGuard Phase 2 (PSK, Vader, HA) | Bob | Q2 '26 | Phase 1 complete | — | P5-002 |

---

## 15. Change Log

| Version | Date | What Changed |
|---------|------|-------------|
| 1.2 | 2026-03-15 | Section 8 (Cloud Platforms): Removed `bcg-ops-revit-tools` from GitHub repos table; noted PyRevit source is now on self-hosted GitLab. Section 13 (Repos): Corrected `bcg-ops-revit-tools` entry — platform changed GitHub→GitLab self-hosted, added GitLab hostname (alexandria.bcg-corp.com), SSH remote, deploy target path, and deletion notice for GitHub repo. Removed stale GitHub-only scope note. |
| 1.1 | 2026-03-12 | Major update. Added ClarkKent (observability host), RevitPrint Minion (CI/CD runner). Detailed pfSense HA pair (Anakin/Vader Netgate 6100). Added Harris Lab network (OuterRim Netgate 4100). Added WireGuard site-to-site VPN detail (Phase 1 complete). Added subnet map. Updated Odoo section with full on-prem detail (coding standards, gotchas, LDAP, paths). Added odoo.sh decommission notice. Added Claude Code GitHub Actions to AI Tools. Added File Server MCP (planned). Updated P5-002 monitoring from "greenfield" to Phase 1 complete. Added GitHub repos section. Updated M365 security lockdown. Updated scope P0–P7 → P0–P9. Updated source of truth to GitHub (GOV-001). Added Wolverine/Punisher detail (DL380 Gen10). |
| 1.0 | 2026-03-01 | Initial version. |

---

*This document is maintained in GitHub at bcg-ops-governance/standards/ and fetched by all Claude Projects at runtime. Update this file when infrastructure changes. Do not maintain separate copies in individual project knowledge bases.*
