---
name: cloudfront-price-class
description: CloudFront uses PriceClass_200 when PriceClass_100 would be sufficient for static portfolio site
metadata:
  type: project
---

## Current State
CloudFront distribution configured with `price_class = "PriceClass_200"`.

## Price Class Breakdown
- **PriceClass_100** (cheapest): North America, Europe, Asia Pacific (limited)
- **PriceClass_200** (moderate): Includes Japan, Hong Kong, South Korea, Singapore
- **PriceClass_All** (expensive): All edge locations worldwide

## Problem
For a static portfolio site, PriceClass_200 is over-provisioned. PriceClass_100 covers:
- North America (US, Canada, Mexico)
- Europe (UK, France, Germany, etc.)
- Limited Asia (Mumbai, Singapore, Tokyo, Sydney, Hong Kong)

**Why:** Portfolio sites typically serve North America and Europe primarily. PriceClass_200 adds ~30% to data transfer costs for marginal geographic reach.

**How to apply:** Change to `price_class = "PriceClass_100"` unless global edge presence is a business requirement.

## Estimated Impact
- **Data transfer savings**: ~30% reduction in CloudFront data transfer costs
- For typical static site traffic (1-10GB/month): saves $0.30-3/month
- One-time Terraform change required
