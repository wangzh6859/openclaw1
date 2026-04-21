#!/bin/bash
FILE="apps/android/app/src/main/java/ai/openclaw/app/NodeRuntime.kt"

# 替换 GlobalScope 为 scope 并添加 @OptIn
sed -i 's/kotlinx.coroutines.GlobalScope.launch {/scope.launch {/g' "$FILE"

echo "✓ 已修复 GlobalScope 警告"
