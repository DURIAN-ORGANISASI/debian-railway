#!/usr/bin/env bash
set -Eeuo pipefail

: "${TERMINAL_USER:?Set TERMINAL_USER in Railway Variables}"
: "${TERMINAL_PASSWORD:?Set TERMINAL_PASSWORD in Railway Variables}"

if [[ "${TERMINAL_USER}" == *:* ]]; then
  echo "ERROR: TERMINAL_USER must not contain a colon (:)." >&2
  exit 1
fi

if [[ ${#TERMINAL_PASSWORD} -lt 16 ]]; then
  echo "ERROR: TERMINAL_PASSWORD must be at least 16 characters." >&2
  exit 1
fi

PORT="${PORT:-8080}"
export TZ="${TZ:-Asia/Jakarta}"
mkdir -p /data
cd /data

echo "Starting authenticated Debian web terminal on port ${PORT}."
exec /usr/local/bin/ttyd \
  --port "${PORT}" \
  --credential "${TERMINAL_USER}:${TERMINAL_PASSWORD}" \
  --writable \
  --cwd /data \
  bash --login
