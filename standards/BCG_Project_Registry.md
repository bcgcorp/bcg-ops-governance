# BCG Project Code Registry

**Document ID:** GOV-018
**Version:** 2.0
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
| AMA200 | AMA200 | AMA | TBD ⚠️ | 2026-03-24 | Prime confirmation needed |
| AMA200 | AMA201 | AMA | TBD ⚠️ | 2026-03-24 | Inherits campus prime |
| ATL068 | ATL068 | ATL | TBD ⚠️ | 2026-03-24 | Prime confirmation needed |
| ATL068 | ATL069 | ATL | TBD ⚠️ | 2026-03-24 | Inherits campus prime |
| ATL068 | ATL070 | ATL | TBD ⚠️ | 2026-03-24 | Inherits campus prime |
| ATL068 | ATL071 | ATL | TBD ⚠️ | 2026-03-24 | Inherits campus prime |
| ATL089 | ATL085 | ATL | TBD ⚠️ | 2026-03-24 | Inherits campus prime |
| ATL089 | ATL087 | ATL | TBD ⚠️ | 2026-03-24 | Inherits campus prime |
| ATL089 | ATL089 | ATL | TBD ⚠️ | 2026-03-24 | Prime confirmation needed |
| ATL089 | ATL092 | ATL | TBD ⚠️ | 2026-03-24 | Inherits campus prime |
| ATL089 | ATL093 | ATL | TBD ⚠️ | 2026-03-24 | Inherits campus prime |
| ATL089 | ATL094 | ATL | TBD ⚠️ | 2026-03-24 | Inherits campus prime |
| ATL089 | ATL095 | ATL | TBD ⚠️ | 2026-03-24 | Inherits campus prime |
| ATL089 | ATL096 | ATL | TBD ⚠️ | 2026-03-24 | Inherits campus prime |
| ATL089 | ATL097 | ATL | TBD ⚠️ | 2026-03-24 | Inherits campus prime |
| ATL089 | ATL098 | ATL | TBD ⚠️ | 2026-03-24 | Inherits campus prime |
| ATL089 | ATL110 | ATL | TBD ⚠️ | 2026-03-24 | Inherits campus prime |
| ATL089 | ATL111 | ATL | TBD ⚠️ | 2026-03-24 | Inherits campus prime |
| ATL089 | ATL112 | ATL | TBD ⚠️ | 2026-03-24 | Inherits campus prime |
| ATL114 | ATL114 | ATL | Arcadis | 2026-03-24 | Confirmed |
| ATL114 | ATL115 | ATL | Arcadis | 2026-03-24 | Inherits campus prime |
| ATL114 | ATL116 | ATL | Arcadis | 2026-03-24 | Inherits campus prime |
| ATL114 | ATL117 | ATL | Arcadis | 2026-03-24 | Inherits campus prime |
| CMH116 | CMH116 | CMH | TBD ⚠️ | 2026-03-24 | Prime confirmation needed |
| CMH116 | CMH120 | CMH | TBD ⚠️ | 2026-03-24 | Inherits campus prime |
| CMH116 | CMH121 | CMH | TBD ⚠️ | 2026-03-24 | Inherits campus prime |
| CMH116 | CMH122 | CMH | TBD ⚠️ | 2026-03-24 | Inherits campus prime |
| CMH116 | CMH124 | CMH | TBD ⚠️ | 2026-03-24 | Inherits campus prime |
| CMH165 | CMH165 | CMH | TBD ⚠️ | 2026-03-24 | Prime confirmation needed |
| CMH165 | CMH166 | CMH | TBD ⚠️ | 2026-03-24 | Inherits campus prime |
| CMH165 | CMH167 | CMH | TBD ⚠️ | 2026-03-24 | Inherits campus prime |
| CMH165 | CMH168 | CMH | TBD ⚠️ | 2026-03-24 | Inherits campus prime |
| CMH165 | CMH169 | CMH | TBD ⚠️ | 2026-03-24 | Inherits campus prime |
| CMH165 | CMH172 | CMH | TBD ⚠️ | 2026-03-24 | Inherits campus prime |
| CMH165 | CMH173 | CMH | TBD ⚠️ | 2026-03-24 | Inherits campus prime |
| CMH165 | CMH174 | CMH | TBD ⚠️ | 2026-03-24 | Inherits campus prime |
| CMH170 | CMH170 | CMH | TBD ⚠️ | 2026-03-24 | Prime confirmation needed |
| CMH232 | CMH229 | CMH | TBD ⚠️ | 2026-03-24 | Inherits campus prime; note: code < campus code |
| CMH232 | CMH232 | CMH | TBD ⚠️ | 2026-03-24 | Prime confirmation needed |
| CMH232 | CMH233 | CMH | TBD ⚠️ | 2026-03-24 | Inherits campus prime |
| CMH232 | CMH234 | CMH | TBD ⚠️ | 2026-03-24 | Inherits campus prime |
| CMH232 | CMH235 | CMH | TBD ⚠️ | 2026-03-24 | Inherits campus prime |
| CMH232 | CMH236 | CMH | TBD ⚠️ | 2026-03-24 | Inherits campus prime |
| CMH232 | CMH237 | CMH | TBD ⚠️ | 2026-03-24 | Inherits campus prime |
| CMH243 | CMH243 | CMH | TBD ⚠️ | 2026-03-24 | Prime confirmation needed |
| IAD245 | IAD245 | IAD | TBD ⚠️ | 2026-03-24 | Prime confirmation needed — possibly HKS, confirm with Cory |
| IAD245 | IAD246 | IAD | TBD ⚠️ | 2026-03-24 | Inherits campus prime |
| IAD245 | IAD247 | IAD | TBD ⚠️ | 2026-03-24 | Inherits campus prime |
| IAD245 | IAD248 | IAD | TBD ⚠️ | 2026-03-24 | Inherits campus prime |
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
| PBI100 | PBI100 | PBI | TBD ⚠️ | 2026-03-24 | Prime confirmation needed |
| PDX070 | PDX070 | PDX | Gensler | 2026-03-24 | Confirmed |
| PHL130 | PHL130 | PHL | TBD ⚠️ | 2026-03-24 | Prime confirmation needed |
| PHX062 | PHX062 | PHX | Gensler | 2026-03-24 | Confirmed; 60% Restart in progress |
| PHX062 | PHX063 | PHX | Gensler | 2026-03-24 | Inherits campus prime |
| PHX065 | PHX065 | PHX | S+R | 2026-03-24 | Confirmed |
| PHX065 | PHX066 | PHX | S+R | 2026-03-24 | Inherits campus prime; promoted from Stale 2026-03-24 |
| PHX069 | PHX069 | PHX | Corgan | 2026-03-24 | Confirmed |
| PHX069 | PHX070 | PHX | Corgan | 2026-03-24 | Inherits campus prime; paired with PHX071 |
| PHX069 | PHX071 | PHX | Corgan | 2026-03-24 | Inherits campus prime; paired with PHX070 |
| STL100 | STL100 | STL | S+R | 2026-03-24 | Confirmed |
| STL100 | STL101 | STL | S+R | 2026-03-24 | Inherits campus prime; Building B TI |
| STL100 | STL102 | STL | S+R | 2026-03-24 | Inherits campus prime; Building C TI |
| STL100 | STL103 | STL | S+R | 2026-03-24 | Inherits campus prime; Building D TI |
| YUL065 | YUL065 | YUL | TBD ⚠️ | 2026-03-24 | Prime confirmation needed |
| YUL091 | YUL091 | YUL | TBD ⚠️ | 2026-03-24 | Prime confirmation needed |

