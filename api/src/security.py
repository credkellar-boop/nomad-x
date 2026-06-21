from fastapi import Security, HTTPException, status
from fastapi.security import APIKeyHeader
from src.config import settings

api_key_header = APIKeyHeader(name="X-Corporate-Auth", auto_error=False)

async def verify_corporate_access(api_key_header: str = Security(api_key_header)):
    """
    Strict B2B API gateway authentication. 
    Rejects any unverified traffic immediately.
    """
    # Replace with dynamic Vault/DB check in production
    VALID_CORPORATE_KEYS = ["dev_omni_key_1", "prod_b2b_key_77"]
    
    if not api_key_header or api_key_header not in VALID_CORPORATE_KEYS:
        raise HTTPException(
            status_code=status.HTTP_403_FORBIDDEN,
            detail="Unauthorized. Valid corporate authentication required.",
        )
    return api_key_header
  
