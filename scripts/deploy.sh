#!/bin/bash
set -e

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "=================================================="
echo "  SME Observability Stack — Deploy"
echo "=================================================="

# 1. Start Prometheus, Loki, Tempo
echo ""
echo "[1/5] Starting Prometheus, Loki, Tempo..."
cd "$REPO_DIR"
docker compose up -d prometheus loki tempo

# 2. Verify containers are running
echo ""
echo "[2/5] Verifying containers..."
sleep 5
docker compose ps

# 3. Copy Grafana provisioning files (prefixed to avoid overwriting other teams)
echo ""
echo "[3/5] Copying Grafana provisioning files..."
sudo cp "$REPO_DIR/grafana/provisioning/datasources/datasources.yml" \
    /etc/grafana/provisioning/datasources/sme-datasources.yml
sudo cp "$REPO_DIR/grafana/provisioning/dashboards/dashboards.yml" \
    /etc/grafana/provisioning/dashboards/sme-dashboards.yml

# 4. Create dashboard directories and copy JSON files
echo ""
echo "[4/5] Setting up dashboard directories..."
sudo mkdir -p /etc/grafana/dashboards/sre
sudo mkdir -p /etc/grafana/dashboards/doramonitoring
sudo mkdir -p /etc/grafana/dashboards/doitcostmap

sudo cp -r "$REPO_DIR/grafana/dashboards/sre/." /etc/grafana/dashboards/sre/ 2>/dev/null || true
sudo cp -r "$REPO_DIR/grafana/dashboards/doramonitoring/." /etc/grafana/dashboards/doramonitoring/ 2>/dev/null || true
sudo cp -r "$REPO_DIR/grafana/dashboards/doitcostmap/." /etc/grafana/dashboards/doitcostmap/ 2>/dev/null || true

# 5. Restart Grafana to load new provisioning
echo ""
echo "[5/5] Restarting Grafana..."
sudo systemctl restart grafana-server
sleep 3
sudo systemctl status grafana-server --no-pager | head -5

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
