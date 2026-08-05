# Chronique Boursière — Project Specification

> Reference specification document for **chroniqueboursiere.fr**

---

## Table of Contents

1. [Project Overview](#1-project-overview)
2. [Implementation Plan](#2-implementation-plan)
3. [Technical Architecture](#3-technical-architecture)
4. [Design & Visual Identity](#4-design--visual-identity)
5. [Pages & Site Structure](#5-pages--site-structure)
6. [Blog](#6-blog)
7. [Back-office](#7-back-office)
8. [Automations](#8-automations)
9. [SEO](#9-seo)

---

## 0. Usage

Website available at → **http://51.178.80.14:1313**

```bash
make dev-build   # Build Docker images
make dev-run     # Start the site (http://51.178.80.14:1313)
make dev-kill    # Stop all containers
```

## 1. Project Overview

**Website:** chroniqueboursiere.fr  
**Type:** Online media specializing in economics and corporate news

Chronique Boursière is a media outlet whose goal is to inform and help people understand the economic world around them. Specializing in economics and corporate news (CAC40, financial results, economic policy, markets).

**Social Media:**
- YouTube
- X (Twitter)
- Instagram
- TikTok
- Telegram

---

## 2. Implementation Plan

| Step | Description |
|------|-------------|
| **Step 1** | Infrastructure setup: Docker, Docker Compose, Makefile, Hugo |
| **Step 2** | Site architecture: menu, footer, main homepage design |
| **Step 3** | Blog setup with full SEO optimization |
| **Step 4** | Back-office development (admin authentication) |
| **Step 5** | Back-office automations (news, publications, financial data) |

---

## 3. Technical Architecture

### Stack

| Component | Technology |
|-----------|------------|
| Static site generator | Hugo (Go) |
| Database | PostgreSQL |
| Containerization | Docker + Docker Compose |
| Build automation | Makefile |

### Makefile Commands

```bash
make dev-run      # Start the development environment
make dev-build    # Build Docker images
make dev-kill     # Stop and remove containers
```

### Docker Compose

The project runs entirely via Docker Compose:
- `hugo` service: static site generation and serving
- `postgres` service: database for the back-office
- `backoffice` service: admin API and interface

### Hugo Articles

Blog articles are `.md` files stored in the code repository.  
Publishing an article = adding a `.md` file to the `content/blog/` directory.  
By default, all created articles are **drafts** (`draft: true`) — they are only visible after manual validation.

---

## 4. Design & Visual Identity

### Color Palette

| Role | Color | Hex |
|------|-------|-----|
| Primary color | Dark blue | `#233b63` |
| Secondary color | Greyish orange | `#af9b7e` |
| Background / light text | White | `#ffffff` |

### Typography

- Readable typeface representing news and journalistic seriousness
- Overall style: **modern, luxurious, clean**
- White space is valued — the design must "breathe"

### Visual Spirit

- Modern and premium
- Simplicity and readability above all
- Close to the visual codes of high-end financial media

---

## 5. Pages & Site Structure

### Pages

| Route | Description |
|-------|-------------|
| `/` | Homepage — media presentation |
| `/blog` | Blog article listing |
| `/blog/{article-title}` | Single article page |
| `/legal-notice` | Legal notice |
| `/privacy-policy` | Privacy policy |
| `/link` | Links page (Linktree-style) — centralizes all social media and resource links |

### Menu (header)

Main navigation at the top of the page:
- Home
- Blog
- Who we are
- Pages

### Footer

- Logo and links to social media: YouTube, X, Instagram, TikTok, Telegram
- Legal links: Legal notice, Privacy policy

### Homepage (`/`)

Introduction page for the media outlet:
- Presentation of Chronique Boursière: mission, positioning, coverage areas
- Highlight of the blog and latest articles
- Links to social media
- Call-to-action toward the blog

### `/link` Page

Centralized links page (Linktree-inspired):
- Media logo
- List of clickable links: social media, featured articles, newsletter, etc.

---

## 6. Blog

### Topics / Categories

| Category | Description |
|----------|-------------|
| Financial Results | Quarterly and annual corporate earnings publications |
| News | General economic and corporate news |
| CAC40 | Coverage of CAC40 companies |
| Politics | Economic policy, government decisions |
| Finance | Financial markets, analysis, data |

### Features

- **No mandatory image** on articles — text comes first
- Clear classification by category and tags
- Publication calendar (list of upcoming or scheduled publications)
- Automated financial results (see Automations section)
- Articles in draft by default, published only after manual validation

---

## 7. Back-office

Secure administration interface (admin login/password authentication).

### Tab 1 — News Search

Automatic search and collection of articles from external sources.

**Sources:**
- RSS feeds from economic and financial newspapers
- Google News RSS
- Specialized blogs

**Workflow:**
1. The back-office aggregates configured RSS feeds
2. An LLM (AI) analyzes and transforms the content into a ready-to-use Hugo Markdown article
3. The article is created as a **draft** (`draft: true`) in the repository
4. The admin manually validates and publishes the article from the back-office

### Tab 2 — Data

Tracking and display of quarterly financial results for companies.

- Structured display of results by company and by quarter
- Data imported automatically or entered manually
- Linked to corresponding blog articles

### Tab 3 — Publication

#### Sub-tab 3.1 — Blog Articles
- Article management: creation, editing, validation, publication, unpublication
- List view with status (draft / published)
- Markdown editor

#### Sub-tab 3.2 — Twitter / X
- Tweet drafting and scheduling
- Manual or automated publishing from the back-office
- Publication history

---

## 8. Automations

| Automation | Description |
|------------|-------------|
| RSS aggregation | Automatic collection of configured RSS feeds at regular intervals |
| Article generation | LLM parses RSS content and generates a formatted Hugo `.md` file |
| Financial results | Automatic retrieval of quarterly corporate earnings |
| Publication calendar | Display and management of article publication schedule |
| Twitter publishing | Optional automation of publishing on X/Twitter |

---

## 9. SEO

### Technical Files

- `robots.txt`: present and correctly configured
- `sitemap.xml`: automatically generated by Hugo, submitted to search engines

### Best Practices

- Clean, readable URLs (`/blog/article-title`)
- Unique `<title>` and `<meta description>` tags per page
- Open Graph tags (social media sharing)
- Structured data markup (Schema.org) for articles (`Article`, `NewsArticle`)
- Optimized loading time (Hugo static site)
- Responsive design (mobile-first)
- Consistent categorization and tags for internal linking
- Blog pagination
- Breadcrumbs on articles
