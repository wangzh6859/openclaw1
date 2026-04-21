#!/bin/bash
FILE="apps/android/app/src/main/java/ai/openclaw/app/voice/TalkModeManager.kt"

# 用简单的字符串操作替换复杂的 JSON 解析
cat > /tmp/new_onevent.txt << 'EOF'
    override fun onEvent(eventType: Int, params: Bundle?) {
        val jsonStr = params?.getString("json") ?: return
        try {
            // 简单解析：检查是否包含 "chat.final" 和 "result"
            if (jsonStr.contains("\"method\":\"chat.final\"") || jsonStr.contains("\"method\": \"chat.final\"")) {
                // 提取 runId (从 "id" 字段)
                val idMatch = Regex("\"id\"\\s*:\\s*\"([^\"]+)\"").find(jsonStr)
                val resultMatch = Regex("\"result\"\\s*:\\s*\"([^\"]+)\"").find(jsonStr)
                
                val runId = idMatch?.groupValues?.get(1)
                val result = resultMatch?.groupValues?.get(1)
                
                if (runId != null && pendingRunId == runId) {
                    // 缓存结果
                    if (result != null) {
                        completedRunTexts[runId] = result
                    }
                    // 标记完成
                    cacheRunCompletion(runId, true)
                    // 完成等待
                    pendingFinal?.complete(true)
                    pendingFinal = null
                    pendingRunId = null
                    Log.d(tag, "chat.final received runId=$runId resultLen=${result?.length}")
                }
            }
        } catch (e: Exception) {
            Log.w(tag, "onEvent error: ${e.message}")
        }
    }
EOF

# 找到 onEvent 方法并替换
python3 << 'PYEOF'
import re

with open('apps/android/app/src/main/java/ai/openclaw/app/voice/TalkModeManager.kt', 'r', encoding='utf-8') as f:
    content = f.read()

# 读取新的 onEvent 实现
with open('/tmp/new_onevent.txt', 'r', encoding='utf-8') as f:
    new_onevent = f.read().strip()

# 替换整个 onEvent 方法
pattern = r'override fun onEvent\(eventType: Int, params: Bundle\?\) \{[^}]*\{[^}]*\}[^}]*\}'
content = re.sub(pattern, new_onevent, content, flags=re.DOTALL)

with open('apps/android/app/src/main/java/ai/openclaw/app/voice/TalkModeManager.kt', 'w', encoding='utf-8') as f:
    f.write(content)

print("✓ onEvent 已修复")
PYEOF

echo "✓ Voice 功能修复完成"
