from fastapi import HTTPException, status

class CorporateAuthError(HTTPException):
    def __init__(self, detail: str = "Invalid or missing corporate credentials"):
        super().__init__(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail=detail,
            headers={"WWW-Authenticate": "Bearer"},
        )

class OmniAIFailure(HTTPException):
    def __init__(self, detail: str = "All AI routing models currently exhausted or offline."):
        super().__init__(
            status_code=status.HTTP_503_SERVICE_UNAVAILABLE,
            detail=detail
        )

class HFTNodeTimeout(HTTPException):
    def __init__(self, detail: str = "Monad RPC verification exceeded latency bounds."):
        super().__init__(
            status_code=status.HTTP_504_GATEWAY_TIMEOUT,
            detail=detail
        )
      
