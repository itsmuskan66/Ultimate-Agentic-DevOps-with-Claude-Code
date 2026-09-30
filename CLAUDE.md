# CLAUDE.md

## 1. Project Overview
This is a static marketing/portfolio website for [briefly describe — e.g. "a DevOps training program"]. It consists of plain HTML pages (`index.html`, `privacy.html`, `terms.html`), a single stylesheet (`style.css`), and image assets in `images/`. There is no backend, no database, and no build process.

## 2. Tech Stack & Conventions
- Pure HTML5 and CSS3 only.
- No JavaScript frameworks or libraries (no React, Vue, Angular, jQuery).
- No build tools (no Webpack, Vite, npm bundlers).
- No CSS preprocessors (no Sass/Less) — plain CSS only.
- Keep the site fully static and dependency-free.

## 3. File Structure
- `index.html` — homepage
- `privacy.html` — privacy policy page
- `terms.html` — terms of service page
- `style.css` — single shared stylesheet for all pages
- `images/` — all image assets used across the site
- `README.md` — project documentation

## 4. Deployment
This project is deployed to AWS using a static hosting setup:
- **Amazon S3** — hosts the static site files (HTML, CSS, images).
- **Amazon CloudFront** — serves as the CDN in front of S3 for caching and HTTPS.
- **Terraform** — used to provision and manage the S3 bucket and CloudFront distribution as infrastructure-as-code.
Do not suggest alternative hosting (e.g. Vercel, Netlify, EC2) unless explicitly asked — this project's standard deployment path is S3 + CloudFront via Terraform.

## 5. Rules / Do's and Don'ts
- Do not add React, Vue, Angular, or any JavaScript framework unless the user explicitly requests significant interactivity and approves the architectural change.
- Do not introduce a build step or package manager (npm/yarn) — keep the project buildless.
- Keep all pages consistent in style by reusing `style.css`; do not create page-specific stylesheets.
- When suggesting deployment, always default to the S3 + CloudFront + Terraform setup described above.
- Preserve existing file names and structure unless the user asks to reorganize.