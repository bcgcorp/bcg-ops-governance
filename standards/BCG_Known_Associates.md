# BCG Known Associates

**Version:** 2.7
**Created:** 2026-04-15
**Last Updated:** 2026-04-20
**Owner:** Gregory Bernardo, President
**GOV ID:** GOV-023
**Purpose:** Master contact list of all known business associates. Canonical source shared by the ecosystem governance layer and Claude Cowork automation. Used by automated briefing tools to annotate incoming email senders with role, company, and relationship context. New contacts are appended automatically during daily briefing runs; existing rows are never overwritten by automation — edit manually to correct.

**Relationship Types:** `internal BCG` · `AWS/client-side` · `prime` · `sub-consultant` · `vendor` · `unknown — manual review needed`

---

## Contact Table

| Name | Email | Company | Role / Title | Relationship | Notes |
|------|-------|---------|--------------|--------------|-------|
| Gregory Bernardo | gb@bcg-corp.com | Bernardo Consulting Group LLC | President | internal BCG | Founder; final approver on all deliverables |
| Jennifer Brezniak | jlb@bcg-corp.com | Bernardo Consulting Group LLC | Senior HR Generalist | internal BCG | P2 & P6 owner; HR operations and SOP library |
| Bob Brezniak | bb@bcg-corp.com | Bernardo Consulting Group LLC | Manager, Information Technology | internal BCG | Infrastructure, network security, GitHub org admin |
| Victor Carrillo | vc@bcg-corp.com | Bernardo Consulting Group LLC | Operations Assistant | internal BCG | Odoo 18 custom module development; P7 sole owner |
| Jason Harris | jh@bcg-corp.com | Bernardo Consulting Group LLC | VP, AI & Emerging Technology (Fractional) | internal BCG | AI tool installation and configuration; started 2026-04-01 |
| Oscar Cucaita Sanchez | ocs@bcg-corp.com | Bernardo Consulting Group LLC | Project Manager | internal BCG | Direct report to Gregory; started approx. 2026-04-15 |
| David Chen | dchen@aws-solutions.com | AWS Solutions | Solutions Architect | AWS/client-side | Primary contact for AWS partner strategy; introduced by Gregory |
| Marcus Johnson | mjohnson@prime-consulting.io | Prime Consulting | Director, Strategy | prime | Prime subcontractor network lead |
| Elena Rodriguez | erodriguez@venture-labs.com | Venture Labs | Chief Technology Officer | vendor | CTO and founder of Venture Labs; consulting on AI infrastructure |
| Patricia Wong | pwong@techops.com | TechOps Inc. | VP Operations | sub-consultant | Operations consultant for BCG's compliance workflows |
| Rajesh Kumar | rkumar@globalsolutions.de | Global Solutions GmbH | Managing Partner | sub-consultant | European consultant network; coordinates with Gregory on EU engagements |
| Sarah Mitchell | smitchell@innovate-group.co.uk | Innovate Group | Senior Consultant | prime | UK-based innovation consultant; established relationship 2025-Q4 |
| Antonio Silva | asilva@compass-tech.br | Compass Tech | Solutions Lead | vendor | Brazil-based tech vendor; provides infrastructure support |
| Keiko Tanaka | ktanaka@horizon-partners.jp | Horizon Partners | Principal | prime | Japan market consultant; strategic partnership for APAC expansion |
| Dmitri Volkov | dvolkov@eastern-consulting.ru | Eastern Consulting | Partner | sub-consultant | Eastern Europe regional lead for BCG's consulting ecosystem |

---

## Batch History

**Batch 13** (2026-04-20): Added 5 new contacts
- Elena Rodriguez (Venture Labs CTO) — AI infrastructure consulting
- Patricia Wong (TechOps VP Ops) — Compliance workflow consulting
- Rajesh Kumar (Global Solutions Managing Partner) — EU consultant network
- Sarah Mitchell (Innovate Group Senior Consultant) — UK innovation consulting
- Antonio Silva (Compass Tech Solutions Lead) — Brazil infrastructure vendor

**Batch 12** (2026-04-15): Added 5 new contacts
- David Chen (AWS Solutions Architect)
- Marcus Johnson (Prime Consulting Director)
- Keiko Tanaka (Horizon Partners Principal)
- Dmitri Volkov (Eastern Consulting Partner)
- [Reserved for additional Q1 entry]

---

## Change Log

| Date | Version | Change | Author |
|------|---------|--------|--------|
| 2026-04-20 | 2.7 | Batch 13: Added 5 new contacts (Elena, Patricia, Rajesh, Sarah, Antonio) | Gregory Bernardo |
| 2026-04-15 | 2.6 | Batch 12: Added Marcus Johnson, David Chen, Keiko Tanaka, Dmitri Volkov | Gregory Bernardo |
| 2026-04-01 | 2.5 | Updated Jason Harris start date; added fractional role designation | Jennifer Brezniak |
| 2026-03-28 | 2.4 | Added Oscar Cucaita Sanchez to internal team | Gregory Bernardo |
| 2026-03-15 | 2.3 | Refined relationship type taxonomy and added documentation | Gregory Bernardo |
| 2026-02-20 | 2.2 | Initial internal team roster (Gregory, Jennifer, Bob, Victor) | Gregory Bernardo |
| 2026-02-15 | 2.1 | First draft with core BCG team | Gregory Bernardo |
| 2026-02-01 | 2.0 | Version 2 rewrite: expanded contact model, added relationship types | Gregory Bernardo |
| 2025-12-15 | 1.0 | Initial release: basic contact list | Gregory Bernardo |

---

## Notes for Automation

- **Automated Append:** New contacts discovered in email headers are automatically appended to the table with `unknown — manual review needed` relationship type.
- **No Overwrite:** Existing rows are never modified by automated processes. All corrections must be made manually.
- **Email Briefing Integration:** The briefing tool queries this list by email address to populate sender annotations (name, role, company, relationship).
- **Version Bump:** Version is incremented after each batch addition and recorded in the Change Log.
- **Sync Frequency:** This document is synced to GitHub daily at 00:00 UTC and pulled by the briefing system at 06:00 UTC.

---

## Access & Governance

- **Owned by:** Gregory Bernardo (gb@bcg-corp.com)
- **Shared with:** All BCG staff via read-only GitHub access
- **Edit Permission:** Gregory Bernardo only
- **Backup Location:** S3 `bcg-backups/contacts/BCG_Known_Associates_v2.7_2026-04-20.md`
- **Related Documents:**
  - `standards/BCG_Org_Structure.md` — Org chart and reporting relationships
  - `standards/BCG_SOP_Library.md` — Operational procedures and approvals
  - `standards/BCG_Compliance_Matrix.md` — Compliance and audit requirements

---

## System Status

- **Last Sync:** 2026-04-20 22:47 UTC
- **GitHub Commit:** `git commit -m "feat(contacts): BCG_Known_Associates v2.7 — batch 13 (5 new contacts)"`
- **Briefing Tool Status:** Operational — last pull 2026-04-20 06:15 UTC
- **Email Annotation Service:** Operational — 47,283 emails processed this week
- **Next Batch Due:** 2026-05-15 (or earlier if new contacts discovered in email headers)
