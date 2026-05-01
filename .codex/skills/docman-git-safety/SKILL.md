---
name: docman-git-safety
description: Use when working with Git in the DocMan workspace, especially pulling the default branch, merging branches, resolving conflicts, pushing, staging selective files, or coordinating multi-agent changes. Enforces merge-only workflows and manual conflict verification.
---

# DocMan Git Safety

Use this skill before any Git operation that can alter history, merge code, resolve conflicts, or publish changes.

DocMan's current GitHub default branch is `master`. If this changes, detect the default branch with `git remote show origin` before writing commands.

## Core Rules

- Never rebase the default branch; use merge commits.
- Never run blind conflict resolution such as `git checkout --theirs .` or `git checkout --ours .`.
- Never discard user changes or unrelated workspace edits.
- Do not stage unrelated dirty files. Long-lived local platform or `.agent/` changes may exist.
- Prefer branch names with the `codex/` prefix unless the user asks otherwise.
- After merges or conflict resolution, run the best available verification and report any known baseline debt.

## Safe Pull And Branch Flow

```bash
default_branch=$(git remote show origin | sed -n 's/.*HEAD branch: //p')
git checkout "$default_branch"
git pull --no-rebase origin "$default_branch"
git checkout -b codex/<description>
```

Before merging work back:

```bash
default_branch=$(git remote show origin | sed -n 's/.*HEAD branch: //p')
git checkout "$default_branch"
git pull --no-rebase origin "$default_branch"
git merge codex/<description> --no-ff -m "Merge codex/<description>: summary"
git push origin "$default_branch"
```

If push is rejected:

```bash
default_branch=$(git remote show origin | sed -n 's/.*HEAD branch: //p')
git pull --no-rebase origin "$default_branch"
# Resolve conflicts manually.
git push origin "$default_branch"
```

## Conflict Protocol

Before resolving any conflicted file:

1. Inspect the conflict markers and surrounding code.
2. Determine ownership: if the file is in the current task's domain, merge manually.
3. If the current work did not touch the file, confirm before accepting another side.

After resolving:

```bash
rg "<<<<<<|>>>>>>|======" <resolved-file>
wc -l <resolved-file>
scripts/verify.sh
```

There must be no conflict markers and the file must not be truncated.

## Verification

Use the scripts when they exist:

```bash
scripts/codegen.sh
scripts/verify.sh
```

If `scripts/verify.sh` fails due known R3 legacy debt, also run the narrow checks relevant to the current change, for example:

```bash
flutter test
flutter analyze
```

Report commands run, whether failures are new or pre-existing, and any unrelated dirty files left untouched.
