---
name: adapt-agent-configs
description: Auto-detects and adapts configs from Gemini CLI (.agents), Kiro CLI (.kiro), and Copilot CLI (.copilot). Use when starting a session or when you need to translate workflows from these tools.
---

# Adapting Agent CLI Configs to Claude Code

## Auto-Detection

On session start, check for these config directories:

```
~/.agents/       → Gemini CLI agent configs
~/.kiro/         → Kiro CLI configs
~/.copilot/      → Copilot CLI configs
```

## Config File Mapping

| CLI | Config Location | Claude Code Equivalent |
|-----|-----------------|------------------------|
| Gemini CLI | `~/.agents/*.md`, `~/.agents/*.yaml` | System prompt / instructions |
| Kiro CLI | `~/.kiro/*.json`, `~/.kiro/*.md` | Settings / workspace config |
| Copilot CLI | `~/.copilot/*.json`, `~/.copilot/system.md` | Instructions / context |

## Auto-Adaptation Process

### 1. Detect Existing Configs
```
IF ~/.agents/ EXISTS:
  → Read all .md and .yaml files
  → Extract Gemini-specific commands/instructions
  → Map to Claude Code patterns

IF ~/.kiro/ EXISTS:
  → Read all .json and .md files
  → Extract Kiro-specific workflows
  → Map to Claude Code tools/skills

IF ~/.copilot/ EXISTS:
  → Read all .json and system.md files
  → Extract Copilot slash commands
  → Map to Claude Code skills
```

### 2. Gemini CLI (.agents) Adaptation

Gemini CLI stores agent configs in `~/.agents/`:
- **Commands**: `chat`, `generate`, `file analyze`, `session`
- **Tools**: file read, bash, web search
- **Adaptation**:
  - `gemini chat` → Claude interactive mode (`claude`)
  - `gemini generate` → `--print` flag
  - `gemini file analyze` → `Read` tool + prompt
  - Session management → Claude context (no IDs needed)

### 3. Kiro CLI (.kiro) Adaptation

Kiro CLI stores configs in `~/.kiro/`:
- **Commands**: `chat`, `complete`, `edit`, `diff`, `commit`, `review`
- **Adaptation**:
  - `kiro chat` → Claude interactive mode
  - `kiro complete` → `--print` flag
  - `kiro edit` → `Read` + `Edit` tools
  - `kiro review` → `code-review-and-quality` skill

### 4. Copilot CLI (.copilot) Adaptation

Copilot CLI stores configs in `~/.copilot/`:
- **Slash Commands**: `/explain`, `/test`, `/refactor`, `/fix`, `/complete`
- **Adaptation**:
  - `/test` → `test-driven-development` skill
  - `/refactor` → `code-simplification` skill
  - `/fix` → `debugging-and-error-recovery` skill
  - `/explain` → Read file + prompt explanation
  - `copilot suggest` → `claude --print`

## Workflow Integration

When you detect any of these directories:

1. **Read the config files** with full content
2. **Extract workflow patterns** (commands, instructions, prompts)
3. **Translate to Claude Code equivalents**
4. **Apply the translated patterns** to current session

## Example Detection Sequence

```
Session Start
    │
    ├── Check ~/.agents/  → Found agent.yaml → Adapt Gemini workflows
    ├── Check ~/.kiro/    → Found config.json → Adapt Kiro workflows
    └── Check ~/.copilot/ → Found system.md → Adapt Copilot workflows
```

## Key Mappings Summary

| Gemini | Kiro | Copilot | Claude Code |
|--------|------|---------|-------------|
| `gemini chat` | `kiro chat` | `copilot chat` | `claude` |
| `gemini generate` | `kiro complete` | `/complete` | `--print` |
| `gemini file analyze` | `kiro edit` | `--file` flag | `Read` + prompt |
| Session management | `kiro diff/commit` | `/explain` | Context / `git` / skills |

## Anti-Patterns

- Do NOT mix CLI-specific prefixes (gemini, kiro, copilot)
- Do NOT manually manage sessions - Claude handles context
- Always use Read tool before working with files
- Prefer skills over ad-hoc commands
