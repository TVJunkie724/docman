#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

LEGACY_ISAR_OUTPUT="lib/data/local/isar_collections.g.dart"
LEGACY_ISAR_BACKUP=""

restore_legacy_isar_output() {
  if [[ -n "$LEGACY_ISAR_BACKUP" && -f "$LEGACY_ISAR_BACKUP" ]]; then
    if [[ ! -f "$LEGACY_ISAR_OUTPUT" ]]; then
      echo "==> Restoring legacy Isar generated output"
      cp "$LEGACY_ISAR_BACKUP" "$LEGACY_ISAR_OUTPUT"
    fi

    rm -f "$LEGACY_ISAR_BACKUP"
  fi
}

trap restore_legacy_isar_output EXIT

if [[ -f "$LEGACY_ISAR_OUTPUT" ]]; then
  LEGACY_ISAR_BACKUP="$(mktemp)"
  cp "$LEGACY_ISAR_OUTPUT" "$LEGACY_ISAR_BACKUP"
fi

echo "==> Generating Dart sources"
dart run build_runner build
