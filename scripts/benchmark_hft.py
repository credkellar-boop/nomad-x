#!/usr/bin/env python3
import asyncio
import httpx
import time
import os

# Stress-testing script to validate RPC latency before pushing Nomad-X live.
RPC_URL = os.getenv("MONAD_RPC_URL", "https://rpc.monad.xyz")
REQUESTS = 1000

async def fetch_block(client):
    payload = {"jsonrpc": "2.0", "method": "eth_blockNumber", "params": [], "id": 1}
    start = time.perf_counter()
    response = await client.post(RPC_URL, json=payload)
    latency = time.perf_counter() - start
    return response.status_code == 200, latency

async def main():
    print(f"[!] Initiating High-Frequency Benchmark to {RPC_URL}...")
    async with httpx.AsyncClient(limits=httpx.Limits(max_connections=500)) as client:
        tasks = [fetch_block(client) for _ in range(REQUESTS)]
        results = await asyncio.gather(*tasks)
    
    successes = sum(1 for r in results if r[0])
    avg_latency = sum(r[1] for r in results) / REQUESTS
    
    print(f"[*] Benchmark Complete.")
    print(f"[*] Success Rate: {successes}/{REQUESTS}")
    print(f"[*] Average Latency: {avg_latency * 1000:.2f} ms")
    
    if avg_latency > 0.1:
        print("[WARNING] Latency exceeds 100ms. Check node proximity or connection quality.")

if __name__ == "__main__":
    asyncio.run(main())
  
