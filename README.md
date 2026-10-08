# Yash Patel - Senior Unity Game Developer Portfolio

A tailored, high-performance web portfolio for **Yash Patel** (Senior Unity Game Developer, 6.5+ Yrs Experience). Designed to showcase commercial console titles (Nintendo Switch), mobile games (iOS/Android), real-time multiplayer systems, deep engine profiling, and modern AI development tooling.

---

## 📁 Project Structure

```text
E:\Yash\Projects\Portfolio\
│
├── index.html                     # 🎯 Master Portfolio File (Open directly to preview)
├── favicon.ico                    # 🌟 Portfolio Favicon
├── preview-local.bat              # 💻 1-Click Local Web Server Preview
├── sync-linkedin.bat              # 🔄 1-Click LinkedIn Profile Sync
├── deploy-github.bat              # 🚀 1-Click Direct Deploy to GitHub Pages
├── README.md                      # 📖 Project Documentation
│
├── data/
│   └── linkedin-profile.json      # 📄 Structured LinkedIn Profile, Experience & Certs
│
├── config/
│   └── linkedin-config.json       # ⚙️ LinkedIn Target & Optional RapidAPI Config
│
├── platforms/
│   └── github-pages/              # 🐙 Production Deployment for GitHub Pages
│       ├── index.html
│       ├── favicon.ico
│       ├── data/
│       │   └── linkedin-profile.json
│       ├── .nojekyll              # Bypasses Jekyll processing
│       ├── deploy-github.bat      # 🚀 Automated Git Push Script
│       ├── deploy-github.ps1      # PowerShell Deploy Script
│       └── README.md
│
└── scripts/
    ├── sync-linkedin.js           # ⚡ LinkedIn Data Fetcher & Aggregator
    └── sync-changes.ps1           # 🔄 Syncs root index.html to github-pages/
```

---

## ⚡ Quick Start: Instant Local Preview

1. **Option A (Instant File Preview):**  
   Double-click [`index.html`](file:///E:/Yash/Projects/Portfolio/index.html) in Windows File Explorer. Opens directly in your browser with zero setup.

2. **Option B (Local Web Server Preview):**  
   Double-click [`preview-local.bat`](file:///E:/Yash/Projects/Portfolio/preview-local.bat). Starts a fast local server at `http://localhost:8080` with native video playback.

---

## 🚀 How to Deploy to GitHub Pages (100% Free)

1. Simply double-click **[`deploy-github.bat`](file:///E:/Yash/Projects/Portfolio/deploy-github.bat)**.
2. It automatically:
   - Configures origin to `https://github.com/yashpatel59684/yashpatel59684.github.io.git`
   - Stages and commits all files
   - Pushes to the `main` branch
3. Your portfolio goes live at:  
   👉 **`https://yashpatel59684.github.io`**

---

## 🔄 Making Edits

1. Edit [`index.html`](file:///E:/Yash/Projects/Portfolio/index.html) in the root folder.
2. Run [`deploy-github.bat`](file:///E:/Yash/Projects/Portfolio/deploy-github.bat) to push your updates live!
