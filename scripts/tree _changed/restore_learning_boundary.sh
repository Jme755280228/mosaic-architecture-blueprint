#!/bin/bash

echo "🚀 Restoring Learning Boundary and updating Architecture..."

# 1. internal/service ထဲမှာ learning_service ကို ပြန်ဆောက်မယ်
mkdir -p internal/service/learning_service/domain

# 2. Placeholder file ထည့်မယ်
if [ ! -f internal/service/learning_service/domain/models.go ]; then
    cat <<EOF > internal/service/learning_service/domain/models.go
package domain

// Content သည် Learning Boundary ၏ အဓိက Data Structure ဖြစ်သည်။
type Content struct {
    ID    string
    Title string
    Body  string
}
EOF
fi

# 3. ARCHITECTURE.md ကို Boundary နှစ်ခုလုံးပါအောင် ပြန်ရေးမယ်
cat <<EOF > ARCHITECTURE.md
<img src="./assets/images/mosaic2.png" alt="Myan-Bot-Ultimate Mosaic Architecture Banner" width="100%">

# 🏛️ Project Architecture: Mosaic v2.1 (Multi-Boundary System)

ဤစာတမ်းသည် Project Mosaic ၏ **Clean Architecture** Blueprint ဖြစ်သည်။ စနစ်တစ်ခုလုံးကို တစ်ခုနှင့်တစ်ခု အမှီအခိုကင်းသော Boundary များဖြင့် ဖွဲ့စည်းထားသည်။

## 🏗️ 1. Architecture Visualization (Mermaid)

\`\`\`mermaid
graph TD
    subgraph "Delivery Layer"
        TG[Telegram Adapter]
    end

    subgraph "Platform Layer (Shared Framework)"
        CORE[Core Context/Request]
        STATE[State/Session Manager]
        UI[Unified Menu Presenter]
    end

    subgraph "Service Boundary (Independent Domains)"
        TS[Telecom Boundary]
        LS[Learning Boundary]
        USER[User/Admin Boundary]
    end

    subgraph "Persistence Layer (Data)"
        DB[(Firebase/Firestore)]
    end

    %% Flow
    TG --> CORE
    CORE --> STATE
    STATE --> UI
    UI --> TS & LS
    TS & LS --> DB
    USER --> DB
\`\`\`

---

## 📂 2. Directory Structure

\`\`\`text
~/mosaic-architecture-blueprint
├── cmd/bot/main.go            # 🚀 Entry Point
├── internal/
│   ├── platform/              # 🔌 Infrastructure
│   │   ├── core/              # Context Lifecycle
│   │   ├── state/             # User Session Management
│   │   └── ui/                # Cross-platform Component Library
│   ├── service/               # 🧠 Business Boundaries
│   │   ├── telecom/           # 🎖️ Core: Pricing & USSD Logic
│   │   ├── learning_service/  # 📚 Core: Content Delivery Logic
│   │   └── user/              # Identity Management
│   └── app/                   # 🏗️ Bootstrapper
└── docs/                      # 📜 Governance & History
\`\`\`

---

## 🛠️ 3. Core Technical Standards

🔹 **Modular Boundaries**
Boundary တစ်ခုစီ (Telecom, Learning) သည် သီးခြား Logic များဖြင့် ရပ်တည်သည်။ Telecom သည် ငွေကြေးဆိုင်ရာကို ကိုင်တွယ်ပြီး Learning သည် ဗဟုသုတဖြန့်ဝေမှုကို ကိုင်တွယ်သည်။ ၎င်းတို့သည် Repository Contract များမှတစ်ဆင့်သာ Platform နှင့် ဆက်သွယ်သည်။

🔹 **Platform-Agnostic Design**
UI Logic များကို Platform layer တွင် စုစည်းထားသဖြင့် Telecom ရော Learning ရောသည် တစ်ပြေးညီ UI Experience ကို ရရှိစေသည်။

---

## 🚀 4. Implementation Roadmap

- [x] **Phase 1:** Multi-Boundary Structural Setup (Done)
- [x] **Phase 2:** Telecom Logic Migration (Done)
- [x] **Phase 3:** Learning Domain Framework (Done)
- [ ] **Phase 4:** Advanced Content Delivery Integration (In Progress)

---

**Author:** [Zaw Win Htay (Jme)](https://www.linkedin.com/in/zaw-win-htay-jme) <br>
*Backend Architect | Focusing on Modular Go Ecosystems*
<br>
**Last Updated:** \`Thu, Apr 16 2026\`
EOF

chmod +x "$0"
echo "✅ Learning Boundary restored and ARCHITECTURE.md updated!"

