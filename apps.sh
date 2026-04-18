#!/usr/bin/env bash
# Debian 常用软件安装脚本
# 前置：先执行 install.sh（curl / 换源 / Docker）
# 配合 setup.md 使用，边模拟边补充

set -euo pipefail

if [[ $EUID -ne 0 ]]; then
    echo "请使用 root 或 sudo 运行" >&2
    exit 1
fi

export DEBIAN_FRONTEND=noninteractive

apt update

# ===== 常用软件（待补充）=====

# apt install -y <pkg>

echo "常用软件安装完成"
