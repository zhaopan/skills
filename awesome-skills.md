# Awesome Skills

本手册整理了各类 AI 代理（Agent）常用技能库、工作流框架的安装与配置命令，旨在提高自动化开发效率。

## 核心配置与工具 (Core Config & Tools)

### Claude 跳过权限确认模式

在执行高信任度的自动化脚本时，可以使用该模式避免频繁的权限确认弹窗。

```bash
claude --dangerously-skip-permissions
```

---

## 通用工程技能库 (General Engineering Skills)

### addyosmani/agent-skills

标准化的 AI 代理工程域技能模块，包含代码审查、重构、测试驱动开发等。

- **项目地址**: [https://github.com/addyosmani/agent-skills](https://github.com/addyosmani/agent-skills)

#### Claude Code 安装

```bash
# 通过 Marketplace 安装
/plugin marketplace add addyosmani/agent-skills
/plugin install agent-skills@addy-agent-skills

# 开发者本地模式
git clone https://github.com/addyosmani/agent-skills.git
claude --plugin-dir /path/to/agent-skills
```

#### Gemini CLI 安装

```bash
# 直接从仓库安装
gemini skills install https://github.com/addyosmani/agent-skills.git --path skills

# 从本地克隆安装
gemini skills install ./agent-skills/skills/
```

### google/skills

Google 官方发布的 Agent Skills 技能库，覆盖 Google Cloud 产品与技术的专项技能。

- **项目地址**: [https://github.com/google/skills](https://github.com/google/skills)
- **技能组织**: 仓库根目录即技能库本身，技能按主题分类存放于 `skills/` 下（如 `skills/cloud/`）

#### 安装命令

```bash
# 使用 npx 快速添加（交互式选择要安装的技能）
npx skills add google/skills
```

#### 可用技能列表

| 技能                                                       | 说明                             |
| ---------------------------------------------------------- | -------------------------------- |
| Gemini API in Agent Platform                               | Gemini API 在 Agent 平台中的使用 |
| AlloyDB Basics                                             | AlloyDB 数据库基础               |
| BigQuery Basics                                            | BigQuery 数据仓库基础            |
| Cloud Run Basics                                           | Cloud Run 无服务器容器基础       |
| Cloud SQL Basics                                           | Cloud SQL 关系型数据库基础       |
| Firebase Basics                                            | Firebase 开发平台基础            |
| Kubernetes Engine (GKE) Basics                             | GKE 容器编排基础                 |
| Recipe: Onboarding to Google Cloud                         | Google Cloud 入门指南            |
| Recipe: Authenticating to Google Cloud                     | Google Cloud 认证配置            |
| Recipe: Google Cloud Network Observability                 | 网络可观测性实践                 |
| Google Cloud Well-Architected Framework: Security          | 安全架构最佳实践                 |
| Google Cloud Well-Architected Framework: Reliability       | 可靠性架构最佳实践               |
| Google Cloud Well-Architected Framework: Cost Optimization | 成本优化架构最佳实践             |

---

## GSD (Get Shit Done) 工作流框架

一套完整的基于阶段（Phase）的自动化任务执行框架。

- **中文文档**: [README.zh-CN](https://github.com/gsd-build/get-shit-done/blob/main/README.zh-CN.md)
- **指令详解**: [GSD 指令手册 (GSD.md)](GSD.md)

#### 全自动安装与初始化

```bash
# 运行安装向导
npx get-shit-done-cc@latest

# 针对特定 AI 助手的全局安装示例
npx get-shit-done-cc --claude --global       # 安装到 ~/.claude/
npx get-shit-done-cc --antigravity --global  # 安装到 ~/.gemini/antigravity/
npx get-shit-done-cc --gemini --global       # 安装到 ~/.gemini/
npx get-shit-done-cc --cursor --global       # 安装到 ~/.cursor/
npx get-shit-done-cc --all --global          # 一键安装到所有支持的环境
```

#### 核心工作流指令

```bash
/gsd-new-project        # 初始化新项目
/gsd-discuss-phase 1    # 需求讨论阶段
/gsd-plan-phase 1       # 制定执行计划
/gsd-execute-phase 1    # 执行代码编写
/gsd-verify-work 1      # 结果验证与 UAT
/gsd-ship 1             # 提交 PR 并准备合并
```

#### Wave 并行执行模型

GSD 采用分波次（Wave）的并行任务处理逻辑，确保依赖项按序完成。

```plaintext
┌─────────────────────────────────────────────────────────────────────┐
│  PHASE EXECUTION (WAVE MODEL)                                       │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  WAVE 1 (Parallel)          WAVE 2 (Parallel)          WAVE 3       │
│  ┌─────────┐ ┌─────────┐    ┌─────────┐ ┌─────────┐    ┌─────────┐  │
│  │ Plan 01 │ │ Plan 02 │ →  │ Plan 03 │ │ Plan 04 │ →  │ Plan 05 │  │
│  │ User    │ │ Product │    │ Orders  │ │ Cart    │    │ Checkout│  │
│  │ Model   │ │ Model   │    │ API     │ │ API     │    │ UI      │  │
│  └─────────┘ └─────────┘    └─────────┘ └─────────┘    └─────────┘  │
│       │           │              ↑           ↑              ↑       │
│       └───────────┴──────────────┴───────────┘              │       │
│              Dependencies: Plan 03 needs Plan 01            │       │
│                          Plan 04 needs Plan 02              │       │
│                          Plan 05 needs Plans 03 + 04        │       │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

## UI/UX 专项技能 (UI/UX Specialized Skills)

### nextlevelbuilder/ui-ux-pro-max-skill

提供专业的 UI/UX 设计与实现能力。

- **项目地址**: [https://github.com/nextlevelbuilder/ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill)

#### 安装命令

```bash
# 全局安装 CLI 工具
npm install -g uipro-cli

# 进入项目目录并初始化对应的 AI 助手
cd /path/to/your/project

uipro init --ai claude      # Claude Code
uipro init --ai cursor      # Cursor
uipro init --ai windsurf    # Windsurf
uipro init --ai antigravity # Antigravity (Local Workspace)
uipro init --ai copilot     # GitHub Copilot
uipro init --ai kiro        # Kiro
uipro init --ai codex       # Codex CLI
uipro init --ai gemini      # Gemini CLI
uipro init --ai trae        # Trae
uipro init --ai all         # 为所有已安装的助手初始化

# 全局安装（适用于所有项目）
uipro init --ai claude --global   # 安装到 ~/.claude/skills/
uipro init --ai cursor --global   # 安装到 ~/.cursor/skills/
```

#### 常用维护指令

```bash
uipro versions              # 列出可用版本
uipro update                # 更新至最新版本
uipro uninstall             # 自动检测并卸载
uipro uninstall --ai claude # 卸载特定平台的技能
```

#### 调用示例

```bash
# 使用快捷指令触发
/ui-ux-pro-max Build a landing page for my SaaS product
```

---
