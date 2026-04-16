# 🏛 The Mosaic Architecture: Master Constitution
စနစ်တစ်ခုလုံးကို အလွှာ (Layers) ၅ ခုဖြင့် တိကျစွာ ပိုင်းခြားထားပြီး တစ်ခုနှင့်တစ်ခု ကျော်လွန်လုပ်ဆောင်ခွင့် မရှိစေရ။
## 📦 1. The Layers & Force Rules (အလွှာများနှင့် တင်းကျပ်သော စည်းမျဉ်းများ)
### [A] cmd/bot/ (The Master Trigger)
 * **တာဝန်:** Spring Boot ၏ App.java ကဲ့သို့ စက်နှိုးပေးရန် သက်သက်သာ ဖြစ်သည်။
 * **Force Rule:** မည်သည့် Business Logic, Database Connection မှ ကိုယ်တိုင် မရေးရ။
 * **Restriction:** internal/app ကိုသာ လှမ်းခေါ်ခွင့်ရှိသည်။
### [B] pkg/ (The Public Framework & DNA)
 * **တာဝန်:** မည်သူမဆို လွတ်လပ်စွာ ယူသုံးနိုင်သော Core Interfaces များ၊ Types များနှင့် Utility Tools များ ထားရှိရန်။ (Framework ၏ အသက်)
 * **Force Rule:** **Zero-Internal-Dependency.** internal/ အောက်ရှိ မည်သည့် Package ကိုမျှ လုံးဝ (လုံးဝ) import လုပ်ခွင့် မရှိ။
 * **Structure:**
   * pkg/core: BotRequest, BotResponse, BotPlatform ကဲ့သို့သော ဘုံ Interface များသာ ရှိရမည်။ Implementation မပါရ။
   * pkg/utils: String ပြင်ခြင်း၊ အချိန် format ပြောင်းခြင်း စသည့် Pure Functions များသာ ပါရမည်။
### [C] internal/app/ (The Control Room)
 * **တာဝန်:** စနစ်တစ်ခုလုံးရှိ Service များနှင့် Platform များကို ချိတ်ဆက်ပေးရန် (Dependency Injection - DI)။
 * **Force Rule:** **The Orchestrator.** Service တစ်ခုနှင့် တစ်ခု အချင်းချင်း တိုက်ရိုက် မချိတ်ဆက်ရ။ app layer မှသာ ကြားခံ ချိတ်ဆက်ပေးရမည်။
### [D] internal/platform/ (The Body / Adapters)
 * **တာဝန်:** ပြင်ပလောက (Telegram, Firebase) နှင့် ဆက်သွယ်ရန်။
 * **Force Rule:** **Agnostic to Business.** Telecom Plan ဈေးနှုန်းများ၊ User Logic များကို ဤနေရာတွင် လုံးဝ မတွက်ချက်ရ။
 * **Sub-Packages:**
   * config: Environment (API Keys, URLs) များ ဖတ်ရန်။
   * state: User ၏ လက်ရှိ ခြေလှမ်း (Context/Session) ကို မှတ်ရန်။
   * ui: Telegram သို့ ပြသမည့် Menu Schema များ ထားရန်။
   * middleware: Request မဝင်ခင် Auth စစ်ခြင်း၊ Error ဖမ်းခြင်း နှင့် Logging လုပ်ရန် (The Sentinel)။
### [E] internal/service/ (The Mosaic Brain)
 * **တာဝန်:** တကယ့် Business Logic များ (ဥပမာ - Telecom, User) အလုပ်လုပ်ရန်။
 * **Force Rule:** **Strict Isolation.** Service တစ်ခုသည် အခြား Service တစ်ခုကို တိုက်ရိုက် import မလုပ်ရ။
 * **Sub-Layers (Inside a Service):**
   * domain: Model များနှင့် Repository Interface (Blueprint) သက်သက်။
   * usecase: တွက်ချက်မှု Logic များ။
   * repository: Firebase သို့မဟုတ် RealDB နှင့် တိုက်ရိုက်စကားပြောမည့် တစ်ခုတည်းသော နေရာ။
   * delivery: Platform မှ လာသော ခလုတ်နှိပ်မှုများကို လက်ခံမည့် နေရာ (Handler)။
