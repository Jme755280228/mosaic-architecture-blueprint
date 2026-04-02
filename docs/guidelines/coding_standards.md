# 🛠️ Coding Standards & Conventions

This project follows a strict **Hierarchical Constant Management** to ensure a "Single Source of Truth" and prevent naming collisions.

---

## 🔑 1. Constants Hierarchy (The Flow)

We categorize constants based on their **Scope** and **Impact** to the system.

### 🌍 Level 1: Global Constants (`pkg/constants/global.go`)
- **Purpose**: Values that affect the entire system regardless of the domain.
- **Examples**: App Version, Environment (Dev/Prod), Global Timeout values.
- **Rule**: Only truly universal values are allowed here.

### 📡 Level 2: Domain Constants (`pkg/constants/telecom.go`)
- **Purpose**: Values specific to a functional area but shared across its sub-modules.
- **Examples**: Base API URLs, Default Pricing tiers, Provider codes.
- **Rule**: Must be prefixed with the domain name (e.g., `TelecomDefaultStatus`).

### 🎯 Level 3: Particular Constants (`pkg/constants/particular.go`)
- **Purpose**: Temporary or highly specific configuration constants used for experimental features or one-off logic.
- **Rule**: These are candidates for refactoring into Level 2 once stabilized.

---

## 🏷️ 2. Naming Conventions

- **PascalCase**: All exported constants must use `PascalCase` for visibility across packages.
- **Prefixing**: Constants should be prefixed by their functional group. 
  - *Good:* `ErrUserNotFound`, `PriceBasicPlan`
  - *Bad:* `NotFound`, `Basic`

---

## 🧱 3. Package Organization

- **No Magic Numbers**: Hardcoded strings or numbers in the `service` layer are strictly prohibited.
- **Immutable State**: All configurations that do not change during runtime must reside in the `pkg/constants` hierarchy.

---
**"Structure is the bridge between chaos and clarity."**

---

**Architect:** [Zaw Win Htay (Jme)](https://www.linkedin.com/in/zaw-win-htay-jme)  
**Philosophy:** Modular Mindset | Result-Oriented | Async-First