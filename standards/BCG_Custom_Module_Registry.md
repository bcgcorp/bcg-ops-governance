# BCG Custom Module Registry
**Version:** 1.1
**Owner:** Victor Carrillo | **Authority:** Greg Bernardo | **Last Updated:** 2026-03-17

> Living document. Update whenever a module is created, modified, installed on r2-d2, or deprecated.
> **Source of truth:** GitHub (`bcg-ops-governance/standards/`). Per GOV-001, GitHub is the authoritative fetch source.
> **Scope:** All Claude Projects (P0-P10) and subprojects.

---

## Status Key
`Complete/Installed` . `In Development` . `Draft Only` . `Testing` . `Deprecated`

---

## Registry

| # | Technical Name | Display Name | Status | Prod (r2-d2) | Repo Location | Version | Dependencies | Owner | Open Items |
|---|---------------|--------------|--------|:------------:|---------------|---------|--------------|-------|------------|
| 1 | fix_field_searchable_warnings | Fix Field Searchable Warnings | Complete/Installed | Yes | — confirm | — confirm | 3rd-party (confirm name) | BCG Corp | None |
| 2 | project_milestone_matrix | Project Milestone Matrix View | Draft Only | No | — confirm | — confirm | project | BCG Corp | Active or parked? — Greg decision needed |
| 3 | task_list_row_decorations | Task List Row Decorations | Complete/Installed | Yes | — confirm | — confirm | project | BCG Corp | None |
| 4 | selection_field_attribute_sort | Selection Field Attribute Sort | Complete/Installed | Yes | — confirm | — confirm | base | BCG Corp | None |
| 5 | helpdesk_sms_twilio | Helpdesk SMS — Twilio Integration | Complete/Installed | Yes | — confirm | — confirm | helpdesk, mail | BCG Corp | Confirm Twilio credential storage method |
| 6 | email_bounce_back_handler | Email Bounce-Back Handler | Draft Only | No | — confirm | — confirm | mail | BCG Corp | Pending P5 CAP-18a coordination |
| 7 | bcg_notification_center | Notification Center & Invoice Request | In Development | No | dev-bcg-notification-center | 18.0.1.1.0 | base, mail, project, sale, account | Victor Carrillo | Phase A remediation in progress — see I-56 |

**Total catalogued:** 7 of 17 installed modules. Track 2 repo audit pending to catalog remaining 10.

---

## Change Log

| Version | Date | What Changed |
|---------|------|-------------|
| 1.1 | 2026-03-17 | Updated scope to P0-P10. Added GitHub source of truth reference. Updated I-56 reference (was P7-004, now consolidated). Confirmed 7 of 17 modules catalogued. |
| 1.0 | 2026-03-07 | Baseline established CAP-15. |

---

*Baseline established CAP-15. Fields marked confirm require Track 2 repo audit.*