---
name: git-safety
description: Use for [PROJECT_NAME] Git operations, especially pull, merge, conflict resolution, staging, committing, pushing, and coordinating multi-agent changes.
---

# [PROJECT_NAME] Git Safety

Default branch: `[DEFAULT_BRANCH]`.

## Rules

- Never rebase the default branch.
- Never discard user changes.
- Never run blind conflict resolution.
- Stage only files related to the current task.
- Inspect conflicts manually.
- Run the best available verification before reporting completion.

## Safe Flow

```bash
git status --short --branch
git pull --no-rebase origin [DEFAULT_BRANCH]
git status --short --branch
```

## Conflict Protocol

1. Inspect conflict markers and surrounding code.
2. Resolve manually.
3. Verify no markers remain.
4. Run targeted checks or full verify.

```bash
rg "<<<<<<|>>>>>>|======"
scripts/verify.sh
```

## Reporting

Report:

- branch state.
- files staged/committed.
- verification commands and results.
- uncommitted unrelated changes left untouched.
