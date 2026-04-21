#!/bin/bash
# OpenClaw Android 汉化补丁脚本

FILE="apps/android/app/src/main/java/ai/openclaw/app/ui/OnboardingFlow.kt"

echo "正在汉化 $FILE ..."

# 替换 Trust this gateway?
sed -i 's/Text("Trust this gateway?", style = onboardingHeadlineStyle, color = onboardingText)/Text(R.string.trust_gateway_title, style = onboardingHeadlineStyle, color = onboardingText)/g' "$FILE"

# 替换 Trust and continue
sed -i 's/Text("Trust and continue")/Text(R.string.trust_and_continue)/g' "$FILE"

# 替换 Cancel
sed -i 's/Text("Cancel")/Text(R.string.cancel)/g' "$FILE"

# 替换 Next (多处)
sed -i 's/Text("Next", style = onboardingHeadlineStyle\.copy(fontWeight = FontWeight\.Bold))/Text(R.string.next, style = onboardingHeadlineStyle.copy(fontWeight = FontWeight.Bold))/g' "$FILE"

# 替换 Finish
sed -i 's/Text("Finish", style = onboardingHeadlineStyle\.copy(fontWeight = FontWeight\.Bold))/Text(R.string.finish, style = onboardingHeadlineStyle.copy(fontWeight = FontWeight.Bold))/g' "$FILE"

# 替换 Connect
sed -i 's/Text("Connect", style = onboardingHeadlineStyle\.copy(fontWeight = FontWeight\.Bold))/Text(R.string.connect, style = onboardingHeadlineStyle.copy(fontWeight = FontWeight.Bold))/g' "$FILE"

echo "✓ 汉化完成！"
