# Nomad-X Security & Access Protocol

## 1. Network Boundary
* All traffic must pass through the API Gateway.
* `CORS` is strictly limited to authenticated corporate domains.
* Sub-millisecond latency is tracked via `PerformanceTelemetryMiddleware`.

## 2. Secrets Management
* HashiCorp Vault is the single source of truth for Omni-AI keys (Gemini, ChatGPT, Claude, Grok).
* Environment files (`.env`) are explicitly banned in the production build pipeline. Nomad injects secrets dynamically via Vault templating.

## 3. Blockchain Integrity
* Smart contract verifications to the Monad network are isolated in `monad_client.py`.
* Private keys are *never* stored in application memory. Transactions must be signed externally by the hardware quantum control unit (QCU) or secured corporate vault.
* 
