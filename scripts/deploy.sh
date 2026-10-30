#!/usr/bin/env bash
set -euo pipefail

IMAGE_TAG="${1:-latest}"
IMAGE_NAME="yashvikothari/nexvion"

echo "[INFO] Deploying Nexvion image: ${IMAGE_NAME}:${IMAGE_TAG}"

kubectl apply -f kubernetes/namespace.yaml
kubectl apply -f kubernetes/configmap.yaml
kubectl apply -f kubernetes/deployment.yaml
kubectl apply -f kubernetes/service.yaml
kubectl apply -f kubernetes/ingress.yaml

# Update Deployment with the image built by Jenkins
kubectl set image deployment/nexvion-app \
  nexvion="${IMAGE_NAME}:${IMAGE_TAG}" \
  -n ecommerce

# Wait for deployment rollout
kubectl rollout status deployment/nexvion-app \
  -n ecommerce \
  --timeout=180s

echo "[SUCCESS] Nexvion deployment completed!"
