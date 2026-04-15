# BCG Contact Blocklist

**Version:** 1.0
**Created:** 2026-04-15
**Owner:** Gregory Bernardo, President
**Purpose:** Domains and specific addresses excluded from associate research during automated email processing. Add entries here to suppress research on SaaS platforms, notification bots, and other non-human senders.

---

## Blocked Domains

These entire domains are ignored during contact research. Any email from these domains will not be looked up or added to `known-associates.md`.

### Project Management & Construction Tech
- `procoretech.com`
- `e-builder.net`
- `aconex.com`
- `autodesk.com`
- `bluebeam.com`
- `newforma.com`

### Document & Contract Platforms
- `docusign.com`
- `hellosign.com`
- `echosign.com`
- `pandadoc.com`
- `adobesign.com`

### Financial & Payment Services
- `americanexpress.com`
- `member.americanexpress.com`
- `chase.com`
- `bankofamerica.com`
- `wellsfargo.com`
- `stripe.com`
- `paypal.com`
- `intuit.com`
- `quickbooks.com`
- `bill.com`
- `expensify.com`

### Marketing & Email Platforms
- `mailchimp.com`
- `constantcontact.com`
- `hubspot.com`
- `marketo.com`
- `pardot.com`
- `klaviyo.com`
- `sendgrid.net`
- `sendgrid.com`
- `mailgun.com`

### CRM & Support Platforms
- `salesforce.com`
- `zendesk.com`
- `freshdesk.com`
- `intercom.io`

### Productivity & Collaboration Platforms
- `zoom.us`
- `webex.com`
- `calendly.com`
- `doodle.com`
- `eventbrite.com`
- `surveymonkey.com`
- `typeform.com`

### Cloud & IT Services
- `github.com`
- `gitlab.com`
- `atlassian.com`

### Job Boards & HR Platforms
- `indeed.com`
- `glassdoor.com`
- `linkedin.com`
- `ziprecruiter.com`

### Shipping & Logistics
- `ups.com`
- `fedex.com`
- `usps.com`

---

## Blocked Specific Addresses

These individual addresses are blocked regardless of domain. Use this section for notification bots and system accounts at domains that also have legitimate human senders (e.g. amazon.com, microsoft.com).

| Address | Reason |
|---------|--------|
| `AWS_Infrastructure@us02.procoretech.com` | Procore relay — not a person |
| `notifications@bcg-corp.com` | BCG Odoo system bot (OdooBot) |
| `noreply@bcg-corp.com` | BCG system no-reply |
| `admin@bcg-corp.com` | BCG system admin alias |

---

## Blocked Address Patterns

Matched against the local part of the email address (before `@`). Case-insensitive.

- `noreply`
- `no-reply`
- `donotreply`
- `do-not-reply`
- `notifications`
- `notification`
- `mailer-daemon`
- `postmaster`
- `bounce`
- `bounces`
- `automated`
- `system`
- `newsletter`
- `alert`
- `alerts`

---

## Change Log

| Version | Date | What Changed |
|---------|------|--------------|
| 1.0 | 2026-04-15 | Initial version. Seeded with standard SaaS/platform domains and BCG system addresses. |

---

*Maintained in `bcgcorp/bcg-ops-governance/standards/`. Update this file to suppress unwanted addresses from `known-associates.md`. Changes take effect on the next briefing run.*
