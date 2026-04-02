#!/bin/bash

# Project ရဲ့ root directory ထဲမှာ run ဖို့ သေချာအောင်လုပ်ပါ
PROJECT_ROOT=$(pwd)

echo "🔍 Scanning for empty directories in: $PROJECT_ROOT"

# အလွတ်ဖြစ်နေတဲ့ folder တွေကို ရှာပြီး .gitkeep ဖိုင် ထည့်မယ်
# -type d: directory တွေကို ရှာမယ်
# -empty: အထဲမှာ ဘာမှမရှိတဲ့ folder တွေကိုပဲ ရွေးမယ်
# -not -path '*/.*': hidden folder တွေကို ချန်လှပ်မယ် (.git လိုမျိုး)

find . -type d -empty -not -path '*/.*' -exec touch {}/.gitkeep \; -print

echo "✅ Done! .gitkeep files have been added to empty folders."
echo "🚀 Now you can: git add . && git commit -m 'chore: add .gitkeep to keep folder structure'"

