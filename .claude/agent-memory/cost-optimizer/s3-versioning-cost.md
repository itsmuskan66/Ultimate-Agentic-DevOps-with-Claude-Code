---
name: s3-versioning-cost
description: S3 versioning enabled on static portfolio site bucket, incurring unnecessary version storage costs
metadata:
  type: project
---

## Current State
S3 bucket `portfolio-site-{account-id}` has versioning **enabled** via `aws_s3_bucket_versioning.website_bucket_versioning` with status "Enabled".

## Problem
For a static marketing/portfolio website that does not require version recovery, versioning incurs unnecessary costs:
- Each updated file creates a new version (stored separately)
- Old versions are retained indefinitely and charged at Standard storage rates
- No lifecycle rules exist to expire old versions

**Why:** Static sites have no business requirement for version history. Deployments via Terraform replace entire bucket contents.

**How to apply:** For this project, disable versioning and add lifecycle rules if any non-current versions need cleanup.

## Estimated Impact
- Depends on update frequency. For typical static site (monthly updates): saves ~$0.50-2/month in storage
- More significant savings if bucket accumulates many versions before being discovered
