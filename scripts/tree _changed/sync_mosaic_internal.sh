#!/bin/bash

# Blueprint ထဲက internal ကို အရင်ရှင်းမယ် (Clean Slate)
echo "🧹 Clearing old internal structure..."
rm -rf internal

# 1. Create Internal Sub-folders (Platform & Service)
echo "🏗️ Building Internal Structure..."
mkdir -p internal/{app,platform,service}

# 2. Build Platform Layers (36 directories ထဲက အဓိက အစိတ်အပိုင်းများ)
echo "🔧 Building Platform Components..."
mkdir -p internal/platform/{config,core,discord,facebook,firebase,http,middleware,state,storage,telegram,ui}

# 3. Build Service Boundaries (Telecom, AI, Learning, User)
echo "🔧 Building Service Boundaries..."
mkdir -p internal/service/ai_service/{delivery/http,domain,repository/gemini,usecase}
mkdir -p internal/service/learning_service/domain
mkdir -p internal/service/telecom/{delivery/telegram,docs,domain,repository,usecase}
mkdir -p internal/service/user/{delivery,domain,repository,usecase}

# 4. Create Key Files (Placeholders) to match the 45 files count
echo "📝 Creating Key Architecture Files..."

# Platform Files
touch internal/platform/config/config.go
touch internal/platform/core/{context.go,ids.go,request.go}
touch internal/platform/firebase/firebase.go
touch internal/platform/state/state_manager.go
touch internal/platform/telegram/{adapter.go,dispatcher.go,transformer.go,ui_adapter.go}

# Telecom Files (Most Important)
touch internal/service/telecom/domain/{constants.go,models.go,plans.go,repository.go,ussd.go}
touch internal/service/telecom/repository/{firestore_repo.go,mapper.go}
touch internal/service/telecom/usecase/telecom_usecase.go

# AI Service Files
touch internal/service/ai_service/repository/gemini/gemini_repo.go

# 5. Sync the Documentation for Telecom (Jme ရဲ့ core logic)
echo "✍️ Syncing Telecom Docs..."
cat <<EOF > internal/service/telecom/docs/architecture.md
# 🏗️ Telecom Boundary Architecture
This boundary handles all telecom operations. It's a Go rewrite of the legacy Node.js module.
EOF

# Give Execute Permission
chmod +x "$0"

echo "✅ Sync Complete! Your Blueprint internal/ is now a mirror of my-go-bot-project."

