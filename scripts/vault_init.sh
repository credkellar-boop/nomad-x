#!/usr/bin/env bash
set -e

echo "[+] Initializing HashiCorp Vault for Omni-AI Keys..."

# Authenticate with Vault (assumes VAULT_ADDR and VAULT_TOKEN are set)
vault login $VAULT_TOKEN > /dev/null

echo "[+] Injecting Multi-Model API credentials into secure storage..."

vault kv put secret/data/nomad-x/production/omni-keys \
    gemini_key=$GEMINI_PROD_KEY \
    openai_key=$OPENAI_PROD_KEY \
    anthropic_key=$ANTHROPIC_PROD_KEY \
    xai_key=$XAI_PROD_KEY

echo "[+] Injecting corporate treasury parameters..."

vault kv put secret/data/nomad-x/corporate/monad \
    rpc_url="https://rpc.monad.xyz" \
    wallet_address=$CORP_TREASURY_ADDRESS

echo "[+] Vault configuration locked."
