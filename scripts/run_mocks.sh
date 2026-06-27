#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

DEVICE="${1:-macos}"
if [[ $# -gt 0 ]]; then
  shift
fi

flutter run -d "$DEVICE" -t lib/main_mock_catalog.dart "$@"
