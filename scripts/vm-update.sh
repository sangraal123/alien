#!/usr/bin/env bash
# Idempotent VM/cloud-agent startup hook. Safe when run repeatedly after each pull.
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

if [[ -f package.json ]] && command -v npm >/dev/null 2>&1; then
  if [[ -f package-lock.json ]]; then
    npm ci
  else
    npm install --no-audit --no-fund
  fi
fi

if [[ -f pyproject.toml ]] && command -v uv >/dev/null 2>&1; then
  uv sync
fi

exit 0
