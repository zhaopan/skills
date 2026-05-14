# AI Agent Skills Hub

本项目是一个集成了标准化工程规约、自动化工作流指令及精选 AI 技能库的综合工程中心。其核心目标是为 AI 代理（Agent）确立一套标准化的软件开发工作流，并建立可量化的质量控制基准。

## 全局行为准则 (Global Governance)

### [Antigravity / Gemini CLI 核心规范](./GEMINI.md)
全局行为约束。这是 AI 代理执行任务时的底层逻辑底座，涵盖了语言偏好、安全边界、交付路径、代码质量审计以及交互标识等核心标准。所有 AI 代理在介入本项目时必须优先加载并严格执行此规范。

## 核心组件 (Core Components)

### [工程域技能模块 (Engineering Skills)](./agent-skills.md)
定义了 20+ 个标准化的 AI 代理工程技能模块（如 TDD, SDD, 代码审计等），用于收敛模型幻觉并确立输出一致性标准。

### [GSD (Get Shit Done) 工作流](./GSD.md)
一套完整的、基于阶段（Phase）的自动化任务执行框架。包含从需求讨论（Discuss）、计划（Plan）到执行（Execute）及验证（Verify）的全生命周期指令。

### [精选技能集 (Awesome Skills)](./awesome-skills.md)
汇集了社区中优秀的 AI 助手扩展能力与安装手册，涵盖 UI/UX 设计、自动测试、系统架构等多个领域。

## 工程规约 (Engineering Conventions)

本项目下的所有操作与输出必须严格遵循以下规约：

- **变更域隔离协议**：严格限制代码修改于目标任务域，严禁执行非相关的附属重构。
- **架构极简约束**：优先采用低复杂度、高内聚的逻辑实现方案，严禁过度设计。
- **原子化提交**：强制执行原子化提交策略，每一笔 Commit 必须是逻辑自洽的最小功能单元。
- **文档先行**：在执行非琐碎变更前，必须通过 SPEC.md 或 PLAN.md 确立逻辑基准。

## 快速开始

1. **同步更新**: 运行 `sh update.sh` 以确保所有技能定义处于最新状态。
2. **初始化工作流**: 运行 `npx get-shit-done-cc@latest` 为你的 AI 助手安装 GSD CLI 核心插件。
3. **启动工程**: 在对话框中输入 `/gsd-new-project` 以标准的 GSD 流程开启新项目。
4. **按需扩展**: 参考 [awesome-skills.md](./awesome-skills.md) 安装 UI/UX、测试生成等专项技能插件。
