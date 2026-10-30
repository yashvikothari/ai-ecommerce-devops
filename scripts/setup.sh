#!/usr/bin/env bash
set -euo pipefail
echo "[INFO] Verifying DevOps environment setup..."
for cmd in git docker kubectl helm terraform ansible trivy gitleaks jenkins; do
  command -v "$cmd" >/dev/null 2>&1 && echo "[OK] $cmd is installed" || echo "[MISSING] $cmd"
done
