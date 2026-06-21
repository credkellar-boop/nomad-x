# Nomad-X System Documentation

Nomad-X is a cross-device, high-performance workspace and translation engine. Built for ruthless business efficiency, it features a Flutter-based unified UI, a scalable FastAPI backend, and robust infrastructure orchestration via HashiCorp Nomad.

## Architecture
* **Frontend:** Flutter/Dart (Web, Desktop, Mobile)
* **Backend:** Python/FastAPI (Engineered for multi-model AI routing)
* **Infrastructure:** HashiCorp Nomad, Docker

## Deployment
Deploy the entire stack to your Nomad cluster:
```bash
nomad job run deploy/nomad-x.nomad
