# AI Agent Skills Hub

本项目是一个集成了标准化工程规约、自动化工作流指令及精选 AI 技能库的综合工程中心。其核心目标是为 AI 代理（Agent）确立一套标准化的软件开发工作流，并建立可量化的质量控制基准。

## 核心组件 (Core Components)

| 组件                                     | 说明                                                                                    |
| ---------------------------------------- | --------------------------------------------------------------------------------------- |
| [GEMINI.md](./GEMINI.md)                 | 全局行为约束，AI 代理执行任务的底层逻辑底座（语言偏好、安全边界、交付路径、质量审计等） |
| [agent-skills.md](./agent-skills.md)     | 工程域技能模块，定义 20+ 个标准化 AI 代理工程技能（TDD、SDD、代码审计等）               |
| [GSD.md](./GSD.md)                       | GSD (Get Shit Done) 自动化任务执行框架，覆盖需求讨论、计划、执行、验证全生命周期        |
| [awesome-skills.md](./awesome-skills.md) | 社区精选 AI 助手扩展技能集与安装手册                                                    |

### 已注册技能模块 (Registered Skills)

项目内置了 20+ 个标准化的 AI 代理技能模块，存放于 `skills/` 目录下：

| 技能模块                      | 说明                 |
| ----------------------------- | -------------------- |
| adapt-agent-configs           | Agent 配置适配       |
| api-and-interface-design      | API 与接口设计       |
| browser-testing-with-devtools | 浏览器 DevTools 测试 |
| ci-cd-and-automation          | CI/CD 与自动化       |
| code-review-and-quality       | 代码审查与质量       |
| code-simplification           | 代码简化             |
| context-engineering           | 上下文工程           |
| debugging-and-error-recovery  | 调试与错误恢复       |
| deprecation-and-migration     | 弃用与迁移           |
| documentation-and-adrs        | 文档与 ADR 记录      |
| doubt-driven-development      | 质疑驱动开发         |
| frontend-ui-engineering       | 前端 UI 工程         |
| git-workflow-and-versioning   | Git 工作流与版本管理 |
| idea-refine                   | 创意精炼             |
| incremental-implementation    | 增量实现             |
| interview-me                  | 面试模拟             |
| performance-optimization      | 性能优化             |
| planning-and-task-breakdown   | 规划与任务分解       |
| security-and-hardening        | 安全与加固           |
| shipping-and-launch           | 发布与上线           |
| source-driven-development     | 源码驱动开发         |
| spec-driven-development       | 规范驱动开发         |
| test-driven-development       | 测试驱动开发         |
| using-agent-skills            | 技能使用指南         |

### 社区精选技能集 (Community Awesome Skills)

收录的第三方技能库包括：

- **[google/skills](https://github.com/google/skills)** — Google 官方 Agent Skills，覆盖 Cloud Run、BigQuery、GKE、Firebase 等 13 项 Google Cloud 产品技能
- **[addyosmani/agent-skills](https://github.com/addyosmani/agent-skills)** — 标准化 AI 代理工程技能模块（TDD、代码审计、重构等）
- **[nextlevelbuilder/ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill)** — UI/UX 专业设计与实现技能

详细的安装命令与配置说明请参见 [awesome-skills.md](./awesome-skills.md)。

## 工程规约 (Engineering Conventions)

本项目下的所有操作与输出必须严格遵循以下规约：

- **变更域隔离协议**：严格限制代码修改于目标任务域，严禁执行非相关的附属重构。
- **架构极简约束**：优先采用低复杂度、高内聚的逻辑实现方案，严禁过度设计。
- **原子化提交**：强制执行原子化提交策略，每一笔 Commit 必须是逻辑自洽的最小功能单元。
- **文档先行**：在执行非琐碎变更前，必须通过 SPEC.md 或 PLAN.md 确立逻辑基准。

## 快速开始 (Quick Start)

```bash
# 1. 同步所有技能定义至最新状态
sh update.sh

# 2. 安装 GSD 工作流 CLI 核心插件
npx get-shit-done-cc@latest

# 3. 以标准 GSD 流程开启新项目
#    在对话框中输入: /gsd-new-project

# 4. 安装社区技能库

# Google 官方 Agent Skills（交互式选择安装项）
npx skills add google/skills

# 标准化 AI 代理工程技能模块
# 见 awesome-skills.md 中 addyosmani/agent-skills 的详细安装说明

# UI/UX 专业设计技能（需先安装 uipro-cli）
npm install -g uipro-cli
uipro init --ai claude --global

# 5. 参考 Claude Code 最佳实践指南
#    https://github.com/shanraisshan/claude-code-best-practice
```

## 参考资源 (Reference Resources)

- [shanraisshan/claude-code-best-practice](https://github.com/shanraisshan/claude-code-best-practice) — Claude Code 最佳实践与配置指南
- [addyosmani/agent-skills](https://github.com/addyosmani/agent-skills) — 标准化 AI 代理工程技能模块
- [google/skills](https://github.com/google/skills) — Google 官方 Agent Skills 技能库
- [nextlevelbuilder/ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill) — UI/UX 专业设计技能
