#!/bin/bash

echo "🚀 Starting to fill folder gaps with example files..."

# Jme ရဲ့ tree structure ထဲက directory အားလုံးကို ရှာမယ်
# -empty ဖြစ်နေတဲ့ folder တွေထဲကို file လိုက်ထည့်မယ်
find internal -type d | while read -r dir; do
    # internal/platform အောက်က folder တွေဆိုရင် example.go ထည့်မယ်
    if [[ "$dir" == *"platform"* ]]; then
        if [ -z "$(ls -A "$dir")" ]; then
            echo "package $(basename "$dir")" > "$dir/example.go"
            echo "✅ Created example.go in $dir"
        fi
    # internal/service အောက်က folder တွေဆိုရင် example.go ထည့်မယ်
    elif [[ "$dir" == *"service"* ]]; then
        if [ -z "$(ls -A "$dir")" ]; then
            echo "package $(basename "$dir")" > "$dir/example.go"
            echo "✅ Created example.go in $dir"
        fi
    # docs အောက်က folder တွေဆိုရင် example.md ထည့်မယ်
    elif [[ "$dir" == *"docs"* ]]; then
        if [ -z "$(ls -A "$dir")" ]; then
            echo "# Example Documentation" > "$dir/example.md"
            echo "✅ Created example.md in $dir"
        fi
    fi
done

# script တွေရှိတဲ့ folder တွေအတွက် (ဥပမာ scripts/db_scripts)
find scripts -type d | while read -r dir; do
    if [ -z "$(ls -A "$dir")" ]; then
        echo "# Scripts for $(basename "$dir")" > "$dir/README.md"
        echo "✅ Created README.md in $dir"
    fi
done

echo "✨ All empty folders are now trackable by Git!"

