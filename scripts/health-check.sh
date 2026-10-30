#!/usr/bin/env bash
set -euo pipefail
APP_URL="${1:-http://localhost:30080}"
STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$APP_URL" || true)
if [ "$STATUS" -eq 200 ]; then
  echo "[HEALTHY] Application responded with HTTP $STATUS"
  exit 0
else
  echo "[UNHEALTHY] Application responded with HTTP $STATUS"
  exit 1
fi
