#!/bin/bash

echo "🧹 Cleaning up legacy folders..."
# မလိုအပ်တော့တဲ့ folder အဟောင်းတွေကို ဖျက်ထုတ်မယ်
rm -rf internal/ai internal/bot internal/domain internal/service/learning
rm -rf docs/architecture docs/guidelines docs/history docs/roadmap

# 1. Create Core Structure (Platform)
echo "🏗️ Building Platform Layers..."
mkdir -p internal/platform/{config,core,firebase,state,telegram,ui}

# 2. Create Service Boundaries
echo "🏗️ Building Service Boundaries..."
mkdir -p internal/service/ai_service/{delivery,domain,repository,usecase}
mkdir -p internal/service/learning_service/domain
mkdir -p internal/service/telecom/{delivery/telegram,domain,repository,usecase,docs}
mkdir -p internal/service/user/{delivery,domain,repository,usecase}

# 3. Create Root & Docs Structure
echo "🏗️ Building Docs & Scripts..."
mkdir -p docs/{constitution/ARCHITECTURE,dbstructure,framework,future,history}
mkdir -p scripts/db_scripts

# 4. Generating Key Files (Demo Content)
echo "📝 Writing Architecture Documentation..."

cat <<EOF > internal/service/telecom/docs/architecture.md
# 🏗️ Telecom Boundary Architecture
(This is a pure Go implementation of the legacy Node.js telecom module)

## Boundary Tree
\`\`\`text
telecom/
├── delivery/telegram/  # Telegram handlers
├── domain/             # Models & Logic Interfaces
├── repository/         # Firestore implementation
└── usecase/            # Business flow coordinator
\`\`\`
EOF

cat <<EOF > internal/service/telecom/docs/domain_logic_spec.md
# 🧠 Domain Logic: Anti-Race Condition
Go's pass-by-value and snapshot-at-creation strategy ensures that discount rates remain consistent even during concurrent admin approvals.
EOF

# 5. Fix Root README to reflect the 76-dir style evolution
cat <<EOF > README.md
# 🎭 Project Mosaic Blueprint v2.0
This is the public blueprint of the Mosaic Multi-Boundary Framework.

## 🚀 Evolution Note
This repository reflects the architecture used in my production-ready bot, migrating from a simple setup to a 138-file enterprise structure.

## 🏗️ Key Architecture
- **Hexagonal Design:** Isolation between Platform and Services.
- **Service Boundaries:** Telecom, AI, and Learning services are decoupled.
- **Mobile-First:** Developed entirely on a smartphone environment.
\`\`\`text
$(tree -d -L 3 internal)
\`\`\`
EOF

echo "✅ Refactor Complete! Tree is now aligned with my-go-bot-project standards."

