from fastapi import APIRouter, Depends, BackgroundTasks
from pydantic import BaseModel
from typing import List
from src.security import verify_corporate_access
from src.tasks import process_bulk_translation_payload

router = APIRouter(
    prefix="/api/v1/workload",
    tags=["Batch Operations"],
    dependencies=[Depends(verify_corporate_access)]
)

class BulkTranslationRequest(BaseModel):
    batch_id: str
    target_language: str
    items: List[dict]

@router.post("/dispatch")
async def dispatch_bulk_workload(
    request: BulkTranslationRequest, 
    background_tasks: BackgroundTasks
):
    """
    Ingests large B2B payloads and immediately returns a 202 Accepted.
    Processing is offloaded to the async task queue.
    """
    background_tasks.add_task(
        process_bulk_translation_payload, 
        request.items, 
        request.target_language
    )
    
    return {
        "status": "queued",
        "batch_id": request.batch_id,
        "message": f"Dispatched {len(request.items)} items for asynchronous execution."
    }
  
