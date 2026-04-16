#!/bin/bash

# 1. Create Directory Structure
echo "🏗️ Creating Directory Structure..."
mkdir -p internal/service/telecom/docs
mkdir -p internal/service/telecom/domain
mkdir -p internal/service/telecom/repository
mkdir -p internal/service/telecom/usecase
mkdir -p internal/platform/{firebase,state,ui}

# 2. Update README.md
echo "📝 Updating Root README.md..."
cat <<EOF > README.md
# 🎭 Project Mosaic: The Multi-Boundary Go Bot Framework (Blueprint)

Project Mosaic သည် Telegram, Discord နှင့် Facebook တို့ကို တစ်ပြေးညီ ဝန်ဆောင်မှုပေးနိုင်သော **High-Performance Multi-Platform Bot Framework** တစ်ခုဖြစ်သည်။ 

## 🏗️ Core Architecture
Mosaic သည် **Hexagonal/Clean Architecture** ကို အသုံးပြုထားပြီး Domain Boundary တစ်ခုချင်းစီကို Independent ဖြစ်စေရန် တည်ဆောက်ထားသည်။

## 🌳 Tree Anatomy
\`\`\`text
.
├── cmd/                # Entry points
├── docs/               # Architecture Logs & Constitution
├── internal/
│   ├── platform/       # Infrastructure (Firebase, State, UI)
│   └── service/        # Independent Domains (Telecom, AI, Learning)
└── pkg/                # Shared Utilities
\`\`\`
EOF

# 3. Update internal/service/telecom/docs/architecture.md
echo "📐 Updating Telecom Architecture Doc..."
cat <<EOF > internal/service/telecom/docs/architecture.md
# 🏗️ Telecom Boundary Architecture

## 🌳 Boundary Tree Structure
\`\`\`text
internal/service/telecom/
├── delivery/        # UI/UX Interaction
├── domain/          # Pure Logic & Contracts
├── repository/      # DB Driver (Firestore)
├── usecase/         # Logic Coordinator
└── docs/            # Boundary Specific Manuals
\`\`\`

## ⚙️ Layer Responsibilities
- **Delivery:** Telegram Handler များဖြင့် User Input ကို လက်ခံသည်။
- **Domain:** Stacked Discount Logic (plans.go) နှင့် Phone Validation (ussd.go) ကို ပိုင်ဆိုင်သည်။
- **Repository:** Firestore နှင့် စကားပြောပြီး Data Mapping လုပ်သည်။
- **Usecase:** CreateOrder ကဲ့သို့သော Business Flow များကို စီမံသည်။
EOF

# 4. Create internal/service/telecom/docs/domain_logic_spec.md
echo "🧠 Updating Domain Logic Spec..."
cat <<EOF > internal/service/telecom/docs/domain_logic_spec.md
# 🧠 Telecom Domain Logic Specification

## 🛡️ Anti-Race Condition Logic
ယခင် Node.js တွင် ဖြစ်ပွားခဲ့သော Discount ရောထွေးမှု ပြဿနာအား အောက်ပါအတိုင်း ဖြေရှင်းထားသည်-
1. **Snapshot-at-Creation:** အော်ဒါစတင်ဖန်တီးသည့်အချိန်ရှိ Discount ကိုသာ အတည်ယူသည်။
2. **Immutable State:** Go ၏ Pass-by-value စနစ်ကြောင့် ဒေတာရောထွေးမှုကို တားဆီးသည်။

## 💰 Stacked Discount Engine
Formula: \`FinalPrice = OriginalPrice - (OriginalPrice * (BaseDisc + PlanBonus) / 100)\`
EOF

# 5. Make scripts executable
chmod +x "$0"

echo "✅ Blueprint Updated Successfully! Ready to commit."

