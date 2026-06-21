import httpx
from src.config import settings

class MonadNetworkClient:
    """
    Handles high-throughput state verifications and smart contract interactions 
    on the Monad network. Built for sub-second latency.
    """
    def __init__(self):
        self.rpc_url = settings.monad_rpc_url
        self.client = httpx.AsyncClient()

    async def get_latest_block(self):
        payload = {
            "jsonrpc": "2.0",
            "method": "eth_blockNumber",
            "params": [],
            "id": 1
        }
        try:
            response = await self.client.post(self.rpc_url, json=payload)
            response.raise_for_status()
            return response.json().get("result")
        except Exception as e:
            return f"RPC Error: {str(e)}"

monad_node = MonadNetworkClient()
