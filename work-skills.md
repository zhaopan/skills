# work

## 推荐：claude 跳过权限确认模式

```bash
claude --dangerously-skip-permissions
```


## nextlevelbuilder/ui-ux-pro-max-skill

https://github.com/nextlevelbuilder/ui-ux-pro-max-skill


```bash
## Install CLI globally
npm install -g uipro-cli

# Go to your project
cd /path/to/your/project

## Install for your AI assistant
uipro init --ai claude      # Claude Code
uipro init --ai cursor      # Cursor
uipro init --ai windsurf    # Windsurf
uipro init --ai antigravity # Antigravity
uipro init --ai copilot     # GitHub Copilot
uipro init --ai kiro        # Kiro
uipro init --ai codex       # Codex CLI
uipro init --ai qoder       # Qoder
uipro init --ai roocode     # Roo Code
uipro init --ai gemini      # Gemini CLI
uipro init --ai trae        # Trae
uipro init --ai opencode    # OpenCode
uipro init --ai continue    # Continue
uipro init --ai codebuddy   # CodeBuddy
uipro init --ai droid       # Droid (Factory)
uipro init --ai kilocode    # KiloCode
uipro init --ai warp        # Warp
uipro init --ai augment     # Augment
uipro init --ai all         # All assistants

## Global Install (Available for All Projects)

uipro init --ai claude --global   # Install to ~/.claude/skills/
uipro init --ai cursor --global   # Install to ~/.cursor/skills/

## Other CLI Commands

uipro versions              # List available versions
uipro update                # Update to latest version
uipro init --offline        # Skip GitHub download, use bundled assets
uipro uninstall             # Remove skill (auto-detect platform)
uipro uninstall --ai claude # Remove specific platform
uipro uninstall --global    # Remove from global install

## Skill Mode (Auto-activate)
Build a landing page for my SaaS product

## Use the slash command to invoke the skill:
/ui-ux-pro-max Build a landing page for my SaaS product
```


## addyosmani/agent-skills

https://github.com/addyosmani/agent-skills


```bash
## Claude Code

# Marketplace install:
/plugin marketplace add addyosmani/agent-skills
/plugin install agent-skills@addy-agent-skills

# HTTPS URL
/plugin marketplace add https://github.com/addyosmani/agent-skills.git
/plugin install agent-skills@addy-agent-skills

# Local / development:
git clone https://github.com/addyosmani/agent-skills.git
claude --plugin-dir /path/to/agent-skills

## Gemini CLI

# Install from the repo:
gemini skills install https://github.com/addyosmani/agent-skills.git --path skills

# Install from a local clone:
gemini skills install ./agent-skills/skills/
```

## google/skills

https://github.com/google/skills


```bash
# Installation

npx skills add google/skills
```

## gsd-build/get-shit-done

[README.zh-CN](https://github.com/gsd-build/get-shit-done/blob/main/README.zh-CN.md)


```bash
## Installation

npx get-shit-done-cc@latest


# Claude Code
npx get-shit-done-cc --claude --global   # 安装到 ~/.claude/
npx get-shit-done-cc --claude --local    # 安装到 ./.claude/

# OpenCode
npx get-shit-done-cc --opencode --global # 安装到 ~/.config/opencode/

# Gemini CLI
npx get-shit-done-cc --gemini --global   # 安装到 ~/.gemini/

# Kilo
npx get-shit-done-cc --kilo --global     # 安装到 ~/.config/kilo/
npx get-shit-done-cc --kilo --local      # 安装到 ./.kilo/

# Codex
npx get-shit-done-cc --codex --global    # 安装到 ~/.codex/
npx get-shit-done-cc --codex --local     # 安装到 ./.codex/

# Copilot
npx get-shit-done-cc --copilot --global  # 安装到 ~/.github/
npx get-shit-done-cc --copilot --local   # 安装到 ./.github/

# Cursor CLI
npx get-shit-done-cc --cursor --global   # 安装到 ~/.cursor/
npx get-shit-done-cc --cursor --local    # 安装到 ./.cursor/

# Antigravity
npx get-shit-done-cc --antigravity --global # 安装到 ~/.gemini/antigravity/
npx get-shit-done-cc --antigravity --local  # 安装到 ./.agent/

# Augment
npx get-shit-done-cc --augment --global     # 安装到 ~/.augment/
npx get-shit-done-cc --augment --local      # 安装到 ./.augment/

# Trae
npx get-shit-done-cc --trae --global     # 安装到 ~/.trae/
npx get-shit-done-cc --trae --local      # 安装到 ./.trae/

# CodeBuddy
npx get-shit-done-cc --codebuddy --global # 安装到 ~/.codebuddy/
npx get-shit-done-cc --codebuddy --local  # 安装到 ./.codebuddy/

# Cline
npx get-shit-done-cc --cline --global       # 安装到 ~/.cline/
npx get-shit-done-cc --cline --local        # 安装到 ./.clinerules

# 所有运行时
npx get-shit-done-cc --all --global      # 安装到所有目录


# Initialize
/gsd-new-project

# Discuss
/gsd-discuss-phase 1

# Plan
/gsd-plan-phase 1

# Execute
/gsd-execute-phase 1

# Verify
/gsd-verify-work 1

# Repeat → Ship
/gsd-ship 1
/gsd-complete-milestone
/gsd-new-milestone

# Getting Started
npx get-shit-done-cc@latest
```

### Wave

```Plaintext
┌─────────────────────────────────────────────────────────────────────┐
│  PHASE EXECUTION                                                    │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  WAVE 1 (parallel)          WAVE 2 (parallel)          WAVE 3       │
│  ┌─────────┐ ┌─────────┐    ┌─────────┐ ┌─────────┐    ┌─────────┐  │
│  │ Plan 01 │ │ Plan 02 │ →  │ Plan 03 │ │ Plan 04 │ →  │ Plan 05 │  │
│  │         │ │         │    │         │ │         │    │         │  │
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
