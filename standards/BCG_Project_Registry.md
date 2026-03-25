# BCG Project Code Registry

**Document ID:** GOV-018
**Version:** 1.0
**Owner:** Gregory Bernardo, President
**Project:** P0 — Master Strategic Plan & Executive Advisory
**Operational Owner:** Rachel McGee (daily intake ops)
**Last Updated:** 2026-03-24
**Storage:** `bcg-ops-governance/standards/BCG_Project_Registry.md`

---

## Fetch Rule

This file is runtime-fetched by the Cowork Schedule Tracker (4am daily) and the BCG Schedule Intake Team Project (at 5pm consolidate).

**Always fetch via GitHub MCP:** `github-write:get_file_contents` — owner `bcgcorp`, repo `bcg-ops-governance`, path `standards/BCG_Project_Registry.md`

**Never use `raw.githubusercontent.com` CDN** — the CDN serves stale cached content. Proven failure 2026-03-22. No exceptions.

If the GitHub MCP fetch fails, flag: `[REGISTRY WARNING: Could not fetch current BCG_Project_Registry.md. Using fallback from previous run. All confidence scores may be stale.]` and proceed with last known registry state.

---

## Purpose

This file is the single source of truth for recognized BCG project codes. It is read at each 4am Cowork run and at each 5pm Team Project consolidation to determine whether a project code extracted from email or staff submissions is registered or unregistered.

- **Active codes** — processed at standard confidence (High or Medium depending on source quality)
- **Placeholder codes** — expected in early-stage communications before formal award; processed at Medium confidence
- **Stale codes** — processed but confidence auto-downgraded to Medium; flagged in digest
- **Unrecognized codes** — any `[A-Z]{3}[0-9]{3}` token not in any table below; flagged Low confidence; Cory reviews in Odoo before approving

**To add a new project:** Append a row to the Active table and commit. The change takes effect at the next 4am Cowork run.

---

## Active Projects

| Project Code | Site | Project Name | Prime Firm | Registered Date | Notes |
|---|---|---|---|---|---|
| ATL114 | ATL | AWS Atlanta 114 | Arcadis | 2026-03-24 | |
| IAD534 | IAD | AWS BWI110 | HKS | 2026-03-24 | |
| IAD535 | IAD | AWS BWI111 | HKS | 2026-03-24 | |
| IAD536 | IAD | AWS BWI112 | HKS | 2026-03-24 | |
| IAD537 | IAD | AWS BWI113 | HKS | 2026-03-24 | |
| IAH100 | IAH | AWS Houston IAH100 | Gensler | 2026-03-24 | |
| LBB120 | LBB | AWS Lubbock LBB120 | Gensler | 2026-03-24 | |
| PDX070 | PDX | AWS Portland 070 | Gensler | 2026-03-24 | |
| PHX062 | PHX | AWS Phoenix 062 | Gensler | 2026-03-24 | 60% Restart in progress |
| PHX065 | PHX | AWS Phoenix 065 Security Design | S+R | 2026-03-24 | |
| PHX069 | PHX | AWS Phoenix 069 Room Construction | Corgan | 2026-03-24 | |
| PHX070 | PHX | AWS Phoenix 070 (Avondale Stack CSHL) | Corgan | 2026-03-24 | Paired with PHX071 |
| PHX071 | PHX | AWS Phoenix 071 (Avondale Stack CSHL) | Corgan | 2026-03-24 | Paired with PHX070 |
| STL100 | STL | AWS St. Louis 100 | S+R | 2026-03-24 | |
| STL101 | STL | AWS St. Louis 101 Building B TI | S+R | 2026-03-24 | |
| STL102 | STL | AWS St. Louis 102 Building C TI | S+R | 2026-03-24 | |
| STL103 | STL | AWS St. Louis 103 Building D TI | S+R | 2026-03-24 | |

---

## Placeholder Codes (Anticipated — Not Yet Awarded)

Codes that match `[A-Z]{3}[0-9]{3}` and are expected to appear in early-stage emails before formal award. Listed to prevent false-positive Low confidence flagging. Processed at Medium confidence.

| Code | Site | Expected Prime | Notes |
|---|---|---|---|
| AUS150 | AUS | TBD | AWS Austin — anticipated award. Not yet awarded as of 2026-03-24. |
| YUL | — | TBD | Montreal — anticipated award. |
| CMH | — | TBD | Columbus — anticipated award. |

---

## Stale Projects (No activity in 91–365 days)

Stale codes are still processed but confidence is auto-downgraded to Medium. Flagged in daily digest.

| Project Code | Site | Prime Firm | Last Activity | Notes |
|---|---|---|---|---|
| PHX066 | PHX | TBD | ~2025 (2026-03-24 inbox sweep) | Identified in initial sweep; minimal recent activity. Confirm status with Gregory before promoting to Active or Archived. |

---

## Retired / Archived Codes

| Project Code | Site | Retired Date | Notes |
|---|---|---|---|
| — | — | — | None yet |

---

## Prime Firm Quick Reference

| Prime Firm | Projects |
|---|---|
| Arcadis | ATL114 |
| HKS | IAD534, IAD535, IAD536, IAD537 |
| Gensler | IAH100, LBB120, PDX070, PHX062, PHX069 |
| Corgan | PHX069, PHX070, PHX071 |
| S+R | PHX065, STL100, STL101, STL102, STL103 |

*Note: PHX069 — Corgan is prime but Gensler has prior involvement. Use Corgan for source priority scoring.*

---

## Change Log

| Version | Date | Changed By | Change |
|---------|------|------------|--------|
| 1.0 | 2026-03-24 | Gregory Bernardo | Ecosystem compliance update: added GOV-018 document ID, version number, fetch rule, Owner/Project fields, storage path reference. Corrected prime firms: IAH100 → Gensler, LBB120 → Gensler, PHX069 → Corgan. Moved AUS150 from Active to Placeholder (not yet awarded). Added PHX066 to Stale table. Added Prime Firm Quick Reference table. Fixed Maintained-by field to proper Owner/Consumers model. |
| — | 2026-03-24 | Gregory Bernardo | Initial registry created from full inbox sweep (Cowork initial setup run). 19 total codes found: 18 Active / 1 Stale (PHX066). |
