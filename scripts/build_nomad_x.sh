#!/usr/bin/env bash
set -e

echo "[+] Initiating Nomad-X Build Sequence..."

# 1. Build Backend API Image
echo "[+] Building API Docker Image..."
cd api
docker build -t nomad-x-api:latest .
cd ..

# 2. Compile Flutter Web/Desktop Client
echo "[+] Compiling Flutter Client..."
cd app
flutter clean
flutter pub get
flutter build web --release
cd ..

echo "[+] Build Complete. Ready for Nomad dispatch."
