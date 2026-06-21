from pydantic import BaseModel, Field
from datetime import datetime

class TranslationRequest(BaseModel):
    text: str = Field(..., min_length=1, description="Source text to process")
    target_language: str = Field(..., description="Target localization")
    priority: bool = Field(default=False, description="Flag for high-frequency routing")

class TranslationResponse(BaseModel):
    transaction_id: str
    timestamp: datetime
    original: str
    translated: str
    engine_used: str
    latency_ms: float
  
