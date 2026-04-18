# Debian 安装后常用软件清单

> 通过 https://github.com/bin456789/reinstall 网络重装 Debian 后的初始化记录。
> 边模拟边补充，保持简洁。

## 环境信息

- 系统：Debian（reinstall 网络安装）
- 场景：待补充

## 软件清单

- `curl` — 网络安装的 Debian 默认没有，后续换源脚本也依赖它

## 配置步骤

1. **安装 curl**
   ```bash
   apt update && apt install -y curl
   ```
2. **换源**（linuxmirrors.cn 交互式）
   ```bash
   bash <(curl -sSL https://linuxmirrors.cn/main.sh)
   ```
