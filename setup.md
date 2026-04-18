# Debian 安装后常用软件清单

> 通过 https://github.com/bin456789/reinstall 网络重装 Debian 后的初始化记录。
> 边模拟边补充，保持简洁。

## 环境信息

- 系统：Debian（reinstall 网络安装）
- 场景：待补充

## 软件清单

### 基础 / 第一阶段（`install.sh`）

- `curl` — 网络安装的 Debian 默认没有，后续换源脚本也依赖它
- `docker` — 通过 linuxmirrors.cn 一键安装并配置镜像源

### 常用软件（`apps.sh`）

（待补充）

## 配置步骤

### 第一阶段：基础环境（`install.sh`）

1. **安装 curl**
   ```bash
   apt update && apt install -y curl
   ```
2. **换源**（linuxmirrors.cn 交互式）
   ```bash
   bash <(curl -sSL https://linuxmirrors.cn/main.sh)
   ```
3. **安装 Docker + 配置 Docker 源**
   ```bash
   bash <(curl -sSL https://linuxmirrors.cn/docker.sh)
   ```

### 第二阶段：常用软件（`apps.sh`）

（待补充）
