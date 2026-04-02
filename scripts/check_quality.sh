#!/bin/bash

# Termux အတွက် အရောင်များ သတ်မှတ်ခြင်း
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

echo -e "${CYAN}====================================================${NC}"
echo -e "${YELLOW}🚀 [Quality Gate] Starting Code Validation...${NC}"
echo -e "${CYAN}====================================================${NC}\n"

# ၁။ Auto Code Formatting (Auto-fix အရင်လုပ်မယ်)
echo -e "${YELLOW}🎨 1. Auto-Formatting Code (gofmt -w)...${NC}"
# . ထဲက go file အားလုံးကို format အလိုအလျောက် ပြင်ပေးသွားမှာပါ
gofmt -w .
echo -e "${GREEN}✅ Formatting OK! (Files are now clean)${NC}\n"

# ၂။ Syntax & Duplicate Check
echo -e "${YELLOW}🛠️  2. Checking Syntax & Duplicates (go build)...${NC}"
if ! go build -o /dev/null ./...; then
    echo -e "\n${RED}❌ Build Error: အပိတ်ကွင်းကျန်တာ၊ Syntax အမှား သို့မဟုတ် Function ထပ်နေတာ ရှိနေပါတယ်။${NC}"
    exit 1
fi
echo -e "${GREEN}✅ Syntax OK!${NC}\n"

# ၃။ Static Analysis (Compiler မမြင်တဲ့ Logic အမှားတွေကို စစ်မယ်)
echo -e "${YELLOW}🔍 3. Running Static Analysis (go vet)...${NC}"
if ! go vet ./...; then
    echo -e "\n${RED}❌ Logic Error: Go Vet က အမှားတွေ့ပါတယ်။${NC}"
    exit 1
fi
echo -e "${GREEN}✅ Vet OK!${NC}\n"

# ၄။ Deep Scan (Memory, Nil Pointers အသေးစိတ်စစ်မယ်)
echo -e "${YELLOW}🔬 4. Running Deep Scan (staticcheck)...${NC}"
if command -v staticcheck &> /dev/null; then
    if ! staticcheck ./...; then
        echo -e "\n${RED}❌ Quality Error: Deep scan မအောင်မြင်ပါ။ အပေါ်က warning များကို ပြင်ပါ။${NC}"
        exit 1
    fi
    echo -e "${GREEN}✅ Deep Scan OK!${NC}\n"
else
    echo -e "${YELLOW}⚠️  Warning: staticcheck မရှိသေးပါ။${NC}"
    echo -e "Install: ${CYAN}go install honnef.co/go/tools/cmd/staticcheck@latest${NC}\n"
fi

# ၅။ Unit Tests
echo -e "${YELLOW}🧪 5. Running Unit Tests...${NC}"
if ! go test ./...; then
    echo -e "\n${RED}❌ Test Error: Unit Test တွေ ကျရှုံးပါတယ်။${NC}"
    exit 1
fi
echo -e "${GREEN}✅ Tests OK!${NC}\n"

echo -e "${CYAN}====================================================${NC}"
echo -e "${GREEN}🎉 [Permit Granted] Code အရည်အသွေး အပြည့်အဝ ကိုက်ညီပါတယ်။${NC}"
echo -e "${GREEN}GoMyanBot ကို Build/Run လုပ်ဖို့ အဆင်သင့်ဖြစ်ပါပြီ! 🚀${NC}"
echo -e "${CYAN}====================================================${NC}"

exit 0
