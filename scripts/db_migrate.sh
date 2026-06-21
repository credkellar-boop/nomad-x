#!/usr/bin/env bash
set -e

echo "[+] Initiating Enterprise Ledger Migration..."

cd api

# Ensure alembic is installed in the environment
if ! command -v alembic &> /dev/null; then
    echo "[!] Alembic not found. Exiting."
    exit 1
fi

# Generate auto-migration script based on SQLAlchemy models
alembic revision --autogenerate -m "auto_schema_update"

# Apply changes to the PostgreSQL instance
alembic upgrade head

echo "[+] Ledger schema successfully synchronized."
