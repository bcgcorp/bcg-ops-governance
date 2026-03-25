# BCG Project Code Registry

**Document ID:** GOV-018
**Version:** 2.2
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

This file is the single source of truth for recognized BCG project codes and campus groupings. It is read at each 4am Cowork run and at each 5pm Team Project consolidation to determine whether a project code extracted from email or staff submissions is registered or unregistered.

- **Active codes** — processed at standard confidence (High or Medium depending on source quality)
- **Placeholder codes** — expected in early-stage communications before formal award; processed at Medium confidence
- **Non-standard codes** — projects that do not match `[A-Z]{3}[0-9]{3}`; listed explicitly so Cowork does not flag them as unrecognized
- **Unrecognized codes** — any token not in any table below; flagged Low confidence; Cory reviews in Odoo before approving

**Campus definition:** A campus is the top-level grouping of related projects at a physical site. Campus code = parent project code in Odoo. All projects under a campus inherit the campus prime firm unless explicitly noted otherwise.

**Site derivation:** Site = first 3 letters of the campus code (e.g., campus ATL114 → site ATL). For non-standard campuses, site is listed explicitly.

**To add a new project:** Append a row to the Active table and commit. Change takes effect at the next 4am Cowork run.

---

## Active Projects

Sorted by Campus, then Project Code. Projects inherit campus prime firm unless Notes column states otherwise.

