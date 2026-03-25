# BCG Project Code Registry

**Owner:** Gregory Bernardo  
**Last Updated:** 2026-03-24  
**Maintained by:** BCG Schedule Tracker (Cowork) — read at 4am daily  

---

## Purpose

This file is the single source of truth for recognized BCG project codes. The Cowork automated scheduler reads this file each morning to determine whether a project code extracted from email or staff submissions is registered or unregistered.

- **Registered codes** are processed at standard confidence (High or Medium).
- **Unregistered codes** are still processed but flagged Low confidence — Cory reviews in Odoo before approving.

To add a new project, append a row to the Active table below and commit. The change takes effect at the next 4am run.

---

## Active Projects

| Project Code | Site | Project Name | Prime Firm | Registered Date | Notes |
|---|---|---|---|---|---|
| ATL114 | ATL | AWS Atlanta 114 | Arcadis | 2026-03-24 | |
| AUS150 | AUS | AWS Austin 150 | Unknown | 2026-03-24 | Prime TBD — confirm with Cory |
| IAD534 | IAD | AWS BWI110 | HKS | 2026-03-24 | |
| IAD535 | IAD | AWS BWI111 | HKS | 2026-03-24 | |
| IAD536 | IAD | AWS BWI112 | HKS | 2026-03-24 | |
| IAD537 | IAD | AWS BWI113 | HKS | 2026-03-24 | |
| IAH100 | IAH | AWS Houston IAH100 | Unknown | 2026-03-24 | Prime TBD — confirm with Cory |
| LBB120 | LBB | AWS Houston LBB120 | Unknown | 2026-03-24 | Prime TBD — confirm with Cory |
| PDX070 | PDX | AWS Portland 070 | Gensler | 2026-03-24 | |
| PHX062 | PHX | AWS Phoenix 062 | Gensler | 2026-03-24 | 60% Restart in progress |
| PHX065 | PHX | AWS Phoenix 065 Security Design | S+R | 2026-03-24 | |
| PHX069 | PHX | AWS Phoenix 069 Room Construction | Unknown | 2026-03-24 | Prime TBD — confirm with Cory |
| PHX070 | PHX | AWS Phoenix 070 (Avondale Stack CSHL) | Corgan | 2026-03-24 | Paired with PHX071 |
| PHX071 | PHX | AWS Phoenix 071 (Avondale Stack CSHL) | Corgan | 2026-03-24 | Paired with PHX070 |
| STL100 | STL | AWS St. Louis 100 | S+R | 2026-03-24 | |
| STL101 | STL | AWS St. Louis 101 Building B TI | S+R | 2026-03-24 | |
| STL102 | STL | AWS St. Louis 102 Building C TI | S+R | 2026-03-24 | |
| STL103 | STL | AWS St. Louis 103 Building D TI | S+R | 2026-03-24 | |

---

## Placeholder Codes (Regex Match — Not Yet Assigned)

Codes below match the `[A-Z]{3}[0-9]{3}` pattern but have not been awarded. Include here to prevent false-positive flagging.

| Code | Notes |
|---|---|
| YUL | Montreal — anticipated award |
| CMH | Columbus — anticipated award |

---

## Retired / Archived Codes

| Project Code | Site | Retired Date | Notes |
|---|---|---|---|
| — | — | — | None yet |

---

## Change Log

| Date | Changed By | Change |
|---|---|---|
| 2026-03-24 | Gregory Bernardo | Initial registry created from full inbox sweep (Cowork initial setup run) |
