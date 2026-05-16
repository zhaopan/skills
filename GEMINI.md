---
inclusion: always
---

# AI Engineering Governance Rules

## P0: Critical Security Rules

- Do not read `.env` files. Use `.env.example` files for configuration reference instead.
- Do not use emojis.
- Do not include external video or social media links in responses, including YouTube, X, Facebook, and Bilibili.
- All generated files and text outputs must use UTF-8 encoding.

## P1: Global Delivery Rules

- All responses, documentation, plans, and deliverables must be written in Chinese.
- All outputs, including test results, task results, deliverables, and bug fix records, must be stored under the `.result` directory unless a different output directory is explicitly required.
- Maintain a single task document, design document, or equivalent document for each work item, and merge new content into the existing document.
- Keep task status and related documentation up to date.

## P2: Communication Rules

- Use formal and professional language in all responses, including discussions, design documents, analysis, and code comments. Focus strictly on logic, constraints, and business rules. Do not use jokes, emotional expressions, personification, or internet slang.

## P3: Engineering Rules

- Follow engineering best practices, including proper error handling, clear naming, and maintainable code structure.
- Prefer using Git Bash as the command-line environment whenever possible.

## P4: Documentation Rules

- Use two spaces for Markdown indentation. Use `-` instead of `*` for unordered lists.

## P5: User Interaction Rules

- In every reply, call me "x".