| Campus | Project Code | Site | Prime Firm | Registered Date | Notes |
|---|---|---|---|---|---|
| AMA200 | AMA200 | AMA | Arcadis | 2026-03-24 | Confirmed |
| AMA200 | AMA201 | AMA | Arcadis | 2026-03-24 | Inherits campus prime |
| ATL068 | ATL068 | ATL | Arcadis | 2026-03-24 | Confirmed |
| ATL068 | ATL069 | ATL | Arcadis | 2026-03-24 | Inherits campus prime |
| ATL068 | ATL070 | ATL | Arcadis | 2026-03-24 | Inherits campus prime |
| ATL068 | ATL071 | ATL | Arcadis | 2026-03-24 | Inherits campus prime |
| ATL089 | ATL085 | ATL | Arcadis | 2026-03-24 | Inherits campus prime |
| ATL089 | ATL087 | ATL | Arcadis | 2026-03-24 | Inherits campus prime |
| ATL089 | ATL089 | ATL | Arcadis | 2026-03-24 | Confirmed |
| ATL089 | ATL092 | ATL | Arcadis | 2026-03-24 | Inherits campus prime |
| ATL089 | ATL093 | ATL | Arcadis | 2026-03-24 | Inherits campus prime |
| ATL089 | ATL094 | ATL | Arcadis | 2026-03-24 | Inherits campus prime |
| ATL089 | ATL095 | ATL | Arcadis | 2026-03-24 | Inherits campus prime |
| ATL089 | ATL096 | ATL | Arcadis | 2026-03-24 | Inherits campus prime |
| ATL089 | ATL097 | ATL | Arcadis | 2026-03-24 | Inherits campus prime |
| ATL089 | ATL098 | ATL | Arcadis | 2026-03-24 | Inherits campus prime |
| ATL089 | ATL110 | ATL | Arcadis | 2026-03-24 | Inherits campus prime |
| ATL089 | ATL111 | ATL | Arcadis | 2026-03-24 | Inherits campus prime |
| ATL089 | ATL112 | ATL | Arcadis | 2026-03-24 | Inherits campus prime |
| ATL114 | ATL114 | ATL | Arcadis | 2026-03-24 | Confirmed |
| ATL114 | ATL115 | ATL | Arcadis | 2026-03-24 | Inherits campus prime |
| ATL114 | ATL116 | ATL | Arcadis | 2026-03-24 | Inherits campus prime |
| ATL114 | ATL117 | ATL | Arcadis | 2026-03-24 | Inherits campus prime |
| CMH116 | CMH116 | CMH | Arcadis | 2026-03-24 | Confirmed |
| CMH116 | CMH120 | CMH | Arcadis | 2026-03-24 | Inherits campus prime |
| CMH116 | CMH121 | CMH | Arcadis | 2026-03-24 | Inherits campus prime |
| CMH116 | CMH122 | CMH | Arcadis | 2026-03-24 | Inherits campus prime |
| CMH116 | CMH124 | CMH | Arcadis | 2026-03-24 | Inherits campus prime |
| CMH165 | CMH165 | CMH | Arcadis | 2026-03-24 | Confirmed |
| CMH165 | CMH166 | CMH | Arcadis | 2026-03-24 | Inherits campus prime |
| CMH165 | CMH167 | CMH | Arcadis | 2026-03-24 | Inherits campus prime |
| CMH165 | CMH168 | CMH | Arcadis | 2026-03-24 | Inherits campus prime |
| CMH165 | CMH169 | CMH | Arcadis | 2026-03-24 | Inherits campus prime |
| CMH165 | CMH172 | CMH | Arcadis | 2026-03-24 | Inherits campus prime |
| CMH165 | CMH173 | CMH | Arcadis | 2026-03-24 | Inherits campus prime |
| CMH165 | CMH174 | CMH | Arcadis | 2026-03-24 | Inherits campus prime |
| CMH170 | CMH170 | CMH | Arcadis | 2026-03-24 | Confirmed |
| CMH232 | CMH229 | CMH | Arcadis | 2026-03-24 | Inherits campus prime; note: code < campus code |
| CMH232 | CMH232 | CMH | Arcadis | 2026-03-24 | Confirmed |
| CMH232 | CMH233 | CMH | Arcadis | 2026-03-24 | Inherits campus prime |
| CMH232 | CMH234 | CMH | Arcadis | 2026-03-24 | Inherits campus prime |
| CMH232 | CMH235 | CMH | Arcadis | 2026-03-24 | Inherits campus prime |
| CMH232 | CMH236 | CMH | Arcadis | 2026-03-24 | Inherits campus prime |
| CMH232 | CMH237 | CMH | Arcadis | 2026-03-24 | Inherits campus prime |
| CMH243 | CMH243 | CMH | Atlantic AE | 2026-03-24 | Confirmed |
| IAD245 | IAD245 | IAD | HKS | 2026-03-24 | Confirmed |
| IAD245 | IAD246 | IAD | HKS | 2026-03-24 | Inherits campus prime |
| IAD245 | IAD247 | IAD | HKS | 2026-03-24 | Inherits campus prime |
| IAD245 | IAD248 | IAD | HKS | 2026-03-24 | Inherits campus prime |
| IAD534 | IAD534 | IAD | HKS | 2026-03-24 | Confirmed |
| IAD534 | IAD535 | IAD | HKS | 2026-03-24 | Inherits campus prime |
| IAD534 | IAD536 | IAD | HKS | 2026-03-24 | Inherits campus prime |
| IAD534 | IAD537 | IAD | HKS | 2026-03-24 | Inherits campus prime |
| IAH100 | IAH100 | IAH | Gensler | 2026-03-24 | Confirmed |
| IAH100 | IAH101 | IAH | Gensler | 2026-03-24 | Inherits campus prime |
| IAH100 | IAH102 | IAH | Gensler | 2026-03-24 | Inherits campus prime |
| IAH100 | IAH103 | IAH | Gensler | 2026-03-24 | Inherits campus prime |
| IAH100 | IAH104 | IAH | Gensler | 2026-03-24 | Inherits campus prime |
| LBB120 | LBB120 | LBB | Gensler | 2026-03-24 | Confirmed |
| PBI100 | PBI100 | PBI | Arcadis | 2026-03-24 | Confirmed |
| PDX070 | PDX070 | PDX | Gensler | 2026-03-24 | Confirmed |
| PHL130 | PHL130 | PHL | Arcadis | 2026-03-24 | Confirmed |
| PHX062 | PHX062 | PHX | Gensler | 2026-03-24 | Confirmed; 60% Restart in progress |
| PHX062 | PHX063 | PHX | Gensler | 2026-03-24 | Inherits campus prime |
| PHX065 | PHX065 | PHX | Gensler | 2026-03-24 | Confirmed |
| PHX065 | PHX066 | PHX | Gensler | 2026-03-24 | Inherits campus prime |
| PHX069 | PHX069 | PHX | Corgan | 2026-03-24 | Confirmed |
| PHX069 | PHX070 | PHX | Corgan | 2026-03-24 | Inherits campus prime; paired with PHX071 |
| PHX069 | PHX071 | PHX | Corgan | 2026-03-24 | Inherits campus prime; paired with PHX070 |
| STL100 | STL100 | STL | HKS | 2026-03-24 | Confirmed |
| STL100 | STL101 | STL | HKS | 2026-03-24 | Inherits campus prime |
| STL100 | STL102 | STL | HKS | 2026-03-24 | Inherits campus prime |
| STL100 | STL103 | STL | HKS | 2026-03-24 | Inherits campus prime |
| YUL065 | YUL065 | YUL | S+R | 2026-03-24 | Confirmed |
| YUL091 | YUL091 | YUL | S+R | 2026-03-24 | Confirmed |
| YYC060 | YYC060 | YYC | S+R | 2026-03-24 | Confirmed |

---

## Non-Standard Projects (BOD Titus Campus)

These projects do not match the standard `[A-Z]{3}[0-9]{3}` format and will not be caught by Cowork's email regex. Listed explicitly to prevent false-positive Low confidence if encountered.

