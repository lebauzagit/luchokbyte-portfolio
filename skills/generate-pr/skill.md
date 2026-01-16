---
Name: generate-pr
Description: Prepares a branch, commit, and draft PR summary from local changes.
Trigger: "create pr" | "generate pr" | "open pull request" | "create pull request"
Scope: Root
Tools: bash, read, write, git
---

# generate-pr

Use this skill to prepare a draft PR description and checklist.

Constraints:
- Do not push or merge without explicit approval.
- Do not run deployment scripts.

Checklist:
- Summarize changes.
- Propose branch name and commit message.
- Include a short PR description and checklist.
