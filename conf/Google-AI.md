# Google-AI

## 权限设定

### GEMINI CLI

.gemini\settings.json

```json
  "tools": {
    "core": [
      "run_shell_command(git add)",
      "run_shell_command(git diff)",
      "run_shell_command(git commit)",
      "run_shell_command(git status)",
      "run_shell_command(git log)",
      "run_shell_command(python)",
      "run_shell_command(cat)",
      "run_shell_command(echo)",
      "run_shell_command(ls)"
    ],
    "exclude": [
      "run_shell_command(rm)",
      "run_shell_command(sudo)",
      "run_shell_command(Remove-Item)"
    ]
  }
```

### Antigravity

User Setting

```yaml
"Permissions":
  {
    "Always Allow":
      [
        "command(git add)",
        "command(git diff)",
        "command(git commit)",
        "command(git status)",
        "command(git log)",
        "command(python)",
        "command(cat)",
        "command(echo)",
        "command(ls)",
      ],
    "Always Deny": ["command(rm)", "command(sudo)", "command(Remove-Item)", "read_file(.env)"],
    "Always Ask": [],
  }
```

在 Google Antigravity 中，确实存在命令和资源的**允许清单（Allow list）**、**拒绝清单（Deny list）**以及**询问清单（Ask list）**。

这些清单构成了 Antigravity 的多层安全与权限控制系统（Agent Permissions），用于规范智能体（Agent）在终端执行命令、读写文件、访问网络或调用 MCP（Model Context Protocol）工具时的自主权。

---

## 权限清单的三种类型

Antigravity 将智能体的所有操作资源分为以下三类：

- **Allow（允许清单）**：放入此清单的命令或操作会自动批准执行，智能体运行时不会弹出提示。
- **Deny（拒绝清单）**：放入此清单的命令或操作会被立即拦截并阻止执行。
- **Ask（询问清单）**：智能体在执行此类操作前会暂停，并等待人工审批。

---

## 资源字符串格式

每一条清单条目的配置都遵循统一的格式：`action(target)`。其中 `action` 代表操作类型，`target` 代表匹配的模式或前缀。

### 支持的操作类型与匹配规则

| 操作类型 (`action`) | 目标格式 (`target`)                 | 匹配逻辑说明                                                                            |
| ------------------- | ----------------------------------- | --------------------------------------------------------------------------------------- |
| **`command`**       | `command(prefix)` 或 `command(*)`   | 按前缀匹配终端命令。例如 `command(git)` 可匹配 `git add`、`git commit` 等。             |
| **`read_file`**     | `read_file(/path)`                  | 匹配特定文件或该目录下的所有内容。路径必须为绝对路径，不支持通配符（如 `*.go`）或 `~`。 |
| **`write_file`**    | `write_file(/path)`                 | 与 `read_file` 规则一致。配置此项会隐式包含对该路径的 `read_file` 权限。                |
| **`read_url`**      | `read_url(domain)` 或 `read_url(*)` | 匹配特定域名及其所有子域名，不匹配具体的 URL 路径。                                     |
| **`mcp`**           | `mcp(server/tool)` 或 `mcp(*)`      | 按精确的 MCP 服务名称或工具名称进行匹配。                                               |

---

## 配置示例

### 1. 允许清单 (Allow List) —— 自动运行无需提示

```text
command(git)            # 允许执行任何 git 命令
command(npm run build)  # 允许执行具体的构建命令
read_file(/home/user/project)      # 允许读取该项目目录下的所有文件
write_file(/home/user/project/src) # 允许修改 src 目录下的文件
read_url(example.com)   # 允许访问该域名的公开网页
mcp(workspace/*)        # 允许调用工作区的所有 MCP 工具

```

### 2. 拒绝清单 (Deny List) —— 永久拦截

```text
command(rm)             # 禁止执行任何 rm 删除命令
command(sudo)           # 禁止使用 sudo 提权
write_file(/home/user/.ssh) # 禁止修改 .ssh 目录下的文件

```

### 3. 询问清单 (Ask List) —— 每次执行均需确认

```text
command(*)              # 执行任何未在 Allow/Deny 中的命令时均需提示
mcp(*)                  # 调用任何未知 MCP 工具时均需提示

```

---

## 全局与工作区配置路径

这些规则可以根据作用域保存在不同的配置文件中：

- **全局规则路径**：`~/.gemini/GEMINI.md`
- **工作区规则路径**：`your-workspace/.agents/rules/`
