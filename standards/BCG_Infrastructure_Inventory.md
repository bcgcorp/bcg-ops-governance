# BCG Corp — Infrastructure Inventory

**Version:** 1.4 [DRAFT — PENDING BOB RECONCILIATION]
**Effective:** March 2026
**Last Updated:** 2026-03-22
**Scope:** All Claude Projects (P0–P10) and subprojects
**Owner:** Gregory Bernardo, President

---

## 1. Purpose

This document is the single source of truth for BCG Corp's technology infrastructure: compute, networking, storage, software platforms, AI tools, and security controls. Every Claude Project references this document (via GitHub) so that evaluations, deployment plans, and security assessments use current infrastructure data rather than stale snapshots embedded in individual project instructions.

**Source of truth:** GitHub (`bcg-ops-governance/standards/`). Per GOV-001, GitHub is the authoritative fetch source.

**CRITICAL:** BCG is exclusively on-premises Odoo 18. odoo.sh is fully decommissioned — all data/archives deleted. Any odoo.sh reference anywhere is stale and must be corrected on sight.

**Update this file when:** hardware is added or decommissioned, software versions change, new platforms are adopted, or monitoring/security tooling status changes.

**v1.4 note:** This version merges email purchase records (Jul 2024–Mar 2026) with prior v1.3 content. Items marked **[BOB CONFIRM]** require physical reconciliation before this draft is approved. Items marked **[JASON CONFIRM]** require validation after Jason's April 1 start date.

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
| Lenovo ST50 | Lenovo | VM host | Management via GL.iNet GL-RM1 KVM + planned PiKVM. [BOB CONFIRM: hostname, current role, specs] |

**Total:** 6 hosts (5x HP, 1x Lenovo)

**Gap:** Batman, Superman, GhostRider have no make/model/specs recorded. These predate the Jul 2024 email purchase window. Bob to audit.

---

## 3. Compute — AI Infrastructure

Dedicated hardware for on-premises AI model serving and development.

| Asset | Type | Quantity | Role | Notes |
|-------|------|----------|------|-------|
| NVIDIA DGX Spark | AI compute appliance | 2 | On-prem model inference and training | Key metrics: GPU utilization, memory, temperature, power draw, PCIe throughput. Monitor via DCGM + dcgm-exporter → Prometheus (planned). [JASON CONFIRM: serial numbers, firmware] |
| RTX 5090 Workstation | GPU workstation | 2 | AI development, model fine-tuning | MSI Suprim GeForce RTX 5090 (32GB GDDR7 PCIe 5.0) confirmed in Build #1. Second unit source TBD. [JASON CONFIRM] |
| NUC9 Cluster | Intel NUC9 | TBD | TBD — allocation pending | 1 unit designated for Bob (Seattle). Remaining units allocation TBD. [GREGORY: confirm total count and assignment plan] |

---

## 4. Servers

| Hostname | Role | OS | Notes |
|----------|------|----|-------|
| DREBIN | Domain Controller / DNS | Windows Server 2022 | IP: 192.168.40.33. Primary DC. |
| PALLAZZO | Domain Controller / DNS | Windows Server 2022 | IP: 192.168.40.34. Secondary DC. |
| — | Member Servers | Windows Server 2022 | Multiple roles. |
| R2-D2 | Odoo 18 Production | Ubuntu 24.04 LTS (Hyper-V) | IP: 192.168.40.170. DB: odoo_production. Python 3.12. Custom addons: /opt/odoo/custom-addons/. Config: /etc/odoo.conf. Logs: /var/log/odoo/odoo.log. LDAP active against BCG-CORP AD. |
| C-3PO | Odoo 18 Development | Ubuntu 24.04 LTS (Hyper-V) | IP: 192.168.40.172. DB: odoo_dev. Refresh script v3.1 from R2-D2. All testing happens here first. |
| BB-8 | Odoo 18 Staging | Ubuntu 24.04 LTS (Hyper-V) | Target for I-53 Automated Testing Framework. [BOB CONFIRM: IP, current status] |
| ClarkKent | Observability / Monitoring | Windows (WSL2 / Docker Desktop) | P5-002 Phase 1 host. D:\observability target path. Docker-users group configured. DNS records in place. Phase 2: Docker Compose stack (Jason, April 1+). |
| RevitPrint Minion | Revit CI/CD Runner | Windows | Always-on dedicated single-seat Autodesk Revit license. CI/CD Phase 2 target: GitHub Actions runner as Windows service. Overnight/weekend test runs (2-5 AM cron). Concurrency group prevents overlap with automated printing. [BOB CONFIRM: hardware specs, IP] |

