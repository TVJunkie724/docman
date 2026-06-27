#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

echo "==> Checking Dart formatting"
dart format --output=none --set-exit-if-changed lib test

echo "==> Running Flutter analyzer"
flutter analyze

echo "==> Running Flutter tests"
flutter test
