# 🏗️ Internal App Layer

## Purpose
`internal/app` သည် Project Mosaic ၏ **Bootstrap & Orchestration Layer** ဖြစ်သည်။ 

## Responsibilities
- **Initialization:** Database (Firebase), Config နှင့် Logger များကို စတင်ပွင့်စေသည်။
- **Dependency Injection:** Service များ (Telecom, AI) ထဲသို့ လိုအပ်သော Repository များကို ထည့်သွင်းပေးသည်။
- **Graceful Shutdown:** စနစ်ကို ပိတ်သိမ်းသည့်အခါ Data မပျက်စီးအောင် စနစ်တကျ ပိတ်ပေးသည်။

## Flow
`cmd/bot/main.go` ──> `internal/app/app.go` ──> `Start all services`