---

## 5. Endpoints — Workstations, Laptops & Custom Builds

### 5.1 Managed Endpoint Summary

| Type | OS | Count | Management | Notes |
|------|----|-------|------------|-------|
| Workstations/Laptops | Windows 11 | ~25 | Intune-managed (Hybrid Azure AD Join) | Includes engineer and designer workstations |

### 5.2 Workstations / Mini PCs

| Asset | Model | Key Specs | Qty | Purchase Date | Cost | Notes |
|-------|-------|-----------|-----|---------------|------|-------|
| Intel NUC 9 Pro | NUC9VXQNX | Xeon E-2286M, 64GB ECC (upgraded from 16GB stock) | 2 | Jan 2025 | $613.79 ea + $197.87 ECC kit | [BOB CONFIRM: current allocation, 1 unit designated Seattle] |
| Dell OptiPlex 7060 | 7060 Tower | Desktop workstation | 1 | Feb 2026 | $357.94 | [BOB CONFIRM: assigned user, specs] |

### 5.3 Laptops

| Asset | Model | Key Specs | Purchase Date | Cost | Notes |
|-------|-------|-----------|---------------|------|-------|
| Samsung Galaxy Book4 Ultra | 16" AMOLED Touch | Core Ultra 7, 16GB, RTX 4050, 1TB SSD | Aug 2024 | $1,635.99 | Open-box. [BOB CONFIRM: assigned user] |
| ASUS Zenbook DUO | Dual 14" 3K OLED Touch | Core Ultra 9, 32GB, Intel Arc, 1TB SSD | Aug 2024 | $1,699.99 | Dual-screen. [BOB CONFIRM: assigned user] |

### 5.4 Custom Build #1 — Ryzen 9 Workstation (Dec 2025)

| Component | Model | Specs | Purchase Date | Cost |
|-----------|-------|-------|---------------|------|
| CPU | AMD Ryzen 9 9900X | AM5, Zen 5 | Sep 2025 | $569.99 |
| Motherboard | MSI MAG X670E Tomahawk WiFi | AM5, DDR5, PCIe Gen5 | Sep 2025 | $219.95 |
| GPU | MSI Suprim GeForce RTX 5090 | 32GB GDDR7 PCIe 5.0 | Sep 2025 | TBD |
| GPU #2 | ASUS TUF Gaming GeForce RTX | Shipped Jan 2026 | Jan 2026 | TBD |
| Memory | G.SKILL Trident Z5 RGB DDR5 | DDR5 kit | Dec 2025 | $654.99 |
| Memory | Crucial Pro 96GB Kit | 2x48GB DDR5 | Jan 2026 | $790.00 |
| PSU | MSI MEG Ai1600T PCIE5 | 1600W ATX 3.0 | Sep 2025 | TBD |
| Cooler | Corsair Nautilus 360 RS | 360mm AIO | Feb 2026 | $109.99 |

**Notes:** Two GPUs listed — may be dual-GPU config or one reallocated. RTX 5090 flagged for [JASON CONFIRM] as P4 AI infrastructure asset.

### 5.5 Custom Build #2 — Ryzen 7 (Feb 2026)

| Component | Model | Specs | Purchase Date | Cost |
|-----------|-------|-------|---------------|------|
| CPU | AMD Ryzen 7 7800X3D | AM5, 3D V-Cache | Feb 2026 | $599.99 |
| PSU | Corsair RM1000x | 1000W ATX 3.1 | Feb 2026 | $209.99 |

**Gap:** Incomplete BOM — motherboard, GPU, memory, storage, case not found in purchase emails. [BOB CONFIRM: full component list]

