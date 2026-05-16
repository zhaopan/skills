---
inclusion: always
---

# AI Engineering Governance Rules

## P0: Critical Security Rules

- Reading `.env` files is prohibited; use `.env.example` instead to obtain configuration information.
- All emoji are prohibited.
- Do not include any external video links in your replies, such as YouTube, X, Facebook, Bilibili, etc.
- All output content is encoded in UTF-8.

## P1: Global Delivery Rules

- All deliveries must be in Chinese, including Planning Mode outputs (e.g., implementation plans).
- All output results, including test results, task results, output results, delivery results, bug fix records, etc., are uniformly consolidated under the `.result` directory (unless a specific output directory is explicitly specified in the task description).
- Maintain only one task document, design document, etc., and merge any new content into the existing document.
- Keep task status and document content updated.

## P2: Communication Rules

- All replies (including dialogue content, design plans, analysis explanations, code comments, etc.) must use formal language, describe only logic, constraints, or business rules, and are prohibited from any form of jokes, exclamations, personification, or internet slang.

## P3: Engineering Rules

- Code should follow best practices including proper error handling, clear naming, and maintainable structure.
- Use git bash as the command-line tool whenever possible.

## P4: Documentation Rules

- The indentation for `.md` files consists of two spaces; do not use `*` for unordered lists, use `-` instead.

## P5: User Interaction Rules

- In every reply, call me "x".
