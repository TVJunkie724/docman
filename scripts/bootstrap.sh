#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

RUN_VERIFY=0

if [[ "${1:-}" == "--verify" ]]; then
  RUN_VERIFY=1
fi

echo "==> Installing Flutter dependencies"
flutter pub get

echo "==> Running code generation"
"$ROOT_DIR/scripts/codegen.sh"

if [[ "$RUN_VERIFY" == "1" ]]; then
  echo "==> Running local verification"
  "$ROOT_DIR/scripts/verify.sh"
else
  echo "==> Skipping verification; run scripts/verify.sh when you want the strict local gate"
fi

echo "==> DocMan bootstrap complete"
