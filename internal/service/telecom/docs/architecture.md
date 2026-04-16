# 🏗️ Telecom Boundary Architecture (Mosaic DNA)

## 🌳 Boundary Tree Structure
Telecom Boundary ၏ တည်ဆောက်ပုံမှာ အောက်ပါအတိုင်း ဖြစ်သည်။ ၎င်းသည် Pure Go ဖြင့် ရေးသားထားသော လွတ်လပ်သည့် Module တစ်ခုဖြစ်သည်။

```text
internal/service/telecom/
├── delivery/
│   └── telegram/
│       └── handler.go       # Bot UI/UX Logic & Interaction (မျက်နှာစာ)
├── domain/                  # The "Brain" (Pure Logic & Contracts - ဦးနှောက်)
│   ├── constants.go         # Step, Operator, DB Path များ
│   ├── models.go            # Plan, Order, BotSettings Structs
│   ├── plans.go             # Double Discount Engine (ဈေးနှုန်းတွက်ချက်မှု)
│   ├── repository.go        # Database Interface (The Contract)
│   └── ussd.go              # Phone & Operator Logic (ဖုန်းနံပါတ်စစ်ဆေးမှု)
├── repository/              # The "Driver" (DB Implementation - လက်တွေ့အလုပ်လုပ်သူ)
│   ├── firestore_repo.go    # Firestore Query Logic များ
│   └── mapper.go            # DB Data မှ Go Struct သို့ ပြောင်းလဲခြင်း
├── usecase/                 # The "Coordinator" (Business Logic - စီမံခန့်ခွဲသူ)
│   ├── telecom_usecase.go   # CreateOrder, FinalizeOrder Flow များ
│   └── order_test.go        # Logic Testing
└── docs/                    # Technical Manuals (မှတ်တမ်းမှတ်ရာများ)
    ├── architecture.md      # (Current File)
    ├── operational_manual.md
    └── domain_logic_spec.md

```

### 🎨 Diagram for `architecture.md` (ASCII Version)
```text
    ┌────────────────────────────────────────────────────────┐
    │                  DELIVERY LAYER (Telegram)             │
    │  [handler.go] -> Receives Input -> Detects Operator    │
    └───────────┬────────────────────────────────────────────┘
                │
                ▼
    ┌────────────────────────────────────────────────────────┐
    │                  USECASE LAYER (Logic)                 │
    │  [telecom_usecase.go] -> Coordinates Order Flow        │
    └───────────┬────────────────────────────────────────────┘
                │
                ▼
    ┌────────────────────────────────────────────────────────┐
    │                  DOMAIN LAYER (Brain)                  │
    │  [plans.go] -> Stacked Discount Calculation            │
    │  [ussd.go]  -> Phone Validation                        │
    └───────────┬────────────────────────────────────────────┘
                │
                ▼
    ┌────────────────────────────────────────────────────────┐
    │                REPOSITORY LAYER (Data)                 │
    │  [firestore_repo.go] -> Isolated DB Queries            │
    │  [mapper.go]         -> Data Transformation            │
    └────────────────────────────────────────────────────────┘

```



## 🎯 Architectural Overview
ဤ Telecom Boundary သည် **Domain-Driven Design (DDD)** အယူအဆကို အခြေခံထားသည်။ ၎င်း၏ အဓိက ရည်ရွယ်ချက်မှာ Node.js Legacy Logic များကို Go ၏ Performance နှင့် Type Safety သုံး၍ "Boundary" တစ်ခုအတွင်း အပြည့်အဝ ပိတ်လှောင် (Encapsulate) ထားရန် ဖြစ်သည်။
## ⚙️ Layer Responsibilities
 1. **Delivery Layer (handler.go)**
   * User ဆီမှ ဝင်လာသော Text ကို domain.SanitizePhone သို့ ပို့၍ Operator ကို Auto-detect လုပ်သည်။
   * Detected ဖြစ်လာသော Operator နှင့် ဖုန်းနံပါတ်ကို State ထဲတွင် သိမ်းဆည်းသည်။
 2. **Domain Layer (Pure Logic)**
   * **plans.go:** Promotion settings ပေါ်မူတည်၍ Base + Plan discount ကို တွက်ချက်ပေးသည့် Central Engine ဖြစ်သည်။
   * **repository.go:** DB Interface ကို ကြေညာထားခြင်းဖြင့် usecase သည် မည်သည့် DB ကို သုံးသည်ဖြစ်စေ (Firestore/MySQL/PostgreSQL) အလုပ်လုပ်နိုင်အောင် ဖန်တီးထားသည်။
 3. **Repository Layer (Data Driver)**
   * Firestore နှင့် တိုက်ရိုက်ဆက်သွယ်ပြီး Telecom ဒေတာများကို CRUD လုပ်သည်။
   * mapper.go သည် Firestore မှ လာသော dynamic map ဒေတာများကို Go ၏ Type-safe Struct များအဖြစ် ပြောင်းလဲပေးသည်။
 4. **Usecase Layer (Business Flow)**
   * အော်ဒါ တစ်ခု ဖန်တီးရာတွင် လိုအပ်သော SystemSettings များကို Repository မှ ဆွဲယူပြီး CalculateFinalPrice ဖြင့် ဈေးနှုန်း သတ်မှတ်ပေးကာ Order Cycle ကို အပြီးသတ်ပေးသည်။
## 🛡️ Boundary Design Principle
ဤ Boundary အတွင်းရှိ repository နှင့် mapper တို့ကို ပြင်ပမှ တိုက်ရိုက် ခေါ်ယူခွင့် မရှိပါ။ ပြင်ပ Package များသည် TelecomService interface မှတစ်ဆင့်သာ ဝင်ရောက် စွက်ဖက်ခွင့် ရှိသည်။ ၎င်းသည် Project တစ်ခုလုံး၏ **Mosaic Integrity** ကို ထိန်းသိမ်းရန်ဖြစ်သည်။
