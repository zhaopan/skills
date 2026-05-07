#!/bin/bash
# -----------------------------------------------------------------------------
# 脚本名称: update.sh
# 描述: 自动同步 addyosmani/agent-skills 仓库的工程域技能模块。
# 逻辑: 
#   1. 临时挂载远程权威源 (Upstream Mapping)。
#   2. 检索远程分支元数据 (Remote Fetching)。
#   3. 执行特定域直接检出 (Direct Checkout Overwrite)，不产生临时文件夹。
#   4. 卸载远程挂载点并清理引用。
# -----------------------------------------------------------------------------

set -e

# 技术参数配置
REMOTE_REPO="https://github.com/addyosmani/agent-skills"
LOCAL_SKILLS_DIR="skills"
UPSTREAM_NAME="upstream-sync-source"

echo "[INFO] 启动技能库直接同步协议..."

# 环境预检：确保当前处于 Git 仓库环境
if [ ! -d ".git" ]; then
    echo "[ERROR] 当前目录非 Git 仓库，无法执行直接检出协议。"
    exit 1
fi

# 1. 临时挂载远程权威源
echo "[INFO] 正在挂载远程源: $REMOTE_REPO"
git remote add "$UPSTREAM_NAME" "$REMOTE_REPO" 2>/dev/null || git remote set-url "$UPSTREAM_NAME" "$REMOTE_REPO"

# 2. 检索远程逻辑元数据
echo "[INFO] 正在检索远程分支元数据..."
git fetch "$UPSTREAM_NAME" --depth 1

# 3. 执行特定域直接检出
# 注意：该操作将直接以远程内容覆盖本地目标目录
echo "[INFO] 正在执行跨域技能直接覆盖更新..."
git checkout "$UPSTREAM_NAME/main" -- "$LOCAL_SKILLS_DIR"

# 4. 卸载远程源并清理引用
echo "[INFO] 正在清理远程挂载点与引用..."
git remote remove "$UPSTREAM_NAME"

echo "[SUCCESS] 直接同步协议执行完毕。本地工程域已通过 Git 检出实现与权威源的逻辑对齐。"
