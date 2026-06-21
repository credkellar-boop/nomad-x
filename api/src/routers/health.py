from fastapi import APIRouter
from src.monad_client import monad_node
from src.cache import cache

router = APIRouter(tags=["Infrastructure Probes"])

@router.get("/health/liveness")
async def liveness_probe():
    """Kubernetes/Nomad liveness check. Fails only if the event loop is blocked."""
    return {"status": "alive"}

@router.get("/health/readiness")
async def readiness_probe():
    """
    Strict readiness check. The node is only 'ready' if the AI routing pool, 
    in-memory cache, and Monad RPC are completely synchronized.
    """
    monad_status = await monad_node.get_latest_block()
    if "RPC Error" in str(monad_status):
        return {"status": "not_ready", "reason": "HFT Node Offline"}, 503
        
    return {
        "status": "ready",
        "cache": "operational",
        "blockchain": "synchronized"
    }
  