---

## Non-Standard Projects (BOD Titus Campus)

These projects do not match the standard `[A-Z]{3}[0-9]{3}` format and will not be caught by Cowork's email regex. Listed explicitly to prevent false-positive Low confidence if encountered.

⚠️ **Client/purpose unclear — Gregory to confirm whether BOD Titus is an active client engagement or internal tool project.**

| Campus | Project Code | Site | Prime Firm | Notes |
|---|---|---|---|---|
| BOD Titus | TDCSi v1.1 3s | BOD | TBD | Non-standard naming; not caught by regex `[A-Z]{3}[0-9]{3}` |
| BOD Titus | TDCSi v1.2 1s | BOD | TBD | Non-standard naming |
| BOD Titus | TDCSi v1.2 2s | BOD | TBD | Non-standard naming |

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

## Prime Confirmation Needed

The following campus prime firms are unconfirmed. Gregory or Cory to verify. Until confirmed, all projects in these campuses score at Medium confidence maximum.

| Campus | Site | Projects | Possible Prime | Action |
|---|---|---|---|---|
| AMA200 | AMA | AMA200, AMA201 | Unknown | Confirm with Gregory |
| ATL068 | ATL | ATL068–071 | Unknown | Confirm with Gregory |
| ATL089 | ATL | ATL085, ATL087, ATL089, ATL092–098, ATL110–112 | Unknown | Confirm with Gregory — large campus, high priority |
| BOD Titus | BOD | TDCSi v1.1–1.2 | Unknown | Gregory to confirm client/purpose |
| CMH116 | CMH | CMH116, CMH120–122, CMH124 | Unknown | Confirm with Gregory |
| CMH165 | CMH | CMH165–169, CMH172–174 | Unknown | Confirm with Gregory |
| CMH170 | CMH | CMH170 | Unknown | Confirm with Gregory |
| CMH232 | CMH | CMH229, CMH232–237 | Unknown | Confirm with Gregory |
| CMH243 | CMH | CMH243 | Unknown | Confirm with Gregory |
| IAD245 | IAD | IAD245–248 | Possibly HKS | Confirm with Cory |
| PBI100 | PBI | PBI100 | Unknown | Confirm with Gregory |
| PHL130 | PHL | PHL130 | Unknown | Confirm with Gregory |
| YUL065 | YUL | YUL065 | Unknown | Confirm with Gregory |
| YUL091 | YUL | YUL091 | Unknown | Confirm with Gregory |

