#!/usr/bin/env bash
set -euo pipefail
IMAGE_TAG="${1:-latest}"
echo "[INFO] Deploying Nexvion with tag: $IMAGE_TAG to Kubernetes..."
kubectl apply -f kubernetes/namespace.yaml
kubectl apply -f kubernetes/configmap.yaml
kubectl apply -f kubernetes/deployment.yaml
kubectl apply -f kubernetes/service.yaml
kubectl apply -f kubernetes/ingress.yaml
kubectl rollout status deployment/nexvion-app -n ecommerce --timeout=120s
