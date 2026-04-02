# 🎯 Phase 2: Logic Liquidation & AI Integration Roadmap

- ***Project:*** Myan-Bot-Ultimate (Mosaic Architecture)

- ***Focus:*** Service Layer Extraction & AI Domain Intelligence

- *** Status:*** [ ] Pending

## 🏗️ ၁။ Logic Migration Plan (From Handler to Service)

- လက်ရှိ` handler.go `မှာရှိတဲ့ "ဦးနှောက်" (Logic) တွေကို UI နဲ့ ခွဲထုတ်ပြီး `internal/service/telecom` ထဲကို ရွှေ့မယ့် အစီအစဉ်ပါ။

- ### 📝 ***Task ID:*** LOGIC-TC-001 (Telecom Service Refactoring)

- ***Target File:*** `internal/service/telecom/service.go`

- ***Action:*** `handler.go` ထဲက အောက်ပါ function တွေကို Pure Go functions တွေအဖြစ် ပြောင်းလဲရန် -

- [ ] ParsePhoneAndOperator -> Input string ကနေ Clean Phone နဲ့ Operator ခွဲထုတ်ခြင်း။

- [ ] ValidateTransactionID -> Transaction ID format (ဂဏန်း ၆ လုံး သို့မဟုတ် ID) မှန်၊ မမှန် စစ်ဆေးခြင်း။

- [ ] CalculateDiscount -> Operator အလိုက် Promo ဈေးနှုန်းများ တွက်ချက်ခြင်း။

## 🧠 ၂။ AI Sentinel Domain Enhancement

- User ဆီကလာတဲ့ Message တွေကို AI ကနေ ပိုပြီး Smart ကျကျ တုံ့ပြန်ပေးဖို့ ဖြစ်ပါတယ်။

- ### 📝 ***Task ID:*** AI-LRN-002 (English Grammar Mentor)

- ***Goal:*** User က Learning Hub မှာ စာရိုက်လိုက်တာနဲ့ AI က Grammar ကို Error Checking လုပ်ပေးရန်။

- ***Prompt Engineering:*** * "You are a helpful English Mentor. Analyze the user's input. If there's a grammar mistake, explain why and provide the correct version in a friendly, peer-to-peer tone."

- ***State Trigger:*** `constants.STEP_AWAITING_INPUT` မှာ ဒီ Logic ကို ဖွင့်ပေးပါမယ်။

- ### 📝 ***Task ID:*** AI-PROG-003 (Go Code Reviewer)

- ***Goal:*** User က Programming Hub မှာ Go code တွေ ပို့လာရင် AI က Review လုပ်ပြီး အကြံပြုပေးရန်။

## 📊 ၃။ ID Format Standards (Data Integrity)

- Database နဲ့ Tracking အတွက် အသုံးပြုမယ့် Standard ID Formats များ -

| Category | ID Format Example | Description |
| :--- | :--- | :--- |
| Order | ID ORD-20260402-XXXX | ရက်စွဲ + Random String (Telecom Orders အတွက်) |
| User | ID USR-TG-XXXXXXXX | Telegram ID ကို Base လုပ်ထားသော Global User ID |
| Lesson | ID LRN-ENG-GR-001 | Domain (LRN) + Topic (ENG) + Sub (GR) + No. |
| Transaction | ID TXN-KBZ-XXXXXX | Bank Name + Last 6 Digits/ID |

## 🚀 ၄။ Implementation Checklist (Developer's Sync)

- [ ] Step 1: `internal/service/telecom` package အသစ်ကို ဆောက်ပါ။

- [ ] Step 2: `handler.go` ထဲက OrderService interface ကို အဆင့်မြှင့်ပါ။

- [ ] Step 3: Gemini AI ကို context aware ဖြစ်အောင်` learning.Servi`ce ထဲမှာ system instruction တွေ ထည့်ပါ။

- [ ] Step 4: `main.go` မှာ telecomService ကို initialize လုပ်ပြီး inject လုပ်ပါ။

---

**Architect:** [Zaw Win Htay (Jme)](https://www.linkedin.com/in/zaw-win-htay-jme)  
**Philosophy:** Modular Mindset | Result-Oriented | Async-First