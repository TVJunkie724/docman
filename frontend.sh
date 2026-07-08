#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$ROOT_DIR"

DEFAULT_DEVICE="${MAPPM_DEVICE:-macos}"

usage() {
  cat <<'USAGE'
Usage:
  ./frontend.sh <command> [options]

Commands:
  doctor                 Print local frontend environment status.
  setup                  Install dependencies and run code generation.
  setup --verify         Install dependencies, run code generation and verify.
  codegen                Run generated Dart source build.
  verify                 Run format, analyzer and tests.
  analyze                Run Flutter analyzer.
  test                   Run Flutter tests.
  mocks                  Start or refresh project mock services.
  run [--device DEVICE]  Run the Flutter app.
  help                   Show this help.

Environment:
  MAPPM_DEVICE           Default Flutter device for run. Default: macos.

Rules:
  - This script owns the project-local frontend entrypoint only.
  - Backend services, contract mocks and cloud infrastructure remain separate
    owner boundaries unless this script delegates to a documented script.
  - Secrets must never be printed or committed by this entrypoint.
USAGE
}

fail() {
  echo "ERROR: $*" >&2
  exit 2
}

require_file() {
  [ -f "$1" ] || fail "Missing required file: $1"
}

require_executable_script() {
  [ -f "$1" ] || fail "Missing required script: $1"
  [ -x "$1" ] || fail "Script is not executable: $1"
}

command_exists() {
  command -v "$1" >/dev/null 2>&1
}

doctor() {
  echo "==> Mappm frontend doctor"
  echo "root: $ROOT_DIR"
  require_file "$ROOT_DIR/pubspec.yaml"
  require_file "$ROOT_DIR/analysis_options.yaml"
  require_executable_script "$ROOT_DIR/scripts/bootstrap.sh"
  require_executable_script "$ROOT_DIR/scripts/codegen.sh"
  require_executable_script "$ROOT_DIR/scripts/verify.sh"

  if command_exists flutter; then
    flutter --version | sed -n '1,3p'
  else
    echo "flutter: missing"
  fi

  if command_exists dart; then
    dart --version
  else
    echo "dart: missing"
  fi
}

run_app() {
  local device="$DEFAULT_DEVICE"
  local args=()

  while [ "$#" -gt 0 ]; do
    case "$1" in
      --device)
        [ "$#" -ge 2 ] || fail "--device requires a value."
        device="$2"
        shift 2
        ;;
      --)
        shift
        args=("$@")
        break
        ;;
      *)
        args+=("$1")
        shift
        ;;
    esac
  done

  command_exists flutter || fail "flutter is not on PATH."
  exec flutter run -d "$device" "${args[@]}"
}

command_name="${1:-help}"
shift || true

case "$command_name" in
  doctor)
    doctor
    ;;
  setup|bootstrap)
    "$ROOT_DIR/scripts/bootstrap.sh" "$@"
    ;;
  codegen)
    "$ROOT_DIR/scripts/codegen.sh" "$@"
    ;;
  verify)
    "$ROOT_DIR/scripts/verify.sh" "$@"
    ;;
  analyze)
    command_exists flutter || fail "flutter is not on PATH."
    flutter analyze "$@"
    ;;
  test)
    command_exists flutter || fail "flutter is not on PATH."
    flutter test "$@"
    ;;
  mocks|mock)
    require_executable_script "$ROOT_DIR/scripts/run_mocks.sh"
    "$ROOT_DIR/scripts/run_mocks.sh" "$@"
    ;;
  run)
    run_app "$@"
    ;;
  help|-h|--help)
    usage
    ;;
  *)
    usage
    fail "Unknown command: $command_name"
    ;;
esac
