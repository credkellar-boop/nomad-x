#!/usr/bin/env bash
set -e

echo "[+] Executing Zero-Downtime Deployment..."

# Re-build API to catch new Python optimizations
docker build -t nomad-x-api:latest ./api

# Push job to Nomad cluster
nomad job plan deploy/nomad-x.nomad
nomad job run deploy/nomad-x.nomad

# Monitor deployment health
nomad job status nomad-x-stack

echo "[+] Deployment successful. Traffic routing initialized."
