---
name: project-terraform-baseline
description: Recurring Terraform security gaps in this S3+CloudFront portfolio site (audit of 2026-10-02)
metadata:
  type: project
---

Stack: single main.tf (S3 + OAC + CloudFront default cert), no IAM/OIDC resources yet, backend.tf is fully commented out (local state).

Good already: public access block, OAC (not OAI), redirect-to-https, bucket policy scoped by AWS:SourceArn, versioning on.

Recurring gaps found: no SSE config, no response headers policy (CSP/X-Frame-Options), no CloudFront/S3 logging, no minimum_protocol_version (default cert pins TLSv1), no WAF, no TLS-only (aws:SecureTransport) bucket deny, no lifecycle for noncurrent versions, aws provider tags not default_tags, variable domain_name unused.
.gitignore line 1 is malformed (" .terraformterraform/.terraform/" merged on one line), so terraform/.terraform/ is NOT ignored; *.tfvars not ignored.

**Why:** baseline to compare against in future reviews.
**How to apply:** on re-audit, check which of these were fixed; also check for new IAM/OIDC (GitHub Actions) resources for wildcard and repo/branch scoping.
