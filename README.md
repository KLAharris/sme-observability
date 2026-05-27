# sme-observability

Observability stack for SME platform — Prometheus, Loki, Tempo, Grafana.

## Stack
- **Prometheus** — metrics collection (port 9090)
- **Loki** — log aggregation (port 3100)
- **Tempo** — distributed tracing (port 3200)
- **Grafana** — dashboards & visualization (port 3000)

## Setup

### 1. Clone the repo
git clone https://github.com/KLAharris/sme-observability
cd sme-observability

### 2. Start the stack
docker compose up -d

### 3. Access
- Grafana: http://18.143.253.170:3000
- Prometheus: http://18.143.253.170:9090
- Loki: http://18.143.253.170:3100
- Tempo: http://18.143.253.170:3200

## Structure
- prometheus/ — Prometheus config & alert rules
- loki/ — Loki config
- tempo/ — Tempo config
- grafana/ — Grafana provisioning (dashboards & datasources)

## Maintainer
Kla — DevOps Trainee @ Botnoi# sme-observability
