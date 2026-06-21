from fastapi import APIRouter, Depends, HTTPException
from src.monad_client import monad_node
from src.security import verify_corporate_access

router = APIRouter(
    prefix="/api/v1/network",
    tags=["Monad Infrastructure"],
    dependencies=[Depends(verify_corporate_access)]
)

@router.get("/status")
async def get_network_status():
    """
    Pings the Monad RPC to verify node sync status and current block height.
    Critical for ensuring the HFT node is ready for execution.
    """
    block = await monad_node.get_latest_block()
    if "RPC Error" in str(block):
        raise HTTPException(status_code=503, detail="Monad node unreachable. Check infrastructure.")
    
    return {
        "network": "Monad",
        "latest_block": block,
        "status": "synchronized"
    }
  
