#!/bin/bash
set -e

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "=================================================="
echo "  SME Observability Stack — Deploy"
echo "=================================================="

cd "$REPO_DIR"

echo ""
echo "[1/2] Starting all services..."
docker compose up -d

echo ""
echo "[2/2] Verifying containers..."
sleep 5
docker compose ps

echo ""
echo "=================================================="
echo "  Deployment complete!"
echo "=================================================="
echo ""
echo "  Prometheus : http://18.143.253.170:9090"
echo "  Loki       : http://18.143.253.170:3100"
echo "  Tempo      : http://18.143.253.170:3200"
echo "  Grafana    : https://grafana.devops-platform.ibotnoi.com"
echo ""
