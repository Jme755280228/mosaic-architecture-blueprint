#!/bin/bash

echo "📂 Syncing Docs Sub-folders & Creating Placeholders..."

# 1. Docs အောက်က Sub-folders အားလုံးကို အတိအကျ ဆောက်မယ်
# Jme ရဲ့ tree ထဲက အတိုင်း အဆင့်ဆင့် ဆောက်တာပါ
mkdir -p docs/JavaStyle
mkdir -p docs/constitution/ARCHITECTURE/{12042026,13042026Instruction}
mkdir -p docs/db_ram_session
mkdir -p docs/dbstructure/db_changing_instruction
mkdir -p docs/example
mkdir -p docs/framework/FinalTreeStructureAdvidedByGPTRefineByGemini
mkdir -p docs/future/raw
mkdir -p docs/history/Project\ Update\ \(2026-04-02\)
mkdir -p docs/history/desition/raw
mkdir -p docs/history/desition/structure
mkdir -p docs/history/test/{db,test_summery,user_flow}
mkdir -p docs/log/tree
mkdir -p docs/plarform-ui\&ux
mkdir -p docs/refactor
mkdir -p docs/roadmap
mkdir -p docs/temp

# 2. Folder တစ်ခုချင်းစီထဲကို example.md တွေ လိုက်ထည့်မယ် (Git track လုပ်နိုင်အောင်)
echo "📝 Filling sub-folders with placeholder MDs..."

find docs -type d | while read -r dir; do
    # Folder ထဲမှာ file မရှိသေးရင် example.md တစ်ခု ဖန်တီးမယ်
    if [ -z "$(ls -A "$dir")" ]; then
        folder_name=$(basename "$dir")
        cat <<EOF > "$dir/example.md"
# Documentation for $folder_name

This is a placeholder file to maintain the directory structure in the Mosaic Architecture Blueprint.
Original documentation can be found in the private production repository.

- **Status:** Integrated
- **Boundary:** Project Root
EOF
        echo "✅ Added example.md to $dir"
    fi
done

echo "✨ Docs sub-folders are now ready for Git commit!"

