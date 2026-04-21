#!/usr/bin/env python3
"""
OpenClaw Android 汉化补丁脚本
将硬编码的英文 UI 文本替换为字符串资源引用
"""
import os
import re

# 定义需要替换的文本映射
replacements = {
    # Onboarding 相关
    r'"Trust this gateway\?"': 'R.string.trust_gateway_title',
    r'"Trust and continue"': 'R.string.trust_and_continue',
    r'"Cancel"': 'R.string.cancel',
    r'"Next"': 'R.string.next',
    r'"Finish"': 'R.string.finish',
    r'"Connect"': 'R.string.connect',
    r'"Scan QR code"': 'R.string.scan_qr_code',
    r'"QR captured\. Review endpoint below\."': 'R.string.qr_captured',
    r'"Advanced setup"': 'R.string.advanced_setup',
    r'"Paste setup code or manually enter host/port\. Private LAN ws:// is supported; Tailscale/public hosts need wss://\."': 'R.string.advanced_setup_desc',
    r'"SETUP_CODE"': 'R.string.setup_code',
    r'"Paste code from `openclaw qr --setup-code-only`"': 'R.string.paste_setup_code_hint',
    r'"HOST"': 'R.string.host',
    
    # 通用文本
    r'"Loading\.\.\."': 'R.string.loading',
    r'"Error"': 'R.string.error',
    r'"Retry"': 'R.string.retry',
    r'"Save"': 'R.string.save',
    r'"Delete"': 'R.string.delete',
    r'"Settings"': 'R.string.settings',
    r'"Done"': 'R.string.done',
    r'"Close"': 'R.string.close',
}

def process_file(filepath):
    """处理单个文件"""
    try:
        with open(filepath, 'r', encoding='utf-8') as f:
            content = f.read()
        
        original = content
        count = 0
        
        for pattern, replacement in replacements.items():
            if re.search(pattern, content):
                content = re.sub(pattern, replacement, content)
                count += 1
        
        if content != original:
            with open(filepath, 'w', encoding='utf-8') as f:
                content = f.write(content)
            print(f"✓ 已处理：{filepath} ({count} 处替换)")
            return True
    except Exception as e:
        print(f"✗ 处理失败 {filepath}: {e}")
    
    return False

def main():
    base_dir = "apps/android/app/src/main/java/ai/openclaw/app/ui"
    processed = 0
    
    for root, dirs, files in os.walk(base_dir):
        for file in files:
            if file.endswith(".kt"):
                filepath = os.path.join(root, file)
                if process_file(filepath):
                    processed += 1
    
    print(f"\n完成！共处理 {processed} 个文件")

if __name__ == "__main__":
    main()