### 5.6 Additional Build Components (Nov 2025)

| Component | Model | Specs | Purchase Date | Cost |
|-----------|-------|-------|---------------|------|
| Memory | G.SKILL Flare X5 Series | DDR5 | Nov 2025 | $569.99 |
| GPU | MSI Gaming RTX 5070 12G Ventus 2X OC | 12GB PCIe | Nov 2025 | $539.99 |

**Notes:** [BOB CONFIRM: which build these were installed in]. RTX 5070 may be P4 (AI) or general compute.

---

## 6. Network

### 6.1 Firewalls

| Hostname | Model | Role | WAN IP | Subnet | Notes |
|----------|-------|------|--------|--------|-------|
| Anakin | Netgate 6100 (pfSense) | Primary firewall (CARP primary) | 47.190.52.143 (static) | 192.168.20.0/24 (workstations), 192.168.40.0/24 (servers) | WireGuard endpoint (WG_REMOTE/opt4, port 51820, tunnel IP 10.10.10.1/24). Telegraf agent operational. Prometheus scraping rules in place. |
| Vader | Netgate 6100 (pfSense) | Secondary firewall (CARP secondary) | — | Same subnets as Anakin | WireGuard config pending — Phase 2 (HA failover). Telegraf agent operational. |

**ISP Configuration:** Dual WAN. Primary: 2 Gbps fiber (static IP). Secondary: Starlink Roam (200/100 Mbps, 100 GB cap, failover only).

**pfSense+ Subscription:** Renewed via Netgate SO25-358355 (Jan 2025). Hardware orders SO25-347125 and SO25-345251 delivered Jan 2025 — [BOB CONFIRM: model-to-hostname mapping for these orders].

