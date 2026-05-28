#!/bin/bash
set -e

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "=================================================="
echo "  SME Observability Stack — Deploy"
echo "=================================================="

cd "$REPO_DIR"

echo ""
echo "[1/2] Setting data directory permissions..."
sudo mkdir -p /data/prometheus /data/loki /data/tempo /data/grafana
sudo chown -R 65534:65534 /data/prometheus
sudo chown -R 10001:10001 /data/loki
sudo chown -R 10001:10001 /data/tempo
sudo chown -R 472:472 /data/grafana

echo ""
echo "[2/2] Starting all services..."
docker compose up -d

echo ""
echo "[3/3] Verifying containers..."
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
