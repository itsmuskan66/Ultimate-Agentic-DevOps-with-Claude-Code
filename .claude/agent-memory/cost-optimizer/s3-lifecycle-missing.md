---
name: s3-lifecycle-missing
description: No S3 lifecycle policies configured to expire old object versions or manage object retention
metadata:
  type: project
---

## Current State
S3 bucket has no `aws_s3_bucket_lifecycle_configuration` resource defined. If versioning remains enabled, all old versions accumulate indefinitely.

## Problem
Without lifecycle rules:
- Non-current object versions persist forever at Standard storage rates
- No archival of infrequently accessed objects
- No automatic deletion of incomplete multipart uploads (minor cost)

**Why:** Lifecycle policies prevent cost drift as bucket content grows.

**How to apply:** Add lifecycle configuration to either:
1. Delete non-current versions after 30 days (recommended if versioning stays)
2. Transition objects to Intelligent-Tiering after 30 days (if infrequent access patterns exist)
3. Delete incomplete multipart uploads after 7 days (standard cleanup)

## Terraform Example (if versioning remains)
```hcl
resource "aws_s3_bucket_lifecycle_configuration" "website_lifecycle" {
  bucket = aws_s3_bucket.website_bucket.id

  rule {
    id     = "delete-old-versions"
    status = "Enabled"

    noncurrent_version_expiration {
      noncurrent_days = 30
    }
  }

  rule {
    id     = "cleanup-incomplete-uploads"
    status = "Enabled"

    incomplete_multipart_upload {
      days_after_initiation = 7
    }
  }
}
```

## Estimated Impact
- Minimal if update frequency is low (1-2 updates/month)
- Moderate savings (few dollars/month) if bucket experiences frequent deployments
