#!/usr/bin/env bash
set -euo pipefail
BACKUP_DIR="/var/backups/nexvion/$(date +%F_%H-%M)"
sudo mkdir -p "$BACKUP_DIR"
kubectl get all,cm,secret,ing -n ecommerce -o yaml | sudo tee "$BACKUP_DIR/k8s-state.yaml" > /dev/null
sudo tar -czf "$BACKUP_DIR/app-config.tar.gz" docker/ kubernetes/ helm/
echo "[OK] Backup stored at $BACKUP_DIR"
