#!/bin/bash

# Project Path သတ်မှတ်ခြင်း (Internal/ai အောက်မှာ ဆောက်မယ်)
AI_PATH="internal/ai"

echo "🚀 Creating Mosaic AI Module Structure for Jme..."

# Directory များ အဆင့်ဆင့်ဆောက်ခြင်း
mkdir -p $AI_PATH/domain
mkdir -p $AI_PATH/delivery/http
mkdir -p $AI_PATH/usecase
mkdir -p $AI_PATH/repository/gemini

# လိုအပ်တဲ့ Boilerplate Files များ တစ်ခါတည်း ဆောက်ခြင်း
touch $AI_PATH/domain/model.go
touch $AI_PATH/domain/repository.go
touch $AI_PATH/delivery/http/handler.go
touch $AI_PATH/usecase/ai_ucase.go
touch $AI_PATH/repository/gemini/gemini_repo.go

echo "✅ Structure Created Successfully at $AI_PATH"
echo "------------------------------------------"
ls -R $AI_PATH