## 🚦 2. Interaction Matrix (ချိတ်ဆက်မှု ကန့်သတ်ချက်များ)
| From (ခေါ်ယူသူ) | To (အသုံးပြုခံရသူ) | Status | အကြောင်းပြချက် |
|---|---|---|---|
| **cmd** | **internal/app** | ✅ ခွင့်ပြုသည် | App ကို Initialize လုပ်ရန်။ |
| **internal/service** | **pkg** | ✅ ခွင့်ပြုသည် | ဘုံသုံး Tools များကို အသုံးပြုရန်။ |
| **internal/platform** | **pkg/core** | ✅ ခွင့်ပြုသည် | Standard Interface များ ယူသုံးရန်။ |
| **internal/service A** | **internal/service B** | ❌ **ပိတ်ပင်ထားသည်** | App (DI) မှတစ်ဆင့်သာ ချိတ်ရမည်။ |
| **internal/service** | **internal/platform** | ❌ **ပိတ်ပင်ထားသည်** | Logic သည် Platform ကို မသိရ။ |
| **pkg** | **internal/*** | ❌ **ပိတ်ပင်ထားသည်** | Pkg သည် လွတ်လပ်ရမည် (Independent)။ |
## 🔥 3. The Phoenix Protocols (Self-Rebuild & Immortality Rules)
Project တစ်ခုလုံး ပြိုလဲသွားလျှင်တောင် ပြာပုံထဲမှ မူလအတိုင်း အတိအကျ ပြန်လည်ရှင်သန်နိုင်ရန် သတ်မှတ်ထားသော **"မသေမျိုး စည်းမျဉ်းများ"**။
### I. The Genetic Code (Atomic Documentation)
 * **Protocol:** ဤ Architecture စည်းမျဉ်းများကို docs/ အောက်တွင် အတိအကျ ရေးသားထားရမည်။ Developer သို့မဟုတ် AI မှ Code အသစ်ရေးတိုင်း ဤ Docs နှင့် မကိုက်ညီပါက ချက်ချင်း ပယ်ချရမည် (Self-Reject)။ Architecture သည် Code ထက် ပိုအရေးကြီးသည်။
### II. Immutability Through Fire (Strict Validation)
 * **Protocol:** Phoenix တစ်ကောင် မီးထဲဖြတ်သကဲ့သို့ Code တိုင်းသည် စစ်ဆေးမှု (Fire) ကို ဖြတ်ရမည်။
 * **Action:** golangci-lint ဖြင့် Layer ဖောက်ဖျက်မှုများကို စစ်ဆေးရမည်။ go test ဖြင့် Unit Test ရေးထားခြင်း မရှိသော Business Logic များကို Project ထဲသို့ Push လုပ်ခွင့် လုံးဝ မပေးရ (Fire-Restricted)။
### III. Modular Decoupling (Survival of the Parts)
 * **Protocol:** Service တစ်ခု (ဥပမာ- Telecom) ပြိုလဲသွားလျှင် ကျန်သော Service များ (ဥပမာ- AI Module) ဆက်လက် အလုပ်လုပ်နေရမည်။
 * **Action:** Database (သို့) Platform Error တက်ပါက middleware မှ Recovery ဖြင့် ဖမ်းထိန်းပြီး စနစ်တစ်ခုလုံး Crash ဖြစ်ခြင်းမှ ကာကွယ်ရမည်။
### IV. The Green Chip Alignment
 * **Integrity (ရိုးသားမှု):** Error များကို တိတ်တဆိတ် မဖျောက်ရ (Fail Loudly)။ Log တွင် အတိအကျ မှတ်ရမည်။
 * **Synergy (ပေါင်းစပ်မှု):** Package တစ်ခုချင်းစီ သီးခြားရပ်တည်နိုင်သော်လည်း internal/app ၌ ပေါင်းစပ်လိုက်သောအခါ အားကောင်းသော စက်ယန္တရား ဖြစ်လာရမည်။
 * **Altruism (အများအကျိုး):** ဤ Structure ကို နောင်တစ်ချိန်တွင် "Go-Bot Initializer Framework" အဖြစ် Open Source လွှတ်ပေးနိုင်ရန် အစကတည်းက Standard အတိုင်း ရေးရမည်။
✨🐲🦅
