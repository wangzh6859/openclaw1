#!/bin/bash
FILE="apps/android/app/src/main/java/ai/openclaw/app/ui/OnboardingFlow.kt"

# 替换 Scan QR code
sed -i 's/Text("Scan QR code", style = onboardingHeadlineStyle\.copy(fontWeight = FontWeight\.Bold))/Text(R.string.scan_qr_code, style = onboardingHeadlineStyle.copy(fontWeight = FontWeight.Bold))/g' "$FILE"

# 替换 QR captured
sed -i 's/Text("QR captured\. Review endpoint below\.", style = onboardingCalloutStyle, color = onboardingSuccess)/Text(R.string.qr_captured, style = onboardingCalloutStyle, color = onboardingSuccess)/g' "$FILE"

# 替换 Advanced setup
sed -i 's/Text("Advanced setup", style = onboardingHeadlineStyle, color = onboardingText)/Text(R.string.advanced_setup, style = onboardingHeadlineStyle, color = onboardingText)/g' "$FILE"

# 替换高级设置的描述文本
sed -i 's/Text("Paste setup code or manually enter host\/port\. Private LAN ws:\/\/ is supported; Tailscale\/public hosts need wss:\/\/\.", style = onboardingCaption1Style, color = onboardingTextSecondary)/Text(R.string.advanced_setup_desc, style = onboardingCaption1Style, color = onboardingTextSecondary)/g' "$FILE"

# 替换 SETUP CODE
sed -i 's/Text("SETUP_CODE", style = onboardingCaption1Style\.copy(letterSpacing = 0\.9\.sp), color = onboardingTextSecondary)/Text(R.string.setup_code, style = onboardingCaption1Style.copy(letterSpacing = 0.9.sp), color = onboardingTextSecondary)/g' "$FILE"

# 替换 HOST
sed -i 's/Text("HOST", style = onboardingCaption1Style\.copy(letterSpacing = 0\.9\.sp), color = onboardingTextSecondary)/Text(R.string.host, style = onboardingCaption1Style.copy(letterSpacing = 0.9.sp), color = onboardingTextSecondary)/g' "$FILE"

echo "✓ 第二批汉化完成！"