---

## Prime Firm Quick Reference (Confirmed Only)

| Prime Firm | Campuses | Projects |
|---|---|---|
| Arcadis | ATL114 | ATL114, ATL115, ATL116, ATL117 |
| Gensler | IAH100, LBB120, PDX070, PHX062 | IAH100–104, LBB120, PDX070, PHX062, PHX063 |
| HKS | IAD534 | IAD534, IAD535, IAD536, IAD537 |
| Corgan | PHX069 | PHX069, PHX070, PHX071 |
| S+R | PHX065, STL100 | PHX065, PHX066, STL100, STL101, STL102, STL103 |

---

## Campus Registry Summary

| Campus | Site | Project Count | Prime | Prime Confirmed |
|---|---|---|---|---|
| AMA200 | AMA | 2 | TBD | ❌ |
| ATL068 | ATL | 4 | TBD | ❌ |
| ATL089 | ATL | 13 | TBD | ❌ |
| ATL114 | ATL | 4 | Arcadis | ✅ |
| BOD Titus | BOD | 3 | TBD | ❌ |
| CMH116 | CMH | 5 | TBD | ❌ |
| CMH165 | CMH | 8 | TBD | ❌ |
| CMH170 | CMH | 1 | TBD | ❌ |
| CMH232 | CMH | 7 | TBD | ❌ |
| CMH243 | CMH | 1 | TBD | ❌ |
| IAD245 | IAD | 4 | TBD | ❌ |
| IAD534 | IAD | 4 | HKS | ✅ |
| IAH100 | IAH | 5 | Gensler | ✅ |
| LBB120 | LBB | 1 | Gensler | ✅ |
| PBI100 | PBI | 1 | TBD | ❌ |
| PDX070 | PDX | 1 | Gensler | ✅ |
| PHL130 | PHL | 1 | TBD | ❌ |
| PHX062 | PHX | 2 | Gensler | ✅ |
| PHX065 | PHX | 2 | S+R | ✅ |
| PHX069 | PHX | 3 | Corgan | ✅ |
| STL100 | STL | 4 | S+R | ✅ |
| YUL065 | YUL | 1 | TBD | ❌ |
| YUL091 | YUL | 1 | TBD | ❌ |
| **TOTAL** | | **78** | | **9 of 23 confirmed** |

---

## Change Log

| Version | Date | Changed By | Change |
|---|---|---|---|
| 2.0 | 2026-03-24 | Gregory Bernardo | Major restructure from Odoo project export. Added Campus column and Campus Registry Summary. Added 61 net-new project codes across 16 new campuses. Promoted PHX066 from Stale to Active (campus PHX065, S+R prime). Applied campus prime inheritance rule — PHX063, IAH101–104, ATL115–117 now have confirmed primes. Replaced generic YUL and CMH placeholders with specific campus codes (YUL065, YUL091; CMH116/165/170/232/243). Added BOD Titus non-standard campus. Added Prime Confirmation Needed section (14 campuses pending). Active count: 75 standard + 3 non-standard = 78 total. |
| 1.0 | 2026-03-24 | Gregory Bernardo | Ecosystem compliance update: GOV-018 document ID, version, fetch rule, corrected primes, moved AUS150 to Placeholder, added PHX066 to Stale, Prime Firm Reference table. |
| — | 2026-03-24 | Gregory Bernardo | Initial registry created from full inbox sweep (Cowork initial setup run). |
