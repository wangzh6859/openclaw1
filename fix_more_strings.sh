#!/bin/bash
FILE="apps/android/app/src/main/java/ai/openclaw/app/ui/SettingsSheet.kt"

# 替换默认助手的详细说明
sed -i 's/"OpenClaw is registered as the device assistant."/stringResource(R.string.assistant_registered)/g' "$FILE"
sed -i 's/"Let Android launch OpenClaw from the assistant gesture. Google Assistant App Actions still work separately."/stringResource(R.string.assistant_let_launch)/g' "$FILE"

# 替换位置权限相关
sed -i 's/Text("Off", style = mobileHeadline)/Text(stringResource(R.string.location_off), style = mobileHeadline)/g' "$FILE"
sed -i 's/Text("Disable location sharing.", style = mobileCallout)/Text(stringResource(R.string.disable_location), style = mobileCallout)/g' "$FILE"
sed -i 's/Text("While Using", style = mobileHeadline)/Text(stringResource(R.string.location_while_using), style = mobileHeadline)/g' "$FILE"
sed -i 's/Text("Only while OpenClaw is open.", style = mobileCallout)/Text(stringResource(R.string.only_while_open), style = mobileCallout)/g' "$FILE"
sed -i 's/Text("Precise Location", style = mobileHeadline)/Text(stringResource(R.string.precise_location), style = mobileHeadline)/g' "$FILE"
sed -i 's/Text("Use precise GPS when available.", style = mobileCallout)/Text(stringResource(R.string.use_precise_gps), style = mobileCallout)/g' "$FILE"

# 替换其他设置
sed -i 's/Text("Prevent Sleep", style = mobileHeadline)/Text(stringResource(R.string.prevent_sleep), style = mobileHeadline)/g' "$FILE"
sed -i 's/Text("Keep screen awake while open.", style = mobileCallout)/Text(stringResource(R.string.keep_screen_awake), style = mobileCallout)/g' "$FILE"
sed -i 's/Text("Debug Canvas", style = mobileHeadline)/Text(stringResource(R.string.debug_canvas), style = mobileHeadline)/g' "$FILE"
sed -i 's/Text("Show status overlay on canvas.", style = mobileCallout)/Text(stringResource(R.string.show_status_overlay), style = mobileCallout)/g' "$FILE"

echo "✓ 已修复遗漏的字符串引用"
