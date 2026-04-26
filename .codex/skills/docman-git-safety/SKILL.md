---
name: docman-git-safety
description: Use when working with Git in the DocMan workspace, especially pulling main, merging branches, resolving conflicts, pushing, or coordinating multi-agent changes. Enforces merge-only workflows and manual conflict verification.
---

# DocMan Git Safety

Use this skill before any Git operation that can alter history, merge code, resolve conflicts, or publish changes.

## Core Rules

- Never rebase `main`; use merge commits.
- Never run blind conflict resolution such as `git checkout --theirs .` or `git checkout --ours .`.
- Never discard user changes or unrelated workspace edits.
- After merges or conflict resolution, verify the Flutter project with `flutter analyze` and, when relevant, `flutter test`.

## Safe Pull And Branch Flow

```bash
git checkout main
git pull --no-rebase origin main
git checkout -b feature/<description>
```

Before merging work back:

```bash
git checkout main
git pull --no-rebase origin main
git merge feature/<description> --no-ff -m "Merge feature/<description>: summary"
git push origin main
```

If push is rejected:

```bash
git pull --no-rebase origin main
# Resolve conflicts manually.
git push origin main
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
flutter analyze
```

There must be no conflict markers and the file must not be truncated.

## Post-Merge Verification

Run:

```bash
flutter analyze
flutter test
```

For a quick sanity check after push:

```bash
head -3 lib/main.dart
head -3 lib/injection.dart
```
