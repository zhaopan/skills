# Awesome Skills

本手册整理了各类 AI 代理（Agent）常用技能库、工作流框架的安装与配置命令，旨在提高自动化开发效率。

## 项目结构 (Project Structure)

```plaintext
skills/                        # 项目根目录
├── GEMINI.md                  # 全局行为约束规范（语言偏好、安全边界、交付路径等）
├── agent-skills.md            # 本地工程域技能模块索引（24 个标准化技能）
├── GSD.md                     # GSD (Get Shit Done) 工作流框架指令手册
├── awesome-skills.md          # 本文件：社区精选技能集安装与配置手册
├── update.sh                  # 同步脚本：自动拉取 addyosmani/agent-skills 上游技能
├── update.bat                 # Windows 平台同步脚本
├── skills/                    # 本地注册的工程域技能模块（与 addyosmani/agent-skills 对齐）
│   ├── test-driven-development/
│   ├── code-review-and-quality/
│   ├── spec-driven-development/
│   └── ...                    # 共 24 个标准化技能模块
└── .result/                   # 任务输出结果归档目录
```

## 核心概念 (Core Concepts)

| 概念                            | 说明                                                          |
| ------------------------------- | ------------------------------------------------------------- |
| 技能模块 (Skill)                | 一组标准化的 `.md` 指令集，定义 AI 代理在特定工程域的行为规约 |
| 技能库 (Skills Repository)      | 技能模块的集合，如本项目的 `skills/` 目录、远程 GitHub 仓库   |
| 工作流框架 (Workflow Framework) | 如 GSD，提供阶段化任务编排能力                                |
| 行为规范 (Governance)           | 如 GEMINI.md，定义 AI 代理的全局约束底线                      |

---

## 核心配置与工具 (Core Config & Tools)

### Claude 跳过权限确认模式

在执行高信任度的自动化脚本时，可以使用该模式避免频繁的权限确认弹窗。

```bash
claude --dangerously-skip-permissions
```

### 本地技能库加载

将本项目挂载到 AI 助手的技能目录中，即可使用本地注册的 24 个工程域技能模块。

#### Claude Code CLI 本地加载

```bash
# 将本项目 skills/ 目录挂载为技能源
claude --plugin-dir /path/to/skills/skills/

# 或通过配置文件（~/.claude/plugins.local.json）持久化加载
```

#### Gemini CLI 本地加载

```bash
# 将本地技能目录注册到 Gemini
gemini skills install ./skills/ --path skills
```

---

## 通用工程技能库 (General Engineering Skills)

### addyosmani/agent-skills

标准化的 AI 代理工程域技能模块，包含代码审查、重构、测试驱动开发等。本项目已将其作为上游源，通过 `update.sh` 定期同步。