BOD Titus is an active client engagement with a non-standard project naming convention.

| Campus | Project Code | Site | Prime Firm | Notes |
|---|---|---|---|---|
| BOD Titus | TDCSi v1.1 3s | BOD | Arcadis | Active client engagement; non-standard naming convention; not caught by regex `[A-Z]{3}[0-9]{3}` |
| BOD Titus | TDCSi v1.2 1s | BOD | Arcadis | Active client engagement; non-standard naming |
| BOD Titus | TDCSi v1.2 2s | BOD | Arcadis | Active client engagement; non-standard naming |

---

## Placeholder Codes (Anticipated — Not Yet Awarded)

| Code | Site | Expected Prime | Notes |
|---|---|---|---|
| AUS150 | AUS | TBD | AWS Austin — anticipated award. Not yet in Odoo as of 2026-03-24. |

---

## Retired / Archived Codes

| Project Code | Campus | Site | Retired Date | Notes |
|---|---|---|---|---|
| — | — | — | — | None yet |

---

## Prime Firm Quick Reference

| Prime Firm | Campuses | Project Count |
|---|---|---|
| Arcadis | AMA200, ATL068, ATL089, ATL114, BOD Titus, CMH116, CMH165, CMH170, CMH232, PBI100, PHL130 | 46 standard + 3 non-standard = 49 |
| HKS | IAD245, IAD534, STL100 | 12 |
| Gensler | IAH100, LBB120, PDX070, PHX062, PHX065 | 11 |
| Corgan | PHX069 | 3 |
| S+R | YUL065, YUL091, YYC060 | 3 |
| Atlantic AE | CMH243 | 1 |

---

## Campus Registry Summary

| Campus | Site | Project Count | Prime | Prime Confirmed |
|---|---|---|---|---|
| AMA200 | AMA | 2 | Arcadis | ✅ |
| ATL068 | ATL | 4 | Arcadis | ✅ |
| ATL089 | ATL | 13 | Arcadis | ✅ |
| ATL114 | ATL | 4 | Arcadis | ✅ |
| BOD Titus | BOD | 3 (non-std) | Arcadis | ✅ |
| CMH116 | CMH | 5 | Arcadis | ✅ |
| CMH165 | CMH | 8 | Arcadis | ✅ |
| CMH170 | CMH | 1 | Arcadis | ✅ |
| CMH232 | CMH | 7 | Arcadis | ✅ |
| CMH243 | CMH | 1 | Atlantic AE | ✅ |
| IAD245 | IAD | 4 | HKS | ✅ |
| IAD534 | IAD | 4 | HKS | ✅ |
| IAH100 | IAH | 5 | Gensler | ✅ |
| LBB120 | LBB | 1 | Gensler | ✅ |
| PBI100 | PBI | 1 | Arcadis | ✅ |
| PDX070 | PDX | 1 | Gensler | ✅ |
| PHL130 | PHL | 1 | Arcadis | ✅ |
| PHX062 | PHX | 2 | Gensler | ✅ |
| PHX065 | PHX | 2 | Gensler | ✅ |
| PHX069 | PHX | 3 | Corgan | ✅ |
| STL100 | STL | 4 | HKS | ✅ |
| YUL065 | YUL | 1 | S+R | ✅ |
| YUL091 | YUL | 1 | S+R | ✅ |
| YYC060 | YYC | 1 | S+R | ✅ |
| **TOTAL** | | **79 std + 3 non-std = 82** | | **24 of 24 confirmed ✅** |

---

## Change Log

| Version | Date | Changed By | Change |
|---|---|---|---|
| 2.2 | 2026-03-24 | Gregory Bernardo | Clarified BOD Titus as active client engagement with non-standard naming convention. Removed ambiguous client/purpose warning. |
| 2.1 | 2026-03-24 | Gregory Bernardo | All 24 campus primes confirmed. Fixed 4 emoji copy-paste artifacts. Corrected YYC060 site YUL→YYC. Rebuilt Prime Firm Quick Reference (6 firms). Campus Summary 24/24 ✅. Total: 79 standard + 3 non-standard = 82 across 24 campuses and 14 sites. |
| 2.0 | 2026-03-24 | Gregory Bernardo | Major restructure from Odoo project export. Added Campus column. 61 net-new project codes. Promoted PHX066 from Stale. Replaced generic YUL/CMH placeholders. Added BOD Titus. |
| 1.0 | 2026-03-24 | Gregory Bernardo | Ecosystem compliance update: GOV-018 document ID, version, fetch rule, corrected primes, Placeholder/Stale tables, Prime Firm Reference. |
| — | 2026-03-24 | Gregory Bernardo | Initial registry created from full inbox sweep (Cowork Phase 1). |
