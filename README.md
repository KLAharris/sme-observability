# sme-observability

Observability stack for SME platform — Prometheus, Loki, Tempo, Grafana.

## Stack
- **Prometheus** — metrics collection (port 9090)
- **Loki** — log aggregation (port 3100)
- **Tempo** — distributed tracing (port 3200)
- **Grafana** — dashboards & visualization (managed separately)

## Setup

### 1. Clone the repo
```bash
git clone https://github.com/KLAharris/sme-observability
cd sme-observability
```

### 2. Deploy the stack
```bash
bash scripts/deploy.sh
```

### 3. Access
- Grafana: https://grafana.devops-platform.ibotnoi.com
- Prometheus: http://18.143.253.170:9090 (VPC only)
- Loki: http://18.143.253.170:3100 (VPC only)
- Tempo: http://18.143.253.170:3200 (VPC only)

## Structure
- `prometheus/` — Prometheus config & alert rules
- `loki/` — Loki config
- `tempo/` — Tempo config
- `grafana/` — Grafana provisioning (datasources & dashboards)
- `scripts/` — deploy script

