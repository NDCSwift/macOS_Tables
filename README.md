# 🎬 Catalogue — macOS Table vs List

A SwiftUI macOS app that shows why `Table` beats `List` for tabular data — using a movie catalogue as the real-world example.

---

## 🤔 What this is

Catalogue is a side-by-side demonstration of SwiftUI's `Table` and `List` views on macOS. It uses a curated movie dataset to make the tradeoffs concrete: sortable columns, multi-row selection, context menus, column customization, and a custom `RatingBadge` — all things `Table` handles natively that `List` simply can't.

## ✅ Why you'd use it

- **Native column sorting** — click any header to sort; `Table` handles it automatically per column without extra code
- **Multi-row selection + context menus** — select one or many rows and act on them via right-click or toolbar, with no manual tracking
- **Persistent column customization** — column visibility and order are saved across launches via `@SceneStorage`, exactly as users expect from macOS apps

## 📺 Watch on YouTube

[![Watch on YouTube](https://img.shields.io/badge/YouTube-Watch%20the%20Tutorial-red?style=for-the-badge&logo=youtube)](https://youtube.com/watch?v=PLACEHOLDER)

> This project was built for the [NoahDoesCoding YouTube channel](https://www.youtube.com/@NoahDoesCoding97).

---

## 🚀 Getting Started

### 1. Clone
```bash
git clone https://github.com/NDCSwift/macOS_Tables.git
```

### 2. Open
Double-click `Catalogue.xcodeproj` or open it via **Xcode → File → Open**.

### 3. Set your Team
In **Signing & Capabilities**, select your Apple Developer team.

### 4. Set your Bundle ID
Replace the default bundle identifier with a unique reverse-domain ID that matches your team.

---

## 🛠️ Notes

- `CatalogueView` is the `Table`-based main screen — sortable, multi-selectable, and column-customizable out of the box
- `MovieListView` is intentionally left rough to highlight what `List` can't do: no column headers, no alignment guarantees, no multi-select, and only one manually wired sort axis
- Sample data lives in `Movie.swift` — swap it out for a SwiftData query when moving to production
- Two companion Gists show the full `Movie` extension used in the tutorial:
  - [2024 Gist](https://gist.github.com/NDCSwift/a3944fecb9e1d0ac101eb643500adb7f)
  - [Updated Gist](https://gist.github.com/NDCSwift/1e662c9e4e92a4623c45f5d2141ec469)

## 📦 Requirements

| Requirement | Version |
|---|---|
| Xcode | 15.0+ |
| macOS | 14.0 Sonoma+ |
| Swift | 5.9+ |

---

📺 [Watch the guide on YouTube](https://youtube.com/watch?v=PLACEHOLDER)
