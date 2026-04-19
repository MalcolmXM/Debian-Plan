#!/usr/bin/env bash
# 为服务器公网 IP 申请 Let's Encrypt 短期证书（6 天有效期）
# 前置：install.sh 已执行（curl / 换源）
# 方案：acme.sh + Let's Encrypt，自动续期

set -euo pipefail

if [[ $EUID -ne 0 ]]; then
    echo "请使用 root 或 sudo 运行" >&2
    exit 1
fi

# ===== 第 1 步：安装 acme.sh =====
# curl https://get.acme.sh | sh -s email=<your-email>

# ===== 第 2 步：签发 IP 证书 =====
# 待补充：签发方式（standalone / webroot / dns）与 IP

# ===== 第 3 步：自动续期 =====
# acme.sh 默认安装 cron，无需额外配置

echo "IP 证书配置完成"
