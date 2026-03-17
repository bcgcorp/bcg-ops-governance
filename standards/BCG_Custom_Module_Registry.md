# BCG Custom Module Registry
**Version:** 1.1
**Owner:** Victor Carrillo | **Authority:** Greg Bernardo | **Last Updated:** 2026-03-17

> Living document. Update whenever a module is created, modified, installed on r2-d2, or deprecated.
> **Coverage:** 7 of 17 installed modules catalogued. Track 2 repo audit required to catalog remaining 10.

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
| 7 | bcg_notification_center | Notification Center & Invoice Request | In Development | ❌ | dev-bcg-notification-center | 18.0.1.1.0 | base, mail, project, sale, account | Victor Carrillo | Phase A remediation in progress. Note: P7-004 subproject retired 2026-03-12 — development continues in P7 parent. |

---

## Uncatalogued Modules (Track 2 Audit Required)

10 additional modules are installed on R2-D2 but not yet catalogued in this registry. A Track 2 repo audit is required to populate entries 8–17. Fields marked "— confirm" on existing entries also require the Track 2 audit.

**Track 2 audit scope:** Walk all installed modules on R2-D2 (/opt/odoo/custom-addons/), reconcile against this registry, populate missing entries with technical name, version, dependencies, and repo location.

**Owner:** Victor Carrillo (execution) / Gregory Bernardo (approval)
**Target:** Q2 '26

---

## Change Log

| Version | Date | What Changed |
|---------|------|-------------|
| 1.1 | 2026-03-17 | Added note that 17 modules are installed, only 7 catalogued. Added Track 2 audit section. Updated bcg_notification_center entry to note P7-004 retirement. |
| 1.0 | 2026-03-07 | Baseline established CAP-15. 7 modules catalogued. |

---

*Baseline established CAP-15 · March 2026. GitHub bcg-ops-governance/standards/.*
