# 🎨 The Mosaic Design Philosophy

> "A system is not just a block of code; it is a collection of distinct, purposeful tiles that create a masterpiece when unified."

---

## 🧩 1. What is Mosaic Design?

**Mosaic Design** is a domain-driven, modular architectural pattern that I developed to address the complexities of modern backend systems. In a traditional monolith, code is often "intertwined." In a Mosaic, every component is a **Standalone Tile**.

### Core Pillars:
1. **Isolation (The Tile)**: Each domain (e.g., Telecom, Learning) must exist independently. Changing one tile should never crack the others.
2. **Standardized Grout (The Interfaces)**: Domains communicate through well-defined contracts (Interfaces), ensuring seamless integration.
3. **The Big Picture (The Orchestrator)**: The `cmd/` layer acts as the frame, bringing the tiles together using Dependency Injection.

---

## 🏗️ 2. Domain Decomposition

In this blueprint, I have separated the logic into distinct "Mosaic Tiles":

### 📡 Telecom Domain
- **Responsibility**: Plan processing, SIM management, and billing logic.
- **Independence**: This layer has zero knowledge of the AI or Learning logic. It only cares about data integrity and transaction results.

### 🧠 Learning Domain
- **Responsibility**: Educational content delivery and user progress tracking.
- **Integration**: It consumes the **AI Sentinel Service** to provide intelligent feedback, but the core learning flow remains pure and testable.

### 🤖 AI Sentinel
- **Responsibility**: Large Language Model (LLM) orchestration.
- **Pattern**: Treated as a high-level service that can be swapped (e.g., from Gemini to another provider) without touching the business logic.

---

## ⚙️ 3. Technical Implementation Standards

### 🛡️ Port & Adapters (Hexagonal)
I utilize the **Ports and Adapters** pattern within each tile:
- **Internal (Domain/Service)**: Pure business logic.
- **External (Platform/Bot)**: External drivers like Databases (Firebase) or Messaging APIs (Telegram).

### 💉 Dependency Injection
By avoiding `init()` functions and global variables, I ensure that the system is:
- **Testable**: We can inject "Mock" tiles for unit testing.
- **Maintainable**: Dependencies are explicit, not hidden.

---

## 🧘 4. The "Green Chip" Engineering Ethics

Every design choice in the Mosaic pattern is filtered through the **Green Chip Philosophy**:

* **Altruism**: Does this architecture make the system easier for future developers to understand?
* **Integrity**: Are the boundaries between domains respected? No "leaky abstractions."
* **Synergy**: Do the modules work together to create a value greater than the sum of their parts?

---

## 📈 5. Future Evolution

The Mosaic Design is built to evolve. The next phases include:
- **Event-Driven Tiles**: Implementing NATS or RabbitMQ for asynchronous inter-tile communication.
- **Multi-Platform Delivery**: Adding a Discord adapter tile alongside the Telegram bot.

---
**Architect:** [Zaw Win Htay (Jme)](https://www.linkedin.com/in/zaw-win-htay-jme)  
**Philosophy:** Modular Mindset | Result-Oriented | Async-First

