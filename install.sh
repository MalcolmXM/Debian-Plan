#!/usr/bin/env bash
# Debian 常用软件一键安装脚本
# 配合 setup.md 使用，边模拟边补充

set -euo pipefail

if [[ $EUID -ne 0 ]]; then
    echo "请使用 root 或 sudo 运行" >&2
    exit 1
fi

export DEBIAN_FRONTEND=noninteractive

apt update

# ===== 软件清单（待补充）=====

# apt install -y <pkg>

echo "安装完成"