**Known Issues:**
- Temp ANY-to-ANY firewall rule on SERVERS — security hygiene item, needs target date for removal (carry-forward for Bob's sync agenda)
- pfSense known to lock up during updates, requiring physical power cycling
- Hyper-V network drops workaround: `sudo ethtool -K eth0 tx off rx off gro off tso off`

### 6.2 Switches

| Asset | Model | Specs | Purchase Date | Notes |
|-------|-------|-------|---------------|-------|
| Core Switch | QNAP QSW-M3216R-8S8T | 16-port managed (8x SFP+, 8x 10GbE RJ45) | Jan 2025 | Primary core switch. [BOB CONFIRM: VLAN config, firmware version] |
| 10G Switch | MokerLink 12-Port 10G | 10GbE (likely unmanaged) | Dec 2025 | [BOB CONFIRM: role, location, managed/unmanaged] |

### 6.3 Network Interface Cards

| Asset | Specs | Qty | Purchase Date | Cost | Notes |
|-------|-------|-----|---------------|------|-------|
| 10Gtek Dual-Port 10GbE NIC | RJ45, 10Gb PCIe | 2 | Mar 2025 | $44.38 ea | [BOB CONFIRM: installed location] |
| Euqvos PCIe 10GbE NIC | 10GbE PCIe | 3 | Jan–Feb 2026 | $197.88 total | [BOB CONFIRM: installed location] |

### 6.4 Cabling & Accessories

| Asset | Specs | Qty | Notes |
|-------|-------|-----|-------|
| SFP+ DAC Cables (10Gtek) | Direct attach copper, 10G | Multiple | Dec 2025. For 10GbE interconnects. |
| Cat 8 Ethernet | Various lengths | Multiple | Various dates. |
| PoE Injector (NUBASA) | 60W PoE++ 802.3bt | 1 | Feb 2026. |
| PoE Switch (PoE Texas) | 4-Port In-Wall PoE | 1 | Feb 2026. [BOB CONFIRM: location/purpose] |

### 6.5 VPN & Remote Access

| Service | Type | Status | Notes |
|---------|------|--------|-------|
| WireGuard Site-to-Site | Denton ↔ Harris Lab | Phase 1 Active | Deployed 2026-03-09. Anakin (static) ↔ OuterRim (dynamic). Transit: 10.10.10.0/24. Keepalive 25s, MTU 1420. PSK not configured (Phase 2 post-quantum hardening). Doc: BCG-WireGuard-Site-to-Site-Phase1.docx (P5 KB). |
| Tailscale | Mesh VPN | Active | Retained for remote user access. Site-to-site traffic moved to WireGuard. |
| Headscale | Self-hosted VPN coordinator | Decommissioning | Being phased out. [BOB CONFIRM: timeline, whether this needs an initiative ID or P5-001 note] |

### 6.6 Harris Lab Network

| Hostname | Model | Role | WAN IP | Subnet | Notes |
|----------|-------|------|--------|--------|-------|
| OuterRim | Netgate 4100 (pfSense) | Harris Lab firewall | 47.187.157.191 (dynamic) | 192.168.100.0/24 (Office_Work) | WireGuard endpoint (WG_BCG_SITE/opt6, port 51821, tunnel IP 10.10.10.2/24). Initiates connection (dynamic endpoint). |

### 6.7 Highland Village Branch

| Field | Value |
|-------|-------|
| **Location** | Highland Village, TX |
| **Status** | Online — partial connectivity |
| **Firewall** | Netgate 4200 (pfSense) |
| **WireGuard** | Partial — configuration in progress |
| **Notes** | [BOB CONFIRM: WAN IP, subnet, WireGuard tunnel details, connectivity status] |

### 6.8 Subnet Map

| Site | Subnet | Description |
|------|--------|-------------|
| Denton | 192.168.20.0/24 | Workstations |
| Denton | 192.168.40.0/24 | Servers |
| Harris Lab | 192.168.100.0/24 | Office_Work |
| WG Transit | 10.10.10.0/24 | WireGuard tunnel (isolated) |
| Highland Village | TBD | [BOB CONFIRM: subnet assignment] |

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
| **Claude.ai** | Non-client AI reasoning, project management, analysis | Tier 3 | Anthropic Team plan. MS365 connector active. 17 active projects. |
| **GitHub** | Governance docs, project instructions, code repos | Tier 3 | Single source of truth for governance (GOV-001). 5 repos: bcg-ops-governance (public), bcg-ops-claude-projects, bcg-ai-infrastructure (private). PyRevit source code hosted on self-hosted GitLab — see Section 13. |
| **Cloudflare Pages** | BCG Master Strategic Plan Dashboard | Tier 3 (project metadata only) | https://dashboard.bcg-corp.com. Azure AD SSO (App-Cloudflare_Dashboard_Users group). Auto-deploy from GitHub main. Deployed 2026-03-17. |
| **Autodesk BIM 360** | Legacy BIM collaboration | Tier 1 (client design data) | Still in use for some active projects. Being evaluated for sunset. |
| **Autodesk Construction Cloud (ACC)** | BIM collaboration (current) | Tier 1 (client design data) | Active platform for current project collaboration. Successor to BIM 360. |

---

## 9. AI Tools & Interfaces

| Tool | Type | Transport | Status | Notes |
|------|------|-----------|--------|-------|
| **Open WebUI** | On-prem AI chat interface | HTTP | Active | Connects to local models on DGX Spark. |
| **Windsurf IDE** | AI-assisted development | stdio | Active | Used by Gregory and Victor. Odoo MCP proven. |
| **Claude Code** | CLI agentic coding tool | stdio | Active | Used by Gregory. |
| **Claude.ai** | Cloud AI interface | N/A | Active | Anthropic MS365 connector live. 17 projects. |
| **Claude Code GitHub Actions** | CI/CD automation | Cloud + self-hosted runners | Selected — I-52 | Phase 1: Odoo + PyRevit repos. Read-only 30 days, $100/mo cap. Victor owns CLAUDE.md. |

---

## 10. Security & Compliance

| Component | Product/Standard | Status | Notes |
|-----------|-----------------|--------|-------|
| **Endpoint Protection** | Microsoft Defender for Endpoint | Active | ASR (Attack Surface Reduction) rules enforced. I-43: Outlook Forward Guard add-in Defender/ASR review pending (Bob). |
| **Identity** | Azure Entra ID | Active | M365 tenant. Claude M365 connector locked down — each user sees own data only. |
| **Password Manager** | Bitwarden | Active | Org vault rolling out to team. [BOB CONFIRM: nick@ and rm@ account status] |
| **Patching** | WSUS | Active | 8 patch groups configured. |
| **Backup** | Veeam | Active | See Section 17. |
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
| WireGuard tunnel to Harris Lab | ✅ Complete | Validated and operational. See Section 6.5. |

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
| bcg-ops-claude-projects | GitHub | Private | 17 project instruction files, _template folder | Live |
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
| Temp ANY-to-ANY rule removal | Bob | TBD | Target date needed | — | P5, P5-002 |
| WireGuard Phase 2 (PSK, Vader, HA) | Bob | Q2 '26 | Phase 1 complete | — | P5-002 |
| 15 kW Generator installation | Greg | TBD | Procurement | Not installed | P9 |

---

## 15. Software & Services

| Software | Type | Data Tier | Status | Notes |
|----------|------|-----------|--------|-------|
| Microsoft 365 | Productivity / Email / Teams | 3 | Active | E3/E5 licensing (verify tier for Entra P1 Conditional Access). |
| Bitwarden | Password Manager | 2 | Active | Org vault rolling out to team. |
| Odoo 18 | ERP | 2 | Active | On-premises. Weekly dev sessions. See Section 7. |
| Procore | Construction PM | 3 | Active | Project management platform. |
| Revit | BIM / CAD | 1 | Active | Critical business application. Large file sizes, sync requirements, special reboot handling. |
| AutoCAD | CAD | 1 | Active | Critical business application. Same file handling concerns as Revit. |
| Bluebeam Revu | PDF / Markup | 1 | Active | Critical business application. Potential data corruption from forced shutdowns. |
| Acrobat | PDF | 3 | Active | Standard productivity. |
| pfSense+ | Firewall OS | 2 | Active | Subscription renewed Jan 2025 (Netgate SO25-358355). |
| Tailscale | VPN / Overlay | 2 | Active | Remote user access. |
| Veeam | Backup | 1 | Active | Enterprise backup. See Section 17. |
| SMART Learning Suite | Interactive Display SW | 4 | Active | Licensed Aug 2025. For SMART Board MX displays. |

---

## 16. Storage

### 16.1 NVMe / SSD Drives

| Type | Model | Capacity | Qty | Purchase Date | Cost | Notes |
|------|-------|----------|-----|---------------|------|-------|
| NVMe Gen5 | Corsair MP700 PRO | 2TB | 1 | Feb 2026 | $289.74 | [BOB CONFIRM: installed location] |
| NVMe Gen5 | Corsair MP700 PRO SE | 4TB | 1 | Nov 2024 | TBD | [BOB CONFIRM: installed location] |
| NVMe Gen5 | Crucial T710 | TBD | 2 | Dec 2025 | TBD | [BOB CONFIRM: capacity, installed location] |
| NVMe Gen5 | Crucial T705 | 4TB | 2+ | Sep–Dec 2025 | $374–$479 ea | [BOB CONFIRM: exact count, installed locations] |
| NVMe Gen5 | Crucial T705 | 1TB | 1 | Nov 2024 | TBD | [BOB CONFIRM: installed location] |
| NVMe Gen4 | Crucial P310 | 2TB | 1 | Sep 2025 | TBD | [BOB CONFIRM: installed location] |
| NVMe Gen5 | Samsung 9100 PRO | 2TB | 1 | Nov 2025 | TBD | [BOB CONFIRM: installed location] |
| SATA SSD | Crucial BX500 | 2TB | 1 | Sep 2025 | TBD | [BOB CONFIRM: installed location] |

### 16.2 Enterprise Storage

| Model | Capacity | Qty | Purchase Date | Cost | Notes |
|-------|----------|-----|---------------|------|-------|
| Samsung PM9A3 | 3.84TB | 4 | Nov 2025 | $594 ea | Enterprise NVMe. [BOB CONFIRM: mapped to which VM hosts] |
| Kingston DC600M (SEDC600M/1920G) | 1.92TB | 3 | Oct 2025 | $575.87 (2x Newegg) + 1x CDW | Enterprise SATA. [BOB CONFIRM: mapped to which VM hosts] |

**Priority:** Enterprise drives are likely in VM hosts. Mapping these to Batman/Superman/Wolverine/Punisher/GhostRider is a critical reconciliation item.

### 16.3 Storage Adapters

| Asset | Model | Qty | Purchase Date | Cost |
|-------|-------|-----|---------------|------|
| M.2 NVMe to PCIe Adapter | StarTech | 1 | Feb 2026 | $110.89 |
| M.2 NVMe to PCIe Adapter | Kingwin | 1 | Mar 2026 | $89.98 |
| Lenovo ThinkCentre M.2 2280 SSD Kit III | M.2 adapter kit | 2 | Jul 2025 | TBD |
| 2.5" SAS/SATA Drive Trays | 4-pack | 1 | Nov 2025 | $43.00 |

---

## 17. UPS & Power Protection

| Asset | Model / Specs | Qty | Purchase Date | Cost | Status |
|-------|---------------|-----|---------------|------|--------|
| EcoFlow Delta Ultra Pro | 30.7 kWh battery backup | 1 | Pre-Jul 2024 | TBD | Active — predates email purchase window |
| CyberPower Rack UPS | PR2200ELCDRTXL2U (2200VA) | 2 | Sep 2025 | TBD | [BOB CONFIRM: installed locations] |
| APC UPS | 1200VA line interactive | 1 | Jul 2024 | $165.21 | [BOB CONFIRM: installed location] |
| CyberPower Replacement Batteries | PR1 battery packs (2-pack) | 1 | Sep 2025 | TBD | Spares for PR2200 |
| 15 kW Generator | Planned — NOT installed | 1 | — | TBD | Procurement pending. See Section 14. |

**P9 dependency:** UPS and generator status directly feeds business continuity planning. [FLAG FOR P9: power protection inventory now documented — route for BCP risk register update.]

---

## 18. Rack Infrastructure

| Asset | Model | Qty | Purchase Date | Cost |
|-------|-------|-----|---------------|------|
| 4U Server Chassis | RackChoice 4U | 2 | Dec 2025–Jan 2026 | $169 (first) |
| 5U Server Chassis | RackChoice 5U | 1 | Dec 2025 | TBD |
| 1U Rack Shelf (StarTech) | 4-Post | 1 | Dec 2025 | TBD |
| 1U Rack Shelf (Jingchengmei) | Universal 4-Post | 5+ | Jan 2026 | $26.90 (qty 2) |
| 1U Cable Management | Jingchengmei Metal Horizontal | 4+ | Feb 2025 | $13.71 (qty 2) |
| 1U Sliding Shelf (Tecmojo) | Adjustable Vented | 1 | Feb 2025 | $69.80 |
| 1U Fixed Shelf (Tecmojo) | 19" Fixed Mount | 2 | Feb 2025 | $49.90 |
| 1U Keyboard Tray | Electriduct Universal | 1 | Feb 2025 | TBD |
| 1U Blank Panels | Zonon 8-set | 1 | Jan 2026 | $34.99 |
| Under-Desk PC Mounts | Jingchengmei | 6+ | Jul 2024–Mar 2026 | $36–$39 ea |

---

## 19. KVM & Remote Management

| Asset | Model / Specs | Qty | Status | Notes |
|-------|---------------|-----|--------|-------|
| Rack KVM 17" | MT-VIKI HDMI w/ display | 1–2 | [BOB CONFIRM] | Ordered twice (Dec 2025, Jan 2026) — may be replacement. $949.05. |
| Network KVM | GL.iNet GL-RM1 | TBD | [BOB CONFIRM] | For Lenovo ST50 management gap. |
| IP-KVM | PiKVM | TBD | Planned | Long-term management solution. |

---

## 20. Monitors & Displays

| Asset | Model / Specs | Qty | Purchase Date | Cost | Notes |
|-------|---------------|-----|---------------|------|-------|
| SMART Board MX (V5) Pro 55" | UHD 4K Touch Interactive | 2 | Jul–Sep 2025 | TBD (B&H Photo) | Conference room. SMART Learning Suite licensed. |
| Deco Gear 40" Curved | Ultrawide curved | 1 | Sep 2025 | TBD | — |
| Pisichen 27" Touchscreen | Touch display | 1 | Feb 2025 | $319.99 | — |
| InnoView 23.8" Dual Portable | Dual display | 1 | Feb 2026 | $541.49 | — |
| 24" Portable Monitor | 1080P | 1 | Feb 2026 | TBD | — |

---

## 21. Peripherals (Summary)

Summary of purchased peripherals. Detailed line items available in source purchase records.

| Category | Key Items | Approx Qty | Notes |
|----------|-----------|------------|-------|
| Mice | Logitech MX Master 3S for Business | 3+ | Standard issue. |
| Headsets | Jabra Evolve2 65 Flex (wireless ANC) | 1 | — |
| Speakers | SteelSeries Arena 3, BlueAnt Soundblade | 2 | — |
| Webcams | Smart SWC-120UHD, EMEET C960 | 2 | — |
| USB Hubs/Docks | Anker 565 11-in-1, Anker Prime 6-in-1, Achoro 7-port, EJAY 10Gbps, vantisan 7-port | 6+ | Multiple form factors for different workstation configs. |
| Keyboards | Vilros 15" USB w/ Touchpad | 1 | Compact for rack/server use. |
| Speakerphones | Jabra Speak 410 | 1 | [BOB CONFIRM: purchased or recommendation only] |
| Desk Lamps | LED Architect-style with Clamp | 3+ | Mar 2026. |

**VGA Adapters:** 2x BENFEI VGA to HDMI (1080P converter, Oct 2025). For legacy display connections.

---

## 22. Physical Security & IoT

| Asset | Model | Qty | Purchase Date | Cost | Notes |
|-------|-------|-----|---------------|------|-------|
| Security Camera System | eufy eufyCam S300 (eufyCam 3) | 1 system | Jul 2024 | $459.99 | Wireless. Office perimeter. |
| Smart Lock | eufy Video Smart Lock S330 | 1 | Jul 2024 | TBD | Same order as cameras. |
| Smart Switch | Zooz Z-Wave Long Range Double | 1 | Mar 2026 | $44.95 | Z-Wave. |

**Note:** Physical security devices are on a separate network segment from IT infrastructure. [BOB CONFIRM: VLAN isolation for IoT devices.]

---

## 23. Data Gaps & Reconciliation Checklist

Items requiring Bob's physical audit before this inventory version can be approved. Ordered by priority.

### Critical Gaps

| # | Gap | Action Required | Owner |
|---|-----|-----------------|-------|
| 1 | VM hosts Batman, Superman, GhostRider — no make/model/specs | On-site audit: model, CPU, RAM, storage config, iLO firmware, serial numbers | Bob |
| 2 | Enterprise SSD allocation — which drives in which hosts | Map Samsung PM9A3 (4x) and Kingston DC600M (3x) to installed VM host slots | Bob |
| 3 | Netgate hardware order mapping — SO25-347125 and SO25-345251 | Confirm which Netgate appliances these orders delivered and map to hostnames | Bob |
| 4 | Lenovo ST50 — hostname, role, and full specs | Confirm hostname, management interface status, GL-RM1 deployment status | Bob |
| 5 | DGX Spark — specs, serial numbers, firmware | Validate on April 1 start date | Jason |
| 6 | Backup architecture — targets, retention, immutability | Document Veeam backup targets, retention policy, and immutable/air-gap status | Bob |
| 7 | Custom Build #2 — incomplete BOM | Identify missing components (motherboard, GPU, memory, storage, case) | Bob |
| 8 | MokerLink 10G switch — role unknown | Confirm role, location, managed vs. unmanaged, VLAN participation | Bob |
| 9 | Highland Village branch — incomplete network detail | WAN IP, subnet, WireGuard status, equipment inventory | Bob |

### Corrections Applied in v1.4

| # | Item | What Changed |
|---|------|-------------|
| 1 | QNAP switch model | Enriched from "[BOB CONFIRM: model]" to QSW-M3216R-8S8T (8x SFP+, 8x 10GbE RJ45) |
| 2 | DC hostnames | Added DREBIN (192.168.40.33) and PALLAZZO (192.168.40.34) to Servers table |
| 3 | Cloudflare Pages dashboard | Added to Cloud Platforms (Section 8) |
| 4 | Headscale VPN | Added to VPN section as decommissioning — needs initiative ID or P5-001 tracking |
| 5 | pfSense+ subscription | Added Netgate SO reference to Section 6.1 |

### Items NOT Included (Require Separate Audit)

| Category | Notes |
|----------|-------|
| Printers / Scanners | None found in purchase emails. |
| Pre-Jul 2024 legacy hardware | Email extraction only covers Jul 2024–Mar 2026. |
| Complete software license inventory | Check with Rachel for full license inventory. |
| Warranty / support contracts | Not tracked. Recommend adding warranty expiry dates. |
| Serial numbers | Not available from email. Collect during on-site physical audit. |
| Build accessories (fans, cables, heatsinks, brackets) | Captured in source purchase data but too granular for governance inventory. Available on request. |

---

## 24. Change Log

| Version | Date | What Changed |
|---------|------|--------------|
| 1.4 DRAFT | 2026-03-22 | Merged email purchase records (Jul 2024–Mar 2026). Expanded Section 5 (workstations, laptops, custom builds). Enriched Section 6.2 (QNAP model QSW-M3216R-8S8T, MokerLink 10G switch, NICs). Added DC hostnames to Section 4. Added Cloudflare Pages to Section 8. Added Headscale to VPN. Added Bitwarden to Security. Created Section 15 (Software & Services), Section 16 (Storage), Section 17 (UPS/Power), Section 18 (Rack), Section 19 (KVM), Section 20 (Displays), Section 21 (Peripherals), Section 22 (Physical Security), Section 23 (Data Gaps Checklist). Added 15 kW generator to Planned Changes. Source: email purchase records, P5 project docs, WireGuard Phase 1 doc, Cloudflare deployment summary. |
| 1.3 | 2026-03-16 | Scope P0–P9 → P0–P10. Added NUC9 cluster to Section 3 (Compute — AI Infrastructure). Added Highland Village branch to Section 6.5 (Network). Added BIM 360 and ACC to Section 8 (Cloud Platforms). Updated Claude.ai project count 16→17. Updated bcg-ops-claude-projects file count to 17. |
| 1.2 | 2026-03-15 | Section 8 (Cloud Platforms): Removed `bcg-ops-revit-tools` from GitHub repos table; noted PyRevit source is now on self-hosted GitLab. Section 13 (Repos): Corrected `bcg-ops-revit-tools` entry — platform changed GitHub→GitLab self-hosted, added GitLab hostname (alexandria.bcg-corp.com), SSH remote, deploy target path, and deletion notice for GitHub repo. Removed stale GitHub-only scope note. |
| 1.1 | 2026-03-12 | Major update. Added ClarkKent (observability host), RevitPrint Minion (CI/CD runner). Detailed pfSense HA pair (Anakin/Vader Netgate 6100). Added Harris Lab network (OuterRim Netgate 4100). Added WireGuard site-to-site VPN detail (Phase 1 complete). Added subnet map. Updated Odoo section with full on-prem detail (coding standards, gotchas, LDAP, paths). Added odoo.sh decommission notice. Added Claude Code GitHub Actions to AI Tools. Added File Server MCP (planned). Updated P5-002 monitoring from "greenfield" to Phase 1 complete. Added GitHub repos section. Updated M365 security lockdown. Updated scope P0–P7 → P0–P9. Updated source of truth to GitHub (GOV-001). Added Wolverine/Punisher detail (DL380 Gen10). |
| 1.0 | 2026-03-01 | Initial version. |

---

*This document is maintained in GitHub at bcg-ops-governance/standards/ and fetched by all Claude Projects at runtime. Update this file when infrastructure changes. Do not maintain separate copies in individual project knowledge bases.*
