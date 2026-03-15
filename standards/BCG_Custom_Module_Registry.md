# BCG Custom Module Registry
**Version:** 1.1
**Owner:** Victor Carrillo | **Authority:** Greg Bernardo | **Last Updated:** 2026-03-15

> Living document. Update whenever a module is created, modified, installed on r2-d2, or deprecated.
>
> ⚠️ **AUDIT GAP — Track 2 incomplete:** This registry reflects 7 of 17 modules confirmed installed on R2-D2 (Infrastructure Inventory v1.2, Section 7). The remaining 10 modules are not yet catalogued here. Victor Carrillo to complete Track 2 repo audit and fill all "— confirm" fields. Until complete, treat this registry as partial. Do not use it as a definitive list of what is installed.

---

## Status Key
`Complete/Installed` · `In Development` · `Draft Only` · `Testing` · `Deprecated`

---

## Registry

| # | Technical Name | Display Name | Status | Prod (r2-d2) | Repo Location | Version | Dependencies | Owner | Open Items |
|---|---------------|--------------|--------|:------------:|---------------|---------|--------------|-------|------------|
| 1 | fix_field_searchable_warnings | Fix Field Searchable Warnings | Complete/Installed | ✅ | — confirm | — confirm | 3rd-party (confirm name) | BCG Corp | None |
| 2 | project_milestone_matrix | Project Milestone Matrix View | Draft Only | ❌ | — confirm | — confirm | project | BCG Corp | Active or parked? — Greg decision needed |
| 3 | task_list_row_decorations | Task List Row Decorations | Complete/Installed | ✅ | — confirm | — confirm | project | BCG Corp | None |
| 4 | selection_field_attribute_sort | Selection Field Attribute Sort | Complete/Installed | ✅ | — confirm | — confirm | base | BCG Corp | None |
| 5 | helpdesk_sms_twilio | Helpdesk SMS — Twilio Integration | Complete/Installed | ✅ | — confirm | — confirm | helpdesk, mail | BCG Corp | Confirm Twilio credential storage method |
| 6 | email_bounce_back_handler | Email Bounce-Back Handler | Draft Only | ❌ | — confirm | — confirm | mail | BCG Corp | Pending P5 CAP-18a coordination |
| 7 | bcg_notification_center | Notification Center & Invoice Request | In Development | ❌ | dev-bcg-notification-center | 18.0.1.1.0 | base, mail, project, sale, account | Victor Carrillo | Phase A remediation in progress — see P7 (I-number TBD; P7-004 retired 2026-03-12, work continues in P7 parent) |

---

## Track 2 Audit Status

| Field | Status |
|-------|--------|
| Modules catalogued | 7 of 17 |
| Fields with "— confirm" | Repo Location, Version, Dependencies (rows 1–6) |
| Owner | Victor Carrillo |
| Target | Q2 '26 |
| Blocking | Full registry cannot be used as authoritative list until complete |

---

## Change Log

| Version | Date | What Changed |
|---------|------|-------------|
| 1.1 | 2026-03-15 | Added audit gap warning — registry covers 7 of 17 installed modules (Infrastructure Inventory v1.2 source). Row 7 open items: replaced "P7-004 brief" reference (P7-004 retired 2026-03-12) with note that work continues in P7 parent. Added Track 2 Audit Status table. |
| 1.0 | 2026-03-07 | Baseline established CAP-15 · March 2026. Fields marked "— confirm" require Track 2 repo audit. |

---

*Baseline established CAP-15 · March 2026. Fields marked "— confirm" require Track 2 repo audit.*