- **项目地址**: [https://github.com/addyosmani/agent-skills](https://github.com/addyosmani/agent-skills)

#### 更新本地技能（推荐）

```bash
# 自动从上游仓库同步 skills/ 目录
sh update.sh
```

#### Claude Code CLI 安装

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

#### Gemini CLI 安装（替代方式）

```bash
# 直接从 GitHub 安装
gemini skills install https://github.com/google/skills.git --path skills
```

### shanraisshan/claude-code-best-practice

Claude Code CLI 最佳实践与配置指南，涵盖高效使用 Claude Code CLI 的技巧、配置示例和工程规约建议。

- **项目地址**: [https://github.com/shanraisshan/claude-code-best-practice](https://github.com/shanraisshan/claude-code-best-practice)
- **主要内容**: CLAUDE.md 配置模板、工具使用指南、高效工作流建议、CLI 常用命令速查

#### 快速参考

```bash
# 克隆仓库获取配置示例
git clone https://github.com/shanraisshan/claude-code-best-practice.git

# 参考 CLAUDE.md 模板定制自己的 AI 助手行为规约
# 将模板放置于项目根目录即可生效
```

---

## 本地技能模块速查 (Local Skills Quick Reference)

本项目内置了 24 个标准化工程域技能模块，存放于 `skills/skills/` 目录。下表列出各模块的调用场景：

| 技能模块                      | 适用场景                             |
| ----------------------------- | ------------------------------------ |
| adapt-agent-configs           | 多 AI 助手配置兼容、跨平台工作流迁移 |
| api-and-interface-design      | 系统接口定义、跨模块协议对接         |
| browser-testing-with-devtools | 浏览器渲染测试、UI 异常诊断          |
| ci-cd-and-automation          | CI 流水线初始化、自动化校验配置      |
| code-review-and-quality       | 代码合并前置审计、质量评估           |
| code-simplification           | 复杂度消解、冗余逻辑精简             |
| context-engineering           | 会话上下文管理、模型幻觉收敛         |
| debugging-and-error-recovery  | 异常分诊、根因追踪、缺陷修复         |
| deprecation-and-migration     | 过时组件剥离、版本迁移               |
| documentation-and-adrs        | 架构决策记录、技术选型文档化         |
| doubt-driven-development      | 高风险逻辑的对抗性审查               |
| frontend-ui-engineering       | UI 组件构建、原子化设计系统          |
| git-workflow-and-versioning   | 版本控制规约、原子化提交             |
| idea-refine                   | 模糊需求的结构化提炼                 |
| incremental-implementation    | 垂直切片拆分、增量构建               |
| interview-me                  | 交互式需求澄清（非交互环境禁用）     |
| performance-optimization      | 性能基准测试、SLA 偏离修复           |
| planning-and-task-breakdown   | 任务解耦、依赖有向图定义             |
| security-and-hardening        | 输入过滤、身份认证、数据加密         |
| shipping-and-launch           | 发布预检、渐进式部署、回滚           |
| source-driven-development     | 框架官方文档驱动的精确实现           |
| spec-driven-development       | 技术规格书驱动的编码前契约定义       |
| test-driven-development       | 失败断言驱动的业务逻辑实现           |
| using-agent-skills            | 技能检索与工作流逻辑映射             |

详细定义请参见 [agent-skills.md](./agent-skills.md)。

---

## GSD (Get Shit Done) 工作流框架

一套完整的基于阶段（Phase）的自动化任务执行框架。

- **项目地址**: [https://github.com/gsd-build/get-shit-done](https://github.com/gsd-build/get-shit-done)
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

---

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
uipro init --ai antigravity # Antigravity (Local Workspace)
uipro init --ai copilot     # GitHub Copilot
uipro init --ai kiro        # Kiro
uipro init --ai codex       # Codex
uipro init --ai gemini      # Gemini
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

## 快速参考 (Quick Reference)

### 按 AI 助手选择安装方式

| AI 助手         | addyosmani/agent-skills                           | google/skills                               | GSD 工作流                               | UI/UX 技能                        |
| --------------- | ------------------------------------------------- | ------------------------------------------- | ---------------------------------------- | --------------------------------- |
| Claude Code CLI | `/plugin marketplace add addyosmani/agent-skills` | `npx skills add google/skills` + 手动加载   | `npx get-shit-done-cc --claude --global` | `uipro init --ai claude --global` |
| Gemini CLI      | `gemini skills install`                           | `gemini skills install` 或 `npx skills add` | `npx get-shit-done-cc --gemini --global` | `uipro init --ai gemini --global` |
| Codex CLI       | 见对应插件市场                                    | `npx skills add google/skills`              | `npx get-shit-done-cc`                   | `uipro init --ai codex --global`  |

### 日常维护命令速查

```bash
# 更新本地技能库（同步上游）
sh update.sh

# 更新 google/skills 技能
npx skills add google/skills

# 更新 UI/UX 技能
uipro update

# 查看 AI 助手已安装技能
claude --list-plugins        # Claude Code
gemini skills list           # Gemini
```

---

## 快速开始 (Quick Start)

```bash
# 1. 同步所有技能定义至最新状态
sh update.sh

# 2. 安装 GSD 工作流  核心插件
npx get-shit-done-cc@latest

# 3. 安装 Google 官方技能（交互式选择安装项）
npx skills add google/skills

# 4. 安装 UI/UX 专业设计技能
npm install -g uipro-cli
uipro init --ai claude --global

# 5. 参考 Claude Code CLI 最佳实践指南
#    https://github.com/shanraisshan/claude-code-best-practice

# 6. 以标准 GSD 流程开启新项目
#    在对话框中输入: /gsd-new-project
```
