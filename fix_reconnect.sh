#!/bin/bash
FILE="apps/android/app/src/main/java/ai/openclaw/app/NodeRuntime.kt"

# 在 onDisconnected 的 micCapture 行后添加自动重连逻辑
sed -i '/micCapture.onGatewayConnectionChanged(false)/a\    \n    // 自动重连：断连后 3 秒尝试重连\n    if (message.contains("error") || message.contains("closed")) {\n      kotlinx.coroutines.GlobalScope.launch {\n        kotlinx.coroutines.delay(3000)\n        if (_isConnected.value == false \&\& _pendingGatewayTrust.value == null) {\n          resolvePreferredGatewayEndpoint()?.let { connect(it) }\n        }\n      }\n    }' "$FILE"

echo "✓ 已添加自动重连逻辑"
