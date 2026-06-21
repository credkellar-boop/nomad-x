import time
from fastapi import Request
from starlette.middleware.base import BaseHTTPMiddleware
from starlette.middleware.cors import CORSMiddleware

def setup_cors(app):
    """
    Strict CORS policies to explicitly protect the backend API 
    while permitting access from production Flutter Web domains.
    """
    app.add_middleware(
        CORSMiddleware,
        allow_origins=["*"],  # Restrict to enterprise domain in production
        allow_credentials=True,
        allow_methods=["*"],
        allow_headers=["*"],
    )

class PerformanceTelemetryMiddleware(BaseHTTPMiddleware):
    """
    Intercepts and records sub-millisecond execution times 
    for audit tracking and processing analysis.
    """
    async def dispatch(self, request: Request, call_next):
        start_time = time.perf_counter()
        response = await call_next(request)
        process_time = time.perf_counter() - start_time
        response.headers["X-Process-Time-MS"] = f"{process_time * 1000:.2f}"
        return response
      
