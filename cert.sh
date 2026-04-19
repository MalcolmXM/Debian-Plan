#!/usr/bin/env bash
# 为服务器公网 IP 申请 Let's Encrypt 短期证书（6 天有效期）
# 前置：install.sh 已执行（curl / 换源）
# 方案：acme.sh + Let's Encrypt，自动续期

set -euo pipefail

if [[ $EUID -ne 0 ]]; then
    echo "请使用 root 或 sudo 运行" >&2
    exit 1
fi

: "${ACME_EMAIL:?请设置 ACME_EMAIL 环境变量}"
: "${SERVER_IP:?请设置 SERVER_IP 环境变量（公网 IP）}"

# ===== 第 1 步：安装 acme.sh =====
if ! command -v acme.sh >/dev/null 2>&1 && [[ ! -f "$HOME/.acme.sh/acme.sh" ]]; then
    curl https://get.acme.sh | sh -s "email=${ACME_EMAIL}"
fi

ACME="$HOME/.acme.sh/acme.sh"

# 默认 CA 设为 Let's Encrypt
"$ACME" --set-default-ca --server letsencrypt

# ===== 第 2 步：签发 IP 证书（standalone 模式占用 80 端口）=====
# 签发前确认 80 端口未被占用
if ss -ltn | awk '{print $4}' | grep -qE ':80$'; then
    echo "80 端口已被占用，请先停止相关服务" >&2
    exit 1
fi

"$ACME" --issue --standalone -d "$SERVER_IP"

# ===== 第 3 步：安装证书到固定路径 =====
install -d /etc/ssl/ipcert
"$ACME" --install-cert -d "$SERVER_IP" \
    --key-file       /etc/ssl/ipcert/key.pem \
    --fullchain-file /etc/ssl/ipcert/fullchain.pem \
    --reloadcmd      "echo '证书已更新：'$(date)"

# ===== 第 4 步：自动续期 =====
# acme.sh 安装时已写入 cron，无需额外配置

echo "IP 证书配置完成：/etc/ssl/ipcert/"
