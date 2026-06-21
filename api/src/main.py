from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from src.translator import process_translation

app = FastAPI(
    title="Nomad-X Backend Engine",
    description="High-throughput API for the Nomad-X system",
    version="1.0.0"
)

class TranslationRequest(BaseModel):
    text: str
    target_language: str

class TranslationResponse(BaseModel):
    original: str
    translated: str
    engine: str

@app.get("/health")
async def health_check():
    return {"status": "operational", "system": "Nomad-X"}

@app.post("/api/v1/translate", response_model=TranslationResponse)
async def translate(request: TranslationRequest):
    try:
        result = await process_translation(request.text, request.target_language)
        return TranslationResponse(
            original=request.text,
            translated=result["text"],
            engine=result["engine"]
        )
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
      
