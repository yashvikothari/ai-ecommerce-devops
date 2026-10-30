#!/usr/bin/env bash
set -euo pipefail
echo "[INFO] Pruning unused Docker images and old build artifacts..."
docker image prune -af --filter "until=24h"
sudo journalctl --vacuum-time=3d
echo "[OK] Cleanup completed."
