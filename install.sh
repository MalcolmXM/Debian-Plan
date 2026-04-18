#!/usr/bin/env bash
# Debian 常用软件一键安装脚本
# 配合 setup.md 使用，边模拟边补充

set -euo pipefail

if [[ $EUID -ne 0 ]]; then
    echo "请使用 root 或 sudo 运行" >&2
    exit 1
fi

export DEBIAN_FRONTEND=noninteractive

# ===== 第 1 步：安装 curl =====
# reinstall 网络安装的 Debian 默认没有 curl
apt update
apt install -y curl

# ===== 第 2 步：换源 =====
# 使用 linuxmirrors.cn 交互式换源
bash <(curl -sSL https://linuxmirrors.cn/main.sh)

echo "curl 安装 + 换源完成"
